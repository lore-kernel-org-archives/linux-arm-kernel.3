Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A398E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyBSEshlrrsFYRMt9kyqASU5iiVMyNngRHo3BzykcpA=; b=T3o1k8st4DdhU/Hk4zWgsJwcmF
	xnT4R4eKd8G9R0HSEk7+1MrD5kVFEDCglE93lXqiCCHrqO1n+G+x3mdIW1IEKWZaoinxvxZa8DTyW
	wk3Ls2bidfHO2Te2IME6fDk3r1nRx+e4Cs2/yfH0UeWudJ1mDhmhZ8374M/1RTXZOqps011RUjMDy
	TymY2N14cZj/2z62UE4q5meTw/NkRQrTe9aawmNpHGhnr/X2zYCKAhmPM7qXEe9SCxeELah3GyYYW
	imMryF+PmgCKLy2kewjqZr+Qh1Yvc0iYxzVDSgnvngnWMv18KhrJ7J6XGxgmV7EinL82Jxspl7/Wf
	oDdy9AfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCDz-00000005a2v-3aE1;
	Tue, 07 Jan 2025 16:14:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVC87-00000005Yhk-27Iq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736266111; x=1767802111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PH4rUN/rnjax/mDGGIYBtSheO/61fSdwRtwLQU4elCQ=;
  b=DVD1+IVrlaxwOKhNHqYizGkVrqgzFAmzZn0YCO00qr7UQf0QgjydO2MI
   7Q4YIsHreELT4evydsH+KI5mZcqHYt49ab5YGLfFnn7I6LN55eT6hVN/I
   ht1WTAxx6Erdqzfwz5YN9U6SXssa5t5uPIV7yg6dW91RGsOebiIonm40Z
   r58eFxeSbDX/k/U68VbreVHlYHKHqU93z02y3ZmlavK0C6JwG/gdG2o4D
   WHO4EuV+6RjSJZJgu8ZYw+wNzpR+KBGJkul3PTBNy2nwphQHoRHO9ZE1x
   IuQ4b2sCJXHp08yMSn/mIy+FUUmF1uI2rWAWKifl8ewaU5ZdxCkgwPuYR
   g==;
X-CSE-ConnectionGUID: lqpfnJzJQpCXzb9QKpQeRA==
X-CSE-MsgGUID: K4H+nriUSkCBJNw9ScA8Kg==
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="40091253"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Jan 2025 09:08:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 Jan 2025 09:08:18 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 7 Jan 2025 09:08:18 -0700
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
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>
Subject: [PATCH v5 3/5] dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl
Date: Tue, 7 Jan 2025 09:07:25 -0700
Message-ID: <20250107160850.120537-4-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
References: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_080831_549401_45E17A90 
X-CRM114-Status: GOOD (  10.31  )
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

From: Dharma Balasubiramani <dharma.b@microchip.com>

Add pinctrl bindings for microchip sama7d65 SoC.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
index 774c3c269c40..4b9f3373503d 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
@@ -6,7 +6,8 @@ configure it.
 Required properties:
 - compatible:
 	"atmel,sama5d2-pinctrl"
-	"microchip,sama7g5-pinctrl"
+	 "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl"
+	 "microchip,sama7g5-pinctrl"
 - reg: base address and length of the PIO controller.
 - interrupts: interrupt outputs from the controller, one for each bank.
 - interrupt-controller: mark the device node as an interrupt controller.
-- 
2.43.0


