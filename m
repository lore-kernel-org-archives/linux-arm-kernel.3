Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4018CF58D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 02:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/IF23AwLHF2BuDE85+w1cIAuWmxkHGHVECAwuwTVkE4=; b=i6NgmBBK8NCP3OD1qGZ6zI/HoY
	rgPxK9peEzZvz2nD3ADasmVe1ot7Y8DPmaY/IX52nDB0G/V2OGECPlXZoZ2FCsFr2AE1qQCfa3gyL
	e3iFWmT/reNVtQOTQ0W0qVsH5OkkTlmIKiuiFvM6In3X0UfuKF/cqmKbpm96UlwqBcuWuaX79Qpy8
	GAhckKTHnCsO3WbtSEl0hJWpR1UlTNpsoToUrAFtm75yhXyXXllzf9Uou/co1ZxxTUF0iq49yiMB8
	XV62kCBjWeftFCLx4S/nuf5wGSzB/HSyDiWCPBRQ4h+aoMv+sI2Z5QqlTDwDfAFV1fBdeg1q8XyOQ
	h9/Ol0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuME-00000005ygl-2wSI;
	Thu, 20 Nov 2025 02:25:14 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuM9-00000005yKW-0IpL;
	Thu, 20 Nov 2025 02:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605464;
	bh=/IF23AwLHF2BuDE85+w1cIAuWmxkHGHVECAwuwTVkE4=;
	h=From:To:Subject:Date:Message-Id;
	b=m+EW7rZS0meZUh1l/4OaxB0X7J2kexbNKVVKKR9xo+Qk37E/9HumGpRj2ksn5/WdK
	 2ERefjydTAGI9KOi7RIGq4YVi0mJCXMyC0tidFBwzxGuYpixPSo93NMyHqUD3XrdCG
	 UHRTGQ8Fhbwt9NN+NAFfRBt6DWtNG0OKQoqj1NXA=
X-QQ-mid: zesmtpsz5t1763605462t762960bb
X-QQ-Originating-IP: hdCmop6+IrM/3+WRb+UwDEmL6vY6WlZjSA0i5Kppr3M=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:24:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6704151892834101465
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
Subject: [PATCH v10 07/11] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Thu, 20 Nov 2025 10:23:39 +0800
Message-Id: <20251120022343.250-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NnBlO8MsmACrRff/5IWYDaIcxcnVMxjOCV27F72fIB1I2//FSXCEI79E
	xC3AQWrlcBPZUNJQ+BftWlTVQ1yKQZLmWN6VfsFOLRiYa7p0KP3YR66CPHJ1MuuFwpOUyXv
	qoFsd8YJwTRfMNj0D+znyfru211gS/kgHdTH9RXfZuvYDhtG4/delIUR2TPeVrASMuinIlq
	OVbiKYQ/C4ZenNoMboE8MPrwMFy4PYlIpNVto33ei9P2A10FockUDY0j5MziN3KSIc3DEiI
	qbZBV6MUEWwK+FLBUQ1B7msXMvMBkGZHe5dRP1/fVXYLlXv0LClee5vPb+rM2QbPUxKu/6f
	iY76TVOBbWvd5P1+iL/M8B5l1Vl4AO68tRsRICUAwHBrMhdlqYpDo3dZ5IDoUTsE8K2g6F/
	jUYxp1Gakqh6/3dMCTcjw9j5MsH0ListnCd6B+Fi2s0Hck947HfbHMQ/9d07bFFM/qN7i1W
	khOa2lLA5+gxwtZ+VLTER17txQfJ45WsOC3AaZ+PmsPdpeBmykGBAiudmHaW/6p2SwFTwev
	5SafBNHFnLPm26IJ35r24Q1L2gdZKkCPemThhNqbBlY5FjIROONw6sxkHmP8Rl7sgQwOxg1
	C2W48ge2nhxji6EzkXfSQbWUZxA7O80odbL/LHcJd1U3pAqE6b502XmhAU9LxSeDN+oY/LH
	NO/M5nFzb0D2WBH6ToZqu5csFHG9Al0sBgkj6rmGhqCNtMHzMuCVh3Ye++ursEg8yiAUlEw
	XVnNwu88EUYHKfmlEuBZFutGJyUR/BR/2hCHyL5Hhcd04P0sN0ne92eIeoc/DWwabjQ2B8b
	wkOZqXx0ThLHuXBCS4ETIwlDDzIfSmttJ4cMMULXFYA/dYO54Qna20YHV8O6TJY62a0q1yt
	gCBz2Tav4sBnKErMvh1C8GMOdMsVHLhPlm7oUXmMCRUtQj9rkD7K3R2qbUp5M1r4ByS7hlJ
	7qc1D4Q+x+cfpjsUUzaIDKh/l9BmSCc9yiq5bSgwURszjrKbLdiMtE5GNpaCJ2BEkIDIaUw
	YnDWZpKkRoPJahJzcz/amNTkYrss0kek3L80Llj26rdo7v5VWH
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_182509_699459_CE1E1863 
X-CRM114-Status: GOOD (  10.03  )
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

Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
device.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v10:
- Use drm_aux_bridge_register_from_node() instead.

(no changes since v7)

Changes in v6:
- Fix depend in Kconfig. 

 drivers/phy/rockchip/Kconfig              | 2 ++
 drivers/phy/rockchip/phy-rockchip-typec.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index db4adc7c53da..bcb5476222fc 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -120,6 +120,8 @@ config PHY_ROCKCHIP_TYPEC
 	tristate "Rockchip TYPEC PHY Driver"
 	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
 	depends on TYPEC || TYPEC=n
+	depends on DRM || DRM=n
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	select EXTCON
 	select GENERIC_PHY
 	select RESET_CONTROLLER
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index 1f5b4142cbe4..e31b778c3537 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -56,6 +56,7 @@
 #include <linux/phy/phy.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
+#include <drm/bridge/aux-bridge.h>
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
@@ -1312,6 +1313,10 @@ static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
 	if (!of_property_read_bool(np, "mode-switch"))
 		goto put_np;
 
+	ret = drm_aux_bridge_register_from_node(tcphy->dev, np);
+	if (ret)
+		goto put_np;
+
 	mux_desc.drvdata = tcphy;
 	mux_desc.fwnode = device_get_named_child_node(tcphy->dev, "dp-port");
 	mux_desc.set = tcphy_typec_mux_set;
-- 
2.51.1


