Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACA7C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QP4a+4+jeSg4/Qk7T2JO8CPeYZrMYr+/6zIv4q+qxtM=; b=m1p+kVilDMYe9kQ/MJfrjOJcNw
	nV3xFKCDjLII3Ley2fXCygdebDFq3NTA7vMpoHdVRkrNUAj+anVMire7cAGUGG6y9zgdQavsKzFft
	C67gE5Gr0NA+YTi20rlmB2JkI14p6oMum1kdUeS1dLqlSJL7J7KzHw91Up716UeKayUFPIM/BvTRA
	7O2MBCYNqMskGBiT+pP+iRJBRE9+62pUv/uUdphADrzq7zf50qwOZ6Vc0v0xOaWhabG2+xBPA6vVG
	qkrjZrrWxfX7WWcDkYMVdvo3TEXjHOUnzEskBXfUDb66E/jjoFCh+U021wPDOT1i4ZfwRV+Sk+XXx
	oYqNSbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYTV-00000009Ib0-1haB;
	Thu, 30 Jan 2025 17:37:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSB-00000009IIu-1bus
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258547; x=1769794547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nZid29reqDR3++ddySt2KOHWm8tGT444s+OSw8Gjkok=;
  b=A91cUA+38XRtzQlHJzhL//H9D5Le/1q/7YAN2jdtuIox6HfPioWJEMCJ
   74rye6tTsk5IA5c+XeVNCfeJAioaH+vsH/Tr8eMLA063RUujhmvEtN9xo
   jpwH0+n9P0LB5LkSV1wVOS55FKMoTVa/o/CIdJZAY10+ntrJV9X/GdtS5
   1+T0TAuoeeGBCj/afuLodBMNL9yb+Mjgkt3Kz1r4SkHM/IFFN+Qn5O0Aw
   RQw3wtBNTwAIhjrzPlhE+c8FbyvJ4tfCkwoFB5W6ow6lqk/6yj/uujRYp
   Fz2/I3aQ63iA8Ay3QNN6f344AiSiAzLC4IZC0f4NYiwNQu9yO+hw54fPV
   g==;
