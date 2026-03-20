Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D9B10987A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALwFXkWrV/tgTELhXKE1VhuSCHXn8zcxtS4gTy3PyYQ=; b=EAPrz+XoNXpgH6NeRHDRLP9Nk+
	hP8s8eBkbopxq5j66W5T6KUF9zQL2TUCig6ZaOu7ybemkAV9jtLBbfaeEecDT2qijayFYLBEebcpd
	ea0cVq8mM1Mm8RqELaRYYPbcLDZddLX+zVj2nUsdcdcAO5HzkXMzAtC5dydsSQBeJDwhpxmd6AqBt
	ULIfZQcy0HB6QcPzOvz5rculnqjKiwUNUxWg0CoRptHKVaHLEBVtTDWRN1cW3G/tqW+08nQGaWrA1
	tcHX1YpwRvBk5FwmtrwJ5MgP2sWtDmyZZ9qaIvhNhoP0cC2XejqdWiZlf1M2qGroJnY9S0f+ayn7G
	u2vHcWnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chu-0000000D8FY-2KMV;
	Fri, 20 Mar 2026 16:28:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chm-0000000D86c-3O0d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3605A6013A;
	Fri, 20 Mar 2026 16:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B22C19425;
	Fri, 20 Mar 2026 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024089;
	bh=ZCmJ88Jg/R0ZaGWt4Lbnf1PZ95HMiD+1w0SbJAg/htU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AEu2trzBAfFOayFDVBex14Mc8zD+myHx+T4ECnRRrYG2srDpJsR3HgxD0ay5aiYau
	 QtKqmA38LUerV5Ljvh790yFln9K2gtX6qvklHS9uShPojQl3XVVp0fj4FHyEvTwgIC
	 JAZqPfScgaVElYSgyF0zniZ6oLUqlPi/g+ulSnaPxRNRQdzxgpk+JlqEk3vxqmMWKa
	 Il7n133119QKa31CztyQhVRSNzrDtLvfFcJs3nBfIniWlCczGwq6T/I1Co0KbCwGc8
	 bcUimQt3sDceJaVyKCLHvnI77PHgAqw9hgxIvSQDrC92UCoG6FbP0e8h2QeDwvsARp
	 S6tAPtS0XrGmg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:22 +0100
Subject: [PATCH v2 15/20] drm/drv: Call drm_mode_config_create_state() by
 default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-15-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZCmJ88Jg/R0ZaGWt4Lbnf1PZ95HMiD+1w0SbJAg/htU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S7O0lcoEDoa4f72ltD6opGbHReGMScbTkmPWtCcI7
 W1uOz69YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwkw5WxPn43y5KuGsfzoef2
 BE3JYV513+Xrln0XPbNE1QXkan1E9tbLsanmbze+YFaqVhe689Jkxvq0I9cUH2rP/i96mlmjZ4X
 ZZ+0Xm1dKHq/T4yt69W1GqLTws+cberlM2N4djtNNDOda/QEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Almost all drivers, and our documented skeleton, call
drm_mode_config_reset() prior to calling drm_dev_register() to
initialize its DRM object states.

Now that we have drm_mode_config_create_state() to create that initial
state if it doesn't exist, we can call it directly in
drm_dev_register(). That way, we know that the initial atomic state will
always be allocated without any boilerplate.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce8a6640cfb0c59936031990727ed1..820106d56ab399a39cac56d98662b5ddbcae8ded 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1097,10 +1097,14 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		ret = drm_modeset_register_all(dev);
 		if (ret)
 			goto err_unload;
+
+		ret = drm_mode_config_create_state(dev);
+		if (ret)
+			goto err_unload;
 	}
 	drm_panic_register(dev);
 	drm_client_sysrq_register(dev);
 
 	DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",

-- 
2.53.0


