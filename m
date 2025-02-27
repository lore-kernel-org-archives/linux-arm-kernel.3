Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06114C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Fl1ETwjSexZlDASr50WQmefF6FxZDsTzmgq41ZhTf4=; b=c7+x6SI90QmRqnIni6jw1Q+i4e
	3BAh3VfTmMWFLI+qaLAw3K4hqDgptJqCInYTtn93SE+lemN1ZmUtJmHtlXpSS9tpEw0CHUtYL3iKI
	netW1WcI6EyRJsJHHG5wcrWkhIjmb3pRuE/WheJDwlqR+FmSp2fP79IFPEfJK6fN/qVSTD4GpEBng
	l3ZXhkDNxFBQAGg6zddmPrPGTMZt9CLgMqqilroWFl92AUWYJj41UHGLKWWEymeUHxaCh05pV04ua
	kYN4fETOAAVgQ9iX3VMJxKWVPKfcFVIEbgPXXQAJlhIdSSGIvVkn3b7SLk+135p6pcBCMvHNOYDOF
	56otbFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjiZ-00000008WR3-2MSR;
	Thu, 27 Feb 2025 19:38:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC6-00000007xuh-0wKM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671582; x=1772207582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=efKIZeMDJfkpGyPbaCu342SvLzmk6I9e9j/KfGGydXw=;
  b=KdJMkRRYOwS2BJFFv7OaacSrxjBDrHOryxdakLnaI2Rjr4T5z1lfQPen
   TLW21mWHJ6tW89elKzqh/81GI5Fge0PXUMqdE6hlDWsBbQCSENB291/nM
   kgEcOequtoCMWhfLqOsEjVq5AwRPMsDFxxG0my+/YcQAFIzOajFMFrE71
   PR5jM605/R773aNYJQwqKAuEw62mlEWVX/bqnBpkVMqJonTLjlTWlyyKt
   ngxVnj15koVnC/UaN9v2PvUCUI7/UX4+9ir7BjEQ6jJFr12CEi4XO8pyc
   mVXHIpg8+A92bt5mVADm9Ed+wci4Zuc0xGFzK89NVuQIo8kFFHrxfeWO5
   w==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: ffN8EMH2QKu/Y8j/J0ZaOQ==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638176"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:46 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:46 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 12/21] ARM: at91: pm: Enable ULP0/ULP1 for SAMA7D65
Date: Thu, 27 Feb 2025 08:51:59 -0700
Message-ID: <2ac0832f6ede17a5c111ede09b44b8a126e33e36.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075302_333728_57A2F513 
X-CRM114-Status: GOOD (  15.96  )
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

New clocks are saved to enable ULP0/ULP1 for SAMA7D65 because this SoC has a
total of 9 main clocks that need to be saved for ULP0/ULP1 mode.

