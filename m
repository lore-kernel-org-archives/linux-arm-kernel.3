Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED80E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 21:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rtgxp0JK1oqLx4Lyq7A7BytfWyva/sbLTCmsRszR938=; b=jFYUO62hjicOC/s+eDGr9/cW84
	sbEvKfIuwHlptjFS3dtQvB9GifdLA5g7uHbbcE10r97aOuemuEbnolrg/Dj6drUwDScrKHATS9e5B
	khq0WyZriVZA7HpV0xMpdgEb9e/pVezYeeVjU2I38A9w9bLQtR9fLguA4kV6ijAEuUUuRpnQ9I+/Q
	bIFm8ZBAhKsccNMQypAu3suUmFrY5u8GmyEN7M5zB509m2UvRWwgcN66jDEwMugQmX18BZRfjTpat
	J7+BZ8ZqgJrf333ikwzKRXvDVvbDKZAEbn5+tmVttbR31RhQSG1LwddWgKnH8hMpSHJzw+m7vaRyR
	50i+112w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkTp-000000066iX-0bOQ;
	Fri, 20 Dec 2024 21:24:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkFU-000000064UE-1rqY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 21:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734728969; x=1766264969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TI+Fl3/fq9+Bp9S16REL62Tz0AjZCk87d4UxYP8JSJo=;
  b=ppCdu7uImjbZ1G/0MBcoyAiIlqiHM+ZWrr4Flb0Yyc8HmgSsnS17r1SM
   aaFRqw5V6QGU/xVJ3aNyyizbD/DAeAbl6a5wX9PsCWBQr1CzNIUPmR0IZ
   NvEPIdm/JnKt+sN1fS+Sj3Diu7FgGrzZrT8Cy5xFjqNrPZahmNkMQbfQh
   Lg2oV9yPFGAJ6cOQ1FMkqdhZ9OPvCLRwgRTbE5yUdCtoUlwLDaWt+Hi8o
   3jTA3r2nY+EOF0scszpuzssCXDeK9fPJtNACRjzxDf3m3d//weI4xRwrL
   8gx+ZvVeMX20IrltuBx9VrYGY5UVCHdFzhiQSHzHuyp7jWPq2d7bYyYc0
   Q==;
X-CSE-ConnectionGUID: USBJ4PpbRGWL74rt+H8wuw==
X-CSE-MsgGUID: fXYWYnuZRVu6yBH7Tr25UA==
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35811487"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:09:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 14:08:44 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 14:08:44 -0700
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
Subject: [PATCH v4 12/13] ARM: configs: at91: sama7: add new SoC config
Date: Fri, 20 Dec 2024 14:07:13 -0700
Message-ID: <ac5ee2a78309f8a21ad99f53e66206f3d163263b.1734723585.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1734723585.git.Ryan.Wanner@microchip.com>
References: <cover.1734723585.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_130928_492768_1EE7C11E 
X-CRM114-Status: UNSURE (   8.50  )
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
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/sama7_defconfig    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 758276027dbc..b1dcec1a6df5 100644
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
-- 
2.43.0


