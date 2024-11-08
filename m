Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7398D64085
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PI+/wFb1uRJsEyoJ4ZqTllIF+2MC8LXp3xmdo4p9P4=; b=U+UCooAVwi6oRps+IYur/VubSp
	CPmnOlBqTaJulm2vDGXWyHL/cisuzbb7gQxhLGxJ/rJtuhgOAnOm4Zr8xW7w0uB72PE0CLBGA2biz
	W6SDj7HUF0HRVEDBjm5EL0WDT0ZNlImpQHqMUF++rvYBw1p0MstnUZZNb778grLmTDdEJC3E5KVwN
	MS6C42c/iM7/yAeB18p7+2re83pfnPiULc99NZq1iCwQXQQksSc+MdeUP51OoFeHixbb0nm9XN9jW
	dsBjterGykexHlUBuml4Ohtj3118vt2WuOuXOefo+sok0Vsh4p1gNStEnVAVTJDaA0Hm9LHiuWU1q
	rPRCjntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VB7-0000000BoSE-3RJW;
	Fri, 08 Nov 2024 20:01:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9U63-0000000BeYi-2NUB;
	Fri, 08 Nov 2024 18:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731091957;
	bh=69F+XwHGUM8j8Npu0CVV/bvnKz12bT/JSO/FqsNELcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gxZ8JrRO6t3KYBAYrnFkHOPCL/5Yxe3jqsw9SPxYt2ta/JHJB6SkhPQBfiqMcr44y
	 P4+zIAAi2twZ/QxYywjpghDPcuDArxlYYzT9MtPWwL86l9BQ6gorsdxHj8zqUo5ROL
	 /w1ky90u+sQrBJcWsGKcBjPOj9npFAIAoxvQKAeBgquDfpu8RqBXsou5TaDQFopVcD
	 ILQvaX8nUA/rLvjrjQn+5Rspwrex5SUdCdt6JHTcVNYiBD/FWFFPBZTjWDLFQaycc0
	 GdWqS0J2qpDMJyO8l85plGqYlVCcKHuzOmrhpi4dx/FfEXbHTGxyMUgE+CQtF+xuX/
	 fjYO3xBTMPFug==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4088D17E3770;
	Fri,  8 Nov 2024 19:52:34 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stubner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/3] dt-bindings: display: vop2: Add VP clock resets
Date: Fri,  8 Nov 2024 13:50:41 -0500
Message-ID: <20241108185212.198603-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108185212.198603-1-detlev.casanova@collabora.com>
References: <20241108185212.198603-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_105239_779715_1FD40E40 
X-CRM114-Status: UNSURE (   8.99  )
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

Add the documentation for VOP2 video ports reset clocks.
One reset can be set per video port.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../display/rockchip/rockchip-vop2.yaml       | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..5b59d91de47b 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -65,6 +65,26 @@ properties:
       - const: dclk_vp3
       - const: pclk_vop
 
+  resets:
+    minItems: 5
+    items:
+      - description: AXI clock reset.
+      - description: AHB clock reset.
+      - description: Pixel clock reset for video port 0.
+      - description: Pixel clock reset for video port 1.
+      - description: Pixel clock reset for video port 2.
+      - description: Pixel clock reset for video port 3.
+
+  reset-names:
+    minItems: 5
+    items:
+      - const: aclk
+      - const: hclk
+      - const: dclk_vp0
+      - const: dclk_vp1
+      - const: dclk_vp2
+      - const: dclk_vp3
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -128,6 +148,11 @@ allOf:
         clock-names:
           minItems: 7
 
+        resets:
+          minItems: 6
+        reset-names:
+          minItems: 6
+
         ports:
           required:
             - port@0
@@ -152,6 +177,11 @@ allOf:
         clock-names:
           maxItems: 5
 
+        resets:
+          maxItems: 5
+        reset-names:
+          maxItems: 5
+
         ports:
           required:
             - port@0
@@ -183,6 +213,16 @@ examples:
                               "dclk_vp0",
                               "dclk_vp1",
                               "dclk_vp2";
+                resets = <&cru SRST_A_VOP>,
+                         <&cru SRST_H_VOP>,
+                         <&cru SRST_VOP0>,
+                         <&cru SRST_VOP1>,
+                         <&cru SRST_VOP2>;
+                reset-names = "aclk",
+                              "hclk",
+                              "dclk_vp0",
+                              "dclk_vp1",
+                              "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
                 iommus = <&vop_mmu>;
                 vop_out: ports {
-- 
2.47.0


