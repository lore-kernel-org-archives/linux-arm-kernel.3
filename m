Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAE5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 21:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8bfHfhGe9xQs4ZjJB40sNAmOuwfh3/FuJnadApF1Y4=; b=lCYVzw85B9BlNLeXaAUYrKv19s
	w6qVR4ZgJEEA1dv6JRu0QbvHQVkxjWJR7H7sdFgrrmBA1/kIQVNuyGqjr33r88yQa707TkwpTVKUi
	C+7W7of7Ucpw8HgGt7wQLOFAFC/o+GPk6h4bIei7XmmMfUyhB/qkDnn2aYDxx0rUbyyeylnfjRCRU
	It3NsRcKDjFirMCajeIfjr22IRpix1JBeFrywIgsrPs8xmlpozXfAyRoIscbh6zwMnD5H2P7ZayFq
	TspLbgVHYTjJOp0ag28BYmAC6J4alyzwpjCevygy4+nFOMI20eke7oDDdW4zqUFrurFxiZv9tfYGd
	JEQyZSUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkN6-000000065i4-0iHD;
	Fri, 20 Dec 2024 21:17:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkFG-000000064PQ-0WYa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 21:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734728953; x=1766264953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/BHeA75p2Cn+kP5cxK8MIw+VO1rDeoCRJUoghk0DRRs=;
  b=blt8Uj/dwmI0jT/3ED2ox0t8HkBQcJeC+rlz5GdXR1KrloYxBgs91DF5
   F8zkXZwaYwEjrHv6FOEYZ4w/Yu/WNGoojvDIrpL+Fkvvwsr6ViWdon0jP
   sKiEF+aLJP5xHfFxCrTHRyWEc58M6u7YhY37AmTs0fIGTCfLryzZSqa24
   S4m3ZN3ckinizFL39ieFJ+7r9gQZIezUR7hTJNrx17dsPaffnBH+3Ienl
   XACfv1WpQG85EyaRqX1Ur/cC3gM6vpw+nahdmm61uIWge/lXkFcLm4cmC
   A0SXdifccwbImvIxT0Y+zY2ikGBrJ4gMFt22baLeKvBEfcfmKgC6G7ai8
   w==;
X-CSE-ConnectionGUID: 6Xn2bQedQHqhtDmL7ky2MQ==
X-CSE-MsgGUID: Se/34m+nSA2AonXLlzKIJg==
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="203274645"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:09:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 14:08:43 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 14:08:43 -0700
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
	<conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 07/13] dt-bindings: clock: Add SAMA7D65 PMC compatible string
Date: Fri, 20 Dec 2024 14:07:08 -0700
Message-ID: <9b8db610f477d5339830d12cd44f783eb5cb16ea.1734723585.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1734723585.git.Ryan.Wanner@microchip.com>
References: <cover.1734723585.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_130914_227653_810A6393 
X-CRM114-Status: UNSURE (   9.43  )
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

Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
since the SAMA7D65 PMC shares the same properties and clock requirements
as the SAMA7G5.

Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
the clocks property for sama7d65 SoC.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml       | 2 ++
 include/dt-bindings/clock/at91.h                              | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
index c9eb60776b4d..885d47dd5724 100644
--- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
+++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
@@ -43,6 +43,7 @@ properties:
               - atmel,sama5d4-pmc
               - microchip,sam9x60-pmc
               - microchip,sam9x7-pmc
+              - microchip,sama7d65-pmc
               - microchip,sama7g5-pmc
           - const: syscon
 
@@ -90,6 +91,7 @@ allOf:
             enum:
               - microchip,sam9x60-pmc
               - microchip,sam9x7-pmc
+              - microchip,sama7d65-pmc
               - microchip,sama7g5-pmc
     then:
       properties:
diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
index 6ede88c3992d..d753559b912b 100644
--- a/include/dt-bindings/clock/at91.h
+++ b/include/dt-bindings/clock/at91.h
@@ -42,6 +42,10 @@
 #define PMC_PLLADIV2		(PMC_MAIN + 11)
 #define PMC_LVDSPLL		(PMC_MAIN + 12)
 
+/* SAMA7D65 */
+#define PMC_MCK3		(PMC_MAIN + 13)
+#define PMC_MCK5		(PMC_MAIN + 14)
+
 #ifndef AT91_PMC_MOSCS
 #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
 #define AT91_PMC_LOCKA		1		/* PLLA Lock */
-- 
2.43.0


