Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CC910987A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+lRjeseEmbME1DibNGtEYVyPjFoXkYvBpdAOlSHfX0=; b=U0UJvfztxpixvqNlSi0jL2EEKm
	bZiydWw6mg7Um/+1qItXATWOmbDZPqjuk90ZcPU8GvxTA9Xm8WAcF+IyyekrovJUJ/7rmze+IT+/A
	Bra2XC3PjQAHW/RtYeWE0UXXNB5lD/oCu6d2PN1goVCbKvcJST2awoSkU6E6P0qy9z9aTHgxeewHR
	h/LVPutGq4nVhaG+w0NwDCF/kA5c5BoHgiF6tSlPlrJ+VOT2gftMond35+NBvnjqQAsuMHjmdv9uf
	XqWLsxEKWGWTPlIX0fUkOi8OxfADcbmlEmxjOTWtp7dDoIu3UIPx4X1NYB4KrGGP/zREjGQT0/Zks
	htSs94mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ciO-0000000D8hL-0N22;
	Fri, 20 Mar 2026 16:28:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chs-0000000D8Bi-08VA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BBD042D58;
	Fri, 20 Mar 2026 16:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE695C2BC87;
	Fri, 20 Mar 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024095;
	bh=jrOhK6ywzWa7h0Q8vD7bhuiyhE6TZdHxkM63E2sT2zs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vno/VdoO68EmlRZ+dVSxEkhau93ukVFgRb1T7DhihSfMQMCWHY3c8QVOXOSUpsqdg
	 8GDI2OEiIqi21P2F9SauDfpL5c5z0UQ9ED6JNSHaPAFgDEK6deMwE9VjbnzoPzJB5p
	 Sq1Pokx6aeStRFRCElmDuHLioEdfhDb8OJ9mvZKashx4vXR6jPydlAcTjXbI8+P4gF
	 zhgxlcOyxvQILHPLAQq2RmlhMBh/RKKxLNp/rEZfVp7e64C2v6xWHUSpQV/dJaMZr9
	 N8RtO0UEejCP2zdsQ6iKCI+QTUNPV8PKCtRWG4zXeHbOgbXQWZFstvjcaj/b+qG0nk
	 sfvy2BkILTAlg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:24 +0100
Subject: [PATCH v2 17/20] drm/drv: Drop drm_mode_config_reset() from our
 skeleton
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-17-c63f1134e76c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jrOhK6ywzWa7h0Q8vD7bhuiyhE6TZdHxkM63E2sT2zs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S7Nf1Fg1PZu0LOj1M8dJ+7kUKp6ozDzwz965RfB0a
 3PwzRsqHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiGq6M9bU+sfkHUn66RRVe
 1TMMZjlzf3VFe6BmnuByviqrkHsr58tHPHK6/cqPy2eerG9l4I46xoYVO5d+nxu51GhFzb3+C7z
 8m7bcXF3zg+9B0bZZJmtebRf8v0nvbcWSnqqUq1Kn559InToLAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_092816_180165_3870E307 
X-CRM114-Status: UNSURE (   9.49  )
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

Now that we have drm_mode_config_create_state() to create the initial
state called as part of drm_dev_register(), we can stop recommending
calling drm_mode_config_reset() to perform that initialization in our
skeleton.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 820106d56ab399a39cac56d98662b5ddbcae8ded..83752725f7c63364880225ec1083f19bd00ddcef 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -339,12 +339,10 @@ void drm_minor_release(struct drm_minor *minor)
  *
  *		// Further setup, display pipeline etc
  *
  *		platform_set_drvdata(pdev, drm);
  *
- *		drm_mode_config_reset(drm);
- *
  *		ret = drm_dev_register(drm);
  *		if (ret)
  *			return ret;
  *
  *		drm_fbdev_{...}_setup(drm, 32);

-- 
2.53.0


