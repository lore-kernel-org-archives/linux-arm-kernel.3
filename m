Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E95CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Us0SdR9VkXymGZbNuZ4zsRJNiU5eRP0UPu2QfVitveY=; b=vLkVRvDkeVUzAhomM1EMlEPLJm
	gqvXtjb0XpcwjeFz0eu1nTc0pcJhSkO2kSUqvVeLGajxOspTbYI7vsi8PfKwM3Sy6guBUvoKtlePy
	C5481nJkSVu8aKvTCzEfO3F9ju1ex+9cMoHve7gBQOETF1lnqRPwoo8wKdI9al8ryz2L/UTRGVtCc
	CEoz4PSeMM1492h0xhUUmdSUc+eh9VCd022qtNIjShGX5NABQqwLp6M8datBY3NCbKx+CCHfyR7Ut
	pEpp7pZq6BhidvKaxlC8GnEdFC2imdCoGywca3P5hogCwumRtNZ3H2W3Gu5Cv69TNzJzfJ5of3u1S
	32f7DC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXXW-00000002NWJ-0M4F;
	Fri, 05 Sep 2025 14:35:46 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTbp-0000000121h-1wgV;
	Fri, 05 Sep 2025 10:23:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757067824; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fORs12r/9P+bFpGppwpXrPNY9ard+PY5cVLBuKdNL3SdN9NZBThRxBIqwBRC3RRlt9JmdS1HgWkXvVGWe1k4WvDv74hVAxzlKBp5Z17eMKIclj4g+cXgXIjTJNVO/YHOiO3dC/b7eFlPCI2Qt+8fOytzOodT60firynnIf+z62M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757067824; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Us0SdR9VkXymGZbNuZ4zsRJNiU5eRP0UPu2QfVitveY=; 
	b=iEcxPCRcnqRrp7tx8S1d9qLPnjZJL+OZkt1xQx4yq4wXFal9F3KPmLmLJYfqW81v8uF1MUKH5fZxmprzD84DMXtNTmEr7rltV0YuwodzKJfaxVECq6B5LVIyv9nuPoNqIYhzTA6dPnnE5EWvel35sIqiWVZ2HMCSJPk7JJ4heZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757067824;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Us0SdR9VkXymGZbNuZ4zsRJNiU5eRP0UPu2QfVitveY=;
	b=X8H3fZlwvrqV2W9DrXWK9DH2likHLKheHzb2jOGK1XKGCSDA3mGwvFcXFXWQfwZV
	0xvKfdth+jiNISINF6+NsEBWJXizf1P5aeUEHkGZfuAYc/jQrXTe+HpChlxbDyUVovd
	vG2bxmWJKpiaycfJ4dB2MDjwcYAQB6pu5b4MlmLo=
Received: by mx.zohomail.com with SMTPS id 1757067820867668.3962305402956;
	Fri, 5 Sep 2025 03:23:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 05 Sep 2025 12:22:57 +0200
Subject: [PATCH RFC 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-mt8196-gpufreq-v1-1-7b6c2d6be221@collabora.com>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
In-Reply-To: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_032357_567380_301E5C0E 
X-CRM114-Status: GOOD (  12.43  )
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

The Mali-based GPU on the MediaTek MT8196 SoC is shackled to its concept
of "MFlexGraphics", which in this iteration includes an embedded MCU
that needs to be poked to power on the GPU, and is in charge of
controlling all the clocks and regulators.

In return, it lets us omit the OPP tables from the device tree, as those
can now be enumerated at runtime from the MCU.

Add the mediatek,mt8196-mali compatible, and a performance-controller
property which points to a node representing such setups. It's required
on mt8196 devices.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/gpu/arm,mali-valhall-csf.yaml         | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index a5b4e00217587c5d1f889094e2fff7b76e6148eb..6df802e900b744d226395c29f8d87fb6d3282d26 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3588-mali
+              - mediatek,mt8196-mali
           - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
 
   reg:
@@ -53,6 +54,13 @@ properties:
   opp-table:
     type: object
 
+  performance-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle of a device that controls this GPU's power and frequency,
+      if any. If present, this is usually in the form of some specialised
+      embedded MCU.
+
   power-domains:
     minItems: 1
     maxItems: 5
@@ -91,7 +99,6 @@ required:
   - interrupts
   - interrupt-names
   - clocks
-  - mali-supply
 
 additionalProperties: false
 
@@ -105,9 +112,24 @@ allOf:
       properties:
         clocks:
           minItems: 3
+        performance-controller: false
         power-domains:
           maxItems: 1
         power-domain-names: false
+      required:
+        - mali-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,mt8196-mali
+    then:
+      properties:
+        mali-supply: false
+        sram-supply: false
+        operating-points-v2: false
+      required:
+        - performance-controller
 
 examples:
   - |
@@ -143,5 +165,17 @@ examples:
             };
         };
     };
+  - |
+    gpu2: gpu@48000000 {
+        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
+        reg = <0x48000000 0x480000>;
+        clocks = <&mfgpll 0>;
+        clock-names = "core";
+        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names = "job", "mmu", "gpu";
+        performance-controller = <&gpufreq>;
+    };
 
 ...

-- 
2.51.0