X-CSE-ConnectionGUID: X8noN3xrSZmPEckyVo5bzw==
X-CSE-MsgGUID: exe2a/zgRGuLm6QIj8jwtA==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204622972"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:35:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Jan 2025 10:35:41 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 30 Jan 2025 10:35:41 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>, <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 13/16] ARM: at91: pm: Enable ULP0 for SAMA7D65
Date: Thu, 30 Jan 2025 10:33:53 -0700
Message-ID: <24544d75175c47e23eb0a89ab4c1783e191747cc.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093547_489214_F95B7742 
X-CRM114-Status: GOOD (  17.86  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

New clocks are saved to enable ULP0 for SAMA7D65 because this SoC has a
total of 10 main clocks that need to be saved for ULP0 mode.

Add mck_count member to at91_pm_data, this will be used to determine
how many mcks need to be saved. In the mck_count member will also make
sure that no unnecessary clock settings are written during
mck_ps_restore.

Add SHDWC to ULP0 mapping to clear the SHDWC status after exiting low
power modes.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/mach-at91/pm.c              | 19 +++++-
 arch/arm/mach-at91/pm.h              |  1 +
 arch/arm/mach-at91/pm_data-offsets.c |  2 +
 arch/arm/mach-at91/pm_suspend.S      | 97 ++++++++++++++++++++++++++--
 4 files changed, 110 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 5e458254e1f1c..e29c44924ac22 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -1336,6 +1336,7 @@ struct pmc_info {
 	unsigned long uhp_udp_mask;
 	unsigned long mckr;
 	unsigned long version;
+	unsigned long mck_count;
 };
 
 static const struct pmc_info pmc_infos[] __initconst = {
@@ -1343,30 +1344,42 @@ static const struct pmc_info pmc_infos[] __initconst = {
 		.uhp_udp_mask = AT91RM9200_PMC_UHP | AT91RM9200_PMC_UDP,
 		.mckr = 0x30,
 		.version = AT91_PMC_V1,
+		.mck_count = 1,
 	},
 
 	{
 		.uhp_udp_mask = AT91SAM926x_PMC_UHP | AT91SAM926x_PMC_UDP,
 		.mckr = 0x30,
 		.version = AT91_PMC_V1,
+		.mck_count = 1,
 	},
 	{
 		.uhp_udp_mask = AT91SAM926x_PMC_UHP,
 		.mckr = 0x30,
 		.version = AT91_PMC_V1,
+		.mck_count = 1,
 	},
 	{	.uhp_udp_mask = 0,
 		.mckr = 0x30,
 		.version = AT91_PMC_V1,
+		.mck_count = 1,
 	},
 	{
 		.uhp_udp_mask = AT91SAM926x_PMC_UHP | AT91SAM926x_PMC_UDP,
 		.mckr = 0x28,
 		.version = AT91_PMC_V2,
+		.mck_count = 1,
 	},
 	{
 		.mckr = 0x28,
 		.version = AT91_PMC_V2,
+		.mck_count = 5,
+	},
+	{
+		.uhp_udp_mask = AT91SAM926x_PMC_UHP,
+		.mckr = 0x28,
+		.version = AT91_PMC_V2,
+		.mck_count = 10,
 	},
 
 };
@@ -1385,7 +1398,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
 	{ .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
 	{ .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
 	{ .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
-	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[4] },
+	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[6] },
 	{ .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
 	{ /* sentinel */ },
 };
@@ -1456,6 +1469,7 @@ static void __init at91_pm_init(void (*pm_idle)(void))
 	soc_pm.data.uhp_udp_mask = pmc->uhp_udp_mask;
 	soc_pm.data.pmc_mckr_offset = pmc->mckr;
 	soc_pm.data.pmc_version = pmc->version;
+	soc_pm.data.pmc_mck_count = pmc->mck_count;
 
 	if (pm_idle)
 		arm_pm_idle = pm_idle;
@@ -1658,7 +1672,8 @@ void __init sama7_pm_init(void)
 		AT91_PM_STANDBY, AT91_PM_ULP0, AT91_PM_ULP1, AT91_PM_BACKUP,
 	};
 	static const u32 iomaps[] __initconst = {
-		[AT91_PM_ULP0]		= AT91_PM_IOMAP(SFRBU),
+		[AT91_PM_ULP0]		= AT91_PM_IOMAP(SFRBU) |
+					  AT91_PM_IOMAP(SHDWC),
 		[AT91_PM_ULP1]		= AT91_PM_IOMAP(SFRBU) |
 					  AT91_PM_IOMAP(SHDWC) |
 					  AT91_PM_IOMAP(ETHC),
diff --git a/arch/arm/mach-at91/pm.h b/arch/arm/mach-at91/pm.h
index 53bdc9000e447..ccde9c8728c27 100644
--- a/arch/arm/mach-at91/pm.h
+++ b/arch/arm/mach-at91/pm.h
@@ -39,6 +39,7 @@ struct at91_pm_data {
 	unsigned int suspend_mode;
 	unsigned int pmc_mckr_offset;
 	unsigned int pmc_version;
+	unsigned int pmc_mck_count;
 };
 #endif
 
diff --git a/arch/arm/mach-at91/pm_data-offsets.c b/arch/arm/mach-at91/pm_data-offsets.c
index 40bd4e8fe40a5..59a4838038381 100644
--- a/arch/arm/mach-at91/pm_data-offsets.c
+++ b/arch/arm/mach-at91/pm_data-offsets.c
@@ -18,6 +18,8 @@ int main(void)
 						 pmc_mckr_offset));
 	DEFINE(PM_DATA_PMC_VERSION,	offsetof(struct at91_pm_data,
 						 pmc_version));
+	DEFINE(PM_DATA_PMC_MCK_COUNT,	offsetof(struct at91_pm_data,
+						 pmc_mck_count));
 
 	return 0;
 }
diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
index e5869cca5e791..2bbcbb26adb28 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -814,17 +814,19 @@ sr_dis_exit:
 .endm
 
 /**
- * at91_mckx_ps_enable:	save MCK1..4 settings and switch it to main clock
+ * at91_mckx_ps_enable:	save MCK settings and switch it to main clock
  *
- * Side effects: overwrites tmp1, tmp2
+ * Side effects: overwrites tmp1, tmp2, tmp3
  */
 .macro at91_mckx_ps_enable
 #ifdef CONFIG_SOC_SAMA7
 	ldr	pmc, .pmc_base
+	ldr	tmp3, .mck_count
 
-	/* There are 4 MCKs we need to handle: MCK1..4 */
+	/* Start at MCK1 and go until MCK_count */
 	mov	tmp1, #1
-e_loop:	cmp	tmp1, #5
+e_loop:
+	cmp	tmp1, tmp3
 	beq	e_done
 
 	/* Write MCK ID to retrieve the settings. */
