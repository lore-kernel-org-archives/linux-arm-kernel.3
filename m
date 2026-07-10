Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065A3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDAcdHpoPNx1V/t+8KFXiu+A1A9/UVrEAH/pQVGbf34=; b=s41b28C5873GIZJDumPOnRa5Bq
	aJ8qf6Kn1FBT2EIV1djjmyQThGCi8PJnCsta10tDLgP2YPC/SLgy9ujriChBD4Yq2/quG0jPZTI4l
	hfBN19rOH5WnuYqDoXCpOdhntgTE7N/tm4gm5gTi/krQZqh17AuY2L4lnfksuX6P3Uj/rh5gvl5UY
	rI0fU5KjA8lFvlyEWSOZJJkPKc1wGifcYeCM7aO10PSydiDjxS7olLGh6l6cHJi0pyxgNjYocg/f9
	VqUjmtlwS1hJY6SEzaJFRgCSQT/M2USH05h5TWEfuM2XQevGnMF6X4mB5GMmsWYCRpN+fgA08EpTz
	oRkFUc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMu-00000005JGA-3tl1;
	Fri, 10 Jul 2026 16:46:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMn-00000005J73-44qE;
	Fri, 10 Jul 2026 16:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O7W83j95pEoXGjl0ADzyOWbCxC5BXF3zE7KSBIwsGv4jNZk/S9MHo/jwCfUG/ts5V
	 xdb5uSqR0zIv5IOMfsEwiu59FzZNQ5LhWP4vuF0y3EPx3svba+rQzsf2H+Cz5+Sz4T
	 KiMPzy2ERCjmVV8L5YkE85rO3rz9FyoEA46CH5sH49sh22nL/hn1xrKsPH6tLFNyL9
	 Hp6yHzWsem9RqAknu3FRA6V2kux+kSl6xdaJWqd9skpDHf3dfyXqzOn+B4Kxiyql2v
	 N01+AVngvyJcO8LO4lppcS/2RlJ4zDceKWAeQcFmEZyVQ8wdVntJQLi2UF63hP8kqy
	 1Mqa3prFTOAyA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 26F0717E0B0E;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DCD9D480027; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:39 +0200
Subject: [PATCH v12 01/36] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-1-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdhYu1Ha57Fn8t9eTjE5dNK7wW0aSuZFL
 9eetiCdTSMPQ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaQ6EQAJBEQxdLEGCKGuIhxEpfHNsVvkMSefaqou2gPSymClj3GuQ2IJCADTSZLX4OL53uioO
 JODGXY5n3mUXJBVxq/sKLqZ5vVc/ciNqIxqDp2bXfVLiFIs8g+jIA2lzMlVTk1oH5p+jEUK81VN
 GamUwbvz6oq6L5R6p/p5HjnNRJ98fPLkR6rFkJtCoFkHStwpf/oKduPqp1AoEhPB1cqOT36SCWE
 jk6acTqiBX+d34CSYF15NPg7cM2irBq5z9DdCkKzNiqvMN/2KXZzGEeJwWXBOstuq2JBwmayDKH
 DH/DAT/9yZDFLa9FJ+bNX/ndWNmg2QAFLRU3Yb0YWX+BHlGjV5MuUNYxJsAnz2Sw6nQiYaDvBw4
 7gRo3XALt2/8D5RBekthvNmFs81XPrBdHX/SrVp8aEbny/ZFkes0mxLAd9IYNYk64/TBlsiI0bG
 Rc2xssZLJ82wyD1hNehubIPLlUKRNy1LGKZrqWxn+GgAo0lNbbV8ULFqzqliQmIm4TYX77pwqR7
 X5iUzwDfyVdZmPDSZK//gQH35w7nkcq16HJGgnqJj7IOnYRLyZMGDQJvz7t8e9sa8Pd3++CqM0O
 xdRvJEjWIy7Zzp2P94UObelIPYR+XrHcemiFPg1KU4rJ+sPffuIY4pCc9+tnfb0+c2LRPjKO9/6
 Gkr+6CmhYX0u1fjE4TAErSw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094622_159038_A467D0D1 
X-CRM114-Status: GOOD (  13.02  )
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

Currently the Rockchip USBDP PHY is missing a documented port scheme.
Meanwhile upstream RK3588 DTS files are a bit messy and use different
port schemes. The upstream USBDP PHY Linux kernel driver does not yet
parse the ports at all and thus does not create any implicit ABI either.

But with the current mess it is not possible to properly support USB-C
DP AltMode. Thus this introduces a proper port scheme following roughly
the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
with a slight difference that there is an additional port for the
USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b182..89efaf005a7b 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -110,10 +110,34 @@ properties:
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
+    deprecated: true
     description:
       A port node to link the PHY to a TypeC controller for the purpose of
       handling orientation switching.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for USB (or DP when configured into 4 lane
+          mode), which should point to the superspeed port of a USB connector.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for DP Auxiliary, which should either point to
+          the SBU port of a USB-C connector or a DisplayPort connector input port.
+
 required:
   - compatible
   - reg

-- 
2.53.0


