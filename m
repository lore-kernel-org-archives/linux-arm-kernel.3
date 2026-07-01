Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92633C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 11:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lO56/jrYt5xZFVEPQmv45xkupS1NYM0pLDiA7bnEG+A=; b=Ho5yySMt2CCg6CV2ctICtVaavi
	2Dfd85q2rpU9VbirmdK4QJGDq167ytXKHArZTEtDWLhxMg+hlylhGC08Ijrq54q+gG0CAARB5U+WP
	FDzuVwZGuXY/mvQk9aGh4saXiyeQaxBUgdNa/ZQTUw+G/8R/AAKNztqdPmhCOdR55A4ezyIgB/aa6
	mTlFX6pjDm3rHG4JKFjQPGc7yIXDfr1unbboiDXF0nNJ7Bu70xX1oMMKXEbto22QbYsuLy0UNPc5T
	m1AbPvkEUB2E0QRcZZu1nk/q31rpvrMsJaAu0gMgthcNOpVaL6DZN1HJOlW4/hhrwSymKETBV9Ed/
	lbdOig1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesfj-00000001OaY-3TWR;
	Wed, 01 Jul 2026 11:00:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesfi-00000001OZr-1Gxi
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 11:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lO56/jrYt5xZFVEPQmv45xkupS1NYM0pLDiA7bnEG+A=; b=ptcZtBuNM3fl5ilwwulOBlumMM
	9u2wD9Emu3MIkr0PUGW35772/XBYwa/2W/4YD3Ac8WlSQnyCV3Y+xp5vse0WefUTJ2WGMj9tiWngI
	BwGFu5iZ9P/0mrA2SvrKb+J4/3QrZ31g1V+p2xUwxLFpTWtC9+G7nRiXWuHVqztS7lyF6cvMZAUyA
	XmzW7qsa6qGaJygboX/1ykUfVHFCgmW/qTTIUJDiRu1tDABRUPAQHa8Gv29pPdPmw2JvTa0/2DcZV
	jLaUMUybigIZKsOgHDqPOHZ5yFyOtys53abivX5tqDqtBbKpN7yZVebwE8eu8eeUn82ye5g44hJuV
	LtfXEM7w==;
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wesff-00000002ecX-1nqr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 11:00:01 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-69d7aa0ac14so359879eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782903597; cv=none;
        d=google.com; s=arc-20260327;
        b=oJ12zubGuAYEWhuXM1h9ZhCjKlzn8e05iFJMf9hLsO16yYoH3sCnfbL2Wr+2yRKPyT
         DNo3sg6YRHmiU8rWU+r6GDj0QAxPeGN2ERML0pKEzD77RVdoqmv0bQQhkzQhxjPim9R0
         fO3vXDT6eqq5QuDV8Gd1QVi2LTLhwfLhIG25EIaokPUQuruzWMUQZ52gkiKO8/KLzeBj
         xLtCX7VypSyLPfLNvZil4SC+g4L6eKRGFLkrB6VNGI1IGEFYa9x0oI0Vwd9MAW3fFo8R
         iBRofEbqlrIqa5MHvQ9pw79WBywWl3LRiZHEdy21xf+IgBfWd4WCmYbaiWoCZ346q5rO
         mYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lO56/jrYt5xZFVEPQmv45xkupS1NYM0pLDiA7bnEG+A=;
        fh=u9hS/jekzcMkMfuVIjGTFH0L7hiYow09s+NLtLGZsdk=;
        b=BnscOsvWQAnajXuXmw398vXNzn6mjAj/x4o/Uy7WWSQVhkV3xCnCFhF2iT07YTTApB
         FDliMhtn2+BCOyUBWIP3AFib7KeUUnfrRZTJWcbM5PVZSz4FZuZEYqzOnhOMM7xexbqU
         bTNEi02YSEVFXptb3omur2YrcBUSMXYqblejmhDcbJvZmZ//hWfS4rt058QGPZ7meCLo
         otkhGMvBTjjANd4sZutEro6vDEzuJEAo1cyGRjMig5XrYhHzAghwZE1GJKBBponQxC23
         sgrq5FE+kklyXKpBfF5nEm24SvfnzOAFeBsBEz1g/gyn0UnM4J5rbg5jd3SvB5pYizNt
         BIIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782903597; x=1783508397; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lO56/jrYt5xZFVEPQmv45xkupS1NYM0pLDiA7bnEG+A=;
        b=a11kQEVYa+v7djG1k+TEqBXcaAgUFj8K3husi/V/AXRteiUBKgO8CH+54/zive7Cnj
         2o0BSZFG68kxm5Pirc1F6cFknopGY9ksF5DlQJuih55QKM1/qtEAOiIT3TxdKnqD9J7X
         OrU3TIdi3S+Fsxf32MHDCFlDo8Xp405NBRqtELfvUXDaJw9XvlDveyV2oG98DeGxAV9x
         MJ7fsDeuEZTeiI6xevYlik1BYxsFOOUV035jYv6v146nCelkSXCmWRWSaI2WRyGUnJi7
         GHHoNTKV9eM4HvVQaaggy15bnxsFmm2PkmjTiMXVLmwJfig9E7tL8hUwDMrlJTuuSM5e
         XGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903597; x=1783508397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO56/jrYt5xZFVEPQmv45xkupS1NYM0pLDiA7bnEG+A=;
        b=F+FPDujzJVph8HWf2bVTXi0aGYlu9Krp7sz+EUIqjM31AyldYCHG65PiyebPlJpBaN
         ba9ZDJ+IuY/kY3OO7XTdStB8qOQ3ATqu3jVtaJFuqvIcmDcXZf2y4HVAYlGMhqtaPR7Y
         85Mg9LJ9vWKnvBlBJqSlMNMQ3LN9ZIpyP5heACVl7j/5dEz8l/shzhJQQX8LosiatOwU
         8q6riWF6R+iJIBcADZ/C7SwyUKzfw6MX/nIHZ/WC2uxJ50RBlJLDtRZLej9A5muCeHSl
         WdaGGfAU3+Axej8G0ArG+Y67aMDzD9oQDyWUGYLmK9a8Po6zJTDV7auhkg4kN23xz3cy
         xMCg==
