Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC47C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssOn6zcVqmkZNO+y4cHN49WiK/ZTiT8VzjVZomEPNaw=; b=1c8R0Tv/VNeBgB14PdbcEEuYfk
	PWP53rmCkC/zXFTnWskk8QHKt5acHIwZD+mzo16DNGmlawWmWuIB5zOA3FCefUc36+xs8fX0P54qW
	nWWVx6vHdH/Kt5nidIraBrbtfrtVIwaDMUhAevcYq0EDAl8EiKzuIBCVkHlCcnSuTLB8ohQTg9zno
	lHlw13hqmcmSuEIlQ2I4kdqZ44/pSkkDOX7LlHK1N0dGYJEHqifdRTmg1hdoOwYxwX31O1GgB+Gdj
	+uLpZCNlEaXkr8yMK0I3aTzoqC+krjfAwZbmDe4oqooMSixXjzOWy455QifFSWSNjYHCw3dfhO+7W
	ICgeaPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRTU-0000000B4jF-1dnr;
	Wed, 22 Jul 2026 07:34:40 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRTO-0000000B4gN-41o7;
	Wed, 22 Jul 2026 07:34:36 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 15D00130010C;
	Wed, 22 Jul 2026 03:34:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 22 Jul 2026 03:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784705673; x=
	1784709273; bh=ssOn6zcVqmkZNO+y4cHN49WiK/ZTiT8VzjVZomEPNaw=; b=B
	3ViSFNpY2AJdem/qDnqhyt2gyW8G2gNsEU7DHrFcanZjkYu+fv9ll5I2yBQ452sl
	bKZi+y308KTBdEqYZDNu0GrrR9m8NRfpVGKnR1iZAxFlGjQ6FnMo7BoT1HBLTfu0
	+oTK81VXDxsU75c71E6ywU+uPPDwH17BU0Hyj7iDF+X4rn5qYOq3shwEUy5n87i8
	egheOmPV1HabtJvYemf2utIW3cp7hYvwSzk0rooXDIFCv8HPi3YGkZqr2n2LcD6t
	5WLtiBkoLKx/DfjfBGIC7SfEirqNcDm2dfa5znYxcMYZmw/7cKH9q3njx0KiaqUI
	kVRnVw+iO1WXGsx1GJIbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784705673; x=1784709273; bh=s
	sOn6zcVqmkZNO+y4cHN49WiK/ZTiT8VzjVZomEPNaw=; b=QoqKWRtCW+ec5kG8y
	ySjMtxboCJSOQGA0ImgwzrtYX5BnJBsGhmPgItlAPLictgUP+9w5Agn3gIx/135d
	JtEjlMCs0RDrpaKKncpmbXsP8AfsAs5M1s+ASU1G+/PVIwzUL4KYTUqsydWcUAvP
	CIH6YAAC6oAccjyKR8omMIfG9GQ1SEOELQfG0XZJo51InhlYH7PsGEc/dmS2GaQi
	v8HjxPnt3yVDOh5g5FGruz4jJ4C5VbgI924L27xqD9+K7Pl9QapQRTYpS5P2wZFB
	WagyNdQ6DlJH/wQVtzhf6TLTIo9U8QDe92GR4A58pV8Gc+3FfJ0IRTTHfiqU6C6m
	HAYdA==
X-ME-Sender: <xms:iXJgankv_t6xCdGR7I7NFnP49sm3UOuXcXS8TB8QfAHFiH5poWqjvQ>
    <xme:iXJgaqYri6DhhWYL8piQ4AZ31E_1Ke220Pt_oe0T8gB_tBLvpm19ce6UWmaoxAvjb
    gyTg5psDBD5c2VMsaXZo0QmGeN8PY3dqDg3py4IYI4WOh2sDGMroOY>
