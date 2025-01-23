Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC4EC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZmWqkUhrvBKd4va88UKmvyrBTmGH5reiTDu//3lJn0=; b=s5F2rh/60Zkx2I9pNtZtdJEC8W
	kjN7s+eOSwBviIOrtr6aX0JnZ3zY3zVSwNTrCxt+0N/K8cikDYWe7h7emua/mszCDrhrmzBoviacb
	X/tBL5nRrVOyleeXvUQjzyMlVDVEyt7XTrvswg6NMw4yStp8sTDb7eIkTiCzky2Ixr6eFL5QGG0SB
	u3br6WrZMBDVUmvuAA8JZVPcFDWJz+nEwRXAUK90ILtClzMSB1zYSorLd/vCPlAYvxHDK0SS4N/jO
	0+VxscWCoH+45nsvSfcght91+Na2Coh6m67mawMb+81VtXMw/OehX7Hsu1mBtiFs/e4Ht9SMmKL/t
	Bh+iF1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tauEQ-0000000CAmg-2Oqw;
	Thu, 23 Jan 2025 10:14:38 +0000
Received: from mail-m15598.qiye.163.com ([101.71.155.98])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tau8B-0000000C9YG-0ksU;
	Thu, 23 Jan 2025 10:08:13 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 9818ae5f;
	Thu, 23 Jan 2025 18:08:06 +0800 (GMT+08:00)
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
Subject: [PATCH v6 04/14] drm/bridge: analogix_dp: Add support for phy configuration.
Date: Thu, 23 Jan 2025 18:07:37 +0800
Message-Id: <20250123100747.1841357-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123100747.1841357-1-damon.ding@rock-chips.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUMaHlZDHkJCH0waSkxMTh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
X-HM-Tid: 0a9492a2223d03a3kunm9818ae5f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDI6Ejo5MTIVAiwcNCo5FDxD
	Vk4KFChVSlVKTEhMTUlNQ0NDTkNIVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOSUhJNwY+
DKIM-Signature: a=rsa-sha256;
	b=NhV2Rj6SWhpflWIekhLVcdFCepm77X7ACa295ZM6I0JXXTtvQJ5Rl97lB+ZteizL7EEnWoStLMsvh/NItstCI9eAQ6qw4KdVO2nwUhIDSM895B07s1ohR15D7bsKkbrhIFkQ4RfZ85TtftDn1AOnHzAZ1hgG8U0h9LBBCcB6u2E=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=EZmWqkUhrvBKd4va88UKmvyrBTmGH5reiTDu//3lJn0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_020811_439512_6D11F1BA 
X-CRM114-Status: GOOD (  10.34  )
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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

Changes in v5:
- include <drm/drm_print.h> for dev_err()
- use drm_err() instead of dev_err()

Changes in v6:
- Pass 'dp' in drm_...() rather than 'dp->drm_dev'
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
 .../drm/bridge/analogix/analogix_dp_core.h    |  1 +
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 52 +++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bfa88409a7ff..b05f5b9f5258 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1692,6 +1692,7 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
 	if (dp->plat_data->power_on)
 		dp->plat_data->power_on(dp->plat_data);
 
+	phy_set_mode(dp->phy, PHY_MODE_DP);
 	phy_power_on(dp->phy);
 
 	analogix_dp_init_dp(dp);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 774d11574b09..4d36907aa371 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -11,6 +11,7 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_print.h>
 
 #define DP_TIMEOUT_LOOP_COUNT 100
 #define MAX_CR_LOOP 5
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 3afc73c858c4..041733131b35 100644
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
+			drm_err(dp, "%s: phy_configure() failed: %d\n", __func__, ret);
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
+			drm_err(dp, "%s: phy_configure() failed: %d\n", __func__, ret);
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
+			drm_err(dp, "%s: phy_configure() failed: %d\n", __func__, ret);
+			return;
+		}
+	}
 }
 
 u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane)
-- 
2.34.1


