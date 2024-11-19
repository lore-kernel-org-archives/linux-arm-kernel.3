Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2301D4922B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvaRr9znCADbtiPadU2+sDk+VktSAqiDZHsdJjsOKCQ=; b=3Vi358BPSlR5AwF0KMN1/jO0pv
	JMzXDF6PTFUcnJKH1FEOGlc9eoa18I366xnQxePQZqjDCSYv+/0O7qHgzr1kcKL1Te7WF8coEe+Hz
	tSmmzAnAXKGs/+LAvhjFIVgsRyRYvqbkOUMtjAtGwrSj0b0e8GJ2BjOX9x+0H2cBxbEMnXTRX694Z
	DGDyJNV3vKycilmiN/tv5WdUg9quYfRy0Tl9bhn6ZjlAVLepIi5HxDHVJIzeAppzq3SUyc4bp5O64
	Zecdi64lavSn3F5qSw3YB05gxAHM2bilPiUPzmVNFob2mTpaK91vuajhQ+42N4f4AvtLFAEZ2PRkE
	/jhK06Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRPn-0000000D5xL-0hMZ;
	Tue, 19 Nov 2024 16:49:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRHx-0000000D3dG-1O5w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732034477; x=1763570477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r6DfrRrJUz/VWiH9PRUStqLSEGDRHm/bFZV1+oMNT70=;
  b=sWSUYqhfha9cgP3DH7yVFP4luCYp9eNM1gQP38oYeoWxq2mVLlCmy3Zk
   lAnbJKT4uaV6BO926a/QQqeQNmEjqarNd1n5n8lk9WjGA7eGisv36CAvB
   +OuEYMvDRuxyNROcJ53+cxnlmKLuKfyeYgBYe/bNf7nlVo81lTH5ZBqWP
   9uHtC5IB3HTx+4Njvpwsr2AoCxAlj9t2+L3F/18LAHK9cT1vgT7a1YZSi
   2fyFQM8WREUuFOkEPVuJyaPLorohSyEhxcGo8Kl7pkfUQn86o8JCQniKL
   QtD+b3Mru6C0V1XSe5l31eSSCTwI7pTOaNOWy4/Yes4STc+MG5Rigqg2j
   w==;
X-CSE-ConnectionGUID: jnnvkeRdTYaD0RwnHEXOug==
X-CSE-MsgGUID: PIsdtI58TTS6LHqafY9Rqw==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="35018893"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:41:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:40:54 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:40:54 -0700
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
Subject: [PATCH 06/15] dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl
Date: Tue, 19 Nov 2024 09:40:12 -0700
Message-ID: <169212d1c028170fa0f3c016a9bbea14d5f3be82.1732030972.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084117_435705_BC66B5EA 
X-CRM114-Status: UNSURE (   8.83  )
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

From: Dharma Balasubiramani <dharma.b@microchip.com>

Add pinctrl bindings for microchip sama7d65 SoC.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
index 774c3c269c40..a7d7d2eaf10f 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
@@ -6,6 +6,7 @@ configure it.
 Required properties:
 - compatible:
 	"atmel,sama5d2-pinctrl"
+	"microchip,sama7d65-pinctrl"
 	"microchip,sama7g5-pinctrl"
 - reg: base address and length of the PIO controller.
 - interrupts: interrupt outputs from the controller, one for each bank.
-- 
2.43.0


