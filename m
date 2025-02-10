Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1999C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fESwh8O8vaEl8BhgmSPnEMGy51X2zMaxvrq62LK9Wgg=; b=3CUdkoLKTi0UqY+WnhWA95jqLZ
	i8DFxp+898+PczweE+2b1Q0840ZnzvHtVvf0ds3lCecv+EscsDs6vKHwE5m/Ht0PeFW37tIg1g5qY
	y7hlkG/TVu6FhH3kMdqpnCCucAiBscu2VMB6s9uY8YGB6crfz8qd4X/qtg0NZf87+1X1dm8hoPLef
	uklZt42rtzdfl0+WFE5x0wO9ljxtNggt1SWYhuMjXrGl4zXKmZfkd9crvCFiROS5ZnP58Fxxp1Gf4
	Uf9ZYPrYoaXb1HcnsffwChGCCpKnxKYMGw+Gnh0BqXM8du7sVzpY9/9CiPlbW1i9VXOQhnf/f72JN
	Wg2VK4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcSP-00000001h8x-3z1J;
	Mon, 10 Feb 2025 22:40:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6X-00000001SUf-3phz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222049; x=1770758049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vVcwZO42JPNUOdcIsOkBSUgYQfQ7lZG5absw3HX57CE=;
  b=lpeKFK5AnMfacJoQsl02kzp6ESTZNVO4r09WnGDygb59emiBKbF5SSIA
   /NssGmmEp6z5g8ey2DNFJspKuDVDngc1vqWrOf8Pld3HvQmety/gwTp/N
   T5hyq5bITZFYwhNGmOwsWHO1HovBhZgX/Yp5fVzhYGO8ZJn1t63Ad7gOA
   0lbscW0ZtH25dKa03IzEtthDEFXCHFy50KMQ9mH2znvZUD2MaEFlQKXyl
   DUTuUyQnM5BntIFn0kiJGMAHIiajW5Pp3oT8usnkmWh34s1ZUqZISxBHY
   sjp48p2sESBCNqeUwyZP0biskbeJsariNRwCU/Evl6bkmRK6qh2xnkR2R
   A==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: wAxkISw7RgW1cXiYsTRZ6A==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027978"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:46 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:46 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 07/15] dt-bindings: at91rm9260-rtt: add microchip,sama7d65-rtt
Date: Mon, 10 Feb 2025 14:13:07 -0700
Message-ID: <b437898b518910a2f94f7d827608db35e82c5828.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739221064.git.Ryan.Wanner@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131410_013597_D96882D0 
X-CRM114-Status: UNSURE (   8.09  )
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

Add SAMA7D65 RTT compatible to DT bindings documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
index a7f6c1d1a08ab..48a2e013a6b24 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
@@ -23,6 +23,9 @@ properties:
               - microchip,sam9x60-rtt
               - microchip,sam9x7-rtt
           - const: atmel,at91sam9260-rtt
+      - items:
+          - const: microchip,sama7d65-rtt
+          - const: atmel,at91sam9260-rtt
       - items:
           - const: microchip,sama7g5-rtt
           - const: microchip,sam9x60-rtt
-- 
2.43.0


