Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6214ECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTE8GiUrUtEaTT4O+e4/NPc8OEJgo20N+GCnBt48BNo=; b=JxQHphk8kHyyajZJB4k4Z8UCdx
	AwqwKYVB75widFORlYAnj+cke5VvKjDPrmG3oEd6uBtXGDVHjqSbSuRicJkiRvq4OSi3vlJEuvTLX
	nKalOGz6cqu1Zd3deOyqdoCp5j7iaGOUNffwh6qWyhJs/R6pXWvi+7sSWj60c4YGxANLfwzS4eNck
	AdEpgqegf1gKlndDj3gVlOoscn7sI7ppf+JMHerTPlaKY9KnUBKr8QQ3qYcwX1U2V0uzWGcXdJauS
	svD7zSYz2QD3LDDXEK2+1wb8biZ+HPSR2YuQqbOMxMW9LzrUopUQIDAvoNapyUWlCQbokl9Xccgyw
	xY5DR3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjlT-00000001UfV-0E3C;
	Mon, 19 Jan 2026 07:33:38 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjlI-00000001UI7-2mPp;
	Mon, 19 Jan 2026 07:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807911;
	bh=mTE8GiUrUtEaTT4O+e4/NPc8OEJgo20N+GCnBt48BNo=;
	h=From:To:Subject:Date:Message-Id;
	b=DuiMRdZYg3QDHpFybCX0XJ1dhFeLmscA+wE44lvyEkBTWP+HNj1wzxf7AlgXlSL1C
	 oLi7LrXyna1WMBi6xZW6H2UVTQz2vOEGDMVDTbUjMnhcEBYfzrmDygPoI321bTA99c
	 W26LqNdJleAh9nnXx1V6isTzp511JDnyajsb1ZR4=
X-QQ-mid: esmtpsz17t1768807909t6177b3cf
X-QQ-Originating-IP: 7rQc2nr+44BlSU0iP8JPeW5epauJLxNX/QDEkb7wpC8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:31:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12188449118939079178
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
Subject: [PATCH v14 5/9] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Mon, 19 Jan 2026 15:30:56 +0800
Message-Id: <20260119073100.143-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NNgSqAauJRa7IWwn2f5/mdk3nt8o+2X0beg5wUexPCsYt2e4BW3uNOh6
	yZM0MwsjJEZb8nxe4k95oS8jTUw7lfYt8MU/vBHQZnln/dkgKiNnt1ZzOy3ms38q24r9ZVR
	VCBjgC7vfsq3tyy3MtazVOPS+d2tWR1v8dIW1CwDdwmg6ODz4XdyRb8VtwLheghK7/u3eqQ
	KW3Sz7giRn48oQoxswhLfPLt2dtFIilYkC0tqEHpo08MymA1lfwD18A0ZPgYZlcU1a64/fD
	jwRh6YAkPfiad8xt571HJDKTbPkX+5U49Um1roMBhAf5y/G+eQCe8Woe3j+UfnDlD49RaaD
	spHjYWBLBEE+Mlzc+kv94jcrMXZp5KkieNOLhmzX31+j4Rn7CIVCtnl3YRwd9wQ/qJD3NVB
	CYZ02tWSRsnZiSrtz7qq+uldUYsSuQVtHsXGHHE6hQeuFAcyh+gRgmnIYcJFqTeGwv1+ZaB
	6VEAOVSKTffRkxcsDShY4SYFkR57jrnnfUC4gNrm3yUwp9AiRcVq53M4BYmgHuUf9FyFt6n
	d5wikJQfujTCZZbQc72KYYz7CrUiVhH/DFQbF4f03vZ+9ydKhCbN9oKU1UnWsvwIDHpheXz
	pHxbk3vlowjBFzOOfOWTI8VKEnAiZfo1lr9b5GiRAUbKo7Va0SJZWZbbkYl+JUjXcqyiAV9
	fHw3UQr09nHqy7/f0nLi7JCuumz/pY3ObfuNZ6tP5i/mEBO4W8/DDF0kxp7TQZPAKLaa9b9
	6HOokTDMmm7fq4T4bnWNZHHnGQ8J9BekoOE2cu8UJ/dVSaF3SrkAlZiZOLtwjQGTz5lyEwi
	vrTzZwGwNrs03Tu5/oSQpeKj0L2jeP4seH9HKVfX8vrsoM8JwLxFGk+dacplyB5EJg0vwmi
	jMX4xmdmXEUeh949lTkVVmiUjhq7yjC2sAXOrNS+hEqtKatulDfavIHoN4t0ZpBwF7frWdo
	kl/c9u2VT5wXJWRf5+r+YVTgUcNpSukQc4ii1BUIjiB5OKxCo1IjPvZML0I3jJD5ZNBJuEO
	YvHo6okkeDMnZuyQmnekWNawuq0II=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233326_883617_B050F829 
X-CRM114-Status: GOOD (  10.58  )
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


