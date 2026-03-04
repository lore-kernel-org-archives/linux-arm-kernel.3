Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0888EB7EB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTE8GiUrUtEaTT4O+e4/NPc8OEJgo20N+GCnBt48BNo=; b=eVUKcjiBgWk+vOxlRWH1iCoxy3
	1Gtss2T2k082J9GUZ2nfvVserlw1Dn7iiePYIQy4ZGZZDpi8eHwjaCGg7QV58aD4+gGm7LVJhWML6
	IbdpHur3+mnAvXp0rXip7ZZq3FdW8hSl3JFAUkSsce7qQrUwqz+7DVfeIjVQ0agEuBs/uK3YKgmkm
	f7XV3+QH4VTqJCyAQFMkxsNTvuXI6rGATcXssiejlxiuVRPfMrsLRDSVTZCfUGCuKWoT3jDtmNEmL
	aJqUZ4PX8RorYTvCzkspUhcdzhnGa9yszqE1FGxIY4sgp+9wMYbjAlES4EPMnodF5L1H4ONH2dWWn
	dCtByu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxils-0000000Gui9-1sQc;
	Wed, 04 Mar 2026 09:44:00 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxilo-0000000GuKM-0jQK;
	Wed, 04 Mar 2026 09:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1772617378;
	bh=mTE8GiUrUtEaTT4O+e4/NPc8OEJgo20N+GCnBt48BNo=;
	h=From:To:Subject:Date:Message-Id;
	b=vXuE8d7680GbOW581xxs1IiEADIzgY1DeMpRmQDRnwSPcN57JrPALpfSgz1s9qRnb
	 VtZzL6z7Ug3HHrJW4OlCYu/j+NRzATaNUfxj2lhxrbiyFqyTOURcthDajBDuGBoGy9
	 Tnpw1Uw6SnUXqR6K0krZG9g9b5nxsL7LtEyoKiWw=
X-QQ-mid: esmtpsz11t1772617367t6a485561
X-QQ-Originating-IP: wnFhN3y/CVaFd3oZl+UUZ+u/q8iXNTDJlcnj0ij4IvY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 17:42:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16598838826590519856
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
Subject: [PATCH v15 5/9] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Wed,  4 Mar 2026 17:41:48 +0800
Message-Id: <20260304094152.92-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260304094152.92-1-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MWUV83kUVZmkjTUvPb+gZcRe1atLah6gjVkLbejDc9YjEamiMGV85c7D
	JeyqoUyc+kqRrsAAuD8GLXRjI9Z2KhA+jHqx14FT+4oCj1UkAk1RQyYR1FRn8RnM4HQexFq
	xd/1sE2MDJZ6EFHEdy8VHjR1GucQhEMjut1h80KVDLHMVhuiWVTyp106U8lJg6gNWObP6Qt
	+2J4Qw14B/fH8i3LSHQu275qEXWj4WEGf+2DCpL0FgzlsQzwcNK4WLlno+S0JItp9qraY/P
	LCfU8n6o/zG6rjdzPR6t86Rw9AsPuqGDzv6kSSHCKl/hC+vSsQXubtO70Q5yhFrPnlfNry6
	e18aen/blCmrVWFk/tb4UJjCcjNZp1RDy0sCw1Ra4mUCMds+jyleoa1U53R/h1Fli+yXXN4
	bwVqS3vN/+UDmzNO2LpnzDzi0VXOC2l+K8/gBwcrLt495EFoX5r6nI1qyGt2ssuTj/w0OJP
	png6oiZ+nAUS4pxtJY1nQRncD6QqKqIGgPznI1f0Jl0TBxLRr/fjmdw3UgICEDxQ0a/fhjD
	272y++z6wO2kyrN/usxgbM5pGHAJPaG92zU98PUtLgRyfDeC9qS83+vcx7bIXN9FNDvLO+e
	gsl8j89X3X/vIwggYCNDOiOA065Qq7TMj5uS9+hgrza9ivUJpOsU5mpW3pW2SRwRs0kmXEr
	seIuPaRZ1JNbjNKWJxju0yJWTfhjsoWWHCV1YsfA/tq5qZ6dY8X96jQITV4qVT384okRcqb
	SSXMxk1CzJjeKE6iaBlW6hWVGkDJTu3S4VeMD7WqLQWX4UwV964k7RzmMpyo2qNTJ2nKxYr
	T+/lQsARCW31+HOq4yKCi4a8/PWv3KiYSTKv2TVEM237QR0SRXFHS/wWlL5MR01Qt7iPJ0v
	uq5SLQRN/x0/FsGXRPAZuNhwzXsJ45t47wXWp7uLvRyfr/rn3swYHhWOhAN4kNW2USo/ypt
	oVEl+sL+jF0rAMBv4I6/GQCK2NRLIvOxvwkE9rs44VEzzNFtqSmSEX5kSkm65ithupce7a9
	HfMU9mH5jT6PhFWS0Q0DfcxREYeoU=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_014356_605479_59822607 
X-CRM114-Status: GOOD (  10.63  )
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---

(no changes since v11)

Changes in v10:
- Use drm_aux_bridge_register_from_node() instead.

(no changes since v7)

Changes in v6:
- Fix depend in Kconfig.
---

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


