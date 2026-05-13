Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3003DCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dnW2mpzT0gWWOxBRlUkOmKIJKm/HluIBK6DlLQv/V0E=; b=M8JBCLsRdcvlwP4JX8ysj3G9Oz
	xKaW2yDuMwUSScn4FJ9ILfzMhMVwq2s1OlLNq4EOH2GKDttdVI/MQE+J1fuOck7pTbWMo+sIKkNuh
	hina2RyAhaM9ObNQHKFKCqfKV1LOo4tlS35t7esOHmZiIPAfqO8oBEyAhz7ZiwAmDvNSDFMRBxlly
	fPwFCrY+XXtomYbIuCkZGKqb+6Kn8vpI6m20zSZMgzMj5PpnlPkMt8CGXcbSVxWxS6qkygt8L4LhN
	XOL/8BBRJRJTzbsB8dnHCmmUCjVX3OgB4dhDr3M0KxhPRXZWQFVGXqIOeMshmLUwb9Rc6ya5l9/Fi
	1GJeMbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEEZ-00000003S5U-1lhL;
	Wed, 13 May 2026 18:23:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEEV-00000003S4b-1yG4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:23:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 871E443C03;
	Wed, 13 May 2026 18:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C53C19425;
	Wed, 13 May 2026 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778696578;
	bh=PSooL5ZH+dxgPjzMQBWlQZM+uqKj7LMtxK0Ge7AEP2c=;
	h=From:Date:Subject:To:Cc:From;
	b=HAn1yUpHcqnEmLyfP5AQVDv9BTDnZDo9JQH+JTF9hqFbs/TVwugfxD84V0uG46UNK
	 BM+7E/yky1TE+hymEG//F5XlCOYN2s6E9yL2HKKeqy1BVqpwikh23CjnhKfs9pkde8
	 4BQX+IxWaT31v2aQp7mJlDdr2R0/r1yHtm65UNR1JhcMVAu3CFEsr57z1PzmaB7EXq
	 e3uZ1Q1kCjCqYBygSxN4cGMkxpwn/M9HqXKClBvqHOaFyAj5Wi0DCOjdiqPgjugG6W
	 hrGkKGTiEoRPSr3pP/G2aCSiVTdQsGjolLj/GGUQu+f8qbQLBvn2HcoeuPk6mV3gV6
	 HVnx0yjHhu9KA==
From: Enric Balletbo i Serra <eballetbo@kernel.org>
Date: Wed, 13 May 2026 20:22:37 +0200
Subject: [PATCH v2] clocksource: move NXP timer selection to
 drivers/clocksource
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-fix-nxp-timer-v2-1-533b99c57b67@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMOw7CMBAFrxJtzSLbREFQcY8ohT9rvEU+si0rK
 PLdMekp5+nNHJAoMiV4dgdEKpx4XRqoSwc26OVNyK4xKKEGcRMKPe+47Btmniniwxrpjbtrbx0
 0Z4vUDmdvnBoHTnmNnzNf5G/9VyoSJWrfGzso13uvX5Fc0Plq1xmmWusX38DmnasAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778696575; l=3631;
 i=eballetb@redhat.com; s=20260512; h=from:subject:message-id;
 bh=ZKQ+5Zn4AouJzksg8Q7tp9yGqOeq6zq6Pqnrb7HW66Y=;
 b=E0GBl4K3fVMf8UCS5PUTZ6QiceEcqApT/KV1zILaMLewnWR37heyyMN5TMejYL6fh0Mw/N56C
 gGLURCNdQtYCDVawSZbJi09SWYzjpQGA2SP0j40lEi7e7EmTl4KKlVL
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=HEWGfVmqrAZfJ4JLImY+V4jOfS+bkE5CQrdmm/kZq5Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_112259_553293_E8BE3321 
X-CRM114-Status: GOOD (  14.03  )
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
option to allow using the standard ARM Architected Timer. The Vybrid
Global Timer option is restricted to ARCH_MULTI_V7 SOC_VF610 platforms
to prevent it from being visible on Cortex-M4 builds, which lack the
ARM Global Timer hardware.

Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
Changes in v2:
- Fix VF_USE_ARM_GLOBAL_TIMER dependency: use ARCH_MULTI_V7 instead of
  ARM to prevent the option from being visible on Cortex-M4 builds
  (Sashiko AI review)
- Link to v1: https://lore.kernel.org/r/20260302-fix-nxp-timer-v1-1-af4bc62d4ffa@redhat.com
---
 arch/arm/mach-imx/Kconfig   | 21 ---------------------
 drivers/clocksource/Kconfig | 30 ++++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 21 deletions(-)

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
index d1a33a231a44..15c02d3e9dbf 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -793,4 +793,34 @@ config RTK_SYSTIMER
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


