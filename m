Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91400C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVr/yW1oKVqAIeed9fvO3p4He3IxT98RUtLiW5hl5QE=; b=VIt3SnN/4jtiu7xricyclXFc3a
	HwwnDX7q0YJjHPLtuz7E4GwEXDBhWqEq8HcHWXSCEdR2cnwvcLPBecrVTdDZY65UZAY65z1E/1XYE
	bHp/Zxo7NasB7DUE/sb5badgKbkyOG7lcGD4tH27dlO7XOKu/zHMNAD/U+hYrk2CHI8r4aSkGTIQ5
	6zvL+furVfn12llsxcDiikGFkcH4ey56VWbc15fRln4pZCt0qoQTpVkGTIxbL3vjk+iNZA9CcsEOA
	SvJ7Zc7HhQhbv6YLHwEO/kS1sHVmVgYGjKlrr/+xgzdP7N1X+zF3/PM3EsDWP2S6HzYMFSylxwsuu
	ogk869Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctXW-0000000DXnv-15kq;
	Fri, 18 Jul 2025 22:26:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctO2-0000000DX60-0Uha
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:17:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 539E5A57727;
	Fri, 18 Jul 2025 22:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8432AC4CEEB;
	Fri, 18 Jul 2025 22:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752877021;
	bh=v75KB1eAr6vVFWWCQHSWO2tjEmEj20MzgOKOHSHPFeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y04bJ+ZRqPbHQiYnPbvwqrPEKLjeZVSl+7qpsOBsYDbWG41tSrUrGgaqOOfML1BWd
	 yOkqfLzcuGXsN/E3MFfE+LfcQrXIwaJRLIq+YI2/7VG4lZs4XI5W3SwCc5PTokS/sk
	 e1Rs+MXVpjqHCpZcp8TAxNct7rCFWr7Zt2L4nHwXijZL3p/LH5EZLRsLzuob/4v/4a
	 WSKc7SyPqIjwwXsIWYfbq6yEH9oqELSd5MELXbV9DXhOCSzcGNKiVolMLzW6RFJEk6
	 rZKMHO4HL35JnXvdIPV2FWvfMbAr39Jn6uLT1Czy2EMZhCwZPofoJxPz6oSCgrIw6j
	 sklLkgiwW+0Lw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 18 Jul 2025 23:14:51 +0100
Subject: [PATCH 2/3] kselftest/arm64: Fix SVE write data generation for SME
 only systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-arm64-fp-ptrace-sme-only-v1-2-3b96dd19a503@kernel.org>
References: <20250718-arm64-fp-ptrace-sme-only-v1-0-3b96dd19a503@kernel.org>
In-Reply-To: <20250718-arm64-fp-ptrace-sme-only-v1-0-3b96dd19a503@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=broonie@kernel.org;
 h=from:subject:message-id; bh=v75KB1eAr6vVFWWCQHSWO2tjEmEj20MzgOKOHSHPFeY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoesfW2kpUi/Y9eauMoMki+FnL9SKRAujO6Ay8H
 iByIVbdfpaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaHrH1gAKCRAk1otyXVSH
 0Fi1CACFkFDPkjcxZ+wxAUV5LuKeBhx1IS5cpkKfdAPRJmLOiYN98DQbVK6ETi0R/6PSbvrQspe
 ru3j5f2hXnU4zZEIwo7QNd/oz8t3tOY6KQL1VmD/uWRFNOZ/4iWHz9QX57shTngup/CNfVPWlJK
 4hJ3Qv1TH2WU3tncQwkf/d1Tmof0oNHhL4VQJGp8m4RyRM1EHQ5rvyrxpnT8P7q5JLACyYD3nqf
 R+nIvBjUwN2wCwu3v6uWrfI7WLgWw8hB19vD1yin22VOL7u0J2G5voVs/cv/YP9/YxkmOAVUV4w
 p/iOrFs0AlpwxbXUgRT2Hf+00PybeDDBOMcEDcn/3tqZ04Jz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_151702_228277_87900D4C 
X-CRM114-Status: GOOD (  10.47  )
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

fp-ptrace does not handle SME only systems correctly when generating data,
on SME only systems scenarios where we are not in streaming mode will not
have an expected vector length. This leads to attempts to do memcpy()s of
zero byte arrays which can crash, fix this by skipping generation of SVE
data for cases where we do not expect to have an active vector length.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index d953e9b0ebe5..9fc9dc4adaf9 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1134,6 +1134,9 @@ static void sve_write_expected(struct test_config *config)
 	int vl = vl_expected(config);
 	int sme_vq = __sve_vq_from_vl(config->sme_vl_expected);
 
+	if (!vl)
+		return;
+
 	fill_random(z_expected, __SVE_ZREGS_SIZE(__sve_vq_from_vl(vl)));
 	fill_random(p_expected, __SVE_PREGS_SIZE(__sve_vq_from_vl(vl)));
 
@@ -1161,6 +1164,9 @@ static void sve_write(pid_t child, struct test_config *config)
 	vl = vl_expected(config);
 	vq = __sve_vq_from_vl(vl);
 
+	if (!vl)
+		return;
+
 	iov.iov_len = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
 	iov.iov_base = malloc(iov.iov_len);
 	if (!iov.iov_base) {

-- 
2.39.5