X-Forwarded-Encrypted: i=1; AFNElJ91XRqDC4oTZIJjhh2KHZNvSI4Y/PfTgo5Bv82NvavtZuAv/WMmmn/Vt+rauGNgZkLmrjT1btTzSSmUtXJOTqx3@lists.infradead.org
X-Gm-Message-State: AOJu0YwmEP0tJOYwJUJpBhxj053XWSgMLw97fwvUXi1lbR2ZfnC13DP+
	hpv7Xp/1mNCSmdLvElPtap0fUcsCEtBpp8c+L6nv77RyGYyDeJm6/tzF1oB6m7i9PvPc/lq4Qmm
	9u00aeo1pnNabHKd5ZqxXf6NTdWEdiMg=
X-Gm-Gg: AfdE7ckzon/npF8Xm7E+6V7pGMxdkc7n4igOdbRYN4izoSEKNjw+DOvI5rF6UTpG1FI
	uecr/ihBrJNXkYQx2X2usDegi1N0rDryxuHApUmoPKMYPGaPU0yZEV9A3DNY7A71ccygYOTLClk
	YPeFVwze6gMeA5v4rIjCDiYem7L4bqhs/FrkQrs8Tq3zlHlwSY8WSZ0VkG87zbm5No6iLpsvVNX
	b7xvCNGP1JBCvtVpNni9FPw8l/DbVW+8e6lD7r8w2Lc0OC6wOXhQObSRNUxfmutzOpQkdU=
X-Received: by 2002:a05:6820:4c10:b0:6a1:7abd:2a6c with SMTP id
 006d021491bc7-6a309bc1fb7mr506522eaf.55.1782903596578; Wed, 01 Jul 2026
 03:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260608124018.480365-2-diogompaissilva@gmail.com>
In-Reply-To: <20260608124018.480365-2-diogompaissilva@gmail.com>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Wed, 1 Jul 2026 12:59:45 +0200
X-Gm-Features: AVVi8CdTMl8FaEPIfiIJ6n1_iuadQGCC_quf_89FmVweKwbOPq0QNm5_UZ___PQ
Message-ID: <CAJpoHp6DnspnA0rirGb6E=A9wCS3eaDn=eFaqmae98Q+39b1PA@mail.gmail.com>
Subject: [PATCH RESEND v3] drm/rockchip: Remove dependency on DRM simple helpers
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_115959_654917_1A4783F2 
X-CRM114-Status: GOOD (  17.50  )
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

