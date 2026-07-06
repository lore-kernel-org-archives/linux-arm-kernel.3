Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB19C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZ7xCp940lKXmz4uQJ0f3D2aRgCUjhm0aQj61Hq0smk=; b=eVt6pWSe1JfU2jvCCaDaDTQlzo
	QL5pc4mEEYlbqmq6LbxKrhc27TKT9Vjv7vXpoJdJJLqvlp7x7RDG0/r8b7zyazOQi3BNBc9DLY3VJ
	SJyk0iP+o1Ojz6Ah/Mfl+9IVpLtsglL51O6oRmHhrN93mDJCTInTcwmKYWpi4BIp2P9SuvsG28yr0
	OuQVWKHgZi4I9yJ8QudqXhyKsSTyh6dDep4wXmw5EdR0svKaVGKvuL0S3E2AKDY9SV6T9rTSGvWcd
	PoCjWgqd4adwDaoSCvFe2pY468QAECPrCz82qEpWmEe9TOfy9nfvludRfoB2zUvE1j0Z7BAgONtiI
	5ai9KkdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgp3X-0000000DRFP-2hQw;
	Mon, 06 Jul 2026 19:32:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgp3V-0000000DRE7-0lVl;
	Mon, 06 Jul 2026 19:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783366354;
	bh=/oiDzG1yPzVXvmDyvrB8YcOt78K9ESwEa+Uivy/4TVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jzUm9I2+94tXdgxin0lHHVbT5SjP9gQvniyFq9/P+prpO2RgMgBy5SWBi5dZHyVCD
	 b7v+iF1m0cDa+1m9T6MAOCQmvF43QmqysM35fdylK6u57JeOBEF5LAmbFb6GKC0vTa
	 am+ug3xx1SN45wS/F1kmgrHEMgCE8bCQWlK/5YFYN5NOb3wv94xfUri3Z9Lu8xSrzL
	 NbchZVXOROLgkS13D06gJ4bF6oCWLr0RJmvT63lY44j6vH8bNaCgMwrkmvs3SuMRWc
	 u5XK7E7oNXQRPJwB4gWMqR4mbiHlq+O9jvEDP5Krbs30rnsCcPaecpWuuuVa9VIyTq
	 mmWhiJvPMG2Tg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DD5A17E0D56;
	Mon, 06 Jul 2026 21:32:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 06 Jul 2026 22:32:13 +0300
Subject: [PATCH v2 01/13] dt-bindings: display: vop2: Add missing reset
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dw-hdmi-qp-yuv-v2-1-b91beb33dedf@collabora.com>
References: <20260706-dw-hdmi-qp-yuv-v2-0-b91beb33dedf@collabora.com>
In-Reply-To: <20260706-dw-hdmi-qp-yuv-v2-0-b91beb33dedf@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_123237_371247_2589860C 
X-CRM114-Status: UNSURE (   9.85  )
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

Document the VOP2 resets corresponding to the AXI, AHB and DCLK_VP0..2
clocks, which are common to all supported SoCs, plus DCLK_VP3 which is
provided only on RK3588.

While at it, move 'iommus' in the example up into the expected position
to keep the properties in alphabetical order.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../bindings/display/rockchip/rockchip-vop2.yaml   | 46 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 93da1fb9adc4..f993cef0323b 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -82,6 +82,20 @@ properties:
       - {}
       - {}
 
+  resets:
+    minItems: 5
+    maxItems: 6
+
+  reset-names:
+    minItems: 5
+    items:
+      - const: axi
+      - const: ahb
+      - const: dclk_vp0
+      - const: dclk_vp1
+      - const: dclk_vp2
+      - const: dclk_vp3
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -148,6 +162,12 @@ allOf:
         clock-names:
           maxItems: 5
 
+        resets:
+          maxItems: 5
+
+        reset-names:
+          maxItems: 5
+
         interrupts:
           maxItems: 1
 
@@ -194,6 +214,12 @@ allOf:
             - {}
             - const: pll_hdmiphy0
 
+        resets:
+          maxItems: 5
+
+        reset-names:
+          maxItems: 5
+
         interrupts:
           minItems: 4
 
@@ -246,6 +272,12 @@ allOf:
             - const: pll_hdmiphy0
             - const: pll_hdmiphy1
 
+        resets:
+          minItems: 6
+
+        reset-names:
+          minItems: 6
+
         interrupts:
           maxItems: 1
 
@@ -289,9 +321,19 @@ examples:
                               "dclk_vp0",
                               "dclk_vp1",
                               "dclk_vp2";
-                power-domains = <&power RK3568_PD_VO>;
-                rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;
+                power-domains = <&power RK3568_PD_VO>;
+                resets = <&cru SRST_A_VOP>,
+                         <&cru SRST_H_VOP>,
+                         <&cru SRST_VOP0>,
+                         <&cru SRST_VOP1>,
+                         <&cru SRST_VOP2>;
+                reset-names = "axi",
+                              "ahb",
+                              "dclk_vp0",
+                              "dclk_vp1",
+                              "dclk_vp2";
+                rockchip,grf = <&grf>;
                 vop_out: ports {
                     #address-cells = <1>;
                     #size-cells = <0>;

-- 
2.54.0


