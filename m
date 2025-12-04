Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE42BD1D86A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 06:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=; b=gqnr1B3SgFCvh3zBt6xn5gDEzS
	GxC0GbGIjN/SZMlA+4mzESLVzVxmytslwdT+nGOC42Mb3w9Z/I89D9zGC5I3zJ4kLFrtA/zcL5+bj
	xWAE6Csh7U8tsNr5LlbjdF1U/arfhySHToDq5NxYV2xAFZlNObHxjJa2A9nw3iu6WWF1occ1OphCd
	17ddWuyG5XEwnR/rrickZS906VD+wAQA3HHGeVaySBgOejrgNmtlWTnXg0t23+rdn9nC+WHR8g2jb
	eKf9AW8m6b9e+tnhbctaizyjrZnUksKvzz5D7PQ3KZ5bKKI7Olo8LJOmeuSG5QLnU/SUyTKU1hCl4
	5/V5RpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2uS-00000007ZKb-2CgF;
	Thu, 04 Dec 2025 06:33:48 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2uA-00000007YzP-3Kbw;
	Thu, 04 Dec 2025 06:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829969;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
	h=From:To:Subject:Date:Message-Id;
	b=G4rGFW6BaX1A9pLnZqYAWDT90nj+jccTFEb10JBP3lMvinA8x41QCcCvnAR1JBpuJ
	 BNAz6k1OKS9D8RNK/1Syo4y88Msbj6iju6qRNJNKdb7cpsnKxuVnLcKEfv6cqppkdx
	 10hfccrx//zTPrKEHb4WX1O7v7x/F8adi0Th9+m8=
X-QQ-mid: esmtpsz21t1764829922tecf1257c
X-QQ-Originating-IP: NiUTsEaeW2rSOfSbtTwTjvQzd57obr2vgj+TkXCiLyQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17220348659415043936
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
Subject: [RESEND PATCH v11 10/11] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Thu,  4 Dec 2025 14:31:08 +0800
Message-Id: <20251204063109.104-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OE2SNMSfMbmORXJFDxgWUZpNiUQhxcqS7G+Xvxu19wV621SFL2pzUswS
	cISRPKosqbWPKaqCiPsrUnR/34TN347mnU5jKczZnN9MBS95egNy+eNd73CYc7SYV4KB9Xq
	RbWd+BV53Uiqz6wMfreysQaBP7vU5dplvbzfjDIfUw66gXFyTLOBimxWPb6oHiCQeQo2yTu
	B1CC2acAz1+yibiz4+FKCjphQN5BHSUBalChHF0MCk6NvFeroc2VlnuLh/2YPbiOUp6OePT
	9QJZwGo580lGCwkRGKWOBYrcx5DP7JuWCynCgfBn2smF3PBiZLokdEbxJtK25GHmfu2P/hr
	mzjogx+PUwb8OpP1Cd52e69tnMlMVq8CCc7k2E23MqGZIj8q8VIc7NrYbSkGufJhodw10Rv
	WRvzoEoPZO632ahq9U6mzTkpHwLIxqF1nyb6k6LyOVt7/ITEVgN74dfLWXegtdMjLjb2aa0
	YJkHQFLY+4hwD42CNrI0j20TIkbTVfO3s2Af4CAZpVL6FY3D9n9HY1eOrDuHfG0CKkYR1uJ
	l2irTjEyBrsrHgCPgmbJ54RQJ+hVXkRjx24wmutfxpsL3JHZkcQ+XGfMeGkDLU+CvEBH411
	TaqbMbM0oaJiA912aQyEMeB+lzlo5fwycwP3G+ptwtX0E7QDLKAQ+hePRwNbEY5QyxoSsOe
	D7CaXFncHeUBEyhxsnSWW0InVGPTEIryqALxqi5RhspLlF4ItLm3CrfCA41hWgjTd4vcF5B
	lcSG5Rn+FcVaGoJSJTlM/JG0W/+E7ipXd+oBSjFYaQAos1/xE3nJHdOtoXhbFSAm4rOkJ7N
	VwotH9A5kATOduU+iyf+pkumY8lvIsRv7Dk20lb+aJmTIazmiNMAGfHlCEdB70j9ipxbsRl
	Vqp5o3FEM8xlljOAIsM1j1oiYCobc/Aiiat1Bl7gtbuAYS8zyxgYt1epsOk9Do35Nq6k25Z
	ja/UVB9qoYa1h4we8z011NjIw5ZYd0/NLmHuESO9UIWmzScBNgqG08mB3DX2mxOXmsIQ=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_223336_674138_4C7B0234 
X-CRM114-Status: GOOD (  10.62  )
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