Simple KMS helper are deprecated since they only add an intermediate
layer between drivers and the atomic modesetting.
This patch removes the dependency on drm simple helpers from rockchip
DRM drivers.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
Resending just in case this was missed. Thanks.

v3:
 - rebase on drm-tip tree

 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c  | 9 ++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.c           | 9 ++++++---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c  | 9 +++++++--
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 8 ++++++--
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c        | 1 -
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c      | 1 -
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c   | 1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c           | 8 ++++++--
 drivers/gpu/drm/rockchip/rockchip_lvds.c         | 9 +++++++--
 drivers/gpu/drm/rockchip/rockchip_rgb.c          | 8 ++++++--
 10 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 776954c7d052..46c245e35d21 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -30,7 +30,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>

 #include "rockchip_drm_drv.h"

@@ -303,6 +302,10 @@ rockchip_dp_drm_encoder_atomic_check(struct
drm_encoder *encoder,
        return 0;
 }

+static const struct drm_encoder_funcs rockchip_dp_encoder_funcs = {
+       .destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs
rockchip_dp_encoder_helper_funcs = {
        .mode_fixup = rockchip_dp_drm_encoder_mode_fixup,
        .mode_set = rockchip_dp_drm_encoder_mode_set,
@@ -361,8 +364,8 @@ static int rockchip_dp_drm_create_encoder(struct
rockchip_dp_device *dp)
                                                             dev->of_node);
        DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);

-       ret = drm_simple_encoder_init(drm_dev, encoder,
-                                     DRM_MODE_ENCODER_TMDS);
+       ret = drm_encoder_init(drm_dev, encoder, &rockchip_dp_encoder_funcs,
+                              DRM_MODE_ENCODER_TMDS, NULL);
        if (ret) {
                DRM_ERROR("failed to initialize encoder with drm\n");
                return ret;
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c
b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 190cce9530c8..c3f41a4449f5 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -23,7 +23,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>

 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
@@ -671,6 +670,10 @@ static int cdn_dp_encoder_atomic_check(struct
drm_encoder *encoder,
        return 0;
 }

+static const struct drm_encoder_funcs cdn_dp_encoder_funcs = {
+       .destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
        .atomic_check = cdn_dp_encoder_atomic_check,
 };
@@ -988,8 +991,8 @@ static int cdn_dp_bind(struct device *dev, struct
device *master, void *data)
                                                             dev->of_node);
        DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);

-       ret = drm_simple_encoder_init(drm_dev, encoder,
-                                     DRM_MODE_ENCODER_TMDS);
+       ret = drm_encoder_init(drm_dev, encoder, &cdn_dp_encoder_funcs,
+                              DRM_MODE_ENCODER_TMDS, NULL);
        if (ret) {
                DRM_ERROR("failed to initialize encoder with drm\n");
                return ret;
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3547d91b25d3..a09b382d208e 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -25,7 +25,6 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>

 #include "rockchip_drm_drv.h"

@@ -825,6 +824,10 @@ static void dw_mipi_dsi_encoder_enable(struct
drm_encoder *encoder)
        clk_disable_unprepare(dsi->grf_clk);
 }

