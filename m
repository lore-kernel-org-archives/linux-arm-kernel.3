Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247F1FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS2hho7VuzlVEZR7IUNrzzOjkgkOhGieTCpfIzTdLhc=; b=OUJ6JTbcpFW10L22ty+EQe5Z00
	ISHxUdXWWkwylM8jVfPYP6Hy3iMO8LkvZeWLB/PXx0hNtZ//wY+XwgWLpB1nJWWOmXTR+9gtQCIPS
	KO0H4ePjvKzrr5ljeoT2PiyLBqBaspBSsm/8613us4w+bPBWXvHvjiNYteBbxG6X5XwkBt/EXGI5p
	X4yYhNsVnHpWuE3FIV0kYCKBGanLBR9q3IFjJY6WjyPq1GwM4Av2qDwB0ja3My70YdvDIPj4EByLv
	F9NtobXNpF9jvSJg80lhaOWGGf6DdfQ3smX8ijPCD9MVkCOV8RLdDboH8pPSewCG/TM5MLEdUaF4x
	s72Ke6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2H8-00000003Sdm-1VR5;
	Wed, 29 Apr 2026 10:36:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2H2-00000003SbQ-3sxK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 10:36:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB0252A68;
	Wed, 29 Apr 2026 03:36:02 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 924233F763;
	Wed, 29 Apr 2026 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777458968; bh=pauRE4WXLd5A2mADI8u2GsacXvG9i2wtBaAlimcYA/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QD1pSY/MDkAcDHTkkN0t8lVDZP3T7fZVk+YI7zce5oH8/HyGdHsbibK3pWkGKWdLZ
	 CGQylK2GGWM/ccaPPdsUrXXfu/zHALqaym2hnzxbaNNgQ8/biKefI7J7t4V1/9mWbX
	 dv2KaoKRtjGQaKKKtj7JdOT+soTMRZAYvrhqG0Hc=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	sudeep.holla@arm.com,
	robh@kernel.org,
	maz@kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [RFC PATCH 4/4] arm64: realm: Move RSI detection earlier
Date: Wed, 29 Apr 2026 11:35:35 +0100
Message-ID: <20260429103535.266728-5-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429103535.266728-1-suzuki.poulose@arm.com>
References: <20260429103535.266728-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_033609_090778_D765FD8F 
X-CRM114-Status: GOOD (  18.79  )
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

As discussed in [0], Realm world detection happens too late for making the
decision for the Linear map granularity for Arm64. If the boot CPU doesn't support
BBML2_NOABORT, it is difficult to break the mapping to PTE level. To solve this
try probing the Realm world earlier,  now that we probe the PSCI/SMCCC earlier.
Like the PSCI probe, if we fall back to the later point if the SMCCC probe
wasn't successful. We should probably add a WARNING/panic the system if the
BBML2_NOABORT is not supported on the boot CPU and linear map was created
with block mappings. This may case avoided by using rodata=full.

[0] https://lore.kernel.org/all/20260330161705.3349825-2-ryan.roberts@arm.com/

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/rsi.h |  1 +
 arch/arm64/kernel/rsi.c      | 23 ++++++++++++++++++++++-
 arch/arm64/kernel/setup.c    |  3 ++-
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index 88b50d660e85..4456bf0a1f23 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -14,6 +14,7 @@
 
 DECLARE_STATIC_KEY_FALSE(rsi_present);
 
+void __init arm64_early_rsi_init(void);
 void __init arm64_rsi_init(void);
 
 bool arm64_rsi_is_protected(phys_addr_t base, size_t size);
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index c64a06f58c0b..2d2befae2c75 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -138,10 +138,14 @@ static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
 	return 0;
 }
 
-void __init arm64_rsi_init(void)
+static bool rsi_probed = 0;
+
+static void __init rsi_probe(void)
 {
 	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
 		return;
+
+	rsi_probed = true;
 	if (!rsi_version_matches())
 		return;
 	if (WARN_ON(rsi_get_realm_config(&config)))
@@ -159,6 +163,23 @@ void __init arm64_rsi_init(void)
 	static_branch_enable(&rsi_present);
 }
 
+void __init arm64_early_rsi_init(void)
+{
+	rsi_probe();
+}
+
+void __init arm64_rsi_init(void)
+{
+	if (rsi_probed)
+		return;
+
+	rsi_probe();
+	/*
+	 * TODO: Warn if we don't have BBML2_NOABORT and page mapping is
+	 * not used.
+	 */
+}
+
 static struct platform_device rsi_dev = {
 	.name = RSI_PDEV_NAME,
 	.id = PLATFORM_DEVID_NONE
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 595aff6f17d5..0664130dd791 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -340,7 +340,8 @@ static void __init early_psci_init(void)
 		return;
 	}
 
-	psci_early_init_conduit(conduit);
+	if (!psci_early_init_conduit(conduit))
+		arm64_early_rsi_init();
 }
 
 void __init __no_sanitize_address setup_arch(char **cmdline_p)
-- 
2.43.0


