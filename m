Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688D1CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 02:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i25gNlDAtw8b5HK1jAZXBoV/IQCgdqvoMWGREg/E/KM=; b=wDtPV3OswYf97bT7mMG5Ukbc2Y
	lSqa9fBJtk7CNZdHAOZ2MRLjMO4nphcka+pa+AseH3z/283xel7g67ADXbV58nypHsbTfHsW5LVGI
	X6AY2pi+N/CbrvDFb77YaYGhcMWQntHXgQnumb1fvMU4Gy1qCZ1fMTmUOr5fRrEtr2iHlQSYFW18f
	2rc3ZpDAldrc076f8oAf+lxc7j2vlV+YxHO4SvKiu2eE6W4nyHov4M3jB2+k9ZIfvS6w2ToLJS41q
	66P1JD8yherTha7/rvE3UwfmDN7xzZ6UiW4DOQNtz3BvGs6y3CuJmfCbb6dfJ+1jvyhSCUP+xdVdL
	ZnhcIiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Djh-00000003Gy4-42Ak;
	Thu, 16 Oct 2025 02:29:01 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Djf-00000003Gmu-2J8V;
	Thu, 16 Oct 2025 02:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1760581696;
	bh=i25gNlDAtw8b5HK1jAZXBoV/IQCgdqvoMWGREg/E/KM=;
	h=From:To:Subject:Date:Message-Id;
	b=PzX2rZEeJaOR8Kzodn1t2LlqwDFnKYRTzDihtkyFqo5lm935YqW4GWN3wlGKuwX47
	 MJnl8dD5Iv6mUmFaJXC8a32L+DHjuv8TQQVI3shgz8zPB7K0kWNOX2JeeKwKIJ3rDP
	 wGhIuHHfiQ1c3c5E4gFZ50srlPyb8bYxV8OTAQjg=
X-QQ-mid: zesmtpgz1t1760581693tcd70b443
X-QQ-Originating-IP: VcuS+Dxp0BYExURU8Vsw6C9TnS/E0vZwDdscGFf6LgY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Oct 2025 10:28:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12339062551155621707
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 4/8] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Thu, 16 Oct 2025 10:27:37 +0800
Message-Id: <20251016022741.91-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251016022741.91-1-kernel@airkyi.com>
References: <20251016022741.91-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NOIkHYnr7Vzd/tMyFT2j8ciywZ261X+hQIvnQM2uC0dM5ONQJz2lFSjy
	ZrnLXDbs+toVH7ia8uG9VKD3YnggyTWpZX1Hz7tA43ZuR2/3D+qtz6zhE8NliD23lHaXt2D
	z4W2tYADhrN054I8UFGqN8S2SjfSaI0ODDMigAGfx9kG6E/4Se+8Cd/SrsXULKXsYjW4b7U
	Eh6LhhcA022/XLey36NZT6WS+PIJRZFvk5FfBZUo/qY02eJ1mY7jVhClZoD/nb3KJ15OyYP
	EISzW0UUvSKvMkvkP/1awOU5gSKctTbzT411LPlLvOfhuSQvXcQ9v6XmFb+znTt1NxFhu+2
	tQ1jxcK5u/IPRtFUgNXmFtLtOCrncj8D7jM+CDvx3+7grRzFy/68IowkwW2r4zUegjdW6d9
	HOtrLxaGMR3aWEuBQkAGXYeGbRTUb+KJAFJ0xU/gJsKZKgUymHyqBtoqBMYywyC7qDZPQIz
	dT0VGU2aZB/kkwi2rPYhXzJ3Hr7eWFH6rBOs79EUwpRYJGEihzd85HS4V/wr22mn5bxvbAK
	M0IEqCGe6tZicvtHByS5tMrEo3RoUKvL0WkrQwQBc8mca3860uZ94kb5bONwYrIRxf7mUU3
	Ba1GGaJ7fD+KrTHK89939WuqUKTIAJtXIdlNLe3bu+BFSedbVSwwIJjM2exxzfP9Kq40V9R
	eoQaxzNH1sLuhTLCjaRCVPBGXWpsHWnowO0lmiWozQkuAaejhqTJzFecsZxnJv9byWjWwZ0
	qrM0FVhrUH2gk3jf8Xf3kGM4AFE5yJcWVcMv+L+tTiyGVh1JyspFX7pkcWfHzbJ+gsAnxxQ
	7AkIFgduUFPy9hwsrq0FwaRXYCz1sq0vdz1fecMke++my12QE7yiX3NOgUA8gN6funamL+3
	80w6L2NwNQ/IBwNrRfzg4hLzOrK2EYrd7cxjV4feg647lIDXiOO0VB6ZrTm0qr2KRn/Fc2O
	73JBOcKzH5UqDfumDMF6Hqpgb51odqMUbu5LmqMOkS9fRt0aq3B7M7jqNsLSvvwCwzlZot6
	+dgruIQQ==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_192859_872433_999038CC 
X-CRM114-Status: GOOD (  14.30  )
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

Changes in v6:
- Fix depend in Kconfig. 

 drivers/phy/rockchip/Kconfig              |  2 +
 drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
 2 files changed, 54 insertions(+)

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
index 1f5b4142cbe4..748a6eb8ad95 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -36,6 +36,7 @@
  * orientation, false is normal orientation.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -56,6 +57,7 @@
 #include <linux/phy/phy.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
+#include <drm/bridge/aux-bridge.h>
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
@@ -415,6 +417,7 @@ struct rockchip_usb3phy_port_cfg {
 
 struct rockchip_typec_phy {
 	struct device *dev;
+	struct auxiliary_device dp_port_dev;
 	void __iomem *base;
 	struct extcon_dev *extcon;
 	struct typec_mux_dev *mux;
@@ -1299,6 +1302,51 @@ static void tcphy_typec_mux_unregister(void *data)
 	typec_mux_unregister(tcphy->mux);
 }
 
+static void tcphy_dp_port_dev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	of_node_put(adev->dev.of_node);
+}
+
+static void tcphy_dp_port_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int tcphy_aux_bridge_register(struct rockchip_typec_phy *tcphy, struct device_node *np)
+{
+	struct auxiliary_device *adev = &tcphy->dp_port_dev;
+	int ret;
+
+	adev->name = "dp_port";
+	adev->dev.parent = tcphy->dev;
+	adev->dev.of_node = of_node_get(np);
+	adev->dev.release = tcphy_dp_port_dev_release;
+
+	ret = auxiliary_device_init(adev);
+
+	if (ret) {
+		of_node_put(adev->dev.of_node);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	devm_add_action_or_reset(tcphy->dev, tcphy_dp_port_unregister_adev, adev);
+
+	ret = drm_aux_bridge_register(&adev->dev);
+
+	return 0;
+}
+
 static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
 {
 	struct typec_mux_desc mux_desc = {};
@@ -1312,6 +1360,10 @@ static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
 	if (!of_property_read_bool(np, "mode-switch"))
 		goto put_np;
 
+	ret = tcphy_aux_bridge_register(tcphy, np);
+	if (ret)
+		goto put_np;
+
 	mux_desc.drvdata = tcphy;
 	mux_desc.fwnode = device_get_named_child_node(tcphy->dev, "dp-port");
 	mux_desc.set = tcphy_typec_mux_set;
-- 
2.49.0


