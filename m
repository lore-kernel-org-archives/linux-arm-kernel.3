Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424E8C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 22:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrEtaMorONasL+xKVAUDXEGDH3XyRNaAVHeMM/l/WEU=; b=XpWm4mjxhfygK8fJ3SLIp2FGXc
	bje2F+tTCVlsH0nQZQL8YYY287hJ5HNbZr+QWdkr7QK2vDsSxKZYCRLOzIgG/jGZ6QBjsHIcMAGRQ
	Ru2okTNXrBLdM5O9QLr2D6oTAilmzETn/NeyfW+OsT3yVw3bc0p/tLpJfTiVGQTY3L1ASYBEnn6Bn
	E0EIPVPkqOsmDVY+RvcS1zENpYR1NMV+OUP+w9orrEMbLfc3/vZq72+Ezco8N58svAGvZwd+Nbm9R
	3u2RepGJpi9BSsdn037RFh3rI4qy+/sJmboCQ1Nxz1etBK2VxfLmZb0UhGNka6NYth5zcHx/2FXsm
	XMKyfH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Rqm-00000003evX-2SA9;
	Mon, 14 Apr 2025 22:00:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RZ4-00000003afr-2HSg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 21:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1744666922; x=1776202922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vnVUWi683eLAl6E3rzjUozBpg+T+n1g51iJhW+AjjsE=;
  b=CALR5QAkjz1WGe7JrQJt4svhqGsifG8zOeoKaO3l26UxowND335z4Uqf
   Atl3gATRkYpXLrskWhoal8RjhKaccHJsv6t6Q1oo04Wxodd2hvqSCywnG
   8ac9MoulYlS8AoUGElSJ4lTsNJpFYWDAv6x9CHd2zYlVjSW/jXcxU2J8i
   CLvFoltdR3DfwVebO+sWvSnT+PloFlhiZ/9e4RmNCV1tOO5Lm0srRwzYG
   Gde6UlK5tI0PqavC8F8/5pcneGcceFs3HedyPFDB/yRVzgE3aPfKYxExK
   CdwanIBVeRjWUuz0lRJKmiJdUkvbhwCw69ugRz2JAXaYcw1jqN2X8kwFU
   g==;
X-CSE-ConnectionGUID: jf75aQsXSneWELgtntpGWQ==
X-CSE-MsgGUID: P6YyYl5bShyxINJv3ViNTQ==
X-IronPort-AV: E=Sophos;i="6.15,212,1739862000"; 
   d="scan'208";a="40006676"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2025 14:41:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Apr 2025 14:41:06 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Apr 2025 14:41:06 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 08/11] dt-bindings: mfd: syscon: add microchip,sama7d65-secumod
Date: Mon, 14 Apr 2025 14:41:25 -0700
Message-ID: <2fdd14313d9cf008dbc4a63a91ba0cb5cf372ad6.1744666011.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144202_649016_1FA0C8C3 
X-CRM114-Status: UNSURE (   7.26  )
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

Add SAMA7D65 SECUMOD compatible string to DT bindings documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml b/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
index b1f766e333d4..ad4a98a4ee67 100644
--- a/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
@@ -21,6 +21,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - microchip,sama7d65-secumod
               - microchip,sama7g5-secumod
           - const: atmel,sama5d2-secumod
           - const: syscon
-- 
2.43.0


