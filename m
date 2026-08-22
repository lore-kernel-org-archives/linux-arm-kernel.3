Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24901C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNOxNJatK64fS21OXHPDSi5Cq6dsZkkBqZ+h5rU+KSY=; b=KLrkt2YCFXYd/O8KjCyRqOsdsR
	o4XIbGend6ggooxDEHc0YM52g7rqbgO7Jhu6Bo74Yk6MWeUBUs92lTC4AjCrbmZvyEjdpdR89UO2m
	Wtg7WMIVnkJQ/AestMoe1KypJmOY04ztu4dzF/64XQvvve3eExbqQ8efz/w93FmwIafWeLa6iFS8g
	gHOVZE9w2jpDCODxhpj8c0U9MLAj99/kBrChxprd6gQ+Iqh7LWVLUrg6ImDvofLtfXKiDyHWGUVxb
	XKOT+sh76xNbOJr2jkXCkYRDwSzcAOENdDHmFcjQUVFa4XD04wQpdlG+bLTGuQIy9xUkN5dOgccBH
	Jn7sVFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxgTa-0000000EM0b-2jLw;
	Sat, 22 Aug 2026 07:49:14 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxgTU-0000000ELuM-3d97;
	Sat, 22 Aug 2026 07:49:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00ECF11C81E;
	Sat, 22 Aug 2026 09:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787384943; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=CNOxNJatK64fS21OXHPDSi5Cq6dsZkkBqZ+h5rU+KSY=;
	b=NqIOF85+bUxXGrW7cbgMce1mZsWRA2ZoN3Lybb4lZF/EZS3A3m6OBwsnL/8c5nvewHx3mC
	nSQHlC9Nh6ons2CMccS+yjL1LvwreQIj5+yK/uhVL1DtiKsLFMWBvBvj7VNbDvI5JAiyBr
	H8EWircVL41tymdb81t44BbP2+l5ATYqV8fgY5p3ou6YO32nNeHT1dm7gWyxLlBhH5wId3
	Hf8YmHTICOBOxWV0E2m9wyBu44pMEq/O2eCBfDQicmPmlxBmpFuCPvl/6AC0TZLqp2c8RX
	9Fk55vUxs8Dse67VhKFk0sKT/NwWiPhgeJOh0iKluK9oLB/JhnOdFEiBP3A/aQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 7/9] dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
Date: Sat, 22 Aug 2026 09:46:40 +0200
Message-ID: <20260822074816.548662-8-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260822074816.548662-1-marex@nabladev.com>
References: <20260822074816.548662-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_004909_053238_0F4FBF54 
X-CRM114-Status: UNSURE (   8.61  )
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

The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
represent the USB 2.0 FEMTO-PHY. Turn the syscfg into "simple-mfd" so the
PHYs would get populated by the OS.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
V2: New patch
V3: Fix the bindings
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml   | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe235..4db4198c5dd7a 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -22,11 +22,12 @@ properties:
               - st,stm32mp151-pwr-mcu
               - st,stm32mp157-syscfg
               - st,stm32mp21-syscfg
-              - st,stm32mp23-syscfg
-              - st,stm32mp25-syscfg
           - const: syscon
       - items:
-          - const: st,stm32-tamp
+          - enum:
+              - st,stm32-tamp
+              - st,stm32mp23-syscfg
+              - st,stm32mp25-syscfg
           - const: syscon
           - const: simple-mfd
 
@@ -39,6 +40,17 @@ properties:
   "#clock-cells":
     const: 0
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/st,stm32-usb2phy.yaml
+
 required:
   - compatible
   - reg
@@ -57,10 +69,14 @@ allOf:
   - if:
       properties:
         compatible:
-          const: st,stm32mp25-syscfg
+          enum:
+            - st,stm32mp23-syscfg
+            - st,stm32mp25-syscfg
     then:
       required:
         - "#clock-cells"
+        - "#address-cells"
+        - "#size-cells"
 
 additionalProperties: false
 
-- 
2.53.0


