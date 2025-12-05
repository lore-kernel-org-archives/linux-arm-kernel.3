Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BECD2F7E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klcElJtkzI0lLp3wntIo4gO11oCbbXWvHu4Lghm8pn8=; b=JQ12oHeG7WLbqOCkHJ5LdKcqhv
	hekEqNWsxmW4SNctzijxeNtcIgto6b2CAQ/nXU/bgylTIhil0Ly59XOkv/4WSzm/QVS/oQI95Ut79
	npVcbgxFaljPoVS7cSIYKPxYf6k/6cyuzbew0EZMNJbcznVnKsvk06YnTFoXIr5m2U821gMqyNN/d
	hsEJ1SDebwzkIxKfKJVTo0uTIi1W757sDPDGaeD+qY0GEwLc//kjNBxkHXUkof/fo5/U98tfVpZa1
	ew/3XIn4gTEMK9kEuED7TNGCoxqamwKsx6fVs6CK6BNwk9iN09BZCwVcG9AUNorO+l7h4hgxsZboL
	cHVPg61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRV52-00000009UG7-17IU;
	Fri, 05 Dec 2025 12:38:36 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRV50-00000009UEw-0Gc0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 12:38:36 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59431f57bf6so2415816e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 04:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764938312; x=1765543112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klcElJtkzI0lLp3wntIo4gO11oCbbXWvHu4Lghm8pn8=;
        b=SXy2gwbdE18CZDmw2X8895zACT1wLqdxQk+ieC9rDF8m4dJ8aB0T9wT/tfdmcIPyIb
         i0MOTVN4D3liKbw/qg/Va9ooz67U8Vn5SnC2ZMhMhy6+K/M25bOAP3x8tS9pvqMLuRki
         fm3Z8t1OlQdM21FRxDXguCQvNziLj1qy+ovEPijEmZse8BIbpq7nb5AYDldDxpmY496V
         KGCFSEwbjGd2KFDKBBIsbKyqv0imgO2YsBZzyYfjuG1HOCBkGhe9U4HHW8/nW0q0Yrkl
         VKKewCO+OEKB6yDNAkHkaNU/usf5pz3auDXoLoxMn4rwT48rg4Fb9kY68sTIcvdDpVTu
         upyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764938312; x=1765543112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=klcElJtkzI0lLp3wntIo4gO11oCbbXWvHu4Lghm8pn8=;
        b=h+o55O8GPfrgYwkZnf9UKDWF5nbr62kCot+Ncm9SV3FEYo8Qf+3PUYttkvzZ1UrFtH
         T/fnlF6RMvht+bdIdXbXLU0t8C6UU10pjf7NRobAPksa/g3UuZOHmvzSOhDASSN2j8i2
         DQcTL2ZDtIKxZ5+bVWENy/u9FYQc8J8Fv4sKI2ZfL3rq+z7WtRTZYjXKtyBe3dbKA1Jt
         siveMGquo7XHCefgvlzq25t8yWj7UYEqhyiRSX5RsM/XfVDK8eiWzzLatqBALYWAIUTz
         NGkFNAas33s3c16uNYlO4T6DU7XqdwwfXshJxl6s8cEstIUs0N1a1y6LG05CFJUgOmql
         MSrw==
X-Forwarded-Encrypted: i=1; AJvYcCXPY247qIuQiHj3NPbJg50xDUW3sR3zpcIvl8GozCjCmKeURmQcxqUHlACw5KFQN6aWpOePEsg4kwhYhqV3OLyG@lists.infradead.org
X-Gm-Message-State: AOJu0YxSYja4lHsHhX8cC631Nn0lxcUE3a+ivU+lOW9DXpnP2PuFfYrW
	AZI0azbNwm3fA2ynm8AdsdbWAyQ9jPANgF+m/KU7HxDshfGa/Zf5zGfRpaXLALOLDkU=
X-Gm-Gg: ASbGncvs3kZZLu1TCfb2epgid96WaMkik+rGw69nnBYQNWCBu810nT2T0772mgsB7OY
	m6QAntoPEEV7Dpj1E9ATs8w9GzePEf4zzcs0na1kowF1O9yShd3KWF9gRBNC05301GrWgjh3BVx
	uuGx3zYRD/DCJ11lGL7AEMmQobgxe8qUFUFbnqM0RBjSGSZ6v+luxCBEkN4H0/T4TcI4jwrjj23
	tRb6WU18ieDLN7DP64/7ExPpTkOpOup1fP/NhgCADxNysL4RWSa6aDixtZ/Whiuec1ZB3GiNnxA
	33zPuId14CsMzKr0jLCnS9LuacA7dkST9W1EzpUwXoKXMFB+bDAB4HjJozjGWMGRnpI1zzkjlI1
	4gN6rx4oVaXcO7S8mN+YV4QhmpDrlatLY+Oy27b6T0NswcPgS248UoYjRArISdU3X5SHMn8OK86
	6T/tqklHOx2NcHtYeeXfLgzs4/orW0HdQm05CL4PDQqBM5
X-Google-Smtp-Source: AGHT+IFTlZw+oR2sw8F587+gt4VtLs/GMa9dNBWEO0QK962QEdEh8y33WxXMT99Jaj5hQoXnehj+Zw==
X-Received: by 2002:a05:6512:124b:b0:595:8200:9f7e with SMTP id 2adb3069b0e04-597d669ff19mr2333117e87.20.1764938311848;
        Fri, 05 Dec 2025 04:38:31 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a3d9sm1462351e87.4.2025.12.05.04.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 04:38:31 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Bill Mills <bill.mills@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
