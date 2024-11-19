Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEC0D4922B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoybmkSvArWSCaYJGRgHWKY875PYokVmxA7zgdGNzuI=; b=rxPgZ8jrsgP74qEggXomrnxnDk
	/pa7eQVKKwRHM2BqmTUhcW6a00NaIHogLN62Dl1WBP8qJIURMyxaE/Vy0IO1EgQQY/dThL1mw0zMZ
	I1r+1bZwGPGhxvokQkOIRLdSquKL3/R4sJYiPxgxvHyg2KuT22J3HnipljTD3OVYkBE3yjY8uV+RF
	Zq64kVgXQRNKQzx3q+U0bsPyWlfKiapDFb1GuEKvs1fHQbR6LaUe7wyX8w+PbHwqeeMyLEWnl5J6l
	Je2b0PM4Vr3hgzhtRk2ud8tpX+Z9rWvk6p1J7dARXw8OvWPzVxV9MybYnzaLFTwSj9Heh08Qoq1TE
	2spvHxIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDROs-0000000D5jd-2KWq;
	Tue, 19 Nov 2024 16:48:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRHx-0000000D3d4-1uMg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732034477; x=1763570477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D1w3fbm8e3Es3RxtNnaQAKzLQacCVlrjQpY190KB4GM=;
  b=PfuGkhOW/JERyVl2aE2rXpMJtrGRu/LzFH9TAIMo33ktFJLCUf1glNvB
   aGqgGjC4v73XwTer+fowneINZ0HKiChG7In/DNvnwItQ+t+vbZN+iEvfH
   RDneO3k/OCuCbUCGwQmSHnvBLPBJl1xaQNB/2RMAgy0MYYHjlt70AoZ1V
   VUfbWe716kqazABBnhq/l/T842yOaOuMUrUZEUesH1/C4/IkweE6GmJyT
   Yp0QQjhBShxlBLxhhqHfrv/LwDk2nr3p0uQnp1EfQd7/9MrL2bsWYFAZ8
   WWl58nWto9o/j6jRvGq8W00oh0D5U0zdr1r9O+FQW6lzVJH9Y/hWhC553
   g==;
X-CSE-ConnectionGUID: jnnvkeRdTYaD0RwnHEXOug==
X-CSE-MsgGUID: oiUv6abVTZSVzBcuRfkPEg==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="35018894"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:41:14 -0700
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
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH 07/15] dt-bindings: clocks: atmel,at91sam9x5-sckc: add sama7d65
Date: Tue, 19 Nov 2024 09:40:13 -0700
Message-ID: <6f74c94a16c71c5ec19c71eea7779905642ab1aa.1732030972.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084117_564293_A5E99DD7 
X-CRM114-Status: UNSURE (   7.79  )
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

Add bindings for SAMA7D65's slow clock controller.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
index c2283cd07f05..d4cf8ae2961e 100644
--- a/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
+++ b/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
@@ -20,6 +20,7 @@ properties:
       - items:
           - enum:
               - microchip,sam9x7-sckc
+              - microchip,sama7d65-sckc
               - microchip,sama7g5-sckc
           - const: microchip,sam9x60-sckc
 
-- 
2.43.0


