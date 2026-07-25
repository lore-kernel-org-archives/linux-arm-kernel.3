Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12B0C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4oMlmSYbaL4+QvFHqLNc8Y4YfEgKcwKvJ080qJlPQU=; b=2atUefI7amKXB2FulcPnFeUeL6
	AUPb8CeFyLNcBJ67GUTbJpL4hAi+5NMLroby8xP3ZH83QykbXCNAJcDGVUoip0fHXjy0KuipANHgb
	nyUOf2T4pmUnthXH27ka3YQVA5YIo3heQLEVJUWRrIQH3pnWKbH+gbm/CZ0XmYCuXOlg7DQ6v6WAJ
	Mz2TRBxJLO+74cqwz0WdfHFKCEBQLIhZlDZnf+X9bTILTtZfwT6V+jZuRqr0k9jRIVZ/mZV/GUEUR
	fDgb640kebOgAdYPmsBJnc2r7QG6m6iGlT0TR3S6RUYVNTNEoz7CWFcJSGxGUt5Ii0GGeSYxsvY9Y
	CALzcmEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnb4z-00000000JnI-1teR;
	Sat, 25 Jul 2026 12:02:09 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnb4w-00000000Jmv-1u2w;
	Sat, 25 Jul 2026 12:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1784980923; bh=mC5Gbuu/d1cJUlqqjL5J8aXmwyGbebaXGr9ziWy7HGE=;
	h=From:To:Cc:Subject:Date:From;
	b=ylf0hQW9y26NvyAWZDQVOuOEwKAAHUwYFHS46KgwNaUmCsgacvjzw/BSyfxYrW/Qb
	 XIpEUcJJnn8Oo9TPHE3e1KxF20ALjgMNyIBKKZFTuNoY/WzkuqgVnAk2QF8uPHm2yV
	 XJ+v5aGGMY5FBEQSP+hKSH13dhlYtHGWamm1+KZE=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR ROCKCHIP),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support)
Subject: [PATCH] drm/rockchip: dw-mipi-dsi-rockchip: Fix ISP1 PHY initialization
Date: Sat, 25 Jul 2026 14:00:23 +0200
Message-ID: <20260725120200.2260152-1-megi@xff.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_050206_795736_B0FFF6FD 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Ondrej Jirman <megi@xff.cz>

After suspend/resume cycle, ISP1 would stop receiving data.
Re-initializing DPHY during PHY power on fixes the issue.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3547d91b25d3..10d84bdda8cd 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1255,6 +1255,14 @@ static int dw_mipi_dsi_dphy_power_on(struct phy *phy)
 		goto err_phy_cfg_clk;
 	}
 
+	if (dsi->cdata->dphy_rx_init) {
+		ret = dsi->cdata->dphy_rx_init(phy);
+		if (ret < 0) {
+			DRM_DEV_ERROR(dsi->dev, "hardware-specific phy init failed: %d\n", ret);
+			goto err_pwr_on;
+		}
+	}
+
 	/* do soc-variant specific init */
 	if (dsi->cdata->dphy_rx_power_on) {
 		ret = dsi->cdata->dphy_rx_power_on(phy);
-- 
2.54.0


