Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C0EC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YJo+5nQ0nINBNaxywSOUixu7kVY/MO9oQIxFhCicr3U=; b=Pe3Hvkewq+SgmyGiS/hdfSUSbW
	hhUhwKJn+8nRrsJO/8GKnEabmX3WSKBH45as2K1qmfUh4akTEJ9R/UZZECzjXjye0CY/PLX8KDsTs
	NczHHdPvYmixpBu4SsMhVDjH1XD6hQipHuo7/4t6nCOx2IQlCZp4I7GBlWdXNTykSzcBHNYIOqcHy
	LMpTxCSA6TnCwE8FhxESj/FMWndsntmdbTDSvOzz6YIUqof7fscQXeD0yc0GoxDVyH8n1ib6Ueo3v
	OrtknEHPmYx/r8/pgeVGxhrtXxzksA6xpRz6OhQgLioa4OuE4onUY3I+6pzDeNMOt3O/4tHiYTg4p
	lBMvMjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kGe-0000000EhOz-0hrg;
	Wed, 02 Sep 2026 12:40:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kGd-0000000EhOU-0idR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 12:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YJo+5nQ0nINBNaxywSOUixu7kVY/MO9oQIxFhCicr3U=; b=J3Aqa8BmmBMOk+dhcHBYEVvRH0
	16yNDXTpCyDPvrkYKGqlKPlhsf4I6JF7rtKs1kXywD2tAfJ4+X4PxLd7Ce40qiVcPxjzSNEFrkrtM
	WDAIlWQDoOJh3LCClkbWCdSPaotOUc6nFkgPI2pc43Vxhkp4wxVG1SghapoEGqJ7vvZOui8VwG9JZ
	U5sfpbnW0jCHEi4ANOK96KZZRnBwRnr5h8cGBXt/1HZLOyZzkED5FflkLbMSTtczJOuVMeN+z5wj1
	KAPnhqnSfd8D1p0pdqro7WTcnAXQNac7GazS4sH8tP1vo4APip1d9hQnrFp1zN0lUOpVHQGi59RTZ
	zAq+9Ilw==;
Received: from [2a00:f820:417:0:178:251:229:89] (helo=mx.nabladev.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1kGa-0000000BzdK-0ckE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:40:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9BD311CE48;
	Wed, 02 Sep 2026 14:40:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788352822; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=YJo+5nQ0nINBNaxywSOUixu7kVY/MO9oQIxFhCicr3U=;
	b=Fus7J2enwqruCRbPnjDoUUUhP40Uy3ASz92Ve/vGIRhjx2qab15DuVYHpB3yKKYvPm3vqH
	Vm676MIUl/Hou0yUJVBuS2+tCEmpu4onyCikaQYO7Hbk5qlo8FJ3EyXl2YvTNZjw1dvG5W
	rC+kTspa6YkdHr2dLx/UyTy3HdiKDXnH1xcU5bbO1HB0/AT4Ix31FXBoRd7iql6GjOz7ao
	y28MuKsc/8h3CLuFKNAnqY3y25YlYI/B16Sx5WAqkJvqEg3JmZk5nqbLDiu+6qIR8CsXfO
	nTXNoFAd9vVEffaHwqjYBzESOBb08Tmn81TVSPXtBUcOJpxgNsg0gZV8pJ2aXw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
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
Subject: [PATCH v6 1/2] dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
Date: Wed,  2 Sep 2026 14:39:49 +0200
Message-ID: <20260902124018.606544-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_134036_284176_E9086B44 
X-CRM114-Status: GOOD (  11.73  )
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
V6: - Reduce the pattern in patternProperties to match only on phy@2400 and phy@2800
    - Disable address/clock/size-cells/phy@2400/phy@2800 unless compatible
      with st,stm32mp23-syscfg or st,stm32mp25-syscfg
    - Disable clocks unless compatible with st,stm32mp157-syscfg or st,stm32f4-gcan
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml   | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe235..a559f8b03b842 100644
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
+  "^phy@2[48]00$":
+    type: object
+    $ref: /schemas/phy/st,stm32-usb2phy.yaml
+
 required:
   - compatible
   - reg
@@ -54,13 +65,30 @@ allOf:
     then:
       required:
         - clocks
+    else:
+      properties:
+        clocks: false
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
+        - "#address-cells"
         - "#clock-cells"
+        - "#size-cells"
+        - phy@2400
+        - phy@2800
+    else:
+      properties:
+        '#address-cells': false
+        '#clock-cells': false
+        '#size-cells': false
+        phy@2400: false
+        phy@2800: false
 
 additionalProperties: false
 
-- 
2.53.0


