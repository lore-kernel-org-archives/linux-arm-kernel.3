Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0A3CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZljte6nGsNvjOx85yztW+Ub3hbm3WoJ+X/dQeTIfnc=; b=EyZTZlE1OKdX8B5DojsdQ8kXzv
	LaAeaACBBTmwJlD1bOE1sjDy3c1Lp3d9LIEqfqu6r8zjb2Ra6XfOw+fASCcU/00kC2qdo4e1utwLA
	egvoAmi8IW1Fx5CJpzu9TuX6weuIrnu8QZyWxNPk/tJwm278pYNOSpVgIqi4DIu8bTG0B5ahsw8Ko
	NwYvkRhM8KPXVtjWWkkjrGq38SLB2fe5ttTOSrTEq1PYkubSEH/vOI7H1VKRxj31xbgFKYWPo8Wsp
	MgVS/elie0LJyGqczZbw3FR3L5IF5iIceebE3MkyL9IoxOM9obj9ia7vgelVe0AI328ROI60mj+Ns
	2P4wGHzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGhT-0000000EJ87-0X8H;
	Thu, 04 Sep 2025 20:36:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEez-0000000DYFO-1IvI;
	Thu, 04 Sep 2025 18:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757010370;
	bh=xYV/jhtksKq4lVUs85jfHk2X62icSbuXC1EZccF5b3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K85QajxbTBd2Ihz0ZcqdrCig0I/7kyxGnXAwoDvP0lyaOHG16x18uUoz8aLMQxmFV
	 DnMRoThOmbrQ8vHm+f8QMeoxncUQ/1W8kGAFaYKy0OFjbV1box0ouyG93X4uQj/LSP
	 8HwN8dpdSrTDyk4Ez4HPey9nUuD0jQ0PD9hxTeu4JH1nmbEbdHOwFg8ZlTwzFNGy4D
	 S5h8MDwWOR4wg5nw2X881aTrvcuGzvtxvcLf9ubqGgy376mr2sXfUvYBqsDIJ3YahS
	 vX0Y/pI6Ii1vBwzqkVII0c3VCgUIf7XRCPnEowJOg2401SetEfvKM1yibj2r/sSPdX
	 RcZMesB184t/w==
Received: from jupiter.universe (dyndsl-091-248-191-002.ewe-ip-backbone.de [91.248.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9813117E10C8;
	Thu,  4 Sep 2025 20:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3EEBF480041; Thu, 04 Sep 2025 20:26:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 04 Sep 2025 20:26:02 +0200
Subject: [PATCH RFC 1/2] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-rock5b-dp-alt-mode-v1-1-23df726b31ce@collabora.com>
References: <20250904-rock5b-dp-alt-mode-v1-0-23df726b31ce@collabora.com>
In-Reply-To: <20250904-rock5b-dp-alt-mode-v1-0-23df726b31ce@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Wang <frank.wang@rock-chips.com>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>
Cc: Andy Yan <andyshrk@163.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=xYV/jhtksKq4lVUs85jfHk2X62icSbuXC1EZccF5b3I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGi52cLhj3jKlAVRnMAW3LugrZurm8z0D9P/V
 RrhnhbRafEXUokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoudnCAAoJENju1/PI
 O/qaOhYP/i2I1Ced4+um4xbadx4569zlypDyvVfIQP8me5BtiZAX3WbjxXSJQLHHu3zwDtbJ3t6
 4vQ3u5uJpqHyKk13qeFyfzhcXKFCSvrcEvyFJyCGJzCOjZr12Bc2Z6Im2xP2V3GX3Hy2K1Ofj0Y
 sj71gpzf6ZoqUnrGdQ+qq+s89Bh1RtcghRo/TGT4QTuadsKzhl0RcmIV3MBi1QfC8JiqE4nSds5
 QwdAZgSB0pCZ4DuK7rI4pfL9X8P2qNjUzS5bJBinS5+ZD290kBQnqUTXvEQgiz3T8Lw1ycpGy81
 qK0ijINMkwXT5apiLa02leLZLFf7yg9k+H5VEtLxSMQBQXiD2eMgAVZRtwVocIptadh4C2e2BgH
 sgsKa5KXDhPxFWF/iQ+2l8YUEmiNuLFXGBpIFBDYIvRGTqt41khcOgBQWDeWWZFQM9gOTLDQ9jg
 /Byz5XBT85pAQVqBSNsqtTVl+f8wSjbKL0a8lSU9dV/QJvTOoX8Oq1MhxnFVcoxANjzbbUYWtLR
 6Hpjtx2L9RXltUi0bEs3PDifkcTJTWr47qFN617uQ3AaKEGoMo48THtX+te4LX0R60SzfEwNWfz
 OaDfdKP//w90lwNx+JB+nqQKke3BzXDJJClFiIUX6C0OxuSOvE3ilDmoN8W2SjN49Kmsd8fWi4a
 Atafc3j3sv3sdSI6SdbU0xw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_112613_512972_EB80CC7F 
X-CRM114-Status: GOOD (  13.55  )
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

Currently the Rockchip USBDP PHY as a very simply port scheme: It just
offers a single port, which is supposed to point towards the connector.
Usually with 2 endpoints, one for the USB-C superspeed port and one for
the USB-C SBU port.

This scheme is not good enough to properly handle DP AltMode, so add
a new scheme, which has separate ports for everything. This has been
modelled after the Qualcomm QMP USB4-USB3-DP PHY controller binding
with a slight difference that there is an additional port for the
USB-C SBU port as the Rockchip USB-DP PHY also contains the mux.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b1826fdec5170cf78d6e27f2bd6766bb..f728acf057e4046a4d254ee687af3451f17bcd01 100644
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
2.50.1