X-ME-Received: <xmr:iXJgah9N_HcQy9M7yl-WOlnrW9bc051-glznbEpNS3Kc_YxtrWMEGuydqKFr4VJAMxvRPGb9OA>
X-ME-Proxy-Cause: dmFkZTFmUtz3C00idprHP4TMAdWqwVjfgm2V7kpblYYJ9d8us6y8xMYVsJnHDuUDTMdQcz
    JKnb+8K1MXAXROTcAeoyxqgYpjhv0pDOGk6iPqoXfy1RSvjNCW1ROVtBlRBM8lT/Ajz6Or
    Rt1iO/zmML/J4u7t5tRcJ0OOTZqRUPzsr2wOyfdwnNlUbSi820lnFt1BF42RlIe5X4uFG8
    reYqGWWV0dFHdd3u8IJrdEKqssQByJ+bkuhN7vMvD+7NVp5MS9D4jTzWplLkLxnzW21r08
    q/nhF8TxnB+vHTZlpXIEcayIIlSGoIf5hf+0TQQFoQB7jvIUDCufhCHR4mc0E2655GGlTQ
    gGSyQwZjTtBx3z1auEveicw5+rxTJGJGVLsCVh2DgXlVFrAm4zcCGUF0sejhLOqTTW7hDM
    REUNqdMeKC0eaDsSGMGLD8PTdwGQlR9KbCFcevwAO/XNKgHKPxE6YYa0mdHXJHvLUoNL2v
    V0B/41w5kAnEqVj+ec5xwnX9IUrHsePfGYEJ/HYeCYgJImqFg33850slwKWcTXU6Dxp690
    7PafB0+9v0VVM/TpprYL4iR0lCFx0g7bBUAbSIWH3/mi4ocTW/H4sP2PGLd5xjGgW8HNDS
    AuOoHkFfaApT6o+HxnmIW/dvxAVLTHXxpGKPXEN4JuiVqObLgLMGxYX6tlCQ
X-ME-Proxy: <xmx:iXJgaiEwK_-_RzKpYE7dC9X2BP-FRtil6v4ok3tHGZ2lQo7BR574WA>
    <xmx:iXJgaje1yLHlmsW2642KD8w_fpeTPumqrRuS5_A9f69KaEBZmK0dhA>
    <xmx:iXJgajmnLU1eS72kgCqLVkNDyJYobx5CYCsoefndblctgflzx-UViw>
    <xmx:iXJgaioJACQ5DpXH9ucgmIbz2LX9HBTsPpXCVNS0RlM-5upZHEQbeQ>
    <xmx:iXJgarorsA6aBFSfSj89gxFguXA9AfvDjIBsTdv5JDoaNWQ73CLw_3in>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 03:34:29 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: mchehab@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.dufresne@collabora.com
Cc: ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH 1/3] dt-bindings: media: add Rockchip RK3576 VEPU H.264 encoder
Date: Wed, 22 Jul 2026 19:34:15 +1200
Message-ID: <20260722073417.2064667-2-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722073417.2064667-1-gahing@gahingwoo.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_003435_085549_8E0168A9 
X-CRM114-Status: GOOD (  11.01  )
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

Add the binding for the VEPU510 H.264 hardware video encoder found on the
Rockchip RK3576.  Each SoC has two independent encoder cores, each behind
its own IOMMU.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../bindings/media/rockchip,rk3576-vepu.yaml       | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3576-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3576-vepu.yaml
new file mode 100644
index 000000000..942118cb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3576-vepu.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3576-vepu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip VEPU510 Video Encoder (RK3576)
+
+maintainers:
+  - Jiaxing Hu <gahing@gahingwoo.com>
+
+description: |-
+  RK3576 has two identical VEPU510 hardware H.264/H.265 video encoder
+  cores. Each core is a standalone V4L2 mem2mem device in this binding;
+  there is no shared hardware descriptor/link-list engine tying the two
+  cores together (unlike the RK3576 video decoder's CCU), so each core
+  node is independent and self-contained.
+
+properties:
+  compatible:
+    const: rockchip,rk3576-vepu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The Video Encoder AXI interface clock
+      - description: The Video Encoder AHB interface clock
+      - description: The Video Encoder core clock
+
+  clock-names:
+    items:
+      - const: aclk_vcodec
+      - const: hclk_vcodec
+      - const: clk_core
+
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
+  resets:
+    items:
+      - description: The Video Encoder AXI interface reset
+      - description: The Video Encoder AHB interface reset
+      - description: The Video Encoder core reset
+
+  reset-names:
+    items:
+      - const: video_a
+      - const: video_h
+      - const: video_core
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/rockchip,rk3576-cru.h>
+    #include <dt-bindings/power/rockchip,rk3576-power.h>
+
+    vepu0: video-codec@27a00000 {
+        compatible = "rockchip,rk3576-vepu";
+        reg = <0x27a00000 0x6000>;
+        interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru ACLK_VEPU0>, <&cru HCLK_VEPU0>, <&cru CLK_VEPU0_CORE>;
+        clock-names = "aclk_vcodec", "hclk_vcodec", "clk_core";
+        assigned-clocks = <&cru ACLK_VEPU0>, <&cru CLK_VEPU0_CORE>;
+        assigned-clock-rates = <400000000>, <702000000>;
+        resets = <&cru SRST_A_VEPU0>, <&cru SRST_H_VEPU0>, <&cru SRST_VEPU0_CORE>;
+        reset-names = "video_a", "video_h", "video_core";
+        power-domains = <&power RK3576_PD_VEPU0>;
+        iommus = <&vepu0_mmu>;
+    };
+
+...
-- 
2.43.0


