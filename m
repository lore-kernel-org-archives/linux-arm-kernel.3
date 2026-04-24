Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7509FE5201
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jI7tWaCBq+M04tGrxrtqw1eb11MzR6mo1J0dagXzKp4=; b=0YKKR2IHTXW/VnH5R51pBe5jot
	xJ1l+6oiRFn2+2davBpNlcaWC59sMl7tVKt0FeRaEuwi3FLi0lApTpEHiekqg8OHWhEsSJKNt37fz
	YtdvWneNN4FJc/P/9D0v0oqrjFWxRSdbBSB/JIwtZbOtSZvuDzKJlLTHAxa477Yka/iUmEj2D9a2+
	c8bAJcsjnuDP/DYMMsD7Y4sIij56ayLsxhCVI5xhnJkHDco3f+g9OHl65PTU8b5jbfQNxpJ79CwW8
	NFJORuJk+WFcHTvMpjbQEtt2tXfWARTzzvj37rLQhtxFnsntgV0P2YJdduydrYCONAmdwgP/RkV/5
	USrHva6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDdl-0000000D1Ql-0aDg;
	Fri, 24 Apr 2026 10:20:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDdZ-0000000D1Aw-05S0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:19:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6254E600CB;
	Fri, 24 Apr 2026 10:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AE2C2BCB6;
	Fri, 24 Apr 2026 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025992;
	bh=Euz7DdChlAIGYIv4MW9vjG7tVXHoxWupCrReeTOiaiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rBK889Tyc98Ux52s++5Ud4/5N3N84H5Xh0SpFE0/x0XJlqlgTfz3bzDxuaI8qSKyN
	 c0uay22m+GT7PXUTD5nEec4JMXJxunzIjfEgn+JpM/ZSPLYuziOpU6f7bUvRDHT79E
	 W0Y9B2JroJBpxZl/3c4y0w0V/y3OfB5d9UovpH3/q/WX37EZ9377QqH1qdozHZ/Xbm
	 GYTRkExTUG8w2AXRZANQNy7tWUK214yUDklSl1so3dhUbZIG96GDnq1EI+kLp3h8xT
	 gAzPS/811aN7Jq9r+j7FQHFXTH0JyRntqJeHPO2oL2g96wfsUsbxm7QmrNvOjnxuui
	 JfUQcEShdjfAA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:58 +0200
Subject: [PATCH v3 18/20] drm/tidss: Switch to
 drm_mode_config_create_initial_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-18-8b68d9db0d8b@kernel.org>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
In-Reply-To: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Euz7DdChlAIGYIv4MW9vjG7tVXHoxWupCrReeTOiaiE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnSew1029JKK7fMLF3Z7863bOOqaa8zD7Yh9vxcybK
 w59upSu1zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmonGMsd5z5r7M8j6LWS4n
 jRM3VZ16WRvqtafPXt+yXVyGL5mpv+J+loJe6K/YUPM3gYvTtHgPMtZKJemZ7S+wes7Ws7BcKut
 YaaDvviD+IOP6ZZXnHvKdiBQIn5rgKJm58W/ZineqAUlCHQA=
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

Now that drm_mode_config_create_initial_state() exists to create the
initial state, use it instead of drm_mode_config_reset() during
driver probe.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 1c8cc18bc53c..f5099d5d6e32 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -169,11 +169,15 @@ static int tidss_probe(struct platform_device *pdev)
 		goto err_runtime_suspend;
 	}
 
 	drm_kms_helper_poll_init(ddev);
 
-	drm_mode_config_reset(ddev);
+	ret = drm_mode_config_create_initial_state(ddev);
+	if (ret) {
+		dev_err(dev, "failed to create initial state: %d\n", ret);
+		goto err_irq_uninstall;
+	}
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret) {
 		dev_err(dev, "failed to register DRM device\n");
 		goto err_irq_uninstall;

-- 
2.53.0


