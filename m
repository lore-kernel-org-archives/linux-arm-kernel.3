Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E44DC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6aVM7ubP+FZEA269nwLXgM6JiG4zElE5w8pBOy3T60=; b=VMOiU4/bX48v3YdGJ8JEN35wBG
	0svPfRbJVOr8/EHPDpB8krv9TXs+Iuw9l2R7ofs8UD5z5jtYQlokkfGS/TLjNKAZv8NiqZk848FeV
	N9tRgJRAjJlhoQdTtZCcETpG9RtUzPd4+3ccLI+BSfCIxudicAoD8hx5OJz1MXvWob9zT7DI17A3C
	3CzhOp3t9xhXKMCAPMw5b4Ivb6nHg/f/5M22H7fb706mT2XL2KsNvnUOsxVBbjy6SHhy8OZ3XmdPH
	5VPKmKMR3mt6EDlXPAVBj6zTYKgF2My9VtSbkQlLgGEWjnhFE0qdHS02pWb7rjaoC1M5S5WoBhA54
	ezKH2upg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1ck-00000006K90-3hsx;
	Thu, 06 Aug 2026 17:11:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1ch-00000006K7e-2zmZ;
	Thu, 06 Aug 2026 17:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786036273;
	bh=SwF3VHoRiI4Zsf33YHjX0UHR9rjLn/pkIELQ2nyar2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wcmv+tXk6Fb4ukbTjux//eab/6XloiLv47xLSu0piBtALKGWuCCTULgT9Q7o04xrd
	 1yHIrbzwBhubUZFovR+tXIeNpXQnjkU4EFOPpu546R7lFUofycGGMvfbt1UlxABzyE
	 p147C0aJaiaqMws4cxpEUxoQloGfJXgJ9eR49jlrC6b3gf95ym7wZMB53iGmp+dz8c
	 xZQMALcA+GgJ+EHqO4jSYbcSa9SvBvPOkJDSlTvXvNE8AF5tyYhx1ZypamOzFHoDt2
	 el6q6y72xxf7U6iuBMp3TaHe6RdC0wx4YhqjSQG70qr+ZmJ+ytkRz8TUb2WEXWYIUA
	 aPkuQgPC8RgqA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CB5917E0742;
	Thu, 06 Aug 2026 19:11:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 156D5480066; Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:26 +0200
Subject: [PATCH v11 20/21] dt-bindings: display: rockchip: dw-dp: Fix sound
 DAI cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-20-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viCnbkq6Wdxp1KnetBT7jAFranUwSZgwO
 jTSOmd9xnPw2okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qa3xcP/AkCAroNp68tJsgQXtw8A4H0ygxyK4SeKuD+dXMnpu0NmDnfkYb5QXdjPrGMy58s7mc
 ClCTEFQX4AgeyH5wPpAVA+W/bL/JOI3dv94lo5pT0EZuJo2LX/LfpXla7jNdHbqdCFbFdc9kUk0
 Nb0yCugXzpvY/eXaYT6Xq/UtTNc858js6R0Ie6Wn1hqU1iBgjbiBenIAVP8fo1zIo8hfV5i6sCN
 zeTANt5gx9BwXB85ty6siLwTsZjzBMnq5GPs/3BPgaZB5I+PmHKWs4yP/ZSUOfUcRriKEX1H2e+
 TkWwReae0wjGZVk1d3ReUYZzZc2zO18xyAsMVk9ePkeFEiCVBL0DgPOcIj0G62Jx56nv2yX2/8m
 eaY26CvFo8a8OblOPcsON+cF5YHPZ1q0z0hgwxVwuh6rCEqRpxLP4UkObXr1rC0IGCic1hBgreG
 GMRj0z9UEfobIXc3XGA54Uz2Lzagnc/L9ypk9SOwskkACbtnmyTCF3/LqwjkwGNG98+C5NQ53Xv
 9Sxq0ETJkRlJAGNq7SwHVkuxZKuseyWhJV4S6iWNvFLJlFY6xkYhQGt+fy/u+aL1/LNwauXx/Zk
 Ea+kf3CFWI4NLGRU27qiXkjutEowg7crG+4bqYMoPwGZJQGW13Qsy6Cvj6fqULZxCGJKmDs4CG4
 O5GBbq6Ldyp6jnG3M3RgoPQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_101115_895117_1DB220D0 
X-CRM114-Status: GOOD (  19.28  )
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


