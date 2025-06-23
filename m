Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4E3C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xpw4Ic9uKTJKpDt468/bEAq9MOD93XOjpDdBJJdwBPE=; b=41u95XegCOAvg58z4u0TT19nby
	gl757GhQDaIIrMI2Rm1A01glRCJkxnOrKMXQfSA2VQ6+1o1Gw6NhEYWttoULS1PYnGYixnxMEes/2
	ge7f5x0Mq0BVtwN94bWLJzHU/ZhIPymR+yltZBeubFKxVh1tER9881s8aaAHuawuJEGut3Em4swJ3
	NqquogpMXKc7wk/QxXRarTjUGCTyuWEKbnvJOluLkFtMlVq4kA3p2H7wRLs0VnZmNw/OuOdY3QDSy
	snTI0cy+vXzP+DROi78DROMnPHVcKV8yqCUMKa3AEG12QhdKYsnu+SwFar/LMab4C6kcmiPTSr1yL
	rr6P6yng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn3q-00000003pwI-3S2E;
	Mon, 23 Jun 2025 19:42:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTji1-00000003M0P-1TJo;
	Mon, 23 Jun 2025 16:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694867;
	bh=2JOkEWj2nxlL4OQAWq+ph3hM6u/KePKw05vuGP16VR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRsClA47ngXTTKiZxLgNCplltBR8QgvCb55gfYhNvdjZHNFfWm3SaazcLx8yHn/Hj
	 BWLT4SsKQrGoukpvKTrw6gFAyS31FrErp9fD1q6k4AYROedh2R8Eti3NuaIGd0y9Yb
	 6zJDgrV5X8nUFLkyM0CDVAet38ePMdm+/jYPVBQ+g6iLeZ+SwqCt6lEqT7lu3s8RRm
	 9mDJxZntfrTswh29u+7nr/xrPSH4XcbbuACuqhQcpBiQsijqjbNuVaanxVr8HWKyaW
	 R8Tc15Xwuk8Yup2FGW06r8srTejUjLnfkAe4rekDg4ZMD9qJSNdv2tWVv/Yb5C9jKx
	 NDtDxbDnj+Yog==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CA4B17E06BF;
	Mon, 23 Jun 2025 18:07:44 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/8] media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
Date: Mon, 23 Jun 2025 12:07:15 -0400
Message-ID: <20250623160722.55938-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623160722.55938-1-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_090749_572427_0A58F629 
X-CRM114-Status: UNSURE (   9.23  )
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

Document the Rockchip RK3588 Video Decoder bindings.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/media/rockchip,vdec.yaml         | 77 ++++++++++++++++++-
 1 file changed, 74 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 08b02ec167557..e9b82dc05fd1d 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -10,13 +10,14 @@ maintainers:
   - Heiko Stuebner <heiko@sntech.de>
 
 description: |-
-  The Rockchip rk3399 has a stateless Video Decoder that can decodes H.264,
-  HEVC an VP9 streams.
+  Rockchip SoCs have variants of the same stateless Video Decoder that can
+  decodes H.264, HEVC, VP9 and AV1 streams, depending on the variant.
 
 properties:
   compatible:
     oneOf:
       - const: rockchip,rk3399-vdec
+      - const: rockchip,rk3588-vdec
       - items:
           - enum:
               - rockchip,rk3228-vdec
@@ -24,35 +25,72 @@ properties:
           - const: rockchip,rk3399-vdec
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: The function configuration registers base
+      - description: The link table configuration registers base
+      - description: The cache configuration registers base
+
+  reg-names:
+    items:
+      - const: function
+      - const: link
+      - const: cache
 
   interrupts:
     maxItems: 1
 
   clocks:
+    minItems: 4
     items:
       - description: The Video Decoder AXI interface clock
       - description: The Video Decoder AHB interface clock
       - description: The Video Decoded CABAC clock
       - description: The Video Decoder core clock
+      - description: The Video decoder HEVC CABAC clock
 
   clock-names:
+    minItems: 4
     items:
       - const: axi
       - const: ahb
       - const: cabac
       - const: core
+      - const: hevc_cabac
 
   assigned-clocks: true
 
   assigned-clock-rates: true
 
+  resets:
+    items:
+      - description: The Video Decoder AXI interface reset
+      - description: The Video Decoder AHB interface reset
+      - description: The Video Decoded CABAC reset
+      - description: The Video Decoder core reset
+      - description: The Video decoder HEVC CABAC reset
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: cabac
+      - const: core
+      - const: hevc_cabac
+
   power-domains:
     maxItems: 1
 
   iommus:
     maxItems: 1
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to a reserved on-chip SRAM regions.
+      Some SoCs, like rk3588 provide on-chip SRAM to store temporary
+      buffers during decoding.
+
 required:
   - compatible
   - reg
@@ -61,6 +99,39 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-vdec
+    then:
+      properties:
+        reg:
+          minItems: 3
+        reg-names:
+          minItems: 3
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+        resets:
+          minItems: 5
+        reset-names:
+          minItems: 5
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names: false
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+        resets: false
+        reset-names: false
+        sram: false
+
 additionalProperties: false
 
 examples:
-- 
2.50.0


