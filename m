Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791BEC83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0o3ZpWxtZvYJQQGhpqTBpq+m/IPV00LyVOTLAYt/dNs=; b=iat2pl+kAdk+FV0vHHj1LDpVg1
	MHlX2xXtkumSdQN5WackHnnG+RQzs8T0mKXxJdzgoKD5SdgicTSS5giRbX9O9uGThkOCVQd2UAoiN
	EQ3TzJAAqPJ6FGrwNMGvgGXkEAd1+yYsgLhgv8003mU5W1bZxiHoKIyzOUqP7g6aoPYasZJrb2Vht
	047Q1YY3r4WbNmJzx7GRuRh3CZ/rXF+UeY+VbXwXlthv8lTmFdpl74X7RY8TdTuFBLx2EBmNylUCr
	2p7/fGNqqa8n7d0BiUpBg+2OwZ2weWcDvw3DSfngj/FY96+Jvg1lv044SnWtdveFK7E1l3XxTvoAT
	5zNx3C2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZn3g-0000000BFIJ-0YDv;
	Thu, 10 Jul 2025 08:55:24 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZls7-0000000B2TZ-26Jm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0o3ZpWxtZvYJQQGhpqTBpq+m/IPV00LyVOTLAYt/dNs=; b=Z0hwItwDzqmFgHbUrDa6tgxHKR
	+uphq1RFa+XCKba7eej/wUQe1HRPD2S6lVLmlmkZpAk7LZ4mZYo59GpsDvx5f8wGcC4hjJlrwD9Ud
	vtJSQJCiMG1Lmt5sc3g7rLJMnvL4ajOGw03JbS/wewlTYTLbQfefTjuMKSL1KU1eu/wbIJZM+G7J4
	bgzd79vC8pySjEfhTbOxK9DurYCSAmWP8jrVtlfgB1tZUE+ea6Tt92CySt9SNzch+oOVnsTamgNl3
	gKVWYWkttMOxCAZIwyCtG9X8D7YxCoT5OHctUe97Arhvr0LsP6MHyirANlgdd5/DP5cTT+V/JsUQz
	pBRnH+pQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:48064 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uZls3-006IV5-0e;
	Thu, 10 Jul 2025 09:39:06 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Haibo Chen <haibo.chen@nxp.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de,
	andrej.picej@norik.com
Subject: [PATCH 1/2] dt-bindings: iio: adc: imx93: Add calibration properties
Date: Thu, 10 Jul 2025 09:39:03 +0200
Message-Id: <20250710073905.1105417-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710073905.1105417-1-primoz.fiser@norik.com>
References: <20250710073905.1105417-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_003911_998150_18606B14 
X-CRM114-Status: UNSURE (   4.94  )
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

From: Andrej Picej <andrej.picej@norik.com>

Document i.MX93 ADC calibration properties and how to set them.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../bindings/iio/adc/nxp,imx93-adc.yaml       | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
index c2e5ff418920..d1c04cf85fe6 100644
--- a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
@@ -52,6 +52,27 @@ properties:
   "#io-channel-cells":
     const: 1
 
+  nxp,calib-avg-en:
+    default: 1
+    description:
+      Enable or disable calibration averaging function (AVGEN).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1 ]
+
+  nxp,calib-nr-samples:
+    default: 512
+    description:
+      Selects number of samples (NRSMPL) to be used during calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 16, 32, 128, 512 ]
+
+  nxp,calib-t-sample:
+    default: 22
+    description:
+      Selects sample time (TSAMP) of calibration conversions in ADC clock cycles
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 8, 16, 22, 32 ]
+
 required:
   - compatible
   - reg
-- 
2.34.1


