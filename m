Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1777EB7EB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js8LohQ5FKnKhCP/1X+pjHvtWvmL3//jFEdtasdSj/c=; b=nE/r05XsAWkur7oRb6U47i03aI
	0WOlmEnt8S64TGtGIvGJgTcn9B18nXAaUbC9qHlyJwgsGko8dbYLeVyoshhuvLzamwxamYsdgF8or
	ogjM75Yi8jg39rSZDLg1dpJpK5nUP6R0+eSiN1V8wYu666FSX7lZpxGXkahZyhr1bEA2ix8t41zJ2
	2Hy80ZhOYb9ZR3w3aV3Xw2uWhUEkg8IT5nVizflMXB55YLPgG79octQvkEzJ1YF+bWj4SxeYN8SNT
	2+/o+5nBww4jI9aT3CFZW1HQaL9vWrQ7ouXdV60Uuw0bDHyb38Yyj1MKhRa4V/dSELqi+Rt1KLU67
	yYEhmyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxilP-0000000GuHh-3D8O;
	Wed, 04 Mar 2026 09:43:31 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxilI-0000000Gu5V-2Rba;
	Wed, 04 Mar 2026 09:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1772617355;
	bh=Js8LohQ5FKnKhCP/1X+pjHvtWvmL3//jFEdtasdSj/c=;
	h=From:To:Subject:Date:Message-Id;
	b=ZhlMdJyuNQX262QpP8RlEvBZgVD9CtrJdlyEIdFzpOMGrZNpWC95fJZGs+G9AzXoK
	 2ed4wDtBU1FGYDCDxOaTwwY40S4pVK3vYs0hc65ljX8VchAOE5JuuNx8dSALHfsjSZ
	 bzBcMrF+hOum7O0CZAkhw+IvI1gxSJNO4YjFHZRU=
X-QQ-mid: esmtpsz11t1772617346t06159e3c
X-QQ-Originating-IP: nbNoMgw+sJlbtFbTwzXrCmqsHBTzGYwt94vd+Sw6pgk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 17:42:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5088075739087231184
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v15 3/9] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Wed,  4 Mar 2026 17:41:46 +0800
Message-Id: <20260304094152.92-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260304094152.92-1-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MXBlLHWRHBZ3Bb25zVgU/I5kBve8YORdb9Ubks3aVlNfPuA8FWq2qA0Y
	ufpQBe4Gr2W6PeZsJ6ov+4BumjJq2sNxBWOhT9iAE/JXO/tQZIa8FI2kcSxmbEA/aIW+FBM
	4XIAUaI4hqFisf2W8Kr9IXNYpWpDoSXx8tq+FgaLI/rp9rjAOCvLDRI0gvt5RPAhAShRLTS
	U+bhF2Zudfds2jNKWcFMTNFK5pf/cEVxNRrhD2pGFqfUZTCXOSldUv0P+dVGiq0aQJAyALt
	Vkc9VHfiGi87JJT2DHQiE2mIjt5Rt8nMScnB8/Gbc10rH7FPRqXjM+HID2ZLBwcW8JGErYr
	0euDtQMg3D52HwTJW71scS9LsRcL0035TTeyqbBbX5fQWmiIfgZBHbHKbEpYCpkSLj32qJi
	Jpype6F4m4NqB7fpzmFHlogvGPVkx2R4ttnYAwfnQje23w0R9fJbo8JmcIL13+sksivAHs0
	fzA15N4CtKF3FWBgJtlFr1jx5IPhJMddkZfz2907A0c9Pn4HNfe5ClnUIA/04KkCerN7b6l
	PWjgKRJwr2VTuMEgR6Qtpcqf4Qft1GxG2sZHGZR84v2hTKgqTPKxv5T77XzlsDjZ9+v5ueS
	B1L3bhbor4y9jLHj98WA8kEKC2sbJqoJkvDBMjcpSM8f46BCZouUx4dcvSRikzo8He9dNNC
	kCPsii5na9lR9+VJaFLsGfEBfCXoTOCyeqsphtFG1b83aOO7j8Ni+v4O7TRbHl/EJF2bj6S
	FYrPlomHr1JvFkr/2pqWdRfZ7aOBQDZienF3fcw0Km0WSGv4+HMAaCizafzhHHC1Di9iAcH
	jQ8xV4YMScMCY7OQ9C+HNxEdoZyYx1LT64QR/It+yDpmv6eHCJxO+j/scpCn7CrPD7lF8rS
	4D8v2/HWDixBnZ7FMf+58ubNQRoYQKYWI+LHsMSRLTGQTlmibQXQdAuSO8+zz+L/qocfFqv
	ev6b6OZst6+8bxPylgW4x02XHBPFWQHGVDyRrgaucghJt9ehd40mgKljNqALHLOACge9Bg/
	iMKW7tRSKaCOvpBKp8SmEyrw3qLLE=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_014325_090353_7DC1D670 
X-CRM114-Status: GOOD (  10.12  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 SoC integrates two USB/DP combo PHYs, each of which
supports software-configurable pin mapping and DisplayPort lane
assignment. These capabilities enable the PHY itself to handle both
mode switching and orientation switching, based on the Type-C plug
orientation and USB PD negotiation results.

While an external Type-C controller is still required to detect cable
attachment and report USB PD events, the actual mode and orientation
switching is performed internally by the PHY through software
configuration. This allows the PHY to act as a Type-C multiplexer for
both data role and DP altmode configuration.

To reflect this hardware design, this patch introduces a new
"mode-switch" property for the dp-port node in the device tree bindings.
This property indicates that the connected PHY is capable of handling
Type-C mode switching itself.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v5)

Changes in v4:
- Remove "|" in description.

Changes in v3:
- Add more descriptions to clarify the role of the PHY in switching.

Changes in v2:
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.
---

 .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..83ebcde096ea 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -51,6 +51,12 @@ properties:
       '#phy-cells':
         const: 0
 
+      mode-switch:
+        description:
+          Indicates the PHY can handle altmode switching. In this case,
+          requires an external USB Type-C controller to report USB PD message.
+        type: boolean
+
       port:
         $ref: /schemas/graph.yaml#/properties/port
         description: Connection to USB Type-C connector
-- 
2.51.1


