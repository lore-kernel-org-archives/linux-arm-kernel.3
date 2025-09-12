Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48574CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSqkJBK8n7ly5U0nAnm+/OksXDHVIBn6HmUmV6qYAJ8=; b=HxdYnb+tAyGkgqfIXnkN+oXLdA
	GQxRvm9KtpCBvWe4R68smHmv5rgcP4HELWQSFROjMx5FrggwsSvbPAvIJu3FPQb73QkZ+fBOe6lhY
	jquue3V14sq0JQbAO+tlvK1rmm4Tbphw4QcWqsaXagi77MOXDdXTwoeKGiz9Tpbab0x26NM8dAcUo
	Zu9EcV/Ac0mV5Vyum+DM6CGoVKSE6fPGT5ODK67tePlo0TiwZfa+ArmJ7naiZbizFbv7rZT2LDjo9
	VqS0VofxH4q7vW6zTYMo+hrbybNQxalDBgescbFVc7jTqg+dyLaqZGsSExwpwf6vwYmmvFu5zR6N5
	1TmlBweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzhv-00000008820-1MsA;
	Fri, 12 Sep 2025 09:04:39 +0000
Received: from mail-m49246.qiye.163.com ([45.254.49.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzhr-000000087x4-1GsP;
	Fri, 12 Sep 2025 09:04:36 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2298a0eb7;
	Fri, 12 Sep 2025 16:59:29 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 13/17] drm/rockchip: analogix_dp: Apply &analogix_dp_plat_data.attach() to attach next bridge
Date: Fri, 12 Sep 2025 16:58:42 +0800
Message-Id: <20250912085846.7349-14-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d26af9e03a3kunm813a8c8ea46246
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5NSFZPQh9MHh8ZHktJQh9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=CWgCB7fLwrYIZriaNXhZT1Te5EP55AOQjxHvsSmGLb1gWwXIE2A37p9EmaR9hpOhf4GqYQGKdMJJQXWEmqC+o8THptUrVCtLj7KcWCI8jUmNjiCUMdBYHR5RuzWiXQfIOWdGhm4VXSjSkS0HpFPxUuS+sDW6fOhLUwiHqSLlVpE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=jSqkJBK8n7ly5U0nAnm+/OksXDHVIBn6HmUmV6qYAJ8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_020435_533840_8499727A 
X-CRM114-Status: UNSURE (   9.42  )
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

There may be the panel or bridge after &analogix_dp_device.bridge.
Add rockchip_dp_attach() to support the next bridge attachment for
the Rockchip side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 0784f19a2ed9..39f1ed293c75 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -164,6 +164,24 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 	return 0;
 }
 
+static int rockchip_dp_attach(struct analogix_dp_plat_data *plat_data,
+				     struct drm_bridge *bridge)
+{
+	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
+	int ret;
+
+	if (plat_data->next_bridge) {
+		ret = drm_bridge_attach(&dp->encoder.encoder, plat_data->next_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret) {
+			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static bool
 rockchip_dp_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 				   const struct drm_display_mode *mode,
@@ -452,6 +470,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
+	dp->plat_data.attach = rockchip_dp_attach;
 	dp->plat_data.ops = &rockchip_dp_component_ops;
 
 	ret = rockchip_dp_of_probe(dp);
-- 
2.34.1


