Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5952FCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 02:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzrSU6F51VUS8IVrczy9Q/DVSlabFI0ne4m7RTJg/xI=; b=2iYJNsCxmxGl1Gkj/agZ2yga5P
	YlkPHN7nIqw3DvTYqSQ3Ha0XEGF4v5YArexI9Oe4jp03hXRGyVaSsUnCYTvc1Hd1XxMQFNk09xO9N
	XkUpLlsgCXKtg8Ty8LNKT10xLr1fWIWod9lXWPY9XyJ9g/3qKnhiREocgvSSRv72w8L8+/rVj3K4Y
	sledlJtMcx4htD1qNvzrwhuOZJmWDOFUrcDh/Zv4Fg2rbrUz84kQkQWyVFx4R1dEeXk6ZnbwdHzp4
	XMq+YaO2KRYIVtCs2TcphvGa+iLLWjNmoG6Y5hQLkFboHB+8VTuL2T0Db/nSuPT8YWqX5bZPG4ZvZ
	vJ+YZ7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4GT-00000003BjX-3NIF;
	Wed, 27 May 2026 02:45:01 +0000
Received: from mail-m128108.netease.com ([103.209.128.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4G7-00000003BOf-24fq;
	Wed, 27 May 2026 02:44:41 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3ff559ad0;
	Wed, 27 May 2026 10:44:35 +0800 (GMT+08:00)
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
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
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
Subject: [PATCH v9 05/10] drm/rockchip: analogix_dp: Enable hclk for RK3588
Date: Wed, 27 May 2026 10:43:31 +0800
Message-Id: <20260527024336.191433-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527024336.191433-1-damon.ding@rock-chips.com>
References: <20260527024336.191433-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e6751cfff03a8kunm8053ce91bcedce
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTElMVkkeSBhNSU4aTR5MSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=bK4Sa0loyO6dekkjbM21Qt6r8Q0KPIkyIg4xzfEu85CIvTkh7KzbFDLs1oY3DzJJQD2RPi5KCLXFDB0Ib6FoX4JJMC2PjCkaNq60/k28x7D/xvMhKPLkGdC213U9XFPRVN+WBdzMsagnf+s23vT65zGSzaTnvTCK7X35gkyrnzc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qzrSU6F51VUS8IVrczy9Q/DVSlabFI0ne4m7RTJg/xI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_194439_763068_F1798FDA 
X-CRM114-Status: UNSURE (   9.15  )
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

Acquire and enable the HCLK_VO1 bus clock explicitly for RK3588
eDP controller to guarantee register and datapath access.

The clock was previously enabled implicitly via rockchip,vo-grf
phandle reference, which relies on side effect and is fragile.

Fetch optional "hclk" clock in driver to align with updated device
tree binding and keep consistent with hardware clock dependency.

Fixes: 729f8eefdcad ("drm/rockchip: analogix_dp: Add support for RK3588")
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Modify the commit msg.
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 06072efd7fca..d2af5eb29dbb 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -311,6 +311,7 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 {
 	struct device *dev = dp->dev;
 	struct device_node *np = dev->of_node;
+	struct clk *clk;
 
 	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
 	if (IS_ERR(dp->grf))
@@ -327,6 +328,11 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 		return dev_err_probe(dev, PTR_ERR(dp->pclk),
 				     "failed to get pclk property\n");
 
+	clk = devm_clk_get_optional_enabled(dev, "hclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get hclk property\n");
+
 	dp->rst = devm_reset_control_get(dev, "dp");
 	if (IS_ERR(dp->rst))
 		return dev_err_probe(dev, PTR_ERR(dp->rst),
-- 
2.34.1


