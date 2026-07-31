Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2475C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6aVM7ubP+FZEA269nwLXgM6JiG4zElE5w8pBOy3T60=; b=l4jF52JX2cs3wNSdRWZthW6GFQ
	ipbE+dt+ebBnQDrDA9rFcekH/zEeNqrCFsQSPsJcIQcGLL8yqjFO2uKtOZ6oIMtND2nIKOAqDQ52d
	ID/EYe6Ot/v+fP0NSaJzvZT6AkI3kfF4MM4SWGdwodk20c9iw+HZFHpztnVuDaGoX37RBjzxZywet
	7mugIvxjLx4mdN2yHfg8ZJYdNbEcXe5SYFk6Ni7XfkI4UNHzKPpiD7+zasdrowSwPENzS00UCqvJm
	W49wWwr5VgTTH7LJsUnm2ZmdF2ka0eL1ZFb//QJ0NTpRKmJjOPvquTQnKaTxGtN1e9F/dWWsJz6uu
	/dH4L97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoSn-0000000CnNT-11sk;
	Fri, 31 Jul 2026 14:43:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRP-0000000CloF-2f5p;
	Fri, 31 Jul 2026 14:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508930;
	bh=SwF3VHoRiI4Zsf33YHjX0UHR9rjLn/pkIELQ2nyar2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PGDQJE1wu2rTNVK74o1BVXRR3bMbRPM5Bioi046QI8KtxOQRgnjeuHnd1BZfSCAxG
	 4HgbnQOtPHnu0lXnde4KqnT1TnKQJTFMQBpHdaMBLuMb6mch1keS6X6dy+MgB3asKz
	 pl+lEnkJzV38935Y/bD5UyXBmLw4CJSGYgESB3zefxNo5xkxYqYCl5/5nlmG2Y8ok+
	 4GCeRmHI5yGbMbw1rXeI/DSv9dthUcfS1ZkVMiDHCxG1nYtRv3Ux1lg8RqQ2K8vLWo
	 ulIlQEGAM+SrM7FKYBQOwAo/bnz+i2ddBYpxyt/AkdDhp0OJohTVItwfobSShFxRSU
	 qvki9UvBwB3kQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 11EBB17E0943;
	Fri, 31 Jul 2026 16:42:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1A515480066; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:25 +0200
Subject: [PATCH v8 20/21] dt-bindings: display: rockchip: dw-dp: Fix sound
 DAI cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-20-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=SwF3VHoRiI4Zsf33YHjX0UHR9rjLn/pkIELQ2nyar2c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEBuVYmo/gc1yooRF7Q5pSqVy6ElAigaE
 1JVGu8Ic88DK4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qahrEP/2S/ojkgdjhY+A+syYFVUzDN01FYSgajyDOj9MoPlp+tQ6lb1Ig+z5a3jgqm27nP5BS
 AVhF2Ca4uK4NmKt82ZGHFuZun8tIky7tkqNgbt0h3A4IFS/OOoIXYZN1UkaFHzGcjL1ip7vpODZ
 KRmmyoi87GRpMppXv5zPhWSgMjYtjDJDx5ZUCOnr1YWbgXOZc4fFky7VxX4N6j9AG/NJCgFGis2
 OudqwDCScH8d+HDsubNnTdQrfv74rcHSwSfn6hT3wzfQduD+BXWz5mBfgaKMc3FjKCVDC9O5hDb
 b/F7B//giitBCnYvAf+ncP2UerKbskD2bFc+psk87AaiZcu6GywsXWwQAH95rsvyqqO9jC/B+0S
 wU+uqBzFs5p1wcH6nJB7NoklGiR3qf0bIRf5plyZ4ZzQvlJn5VrjdZzqNSWjEJht/0p00HI6pdx
 n/rlez2VkFAsMeNkNO39D0omxpz27RXp+OJYux96BfpCQiA/D9UZAm3/kTNndkmVnDvIsLLYvhq
 q4H1CSrP2mgJJnAMR6MTXJajtAQPvMHIfrjpEWYjCrck6LofVJ45V4gYvWh8y1h2ZhiLKuuVefs
 4aDbvgkoGj/Z5KWpM6HkCJwX3pODMoL4r0gRdGuJJh1qvi7vdBYdYNvVu7rQLaIILvuNLWYf/QP
 09v22i26WMSpmityxKxAvwg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074227_888460_CE70AF33 
X-CRM114-Status: GOOD (  19.71  )
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

The RK3588 and RK3576 DesignWare DisplayPort controllers both have two
possible DAI interfaces: I2S and S/PDIF. Thus an argument is needed to
to select the right interface.

In addition to that the RK3576 DisplayPort controller is configured
with Multi Stream Transport (MST) enabled for up to 3 displays and
thus has a total of 6 DAI interfaces (I2S and S/PDIF for each possible
stream). Meanwhile the RK3588 does not support MST and thus has only 2
DAI interfaces.

The binding update from this patch has only been tested with the simple
single stream transport (SST) setup as the Linux driver does not yet
support MST. Once MST support is added, the plan is to simply add more
numbers to the argument, so that it looks like this for RK3576:

0 = I2S on stream 0,
1 = S/PDIF on stream 0
2 = I2S on stream 1,
3 = S/PDIF on stream 1
4 = I2S on stream 2,
5 = S/PDIF on stream 2

As the arguments are not part of the binding itself the audio side
is also ready for MST after this change.

Switching '#sound-dai-cells' from 0 to 1 without keeping compatibility
is an ABI break. The rationale for going that way is, that there is not
a single known driver implementation for the current binding. It's also
unclear how the current binding would be used (only support I2S or
S/PDIF for stream 0?). The mainline rk3588 DTS include sets it to 0, but
does not have any soundcard using the DAI. This will be fixed up
separately. The RK3576 does not set it at all.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml     | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
index 2b0d9e23e943..c4f8959dd65d 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
@@ -25,7 +25,7 @@ description: |
   * Supports up to 8/10 bits per color component
   * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
   * Pixel clock up to 594MHz
-  * I2S, SPDIF audio interface
+  * I2S, S/PDIF audio interface
 
 properties:
   compatible:
@@ -46,7 +46,7 @@ properties:
       - description: DisplayPort AUX clock
       - description: HDCP clock
       - description: I2S interface clock
-      - description: SPDIF interfce clock
+      - description: S/PDIF interfce clock
 
   clock-names:
     minItems: 3
@@ -83,7 +83,8 @@ properties:
     maxItems: 1
 
   "#sound-dai-cells":
-    const: 0
+    const: 1
+    description: 0 for I2S, 1 for S/PDIF
 
 required:
   - compatible
@@ -144,7 +145,7 @@ examples:
         resets = <&cru SRST_DP0>;
         phys = <&usbdp_phy0 PHY_TYPE_DP>;
         power-domains = <&power RK3588_PD_VO0>;
-        #sound-dai-cells = <0>;
+        #sound-dai-cells = <1>;
 
         ports {
           #address-cells = <1>;

-- 
2.53.0


