Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE345C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwqt02/5YgI2sWimxuqpEvjJd9luKWmmhf40MhWLG54=; b=hHzdn54zM/RKxuYh5s2VGRux/C
	jOpTCdg4kOOOQIyY2pF90xcxduvGXYKamCEAOG9B9Vq+dmD7wevQvIhh8XJCel/afq+zQFsVaOJvL
	BZ2Uq3kMggxx3qcmkb5aQ8xNabFvFN5qEL6akFGvoXkEK6z3WihxQ0JSovChJjz1TX18FZGy8TAB8
	R2rFxRKlp+1b7z7/WKxUKhc0nvpMmRFZXNnno/YXUvAzdcvJdgBl84oQNxbI9T4o1458Li0KpQUKS
	iuTyERlw100/Xn71+MKvIIgfh7iqZXz6EEuLtVyiQzbClL9GE/3qeP3x4EBrGq9WILZr0fgIIS3YF
	t4GU2rSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNsP-00000005Qxv-14gY;
	Thu, 02 Jul 2026 20:19:13 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNsN-00000005Qx8-1nSz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:19:12 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-48b7df4b4ccso680947b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783023549; cv=none;
        d=google.com; s=arc-20260327;
        b=cC/et30CQ4sZDCOIpbsj2ncIYSB55GEG/gY+eM3HfvDHAYUBaaXro99nmMNyb/hsEK
         dUG6ya/7iYmZYxN0OGadjsW2udyxxPWrU2qmLIOCuK8GFrLvd0Tdd1zrv7IUzUB1BoUS
         4ewsKjQ3FSE5oMR1IADdG1UtYc3MRqCH4gmTxahfTUAc2UiOFWBNZ5XEPqpGxyYu4WAO
         U5XxjRpPatBkU34Uooic/twBSjMUgWcw5ffDV/peeC/m0bWLwPLZ7tFMnIF5tH7m0ETh
         WLYo9L+IDt4ZleJoq7eUD+5O4TYkcHGFyG2AsmRv9q4x5yddJU5pfvWIZh7edfrofrXD
         CDiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bwqt02/5YgI2sWimxuqpEvjJd9luKWmmhf40MhWLG54=;
        fh=i40aUtyhuYV8VcC7iscpbMETB//9ErW93IvRs7mjwVU=;
        b=cRkGBJmmHRrTHX3oh9HOhpOarMJbbLZ7jIAQg2MaYOerwolfRJtMP4Dy1bPAstLyOP
         LeuHci4CYkRSlNjd6SgtHYyQQ7UWgsGBhSbb5VlENVPfccIww6wkphm4DzeQ+zWVLNXt
         RYORQoDwET0jQ6JIM7A644GR5ETBSewE7cv/7jEATWIVAF3bVL03xmFrq0/am4m8BJLq
         eI354Ht8hRUHYYuwk5HPqocJ6lxHgauZ5vUKLKSP3VpwGyWJaUyjJKAHRRMA8cOJRKQf
         g+igjvLGLDm+mmQFx9Ut3qvBY+10Ev4huKyoadn53+xCRS5lIpnEeAj9jFLuOQZn4GHE
         gLfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783023549; x=1783628349; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bwqt02/5YgI2sWimxuqpEvjJd9luKWmmhf40MhWLG54=;
        b=fc/BccUU5RiPn8K5zBBYugSU5JiFf71qqzI2//QU+lsqgMrwneieQTi+5gAG9QO8IP
         cC6ESkykXCuV8p4gGV3Ah3pOyGmCQH2UCL4JJX18l/atouI8dwcpmQAmR6mbk9muBycI
         t8IHW6+XfcU8x5Fhb2HuYzfWlElA9cSOY9HrhtwpasVJ2dF/KrSNUpAPAjfE7U7DCBQ+
         OAgJ7b2gyzdqjzCtJ3yQF1s1vziRAZGoseWUQ+XaLMwcdqtjRmIS9g/vepFUTSzgYJbW
         ZaLJt8h3nk+G8IwK2uAttTJnqsNzvWlYbbtGZHB0pc8PJbmWUv4mjrGEFJ08XVWJKDYD
         gTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783023549; x=1783628349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwqt02/5YgI2sWimxuqpEvjJd9luKWmmhf40MhWLG54=;
        b=MbHf+8/mZWu8mqfBo5qi6YcPmDM3B0TUxD81K1E2EW81F8esPbhWaTLdLHgL4TYwTR
         /qytd5fT+kFzepEIpi7HRvMsvsQAM+Ul7afr24V3Ts6Jgt2beIvulJNHg6s1Z7eIYHKJ
         ZBR6AdqQMzDtCgLmzKZIf1XViQd+P8pDAuzSFXwBzdH3EskjzA4WhPmJLoOANNLkc9KH
         ssUzc0CLrFWhRyNmIooMdTUJCE9hh2FMp0bCGDVxh6h3KaZgXTj1t98jtyUZFY3byPsp
         y9u6dHy5kX5Ab1BuHUVmimKxbgHlY5fMZU+3hUQBttmH2F8ICO8i/q2d9ZkFJxFrpJAA
         0+Xw==
