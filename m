Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E83C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7bQiXOBo4hegeGfRbX8q3b0dEAuKlwZfE8kZH/TFSY=; b=jVYXi2udB7AXkXAwD4J8gKgGej
	VB3lSmFs5pb7AR57ZBDaTb8TGYBwVVqviPhQbTb7cg8H81wM/ggs8HCD7bEpcXorFyABCWJFeprbo
	Ezplyv1jK3kuunBp7d9MrDjDcta41W3IqW39CP4CvKenvoS4rOpK1aJWnts9axitQdxabbFHnCROG
	JaKhNZ8GCKZFdGR8NAceehEF29kMwp6qrY5UDwFUG2uNHToCVPr21Civa8IZ9gdayzF7nOO7D2YVi
	4P4MxLIJKu0CzM+75F2gldtivCFvxDnk71Ij9V4/Ic13DcNiN0HHVD1rnAgKw/4xe59zD7hFAF6du
	J2SU+0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctZv-0000000DXx4-42af;
	Fri, 18 Jul 2025 22:29:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctO3-0000000DX6l-1JrN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 046FA45F69;
	Fri, 18 Jul 2025 22:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E66AC4CEEB;
	Fri, 18 Jul 2025 22:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752877022;
	bh=HuRh6CJ6lDfRc3S6heFYqYDheIESwPc+QBbxZ2wepx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZcxoM0Y0et8m1+EU8iPbE8fKxBzlvvfyPTWJh1ZAxEE3t7WLycG4PdwSR0q76tuJc
	 eu1Zv0/eheXbJjVeJuCSogpuET7uQmMCboA3NamtvpkEZSxZ4A6em3nHgO/3dnSGwH
	 tN0W+73XV1rFgSbu1TtUNKPUx8D2D5MmTNit5FSnyOsFt2864MDYMBwV4U1NNFbe/7
	 P61D3MlbAR4OUtYzu/7eFK62sAMRoZGpBZJAhfVgeqv1n8XtBBnIZ16UECqHPd4I/T
	 YZbFZkaO/Wqf7/ndKmDtPZ6myQSvRW90KIg4MtA9ElxOku/D2dpbm25gMfq7kvOY2C
	 bgz8cr6K+eSMg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 18 Jul 2025 23:14:52 +0100
Subject: [PATCH 3/3] kselftest/arm64: Handle attempts to disable SM on SME
 only systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-arm64-fp-ptrace-sme-only-v1-3-3b96dd19a503@kernel.org>
References: <20250718-arm64-fp-ptrace-sme-only-v1-0-3b96dd19a503@kernel.org>
In-Reply-To: <20250718-arm64-fp-ptrace-sme-only-v1-0-3b96dd19a503@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=983; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HuRh6CJ6lDfRc3S6heFYqYDheIESwPc+QBbxZ2wepx4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoesfWyUKPCFwnQxa4ZgHgZdqDZoWgz28vbr8CG
 rXqgobX48mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaHrH1gAKCRAk1otyXVSH
 0KlCB/49ZRHBcD6xN5wJLrtlMU0/nLoPH4Z/YYUFtehP2DnFvawijgbLt0DL98NZQMCUxGvWD6Q
 EbmXvySXCFBDbc2139SyXCOmogc8b81iG+Tiwi0EDMYiAR7a5NPOtex3aKSI7/fdUFQB/oyptkP
 6W1GMpI+teOKVILzctCgVpMUwhKgPvUNvxMrjscXIzf/4z9UaumgWYIX1MVYrGhfnmwj32OH6WR
 pj3N2ky2ZnHV8a+Fczb7t2l9E1x9YRRy/xnoAjaLFR+6kv8G/mhXHS5P9LqQ9lZPqSLyBnpE/kc
 VOPMGi6Dy5g7/lnhHk1HweGAZDzdcdO7j8uXGh+SVVKsdeZl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_151703_375716_74029C1E 
X-CRM114-Status: GOOD (  11.59  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The ABI for disabling streaming mode via ptrace is to do a write via the
SVE register set. Following the recent round of fixes to the ptrace code
we don't support this operation on systems without SVE, which is detected
as failures by fp-ptrace. Update the program so that it knows that this
operation is not currently supported.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 9fc9dc4adaf9..21bc4eac092e 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1061,6 +1061,9 @@ static bool sve_write_supported(struct test_config *config)
 		if (config->sme_vl_in != config->sme_vl_expected) {
 			return false;
 		}
+
+		if (!sve_supported())
+			return false;
 	}
 
 	return true;

-- 
2.39.5


