Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC02CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 07:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHT4Mxhe+zSodIVHd2qzlGnysBWHBxMufel41tGudBs=; b=3rZjgX7DjjWX2/Axs1cbA+xQrh
	KFE8UyQLRc6tYL2jUxGk02RzBYRBa/V6be1d2XGZWoKgZHJdSQe3yiHZHbZhfhPcktwO7tYD6602E
	coGzTs8R0HWWLoutw48jpai50eR3lzXJ9SAtVrN3a9D3daVjJPwBTNKCq+jeKFIc34Oz0I8Uw7/cb
	2I9Kk3LPKyJUc6puJyxQDbWYzKY1QzA43UutylMPNo66BuihUJQo4YY9LPWJDqWOG3FcwgFDoPYBU
	PvI+iIBQBZOaFj/aIVmrbIIVv2nTs4Dr220bM56DBtFXbTDDUjz6WWOnyABpHh45Umunsq8kbJPjI
	QSptR5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0PN-000000002Xe-1v50;
	Wed, 29 Oct 2025 07:15:49 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0PJ-000000002GQ-084w;
	Wed, 29 Oct 2025 07:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722105;
	bh=YHT4Mxhe+zSodIVHd2qzlGnysBWHBxMufel41tGudBs=;
	h=From:To:Subject:Date:Message-Id;
	b=ZP0potWUGEJJnJlGR0dpTvyFnp+9HW5m8eBLSzghIm1BMioCwhr99HXC/coVmaCMa
	 HtxkBOqqvDRRNkXj5VRArWuZhbBD+Jo1Ueb0oNmyEFWCq952svOf6Aj4RSiDA+p4up
	 R3Lk3O7boUzjw4hYgDYBWUnWT7qvtPl0A06J1Adg=
X-QQ-mid: zesmtpsz6t1761722103tee7fa66f
X-QQ-Originating-IP: Ik7AVVI+4BnZaf1rl0zVbH4aG4jaNbSh2N+2iERqELk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:15:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6689497526499472264
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Subject: [PATCH v8 04/10] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Wed, 29 Oct 2025 15:14:29 +0800
Message-Id: <20251029071435.88-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NNgTDNpHPdfoSadMONWltYKZnnLo9D5gXeruG5XLO8PXo4YdZ3JDGtAE
	2N9VIyPNwwHpVdBAJI2cqrO5UHF+TtEZKj95bVVA8lvWkiI+FCUogw4wtzhlbKu/rtcm2rD
	P+IDwVvQH1haTBPusFg0Yh1Wb0x/zuq+uUT+xKS3bzzjZ19Dxn9MIdfAGw0KHb+3NDJTeLE
	kAhfhVCaRp6Ffu9NChKK6nKWB2tPgG/HuO/aCcwMQiYtWl/0LOSpZcdTX/knzMAH1lVyXuh
	fO5T+2tgCji/7cMjaPQwKsc6ICgf96396B5YCJmEp7ox2eskYZ7ccqYqB1WKQ9cPcOeXpTa
	oRArcN8mIZc3mvPepo1KHJ/N3kJhZqe5HJLI6w78LJor6B83Mnjw14Yu6IiGUVpO//3bU3s
	DIg/zkPCz5SzFSIGFm+5OTAMyDIWUryvcJ/7sxLDVpOEEN/Mf0Fk4h4o7+3mJ7vW0pkSQFa
	vwLnIAlgOs1H9TY64pv8bLFdD0bZgwtnlnsFaNfjPp+RxBXT3kGB2JBqOSE89CWpQpgEJzj
	kz7yaVr65mQ6bySG6qDGF1mf+ffYGUne5zZq08Jki5PLpyWCOMPf+sH6uisY0XLfULhZpYt
	O0MfvDKBh/FjeOrc4SANyS28m0+sVyTmZCzkI8uoZlOQ3iqaHxfAlpPH65XkZYfeF+7wy62
	0sNWEgRGWG436TyAoaCoajme//38vIG4zjJ1vu4o9RPxMdD/hC07anjw+8Vbb7dklVyR3dO
	4aO6W5k4S1bkWZZFfU1/JkxzIEjtUrDcZxhsdf7Ce0VDZsjnXGN1fYC4jYHbrLgfU5cbVUH
	ODbGGCh3Hl91WoFd4j6f50AfhKLKt7A6OXn2p5RYsDC5Fz+k5hr/KBAqb2u/YY43GsGJ4v7
	Q+wwjNhR/xc/YQPUf/IT47d6DhROonJLs8Gdvpkli0CGsxUX4JmmBj+VlfWofu6wBBgaRX7
	8VjUzMvdvKpRjN97+CzlL704WOXcGSJjjEecs61XN68YxdoDQzEF4N52wYOnHY55+OZGM0Z
	5OSEbw4A==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_001545_480168_C5EE1DA1 
X-CRM114-Status: GOOD (  10.38  )
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
2.49.0