Date: Fri,  5 Dec 2025 14:37:51 +0200
Message-ID: <20251205123751.2257694-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_043834_132676_C1D20A2E 
X-CRM114-Status: GOOD (  12.60  )
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

Xorg fails to start with defaults on AMD KV260, /var/log/Xorg.0.log:

[    23.491] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    23.491] (II) Module fbdev: vendor="X.Org Foundation"
[    23.491]    compiled for 1.21.1.18, module version = 0.5.1
[    23.491]    Module class: X.Org Video Driver
[    23.491]    ABI class: X.Org Video Driver, version 25.2
[    23.491] (II) modesetting: Driver for Modesetting Kernel Drivers:
kms
[    23.491] (II) FBDEV: driver for framebuffer: fbdev
[    23.510] (II) modeset(0): using drv /dev/dri/card1
[    23.511] (WW) Falling back to old probe method for fbdev
[    23.511] (II) Loading sub module "fbdevhw"
[    23.511] (II) LoadModule: "fbdevhw"
[    23.511] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    23.511] (II) Module fbdevhw: vendor="X.Org Foundation"
[    23.511]    compiled for 1.21.1.18, module version = 0.0.2
[    23.511]    ABI class: X.Org Video Driver, version 25.2
[    23.512] (II) modeset(0): Creating default Display subsection in
Screen section
        "Default Screen Section" for depth/fbbpp 24/32
[    23.512] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
[    23.512] (==) modeset(0): RGB weight 888
[    23.512] (==) modeset(0): Default visual is TrueColor
...
[    23.911] (II) Loading sub module "fb"
[    23.911] (II) LoadModule: "fb"
[    23.911] (II) Module "fb" already built-in
[    23.911] (II) UnloadModule: "fbdev"
[    23.911] (II) Unloading fbdev
[    23.912] (II) UnloadSubModule: "fbdevhw"
[    23.912] (II) Unloading fbdevhw
[    24.238] (==) modeset(0): Backing store enabled
[    24.238] (==) modeset(0): Silken mouse enabled
[    24.249] (II) modeset(0): Initializing kms color map for depth 24, 8
bpc.
[    24.250] (==) modeset(0): DPMS enabled
[    24.250] (II) modeset(0): [DRI2] Setup complete
[    24.250] (II) modeset(0): [DRI2]   DRI driver: kms_swrast
[    24.250] (II) modeset(0): [DRI2]   VDPAU driver: kms_swrast
...
[    24.770] (II) modeset(0): Disabling kernel dirty updates, not
required.
[    24.770] (EE) modeset(0): failed to set mode: Invalid argument

xorg tries to use 24 and 32 bpp which pass on the fb API but which
don't actually work on AMD KV260 when Xorg starts. As a workaround
Xorg config can set color depth to 16 using /etc/X11/xorg.conf snippet:

Section "Screen"
        Identifier     "Default Screen"
        Monitor        "Configured Monitor"
        Device         "Configured Video Device"
        DefaultDepth   16
EndSection

But this is cumbersome on images meant for multiple different arm64
devices and boards. So instead set 16 bpp as preferred depth
in zynqmp_kms fb driver which is used by Xorg in the logic to find
out a working depth.

Now Xorg startup and bpp query using fb API works and HDMI display
shows graphics. /var/log/Xorg.0.log shows:

[    23.219] (II) LoadModule: "fbdev"
[    23.219] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    23.219] (II) Module fbdev: vendor="X.Org Foundation"
[    23.219]    compiled for 1.21.1.18, module version = 0.5.1
[    23.219]    Module class: X.Org Video Driver
[    23.219]    ABI class: X.Org Video Driver, version 25.2
[    23.219] (II) modesetting: Driver for Modesetting Kernel Drivers:
kms
[    23.219] (II) FBDEV: driver for framebuffer: fbdev
[    23.238] (II) modeset(0): using drv /dev/dri/card1
[    23.238] (WW) Falling back to old probe method for fbdev
[    23.238] (II) Loading sub module "fbdevhw"
[    23.238] (II) LoadModule: "fbdevhw"
[    23.239] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    23.239] (II) Module fbdevhw: vendor="X.Org Foundation"
[    23.239]    compiled for 1.21.1.18, module version = 0.0.2
[    23.239]    ABI class: X.Org Video Driver, version 25.2
[    23.240] (II) modeset(0): Creating default Display subsection in Screen section
        "Default Screen Section" for depth/fbbpp 16/16
[    23.240] (==) modeset(0): Depth 16, (==) framebuffer bpp 16
[    23.240] (==) modeset(0): RGB weight 565
[    23.240] (==) modeset(0): Default visual is TrueColor
...
[    24.015] (==) modeset(0): Backing store enabled
[    24.015] (==) modeset(0): Silken mouse enabled
[    24.027] (II) modeset(0): Initializing kms color map for depth 16, 6 bpc.
[    24.028] (==) modeset(0): DPMS enabled
[    24.028] (II) modeset(0): [DRI2] Setup complete
[    24.028] (II) modeset(0): [DRI2]   DRI driver: kms_swrast
[    24.028] (II) modeset(0): [DRI2]   VDPAU driver: kms_swrast

Cc: Bill Mills <bill.mills@linaro.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index ccc35cacd10cb..a42192c827af0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -506,6 +506,7 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 	drm->mode_config.min_height = 0;
 	drm->mode_config.max_width = ZYNQMP_DISP_MAX_WIDTH;
 	drm->mode_config.max_height = ZYNQMP_DISP_MAX_HEIGHT;
+	drm->mode_config.preferred_depth = 16;
 
 	ret = drm_vblank_init(drm, 1);
 	if (ret)
-- 
2.34.1


