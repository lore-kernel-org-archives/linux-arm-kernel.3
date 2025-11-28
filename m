Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5D4D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 02:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=; b=ojICgLgQz9xeXcDg6cun9W1P0p
	cvyQSmlWaRYZ48YTDEXhnnSnMeZrBkIheiPsytdoY/j1FjCwt9pBB/lEpjt76q27mBy0EeJDiNdzp
	ay3JAeKDORACUz9eS6FckK64PZlIgd9W1Umw3ScPh4FPeRF67100uozKyuhdb96dJMAJVoh61c8bN
	1oBchNBHsTubzUUQkqdU8iU0mhHIA2LAvClukT8hCr1cbBQbIvPGrV2IeHI5XeP9uXG1uVrVLJgtH
	xeJhcZImqm2I4XFayZhQB2EZVYhdkrReK9H0N0lwWMlVBP8JNrRiH5hUrKwxjHEv6eF/avMWf9hO8
	utYKQP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnra-0000000HQW0-1zSc;
	Fri, 28 Nov 2025 02:05:34 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnrM-0000000HQHe-1RDl;
	Fri, 28 Nov 2025 02:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295481;
	bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=;
	h=From:To:Subject:Date:Message-Id;
	b=lgEAZWeXjxLY62c3ZXHCU4+rgiPPG1Huk/GPthCBMcI+8dXDwQcm/G9l237Adx5X5
	 giJdgBS+M6DYFASZJ4s/3ogUmroYjfoQBKuoU/I/Iw3uQJBZTMvLaVDDa40nqc/IiP
	 NayHLzhqfUtDCLztY87ydUTouhiHCuUP/FF2iuK0=
X-QQ-mid: esmtpsz21t1764295479tb524af5a
X-QQ-Originating-IP: oW3x0e+rLKqddHu0SO/doGFIJJO2dWUv1ai7nKLeCMM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5493829236187501795
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
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 05/11] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Fri, 28 Nov 2025 10:03:59 +0800
Message-Id: <20251128020405.90-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NGbyafB8Lluu9jcwbxcdxRy4qRLqlDKdfHtmx1FfSmkyT5h78FxbpPv/
	6IkwGBqV4Q9UVFPUFBKbXxka6kMDKeouci1pNWZ6AK6p4LygtTa4YEgHwKMAtLGxlfKPLRP
	4pnaa0JxijAFJm0ApKQzHJR+pwUD/IWeKmW2SbJy7E5peRVqYTbOsP8mpYvq3MWOVGqPBOi
	67OnwW/zSKU1uL/M+nD+6Qz5Cn2Qqfew1lrd38h+Nf6DDo0bI8adZ4nDZHePsFgzoaB4wtW
	o3WWwiCcgdSoMtURPTkpYT/2EgSukTlmBjQK9kzJQhWLxofrfjdj0E5YQWCtByvVHUTryWx
	2pr/jdLCoigJ26JEAhUnkP0tDGLMJ4Cif3tsjEwwXZHTx+rr8G9s7EHJUQM3fgvU7itY3dZ
	FYC9kGULS5l5mDA9AgMZyrm6xEy1j4BjFFGhul8OFKin3NWWroXzPvgwst+39JYCh8Yg8jj
	RdiA37FAPY1JbjwGk4KfZkxjLpFoejBw0KycCpU8xeQ04aja1LE3xrKh7R7PYRgg+ukfTGs
	Z1SsmIO5XbCtzV/aX+A0K1PsGKalFxH3rXGu5CwBqAl48+xRnimdNPAEWMl7Fy9L+3qeRGq
	KRja8h/m0dyUrjSpbU6tXD8gYqOqTfNzRGrIOEjitsaBkuLLHE9Lo73clPVOZ58QhOnF0DU
	OJZzdDmfb4jcnlgipjrV/QnUrmHywMfUUJWOgKoKpPLyxqzd/r3FbfSYm88B9MNYqDNEVj0
	kME55kak70fB4O+dPKar59qrrFyBBemhcjuU6tDM3mDcMgzF5v0fSCdd36Z2CKuhXKnkp7Y
	f+cyMl9BtQ2u3mpjk4pXp705a0Q3I6fd/0tMavO8qqV8SNExUJ7x1oSJ70ALWKRTNMG32zI
	q2byO+SFwBDB7wKq859CV+wEOiYEbzATqtsnXBn+7D6WFlEhDg80RGhmkot+OguKto1PHyi
	qFhELjdRCRO+6G6Q+xP7QtTSqNcqShJVtASDl2pXlB/lirU+HXfqxbyHLwKFiUaqZcbr8uJ
	Upebxu2YS57EegmEMeQ/1CYvGJgALFlDb1vOelMA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_180520_888028_408192A6 
X-CRM114-Status: UNSURE (   9.21  )
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


