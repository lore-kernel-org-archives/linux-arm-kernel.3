Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3478CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRRA0MfVY8AFYJyq1Qj9bYvFE1r14M9MLeXFY5NXtWQ=; b=HHNuYjK1bowqwcQnx9mUImDnFM
	Sy5bwtKV9vxjnBqaYchYHjL06c0HWT1Udbu0e6Ozw6GI3iXRCpPX3erpXroypmx8dVR7bZUOvWlu0
	IarEL7v60sG1EXxDLfPEmp7ADaO4aoqScSu1DTI7mV/rKRISuZXYEdVCH13TVAWfvt6EmTbgA7QVD
	g20dKruo/p3LFGh+9JKDA5eQIanh7tX2UNdJtnz4/Xvru+YcCi7c/z5fOETnxK67n1Ty+QEp7lcby
	AygP3UnsQtfQycqQafZdgkf4l95bEqmPazDuaR5CScBCi6OsWFdvd/tPm5hbgSgSoxis8g8FBFq1z
	aQRJXg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUQl-0000000BbJS-0lrV;
	Wed, 11 Jun 2025 23:00:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTJ7-0000000BOMf-0iOF;
	Wed, 11 Jun 2025 21:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749678507;
	bh=1DZZD4FZcsjJllv0se6Cxs7D753+HnCfVphExKcrBrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RpV9QkIZM07oSWPYP+3CivXV6O8AORZD+eNgWccoVp6DoJYxvOzJK2VGpbfyHIaPP
	 NpXFEzNRidq5PYV2zfuhyiLOZsZHqcgIw34LVpolcsYeyNQMc20Jq/Pfl69XE1Bev+
	 NAzS26bbewJS99qunCqOyHoX7PLKPre4qPcxtDdDvXXXPAg2Z4mM5wzbzn/O0qsL9o
	 c5WPkt1WzMLF3P/uDD5ERyModWtqH8XL2V81zMsp1qT08G3YDrgMwBRSl/k9wEm4pr
	 gCUz+aams06njY+b8+tknv0q63P/Y9uiTT8oZptNNUNiy884kdLFiaS+nGHCKZ30Z9
	 amPMd+wZLjclQ==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 427C817E14DE;
	Wed, 11 Jun 2025 23:48:27 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Jun 2025 00:47:47 +0300
Subject: [PATCH 1/3] dt-bindings: display: vop2: Add optional PLL clock
 property for rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-rk3576-hdmitx-fix-v1-1-4b11007d8675@collabora.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_144829_403482_CE28E48D 
X-CRM114-Status: UNSURE (   8.50  )
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

As with the RK3588 SoC, RK3576 also allows the use of HDMI PHY PLL as an
alternative and more accurate pixel clock source for VOP2.

Document the optional PLL clock property.

Moreover, given that this is part of a series intended to address some
recent display problems, provide the appropriate tags to facilitate
backporting.

Fixes: c3b7c5a4d7c1 ("dt-bindings: display: vop2: Add rk3576 support")
Cc: stable@vger.kernel.org
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../bindings/display/rockchip/rockchip-vop2.yaml   | 56 +++++++++++++++++-----
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index f546d481b7e5f496e1684f95edaa2fb97b840503..93da1fb9adc47b20dafc5fb03ee72f458a0f6228 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -64,10 +64,10 @@ properties:
       - description: Pixel clock for video port 0.
       - description: Pixel clock for video port 1.
       - description: Pixel clock for video port 2.
-      - description: Pixel clock for video port 3.
-      - description: Peripheral(vop grf/dsi) clock.
-      - description: Alternative pixel clock provided by HDMI0 PHY PLL.
-      - description: Alternative pixel clock provided by HDMI1 PHY PLL.
+      - {}
+      - {}
+      - {}
+      - {}
 
   clock-names:
     minItems: 5
@@ -77,10 +77,10 @@ properties:
       - const: dclk_vp0
       - const: dclk_vp1
       - const: dclk_vp2
-      - const: dclk_vp3
-      - const: pclk_vop
-      - const: pll_hdmiphy0
-      - const: pll_hdmiphy1
+      - {}
+      - {}
+      - {}
+      - {}
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -175,10 +175,24 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 5
+          minItems: 5
+          items:
+            - {}
+            - {}
+            - {}
+            - {}
+            - {}
+            - description: Alternative pixel clock provided by HDMI PHY PLL.
 
         clock-names:
-          maxItems: 5
+          minItems: 5
+          items:
+            - {}
+            - {}
+            - {}
+            - {}
+            - {}
+            - const: pll_hdmiphy0
 
         interrupts:
           minItems: 4
@@ -208,11 +222,29 @@ allOf:
       properties:
         clocks:
           minItems: 7
-          maxItems: 9
+          items:
+            - {}
+            - {}
+            - {}
+            - {}
+            - {}
+            - description: Pixel clock for video port 3.
+            - description: Peripheral(vop grf/dsi) clock.
+            - description: Alternative pixel clock provided by HDMI0 PHY PLL.
+            - description: Alternative pixel clock provided by HDMI1 PHY PLL.
 
         clock-names:
           minItems: 7
-          maxItems: 9
+          items:
+            - {}
+            - {}
+            - {}
+            - {}
+            - {}
+            - const: dclk_vp3
+            - const: pclk_vop
+            - const: pll_hdmiphy0
+            - const: pll_hdmiphy1
 
         interrupts:
           maxItems: 1

-- 
2.49.0


