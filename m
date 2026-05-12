Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FF6CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3l1z/iePXNi4GO8p6lkGU/OwiJ7RN8duNJmXjc6H+J8=; b=BtlI4/AW0pOgD3xGnSV2Waf614
	r+9J0ndja4quL1KpbSzNfVLWfIkVMVH5VbhB42yWnrNM01kowPge+3+PWpNvvisYG6L15OAJZvSA6
	Y95LH5gidHdjWF7r3+Sm+NVya7PHJOD/yYT73fvGspV9mNCz2Boi5QzYCxIWfNAvTnUi6hFOpblF3
	7lxX8GQbSd3pr9goNuTxlBK8a+npXBMqS+Crd7TGLmg6LQZlw+Z8x9R+Ot/BfQUzovYzL2hEG1Ooi
	SvkqhhAp9yL7+wRJIuXmz5COGnijm9404vTmATT0bToS6dzxcApACEcZd3G+bArSzFh7NYRUkxzE/
	zIEiiFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmpJ-0000000GlFT-42ZD;
	Tue, 12 May 2026 13:07:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmpD-0000000Gl8m-0m2A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2F6D41827;
	Tue, 12 May 2026 13:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3052AC4AF0B;
	Tue, 12 May 2026 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591222;
	bh=FGCqhfXKq37ObBfvHzfst4BF+DfJNKqHOHC/ClHMucs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cMluvZJRqw7j9BxTGDPezyQENd0Kcq2mAJEnXyR41wG1HhIjQa1f6HmEpu2xoDlDL
	 0W1xcmmrnymiPFg+w3tibqK/K3yk1n7N0zak+jzmoXxtY+c/H/IPmCvLChKDD9YAWd
	 XiY04umPT4MHhionGKv+3y3btuQ3Wb6KPr/vJ9mCltYiC6eulmdKN5Bhj6eBtiFP1s
	 xLKE0Lc0jfAEE4BlGQygTMeFRsqZIEV8EVTlycoDwCvzjQObj1+lN1POAAQt+jjc7U
	 OYzYgoPBFGlPhHY3LfdTXmBiA7B/S4wh9XwqkSmJ8B/w8NmSnZenlffWEJxMJmeiVF
	 Fac4Ox/qxUpzg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:15 +0200
Subject: [PATCH v4 17/20] drm/drv: Switch skeleton to
 drm_mode_config_create_initial_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-17-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
In-Reply-To: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FGCqhfXKq37ObBfvHzfst4BF+DfJNKqHOHC/ClHMucs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqofuSnH4C1QI7P7Pe/frixR7k+tPxG2mG3y1aov8v
 Ve32u9gx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIq1TGhtk6URtE7YuTHtyd
 e/XMqVczbX9fMRabsvNJZVtMny/X9J4274/K19eIZb6qPNSyVvXvY8aGOSKz8n8KNiW9/3Xu9zb
 WVPvXXw/87ZefXMPSs6hu79bpntZyf/UVp17/FbzQ3fXLRpnvAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_060703_315934_C8EC90BE 
X-CRM114-Status: GOOD (  11.57  )
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

The driver skeleton currently recommends calling
drm_mode_config_reset() at probe time to create the initial state.

Now that drm_mode_config_create_initial_state() exists to handle
initial state allocation without hardware side effects, update the
skeleton to recommend it instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 985c283cf59f..f537556b06a8 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -340,11 +340,13 @@ void drm_minor_release(struct drm_minor *minor)
  *
  *		// Further setup, display pipeline etc
  *
  *		platform_set_drvdata(pdev, drm);
  *
- *		drm_mode_config_reset(drm);
+ *		ret = drm_mode_config_create_initial_state(drm);
+ *		if (ret)
+ *			return ret;
  *
  *		ret = drm_dev_register(drm);
  *		if (ret)
  *			return ret;
  *

-- 
2.54.0


