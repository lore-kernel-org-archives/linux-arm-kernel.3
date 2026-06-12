Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B67CD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdtMGS69O9FQnvlMP/DHFOAlWIBmP1hs5y27IdCIClM=; b=PSX9SR9F6W21Q5H39wE42AaOa5
	i9ele+F5xRVRJdcV33vg0H2WbJI7d72J7dABy4CiDqlRl/g0abv5ZW5WaTx2XzfdJ/uphMbuzIVZX
	7QoE2YygrhenraAeV05JQGpm/Zz/oiwEn54jmV4Ps9vBVHe5U7XlOJbRPoK/Dde3lTTXCTyIWI0FF
	kX/GgKpWa/ESMQIWGBkebIPgvw2eIwosZXylqnlC18zfnHoIetqIjNUl9pAgPy9ifO8YNmoJEXW9m
	9cFKKhDZkSV1WsX70jTZziAdnhY3WGm8qwX1U+/FFv0B6oyhM6bd9ED39PkGzZqgkpFbu9zmFbIzd
	S9u+2VWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dv-0000000BEAB-3e5Y;
	Fri, 12 Jun 2026 16:22:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dp-0000000BE2I-2paN;
	Fri, 12 Jun 2026 16:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L2QjEdSRYBu/PbO3l0pYhRFRMmEOW2VP9//vn8M2eEyp5ds/OI5oZnWuOhWugq6Oh
	 V3+HmzyMs/9imaSQJMrmNzRdKNa2JHMFWAtXNh5E+dVAMxefX3st6Gr1teZki9aEq0
	 SAKPHTWOIxigwZ7YYnaJtGAowDl06LxXkUgTQIaRWKBs6nneDldklxSBQIZt1214t8
	 goIP/XE/k11WVcmC3o7vou5oJwGAkvon6Mw56x66MS+JqFemdDI3m2n8tjHSnKlMOL
	 oCgbRN4l1NQ++3JpejSKvx0zPOvPHuQRdjfooBlJF4suK4MuxsUCwLAQ/eSrdR78UE
	 4rbcj5elwNlog==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2161017E0CD4;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C5B9E480026; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:39 +0200
Subject: [PATCH v5 01/18] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-1-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiG5Iemq4sxCM5HCSvLHN6Ael1pzdCaiy
 vcVSnInzIDiq4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qajdkP/RnUWBpQreriz9cgkL+/DAKvUgse5zSNC0zYFSSslI8F9e8IHY5qMeKBJV+Zzk0oY1Z
 Zf3psY+fcG2MTJmhezu4z+dxQ1fmu7nsCIhhdFIOXbxccIVSMdcXi7ZpbSAowZKQldgtBHxvx86
 FUr6VWzPdAc82469ryfIjlITZz+8wCJ9ME3GNr06rOgYHycRkUDwkhbBQ+B4S3Sbnq3qRWyHBeJ
 vf/6pv7qXEcP05qqqcLjJbk+yGIMqGgddmaf7AzPgjjNe/QZno9LTpD1UU4IsKbNUgwjA+DSrWJ
 5YksPuSjII0T7asng/AqAlbKhggsbBr4ittX7dDt1dTD/Le2gkUUjmEUaaN1LYHUW4oTxQGy1kN
 2ZPGVARFvPtjAzEun9uW2RYOAiY8lY2JQuo1otlXRZNMbFOopcYFBf2eXpqPFwrzQCsJexWU6i1
 5oBVHX3uMoqCs4H1uT1I8g2iFxReeIKqt/0IzK/+VVxNny/Hakkh9BAhNHAw2H/SE9kln2oRqU6
 DApkPa6Qu3rOC14WhEL0tDOn1bzUOVN9vUvugQ53q4P3OjvkkOzV0ySBUKKC5yDdVIEjd2a4SwL
 oZrxqNd16vSe1st8crKFUqGwVeHZgX7S6+V7tlAvHgpcNZ1WavqXCKpyxtT45u04GBIa+MmVVuv
 gXkdGk6AflI75UDhJPFIvAg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092157_876438_3D183E33 
X-CRM114-Status: GOOD (  12.55  )
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
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b182..f728acf057e4 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -114,6 +114,29 @@ properties:
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
+          Output endpoint of the PHY for DP, which should either point to the
+          SBU port of a USB-C connector or a DisplayPort connector input port.
+
 required:
   - compatible
   - reg

-- 
2.53.0


