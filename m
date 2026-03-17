Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74180F33806
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 06:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KlUueF1GSw5ohqS7H/vwWeUHzvF9pIfX9HHJ4AwXcpg=; b=V6jTDCQUV56FYduvZgWe7Myr1J
	wNWO/Ek/VGsgBPs3mfEyL1bqHPzDe6KebJHorWM85jRdw3kABscJ9l9BzEAyxXkpGUhAUsQzVGImH
	rWlF9X0MCwJvs335QvwYfMX5pGqoWXz+5OfwPEEULn4qzEGnFpwuG0V8q0UoTTlRT5N8DulDwmchn
	68Z9T9950BgEQFqR/xD2soxc1B6leCR62DLm41a5QVebmVgUcg5RcGjN/cTNFPkqQlLpM3xdXGpLO
	pSyeVxOwq+H0RUT+LPIdXqvGqW5R5xKdzT8mxey4w7sxIYXmhjOOMr8zJPCCIgBHzEzKAh0x9Nqg4
	yv0c6SeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O7H-00000005Vp1-1cXV;
	Tue, 17 Mar 2026 06:41:23 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O7E-00000005VoQ-1euf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 06:41:21 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a871daa98fso40534275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 23:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773729679; x=1774334479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KlUueF1GSw5ohqS7H/vwWeUHzvF9pIfX9HHJ4AwXcpg=;
        b=higUOuCX84LTEEOBK1Z9mLHaYSqUCJnLhmm17TxMML2CAYkhNHEnkDsiTp+GCkXOIW
         syKvYqoJ7grOHC/YZRZw5Pn1plbR7+fzebm7+c2YlYXmbkXsB3S6qj4XlO/xcdZ27+Pu
         mcGiEWxvkJKqacHy6quIkF09iyBeP7eB9U2HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773729679; x=1774334479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlUueF1GSw5ohqS7H/vwWeUHzvF9pIfX9HHJ4AwXcpg=;
        b=sCZuKO8ovrYPb1D4wLog7CuZyWE7M10hteSFGMe1YORZ6rtmc3/g20Vsm+DqDGlzNx
         Fd51w1/z694SkLDrFL1HWQvPXaMFmaDbeSGNjGHy4wM3OmdwZ6NfdPT4C3EDYBgrldY9
         6U9BkJYfzzZz+vMCfDOegv/f7GfKl3faRq/zCcrBRcU7FFhRAcdTWxKH99C4Tm/Ewm0Z
         DukiYc7Hj6B6A1YckYMUfW5Jjno3vRKJk9HpbjUcYzGkSJQN08YskBN4mw1w6Kfj5HZy
         03Y4vvnq4xOMhF78cAbdSsYCkyOfbLae3+Z3yobBF6/Ku5QKMlpHvPVOFe2yHnmw1qBv
         +XFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPbwAKxZGvnr66C2hur3g7FJ3BT1KCodFoVosThOe1ct0lUnjiMmUIgIH1pj48uwcW7qLVDO7t1DcjbmLZSj9I@lists.infradead.org
X-Gm-Message-State: AOJu0YyFpIVqd8RC8zhKYRYOiYzmwg4WhIE55asDOPO4EO8dQ6zEyLZk
	aCLPAMjCrp33Bd8y17JDw1iw0J2KoAjDVqob6pu97vreCmy+vaOFA1v4TVdRQRONyQ==
X-Gm-Gg: ATEYQzxBk1GJaCSINnJxmD3TEIEmCejJBLu9sz4ThAavjmROR2h1oAKJsu87ZH7GJfQ
	jF78DCx+6pWhw7mIFibjbYT38cmuNPAOPzu86lNWNWiONulamSs0K11u/AdwwHC9f2j4CWuuyH3
	YG0XRxzcwGukQFCjZVZsY61jmr2Zqd0rIAQkVpy3ed1QeICUTd/xiprxSq/MV4Gtujm4AGW4zkE
	Yco6kQobcmgAz/4ZA3eCqT4VgYHBGIuyZcqSwjuYEZtfM3vweMl2ngHdcfUMpaRni0KjHnmFWTz
	EPkOfZ7XUQsnhb/GSdEpWnCvd/LAbKwvk5JGqolgqnWcTD28VLMc5xLFHHdnewSgLmdVW06QmcW
	PjNu0m+6pBJ2iHDMjHkDhxp2hQ1s2k1u0splxZoUJtkoqLrUXjtsgs0nNs+nU3kzvOW3OrrW0jb
	efY/zKNcsYbIJHsaek8oL/cPe+jZGNvAtAajlyZ3sU0c8R3d8+TK/t5VsJMwhyC6o5hJY4jf9X3
	hcBm4pB
X-Received: by 2002:a17:902:cccb:b0:2b0:5903:140a with SMTP id d9443c01a7336-2b0590316d9mr69517575ad.10.1773729679022;
        Mon, 16 Mar 2026 23:41:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a064:c65d:a199:5cb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece605231sm124269425ad.27.2026.03.16.23.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:41:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev
Subject: [PATCH v2 0/4] drm: Support DMA per allocation kernel mappings
Date: Tue, 17 Mar 2026 14:40:42 +0800
Message-ID: <20260317064049.696795-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_234120_536345_3DBECCF5 
X-CRM114-Status: GOOD (  23.64  )
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

