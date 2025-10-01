Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165F5CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 18:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Eih+Gvrl/V/M1VLTYZoN9wZ1OWt0+vDKt9t9071sjq8=; b=iaKYLs5KELNdmKNSsmwr0umoLn
	YK3tWu9RbIKvCg/94MRhJktV8mqQGrs46QQ3TfxvlsaJmI3UFq3/8giOynUr+GIqH7LQ6yU/up1BH
	MibR53VFGZ15S2wEPPN5AShL0cRNegobPvSemZIhppvEa5Un8vw/x+fWy/HwBmHraBgmSNLQNaN8E
	gkD5fN1X4wOQyQ2bukYAOxQ2YBtdxpa7kVzskSLm3b3u8CLAg91/HFzXSLhC5Y2d97S8f+8NgCYuM
	I5EDPU9TGbcpJ/Hm361eOmP+/NGY/B5kmyJtdwVhwU6WU5Bcu8AqAMbed+LwbUUzmx62hPhOLakh4
	QfJ2Ef5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41ft-00000008lfS-26BS;
	Wed, 01 Oct 2025 18:35:37 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41fr-00000008leU-166C;
	Wed, 01 Oct 2025 18:35:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759343728; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GO4M1NUWW6TWSbDNpVVaR40eptHIMXCdh2YjC997tWUHghEYAviXb7B2JKiHPx6ak2zqbvcohnzvplGJ0yiSZHZ5PiNeTAqXhZ74jQM4eiuy8ET7BrITFys0Mw3euZHo721CFIwsHdO5OdF3WiVHzIsf6aIx5jOZDyyW+kgLg1s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759343728; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Eih+Gvrl/V/M1VLTYZoN9wZ1OWt0+vDKt9t9071sjq8=; 
	b=HxL6LvSjBZX0g6EJdxuatweoVCdWVSedspO8pUQ0LceXTUsGP2xbBOpWIwTxNFt3dR7t3c60oQ/qVfHc955QgrNAJnJ7yBuu/ppOc9Zoxc1OvJR2h58LhFp5pRxZJf2A8eQsLr8EguO4SCxvwd6FN8z80LERLbeFK/H7uzyRv+0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759343728;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Eih+Gvrl/V/M1VLTYZoN9wZ1OWt0+vDKt9t9071sjq8=;
	b=Bus2fud+WrXA21LkdBDB7ozBil6sVjRukemB2tKN9DqEPvcIj4itNHtZuQYhDxpy
	E2AnanCOAQzgGPBM2OGiSOUh2voGxTwx2Ti521mKjUQ6Dde3GKUxorirWs7TqkqTIkk
	DUgWf5zeUMJpbH0VWTOwgcR9DHPrh2bECZGCOOHA=
Received: by mx.zohomail.com with SMTPS id 175934372619585.09151494021478;
	Wed, 1 Oct 2025 11:35:26 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	matthias.bgg@gmail.com,
	robh@kernel.org
Cc: devicetree@vger.kernel.org,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v3] dt-bindings: ASoC: Convert MediaTek RT5650 codecs bindings to DT schema
Date: Wed,  1 Oct 2025 15:35:17 -0300
Message-ID: <20251001183517.83278-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_113535_339971_1E23842A 
X-CRM114-Status: GOOD (  14.35  )
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

Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
codecs to a DT schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
 .../bindings/sound/mt8173-rt5650.txt          | 31 --------
 2 files changed, 73 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
new file mode 100644
index 0000000000000..a3166cc40a206
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 with RT5650 codecs and HDMI via I2S
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-rt5650
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The phandles of rt5650 codecs and of the HDMI encoder node.
+    minItems: 2
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of MT8173 ASoC platform.
+
+  mediatek,mclk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The MCLK source.
+      0: external oscillator, MCLK = 12.288M
+      1: internal source from mt8173, MCLK = sampling rate * 256
+
+  codec-capture:
+    description: Subnode of rt5650 codec capture.
+    type: object
+
+    properties:
+      sound-dai:
+        maxItems: 1
+        description: phandle of the CPU DAI
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,audio-codec
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8173-rt5650";
+        mediatek,audio-codec = <&rt5650 &hdmi0>;
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_i2s2>;
+
+        mediatek,mclk = <1>;
+        codec-capture {
+            sound-dai = <&rt5650 1>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
deleted file mode 100644
index 29dce2ac8773a..0000000000000
--- a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-MT8173 with RT5650 CODECS and HDMI via I2S
-
-Required properties:
-- compatible : "mediatek,mt8173-rt5650"
-- mediatek,audio-codec: the phandles of rt5650 codecs
-                        and of the hdmi encoder node
-- mediatek,platform: the phandle of MT8173 ASoC platform
-
-Optional subnodes:
-- codec-capture : the subnode of rt5650 codec capture
-Required codec-capture subnode properties:
-- sound-dai: audio codec dai name on capture path
-  <&rt5650 0> : Default setting. Connect rt5650 I2S1 for capture. (dai_name = rt5645-aif1)
-  <&rt5650 1> : Connect rt5650 I2S2 for capture. (dai_name = rt5645-aif2)
-
-- mediatek,mclk: the MCLK source
-  0 : external oscillator, MCLK = 12.288M
-  1 : internal source from mt8173, MCLK = sampling rate*256
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8173-rt5650";
-		mediatek,audio-codec = <&rt5650 &hdmi0>;
-		mediatek,platform = <&afe>;
-		mediatek,mclk = <0>;
-		codec-capture {
-			sound-dai = <&rt5650 1>;
-		};
-	};
-
-- 
2.51.0


