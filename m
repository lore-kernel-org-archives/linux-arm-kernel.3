Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D69C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHxIGASN99m5dXd91pj3fT+U9t8J1461WyjTg1w5KfA=; b=fhu0sRFBeufYmzf/KPc4XA4P7o
	rlgN2hk3FWXrTcpChb5L7r7YHFfrXn6QBLUIPI+VZQtc3wpbgbICAelrxeybms6dkYS4bXdvg1eSC
	wl8sdIK14kGgF5pU1BTsAuU2FzxHi2/D9gKkYUPTOzwgztl7d57Hh3Vq3NhW2rLCvbbNhnzRGSrCC
	QiPwYbfWeciS+Ri9dnZsVpX/7sPBDEdb1HkwT9g6gSPuYSbYDaIQmlaDW4GJcYCX+lZPedh3MPlYo
	WiNP7xISuHx09Cxa1SyoahU+3Ej4SSUOSWfOAQW5Itmy3pnrTq07MCZzyQiXmI9ETVDpJf2X4WCGX
	Y3Hlu5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTlM-0000000CgNH-3p8V;
	Mon, 24 Feb 2025 08:24:29 +0000
Received: from mail-m49227.qiye.163.com ([45.254.49.227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTbH-0000000Ce4G-2YSm;
	Mon, 24 Feb 2025 08:14:04 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id bfd2879f;
	Mon, 24 Feb 2025 16:13:59 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dmitry.baryshkov@linaro.org,
	dianders@chromium.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	boris.brezillon@collabora.com,
	l.stach@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 02/15] drm/rockchip: analogix_dp: Expand device data to support multiple edp display
Date: Mon, 24 Feb 2025 16:13:12 +0800
Message-Id: <20250224081325.96724-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224081325.96724-1-damon.ding@rock-chips.com>
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk5NHlZDTEoeTBkaTBhMGhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95370525bc03a3kunmbfd2879f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQw6CRw6AzIIIxMfTT5KETJD
	SC8wC09VSlVKTE9LSENPQ09KS0JCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISktONwY+
DKIM-Signature: a=rsa-sha256;
	b=g3HtaH9YDtf9RQV/XLA+RPk22LW/TKr/xVe6jAp/bzrSg0eE5Hw/Blr0wkHIZqXt6XswF7xyGph4UmQnR9qIOXa6BkND1S/mlJAsPrGaqGU3dcDY0wzWJ0JKbvRaFU7743h6rr9el5pUGSqcphMlKvyNm9AiMQQvPCwfGD8z6AY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=lHxIGASN99m5dXd91pj3fT+U9t8J1461WyjTg1w5KfA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_001403_876514_3ED90180 
X-CRM114-Status: GOOD (  14.77  )
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

There are two main modifications: one is expanding struct
rockchip_dp_chip_data to an array, and the other is adding
&rockchip_dp_chip_data.reg to separate different edp devices.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v6:
- Add the description of &rockchip_dp_chip_data.reg
- Use drm_...() uniformly rather than mixing drm_...() and dev_..()

Changes in v7:
- Call dev_err_probe() if failed to find the chip-data
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 41 +++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 0d93df6b5144..a8265a1bf9ff 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -52,10 +52,12 @@ struct rockchip_grf_reg_field {
  * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
  * @lcdc_sel: grf register field of lcdc_sel
  * @chip_type: specific chip type
+ * @reg: register base address
  */
 struct rockchip_dp_chip_data {
 	const struct rockchip_grf_reg_field lcdc_sel;
 	u32	chip_type;
+	u32	reg;
 };
 
 struct rockchip_dp_device {
@@ -396,6 +398,8 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	const struct rockchip_dp_chip_data *dp_data;
 	struct drm_panel *panel = NULL;
 	struct rockchip_dp_device *dp;
+	struct resource *res;
+	int i;
 	int ret;
 
 	dp_data = of_device_get_match_data(dev);
@@ -410,9 +414,24 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	i = 0;
+	while (dp_data[i].reg) {
+		if (dp_data[i].reg == res->start) {
+			dp->data = &dp_data[i];
+			break;
+		}
+
+		i++;
+	}
+
+	if (!dp->data)
+		return dev_err_probe(dev, -EINVAL, "no chip-data for %s node\n",
+				     dev->of_node->name);
+
 	dp->dev = dev;
 	dp->adp = ERR_PTR(-ENODEV);
-	dp->data = dp_data;
 	dp->plat_data.panel = panel;
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
@@ -464,14 +483,22 @@ static int rockchip_dp_resume(struct device *dev)
 static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend,
 		rockchip_dp_resume, NULL);
 
-static const struct rockchip_dp_chip_data rk3399_edp = {
-	.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
-	.chip_type = RK3399_EDP,
+static const struct rockchip_dp_chip_data rk3399_edp[] = {
+	{
+		.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
+		.chip_type = RK3399_EDP,
+		.reg = 0xff970000,
+	},
+	{ /* sentinel */ }
 };
 
-static const struct rockchip_dp_chip_data rk3288_dp = {
-	.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
-	.chip_type = RK3288_DP,
+static const struct rockchip_dp_chip_data rk3288_dp[] = {
+	{
+		.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
+		.chip_type = RK3288_DP,
+		.reg = 0xff970000,
+	},
+	{ /* sentinel */ }
 };
 
 static const struct of_device_id rockchip_dp_dt_ids[] = {
-- 
2.34.1


