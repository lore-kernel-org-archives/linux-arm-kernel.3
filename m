Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A25BFA3753
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 17:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zz17svZOIS5yri9Mfz7w2WHovHSiob/r56crOJNaAPw=; b=ZBNGX3/w91LUMK13xCnL+9V2y3
	XWqm/DHMqwILGXosSq828WhlhoZMYPgYXUXuE9hBZBLx+6yfqFIbKyTHS3LdEzHqS3dv1UZbWOZjy
	kO0XxnfhOYeOVYdPugQcF4IU2ZSpdc7/W8QxNF8HKGimJQcTesKodJ8h/KNnLLCRA0elKlvSb5aWC
	nyX9XDcHH1jIdtihjEYAz0xWNOWOZBBbGLgiQfwrbDfLeIrAK3P9esjSK6NHPxUavHKhTiEP7Lred
	6yda5d3A8Pmd2FH5V4G3meQd/sYPeSKBbDjCwFcuzz5PLMMbVMRjbNGKxgHH/NspqoiEvfzc5DqyN
	rlm/jonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiXZ-00000008Wmz-1qNs;
	Fri, 02 Jan 2026 17:02:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiXX-00000008WlH-0mEj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 17:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767373335; x=1798909335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UCIBeIMlpa51KZ2u7c6Wg6I0vI29KQaQ4gNKmKjxJFo=;
  b=UkNzuyqNmNg1RV+glrxRJE8twhi+c7eRT3u2TkXfkff3IAhDLOB4Bqbw
   Cn41mbRn6bMkuvolA/1fBCg7s1OnLTpgkHh1IFBT0bWQFry1BqAgaTK1j
   53PvhraOZxlhdXnkiHWYvcm0WtIj86yivmd1qEW/GWwgYT9jugvVS+i7/
   dhJM5b7qQslxqpPUBc1DR23N9y7ScG1aRwOIv1WSDH6O5JrZi8wS+wM1l
   xnKP8Ksl7VdnkePiXqPWkZtqMOW9lSN/XfTfp7cBX+EWFOsLv4tPWKoJs
   KeVyyHzen82I2trB8Y3fYzuQRxmfKfVn/iG1Vb/kaaEUJP88YPAcP7RBs
   Q==;
X-CSE-ConnectionGUID: EEzKUSBWSiqVSkiAY+YL6g==
X-CSE-MsgGUID: qsVbTFbYRmWR1u4sO4P7ew==
X-IronPort-AV: E=Sophos;i="6.21,197,1763449200"; 
   d="scan'208";a="50579717"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2026 10:02:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 2 Jan 2026 10:01:42 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 2 Jan 2026 10:01:40 -0700
From: <nicolas.ferre@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, Ryan Wanner
	<ryan.wanner@microchip.com>, Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH 3/5] ARM: dts: microchip: sama7d65: add dma properties to usart6
Date: Fri, 2 Jan 2026 18:01:32 +0100
Message-ID: <20260102170135.70717-4-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102170135.70717-1-nicolas.ferre@microchip.com>
References: <20260102170135.70717-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_090215_284237_C3EDF13B 
X-CRM114-Status: UNSURE (   9.95  )
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

Add the dma property and associated dma activation for usart6 as part of
flx6 node.
Is useful for usual default console on this product.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 868045c650a7..92d92228f0a5 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -617,6 +617,11 @@ uart6: serial@200 {
 				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
 				clock-names = "usart";
+				dmas = <&dma1 AT91_XDMAC_DT_PERID(18)>,
+				       <&dma1 AT91_XDMAC_DT_PERID(17)>;
+				dma-names = "tx", "rx";
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
 				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
 				atmel,fifo-size = <32>;
 				status = "disabled";
-- 
2.43.0


