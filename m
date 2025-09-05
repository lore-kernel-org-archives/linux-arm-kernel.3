Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86A3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ln8P+DHAxBwCpQDfGzLne0u3DWsqU8bYXaDKc4isJY=; b=GwcfvHHZwqVODtIqVua5Im7LjL
	cnukNc5juY7spmBfvwxIdC0QSqKxFYUeDOes+WFo4EechqIYQfJ4weF6lCfahjyrH7uPCB89BVsxt
	tUZdkzLUvXx6nWwdREEJ2qwK/x5P8jDPZKdbkahIcSj44ZZYiVqxNNdBoeF+dpBvairPgVA6AvAe5
	UYnGoOZdCtu9uVJOGgUGQl8xusH+7UjhOf3To57OhxjBDOa+FxcPEZXpbT+WrCdo+vGKK39duk212
	arE1RNHBAmnrKYaeKG/CqmHspcWJk3Tupd1oNAHitU0g8VX37WcFehLDwFYub9hmqtqBI81R49sGL
	UvjZLDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXW7-00000002Lg0-2tES;
	Fri, 05 Sep 2025 14:34:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSwt-00000000oIK-1jOc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757065299; x=1788601299;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uxBvIG6JS93Piz5bucjuuXb7Y1x/9XP0tXEguRFykwE=;
  b=ZYOvXMG755Aif55kO3/13+hJtcH0O6ijkigYUxvde4TBiMVrRpSvEDC8
   ZLLWSEB4M3mrWOeExHLyno2NC7dzHFpb4EqjjMbLTG8eCj/1x8cC3AwIC
   6rYCa9T/ygD9EOVlaKUc3wxVHwtC0YPkx2DH2fsqUc0ak9H0hooiG5Qd8
   twG1wKN1HVfAkd6mZ4yoOOEz5BD1AqBFCYRfBpjpXteOIJTNp88nGPMOh
   aaz3ayz2U7A2s/lxXkSPtoLMaLvfZF3Pb8yTtnin66aF6v6GypWBkzWcH
   QS4teNS9de2ao4QOALRdMfvn/4SSEnsmYHGz0/6m+b2y8kNR9hvLCj1KA
   w==;
X-CSE-ConnectionGUID: V3vcaq34T5mcK/flcDdNQQ==
X-CSE-MsgGUID: o6GtJDsEQ62AaBY3LPcuLw==
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="46672956"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Sep 2025 02:41:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 5 Sep 2025 02:41:27 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Fri, 5 Sep 2025 02:41:26 -0700
From: <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: Ryan Wanner <ryan.wanner@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>
Subject: [PATCH 1/2] ARM: debug: at91: add UART0 for sama5d2 DEBUG_LL
Date: Fri, 5 Sep 2025 11:41:11 +0200
Message-ID: <20250905094113.27480-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_024139_509964_42B651E7 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Add the UART0 that is by default console on some boards
like the SAMA5D29-Curiosity.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/Kconfig.debug | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 366f162e147d..c941adbc850b 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -174,6 +174,14 @@ choice
 		    at91sam9263, at91sam9g45, at91sam9m10,
 		    sama5d3
 
+	config DEBUG_AT91_SAMA5D2_UART0
+		bool "Kernel low-level debugging on SAMA5D2 UART0"
+		select DEBUG_AT91_UART
+		depends on SOC_SAMA5D2
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  on the UART0 port of sama5d2.
+
 	config DEBUG_AT91_SAMA5D2_UART1
 		bool "Kernel low-level debugging on SAMA5D2 UART1"
 		select DEBUG_AT91_UART
@@ -1635,6 +1643,7 @@ config DEBUG_UART_PHYS
 	default 0xf1012000 if DEBUG_MVEBU_UART0_ALTERNATE
 	default 0xf1012100 if DEBUG_MVEBU_UART1_ALTERNATE
 	default 0xf7fc9000 if DEBUG_BERLIN_UART
+	default 0xf801c000 if DEBUG_AT91_SAMA5D2_UART0
 	default 0xf8020000 if DEBUG_AT91_SAMA5D2_UART1
 	default 0xf8b00000 if DEBUG_HIX5HD2_UART
 	default 0xf991e000 if DEBUG_QCOM_UARTDM
@@ -1707,6 +1716,7 @@ config DEBUG_UART_VIRT
 	default 0xf7000400 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART1
 	default 0xf7000800 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART2
 	default 0xf7000c00 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART3
+	default 0xf701c000 if DEBUG_AT91_SAMA5D2_UART0
 	default 0xf7020000 if DEBUG_AT91_SAMA5D2_UART1
 	default 0xf7fc9000 if DEBUG_BERLIN_UART
 	default 0xf8007000 if DEBUG_HIP04_UART
-- 
2.43.0


