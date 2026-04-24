Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D018FE5200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHcSYD+cdRbonKWUJK28J0VmxjJJJYSV+VJWdht6WS8=; b=sSJ6ucjyF5UoGvqEJelRp4rgps
	2Cbw12EV329GNce5vkDwqy74kPP/yuld5wnl4VtyLgBMhqyNAC8Ov+lhqg4Ne0YrShCyxohewPI65
	egiF+55oRiPgQEGP0HfyXAj9AN30+7l9OkrU3JRjluZjFexw99GY26NiD9mR2liDCbsgKcnGRsXpw
	qWI0mxYGXDyWhm636kMRvYHRKRuCe9nLy7HUhJpZuQwvmAynS4AmsECXq+eJJtkbDEW9oewejQAa/
	sJOTYrOWqodw4bM7sNGAa+vgkUJsU32mfpek6G04/QCWzM5k5Tin1CiVND6vBH6XDFB2Ou86lTDsN
	Cscv+gOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDdk-0000000D1Q7-2mf4;
	Fri, 24 Apr 2026 10:20:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDdV-0000000D178-337c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 414A640A0D;
	Fri, 24 Apr 2026 10:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B2FC2BCB5;
	Fri, 24 Apr 2026 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025989;
	bh=r8iCVvbjhwlTQWPJs/wShGMSU9DSc+CbT8to6voKBbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CzeJKGyLvp3ygJdwmcdqShuI9sq2JW8uAHYHgS2qnM36/R5O71KrPv/Kp9E2PJat1
	 7bKI/AxkZ4pyeoLV3aLNducPlSArv3WUTBDLZEuNw/7D01pZzvYJlF6ZarCsBpniAa
	 KwkJx5lMFgWOtf6n5ZsXPgWLOeR6lByqp5ajN17ZeO8h7s4vNaMO4uqb18AMQKOCl9
	 55OxcjT/iMNfk0d/OV235Q2CWjo7l13gJO3vmeC4++c9KXaW0ZmKc9W6y5qhrWF37K
	 DafKiNIN5VU9fUoUhYymxmt3R4X6biPL1vjaMGkqXtnBTPoi5gmw7ekGGjsiYRMEfT
	 3jNi4UOg4EHSg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:57 +0200
Subject: [PATCH v3 17/20] drm/drv: Switch skeleton to
 drm_mode_config_create_initial_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-17-8b68d9db0d8b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=mripard@kernel.org;
 h=from:subject:message-id; bh=r8iCVvbjhwlTQWPJs/wShGMSU9DSc+CbT8to6voKBbo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnSeknyrNYUr5c2HnJdlZ7CEKcZPOMrq8v5mStf2Nw
 aYfy2v3dUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJeMcy1vB992561CWyULg1
 +/Hr2wnrjVKjVXvMi88VONy8KeeyeUfK1bAfbMtTDivFPKhaWtgpzljNNif92JaKfAnpk/kXJ8x
 KFGaKbozo3fmxxOD3addsnWNParbLzH+xpsWu0nB/XtRWBQUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_031949_869280_00A41336 
X-CRM114-Status: GOOD (  11.35  )
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
2.53.0


