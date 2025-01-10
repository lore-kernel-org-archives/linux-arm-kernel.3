Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03E3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1shZjGq9vbNUWRAFYyLR1ipX4x5aIgLmRe72cEJrctU=; b=Yx1ZMSf2pG6l9jUVgkoC2KX1gm
	Q5tIdoSeBbIcCd8msHlk2ybqItK93fqwVoQa2D+3bMVn6xGHowkCXokBlOMFIBd3tUMrLwIRRoATl
	AwIqsPtk9kg5Td1o/jAUlDFgFzv3DMCLK2Bl+mhsX/VMdRLbNCxM7XRidjd8IaNsMg19OvBH0KpEH
	A62J9yKH4aPnbkUhJl/M40TAFN3F2gvW90eoYm9dDF6ztaSsmvb2iMI0RVXoqJwdHMEx4yd7ew52D
	GJoUlSK86gsLEvatnie43Dz2nD52aVSigr2hg5nYnOqo5ajpfO5gRGq9lk0LC0sGgnDltvAt4BizQ
	+exOCM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHN0-0000000G7HT-1Jh1;
	Fri, 10 Jan 2025 15:56:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGuB-0000000FutT-1PTE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736522795; x=1768058795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=So/Nxhxmf5OjkDlEr9qmVGJaHBrSosIJeOjBNusjAwQ=;
  b=keFqWdzr8o0w05HO9STo1CnhiswuJp55wKTGiFrRxH/OwaFWmYakRNeE
   EfaslkHtPhJbR4/7SAzp1ukQmrTB1mvcoUGPe1cVf1cyU0NRBT50F+jLA
   4bFWZl/hGNzwgI9UkgYrYBDBkwu2ahgT3DqEDghvj6O4Doq5ugzdbnROS
   LVDajl7DLDUjwBJlPjygT2M1lvL3l0s4pkaVyiinta054DGO+DmHr2RcN
   890k5IIEyuChyb/PBzBkXyrRcwntwGSNKIXlvZS9XJC6ZT+jXPDuXgsiK
   RGr9DAcSBvLYo/t0Djeh0xRVQK4ITg1VU0Mkty/KtjhcZ2K5xkG27lb5N
   A==;
X-CSE-ConnectionGUID: 8P7/xEcLSzCWvc1kzBnXOg==
X-CSE-MsgGUID: NBZadZqVRLuYWsu+mBbcUg==
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="40252499"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2025 08:26:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 Jan 2025 08:25:52 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 10 Jan 2025 08:25:52 -0700
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
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 3/3] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,sama7d65-flexcom
Date: Fri, 10 Jan 2025 08:25:42 -0700
Message-ID: <9656d46ee0255b9aba404d77d2d204376a9cb248.1736522006.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736522006.git.Ryan.Wanner@microchip.com>
References: <cover.1736522006.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_072635_379460_DEA7FEF5 
X-CRM114-Status: UNSURE (   9.35  )
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

Add flexcom binding documentation for sama7d65.

Consolidated entries into one enum to match proper coding style.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
index 0dc6a40b63f4..c7d6cf96796c 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
@@ -19,12 +19,11 @@ properties:
     oneOf:
       - const: atmel,sama5d2-flexcom
       - items:
-          - const: microchip,sam9x7-flexcom
+          - enum:
+              - microchip,sam9x7-flexcom
+              - microchip,sama7d65-flexcom
+              - microchip,sama7g5-flexcom
           - const: atmel,sama5d2-flexcom
-      - items:
-          - const: microchip,sama7g5-flexcom
-          - const: atmel,sama5d2-flexcom
-
 
   reg:
     maxItems: 1
-- 
2.43.0


