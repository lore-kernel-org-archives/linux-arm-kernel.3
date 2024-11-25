Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F24D58D6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v0+T7MTZgPiS9bfVIeBcojkRY6Km7VehKSrynfKTtW8=; b=JzP97GaaYAlfRqzEcxiZdQ1Jt3
	eqUNgK+MClSnu1cOXAErsBGTy/PP5idJJiBBZNI5iEZO/sD1YMTORXtLyiMsbNLoq0QaQpvC9GBdL
	UF+4yu1jRW1lllQQa4NHdvIhohOeM3Ldot60rNcYpLHgclJIq0U9T58WEd0nyenkgsiVFkKrLE8Ne
	CC5qDelxhwH7TgAefUVLPbjJ+B3fslqJt5okDLqjIDTpUyvWtiVZnHu2PqJhSOGTYYSggvH5L5S1/
	Xdl5k1beeUvIsw7UYXbFQTQVq8UK210OcmiB86xPvpLsI8C/It2+niBFx1QwvXnT/rlKIA4hwI/6W
	oe5fDRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcPn-00000008gf3-3D4D;
	Mon, 25 Nov 2024 16:58:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcOY-00000008gL0-3Qz3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 16:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732553826; x=1764089826;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qOdoQ4zceMbkYxIfBNeSfJgioY+WDRKdemGP3sJjOC0=;
  b=0fXaT2I9rsaV60aFU5uiY7kmZfv1khvh2FG28hTpCEQsSVnD1rlpyDAP
   s67OuAbs4MwiRpZUFNv1EY/a30sjpBvH79VN8yIqxZRfrtMVxcU8A6Jqm
   oxCC8ATj7hdm7nbyvsCRf/zngZe+LXJdOrZjFADGqxjMAKixLyVMVF7IK
   ETVqJPUDP08/2MZR0UctO3497EbZgDeQa3FQREsFCC/K8iNE895+hr3we
   8eYheq7j/ddKC4IpOsAtypVJFusfA/TiGUt12cYCyxUD0iqYfdoV2fIpa
   v+AwFgeKPsNr6MTyjDroX8Iou4gU+PA4KufiZJPaHG0oNUo6h5xtWZeV/
   A==;
X-CSE-ConnectionGUID: BwadCl3WTMmLeCbh5+QoJg==
X-CSE-MsgGUID: XBLxrodeSNKDCeE0uTKW+g==
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="35261079"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Nov 2024 09:57:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Nov 2024 09:56:55 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 25 Nov 2024 09:56:54 -0700
From: <nicolas.ferre@microchip.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: [PATCH] ARM: at91: pm: change BU Power Switch to automatic mode
Date: Mon, 25 Nov 2024 17:56:48 +0100
Message-ID: <20241125165648.509162-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_085706_928315_5C57967B 
X-CRM114-Status: GOOD (  15.65  )
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
Cc: Cristian Birsan <cristian.birsan@microchip.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Change how the Backup Unit Power is configured and force the
automatic/hardware mode.
This change eliminates the need for software management of the power
switch, ensuring it transitions to the backup power source before
entering low power modes.

This is done in the only locaton where this swich was configured. It's
usually done in the bootloader.

Previously, the loss of the VDDANA (or VDDIN33) power source was not
automatically compensated by an alternative power source. This resulted
in the loss of Backup Unit content, including Backup Self-refresh low
power mode information, OTP emulation configuration, and boot
configuration, for instance.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/mach-at91/pm.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index b9b995f8a36e..05a1547642b6 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -598,7 +598,21 @@ static int at91_suspend_finish(unsigned long val)
 	return 0;
 }
 
-static void at91_pm_switch_ba_to_vbat(void)
+/**
+ * at91_pm_switch_ba_to_auto() - Configure Backup Unit Power Switch
+ * to automatic/hardware mode.
+ *
+ * The Backup Unit Power Switch can be managed either by software or hardware.
+ * Enabling hardware mode allows the automatic transition of power between
+ * VDDANA (or VDDIN33) and VDDBU (or VBAT, respectively), based on the
+ * availability of these power sources.
+ *
+ * If the Backup Unit Power Switch is already in automatic mode, no action is
+ * required. If it is in software-controlled mode, it is switched to automatic
+ * mode to enhance safety and eliminate the need for toggling between power
+ * sources.
+ */
+static void at91_pm_switch_ba_to_auto(void)
 {
 	unsigned int offset = offsetof(struct at91_pm_sfrbu_regs, pswbu);
 	unsigned int val;
@@ -609,24 +623,19 @@ static void at91_pm_switch_ba_to_vbat(void)
 
 	val = readl(soc_pm.data.sfrbu + offset);
 
-	/* Already on VBAT. */
-	if (!(val & soc_pm.sfrbu_regs.pswbu.state))
+	/* Already on auto/hardware. */
+	if (!(val & soc_pm.sfrbu_regs.pswbu.ctrl))
 		return;
 
-	val &= ~soc_pm.sfrbu_regs.pswbu.softsw;
-	val |= soc_pm.sfrbu_regs.pswbu.key | soc_pm.sfrbu_regs.pswbu.ctrl;
+	val &= ~soc_pm.sfrbu_regs.pswbu.ctrl;
+	val |= soc_pm.sfrbu_regs.pswbu.key;
 	writel(val, soc_pm.data.sfrbu + offset);
-
-	/* Wait for update. */
-	val = readl(soc_pm.data.sfrbu + offset);
-	while (val & soc_pm.sfrbu_regs.pswbu.state)
-		val = readl(soc_pm.data.sfrbu + offset);
 }
 
 static void at91_pm_suspend(suspend_state_t state)
 {
 	if (soc_pm.data.mode == AT91_PM_BACKUP) {
-		at91_pm_switch_ba_to_vbat();
+		at91_pm_switch_ba_to_auto();
 
 		cpu_suspend(0, at91_suspend_finish);
 
-- 
2.39.2