Add mcks member to at91_pm_data, this will be used to determine
how many main clocks need to be saved. In the pm_mcks variable will also make
sure that no unnecessary clock settings are written during
mck_ps_restore.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/mach-at91/pm.c              |  11 ++-
 arch/arm/mach-at91/pm.h              |   1 +
 arch/arm/mach-at91/pm_data-offsets.c |   2 +
 arch/arm/mach-at91/pm_suspend.S      | 101 ++++++++++++++++++++++++---
 4 files changed, 105 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index d82a507bc8da..ab51ca03632b 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -1340,6 +1340,7 @@ struct pmc_info {
 	unsigned long uhp_udp_mask;
 	unsigned long mckr;
 	unsigned long version;
+	unsigned long mcks;
 };
 
 static const struct pmc_info pmc_infos[] __initconst = {
@@ -1371,6 +1372,13 @@ static const struct pmc_info pmc_infos[] __initconst = {
 	{
 		.mckr = 0x28,
 		.version = AT91_PMC_V2,
+		.mcks = 4,
+	},
+	{
+		.uhp_udp_mask = AT91SAM926x_PMC_UHP,
+		.mckr = 0x28,
+		.version = AT91_PMC_V2,
+		.mcks = 9,
 	},
 
 };
@@ -1389,7 +1397,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
 	{ .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
 	{ .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
 	{ .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
-	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[4] },
+	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[6] },
 	{ .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
 	{ /* sentinel */ },
 };
@@ -1460,6 +1468,7 @@ static void __init at91_pm_init(void (*pm_idle)(void))
 	soc_pm.data.uhp_udp_mask = pmc->uhp_udp_mask;
 	soc_pm.data.pmc_mckr_offset = pmc->mckr;
 	soc_pm.data.pmc_version = pmc->version;
+	soc_pm.data.pmc_mcks = pmc->mcks;
 
 	if (pm_idle)
 		arm_pm_idle = pm_idle;
diff --git a/arch/arm/mach-at91/pm.h b/arch/arm/mach-at91/pm.h
index 53bdc9000e44..50c3a425d140 100644
--- a/arch/arm/mach-at91/pm.h
+++ b/arch/arm/mach-at91/pm.h
@@ -39,6 +39,7 @@ struct at91_pm_data {
 	unsigned int suspend_mode;
 	unsigned int pmc_mckr_offset;
 	unsigned int pmc_version;
+	unsigned int pmc_mcks;
 };
 #endif
 
diff --git a/arch/arm/mach-at91/pm_data-offsets.c b/arch/arm/mach-at91/pm_data-offsets.c
index 40bd4e8fe40a..0ca5da66dc26 100644
--- a/arch/arm/mach-at91/pm_data-offsets.c
+++ b/arch/arm/mach-at91/pm_data-offsets.c
@@ -18,6 +18,8 @@ int main(void)
 						 pmc_mckr_offset));
 	DEFINE(PM_DATA_PMC_VERSION,	offsetof(struct at91_pm_data,
 						 pmc_version));
+	DEFINE(PM_DATA_PMC_MCKS,	offsetof(struct at91_pm_data,
+						 pmc_mcks));
 
 	return 0;
 }
diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
index e5869cca5e79..e23b86834096 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -814,18 +814,20 @@ sr_dis_exit:
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
+	ldr	tmp3, .mcks
 
-	/* There are 4 MCKs we need to handle: MCK1..4 */
+	/* Start at MCK1 and go until MCKs */
 	mov	tmp1, #1
-e_loop:	cmp	tmp1, #5
-	beq	e_done
+e_loop:
+	cmp	tmp1, tmp3
+	bgt	e_done
 
 	/* Write MCK ID to retrieve the settings. */
 	str	tmp1, [pmc, #AT91_PMC_MCR_V2]
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
@@ -870,18 +902,20 @@ e_done:
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
+	ldr	tmp2, .mcks
 
-	/* There are 4 MCKs we need to handle: MCK1..4 */
+	/* Start from MCK1 and go up to MCKs */
 	mov	tmp1, #1
-r_loop:	cmp	tmp1, #5
-	beq	r_done
+r_loop:
+	cmp	tmp1, tmp2
+	bgt	r_done
 
 r_save_mck1:
 	cmp	tmp1, #1
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
+	ldr	tmp2, .mcks
 	b	r_loop
 r_done:
 #endif
@@ -1045,6 +1110,10 @@ ENTRY(at91_pm_suspend_in_sram)
 	str	tmp1, .memtype
 	ldr	tmp1, [r0, #PM_DATA_MODE]
 	str	tmp1, .pm_mode
+#ifdef CONFIG_SOC_SAMA7
+	ldr	tmp1, [r0, #PM_DATA_PMC_MCKS]
+	str	tmp1, .mcks
+#endif
 
 	/*
 	 * ldrne below are here to preload their address in the TLB as access
@@ -1132,6 +1201,10 @@ ENDPROC(at91_pm_suspend_in_sram)
 	.word 0
 .pmc_version:
 	.word 0
+#ifdef CONFIG_SOC_SAMA7
+.mcks:
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


