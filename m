Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD5FD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 02:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnSe20UyFWhCBwFpCZUGVdKqrQwY3y7cLZdXieRNPhI=; b=qFh+uJsYCnxVS84+ytJYKMryK1
	t44k41Bj2Rct4pIFuPpHTwf7fZm3lneeWyEcAzIPFTsS2RczYDwE6elfZ4ibVqh2z5+FoZ23ZPkKZ
	f6WDmXUujB+44zRsOWgn8fJvcqUP/Tmi8cazmo3FESinxhrjN71HDDAvutArZk4dI5coc7YcBCtR1
	vPQ4hyM9CeVhh1nSXP3FcsQknfjW659eywBJUPUS5O8TATw7i3DqZhQVaAYd4Jyurdpk9s8WB8uuV
	xKfLH4a6C9IAOQvUTrCs3VFvEdcB9sRSp0w8T58EGP0egE+hmnauZbfUxe1eMZeNwQgMNFBrHeeHO
	PURbp5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnrp-0000000HQnc-1ezv;
	Fri, 28 Nov 2025 02:05:49 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnrZ-0000000HQIL-3n8M;
	Fri, 28 Nov 2025 02:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295490;
	bh=BnSe20UyFWhCBwFpCZUGVdKqrQwY3y7cLZdXieRNPhI=;
	h=From:To:Subject:Date:Message-Id;
	b=he0btbYJitsPmxGhlbpYVp/Rbdu29Pv6rlM8G2ZhdqR42hS1AchtQCMNsrW+XA9Lw
	 Zx/a3x76WZ7Ct8grIWDIp4rVHGi6flLcvoa/pnt1NjUsCrHtMRw0G6wgqOElu3Ptf+
	 WTIvQC86FU21Keo/dUgS5Zj5Y/Jyzw/jsVu6A1jM=
X-QQ-mid: esmtpsz21t1764295487t4741a73c
X-QQ-Originating-IP: fhy5DRa5i3V80+bUs3WYZGySAtuFFVaE7fm+ADYYEpQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8450163399619758520
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
Subject: [PATCH v11 07/11] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Fri, 28 Nov 2025 10:04:01 +0800
Message-Id: <20251128020405.90-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MSDmV4hBxmsCMpUywsvd98VfPSec1iASn+xsqpwWeVzVRlDQqvM6YbZR
	6i1MLsDeOWe1q3MviBD3fhfckxY+kYZEeypbWFuWQ/e0ihTfeul+sacO89I/GR6DKb0m9NF
	f3uwmbFuE+v/6Gup4pATYBXVEUFgDT0iRbuE7T2eCyskb93XgOqfuOWqYNOCnBYi0oD+Y4u
	loL4jxwTfiXlKIW6tLSIEZoNBmWYvN/KyjdHd0mqoMrf1SQKVLRtSONCNddZQSGQd+DAGnU
	90yAUaVSM/2aTH21tkjhEiSd3Nbp25gELFPlln2oeB/2QL0uL5kpeZyH6r0J6lh1kDiaDQ4
	aILdaZiHUvc1WLdSFJqcYTnsooB/uLcXiab/2lhd36QPfYfeZh3Kiutnm+m+XCc2zJTXSRq
	gaDXj49Akl5qJXknD7DR8EoMcGOXsxFQiK8SjUaaCPoVF9AaV1X1B/SVj7rFtjCx7O1F9mB
	ZR/aXQwZPjq615z/Hs39XBNpeTp+Nlj8EIABVevW80CYubYiRiB6saHaLc+m6ErAu7+82kc
	viUUAwQhUwtCSldc1xJeIXl7fM6K93ebw1D64QbPvuDUZwX6XXMLwu/5W5JLahyeRYVZBlY
	qT+x0U1bLKK4flDf/zOWC7yszL7DcAz4bs6PWzVFJyE6k7NFREV9mfGG/4USG1zrGTRgai4
	Q0xzTgBUFcsTUCwiEy3l7ZEXkVu6RbNcaKCpzw8BhRHZlpqQ0mwg00HZryHWl9iMGalusBu
	BBmcf49e6V4AFQ5Is51GoZFHxD+MTkhpv8PSaqAAFc3gaegRtwPXCSz7kosqirWyGhSrbh6
	vDlf2fwVgYiabdEAaUM4zXaqpbvzGJEoLkY0jnw+wsO+y2vkyAVRRMEtCwsydtX6EwZ7s96
	MDrqn0h+Gx967RM/Qe8bnnSB/wO9/Qh8y0Ixs1yVX2aeZPeDSDv2XBQm4FNDzZ+PV53RKiP
	NZj+tFOuE0VEO5EIr8NEERurlA0cGjPS9at9IYSp+BbGn25Ki8wjMdNG7V8fPqP/nuNORFp
	KLAH6h9ThcmFzBbDo1IEVA/Nk03Ix4mBota3RXUA==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_180534_451056_3C5F985C 
X-CRM114-Status: UNSURE (   9.75  )
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


