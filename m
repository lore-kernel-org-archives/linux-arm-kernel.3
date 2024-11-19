Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DF3D591A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFuleapX7xGg1pPcUKuhRcii3jAZ6+6IOdAqXXqwpUI=; b=lN4poEzODy3MeDvycCaQriL9cL
	dyS0NOjjL35Or2ltVB+J/wneCSnPSKKjaL53MIF71UlJMBX32608Vpvv8R5MMdYJBbMD7QIHEF8H/
	qdYCQ60k6ZI6cQsQSIZDMtGA5fNtv7HX1D5rSIdVQi/ITJbA49QuLhgmV6bud9vcc0xnC8TZpelWZ
	+Aqdm6x/wImLmcegkFFF03Bo9TJeqt/Od1YLk/666BeUYuFJe+wBibqU1Rhs/OpEOLONjxaRy1vpa
	Cbexa1ltJRpNPWt1Cd/ZJE2KtO6iHH82N8RfLV1VcyLvmqOR2dqQhGOOUMUTkU4mOCWSLNbnQNODi
	F3yVamEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRSW-0000000D6dK-0xSy;
	Tue, 19 Nov 2024 16:52:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRHz-0000000D3dG-1GO7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732034479; x=1763570479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zkAh9HenNpHQuCQrbp173zO6mD0wuhiHB7XhQH3SHGQ=;
  b=VnZ/lyHJ62QOI93d8GQ+c8ogLjXKP0CsN13XNWVXx3yMiY9xO743b+tX
   BiSuFv7Xc7Zn1TpX/YbwNrSkG1VMd4h8qtRuJ8X+EPtNd0bWc6c03g454
   gh0GMqn2HgagrNimayS+k899OLJkoD43JIRzhVKdU/kHlov6AMmXOd6Rw
   lRxqaCjvwIlqlF7uWfWEkTUfjaAslYUwBdbDgIy+mC8RgWWAycZRKP9Mk
   QjyqUmkJDXLQKU7XDysNwBi5DpZHbUJsmgri5/OQ2JJYviJSL5KFuhZhB
   LofBvqAkJ8ACDESiZFZcsl8KqHd+01dn8wgp6cBBVGg/nGUL+CL4a1YW6
   w==;
X-CSE-ConnectionGUID: jnnvkeRdTYaD0RwnHEXOug==
X-CSE-MsgGUID: S7L0v21FRZOFELRzcaONHw==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="35018899"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:41:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:40:55 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:40:55 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 10/15] ARM: configs: at91: sama7: add new SoC config
Date: Tue, 19 Nov 2024 09:40:16 -0700
Message-ID: <4c7750b6f29b4ac0e2858ac279af7548e19934bc.1732030972.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084119_405994_4212C5F7 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

Add sama7d65 to the sama7_defconfig.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm/configs/sama7_defconfig    |  1 +
 arch/arm/mach-at91/Kconfig          | 12 ++++++++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 9a5f5c439b87..417716701676 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -20,6 +20,7 @@ CONFIG_ARCH_AT91=y
 CONFIG_SOC_SAMA5D2=y
 CONFIG_SOC_SAMA5D3=y
 CONFIG_SOC_SAMA5D4=y
+CONFIG_SOC_SAMA7D65=y
 CONFIG_SOC_SAMA7G5=y
 CONFIG_SOC_LAN966=y
 CONFIG_ARCH_BCM=y
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index 1a2e93c8ee71..ea7ddf640ba7 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -12,6 +12,7 @@ CONFIG_EXPERT=y
 # CONFIG_IO_URING is not set
 CONFIG_KALLSYMS_ALL=y
 CONFIG_ARCH_AT91=y
+CONFIG_SOC_SAMA7D65=y
 CONFIG_SOC_SAMA7G5=y
 CONFIG_ATMEL_CLOCKSOURCE_TCB=y
 # CONFIG_CACHE_L2X0 is not set
diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 344f5305f69a..b64d0db4bce7 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -58,6 +58,18 @@ config SOC_SAMA5D4
 	help
 	  Select this if you are using one of Microchip's SAMA5D4 family SoC.
 
+config SOC_SAMA7D65
+	bool "SAMA7D65 family"
+	depends on ARCH_MULTI_V7
+	select HAVE_AT91_GENERATED_CLK
+	select HAVE_AT91_SAM9X60_PLL
+	select HAVE_AT91_USB_CLK
+	select HAVE_AT91_UTMI
+	select PM_OPP
+	select SOC_SAMA7
+	help
+	 Select this if you are using one of Microchip's SAMA7D65 family SoC.
+
 config SOC_SAMA7G5
 	bool "SAMA7G5 family"
 	depends on ARCH_MULTI_V7
-- 
2.43.0


