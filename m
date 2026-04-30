Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51853CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 22:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu3QEUzgvdGQ3RsoA/ZWcPyRuesuNSdUoXnD5P4MDNU=; b=GDZu8AiJWKLOZuy2K0f2VTHSzD
	kciOVIyb9L+AUUs9uFIL2FakMU5Sml17I9QcNT4rCjSVNi42HNkWGZ1O9h2a9asSTcglTH82gm5Ad
	LS3FtIaZn7uJcShGeAVQy4sumRvZmLGE9/UuREZwZ5vYYWuTe5iMDEjtVkARRZHtMs6QVYPyuxMEa
	s3Skxj6N3fGqaLzXIkHQyC6g5OuqagzvMXvFOFZWmag9nisLjoogFE/fhuijM73RBBLm2ctR4hTiA
	FzUMtVd2CAQ8BnetE870FP23yFrW8H+pBTChhAWDnRHwKqWL05e62aKymLXgdgJr95kIb64KaM7iz
	rx3Oieyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZka-0000000628R-33m6;
	Thu, 30 Apr 2026 22:20:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkP-000000061zp-0YG7;
	Thu, 30 Apr 2026 22:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777587637;
	bh=cpcF5zUbexmKNtAoNveJG8/W7/tWjI3iG9vDWZ5yK84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=exk7D8tzF3LNnFdk3smrtotA/j11atwaTApdGB8UJvuFQR53AbKn3LhQfEcK1ZHjc
	 y6k61hJerZ9sNtdTvijUX9/KcXdS4njhUZmzqxnhLQdWW/Kzz3Gl1erCD0CC4kwFjf
	 WwtCp/7iwZ/5rV2jjEVWfI+JOBJhAVTxWLQGtDWnDfQa9HFpCmjI6hftkpFBhVeAlL
	 BZgq86PaWvZEoki7ORLgCy+3NTSAbtxHmnt3tJASsbyLOZG47GfDCysEXWCVohwrOZ
	 Cgabh1P/Rwp2Efs8H5doqkWmG3Ar8bMksyNyQzv0UPudMszQjUPUEuIUCjostfFdoR
	 8VB6DqST9x1RA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E6CA17E12E5;
	Fri,  1 May 2026 00:20:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 10AC048002F; Fri, 01 May 2026 00:20:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 01 May 2026 00:20:29 +0200
Subject: [PATCH v2 02/12] drm/rockchip: dw_dp: Release core resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-synopsys-dw-dp-improvements-v2-2-d7e7f6bac77f@collabora.com>
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3483;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vNsF0Md05O3s39Img/mjC1c3hq74IIYjs7Fbd6owcc0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnz1bRJMtB3Lu8wN5zXTxQapdDYqzOvfzlDY
 hP1cPoCv/XrlokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp89W0AAoJENju1/PI
 O/qaMRIP/i1c299tP1z4DDXkqJ91EmVeJ84znCoY5fMZz0W8jplMsHWDE8bVHyR42RP22IG67+4
 QYPbP2CGfyD+x6Qj3mh1DWpqnXWR0uJHePi4iAkMu4qNJbjxwM5Ub8i8ANoJW48p9+TpUiuKVRF
 J9j5NFREtmqNs+hYBoIAmej5xrflYPm6DbIFmyZo5BWcJToZctOWsIImlLfsT094klpaSwrtDzb
 7Fj12udVSjr2dvHeAOGf85sRVd4Asf+l5H/v+tZg78+Nfnc6XldRTVTRq/m/hleko34hHmtZLXp
 vhV/TH7jRNbKs0UPjgSA2wD4YNEu6XinaHeoQFKD6bIRwWnzuSngt4k353ap1jABD/9VJVTlQsI
 ExzPT2VVcRleNh6km1MVwO8yGOn+yCeP4SyIsEtoOMkhlFF1tHBlzxcb2+FJYe34ZYxiFn+xWOm
 NO0hZsMcPzxLkM5ncA9rMK3NSEPATelRi4r5cKdB7KdHuq6C/e6k1SNIYvkKfk+vDfSCFoEXh3F
 BV0BSSWG0zV60u9VrPCX4Ize2Ar9NBa2VR418tHd6bUp/4J5M/JTbbY3U7/uzVKg+X04E7ZsYM6
 PvRzN5B9q4ovRjEtQHprZr6xLVmMDYvieOAcfmpqI+N7x0PpjAvJHafwtFO2qjWY9QAliYOxD68
 1zkJKU9yJZdrVdUrv3sQynA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_152041_332754_D2234DEC 
X-CRM114-Status: GOOD (  14.63  )
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

From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

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
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index a9a8bf43aa1d..150c2da8fee5 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -107,15 +107,26 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 		return PTR_ERR(dp->base);
 
 	connector = drm_bridge_connector_init(drm_dev, encoder);
-	if (IS_ERR(connector))
+	if (IS_ERR(connector)) {
+		dw_dp_unbind(dp->base);
 		return dev_err_probe(dev, PTR_ERR(connector),
 				     "Failed to init bridge connector");
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
2.53.0


