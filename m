Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18502CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RKYrl9uKKYeoPLwxT7m43ODsBqPn7Ulx0XyJQsA0lM=; b=swGwdDEz7IZKY/60nWCTMD3mSL
	X+U8kGBFRmruBYHiuXznEy0mAeixQRrNEa6inDP161f6QKprLnwUtzLdv08sI0rS2STD7m+gPG5Gf
	5MOhtx0WW0KU23i8Oii7V+MWQB1LTdOblAvF/63UpBIWCNEYfNRyeUPa7/uWhmN6bbOjJu0HorHfp
	TNyRQkE7s2Moo9LB2aezqCEKnl/i+bfTlt6N/HzQYqOBSaBO8xoIc8sTjaRH+7+v7LZkHKD4Ae0i5
	HOGmxjpuLvP51LCicSjYyBrBGiJKn1rSk/1zdjLf7MEa+lZUvU0HgLECeO/qryIoWYwj4F3ePlhgM
	WeHVXI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjlP-00000001UbN-1Qx9;
	Mon, 19 Jan 2026 07:33:27 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjl3-00000001U6x-2Xdg;
	Mon, 19 Jan 2026 07:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807941;
	bh=6RKYrl9uKKYeoPLwxT7m43ODsBqPn7Ulx0XyJQsA0lM=;
	h=From:To:Subject:Date:Message-Id;
	b=m0+VERdEZM6EZ4VXwKxHdkutXvYXh0i86jixhGzmeNofFppwD87p1h23h+92MhTu7
	 wmANYB4hSWh5PqdIBlvfl2kQ/jbcCKOObLU2dqHQzgW2eDnE1vO2accU0zQlb1O9+f
	 tLggGOtOLAtVPmk3/5BvnrL2TUhzaRhZpTJs9+lQ=
X-QQ-mid: esmtpsz17t1768807939t4e3bec3b
X-QQ-Originating-IP: A7VIZcKkSbUgehWQYkOQDZdSzfyBv0nlR5sBVFW6EVM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:32:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6769309788427873216
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
Subject: [PATCH v14 8/9] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Mon, 19 Jan 2026 15:30:59 +0800
Message-Id: <20260119073100.143-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N9DIJtFs/avn469pEPR1EF5Tkm/GPRY6gFxvvNcyPU1aPjp8XHRL2pw6
	PKY0b47EmpcR9mYUyVsekGpzLKLmZzn/UD2hh/AehmC0gU0Qx6F1FnonjzG+57LO/J1wl09
	0Uw4/QzAYow54sQcPKg2ecw+qsbSCrdtH/F+axpZemO4fzLH7UuXEEbuwYRNZFvj0G2ZETn
	kIiX1HyHRKdSNzAHDBiNYtn2PIZP12+QKLCGOVxArYe7o1V+v4+SmK2CR/RyAWUFFI97vCu
	TFE1Yi2t4d/qiRb/04DYYlwShEK6TcneHhsmug7eUds3G7QyHFU1CuYWizWx9taRn8+h9ud
	Fq3tgAn983eOTPbUFuvnj5DygKcGYTiEz6d+YSBNzMCR73PQbQZFeNoVu4Ti8GW8Lp67Nfp
	Uk4CjYUQ183luSUVSxxtIbntQFsFGi3n6ZS97HaVQ6RCOF/8RWFk4+psgE0j8RvOiGf2t6F
	HDAJdXy+AJUztjZfo2jbRHdPGN4N8Ds2/fN1v/1maJ7DdqzEP7PG+T8zJDRo6i/d1o2Aw9h
	ZCnebSMJI4E9LhFPijPQHf2dSwu9g5cxR977B0ZmK00bMCfs6Gv1WOehZXfg+V3451VRxhF
	9sZHpDspovHfNvT2Tyb9fQOESYG5eJmNSQRcy1w8IUq5mheflI8m2gRsYCdaB2J/5fo+YL+
	X/JBNWg/pGUwAskNtqyr9UmPLaKh6cs/HfoObdj3c4PNuP2XSo/vm9b9aRsOJ1yduJXhtcS
	LllKEpkJdakBnr+oT6uDPggm3z9xzZVzzGI1mqZdYEKAg68p+PbImi3pPAmTpRJbsUBxz13
	ylsD1xt+dAXsLAyK4BkK7EE72X+xmK875gxhMCpEj8k1zyqdT7jrgz7s1d9gNzd8nc5/1Th
	LCYvi5Ysoft42aaU1+oBhOwPyvMS6c3iYlyQGLe/P66IkoC7yHvSEfzMLdl3S1/pSLuC8dv
	EguWeN08Wgn4yLSQox1zbvG90UbS+OgVYxTfO+8cWBGD9hYqyweVcFNrzLekfYB5ihYCaVt
	1HFE60IOWiLd76fJW3b96CvboijzL+cSMXjFvdoQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233306_311525_8922460D 
X-CRM114-Status: GOOD (  10.86  )
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
---

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


