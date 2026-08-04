Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04978C55ABC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pOneZc7dpt16hg70UmlDabGGhoDjNds+kJxO+jHrek=; b=kU/CI4ypd6W43o4gfg4iGyy2az
	shbZAuysxxtlAkMirDMY0VJrel1B0T/E3v+9wXiGQcRmLwCjGIdrGNuW7KhbYBbMKUJVhiNseO2gR
	/OEanuS/Gf6oIrt8J5xD6u171UifdAqILkFyurAgQoHcQklCdRzahYOjAgSkh1xXkDtsBZ01lnH1x
	oaIMMW6etHqIvpn69M43woXpqSTjQXW/oD3DsGgc1CuY86W4sEBANhubtsNGjIaJJjF+dmEahYL3M
	4vjlIo24VWZ17SDjFeGoo2DXx51mgYfFwtIk+d2bcW0OIAhshzXDq4mg82oZ8aq11TkOM909M/DLy
	ESPhlaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrALF-00000001J3O-2SCu;
	Tue, 04 Aug 2026 08:17:41 +0000
Received: from mail-m10313119117.xmail.ntesmail.com ([103.131.191.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAL9-00000001Isa-31T0;
	Tue, 04 Aug 2026 08:17:37 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48b4ffefa;
	Tue, 4 Aug 2026 16:17:31 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 06/10] drm/bridge: analogix_dp: Simplify analogix_dp_config_interrupt()
Date: Tue,  4 Aug 2026 16:17:13 +0800
Message-Id: <20260804081717.741404-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804081717.741404-1-damon.ding@rock-chips.com>
References: <20260804081717.741404-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fcbd969af03a8kunma7b8cbe762b0b7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHx0aVhgZSxpNHRhOSRhPTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ilny2gefQCJVl3LsNpL98tknZMCCkF1HpMnI5+cdtFnRPSjTzQ8Jc16OvD1DyrXO2TnYQSB/xfiFICjIG66lJ6VuDMdiTVGhWB3fzIM+ljsYLAB9d9TIazH/KVauSbJeVNzXI56hGRzOzaGOFUDXLhvcSCKy2stkF8/I0eb+uDU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=2pOneZc7dpt16hg70UmlDabGGhoDjNds+kJxO+jHrek=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_011736_077078_1F71EA1B 
X-CRM114-Status: UNSURE (   7.98  )
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

Remove local COMMON_INT_MASK and INT_STA_MASK macros. These constants
are only used once inside this function and bring no reuse benefit.

Replace open-coded register writes for COMMON_INT_MASK_1~3 with
direct writel(0) calls.

Leverage analogix_dp_unmute_hpd_interrupt() using the full HPD_IRQ
mask to initialize HPD interrupt state, removing duplicated register
handling.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 25 +++----------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 816be79a8da6..42463e18f392 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -18,12 +18,6 @@
 #include "analogix_dp_core.h"
 #include "analogix_dp_reg.h"
 
-#define COMMON_INT_MASK_1	0
-#define COMMON_INT_MASK_2	0
-#define COMMON_INT_MASK_3	0
-#define COMMON_INT_MASK_4	(HOTPLUG_CHG | HPD_LOST | PLUG)
-#define INT_STA_MASK		INT_HPD
-
 #define HPD_IRQ			(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
 				 DP_IRQ_TYPE_HP_CHANGE | DP_IRQ_TYPE_IRQ_HPD)
 #define COMMON_INT_4_HPD_IRQ	(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
@@ -178,23 +172,12 @@ void analogix_dp_swreset(struct analogix_dp_device *dp)
 
 void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 {
-	u32 reg;
-
 	/* 0: mask, 1: unmask */
-	reg = COMMON_INT_MASK_1;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_1);
-
-	reg = COMMON_INT_MASK_2;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
-
-	reg = COMMON_INT_MASK_3;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
-
-	reg = COMMON_INT_MASK_4;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_1);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	reg = INT_STA_MASK;
-	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ);
 }
 
 void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type)
-- 
2.34.1


