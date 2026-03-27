Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C10E10AB83A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 00:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQqJvXajLHjl/SxMYkRapFmRphDqSfC3oomdRRUvPYU=; b=lWSBaj2MfMPJ82e+irJe0UDqBP
	3wvTApOq9FESrlxClURTbXF6EfmhdfaI3fGLTD3gyOd7yPz6on955lVXXEr8LUPSJE8cUKin1pRcl
	jP7J4BulsEfwvuzOHNtv5UaVK8G+wT2fhPvn4FYa2G6CldXOhNvsC+ye9EYxuaesyhOumi9wPPFG1
	/LQfwtZC0CVQQLGZNisT2XRUTw2AETMhD4ZEssSQEwK4yzH5/l3aC9af2IP2rCs0+yME+8qIa54WW
	duMecqak5M8Wuq+KMw86PW2HxY/8bgb3WOZQ3iR/47ybXktj6Mv4Iz4thgafjbAcCrrYMdziA9fEf
	d02VBEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5vUI-00000006S5E-15F5;
	Fri, 27 Mar 2026 00:55:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5vU9-00000006S1o-1lWu;
	Fri, 27 Mar 2026 00:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774572934;
	bh=tztSE7SMotP2ApOQgMs6VQN4mKHjZGlxVgzyCALnvg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gd9qyZa6f50EQ2woQAKWdffWYXSMAqJ+wJclbePclFRXIMJ9yiJ352MBi3TAaLSm/
	 IDUx3XTs/zByAj+fYw99zFfxJoSIZ713uPswMLC10F6u9oXeTV904QTdXHu3tmT+l7
	 1NCzaROrVBjO8xuC0FGrIttA9ZsIHQ0MsEGcR+Rsn0Y5rmEujGPRy9Ewxttxskj06U
	 w0lpA1+RQMh/kkC2i3fn8FqlbyVR9Kx80d/Y1R6iGL4Csf2C4+zvgHARLCek8cyppC
	 BLuFcdP/7FVPaVjfVwAjso28p959SYh4RV2qJ43CKimEbL/PG7Z7ae1tZGKf3NcCG2
	 Szz63pa5tASFQ==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E32CC17E62BF;
	Fri, 27 Mar 2026 01:55:33 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 27 Mar 2026 02:55:08 +0200
Subject: [PATCH v3 2/2] drm/rockchip: dw_dp: Release core resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-drm-rk-fixes-v3-2-fd2e6900c08c@collabora.com>
References: <20260327-drm-rk-fixes-v3-0-fd2e6900c08c@collabora.com>
In-Reply-To: <20260327-drm-rk-fixes-v3-0-fd2e6900c08c@collabora.com>
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
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_175537_637782_C28EE06F 
X-CRM114-Status: GOOD (  12.32  )
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
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 22c0911f1896..8cba90d2dd56 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -108,14 +108,28 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 
 	connector = drm_bridge_connector_init(drm_dev, encoder);
 	if (IS_ERR(connector))
-		return dev_err_probe(dev, PTR_ERR(connector),
-				     "Failed to init bridge connector");
+		ret = dev_err_probe(dev, PTR_ERR(connector),
+				    "Failed to init bridge connector");
+	else
+		ret = drm_connector_attach_encoder(connector, encoder);
 
-	return drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		dw_dp_unbind(dp->base);
+
+	return ret;
+}
+
+static void dw_dp_rockchip_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
+
+	dw_dp_unbind(dp->base);
 }
 
 static const struct component_ops dw_dp_rockchip_component_ops = {
 	.bind = dw_dp_rockchip_bind,
+	.unbind = dw_dp_rockchip_unbind,
 };
 
 static int dw_dp_probe(struct platform_device *pdev)

-- 
2.52.0


