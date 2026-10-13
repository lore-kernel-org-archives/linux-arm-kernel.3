Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EABFCC6B17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RF45zs5fAjW0Qp5leB8Y/W39xwtDw8QLlhKl0M5o05k=; b=Ay+fKRwTDkbPXJZU/zDJPrCWo1
	YXOxuWv0kifb5i5tfgAwhNz0eAMF0RUtBjXtB7Lf0U0SxBz8gDh81ct0Dnpp8KMcKe9oZf5kMLHNa
	FY7aDkBpoJTVZ/zZgRkCw35tyApNFb8+eXAG7q7toN6opO4ownqMY1gDKQ759ikHiLULDn9coBXQ1
	M7i6BkhBqoKVp71dAe0NhVhH+zF9c/a7eFtJcpJZwAI3CWqULIN62k5hcp+JUBQr0eIjYQNE+Xb5u
	GJJ7PGAZwX7t3MBbeSkhvg4NL4Vz3R7cPk+dHjLsqEux0mrN7hqRwU3ryqUKRMMlEJVJBlNIknNOE
	Uq+UX8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbxQ-0000000Crb1-0UlC;
	Tue, 13 Oct 2026 12:50:16 +0000
Received: from mail-m10239.netease.com ([154.81.10.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbxF-0000000CrRw-2FqG;
	Tue, 13 Oct 2026 12:50:08 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50e2b9415;
	Tue, 13 Oct 2026 20:49:58 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 5/6] drm/rockchip: analogix_dp: Add support for RK3568
Date: Tue, 13 Oct 2026 20:49:45 +0800
Message-Id: <20261013124946.1807886-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013124946.1807886-1-damon.ding@rock-chips.com>
References: <20261013124946.1807886-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13550028b03a8kunm2e7c128b3019
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSx9IVkhJTUhOShpPSxpLQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=aw9/UF8eOZPOmxlfyc9cUcq8xjtR690TPo/NuA4XDJYML82yGDTTCYGMVcea2m5+HGOVQFaywV1ee2hTFWAMhMdsFRAk8iae58Sl7GEgE32Y/q1ocO8DQSUc+khDNZJxOn3QQpPhlaqOKpleP0ELQvAXKIeonjGIZPMHQbEBxiI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=RF45zs5fAjW0Qp5leB8Y/W39xwtDw8QLlhKl0M5o05k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_055005_839911_6BC94679 
X-CRM114-Status: GOOD (  13.58  )
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

The RK3568 eDP controller does not require any GRF configurations,
so make the "rockchip,grf" property optional.  Also enable the
optional avdd-0v9 and avdd-1v8 supplies which power the eDP PHY.

Add the "rockchip,rk3568-edp" compatible along with its chip data;
the register base in the chip data is used to match the platform
device memory resource.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index ccdd4b9ecdb8..5bd59e69ae96 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -320,8 +320,9 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 	struct device *dev = dp->dev;
 	struct device_node *np = dev->of_node;
 	struct clk *clk;
+	int ret;
 
-	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
+	dp->grf = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,grf");
 	if (IS_ERR(dp->grf))
 		return dev_err_probe(dev, PTR_ERR(dp->grf),
 				     "failed to get rockchip,grf property\n");
@@ -351,6 +352,14 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 		return dev_err_probe(dev, PTR_ERR(dp->apbrst),
 				     "failed to get apb reset control\n");
 
+	ret = devm_regulator_get_enable_optional(dev, "avdd-0v9");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable avdd-0v9\n");
+
+	ret = devm_regulator_get_enable_optional(dev, "avdd-1v8");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable avdd-1v8\n");
+
 	return 0;
 }
 
@@ -530,6 +539,14 @@ static const struct rockchip_dp_chip_data rk3288_dp[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dp_chip_data rk3568_edp[] = {
+	{
+		.chip_type = RK3568_EDP,
+		.reg = 0xfe0c0000,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_dp_chip_data rk3576_edp[] = {
 	{
 		.chip_type = RK3576_EDP,
@@ -555,6 +572,7 @@ static const struct rockchip_dp_chip_data rk3588_edp[] = {
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
 	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
+	{.compatible = "rockchip,rk3568-edp", .data = &rk3568_edp },
 	{.compatible = "rockchip,rk3576-edp", .data = &rk3576_edp },
 	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
 	{}
-- 
2.34.1


