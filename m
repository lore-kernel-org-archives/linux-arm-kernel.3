Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1788CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 11:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wkvNBCFWV7j6EZCDUC/J1n7DZtEKmON1vs9ZjVWgZ+s=; b=fRqXYnvb9zgBOyWLs6dMJnMWxK
	3VhJPwPqG4MGFiAwQ+rMqFe9w6/SERzXGBWdO72kFlKFTez8ab39rkZ6H1DE2aQQV1KkQ6UMnjTJ3
	pmS1CxVRffniTIH52FEQCahV4/+a1zLNhjxBZtrGhSnMysX/O6GbyNE3FVJBm14nWTewNUz3KJ7mx
	dclyMrXX2plqZzgV+UKnFWKcVvPaHj0FTGnbC7nuyf/1rhUkFC2rRe50DHkrIwb6xZ4NljGtdNJ3J
	dCqAFuxeoKpsFMRXbZ+3Aa5xuOhEyrRz4Tw5y1zQiLZ0T4JqqgI8lO3KLIt3vWlKUKiqppE4oET/2
	JLgEebdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNU1W-00000005Jee-4BwB;
	Thu, 14 May 2026 11:14:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNU1V-00000005Jdk-3AMu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 11:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 063FC60008;
	Thu, 14 May 2026 11:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5E8C2BCB8;
	Thu, 14 May 2026 11:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778757276;
	bh=zWsNF/tTn94RSQdcgyRSetzkeSvxF7zjT9TnBTUpZKg=;
	h=From:Date:Subject:To:Cc:From;
	b=IsneuJLtb21p+xUOoGkPQQ4Tkb4QVXAIZWj2T6Pyh8XHfhQ8in7QXVoSGd1V51f0Q
	 qE5Jh2tLIC2zRxETNPq1FX3xH3f0vP4q9ipuBkE89HFtBgX65UQkvPhjR9ugrsFORD
	 J0RBhKCXyznejSyizR7NfN7eVkhmB2YWHkNNgauKSU0ZkgbDF+KBVxGUpOJHKK1tXO
	 MhsHdyZpo1SgXvzHHjhlYmzK6+06h0B1LwwwmMtHqudFn0h7jGl1BbAZeoNkVKfGNm
	 oPs6cfEYNY+ift/2a8X4XvyK72lEd2NB/fr+nTz6wriAQvqKyLKjVkJx6IA8XT/5Cs
	 8bh21ZBnqAKQg==
From: Enric Balletbo i Serra <eballetbo@kernel.org>
Date: Thu, 14 May 2026 13:14:17 +0200
Subject: [PATCH v3] clocksource: move NXP timer selection to
 drivers/clocksource
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMywrCMBBFf0Vm7UiT9EFd+R/iIo+JnUUfJCVUS
 v/dtBtRcHku95wVIgWmCNfTCoESRx6HDOp8Atvp4UnILjPIQtaFKiR6XnBYJpy5p4CtNcIb12h
 vHWRnCpQPR+/+yNxxnMfwOvJJ7Ou/UhIoUPvS2Fq60nt9C+Q6PV/s2MOeSvKjV0L96jLrlVKmb
 W3VmLr50rdtewO5yf1a6gAAAA==
X-Change-ID: 20260302-fix-nxp-timer-9cb1fbd7afcd
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778757274; l=3908;
 i=eballetb@redhat.com; s=20260512; h=from:subject:message-id;
 bh=8pjGWairaSrRO06DfSoKsQGunA0RWo+g3nUWQxcUGpA=;
 b=7m8+d8+HXSaZQcJXX+CZpLJUEAUJXtaBse0usCCid3aNoNa2P6OfNkJUVWIoqLJ5xJ1emN2e/
 b3HZgce8tJkCiYdMH7Kmj8m8AulEqIdQBcKMKeO0CF+1HT0cBvfhivI
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=HEWGfVmqrAZfJ4JLImY+V4jOfS+bkE5CQrdmm/kZq5Y=
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

