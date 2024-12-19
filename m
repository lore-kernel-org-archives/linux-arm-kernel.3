Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31DAE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkISH5ds2k+lYCOjJ9cf6bOYdtfmQgu7bQ7OmEgofvU=; b=CmrWWBldbSQ3iq8ZKA/xazOdFH
	ulmQq7Xu8ShZVWIh4K4QH3Te5bnHL+yZ4/7X05qvn682DiFXqKdiNW0BJkTjB6W8A+uQeLQfO3xvI
	C0O2oCEWkQqJEqePeDewLjDCFH6i1psOF3l03W74J3FJecYaK56k3UW/5q0P1hWkwVxUXUrRU8TKs
	JWMjYFA/asRe0kG/rLOyvUAgfnn1aEqCmzeIMPK7nN8RnxEfladtO6F5eSsZL7nO1gf4YifCyzfWW
	PQEfJYcWt8B/Dda+ZVQ1RXMmeRgsNQVw+eojJuSuRZ7uJEU/o0JGt15ha+30xyOhNxijf3r9Zc2oe
	KLNMoi0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBhv-00000001F49-3hS7;
	Thu, 19 Dec 2024 08:16:32 +0000
Received: from mail-m15599.qiye.163.com ([101.71.155.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBYO-00000001D4D-17CZ;
	Thu, 19 Dec 2024 08:06:41 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 633dd662;
	Thu, 19 Dec 2024 16:06:35 +0800 (GMT+08:00)
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
Subject: [PATCH v3 08/15] drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus
Date: Thu, 19 Dec 2024 16:05:57 +0800
Message-Id: <20241219080604.1423600-9-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219080604.1423600-1-damon.ding@rock-chips.com>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5KHVZDTk0dTx0YS09NT09WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93ddf44db903a3kunm633dd662
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngw6Tww5PTIQFBUvTD9JDDdP
	AwEwCgxVSlVKTEhPTkJOTkJMSENMVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQktJNwY+
DKIM-Signature: a=rsa-sha256;
	b=ksEiO8Bt2qlwc+zz0EMIiHFIC2oTlD6NzrTgpa9TRsx2YJxwROd76sMmx7L4t1iKCLFQR8hbO0Hm0lsCiwJAYvbABPy+Lv47lUJWQaZz3z+QMQTilbB6EmRq/85T31qH/e03FK4J2Wnz4t3LFPH4rumNoz34+EN5p3ELs8Tepr0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=WkISH5ds2k+lYCOjJ9cf6bOYdtfmQgu7bQ7OmEgofvU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_000640_515344_581F6EDE 
X-CRM114-Status: GOOD (  14.06  )
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

The rockchip_dp_of_panel_on_aux_bus() helps to check whether the DT
configurations related to the DP AUX bus are correct or not.

If failed to get the panel from the platform bus, it is good to try
the DP AUX bus. Then, the probing process will continue until it enters
the analogix_dp_bind(), where devm_of_dp_aux_populate_bus() is called
after &analogix_dp_device.aux has been initialized.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index ba5263f85ee2..60c902abf40b 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -317,6 +317,24 @@ static const struct drm_encoder_helper_funcs rockchip_dp_encoder_helper_funcs =
 	.atomic_check = rockchip_dp_drm_encoder_atomic_check,
 };
 
+static bool rockchip_dp_of_panel_on_aux_bus(const struct device_node *np)
+{
+	struct device_node *bus_node, *panel_node;
+
+	bus_node = of_get_child_by_name(np, "aux-bus");
+	if (!bus_node)
+		return false;
+
+	panel_node = of_get_child_by_name(bus_node, "panel");
+	of_node_put(bus_node);
+	if (!panel_node)
+		return false;
+
+	of_node_put(panel_node);
+
+	return true;
+}
+
 static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 {
 	struct device *dev = dp->dev;
@@ -435,8 +453,10 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		if (!rockchip_dp_of_panel_on_aux_bus(dev->of_node))
+			return ret;
+	}
 
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
-- 
2.34.1


