Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB80E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 06:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovQ2doYjpUqf/QnC9e/ticGynTX/DxocrT9hUMQvZFs=; b=sS2gt6Ck8DhoI3e+GEsUY4RkZa
	1FEZpaLvXXau63f0Ih9Ug5r2p1h2fGastXEJlP4J3zmL1OgXVBlJ7WQvDGRePLwMGkVLrYy/3v4yK
	I2EXcorzMeTfDjxQYFq+qHf9zH+Gf+1t12oN70L6shMhfslOOS1rOAy1cQR8A1YulqFavJd7/3XDG
	NaZNgzI3aiSfiBjgWSoufKsKGRxvHs68rzzjg05wXzp7R2kcuVBFTkZ7IPCBSpwrGXKcgmvq31Qen
	26TZzKTG2dEHrV9oHUpNCcri5XTDrs+66oI8TrH7+K84lJ8v8VUMLpno5BBP9FaEKpkRiYNNyF7Ym
	whNAOrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQhcq-0000000FKpo-0Uv9;
	Thu, 26 Dec 2024 06:45:40 +0000
Received: from mail-m118114.qiye.163.com ([115.236.118.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQhRM-0000000FIfa-2s6W;
	Thu, 26 Dec 2024 06:33:50 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6dc51173;
	Thu, 26 Dec 2024 14:33:43 +0800 (GMT+08:00)
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
Subject: [PATCH v4 09/17] drm/bridge: analogix_dp: Add support for phy configuration.
Date: Thu, 26 Dec 2024 14:33:05 +0800
Message-Id: <20241226063313.3267515-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226063313.3267515-1-damon.ding@rock-chips.com>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkgZSVZCGRlCTxkeSRhLHUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
	NVSktLVUpCWQY+
X-HM-Tid: 0a9401abcd4f03a3kunm6dc51173
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mi46Exw5IzIcDEwiTjoTK0ss
	DBIaCg5VSlVKTEhOSkJPQ0lOTUNOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPTktPNwY+
DKIM-Signature: a=rsa-sha256;
	b=YmE3KJVfzuudN9/914oDB31B0aG0bAe8ROnhG3+kjny0aJomYpwVdwLx6f1wPnouGOeaF/7QQPU/iLnrrmWRJfsAWPOqZDDGUuyslFtkSF1uuS1p54S//7fjaGEv55F9bYfDKKozlF+hUjctfMmJu3mfBN+GXWFGQUwtutXZ71o=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ovQ2doYjpUqf/QnC9e/ticGynTX/DxocrT9hUMQvZFs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_223348_951378_76B845A1 
X-CRM114-Status: UNSURE (   9.86  )
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

Add support to configurate link rate, lane count, voltage swing and
pre-emphasis with phy_configure(). It is helpful in application scenarios
where analogix controller is mixed with the phy of other vendors.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- remove needless assignments for phy_configure()
- remove unnecessary changes for phy_power_on()/phy_power_off()

Changes in v4:
- remove unnecessary &phy_configure_opts_dp.lanes assignments in
  analogix_dp_set_link_bandwidth()
- remove needless &phy_configure_opts_dp.lanes and
  &phy_configure_opts_dp.link_rate assignments in
  analogix_dp_set_lane_link_training()
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6f10d88a34c5..9429c50cc1bc 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1696,6 +1696,7 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
 	if (dp->plat_data->power_on)
 		dp->plat_data->power_on(dp->plat_data);
 
+	phy_set_mode(dp->phy, PHY_MODE_DP);
 	phy_power_on(dp->phy);
 
 	analogix_dp_init_dp(dp);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 3afc73c858c4..38fd8d5014d2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -11,6 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/phy/phy.h>
 
 #include <drm/bridge/analogix_dp.h>
 
@@ -513,10 +514,24 @@ void analogix_dp_enable_sw_function(struct analogix_dp_device *dp)
 void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype)
 {
 	u32 reg;
+	int ret;
 
 	reg = bwtype;
 	if ((bwtype == DP_LINK_BW_2_7) || (bwtype == DP_LINK_BW_1_62))
 		writel(reg, dp->reg_base + ANALOGIX_DP_LINK_BW_SET);
+
+	if (dp->phy) {
+		union phy_configure_opts phy_cfg = {0};
+
+		phy_cfg.dp.link_rate =
+			drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
+		phy_cfg.dp.set_rate = true;
+		ret = phy_configure(dp->phy, &phy_cfg);
+		if (ret && ret != -EOPNOTSUPP) {
+			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
+			return;
+		}
+	}
 }
 
 void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
@@ -530,9 +545,22 @@ void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
 void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count)
 {
 	u32 reg;
+	int ret;
 
 	reg = count;
 	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_COUNT_SET);
+
+	if (dp->phy) {
+		union phy_configure_opts phy_cfg = {0};
+
+		phy_cfg.dp.lanes = dp->link_train.lane_count;
+		phy_cfg.dp.set_lanes = true;
+		ret = phy_configure(dp->phy, &phy_cfg);
+		if (ret && ret != -EOPNOTSUPP) {
+			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
+			return;
+		}
+	}
 }
 
 void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
@@ -546,10 +574,34 @@ void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
 void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
 {
 	u8 lane;
+	int ret;
 
 	for (lane = 0; lane < dp->link_train.lane_count; lane++)
 		writel(dp->link_train.training_lane[lane],
 		       dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
+
+	if (dp->phy) {
+		union phy_configure_opts phy_cfg = {0};
+
+		for (lane = 0; lane < dp->link_train.lane_count; lane++) {
+			u8 training_lane = dp->link_train.training_lane[lane];
+			u8 vs, pe;
+
+			vs = (training_lane & DP_TRAIN_VOLTAGE_SWING_MASK) >>
+			     DP_TRAIN_VOLTAGE_SWING_SHIFT;
+			pe = (training_lane & DP_TRAIN_PRE_EMPHASIS_MASK) >>
+			     DP_TRAIN_PRE_EMPHASIS_SHIFT;
+			phy_cfg.dp.voltage[lane] = vs;
+			phy_cfg.dp.pre[lane] = pe;
+		}
+
+		phy_cfg.dp.set_voltages = true;
+		ret = phy_configure(dp->phy, &phy_cfg);
+		if (ret && ret != -EOPNOTSUPP) {
+			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
+			return;
+		}
+	}
 }
 
 u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane)
-- 
2.34.1


