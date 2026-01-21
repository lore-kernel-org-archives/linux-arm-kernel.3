Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FAAC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6fUF2fRjlnHh50Def4PZDDzQGCOnWfyeU9+GdnK46s=; b=2ziJ/5Wx1P+JxGowgBNmvY+sHq
	A6k6eHvL/p+jCznov5dUUNF946gVZazIASjYoeHN+V6a6LHr8BlmBVIX3NTOqBca9Zk1ysrUeA2xu
	aQDhi0U9ShFj51rltNx28lbyyDIa/pjQE6vJnYGIvT1EN52JULZ0tIsYzSPTEwD6azw+PaKuBnk5e
	7sTz7BO8PHqRqVlezOX2a4i7U773viXQSkAzz8xtJezo7cxfBTQh3BbOCXGr+QKZP3IUtwvSxux9M
	2fHg9WNL3ZWBZYCG5Ve1F8bjpzw8fvQhG4MxB2duI056RmRcSbkiryUX2GGjEdzHUnVJeKn8m+mn0
	8IomSBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihSe-000000069dn-27Ll;
	Wed, 21 Jan 2026 23:18:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihSb-000000069bq-25Xj;
	Wed, 21 Jan 2026 23:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769037479;
	bh=IOkGky72ycSVKMWdQ5+E2JdTAcFkDJyoVCA3jgsd9d8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KDlAI0/N8uL4N6MWF1dSwO221qrr991GSLn0purSrQ6KqqCqLVFzIbU/HSGfe6vXv
	 imBMqqa86BOIPsT0b9DeSH3Rb2JNpeqKtzfoxhZPPDnE/GSm0YrQ++L4xmVDYMQFyw
	 zBFS45utIT8b5+FRrGWrPW/EHy/Tu976Ddr1MQZlGS9+80Mp564ErDu0Iqo8qAxPF5
	 uK3W85kBGm2q2EA8//FTKfalHkdeazprWOtfLtas67khUvX6okCW/56wIa4Glupr9m
	 E4V8O1JIPp5UJ1a8KxTHjiMXNo/jR+oHLmdnl/3c6nyrPLX4riRJH+Ss2lNH2iJMMM
	 6xGOvsi9LJGzw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 102E717E138B;
	Thu, 22 Jan 2026 00:17:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 22 Jan 2026 01:17:35 +0200
Subject: [PATCH 2/6] drm/rockchip: dw_dp: Switch to drmm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-drm-rk-fixes-v1-2-3942f185750e@collabora.com>
References: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
In-Reply-To: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_151801_708573_FD053087 
X-CRM114-Status: GOOD (  12.93  )
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

Driver makes use of drmm_encoder_init() to initialize the encoder and
automatically handle the cleanup by registering drm_encoder_cleanup()
with drmm_add_action().

However, the internal structure containing the encoder part gets
allocated with devm_kzalloc(), which happens while component_bind_all()
is being called from Rockchip DRM driver.  The component framework
further ensures it is deallocated as part of releasing all the resources
claimed during bind, which is triggered from component_unbind_all().

When the reference to the DRM device gets eventually dropped via
drm_dev_put() in rockchip_drm_unbind(), drmm_encoder_alloc_release()
attempts to access the now released encoder structure, leading to
use-after-free.

Ensure driver's internal structure is still reachable on encoder cleanup
by switching from a device-managed allocation to a drm-managed one.

Fixes: d68ba7bac955 ("drm/rockchip: Add RK3588 DPTX output support")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 25ab4e46301e..98d97e0f3cf4 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -13,6 +13,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -82,7 +83,7 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 	struct drm_connector *connector;
 	int ret;
 
-	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
+	dp = drmm_kzalloc(drm_dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
 

-- 
2.52.0


