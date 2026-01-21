Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B18AC44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVJKRWkUefGWTPh/J6w+h97zm4jndSQx+jOGGBUXlgU=; b=BiqD0MCAM0NENxhrhu+yGxhBYw
	6YhR8ADXBWXkjapQ9Cpx7Uuv8p5BtKBK8LQnT6QjYYk7zUJkXlJNqoCIOez7SN02zBmp/WDPvFFi3
	B+3NZ3yMNOFSK0Il4/N7/JOVck79pjrDW9wxsYpZOWXoUSGKEjfl1UtJk0TA+XzZFEYvRGRbaUpGn
	CNSVVhcINo9/CzDhzC0Q7izAqVwEpWDWgF/oHa0I7mnfHvEjYOl1z3usVY7/U2QGa0xxPTM2pT1Fi
	1c1UzJ7Kw6zSI+PjUFMpd3lVfpOFRE4b7zbfp/865O0v15witsjszPJQY6X4EMfDdY8ze8vMizrtV
	oPFtAiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVUq-00000005HaQ-2Nbu;
	Wed, 21 Jan 2026 10:31:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVUe-00000005HUE-0JS5;
	Wed, 21 Jan 2026 10:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9FD643D6A;
	Wed, 21 Jan 2026 10:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE957C19422;
	Wed, 21 Jan 2026 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768991478;
	bh=PaaWQXmLM1E6NYRT94l5gK80A8Ye3/T/39BeYDzC0gY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ihuwjQfgxgZS36bwv4zJq/POGtYg/ppj3GgAa16ZQNE13CSu/Ph9ogzTMyiLOruCX
	 6+aDNMgXBkKjSHUYVCFBBKOSi2Vkynb9mKXZVwUkGaDjUWxn+5ZwYGcIJvIaMqOiEJ
	 X4XDH9IDlDLjUMOvj5P8U+uNn2+anr1cSqdXT0JXCpHcnhajAxOFdZVjWp6bi1TfZS
	 bPGLPt9ILzbMy3Xkd5kOvFJjUNYyTXWJFKhZyAsuJ39dw08hEHhfI0oeV4tysZDjoE
	 msgTheZTEyiH95BqhBuz3u5soTSPaiOvGX9zI//5QWQXXDHQcbWG2LGx3tQElMFs5p
	 gNk6tSnouh9eA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FD2C44502;
	Wed, 21 Jan 2026 10:31:18 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Wed, 21 Jan 2026 18:30:39 +0800
Subject: [PATCH RFC v3 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-b4-s4-vdec-upstream-v3-1-4496aec3d79e@amlogic.com>
References: <20260121-b4-s4-vdec-upstream-v3-0-4496aec3d79e@amlogic.com>
In-Reply-To: <20260121-b4-s4-vdec-upstream-v3-0-4496aec3d79e@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768991475; l=3141;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=+ALt9bgLT6yjuZPZxCh4y6nzKx5uZews8JNjwnFmwig=;
 b=eWVMe/Lg1HvciLUweUC9ZzVRriH1aor5JXrry2U3NCFMCjoAd97FgcXUj0fejSMt/NL5lf7io
 /lao5ud3NHKA7y+W1krJe7djQUlcxM5c7JuN/jn4/jYc7HDrgp3fey0
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_023120_160859_C250AAE7 
X-CRM114-Status: GOOD (  12.17  )
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
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Describe the initial support for the V4L2 stateless video decoder
driver used with the Amlogic S4 (S805X2) platform.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 .../bindings/media/amlogic,s4-vcodec-dec.yaml      | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
new file mode 100644
index 000000000000..88780514d06c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,s4-vcodec-dec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Video Decode Accelerator
+
+maintainers:
+  - Zhentao Guo <zhentao.guo@amlogic.com>
+
+description:
+  The Video Decoder Accelerator present on Amlogic SOCs.
+  It supports stateless h264 decoding.
+
+properties:
+  compatible:
+    const: amlogic,s4-vcodec-dec
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dos
+      - const: dmc
+
+  interrupts:
+    maxItems: 3
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: vdec
+      - const: clk_vdec_mux
+      - const: clk_hevcf_mux
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: vdec
+      - const: hevc
+
+  resets:
+    maxItems: 1
+
+  amlogic,canvas:
+    description: should point to a canvas provider node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
+    #include <dt-bindings/power/meson-s4-power.h>
+    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
+    video-codec@fe320000 {
+      compatible = "amlogic,s4-vcodec-dec";
+      reg = <0xfe320000 0x10000>,
+            <0xfe036000 0x20>;
+      amlogic,canvas = <&canvas>;
+      reg-names = "dos",
+                  "dmc";
+      interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkc_periphs CLKID_DOS>,
+               <&clkc_periphs CLKID_VDEC_SEL>,
+               <&clkc_periphs CLKID_HEVCF_SEL>;
+      clock-names = "vdec",
+                    "clk_vdec_mux",
+                    "clk_hevcf_mux";
+      power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
+      power-domain-names = "vdec",
+                           "hevc";
+      resets = <&reset RESET_DOS>;
+    };

-- 
2.42.0



