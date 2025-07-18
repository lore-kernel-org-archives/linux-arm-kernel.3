Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CFDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 18:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EACFd/geLJY/8m1IpZ3RnKY8u1CpWN0HUfkGpKyP4kg=; b=4CfC3Yyi/raeUO/GjoY3KGyo8H
	+N/mJBzT5auOdmyA2N7Q3sqqxV8+il77v9twFC3LyHcfEbG7T89OWlDHeAtPGH5laK/W5tUtt3Utb
	jeEeJZyb8Do1sUdfMU5LKzcEMXSezyi/O/JyhrOsZuMNuTxZEcxw5UkjNloYbhX9zWbqqF3t9NYo2
	SMhDtK8+AxI1oeCXEI7sBShN2vmagQwSGipGAFNfSBeb4tiKh/VmkDhRzWK+0oK04Uq3HGlMIWew5
	9/91jpMwjHiQab1Ns5eYnQL8iBNVrlE9NtuQVgo9qgMuTqbu2x9XlL3D4Vv89H2ahKxhcbqgB/pt6
	OWoNrn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucpyN-0000000DJcu-2kP9;
	Fri, 18 Jul 2025 18:38:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucpvu-0000000DJL7-2J8Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 18:35:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF5365C6AC6;
	Fri, 18 Jul 2025 18:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EBFC4CEEB;
	Fri, 18 Jul 2025 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752863745;
	bh=d2q2TbdCVeqS5rqu/bLRgCJKo3NrsSwrZ6A3XKOfT0g=;
	h=From:Date:Subject:To:Cc:From;
	b=oZYjaIcP9cMmKu60dpbyg4SCH49W2emFlditUGxphisynp/39CgbKo/N28bH7JCKp
	 EdscLKZaZQ7G8HD58Yx/7QLjK6gqdIV5Uz/D9FEgr4lx90Tmo9UaKd0VIaWCYD99f6
	 wDt63Al9vbWz+H51YkmVGl/u0c8VMQbmNUkcmq6iUPspSbt41znioz2PQ1wBgDB5+/
	 CBaU7Tj7xDu7TBOXZ8aNLO8/Xr2C3QcaOgujf4E6odoL9ee4cKeyaeVlPk1H4TGwOC
	 bP4NSrxIuuWk+If0kHeUrBU1hOhN9F9qVOcj7YL7BWurVpnUfbOHycouLohVv3U/Z9
	 V0NOFeaoIRCvA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 18 Jul 2025 19:33:16 +0100
Subject: [PATCH] kselftest/arm64: Allow sve-ptrace to run on SME only
 systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-arm64-sve-ptrace-sme-only-v1-1-2a1121e51b1d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGuTemgC/x3MQQqDMBBA0auEWXcgxqi1VxEXUcd2oMYwI6KId
 2/o8i3+v0BJmBRe5gKhnZXXmFE8DIyfEN+EPGWDs66yTfHEIEvtUXfCtEkYCXUhXOP3RB8G306
 2bFxbQe6T0MzH/9319/0D8agvyWsAAAA=
X-Change-ID: 20250718-arm64-sve-ptrace-sme-only-4ab49d037295
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d2q2TbdCVeqS5rqu/bLRgCJKo3NrsSwrZ6A3XKOfT0g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoepP9gEyjTyb6/d1rD8yLE7mUsNFe6A0KL+VEw
 8JodIcKEwmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaHqT/QAKCRAk1otyXVSH
 0CmpB/9AawBTVxco1Vojwq8+KB6lhkWcokuOiooTXWM7NUIUtYQESNsIcYGllucQn+TMGkUYvVZ
 ldDNU8grNvIL/v3PtBl9MS4zsOlABSgf2jkuGB3UTSzMA6h+X0xp6F2f026TBv7U1xSyRhmZZe/
 1KjdyW6m1MWH1W0hRravq+l92o7q+0DN//lW+LWTQF85G/Trp8UU+oh5jSapRzzjEZbDHiiBqpq
 k+mDVjF1sSJQVwQdw/eYb6Mqeiv7GUCF/XIm9EecYyhe2a+8KyCOTVXjdPr8N/iijDiacBd6yUk
 2lTXIu6A0Gk198jFPlr38GQGx2EaoWAUQckLqIzpZB6ji0jw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_113546_637248_6CC48A5E 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

Currently the sve-ptrace test program only runs if the system supports
SVE but since SME includes streaming SVE the tests it offers are valid
even on a system that only supports SME. Since the tests already have
individual hwcap checks just remove the top level test and rely on those.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index 7f9b6a61d369..b22303778fb0 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -753,9 +753,6 @@ int main(void)
 	ksft_print_header();
 	ksft_set_plan(EXPECTED_TESTS);
 
-	if (!(getauxval(AT_HWCAP) & HWCAP_SVE))
-		ksft_exit_skip("SVE not available\n");
-
 	child = fork();
 	if (!child)
 		return do_child();

---
base-commit: 9e8ebfe677f9101bbfe1f75d548a5aec581e8213
change-id: 20250718-arm64-sve-ptrace-sme-only-4ab49d037295

Best regards,
--  
Mark Brown <broonie@kernel.org>


