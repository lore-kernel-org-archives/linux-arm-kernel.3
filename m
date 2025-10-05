Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196CFCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 23:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlOxptw0wkS7Cav1r0rRZkagfSCAH6NDEQbsWOh3t04=; b=pdNXzZw+n1SB1cKgmPM1v8x59K
	JPCwG+p8hyJBvYHd3qTpVMc4x3+4k06g3GjWT0VGDS1nUDayjqLbFCRMdvrbE80CDXAXgpdvdcrzA
	ZJUB/+8QNQPSAMqgVQxdJgFrOLvAFcynG7O+IO4WpqRWwnKxOYD2fQT4AIymkogLL1czWlNk7criI
	pfpSOlqnJ81GLrgNsvfi30vbbm9n3BNm+B9qKAV81Q/EXXhaBgupz6VeFFxf7iKdn9Y2nCbFGM2HV
	MJ2mu9wd+dvoTKiph/1Gvl+rn/U3PxRSqDEjD24eGVUxrQIstu8atdF/hmKHGmHFT0sXS6uMGEiDt
	AMoaQCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Ya9-0000000Gkc8-0RzG;
	Sun, 05 Oct 2025 23:56:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Ya5-0000000GkWj-27Pi;
	Sun, 05 Oct 2025 23:55:58 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D12E6EA0;
	Mon,  6 Oct 2025 01:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759708459;
	bh=BlwipHq8gUoEhQ1Vm5JfEinzCONZGPrIIa0pM4kISPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RsmoodVCKh5oNCE1nWXifMs4SFBrFLD90OgoxzP53DqrjXUm0Z/ceJsE62dRiBo1S
	 xjAAmjBfuX0eByn48tlfWk26pAEQ/UFLIye5Uwe00LtdB7AhYFGIs0wxUR4Jo/bHwn
	 LHdqrFDWgDFhlqzFiAGGi0w+dM+zkgopTd//SaAY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Alexey Charkov <alchark@gmail.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@6tel.net>,
	Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH v2 1/5] dt-bindings: display: rk3588-dw-hdmi-qp: Add tmds-enable-gpios property
Date: Mon,  6 Oct 2025 02:55:37 +0300
Message-ID: <20251005235542.1017-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_165557_708252_CC5C53EA 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Add an optional property to RK3588 HDMI TX Controller binding describing
a GPIO line to be asserted when operating in HDMI 1.4/2.0 TMDS mode and
deasserted for HDMI 2.1 FRL.

This is used to control an external level shifter for HDMI data lines.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
index 96b4b088eebe..eec0d40c91ea 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
@@ -113,6 +113,13 @@ properties:
     description:
       Additional HDMI QP related data is accessed through VO GRF regs.
 
+  tmds-enable-gpios:
+    description:
+      Optional GPIO line to be asserted when operating in HDMI 1.4/2.0
+      TMDS mode and deasserted for HDMI 2.1 FRL. It can be used to control
+      an external level shifter for HDMI data lines.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -132,8 +139,10 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
     #include <dt-bindings/power/rk3588-power.h>
     #include <dt-bindings/reset/rockchip,rk3588-cru.h>
 
@@ -164,6 +173,7 @@ examples:
         rockchip,grf = <&sys_grf>;
         rockchip,vo-grf = <&vo1_grf>;
         #sound-dai-cells = <0>;
+        tmds-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
 
         ports {
           #address-cells = <1>;
-- 
Regards,

Laurent Pinchart


