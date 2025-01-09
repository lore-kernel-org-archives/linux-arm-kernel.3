Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CFEE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 03:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Opp8/1o2GzjehPnlr1xNOYU9LgkvnWOfJwemdFwvWbU=; b=3NGT3BRbLpDuifEzOKfpTPT1UQ
	q2COH/1B6E5s+ZJwSgGhS1kVZBjcWWl/M9E1ZiTmYDknJ0327nNXczNkvFu1gFjKR0H0r34IHmAOS
	R2Q20dukHL8J7cSykaw8ckS7llqlDn+6s8NqxFxFJASXHAcXeKNEkZ8kUgyDPUgXblyjvmoZV7vqc
	9cYVNXxG/3wsChG1wz+OPt2ZG1L9wXdDLmAuxFpH0S0Hk9V+PARr8CpfyKQiZwgpRE5g2Zzn1CRq9
	rHPdiWPOg7npHzK4pCRFGacntSwtSczhJAC5VX16nnJ5CYl+u33kC0/IhewkSrFXopG4VHKoLRMqD
	swVoSfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjQT-0000000AcX6-1x4e;
	Thu, 09 Jan 2025 03:41:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjDy-0000000AZus-14Yj;
	Thu, 09 Jan 2025 03:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Opp8/1o2GzjehPnlr1xNOYU9LgkvnWOfJwemdFwvWbU=; b=Jzddv5dMVGns9ZwkJ5A4Mlx3r4
	SZGvdZAehB1x1888GqUSpjvrcp4EHNmBEmukHCe0HZ7tjbL4hqDPMJ00hDDq3iVHb+XnWHasSzjZJ
	IjmIN22xnKt3bsYn8C4kFybGYR2v+vXBj8zIdQxc/Mjr520R2U/oXiDuWrYRtu7A9Q/eBR2kGkseq
	Skt0SQc0pGQPcl/B8JQHQYa8tlby14qbsdn69RqVIpEMGwKlHD/xitiQRIAs9HfxSuTGdmttYSe9J
	CRf+n5ymdncFrSbS3v3nEArJAR1s6Td8PGbxjDqvr6aKwCIATwuzpV8EKurZWNXLqKGvSTJ4l++gq
	UOmYwcQg==;
Received: from mail-m15590.qiye.163.com ([101.71.155.90])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjDu-00000009UFI-3F1s;
	Thu, 09 Jan 2025 03:28:45 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 82c01a46;
	Thu, 9 Jan 2025 11:28:10 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	dmitry.baryshkov@linaro.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 07/20] drm/rockchip: analogix_dp: Expand device data to support multiple edp display
Date: Thu,  9 Jan 2025 11:27:12 +0800
Message-Id: <20250109032725.1102465-8-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109032725.1102465-1-damon.ding@rock-chips.com>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxlLTlZCThoYGElLHUJOGE9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a94491af38f03a3kunm82c01a46
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ohg6Exw6TzIcDxQDLANRTBAv
	NS4aCxFVSlVKTEhNSEJISUJJSENPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJTUxDNwY+
DKIM-Signature: a=rsa-sha256;
	b=SCnACFms8F41DPlRyE3gbrBfH6f4f4iVOtFo4VRHgB3jVY7EBdsJL9dezdd2QeE2SCUSdlGSfsVxnnmP5ABz4r7VcmV68z6ogUDBbYAXNwXyE63xKk1E11KjtD2j/Vqc6V1O0Av60pUqfow9B/n0IuV6iBSQBhFLzlpjKbB7rGg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Opp8/1o2GzjehPnlr1xNOYU9LgkvnWOfJwemdFwvWbU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_032843_179885_DD4D3AA4 
X-CRM114-Status: GOOD (  13.06  )
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
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 41 +++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index eef1ff0f3a13..0957d3c5d31d 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -56,6 +56,7 @@ struct rockchip_grf_reg_field {
 struct rockchip_dp_chip_data {
 	const struct rockchip_grf_reg_field lcdc_sel;
 	u32	chip_type;
+	u32	reg;
 };
 
 struct rockchip_dp_device {
@@ -397,6 +398,8 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	const struct rockchip_dp_chip_data *dp_data;
 	struct drm_panel *panel = NULL;
 	struct rockchip_dp_device *dp;
+	struct resource *res;
+	int i;
 	int ret;
 
 	dp_data = of_device_get_match_data(dev);
@@ -411,9 +414,25 @@ static int rockchip_dp_probe(struct platform_device *pdev)
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
+	if (!dp->data) {
+		dev_err(dev, "no chip-data for %s node\n", dev->of_node->name);
+		return -ENODEV;
+	}
+
 	dp->dev = dev;
 	dp->adp = ERR_PTR(-ENODEV);
-	dp->data = dp_data;
 	dp->plat_data.panel = panel;
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
@@ -465,14 +484,22 @@ static int rockchip_dp_resume(struct device *dev)
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