@@ -850,7 +852,37 @@ e_save_mck3:
 	b	e_ps
 
 e_save_mck4:
+	cmp	tmp1, #4
+	bne	e_save_mck5
 	str	tmp2, .saved_mck4
+	b	e_ps
+
+e_save_mck5:
+	cmp	tmp1, #5
+	bne	e_save_mck6
+	str	tmp2, .saved_mck5
+	b	e_ps
+
+e_save_mck6:
+	cmp	tmp1, #6
+	bne	e_save_mck7
+	str	tmp2, .saved_mck6
+	b	e_ps
+
+e_save_mck7:
+	cmp	tmp1, #7
+	bne	e_save_mck8
+	str	tmp2, .saved_mck7
+	b	e_ps
+
+e_save_mck8:
+	cmp	tmp1, #8
+	bne	e_save_mck9
+	str	tmp2, .saved_mck8
+	b	e_ps
+
+e_save_mck9:
+	str	tmp2, .saved_mck9
 
 e_ps:
 	/* Use CSS=MAINCK and DIV=1. */
@@ -870,17 +902,19 @@ e_done:
 .endm
 
 /**
- * at91_mckx_ps_restore: restore MCK1..4 settings
+ * at91_mckx_ps_restore: restore MCKx settings
  *
  * Side effects: overwrites tmp1, tmp2
  */
 .macro at91_mckx_ps_restore
 #ifdef CONFIG_SOC_SAMA7
 	ldr	pmc, .pmc_base
+	ldr	tmp2, .mck_count
 
-	/* There are 4 MCKs we need to handle: MCK1..4 */
+	/* Start from MCK1 and go up to MCK_count */
 	mov	tmp1, #1
-r_loop:	cmp	tmp1, #5
+r_loop:
+	cmp	tmp1, tmp2
 	beq	r_done
 
 r_save_mck1:
@@ -902,7 +936,37 @@ r_save_mck3:
 	b	r_ps
 
 r_save_mck4:
+	cmp	tmp1, #4
+	bne	r_save_mck5
 	ldr	tmp2, .saved_mck4
+	b	r_ps
+
+r_save_mck5:
+	cmp	tmp1, #5
+	bne	r_save_mck6
+	ldr	tmp2, .saved_mck5
+	b	r_ps
+
+r_save_mck6:
+	cmp	tmp1, #6
+	bne	r_save_mck7
+	ldr	tmp2, .saved_mck6
+	b	r_ps
+
+r_save_mck7:
+	cmp	tmp1, #7
+	bne	r_save_mck8
+	ldr	tmp2, .saved_mck7
+	b	r_ps
+
+r_save_mck8:
+	cmp	tmp1, #8
+	bne	r_save_mck9
+	ldr	tmp2, .saved_mck8
+	b	r_ps
+
+r_save_mck9:
+	ldr	tmp2, .saved_mck9
 
 r_ps:
 	/* Write MCK ID to retrieve the settings. */
@@ -921,6 +985,7 @@ r_ps:
 	wait_mckrdy tmp1
 
 	add	tmp1, tmp1, #1
+	ldr	tmp2, .mck_count
 	b	r_loop
 r_done:
 #endif
@@ -1045,6 +1110,10 @@ ENTRY(at91_pm_suspend_in_sram)
 	str	tmp1, .memtype
 	ldr	tmp1, [r0, #PM_DATA_MODE]
 	str	tmp1, .pm_mode
+#ifdef CONFIG_SOC_SAMA7
+	ldr	tmp1, [r0, #PM_DATA_PMC_MCK_COUNT]
+	str	tmp1, .mck_count
+#endif
 
 	/*
 	 * ldrne below are here to preload their address in the TLB as access
@@ -1132,6 +1201,10 @@ ENDPROC(at91_pm_suspend_in_sram)
 	.word 0
 .pmc_version:
 	.word 0
+#ifdef CONFIG_SOC_SAMA7
+.mck_count:
+	.word 0
+#endif
 .saved_mckr:
 	.word 0
 .saved_pllar:
@@ -1155,6 +1228,16 @@ ENDPROC(at91_pm_suspend_in_sram)
 	.word 0
 .saved_mck4:
 	.word 0
+.saved_mck5:
+	.word 0
+.saved_mck6:
+	.word 0
+.saved_mck7:
+	.word 0
+.saved_mck8:
+	.word 0
+.saved_mck9:
+	.word 0
 #endif
 
 ENTRY(at91_pm_suspend_in_sram_sz)
-- 
2.43.0


