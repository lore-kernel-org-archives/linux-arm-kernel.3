Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EA1CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OJBodSypORMXF56YwL9sPuhfgR8HpVgyTjVi4leFDGI=; b=cRAc7DCzBxCTeexJ7iONw1ueg3
	2PCSKgOzJQMbnXF09lJbLUYeOKCtozNcS0+Qy8jpkwHrZ3f9yqGuvb0BxsOdzcikIwolW1G16LMaj
	5PqfYvh34jaWtgIuFDT1h/4304WKEJMeTZ7xNxFxCRJGYuxAxbZ1JxXcNPSBn4Za5aITvDN9pbduY
	hEiTLJHK4pMpjEYpZJ5F+Mp6KvQkQEsd/ganpRJjh+cvpj769VE6UQ1dfroM3d2Jw8w8to8CayTf2
	sfbCKO0oUCqLPCJ0t/oicXQXXNNbmv5RTjY1WCj9eKpANYONzg1a73qCoJ3LdQlwlRt602FEHzwmU
	GsZazdjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAHl-00000004ikG-0Ij1;
	Mon, 15 Sep 2025 14:34:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAHg-00000004iiI-0W44
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757946864; x=1789482864;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6G5vs2cyxeBTHwZWABgSNrCBXx1XdkeNKjCIKpoDxFQ=;
  b=yX0e8c3/7hUAaVv5EcrvopniABfhL0jlBZxNByumHsPWOJhgG8jlNYZs
   Og4E+eTb/LpXKy0C8mOXvgqK0hbIWnKMHQJ5QY1H5XE3bSbClTCxIYI8e
   na4JQAnTUy0cx6HVldYbZpPzL9D5I9N6dPerSYxcwAzBW2lQPm5aJFHfP
   ZG6tzEXABs7w0vdOGR4WkWIyyKT+D8ophgPbQ2hHgyVXOyYRpXhRDyCTk
   0fkxAj63oS8IN1FYepANMPm0ssUjCD6KWA3mZ7jsP8lUsnUTAbNtNsnIO
   JjTASsMirJ/LRzCbWhPTJQ/FrTD82sCrX22D3V4ziW9mQ/MYYjYWJZ/LV
   Q==;
X-CSE-ConnectionGUID: DF1M/GhBQMGN2tUVc32rVw==
X-CSE-MsgGUID: XRRqoovgT3yxUJMX9QI+Jg==
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="277891866"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2025 07:34:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 07:33:55 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 07:33:53 -0700
From: <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cristian Birsan <cristian.birsan@microchip.com>, Ryan Wanner
	<ryan.wanner@microchip.com>, Varshini Rajendran
	<varshini.rajendran@microchip.com>
Subject: [PATCH 2/2] ARM: at91: remove default values for PMC_PLL_ACR
Date: Mon, 15 Sep 2025 16:33:45 +0200
Message-ID: <20250915143345.18998-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_073424_192205_08C82676 
X-CRM114-Status: GOOD (  11.24  )
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

From: Cristian Birsan <cristian.birsan@microchip.com>

Remove default values for PMC PLL Analog Control Register(ACR) as the
values are specific for each SoC and PLL and load them from PLL
characteristics structure

Co-developed-by: Andrei Simion <andrei.simion@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
[nicolas.ferre@microchip.com: fix pll acr write sequence, preserve val]
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 drivers/clk/at91/clk-sam9x60-pll.c | 7 ++-----
 include/linux/clk/at91_pmc.h       | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index a035dc15454b..3dc75a394ce1 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -103,11 +103,8 @@ static int sam9x60_frac_pll_set(struct sam9x60_pll_core *core)
 	    (cmul == frac->mul && cfrac == frac->frac))
 		goto unlock;
 
-	/* Recommended value for PMC_PLL_ACR */
-	if (core->characteristics->upll)
-		val = AT91_PMC_PLL_ACR_DEFAULT_UPLL;
-	else
-		val = AT91_PMC_PLL_ACR_DEFAULT_PLLA;
+	/* Load recommended value for PMC_PLL_ACR */
+	val = core->characteristics->acr;
 	regmap_write(regmap, AT91_PMC_PLL_ACR, val);
 
 	regmap_write(regmap, AT91_PMC_PLL_CTRL1,
diff --git a/include/linux/clk/at91_pmc.h b/include/linux/clk/at91_pmc.h
index 7af499bdbecb..d60ce9708ea2 100644
--- a/include/linux/clk/at91_pmc.h
+++ b/include/linux/clk/at91_pmc.h
@@ -47,8 +47,6 @@
 #define	AT91_PMC_PCSR		0x18			/* Peripheral Clock Status Register */
 
 #define AT91_PMC_PLL_ACR	0x18			/* PLL Analog Control Register [for SAM9X60] */
-#define		AT91_PMC_PLL_ACR_DEFAULT_UPLL	UL(0x12020010)	/* Default PLL ACR value for UPLL */
-#define		AT91_PMC_PLL_ACR_DEFAULT_PLLA	UL(0x00020010)	/* Default PLL ACR value for PLLA */
 #define		AT91_PMC_PLL_ACR_UTMIVR		(1 << 12)	/* UPLL Voltage regulator Control */
 #define		AT91_PMC_PLL_ACR_UTMIBG		(1 << 13)	/* UPLL Bandgap Control */
 
-- 
2.43.0