+static const struct drm_encoder_funcs dw_mipi_dsi_encoder_funcs = {
+       .destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs
 dw_mipi_dsi_encoder_helper_funcs = {
        .atomic_check = dw_mipi_dsi_encoder_atomic_check,
@@ -840,7 +843,9 @@ static int rockchip_dsi_drm_create_encoder(struct
dw_mipi_dsi_rockchip *dsi,
        encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
                                                             dsi->dev->of_node);

-       ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
+       ret = drm_encoder_init(drm_dev, encoder,
+                               &dw_mipi_dsi_encoder_funcs,
+                               DRM_MODE_ENCODER_DSI, NULL);
        if (ret) {
                DRM_ERROR("Failed to initialize encoder with drm\n");
                return ret;
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
index d2e76d36d724..9dc207c2d20d 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
@@ -23,7 +23,6 @@
 #include <drm/bridge/dw_mipi_dsi2.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>

 #include <uapi/linux/videodev2.h>

@@ -275,6 +274,10 @@ dw_mipi_dsi2_encoder_atomic_check(struct
drm_encoder *encoder,
        return 0;
 }

+static const struct drm_encoder_funcs dw_mipi_dsi2_encoder_funcs = {
+       .destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs
 dw_mipi_dsi2_encoder_helper_funcs = {
        .atomic_enable = dw_mipi_dsi2_encoder_atomic_enable,
@@ -290,7 +293,8 @@ static int rockchip_dsi2_drm_create_encoder(struct
dw_mipi_dsi2_rockchip *dsi2,
        encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,

dsi2->dev->of_node);

-       ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
+       ret = drm_encoder_init(drm_dev, encoder, &dw_mipi_dsi2_encoder_funcs,
+                              DRM_MODE_ENCODER_DSI, NULL);
        if (ret) {
                dev_err(dsi2->dev, "Failed to initialize encoder with drm\n");
                return ret;
diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 0de822360c8d..b23efb153c9e 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -20,7 +20,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>

 #include "rockchip_drm_drv.h"

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index cffc0af5190f..b6e154c35e7c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -18,7 +18,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>

 #include "rockchip_drm_drv.h"

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index f35484715c2d..af34062685cd 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -24,7 +24,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>

 #include "rockchip_drm_drv.h"

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 1996f8656612..b4ba9f894360 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -12,7 +12,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>

 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
@@ -454,6 +453,10 @@ rk3066_hdmi_encoder_atomic_check(struct
drm_encoder *encoder,
        return 0;
 }

+static const struct drm_encoder_funcs rk3066_hdmi_encoder_funcs = {
+       .destroy = drm_encoder_cleanup,
+};
+
 static const
 struct drm_encoder_helper_funcs rk3066_hdmi_encoder_helper_funcs = {
        .atomic_check   = rk3066_hdmi_encoder_atomic_check,
@@ -696,7 +699,8 @@ rk3066_hdmi_register(struct drm_device *drm,
struct rk3066_hdmi *hdmi)
                return -EPROBE_DEFER;

        drm_encoder_helper_add(encoder, &rk3066_hdmi_encoder_helper_funcs);
-       drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+       drm_encoder_init(drm, encoder, &rk3066_hdmi_encoder_funcs,
+                        DRM_MODE_ENCODER_TMDS, NULL);

        hdmi->bridge.driver_private = hdmi;
        hdmi->bridge.funcs = &rk3066_hdmi_bridge_funcs;
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c
b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 7a0c4fa29f2f..f3be2c91d147 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -24,7 +24,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>

 #include "rockchip_drm_drv.h"
 #include "rockchip_lvds.h"
@@ -427,6 +426,10 @@ static void px30_lvds_encoder_disable(struct
drm_encoder *encoder)
        drm_panel_unprepare(lvds->panel);
 }

+static const struct drm_encoder_funcs rockchip_lvds_encoder_funcs = {
+       .destroy = drm_encoder_cleanup,
+};
+
 static const
 struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
        .enable = rk3288_lvds_encoder_enable,
@@ -594,7 +597,9 @@ static int rockchip_lvds_bind(struct device *dev,
struct device *master,
        encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
                                                             dev->of_node);

-       ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
+       ret = drm_encoder_init(drm_dev, encoder,
+                                     &rockchip_lvds_encoder_funcs,
+                                     DRM_MODE_ENCODER_LVDS, NULL);
        if (ret < 0) {
                drm_err(drm_dev,
                        "failed to initialize encoder: %d\n", ret);
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c
b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index add3123e5ce7..2ad24b914989 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -17,7 +17,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>

 #include "rockchip_drm_drv.h"
 #include "rockchip_rgb.h"
@@ -65,6 +64,10 @@ rockchip_rgb_encoder_atomic_check(struct
drm_encoder *encoder,
        return 0;
 }

+static const struct drm_encoder_funcs rockchip_rgb_encoder_funcs = {
+       .destroy = drm_encoder_cleanup,
+};
+
 static const
 struct drm_encoder_helper_funcs rockchip_rgb_encoder_helper_funcs = {
        .atomic_check = rockchip_rgb_encoder_atomic_check,
@@ -127,7 +130,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
        encoder = &rgb->encoder.encoder;
        encoder->possible_crtcs = drm_crtc_mask(crtc);

-       ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_NONE);
+       ret = drm_encoder_init(drm_dev, encoder, &rockchip_rgb_encoder_funcs,
+                              DRM_MODE_ENCODER_NONE, NULL);
        if (ret < 0) {
                DRM_DEV_ERROR(drm_dev->dev,
                              "failed to initialize encoder: %d\n", ret);
--
2.51.2

