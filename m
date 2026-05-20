Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC6ECD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqv+YeIJkI2g11D+2DtQfLe8wPFVXyMtjKj4JhY7E8Q=; b=qe9N8xVwhPQBxo84D5jTd+Pz1V
	LUYMN7cNHqbGKaeCCE+YhB7zpgSfpuNcxcxKe/ypreLjt9XTRMUxD8FGE2WevNneHD/nVUmunn6dZ
	FnGMq+8teDD4MK4vW6pwLPivtw++u378UlI1T0iRnCIFHHkVrxtC/Ro8qGjZTOt7rEFe7PBJHhGi7
	vCjunzx8hNc5/ZqY0gscIyCHNeE50SkOy5Fi9Fu1L5C9OajtipBT8StjKFH50wxBmVS2t4BmjYmGL
	PDnc4bJbtQC0Q51kG/dGFQa/gUhvqZh0pHHQXD7H2J5QwkcrCszR5UD7pnn0a/8XUUMhnJeKD47aX
	leUT6YDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPloZ-00000005Sqj-49oQ;
	Wed, 20 May 2026 18:38:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPloR-00000005ShP-2ZL1;
	Wed, 20 May 2026 18:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779302312;
	bh=q9lAjq8Od9z7GCP3fP0P3yIEdOdqbBKGEd1xHccT+5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wf2xvDOxvItf3jlZ1igRBNGG9oq6tqMcROPCqFzf5MdSQj7uQd9/KO3cHwMiovH6R
	 bBUwL/WJfGM5r05dklc9vRodEQIi0DiylPSX1JU8u7e9PUQLLVtC3cM65w3wNtsU7F
	 9ntlHhg4bSgYHbPzEIvQxUiLwi6IiWWjnM5ETyL+bvN9tmMD4/kV63C+/CM+bskMQx
	 BexKtR1sPrETqkYe3AS8OL2x6H7TeGBzoWwR/lhhnCGNM0bfEhEbDoFWqOCNWGpLlV
	 W6j3Ki+VP3FnD1DGU0TOs/uZssJdRnV6/jsNad1x0BXtCKMCXi/p38CGz2GfkFp7Om
	 wa2ridcHtceXw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDC2D17E1305;
	Wed, 20 May 2026 20:38:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 20 May 2026 21:38:12 +0300
Subject: [PATCH v6 01/22] drm/fb-helper: Remove unused local variable in
 hotplug_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-dw-hdmi-qp-scramb-v6-1-24b74603b782@collabora.com>
References: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
In-Reply-To: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113835_807199_1FC6671E 
X-CRM114-Status: GOOD (  11.67  )
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

Remove the 'err' local variable in drm_fb_helper_hotplug_event() which
only stores a return value that is never used beyond the immediate
return statement.  This simplifies the code without behavior changes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 38d25dce7f33..d8fb90160b90 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1744,21 +1744,17 @@ EXPORT_SYMBOL(drm_fb_helper_initial_config);
  */
 int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 {
-	int err = 0;
-
 	if (!drm_fbdev_emulation || !fb_helper)
 		return 0;
 
 	mutex_lock(&fb_helper->lock);
-	if (fb_helper->deferred_setup) {
-		err = __drm_fb_helper_initial_config_and_unlock(fb_helper);
-		return err;
-	}
+	if (fb_helper->deferred_setup)
+		return __drm_fb_helper_initial_config_and_unlock(fb_helper);
 
 	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
 		fb_helper->delayed_hotplug = true;
 		mutex_unlock(&fb_helper->lock);
-		return err;
+		return 0;
 	}
 
 	drm_master_internal_release(fb_helper->dev);
@@ -1802,4 +1798,3 @@ bool drm_fb_helper_gem_is_fb(const struct drm_fb_helper *fb_helper,
 	return gem == obj;
 }
 EXPORT_SYMBOL_GPL(drm_fb_helper_gem_is_fb);
-

-- 
2.53.0


