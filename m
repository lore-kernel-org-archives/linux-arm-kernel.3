Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AF1D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 01:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnSe20UyFWhCBwFpCZUGVdKqrQwY3y7cLZdXieRNPhI=; b=rXP1DNRp39EtZHz85NMp5FkwNS
	bUETIHZEnGA1MOO0WRn24p5YhJ2JAp9+csJBlvtTFhccFaHiAw4OZNiBU1+agrJL/eHmDTj27WJYO
	3XkWI6A+vUpwsrE0Wx4UYyZHuSASB6whEWubcr64vvuoQ1zHvECxYflKjAOtrVNsbkAL/H0B5lZPR
	IJdu0mL9itnz4jk+A+lryI2IzajJSh7GuNKVA0S0qnOh/VEERydxi4ZICoT2/jvrsagKBOq60Agvm
	QUVGQa+XdDDgVjs50CUq34kzoOQ2yPpJAYBlOfAkdxmouuD/BOeB8AYbR5bqfTdrhBafCyESSA47Z
	1tfAFo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQUJ-0000000CQA1-2sFp;
	Mon, 08 Dec 2025 01:56:31 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQU8-0000000CPmT-2rrb;
	Mon, 08 Dec 2025 01:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158942;
	bh=BnSe20UyFWhCBwFpCZUGVdKqrQwY3y7cLZdXieRNPhI=;
	h=From:To:Subject:Date:Message-Id;
	b=aOnXCzfRsXlYhtnp6U104QaN/b2xX2MzkKPz8FhYJshobpO7ivOmcHWGYTQM3QUKk
	 q2aI2CLX9EewZUOKuVb0yog6Nx/Agw+KPq7FShnLqqFkdNDi7L/VbWJae1NAjO/PN0
	 c2t6FgTMkjP/kjN2t+4KC8gFIse6cjaJMPNd0KFk=
X-QQ-mid: esmtpsz19t1765158940t25fd4027
X-QQ-Originating-IP: Z7MP6ExgaN3mQHGany79bTHA+lgk9L8tcXkCb4brfTU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3174573280846271733
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
Subject: [PATCH v13 07/11] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Mon,  8 Dec 2025 09:54:56 +0800
Message-Id: <20251208015500.94-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NMRvUBB6DcheO/LpO7EQVq5SsVkr4F1orMDlMYb906p2Mki75FYkPqsK
	AFK+h3wejzEuVLlsBuQCvP3Q2zMC38KZstl7xtbbWr2SQTWo7UXrGQCxEhT9VIFZoH49PHo
	Ptb24jPrWn7AuCKItRhQ4lpdAZd5g5qIbppYPUfjuxfG6GIhtXquQfGUfJgUc4qX05BTpFB
	bKlYqzUqPqA7FFAUvJFl02SpXucEs+eogbkpYirTuwBb73zxMURAVmpDnrh5tFXnUMd1dI2
	RxeSoSutPp7BXjbSoN/KYQZ5ZkNeBLAzkl/MSpAmJYK0Z5q64qWe8f8b41IwkMdvXJwMZa+
	Pfh8YOKRrxq49l38pcxs+IQrOiqIfYIi36hrdpmkNXwEwlhxGHxmtpx+FmoRClqKCOBnT7v
	Ac6ZEE+iqGYxCnWsAILoWbmOuqBBqTiCm0H7oU3L7liflrhL+lUTelfnuXnoqE81lKZv3OF
	79XBw1RHDrFhByQKT9zgbPJ1GUZJR+tiMc/P6J+ahBUBzNNRH473CilWQF257zuquVnLVmr
	AWrvyBtHLHOdEpQhc0HmxzUlbjxlQjZ1qcfScugUpDqx2V8ysyfai10EzCEZdLu89LpP33S
	djwYxoKDZVWUaZ6Buy0aqsWwwuO5jCredqPrqO28/lJXPkzSlu+ylcAxINdzTz6YSFmBou9
	Q16MafJ4FPl0pFymTJvclq5/G6HJYQHpkrnmKnaFVfvs+A69sYNOpcAMEoLyFeYjCZ17G5z
	c0rXGHIY6BtDZn+eiPbAqJTpYDOGOSMdpW0vVK7kgGpu9NkyWDsP1Z3oxfsIgA7YMmhEUgj
	E6SLbZ+i68uCmCXo1v3ztSyKS9QnMZEqE1NFxyRsVZ33+ds8ao26zfUccXF7fv3BeigjX8Z
	LsolIdCoFkZNYxvsO0pt2vRCS9P7nvaNVqrs9OTXB0dBdtIuIrHKnpVBmpSa/qje43FBOm0
	/MosKPjkpK71azgd06YXTv9bUPtwovswmt/7XiyL3ULbzNU3YIipzUg8hnSlL86Y1K3FA2V
	x9XXHRn3mNn682hVhPalDR28xX/Mc=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_175621_289618_906D2F00 
X-CRM114-Status: UNSURE (   9.90  )
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


