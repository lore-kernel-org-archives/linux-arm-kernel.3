Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5EBCD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6vnRx1WnRMFhd0jJiA55vD7DIxOpNjOYdgoSsIkJYU=; b=Rr0hX3SCtdCMFZ+HdJNR3qgzJe
	rk0HcARZO8FJoJfQ/lnVLNKEaSQml4NW+YPL9k/N3pnrR4Nk3+WkHONhGrm+xfQ7nEQzeTLXsOJTc
	kSFJl8epBZfM3fNPmLYgc1TTpEfvpKOfh5VjflVtTEOkLkwi/ym+O9PdCXVwIh0P9w58zkjZA7dze
	CyN3GN7AACWM+xHAsrJahr/hlDXoaMEs+JOgiwsnml9KjnRh2t6+1qx41r5/2MXeTTGUfDko3Xq28
	CoBXsMjh7X+9vJmqxyEvNBq20Cwz06tOj+44sXgXN4UIAXD27C6yIticlfu6ZtQPQDjBLe2TgmijY
	vjeOoudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5HJ-0000000BS3l-0KUr;
	Mon, 01 Jun 2026 16:14:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5HG-0000000BS1c-2Sf5;
	Mon, 01 Jun 2026 16:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780330445;
	bh=oWaRZrCK6p6EhmYmIaUvimw67y77UHwLcU6Pm0N+SeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VdwC11CumGLjmVexkqo9rjyudUduE8Hcdwz2Y/imx5cgfXqMyjVp6GqgyO2R3XZEk
	 XdhXVL4wIheu797YPSxgNh4kxVuYlHMiWdH8+wLlRalHGv5lxbxcNe7jY8vAoCInoX
	 RBUVxTmjo6UWp3TlT2XjQky0LaDAxaIqYROl0Y9OyAKWrriyEDwzvjRobD3eUkmo6C
	 muMJP6Zrkt+ELYcqrTTryGKTKO4PLh6qfmBGZuSAA6migPhMZxbw4zxzE6rV6YaHf6
	 dUzX928vOVVAOJ1+QZyjLHK5MZDuAc0sB4mVlfdv+NqCVkaflSS9nYkc/JAuzZxWGX
	 +4cvj3BwNPEjw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A35B17E09A3;
	Mon,  1 Jun 2026 18:14:05 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 01 Jun 2026 19:13:46 +0300
Subject: [PATCH v4 3/3] drm/rockchip: dw_dp: Release core resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-drm-rk-fixes-v4-3-c3f3f123e1da@collabora.com>
References: <20260601-drm-rk-fixes-v4-0-c3f3f123e1da@collabora.com>
In-Reply-To: <20260601-drm-rk-fixes-v4-0-c3f3f123e1da@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_091410_876672_BEA5D7A5 
X-CRM114-Status: GOOD (  13.17  )
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

Core resources such as the DisplayPort AUX channel get initialized and
registered during dw_dp_bind(), but are never unregistered, which may
lead to memory leaks and/or use-after-free:

[  224.661371] BUG: KASAN: slab-use-after-free in device_is_dependent+0xe0/0x2b0
[  224.662015] Read of size 8 at addr ffff00011aee8550 by task modprobe/658
[  224.662612]
[  224.662752] CPU: 7 UID: 0 PID: 658 Comm: modprobe Not tainted 7.0.0-rc2-next-20260305 #14 PREEMPT
[  224.662759] Hardware name: Radxa ROCK 5B (DT)
[  224.662762] Call trace:
[  224.662764]  show_stack+0x20/0x38 (C)
[  224.662772]  dump_stack_lvl+0x6c/0x98
[  224.662777]  print_report+0x160/0x4b8
[  224.662783]  kasan_report+0xb4/0xe0
[  224.662790]  __asan_report_load8_noabort+0x20/0x30
[  224.662796]  device_is_dependent+0xe0/0x2b0
[  224.662802]  device_is_dependent+0x108/0x2b0
[  224.662808]  device_link_add+0x1f8/0x10b0
[  224.662813]  devm_of_phy_get_by_index+0x120/0x200
[  224.662819]  dw_dp_bind+0x34c/0xb10 [dw_dp]
[  224.662830]  dw_dp_rockchip_bind+0x194/0x250 [rockchipdrm]
[  224.662864]  component_bind_all+0x3a8/0x720
[  224.662869]  rockchip_drm_bind+0x120/0x390 [rockchipdrm]
[  224.662899]  try_to_bring_up_aggregate_device+0x76c/0x838
[  224.662904]  component_master_add_with_match+0x1f4/0x230
[  224.662909]  rockchip_drm_platform_probe+0x420/0x538 [rockchipdrm]
[  224.662939]  platform_probe+0xe8/0x168
[  224.662945]  really_probe+0x340/0x828
[  224.662950]  __driver_probe_device+0x2e0/0x350
[  224.662954]  driver_probe_device+0x80/0x140
[  224.662959]  __driver_attach+0x398/0x460
[  224.662964]  bus_for_each_dev+0xe0/0x198
[  224.662968]  driver_attach+0x50/0x68
[  224.662972]  bus_add_driver+0x2a0/0x4c0
[  224.662977]  driver_register+0x294/0x360
[  224.662982]  __platform_driver_register+0x7c/0x98
[  224.662987]  rockchip_drm_init+0xc4/0xff8 [rockchipdrm]

Since a previous commit exported dw_dp_unbind() function in DW DP core
library to take care of the necessary cleanup, use this in the
component's unbind() callback, as well as in its bind() error path.

Fixes: d68ba7bac955 ("drm/rockchip: Add RK3588 DPTX output support")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index f137f699737c..0de822360c8d 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -107,15 +107,26 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 		return PTR_ERR(dp->base);
 
 	connector = drm_bridge_connector_init(drm_dev, encoder);
-	if (IS_ERR(connector))
+	if (IS_ERR(connector)) {
+		dw_dp_unbind(dp->base);
 		return dev_err_probe(dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
+	}
 
 	return 0;
 }
 
+static void dw_dp_rockchip_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
+
+	dw_dp_unbind(dp->base);
+}
+
 static const struct component_ops dw_dp_rockchip_component_ops = {
 	.bind = dw_dp_rockchip_bind,
+	.unbind = dw_dp_rockchip_unbind,
 };
 
 static int dw_dp_probe(struct platform_device *pdev)

-- 
2.54.0


