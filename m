Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618C6CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1Tg3csBW9cQH+zLeCwL9eBjnzF/5yA0NVOKjcXCN0U=; b=HXdZre80PtUS8nyT4iJUuIoYRL
	RiXLtdsqVAaVoctRuZmCR/C5HuZIQXqLntw8LCJVLwIMRcLrCsuA6SH5QhsbJmQRgtkQrZHT74pyz
	C8Tk2XE6I2zeiOR6gGu2g1vVailCnDhCWsR3dfOJvWBPcFYEMbP83LN438bx6qtDT6iQ+6nwIZLJb
	JTIhLlYDZ6XbLeaZDbwWGjtXk6GeCa92tEkoK2jNXAIhW2JJvQsq4SlL60XBBHNCWjSnEJvNv4ZRr
	yURcsgP1/GpGqGvarnz7X4BJRY5xh4gWJf9iOYVG6Xo+P1CoIX3YV5KP6b5GVbIvCTIgg13wu155q
	00/JlByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturz-00000007dmI-29Rk;
	Wed, 03 Sep 2025 21:18:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utr8d-00000007Afl-0EDp;
	Wed, 03 Sep 2025 17:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24FB760264;
	Wed,  3 Sep 2025 17:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99C0BC116B1;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756919953;
	bh=Gc8hKhZmvez+1R7qBtxkfGOQDqE59bJ02H/Yc1b0Phs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z5iS8JgPXLTbleFtrgMt3NnyJLlz8sDKkgp71jW0ZHKi36JXYfmYJchnDzvtLztr1
	 hpvDqyxjeRZTyxR5X9YytimuOJA8CiVMtB+lummuLG5FjpCwbFEHUDodDcW9HmMQuP
	 jbAdRAtua0DSDRslnnIaQwlmfe1BlzEhJ7l4vEeTYClLToEh0NG4LSaLGuo2aT8b2a
	 RcQ2NZhzlOFTsjsbkn2YUE6+cscQhAWcUaGXm+Bs2DdqwLOI4Yn8oshQP5Ue1DTwsa
	 Lr1o7yvSyzodQd+lSnaXXke1hHO03X55zEkrCZxHMOM2g0cqdf1m2J5mZqd731pSBF
	 9KsVpXC6pUF/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BCECA1009;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 03 Sep 2025 19:04:54 +0200
Subject: [PATCH v4 6/7] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3588 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v4-6-a4f340a7f0cf@collabora.com>
References: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756919100; l=2783;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=yeQXRqZNa57y0uWiIJSkXVpQ6zTLhd7z989yNwE9ju8=;
 b=09kf8MWdVIJYt17xvFCMxwQMzZX4u4Brgl+1iUwO4QTsnjcHQsNMRCpKITxjEFx6OTIW6WZC7
 UIWb9h766jYBnPxX3zwxp41iqewKxuENTlmphSwD+LVqfdfDCL3HtRr
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip RK3588 MIPI CSI-2 DPHY can be supported using the existing
phy-rockchip-inno-csidphy driver, the notable differences being
 - the control bits in the GRF
 - the additional reset line
Add support for this variant.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 6c4ddcd7e5de..c79fb53d8ee5 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -30,6 +30,8 @@
 #define RK3568_GRF_VI_CON0		0x0340
 #define RK3568_GRF_VI_CON1		0x0344
 
+#define RK3588_CSIDPHY_GRF_CON0		0x0000
+
 /* PHY */
 #define CSIDPHY_CTRL_LANE_ENABLE		0x00
 #define CSIDPHY_CTRL_LANE_ENABLE_CK		BIT(6)
@@ -117,6 +119,12 @@ static const struct dphy_reg rk3568_grf_dphy_regs[] = {
 	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3568_GRF_VI_CON0, 1, 8),
 };
 
+static const struct dphy_reg rk3588_grf_dphy_regs[] = {
+	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 0),
+	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 4),
+	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 1, 8),
+};
+
 struct hsfreq_range {
 	u32 range_h;
 	u8 cfg_bit;
@@ -183,6 +191,11 @@ static const char *const rk3368_reset_names[] = {
 	"apb"
 };
 
+static const char *const rk3588_reset_names[] = {
+	"apb",
+	"phy"
+};
+
 static void rockchip_inno_csidphy_ths_settle(struct rockchip_inno_csidphy *priv,
 					     int hsfreq, int offset)
 {
@@ -390,6 +403,17 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
 	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
+static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
+	.pwrctl_offset = -1,
+	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
+	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
+	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
+	.grf_regs = rk3588_grf_dphy_regs,
+	.resets = rk3588_reset_names,
+	.resets_num = ARRAY_SIZE(rk3588_reset_names),
+};
+
 static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 	{
 		.compatible = "rockchip,px30-csi-dphy",
@@ -411,6 +435,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 		.compatible = "rockchip,rk3568-csi-dphy",
 		.data = &rk3568_mipidphy_drv_data,
 	},
+	{
+		.compatible = "rockchip,rk3588-csi-dphy",
+		.data = &rk3588_mipidphy_drv_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_inno_csidphy_match_id);

-- 
2.39.5



