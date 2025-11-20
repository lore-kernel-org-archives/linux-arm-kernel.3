Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0CBCF64A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 02:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=; b=ndTc/es0DiNCs0Ub7fVzvtRcxM
	HHFaHFogXLoGI/NVBKkoYg2nhTqpcHqZSiANsh9veJBNPdYExsWGgd1CjXPwQcRDYi7n6BLytCxwS
	hghZOzBpo/+/IU6DajSwXbEl5l6XKop0S2Ybs2lyjyzuNBP6ioXN2j1TEQAgVH9CBrhfRyjHYQ3IQ
	ope2awc5E5iIpxRykCQET9nxqBnnRSRnhmMCogP6bmMiNDkQMrZMzVTLhrKCcQ5P+1NM0nr59d4Ty
	7FYJAZJIiVK81zxahxORDe5FrMYMfk1Mrus96jmuJqeXzlzpbdMVUE/yG8I23QwWSUxU4qKKkykX5
	/jhWCCaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuMo-00000005zHs-2eOX;
	Thu, 20 Nov 2025 02:25:50 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuMj-00000005ynJ-48QC;
	Thu, 20 Nov 2025 02:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605511;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
	h=From:To:Subject:Date:Message-Id;
	b=VU9kbrHXhzZAxkouhsjAqUccvQznKiVnHK0jZTSQuwyhp9sUunEhpwqLI0lBMCzn6
	 Pd125BRmVFAJQqUZ/1dc8gxyyXA/skEv0a6EWYhmR+j9G1DCMiSpKXYT5VeAWFbmVK
	 0FxBzIGHxnPu3AFM0uDDet3wfT64ynf7VgFp6YFs=
X-QQ-mid: zesmtpsz5t1763605475t5758b803
X-QQ-Originating-IP: pDz7EWZhJzQQujm3af9e2JLj4n12gmSAhoVFGhYNXPk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:24:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15460230959253220818
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
Subject: [PATCH v10 10/11] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Thu, 20 Nov 2025 10:23:42 +0800
Message-Id: <20251120022343.250-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MVbvI5amSZ2YjBsber5S6w8jHcZ3/IlNnwnZbx/OYeKH5DE1NqWv5ki/
	8DyqQkcCf/YohZXXEcy1ltHUJdvlGx8irD0tjfaD+AfOofcYGEp5U3tafYqp8bnXj0Jp9yR
	rUh9n1mRsBCZUaCV//cUGHXpXzOdF5KU4zKsaZcZIK8canA8hmoT0g6fEeWqVw/rAnjy25Z
	ME18BrAU2GXEYyG2ARtU32o3B6M9H23utbxR4AvXg9NCtCO1unRhTr6YXF6ZgsqfBKFXv9K
	zX5pHSTbI137xPPWKfQcdml1MQQfQiomK7pYN4nGBiOc3wIlywOeqJs0RbYib42j91UeD5f
	w2CxS6b9lqXQ4bMVM2TsnpAeBwb5k2yIzhm7x8RyEQr4to/8+7ri8E6p80eS6aA6o2+D1eD
	jMWOcHq1DIe2AfaaDx9affYqicA4cYyDNtGx/3Ywbzq/YC8C1EKTtf4ohghNSwRwEScVuvk
	wNhd53c/lM1JwTrjRK+ODIfRDjJhu8ROEnsdfsl9x4WfHhh2k8EQGG5axi119xCtAAw9xC1
	shjH6x3y+iDU6LWOyBrNXf3S4ZgBqvWzlnJ7xW2bP1fAslC1BCrgtgBsyODP0xrGD3ifmyX
	C9qBLbpG2nkITl9ec6nnwi6R+69bnVTDkLdxhBzAs8AhWctcNIkTMqG4cq0Iq5K10ZrNM7x
	dxYpJyyxS1Lid/G0tEai2TpFmQHHij7pwAfnU8nDODVD83NuqlX5psitJH1Nz/Pwc2qyu97
	oEmAv+xuIlV8xzpTTTFKPlGdGudB21mGe8pasAx6jJNdTzLOL7WFndaTT2hw8UWyovDa23E
	KD6KV8b3NGIsWtQaO+vFR9pC/LbtCa3tS8PXZ5BQ4lyV3tvoXIqXdt7QC6kYV5n4223W/LW
	3sJencajobmEsL6uTyTk1gl93vXlHe7RfjtggQuSFsy6kHsbc4gpyfQIYNoJ1T7mp1tYtv3
	Dw1EzNNoUyKHg+3vLIdigEqcObTW+A8RmsKprA+VwL3HnzMrshUow2OO2OUpUTM05wteOXM
	jZuNjW7NaidIk0mPQT
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_182546_476440_4A9713CA 
X-CRM114-Status: GOOD (  10.22  )
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

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove unnecessary #address/#size-cells

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..93b42820998f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
 		status = "disabled";
 
 		ports {
-			dp_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -632,6 +636,10 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};
 
-- 
2.51.1


