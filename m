Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405A6CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ChGcUMBaiofgy6RHomKwj46vWUDt+kAymAx0nh2fFwI=; b=kSZfQ/fp1YpbRTjkXA6YkIN3jQ
	b1yLvGw7fwx9M8ZooqhceLpuENM132g3pjWOga+z/ycD9aCT/lIsyOkVGjryTNJ5IRJNUPc2EfKhP
	nRw/CN3dAOOVSb24hYswuoaehb024vdaXFdYfMU+98E1/HXoGtXJ8FJxf3uVZLAR4GunmOI2j9/Bc
	FcvNMiZzAi285glpOjNS1l0kQTkb1RrOeJD7DECxp1SunqPl3xkqQ73R/C5CFdYPz6k5rhp0wDpSb
	KQvXecMSW8G1uBSGw90TlAb3SrX4I8m0Ca6yLjslcn3Z6Hqa7kfhY88eS3ubA5KmYWtkoKfw6IDTf
	VyKuJ7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUt-00000002Jz9-2xw3;
	Fri, 05 Sep 2025 14:33:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSdA-00000000hjf-0Rjp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757064076; x=1788600076;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3wlQplHKoQ+m8+l8Ds1tA3KMLL8GWFA9HaRZhemqOdU=;
  b=WuaVho8s6s5Bzm9TDecQWZ71fVm563LTWB9l7nO1CqWi9djiaRqjc/pZ
   ik9IP0H78L3bEyQaC2NvjwW+9k5PmFJz59SbBxrfrusk3L3BmV+WTCejt
   Y5oB6/HQZgUN4xZwVR8YD0jSK/gIMlpXYr6miG8YY7vwybu0SKd4D7JrI
   q3wjny53jsD5Z8A8wQjBrHlaHZw3ArIA83+tZgpctSOfrxNCL3EI1+Yx7
   idpj4GSJePCaY/1VSLFZ2mKMSA3ij05BlIejqDFpS9/ug3VEkrl1pfZ99
   ZQjNz9Dpz7tCs8bd8dgeInIoAq6Oo2IAHdWZ0JeNPKuABuh9Gt5Q8dEKU
   w==;
X-CSE-ConnectionGUID: TCGxiWdGRGmXVlKQMbRlFg==
X-CSE-MsgGUID: E7XpECVTReeMFy9O5WQIBw==
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="277490372"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Sep 2025 02:21:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 5 Sep 2025 02:21:00 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 5 Sep 2025 02:20:58 -0700
From: <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: Ryan Wanner <ryan.wanner@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>
Subject: [PATCH] ARM: dts: microchip: sama7d65: add uart3 definition for flexcom3 peripheral
Date: Fri, 5 Sep 2025 11:20:44 +0200
Message-ID: <20250905092044.25429-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_022116_396617_C5D1986E 
X-CRM114-Status: UNSURE (   8.31  )
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

Add the definition of uart3 at the side of i2c3 for flexcom3.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Ryan Wanner <ryan.wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 84bac1d29421..9f3340c4ccf4 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -506,6 +506,21 @@ flx3: flexcom@e182c000 {
 			#size-cells = <1>;
 			status = "disabled";
 
+			uart3: serial@200 {
+				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 37>;
+				clock-names = "usart";
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(12)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(11)>;
+				dma-names = "tx", "rx";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				status = "disabled";
+			};
+
 			i2c3: i2c@600 {
 				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
-- 
2.43.0


