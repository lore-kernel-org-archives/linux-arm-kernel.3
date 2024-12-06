Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E049E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PowVc5fbMkHU0I4b+buHkXV/Krjg6VUEhvJ60p9CpPQ=; b=LbUxjIvgasSPNB0e+27seqnpMk
	5yd3QFfZpWvd+j/Gp6TZ4RzJYMEMhYktK+RL1SWm2Ob/2yOafTDttsShDH+gX5ZEiIcpMjlJgsCy4
	O7nG9sFXpt/MqXkESU/zPYCdOx/euUQZn4F5dijLCXegOz+6iJjqrLEHKAC+KFqCzv5/BM6E+JoED
	MRzI4Qx1HmD8Ubl6smvkGuLWwmHmS1IcNnagZh1QtJYh0CMwdCpmcSKr2xLRcXq4a2S6e6MIPFn0P
	nElXcdw0szmdRo8liGJ71EptjzBE7GV/pcCB3PazR+mcsmBIGDAOA/mxhAofBkVdTdrkBYsPpBE/3
	yWUGaZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeXq-00000002dCQ-3M7f;
	Fri, 06 Dec 2024 20:03:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeVo-00000002cSu-2AF2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733515276; x=1765051276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h8r9pGDF0wzJx+5ny3vfVXThrQSJXbj8ubP2ksqTc+8=;
  b=pUptBXstwUKYvXvZx0x0zdivrgZJTaJrCu1MPEEvDCaLwMLuA8uoP7OA
   AtN593+Mh9s+UDUauvDO5pj4jNfeuiAscSomTeIN+OVwJyOzs7dPpIFAY
   Ibdv+BNeE3BOrXPLvfBnKVWZC4l6qZ1gnNfL3gnnViu3kc5FQEgKzQVzv
   fMbJYYi8T6UpV3YVhWCwKs4Aa9gRB54zeNPD8NJ44GzNYys6f8XquSgnB
   I15mpwBqBSnD1OekkLtmGFEBcwRBbKfhSHgf/aB6qSKOtZ4xUwkTJBtsG
   SUmVCN1NyxQIo23bcbJOvMZdzhliVMQV+3o1T+5J3RSLqejZOUsCItet4
   Q==;
X-CSE-ConnectionGUID: 9plLhrxgQXuYZUyQ8wJyMg==
X-CSE-MsgGUID: GKdtANrPRu6SvYOGXwuSGg==
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="34926406"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 13:01:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 6 Dec 2024 13:01:10 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 6 Dec 2024 13:01:10 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>
Subject: [PATCH v3 05/13] dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl
Date: Fri, 6 Dec 2024 12:59:50 -0700
Message-ID: <b41307089b72fd92f8e2d314e4750194df9c888a.1733505542.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733505542.git.Ryan.Wanner@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_120116_629548_108EC9DC 
X-CRM114-Status: UNSURE (   7.89  )
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
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
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


