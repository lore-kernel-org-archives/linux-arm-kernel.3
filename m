Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D9D1D870
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 06:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=; b=ZjCSDOF2gtdFp+dN1IgFlY7QGc
	PBD5d7j0Ytlfz5VMhVDF4BGQ1j44hVZwYX+x2IUrlf5Aqw+UK5iZjpFA/bYvclUqX96QvjGU6tnf/
	9kMJpiVyOvEwo46aaAbfD6YMEJJjvyjKf3dWfn5/4TrZ9UMjRQc7Q5xgHoDFGdpmf63faRyAO533I
	KPsrVJlBvDtUJkIK4SAPLEiR7v8uOZMVoQRWmn/n17djQHMEmy60FQgT+q7+GrxHhyG8mO1srzkRs
	02Drh9cEyB13BfFKcgUbaSVjtD3MUPZGeBcFKI+NkI85sbMvL2m7q3Gw8MmrAkKkCqFVosZSAlMSl
	eQ8KOi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2tA-00000007YDN-2z5n;
	Thu, 04 Dec 2025 06:32:28 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2t6-00000007Y3b-2VzT;
	Thu, 04 Dec 2025 06:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829903;
	bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=;
	h=From:To:Subject:Date:Message-Id;
	b=kRpgUhhNfYRaZx76DsJIRb1mmAzUV1NkacCSW0mab+vovGTToU+BdDWRnANi2FbaC
	 6oT9ZvwvuIV9PK3dhl/e7FXxj2bfq8iBqqcn7pWnYZyTVUzdtNQIZQlhfYJPedTbDF
	 qmcsbXiJK6CWE/WdasX7UGAYOX+5UXtXZZSj8wZ8=
X-QQ-mid: esmtpsz21t1764829901t850da7da
X-QQ-Originating-IP: wgvjrv/PRLD41HmZk2wez7kJyb7vhhQ1dL/YivSoVYc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4498374680737007808
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
Subject: [RESEND PATCH v11 05/11] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Thu,  4 Dec 2025 14:31:03 +0800
Message-Id: <20251204063109.104-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OAowhIcaKHQtd6oVjnadb7YVmufdYoLBT/Wp62DQ6NveB2hMCubXS72/
	GWhhVMJnPV3eKOXm71403zTDlQG7Wf4sSPaUgsZkLenDPrELy/tJhDJZPWRSyXJDuHRkFIj
	w78S9rQlf4pldZDmrtxhdayzNblLj6TVIYvZuIP2p75Y4GNgZASTRkMki/pw9kyQkb3l76p
	ypBuRBt7D580ou3NqWiBPXuSz/+HJ/H18xw5BaIIrHJxTlgBcN6fSaCTFXc6Re/XSjEfvFW
	f6Ca1BOvY7HnJx5Qty00iShx6D3yosc+MSiXm82C9S2vvmI41X3xSOTMX+Q+l7VugvBFh9T
	Vnxd6cRso0bJIWZTs2Ec86a6ZrKdeJHjM50VehRbI2M+DNKLx10ttqvq9yXzkaFPPSZ6ikX
	9MrKGkhSj6NDWdmt1UYd7HPylSzOQnT5DH53ueyrKbeoacgMvcR86UlNCcYpSKhcIhL8VrE
	2xVj3hleGvayOA2sgy/lhbdeQjEkjarcnvb0/2EY0+rWm6SUCFkudlt9rgWq7QfJGJ/OKh+
	zh93EbnSJQAeyVq9BFX8gsCahNs9SgWqRfvR65aQLOfCdTPVDs0VNsnsAr0VxkdbxBa7LzM
	hcrGqIbVUgCR3MBNR/KEJ4E3GuqWTFzVMSyMQzE73wPul7CGyMMYOTj+3y27CCcp8YbXdV/
	lf5lwCWPloqZIfN736f8O/CWE5krt9+Q6rVz+jYlK/mi6n4JW8svclPeUxrY31OQq6t0Z7W
	LKDqVdb/jGqpD9qAN7hoY9KyJJMDwoT1NwENDPxZbg7yickBxUltxDBZBryNcdoPj2VYn0I
	GeIPYXbVF5x42JZLkHugJYzvIAPSPQ59Cb9yt+i3KR6Tq9jSon4Pk6YX1xjqVKJzX9mk14o
	k9FM2RufWsforlYV0rdpz9LeepVjcy+MxMzUsClLcdCsAN7/C9MF/VqBVOSuZFSN1qfy6WG
	LjM+Mh3kEOu0E8X4O+gEnNjRBbTgBxU0j59PE+ZAS1hJZOIAzZvWsWui5z2XBVm1LF5PG7t
	hFvasZkvo058WoYfszDraavYoT6gN04R+ilxNYoA==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_223225_659421_FEEEFFD7 
X-CRM114-Status: UNSURE (   9.63  )
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


