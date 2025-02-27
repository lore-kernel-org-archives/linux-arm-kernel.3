Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269B3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQwqmyA2l1Z2RcmTsvlOH+6Ls92k6XSr/11pRMMMXu4=; b=fvuI/4vXtbXssTaHuGuzwxUm/k
	5K/UmSW3kEm9RcANPtZuf4xW8z/UBkGfQ8NMVUZ2Uqj3gqy97XAp0Hj2yAvDRma7UtzJBO75z9aN4
	qLlUJtB5zVmF8XmTdQ73k2Yt/u249hzGDvhqgtYraV7T7y6f/TgenrDAWePt6+dQFcS+07Xh9o0jM
	xbl0MfbRVkazAWPK/Etz+vawRL2/+jLx2XQB0b4T3HE/BArRLU2V4M7FGmPtxGq3y92hzPKcBadlK
	jjqtetytpEuEq2lTNKLPls5T7VyVXwaFA8c25Iacu3Kd60WFbtikq9OGMNmDkI3nMAKRUT7C/2OAW
	ijJxaTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjiR-00000008WED-1WQm;
	Thu, 27 Feb 2025 19:38:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC5-00000007xuB-0QsL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671581; x=1772207581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wQQFq0ge4xpSL3D4Ui5ubnr+T8i2ghkzGszHh+ETJUs=;
  b=XqLQeh58sqPdE9kRwcF8deyJXw2YAIRCHWysBnGzQqtLwnKrneObvR28
   LvCFKIKqaku1EnBOxorYmlPDU0EGtAfu9vYiDhZ3r0K/e8OIM5KA7lt1i
   bNRPAbep4uGcgl+kl4PLRKpWncWGEUZybLxQK1ug/llVkfpN5IZIsOq2d
   /n1NYmooJzJhDjdWPZs4eJCp/rkXlSITXYyuMYfMoqK5OYf/dSGUVEcWQ
   ZqTenhMaOEjv7YxEMN78/nPYpNtRDMxeSOQOWoRfJIbamuk0wLMiWT3eG
   DmGyJ6+6E9W0Owxy4UUIydK2uODg8nz/D9aB2KJyVnwkPrKDA0yA8e4ad
   A==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: xx/wk7Z+S9OdJFDe6j0ySA==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638172"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:45 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:45 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 10/21] ARM: at91: pm: add DT compatible support for sama7d65
Date: Thu, 27 Feb 2025 08:51:57 -0700
Message-ID: <06b64869f2de4b499835d153411ba30512409168.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075301_214436_922B68F6 
X-CRM114-Status: GOOD (  12.78  )
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

Add support for SAMA7D65 new compatible strings in pm.c file for wakeup source
IDs and PMC.
This is the first bits of PM for this new SoC. PM depends on other patches.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
[nicolas.ferre@microchip.com: split patch and address only the pm.c changes]
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/mach-at91/pm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 6c3e6aa22606..39644703244d 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -222,13 +222,16 @@ static const struct of_device_id sam9x60_ws_ids[] = {
 	{ /* sentinel */ }
 };
 
-static const struct of_device_id sama7g5_ws_ids[] = {
+static const struct of_device_id sama7_ws_ids[] = {
+	{ .compatible = "microchip,sama7d65-rtc",	.data = &ws_info[1] },
 	{ .compatible = "microchip,sama7g5-rtc",	.data = &ws_info[1] },
 	{ .compatible = "microchip,sama7g5-ohci",	.data = &ws_info[2] },
 	{ .compatible = "usb-ohci",			.data = &ws_info[2] },
 	{ .compatible = "atmel,at91sam9g45-ehci",	.data = &ws_info[2] },
 	{ .compatible = "usb-ehci",			.data = &ws_info[2] },
+	{ .compatible = "microchip,sama7d65-sdhci",	.data = &ws_info[3] },
 	{ .compatible = "microchip,sama7g5-sdhci",	.data = &ws_info[3] },
+	{ .compatible = "microchip,sama7d65-rtt",	.data = &ws_info[4] },
 	{ .compatible = "microchip,sama7g5-rtt",	.data = &ws_info[4] },
 	{ /* sentinel */ }
 };
@@ -1379,6 +1382,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
 	{ .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
 	{ .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
 	{ .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
+	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[4] },
 	{ .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
 	{ /* sentinel */ },
 };
@@ -1672,7 +1676,7 @@ void __init sama7_pm_init(void)
 	at91_pm_modes_init(iomaps, ARRAY_SIZE(iomaps));
 	at91_pm_init(NULL);
 
-	soc_pm.ws_ids = sama7g5_ws_ids;
+	soc_pm.ws_ids = sama7_ws_ids;
 	soc_pm.config_pmc_ws = at91_sam9x60_config_pmc_ws;
 
 	soc_pm.sfrbu_regs.pswbu.key = (0x4BD20C << 8);
-- 
2.43.0