From: Enric Balletbo i Serra <eballetb@redhat.com>

The Kconfig logic for selecting the scheduler clocksource on
NXP Vybrid (VF610) uses a `choice` block restricted to 32-bit ARM. This
prevents 64-bit architectures, such as the NXP S32 family, from enabling
the NXP Periodic Interrupt Timer (PIT) driver (CONFIG_NXP_PIT_TIMER).

Relocate the NXP clocksource selection from arch/arm/mach-imx/Kconfig to
drivers/clocksource/Kconfig. This allows the configuration to be shared
across different architectures.

Update the selection to include support for ARCH_S32 and add a "None"
option restricted to ARCH_S32, since Vybrid lacks the ARM Architected
Timer. The Vybrid Global Timer option is restricted to ARCH_MULTI_V7
SOC_VF610 platforms to prevent it from being visible on Cortex-M4 builds,
which lack the ARM Global Timer hardware.

Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
Changes in v3:
- Restrict VF_TIMER_NONE to ARCH_S32 to prevent selecting it on Vybrid
  platforms which lack the ARM Architected Timer
- Link to v2: https://lore.kernel.org/r/20260513-fix-nxp-timer-v2-1-533b99c57b67@redhat.com

Changes in v2:
- Fix VF_USE_ARM_GLOBAL_TIMER dependency: use ARCH_MULTI_V7 instead of
  ARM to prevent the option from being visible on Cortex-M4 builds
  (Sashiko AI review)
- Link to v1: https://lore.kernel.org/r/20260302-fix-nxp-timer-v1-1-af4bc62d4ffa@redhat.com
---
 arch/arm/mach-imx/Kconfig   | 21 ---------------------
 drivers/clocksource/Kconfig | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 6ea1bd55acf8..a361840d7a04 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -227,27 +227,6 @@ config SOC_VF610
 	help
 	  This enables support for Freescale Vybrid VF610 processor.
 
-choice
-	prompt "Clocksource for scheduler clock"
-	depends on SOC_VF610
-	default VF_USE_ARM_GLOBAL_TIMER
-
-	config VF_USE_ARM_GLOBAL_TIMER
-		bool "Use ARM Global Timer"
-		depends on ARCH_MULTI_V7
-		select ARM_GLOBAL_TIMER
-		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
-		help
-		  Use the ARM Global Timer as clocksource
-
-	config VF_USE_PIT_TIMER
-		bool "Use PIT timer"
-		select NXP_PIT_TIMER
-		help
-		  Use SoC Periodic Interrupt Timer (PIT) as clocksource
-
-endchoice
-
 endif
 
 endif
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index d1a33a231a44..d9c76dd443f8 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -793,4 +793,35 @@ config RTK_SYSTIMER
 	  this option only when building for a Realtek platform or for compilation
 	  testing.
 
+choice
+	prompt "NXP clocksource for scheduler clock"
+	depends on SOC_VF610 || ARCH_S32
+	# Default to Global Timer for Vybrid (32-bit)
+	default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
+	# Default to None for S32 (64-bit)
+	default VF_TIMER_NONE if ARCH_S32
+
+	config VF_USE_ARM_GLOBAL_TIMER
+		bool "Use NXP Vybrid Global Timer"
+		depends on ARCH_MULTI_V7 && SOC_VF610
+		select ARM_GLOBAL_TIMER
+		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
+		help
+		  Use the NXP Vybrid Global Timer as clocksource.
+
+	config VF_USE_PIT_TIMER
+		bool "Use NXP PIT timer"
+		select NXP_PIT_TIMER
+		help
+		  Use NXP Periodic Interrupt Timer (PIT) as clocksource.
+
+	config VF_TIMER_NONE
+		bool "None (Use standard Arch Timer)"
+		depends on ARCH_S32
+		help
+		  Do not use any specific NXP timer driver. Use the standard
+		  ARM Architected Timer instead.
+
+endchoice
+
 endmenu

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260302-fix-nxp-timer-9cb1fbd7afcd

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>


