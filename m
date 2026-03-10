Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F13EB1043
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OocPmOMnlNRvz1526JH7EImumeXegD27jnijYId8D8=; b=vfc86qciCwv0LbWchIBtjY4p5x
	28MZe8UZvwcbS5xHxlNBLSnSsFV3SGCopRc9m92uy0yObfa+ZrikZFGeGyhl3kA0p/GhTy2Kn++I5
	dGAYlM7NpkcBY4iHas31vR8mlCeaWRZK/TddmFbW+xUV7/H+5QhkLfvLB8iJtRcVgm+mRaPRxfPUz
	4ZMUhwFxGYxe8msJ+PhnreNRiYhfAQz5diugXgX4w7h6o1htKf/ypdpkeSuzMQKeYZftZblOFXFoz
	xOb8ZvWM7znmyoAFYKmhli7/mH/0RuukZCULcfNb1z0FPMIs7Wil4uGv3V3oMyjFZHH0gC29RH2Cl
	NEXAm/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzujx-00000009Em8-35tX;
	Tue, 10 Mar 2026 10:55:05 +0000
Received: from mail-m155104.qiye.163.com ([101.71.155.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuju-00000009EfV-1PwC;
	Tue, 10 Mar 2026 10:55:03 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 366858a6b;
	Tue, 10 Mar 2026 18:54:56 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	alchark@gmail.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	kever.yang@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 4/4] drm/rockchip: analogix_dp: Add support for RK3576
Date: Tue, 10 Mar 2026 18:53:07 +0800
Message-Id: <20260310105307.309765-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310105307.309765-1-damon.ding@rock-chips.com>
References: <20260310105307.309765-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd762b7bd03a3kunm866f47e7374c50
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlJTlYaQksdHU9DShgfHhpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=OqYPba8Ac+FSTNio2s23bLUqQvq6LGFsl3kqR/HKfKzKBvy17OBf3uZqp3/yuRydJjDm99ki+fpDFD7zGr1FY+83y9sYoa9rVITknsR7dhqFyPzGe5ux7Cz8NkZgJUfPO41b2+6BLpGbcS/bDrAV3UorrOxOGb9fd8Snx6/UfPQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=3OocPmOMnlNRvz1526JH7EImumeXegD27jnijYId8D8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_035502_572361_23CB33DE 
X-CRM114-Status: GOOD (  12.45  )
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

RK3576 integrates the Analogix eDP 1.3 TX controller IP and the HDMI/eDP
TX Combo PHY based on a Samsung IP block - both of which are the same as
those on RK3588.

The patch currently adds only the basic support, specifically RGB output
up to 4K@60Hz, without the tests for audio, PSR and other eDP 1.3 specific
features.

In additon, the newly added clock 'hclk' is the video datapath clock,
which must be enabled during probing for RK3576 eDP controller.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 832e9766bef0..4f8511636cdf 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -71,6 +71,7 @@ struct rockchip_dp_device {
 
 	struct clk               *pclk;
 	struct clk               *grfclk;
+	struct clk               *hclk;
 	struct regmap            *grf;
 	struct reset_control     *rst;
 	struct reset_control     *apbrst;
@@ -327,6 +328,11 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 		return dev_err_probe(dev, PTR_ERR(dp->pclk),
 				     "failed to get pclk property\n");
 
+	dp->hclk = devm_clk_get_optional_enabled(dev, "hclk");
+	if (IS_ERR(dp->hclk))
+		return dev_err_probe(dev, PTR_ERR(dp->hclk),
+				     "failed to get hclk property\n");
+
 	dp->rst = devm_reset_control_get(dev, "dp");
 	if (IS_ERR(dp->rst))
 		return dev_err_probe(dev, PTR_ERR(dp->rst),
@@ -514,6 +520,14 @@ static const struct rockchip_dp_chip_data rk3288_dp[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dp_chip_data rk3576_edp[] = {
+	{
+		.chip_type = RK3576_EDP,
+		.reg = 0x27dc0000,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_dp_chip_data rk3588_edp[] = {
 	{
 		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
@@ -531,6 +545,7 @@ static const struct rockchip_dp_chip_data rk3588_edp[] = {
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
 	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
+	{.compatible = "rockchip,rk3576-edp", .data = &rk3576_edp },
 	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
 	{}
 };
-- 
2.34.1


