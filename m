Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E083AC44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTfU+3gRILRsep1OeyOpzQlJd2O1qxNpsyVnL6cFMrQ=; b=qjHEwfqwOH/aUZRV/KJYyaAg4b
	NeFM9cyHlYNtYpWpW+7Tyd/cqc83RC/+GmoMk9PqxUFnKc1HtDk7UK+AJToT+hXCx7jJec7Qcdkn8
	qnDdCCA/Q0Oje8wPaR+pW1PX42ei0LK6E5p9uKp//QndIT8QYcQT+yl3Ku0ERcU6/EyEBHcAYRGKw
	0ixd9hIOQu02UaKLnIogBjBJItEfEGqHofFaZGZiY84d0ORjTiODB89gkacwBvuD8rvwriD/K8xxg
	EaDILoMTDuJpqozVyYVGiI3cDHyvxCAzu+Es4bNSv2F9TWrw9POC5+VZRC6haXDD9tFdRNK6qYC8W
	wTb1aBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaeB-00000005SIY-2l2V;
	Sun, 19 Jul 2026 23:10:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlae7-00000005SHn-0XZf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:10:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91EB660254;
	Sun, 19 Jul 2026 23:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4571F000E9;
	Sun, 19 Jul 2026 23:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502606;
	bh=eTfU+3gRILRsep1OeyOpzQlJd2O1qxNpsyVnL6cFMrQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ca09oOBjr3+encUJ/u9jcpCA+2WrhlONLFPknKiiUcSm4bZHip3bDeoBOLkSMesBq
	 2RW2SyTgnVnVumqBdav7dnqGTVbRfUJcc34lVW1QB2Zi1QgcVmKdKeXrbrWseu03Wo
	 HJEWORWveBQv5blLK2xc6yFkuaVh84AdeX/oZYxudZX/lRNSnNxwSvF31aZjOxsk0g
	 j/0aUk0hD21BZuAykxhPwloFAOgK2EDMXHDm8fJe+S57ecKDt+HioAycJ+V8gbRAsI
	 47lgLFHB0H/nsSIwOXfeSvnM16v6EhsW7Juyn5tZg9DgHeJvC+5KR3qra7bLnti+gy
	 x61rNMMeK7u2Q==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:29 +0100
Subject: [PATCH v13 02/32] arm64/fpsimd: Ensure all of ZCR_EL1 is
 initialised from idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-2-d9abd3ffa245@kernel.org>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
In-Reply-To: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3682; i=broonie@kernel.org;
 h=from:subject:message-id; bh=clF88Q4Q++Obbm8UOSQg/p4rzpktP8Z7HgDS1dOLUf4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVko7WT9BD6E6lLZIiVH1XDlT15U/QuOW9/ff
 EG0PpVJG8+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZKAAKCRAk1otyXVSH
 0DnvB/0QktPiWkbF6fHJalPB1OgY3yy/F0vT9g6NTN8UCrvSd3lZaVgD48hOfO31NeHgEpI0BCv
 u7bv+ZhtnVfktppXY2fBsk2lBx7TfDeIc3biWpbonSJSRusyf9yaPyG9WYG3YMgkSR94bQsozsz
 ijjEyS0r7VPN5KWNTleYrmAaPlo5LorS7EvOKJutXWcrmDMC1HlNZ6HsrwecBF9Tms6ap421H98
 SgWdwXt0iyxrTfEgUQMy3tPr666H/oDpA3svzX8VAwFI2nIDBFHIvwCwO7cn1qY5YGgabEX/cTM
 mwZCcT0TXFu0pRWE9fwBX1stg0jaEOq+QzBH9AEyk75K9vcW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

At present when exiting from idle we do not fully reinitialise ZCR_EL1,
we update ZCR_EL1.LEN with a read/modify/write cycle when loading task
state but never set any of the other bits to an explicit value.  Since
currently they are all architecturally RES0 or RAZ/WI this is not a
practical issue but it may become one if further fields are defined in
the register so we should explicitly configure the whole register.

Rename the existing sme_suspend_exit() (which handles this for SME) to
fpsimd_suspend_exit() and add set ZCR_EL1 to 0 there, if needed LEN will
be updated when loading task state.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  4 ++--
 arch/arm64/kernel/fpsimd.c      | 24 +++++++++++++-----------
 arch/arm64/kernel/suspend.c     |  2 +-
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index a67d5774e672..e13a85320ab6 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -364,6 +364,8 @@ extern void cpu_enable_sme2(const struct arm64_cpu_capabilities *__unused);
 extern void cpu_enable_fa64(const struct arm64_cpu_capabilities *__unused);
 extern void cpu_enable_fpmr(const struct arm64_cpu_capabilities *__unused);
 
+extern void fpsimd_suspend_exit(void);
+
 /*
  * Helpers to translate bit indices in sve_vq_map to VQ values (and
  * vice versa).  This allows find_next_bit() to be used to find the
@@ -623,7 +625,6 @@ static inline unsigned int sme_get_vl(void)
 extern void sme_alloc(struct task_struct *task, bool flush);
 extern int sme_set_current_vl(unsigned long arg);
 extern int sme_get_current_vl(void);
-extern void sme_suspend_exit(void);
 
 static inline size_t __sme_state_size(unsigned int sme_vl)
 {
@@ -779,7 +780,6 @@ static inline int sme_max_vl(void) { return 0; }
 static inline int sme_max_virtualisable_vl(void) { return 0; }
 static inline int sme_set_current_vl(unsigned long arg) { return -EINVAL; }
 static inline int sme_get_current_vl(void) { return -EINVAL; }
-static inline void sme_suspend_exit(void) { }
 
 static inline size_t __sme_state_size(unsigned int sme_vl)
 {
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059..78c9d8dab545 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1279,24 +1279,26 @@ void __init sme_setup(void)
 		get_sme_default_vl());
 }
 
-void sme_suspend_exit(void)
+#endif /* CONFIG_ARM64_SME */
+
+void fpsimd_suspend_exit(void)
 {
 	u64 smcr = 0;
 
-	if (!system_supports_sme())
-		return;
+	if (system_supports_sve())
+		write_sysreg_s(0, SYS_ZCR_EL1);
 
-	if (system_supports_fa64())
-		smcr |= SMCR_ELx_FA64;
-	if (system_supports_sme2())
-		smcr |= SMCR_ELx_EZT0;
+	if (system_supports_sme()) {
+		if (system_supports_fa64())
+			smcr |= SMCR_ELx_FA64;
+		if (system_supports_sme2())
+			smcr |= SMCR_ELx_EZT0;
 
-	write_sysreg_s(smcr, SYS_SMCR_EL1);
-	write_sysreg_s(0, SYS_SMPRI_EL1);
+		write_sysreg_s(smcr, SYS_SMCR_EL1);
+		write_sysreg_s(0, SYS_SMPRI_EL1);
+	}
 }
 
-#endif /* CONFIG_ARM64_SME */
-
 /*
  * Trapped SVE access
  *
diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index eaaff94329cd..e02728d14e0d 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -81,7 +81,7 @@ void notrace __cpu_suspend_exit(void)
 	 */
 	spectre_v4_enable_mitigation(NULL);
 
-	sme_suspend_exit();
+	fpsimd_suspend_exit();
 
 	/* Restore additional feature-specific configuration */
 	ptrauth_suspend_exit();

-- 
2.47.3


