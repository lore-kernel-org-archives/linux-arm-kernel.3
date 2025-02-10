Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3DFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLpn7OKpjSGv0GHdqE0GlzDHZSgbwD7GxGNU5b/anus=; b=3OoQfHmVMMWLuRyR+3l9LrkoeE
	Kpiaw0c27Z0GiL2UkpISOd5Wls8Rux8IxRVk5hM0LPRRotZrYlgcDjc+cV3Ym3hfVHucpxqmLMtJp
	iFHj5gb+dvH3dNOj6FOs7DYDK1sCKdft/rvPCC5bKDa3TrDSpVJzXLrnNj5amsZEb+zs2CxKIBOrA
	D5RyFoFODNF3j2YeDxJ2vbssnB9RAEzuhTneEnPbYceCTnspapbGpm4+8R5jS/q9bRI7qWj5nOBuq
	8+TFoasoEbBDYF6dkZzD3vCY9v9z4KZKN8mzJzU33p4Htc5xzn/gpPscKMhWjIbhuzks5SJO1KcJz
	5tRUm2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbRH-00000001VCo-3IJM;
	Mon, 10 Feb 2025 21:35:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6Z-00000001SUf-0UiT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222050; x=1770758050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ra5cczy2T9srGqcmVgZ34zeo0dV1uQabrc8LGOPcaQM=;
  b=PCKMY3KGNwnWjciFC6Emc+iIqnKxfvivVTJUSDFPX6cd8gtcq0ZIZ9Fi
   HhEmYkmrETDGU7lBsqQQsDatmyXKLQn9zR7QYC6xVBulC/+wP6i/JxPzj
   KqBSBs0m0kK3yuq+BdiJ/stBGgY3avKVpbfP/VeYyN0+Ku7VbJi34FlP7
   ZY9n6WsQmtPF96BSlFjtnIYJg+MnoikP1K3fsaN3WhLZfATrpGaLYSgYb
   Ok5t3YzHyvTU7PNh2EcAsIeOEU/Kpvuwe8N53+n9xNusc4dENOBKbX2+S
   mHQbsL8d6lgCD7vFfQ/qgjK6Uja7g0ISF0MLH2ttMG7NwMD73Xzz5upmG
   g==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: 5qUHIY5QQx+D9awYMGeWFw==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027985"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:46 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:46 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 10/15] ARM: at91: pm: add DT compatible support for sama7d65
Date: Mon, 10 Feb 2025 14:13:10 -0700
Message-ID: <a35bf7aece5f43f2517f2a4082160f47ef2acb32.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739221064.git.Ryan.Wanner@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131411_220099_0C7650C0 
X-CRM114-Status: GOOD (  13.08  )
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
 arch/arm/mach-at91/pm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 6c3e6aa22606f..1eec68e92f8d8 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -222,13 +222,16 @@ static const struct of_device_id sam9x60_ws_ids[] = {
 	{ /* sentinel */ }
 };
 
-static const struct of_device_id sama7g5_ws_ids[] = {
-	{ .compatible = "microchip,sama7g5-rtc",	.data = &ws_info[1] },
+static const struct of_device_id sama7_ws_ids[] = {
+	{ .compatible = "microchip,sama7d65-rtc",	.data = &ws_info[1] },
+	{ .compatible = "microchip,sama7g5-rtc",        .data = &ws_info[1] },
 	{ .compatible = "microchip,sama7g5-ohci",	.data = &ws_info[2] },
 	{ .compatible = "usb-ohci",			.data = &ws_info[2] },
 	{ .compatible = "atmel,at91sam9g45-ehci",	.data = &ws_info[2] },
 	{ .compatible = "usb-ehci",			.data = &ws_info[2] },
+	{ .compatible = "microchip,sama7d65-sdhci",	.data = &ws_info[3] },
 	{ .compatible = "microchip,sama7g5-sdhci",	.data = &ws_info[3] },
+	{ .compatible = "microchip,sama7d65-rtt",       .data = &ws_info[4] },
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