X-Forwarded-Encrypted: i=1; AFNElJ95ZpirnCGWDLh3HFRqKlygbJ5xPSyYG7+IR6/5jwObqeLF41UjpihZvAmVhnMWk00Im6ukhikHyEjvyMI5sAq2@lists.infradead.org
X-Gm-Message-State: AOJu0YxbcTLLfNHQC+YPzoCupST6rREP13LWNiVT9WL97S21jrcpNZaj
	89vBO3trXA1kjcfK01b0PfHwPXBZ7Gv+5KGeIR+nKHOcd07/xUpbfIFWgK++VOzWzHzNM2fRtYb
	WQWIIQdSfhUUKPROEpTDSFMXZBYlVsjc=
X-Gm-Gg: AfdE7cnvO21eJCZu4IDpo4OcwP+0Wi5tekJLjhvnd6PiWLsynrucjW60uBo0jgL/xSG
	zJhwI/ITRjASnDsqT6DGERrg9Ktyb+n8qQjRo/av2T1cWFuccFwNWlOcOMZgKVrzfTRrNlHxPZj
	ldzYNGygh1+hnrUxxYpkpLJAsgzU/PC13XvAp7gsfq2vgm06SBNEzh3PQLAmsEXG82Whc6sMMFk
	SmRly8Rq0lOH1gke/lIYrdd9Gqe0axQQbiXYvOWp0XD92JlCaoOciiGBGtN9rZ6J2IjhFQX7uhj
	5wtCZy5L
X-Received: by 2002:a05:6808:19a9:b0:496:976:acad with SMTP id
 5614622812f47-497e1be6f40mr910146b6e.1.1783023549180; Thu, 02 Jul 2026
 13:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260608124018.480365-2-diogompaissilva@gmail.com> <CAJpoHp6DnspnA0rirGb6E=A9wCS3eaDn=eFaqmae98Q+39b1PA@mail.gmail.com>
In-Reply-To: <CAJpoHp6DnspnA0rirGb6E=A9wCS3eaDn=eFaqmae98Q+39b1PA@mail.gmail.com>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Thu, 2 Jul 2026 22:18:58 +0200
X-Gm-Features: AVVi8CcqPIisQrq5CFS72_ZRI36P5g5rqpVd9s6Wr_RpOGpHUQHdD0aZPxz7mCM
Message-ID: <CAJpoHp489qKfkfLOX-XPLpOWo86gibZB=NM_dXPbv0yDGmxysg@mail.gmail.com>
Subject: [PATCH v4] drm/rockchip: Remove dependency on DRM simple helpers
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "javierm@redhat.com" <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_131911_483051_31442ED9 
X-CRM114-Status: GOOD (  17.16  )
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
This patch removes the drm_simple_encoder_init() helper usage in the
rockchip drivers by open coding it and using the encoder atomic helpers
directly. This is a step to eventually get rid of this simple KMS helper,
once all drivers that use it have been converted.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
v4:
 - improved commit message based on Javier Canillas feedback

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

