Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B82C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 21:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdtzYsN3s12Yifi9KUC6z/OCM1R+vC8085w3kVA5H60=; b=X4eMptqeP6QaLuTpkxeJV6QJjw
	HIEARd21mUN73WOdf38Gq54f43w9OmOQn7o5yhq/z6RCVsWOktkPiwbBB0n+pazDofpuzvfvsudBV
	MxWjMaA0T5ycXyLSTT94JMfuGO7YBvMyTg4DW+FgJ3ZsEdixvKFWcsmz+ZEk52rrpo1e39rfd01jh
	b2FBJ+kP7pMtmRdz5T5SS/18CIeiiPpqOKjuvrRH1OYI2FCgY0zYDSzCeR3HXnhmG9iU9eZ7U1KgM
	EcXtQRwFvCYSY5RfvZRpe1yD5UuTTUXj4+d1MrOKE6Utorz8oHJqMSQPZFSVn79G5tS4nN2Zk6qt1
	3m053zdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txC3q-000000075SC-0tbF;
	Tue, 25 Mar 2025 21:43:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBtx-000000073uU-0U2x;
	Tue, 25 Mar 2025 21:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742938415;
	bh=/9mhkK7PNkdR6KIwtO7Gr+XPvYbLrV1O3pMYp3QMHt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FMEbMeYrM51V7OWwm5V12+2suv9QhNG+1is80XCOL6tsMHtu3TsLDQO3NRDxb7E0s
	 xQnPMXcfmc228flM3oazzjlIm11WQrvWc0ZmvPrjYzRaX5CGbnsyics0HttYe2Q8mU
	 T57SR9CTVeFKykJOr97sq15b4K49d2/3r/prdAs13hpjPXo1d/vZTIOuEzJcQq7LoC
	 nixddaBMSzEQvRCJqTR+ZidigwDxZhUqBNqGKt/wJ3HrGprT3v+bHENpcIL+4VrsO2
	 J+plHD7hh42fuXJkC0AREkT9cJ3JEQ2pT4NOQdlEsCmygm6r4ZGho9gO/kp9nvzTCj
	 1K+fDgQfkb3TA==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD36D17E0F94;
	Tue, 25 Mar 2025 22:33:31 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: [PATCH v4 5/6] media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
Date: Tue, 25 Mar 2025 17:22:21 -0400
Message-ID: <20250325213303.826925-6-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325213303.826925-1-detlev.casanova@collabora.com>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_143337_298104_CE1310D7 
X-CRM114-Status: UNSURE (   9.54  )
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
---
 .../bindings/media/rockchip,vdec.yaml         | 73 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 08b02ec167557..bb79499bebb09 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -17,6 +17,7 @@ properties:
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
+      - description: The link table configuration registers base
+      - description: The function configuration registers base
+      - description: The cache configuration registers base
+
+  reg-names:
+    items:
+      - const: link
+      - const: function
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
2.49.0


