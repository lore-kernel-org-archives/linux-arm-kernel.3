Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED84C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUjOiPvUZbBTE7tHn8uwtS6FeeRQ0GUbztROFoybaIM=; b=sUUv0KzY2CK71T/o64+K7EOK6p
	+XHWD1dI8IWqphuS9SafxTLOyDeNdDlSdAOfNI1eaUbNrs2rv8987lh5+DIYAu7IeAk3hweyTM7dV
	ott2JC0QKA2cc7QnfJDXRPb9jsTEt6nGepvDj79mO+6QeC8jdz8Bp5mvJURQZP2vGYI5ZoGmDHQjP
	ySg6gAmH8xBNBdiO5aWtsJanNNjb0ahFMVNaJg1W2lbud6LuEl1bGljkO7nTu2TYrcSSUF2kwTQSG
	B0KQ59KPgMk9FHusiYfRYFJx4UHenMTAx7ebYWI+yhtuhiu/h7C30SRETXWAVxLkZi4V2ISWfG732
	gRRnJEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDm4-0000000BQWy-2fCi;
	Thu, 06 Mar 2025 16:08:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDhJ-0000000BPeX-03o0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 16:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741277025; x=1772813025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tkTOYHY7R/B78zoatm15ZoMCaySho/QN7uoUcwZA5m0=;
  b=twx3eFOJzfOZiHVZBQY817gnirluc4SA+hTpGduqgCPoi+nleXCMifop
   T12vEJjRm0X36oCEv5L3SB0jY8MINzNZn6isCaqGH55Ec/uwvp306SYeR
   PagiGqItAhTbo5iN8iV5Om+j6EGGm7WhSf2rqMTWuzQ2AQ0PYmRu6eng4
   m/7QDLsb7W/sXFy948+g5e8R8VifOfnreSzI+0bSuZb0ii66si99Icon8
   xrvnZmukYOdL14NxxtpVKJvFFa7VyDVtt8IkdayQZr05AnHEcELsD2TXW
   Y0px5VI6zlO9XwjzIGtJxa7UkvIKDMygf5xrF0qHdhyZPVwvYT5sF+3BR
   g==;
X-CSE-ConnectionGUID: Mtzc/U5nQtqKRw1uIzvygw==
X-CSE-MsgGUID: D+4/U7qNTAm+QfzadrmBBA==
X-IronPort-AV: E=Sophos;i="6.14,226,1736838000"; 
   d="scan'208";a="269901970"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Mar 2025 09:03:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 6 Mar 2025 09:02:57 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 6 Mar 2025 09:02:57 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linus.walleij@linaro.org>, <ryan.wanner@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>
Subject: [RESEND PATCH v6 2/3] dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl
Date: Thu, 6 Mar 2025 09:03:19 -0700
Message-ID: <821255840c09d8d9cebbb1f2daaedd8a7c138875.1736522006.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736522006.git.Ryan.Wanner@microchip.com>
References: <cover.1736522006.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_080345_059527_C3DE64EA 
X-CRM114-Status: UNSURE (   8.05  )
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
Message-ID: <20250306160319.m0Xcm0aQHHnuDf2xG0D3sWh8DbTObNSYO3HLsRMhnt0@z>

From: Dharma Balasubiramani <dharma.b@microchip.com>

Add pinctrl bindings for microchip sama7d65 SoC.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
index 774c3c269c40..81a05a09f19f 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
@@ -6,6 +6,7 @@ configure it.
 Required properties:
 - compatible:
 	"atmel,sama5d2-pinctrl"
+	"microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl"
 	"microchip,sama7g5-pinctrl"
 - reg: base address and length of the PIO controller.
 - interrupts: interrupt outputs from the controller, one for each bank.
-- 
2.43.0


