Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2033C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OsrNXzQ4NnwEZq7XsvkuamMCBWqUACDmS63rgtMjAZ4=; b=CvOJWCOTgop/Ppwz8BFD1cR2MH
	/adep46/wXrUCKhP+iqZPSfnB0PMJdHGrsvenI2sxk97fPRhUWPgKIxfIH3mNRhp8AsC/mvI5a2Rv
	yBW7cOgLyFYc0A3tCO/ISuylqj5uYT04s8cEi8dRo0xz1O2sTb+0J3ZOY6VFU+JM/qlV5bx0Up9yl
	y/t7ePIYb1FJTpepjAojSSZehsB3l1zFAqutf3T5AtzhLNXk+YaLveBloXBwZ+4BhrlgGkq6gAV0Q
	47p8M8pfvw0NdsjA254XNogJ/eqEwDXc3i8m69KpHeVnaFoJfBLgCisabEKnv4NuI/AWTCK6Pmq+/
	4hFhm7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BCf-0000000AdMn-1Xs7;
	Mon, 31 Aug 2026 23:14:13 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BCd-0000000AdMQ-1cYg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:14:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BB6011C934;
	Tue, 01 Sep 2026 01:14:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218044; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=OsrNXzQ4NnwEZq7XsvkuamMCBWqUACDmS63rgtMjAZ4=;
	b=Y17bghFM8t98sSP/sTa7xOdzNYeWRt5954vWueefRkYlx1BCv86jMfmKYTlmNbb9C7eia+
	ESHplgx1pKMOB4+EB7hwBKM/3KWkUMU9orff4XoAsfuaGkGHq2qfqRUl4AM1xGyLcRXX3b
	dAr7qMpRI0kMJLB973brvVxJ7VBwFgoabXqUNz04zBBcr9m+Ovskt36egCWYdEMzJbHAT3
	EC+XCP2NUo+8QYDJ6ZzoS33cMUCwtuTxlh8BWowovwoX+cEWg10r4MOAjBg9i2NZo9BYtL
	B1/TDnHJxeeIzHV5HIa7M0gqI+i8tSaYfzZCIUvp/GAO6DRAVnJSZDZ4Lt7Kcg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 1/2] dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
Date: Tue,  1 Sep 2026 01:13:24 +0200
Message-ID: <20260831231359.136475-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_161411_654266_AC357D0D 
X-CRM114-Status: GOOD (  11.05  )
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
represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
address/size cells.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
V2: New patch
V3: Fix the bindings
V4: - Undo simple-mfd in favor of dedicated SYSCFG SoC driver
    - Update commit message to match, this used to be patch
      dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
    - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
      https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
V5: - Add missing contains: into conditional
    - Add phy subnodes into required list for stm32mp23-syscfg/stm32mp25-syscfg
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml   | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe235..2cce174004fe0 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -39,6 +39,17 @@ properties:
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
@@ -57,10 +68,17 @@ allOf:
   - if:
       properties:
         compatible:
-          const: st,stm32mp25-syscfg
+          contains:
+            enum:
+              - st,stm32mp23-syscfg
+              - st,stm32mp25-syscfg
     then:
       required:
         - "#clock-cells"
+        - "#address-cells"
+        - "#size-cells"
+        - phy@2400
+        - phy@2800
 
 additionalProperties: false
 
-- 
2.53.0