Hi everyone,

This is an attempt to revive Rob Herring's "DMA per allocation kernel
mappings" [1] series from 2019. This series stacks on top of my recent
"drm/gem-dma: Support dedicated DMA device for allocation" series [2].
Many of the allocation paths are touched by both.

The 3 driver conversions from the original series are not included, as
the changes have landed in some other form.

Patch 1 makes the rcar-du driver use one of the GEM DMA helpers to get
a scatter gather table, instead of calling dma_get_sgtable() directly.
This reduces one location where the DMA APIs are directly used with
drm_gem_dma_object outside the helpers.

Patch 2 adds the kernel internal DRM_MODE_DUMB_KERNEL_MAP flag.

Patch 3 adds the dma_attr field to drm_gem_dma_object, and converts
the GEM DMA helpers to use the dma_*_attrs() variant of the DMA API.

Patch 4 adds support for DRM_MODE_DUMB_KERNEL_MAP to the GEM DMA
helpers by setting the DMA_ATTR_NO_KERNEL_MAPING attribute for requests
without the DRM_MODE_DUMB_KERNEL_MAP flag.


Existing callers of drm_gem_dma_dumb_create_internal(), with the
exception of adp, all use the DRM client API, and otherwise do not have
any direct use of the kernel mapping. Thus only the adp driver gains
setting DRM_MODE_DUMB_KERNEL_MAP before calling
drm_gem_dma_dumb_create_internal().


I have also started to convert the exynos driver to use the GEM DMA
helpers. I also plan on looking into the rockchip driver, but that one
has a separate IOMMU path that needs to be handled. I might copy the
approach used in the exynos driver to deal with it.


Changes compared to the original version from Rob (v1):
- Link to original v1:
  https://lore.kernel.org/dri-devel/20191021214550.1461-1-robh@kernel.org/
- Rebased onto renamed GEM DMA helpers
- New patch for rcar-du
- Patch 2
  - Make drm_mode_create_dumb_ioctl() emit warning if args->flags is not zero
- Patch 3
  - Made vc4_bo_purge() use dma_free_attrs(); this is the other location
    of DMA API used with drm_gem_dma_object outside the helpers
  - Expanded commit message
- Patch 4
  - Added kernal mapping check in drm_fb_dma_get_scanout_buffer() and
    drm_gem_dma_vmap().
  - Made drm_gem_dma_print_info() show "vaddr=(no mapping)" for objects
    allocated without kernel mapping
  - Dropped existing DRM_MODE_DUMB_KERNEL_MAP flag addition in various
    drivers
  - Added DRM_MODE_DUMB_KERNEL_MAP flag to adp_drm_gem_dumb_create()
  - Added flags field kerneldoc for drm_gem_dma_create_with_handle()

I dropped all the original Reviewed-by tags, as it's been 5 years since
the changes were first posted, and also because the code has changed a
lot.

Please have a look.


Thanks
ChenYu

Original cover letter from Rob:

This series adds support for CMA/DMA users to skip kernel mappings for
GEM allocations. The DMA API only guarantees a kernel mapping at
allocation time. Creating mappings with vmap() after allocation may or
may not work as not all allocations have a struct page. As virtual
memory space is limited on 32-bit systems some drivers will skip kernel
mappings when possible. This prevents those drivers from using CMA
helpers and the generic fbdev emulation which results in a lot of
duplicated code.

In order to distinguish between kernel and userspace allocations,
a new flag, DRM_MODE_DUMB_KERNEL_MAP, for drm_mode_create_dumb() is
introduced. This allows drivers to override the default behavior for
CMA helpers of always creating a kernel mapping.

Mediatek is converted to CMA helpers and Rockchip is converted to generic
fbdev support. I also have patches to convert Rockchip to CMA and shmem
helpers, but they need a bit more work. Exynos can also probably be
converted to use CMA helpers.

Compile tested only. I did test fbdev on Rockchip, but the h/w I have
has an IOMMU, so the CMA code path doesn't get tested.

- end quote -

[1] https://lore.kernel.org/dri-devel/20191021214550.1461-1-robh@kernel.org/
[2] https://lore.kernel.org/all/20260311094929.3393338-1-wenst@chromium.org/

Chen-Yu Tsai (1):
  drm/rcar-du: Use drm_gem_dma_get_sg_table() helper to get scatter
    gather table

Rob Herring (3):
  drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
  drm/gem-dma: Use the dma_*_attr API variant
  drm/gem-dma: Support DRM_MODE_DUMB_KERNEL_MAP flag

 drivers/gpu/drm/adp/adp_drv.c                 |  1 +
 drivers/gpu/drm/drm_client.c                  |  1 +
 drivers/gpu/drm/drm_dumb_buffers.c            |  4 +
 drivers/gpu/drm/drm_fb_dma_helper.c           |  4 +
 drivers/gpu/drm/drm_gem_dma_helper.c          | 93 ++++++++++++-------
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 12 ++-
 drivers/gpu/drm/vc4/vc4_bo.c                  |  2 +-
 include/drm/drm_gem_dma_helper.h              |  3 +
 include/uapi/drm/drm_mode.h                   |  2 +
 9 files changed, 82 insertions(+), 40 deletions(-)

-- 
2.53.0.851.ga537e3e6e9-goog


