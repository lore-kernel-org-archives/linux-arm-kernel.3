Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77935106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3VlUYaUmk3wbdqIFNK9sLGnBuP1ZpHqxD7VT5es4j3c=; b=D4b1hRTpQAha+dDInr4cOEhYb3
	RXYZ7nFr2edmHEst/ehibEZEWCJvjCiJnJEyWLgMV8OIJBMFFUGp6Abjv8oTbtzcMJU6O+84DfWrc
	vKWbI/wn2EsEsb/kBk6JI83z6dv9zG6gJuvYKK6+H010BAumVcjEaXyZkhHu3UJDucSYjsY7iPLO/
	w6W3A4lnAbfvpnlf+LegBt/u/bX7uolWKgJu2lINfYoDuJRIA0xa20BLK+yhD1eidS/CJ3NT4QP1E
	16ye4FccS3HRaoWYV3FmSkHvu327u0/BL3606rMWxsuZzLPUh9n2+m+SeaihmKQHzRQ8uMOwObMuv
	9jnzoimA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hYd-00000005DoH-3WtS;
	Thu, 26 Mar 2026 10:03:19 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hYN-00000005Dgy-0NfX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:03:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b0c8362d93so286735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774519382; x=1775124182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VlUYaUmk3wbdqIFNK9sLGnBuP1ZpHqxD7VT5es4j3c=;
        b=TH1guegRmOm7V6tReqHcAzlLCF8wV2pNeCwxTmFxcT4LBMlzSj3AEZYPrVGTBPVt1W
         z5nF+Ny6AF+ppfaIdlBF3l3pIsc9dmp5GTIfsWZBXD8/h9esIWOyciDnGAvp/XukANp4
         c1Kxqu/0BQUuC6tDFKnUAZgy3nuzstoOj+E34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519382; x=1775124182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VlUYaUmk3wbdqIFNK9sLGnBuP1ZpHqxD7VT5es4j3c=;
        b=XF4ZSZYzm9GFoJwg2iTTZbT5uQ20duk+ScFS67ChkScoBsEC6wX7zyADm9VLdt3Blg
         ny2J8FX7Q8ftJtvkp2qmSYW15an/FdaEcrboqFzayp/RoIPhhW3BONMrvQwYWU2GTb8F
         gqD493i3Kt2KO/+kMo4lX2m3eQgiU+yRvGyMCLmnw6nkRiBaTKFwqriZANmfYObq6TaM
         qAu0VZWK5l/HzKZj4NmzoN8Hx8rUjHQQDZyRucESjo6FVJRnTT5HGVwEj3gCmC8rH9bF
         06mzwjyXAwNU9mxIbZdNmtFkhUscgEz2oLh4hREfip2yD6R3agJG16Hvow9waMkF/Uep
         SbKA==
X-Forwarded-Encrypted: i=1; AJvYcCWirJAA7Rwd/q1ZA74D1A2WGoOgsp0iYT03FxL4qVJmjCWKWDvfgUhflVAOICbrGwFtzBbXrlY2PWSKiI+abOe1@lists.infradead.org
X-Gm-Message-State: AOJu0YzGYsrG/Ir3JUQF/ek2grCM9VNSXeHiL7Bkwlq/y/tCmW+N0WVJ
	7CCtKEue/dxZ45vLgYyE3xOWp0pbhDNojQEknmVxB26OmikVD76WgOSXVt7pDsTeZg==
X-Gm-Gg: ATEYQzyiFVycp8BYmYpLbTXd8otQRrhZPnn/BYvzBV973SHsVj1vglwrQVDiiFmMZfM
	K2PvlUuStEe7JsUaJe4RRzV+mlFsmyjUVYaMd0w8LIHhXztES1uWJwQZ4Zzf1iYcGq1OXlcXfWz
	X/HcKfi5l6QfkYh4gickKwn99PqqNJlvolLB4MQBFUMudqFEp3FBQOPydIn6WH3Ye/On1B/u7LM
	wzgj99Ht1qqGUxIInAJNwTNyD8U2T1R1CbnzhDFT6zr5ARQRkPolkhq4IyV3xXkBqI+Qy2df6/V
	HjAZ5TISTyFSjy88wLOIZliK1SEB/1qpBkdJjSt4uvMbxBPalKuWnnPd9qJ496W+KEwFfUlDhCm
	+yRKYedeFpXyIiu+Y7SOIPQ8oiIvWcIKyOQcBa9nm6E+CgBb6NkIFoJr0nZdw7iMmbuWST1s9N5
	EjYn1LLlkFSIizThBPIPQR6b/7dRn4KKfBFtJl+tX8m8q5FAdnozd83MHQQeGjBGknzg5p5h/37
	7MNen6Mw6rQjVUdnG4=
X-Received: by 2002:a17:903:37c3:b0:2b0:5aab:c40a with SMTP id d9443c01a7336-2b0b0af4c01mr75467635ad.31.1774519381942;
        Thu, 26 Mar 2026 03:03:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7c2942sm23339435ad.36.2026.03.26.03.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:03:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] drm: Support DMA per allocation kernel mappings
Date: Thu, 26 Mar 2026 18:01:42 +0800
Message-ID: <20260326100248.1171828-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030303_458306_57256831 
X-CRM114-Status: GOOD (  25.96  )
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

This is v3 of the "DMA per allocation kernel mappings" series.

Changes since v2:
- Dropped rcar-du patch in favor of just using dma_get_sgtable_attrs()
  in patch 2
- Patch 1
  - Switched to drm_warn_once()
  - Moved flag definition from include/uapi/ to include/drm/drm_dumb_buffers.h
  - Reworded commit message
- Patch 2
  - Added change for rcar-du: s/dma_get_sgtable()/dma_get_sgtable_attrs()/
- Patch 3
  - Added back DRM_MODE_DUMB_KERNEL_MAP flag to all drivers calling
    drm_gem_dma_dumb_create_internal()
  - Expanded commit message to cover display drivers needing the kernel
    mapping to do scan out


This is an attempt to revive Rob Herring's "DMA per allocation kernel
mappings" [1] series from 2019. This series stacks on top of my recent
"drm/gem-dma: Support dedicated DMA device for allocation" series [2].
Many of the allocation paths are touched by both.

The 3 driver conversions from the original series are not included, as
the changes have landed in some other form.

Patch 1 adds the kernel internal DRM_MODE_DUMB_KERNEL_MAP flag.

Patch 2 adds the dma_attr field to drm_gem_dma_object, and converts
the GEM DMA helpers to use the dma_*_attrs() variant of the DMA API.

Patch 3 adds support for DRM_MODE_DUMB_KERNEL_MAP to the GEM DMA
helpers by setting the DMA_ATTR_NO_KERNEL_MAPING attribute for requests
without the DRM_MODE_DUMB_KERNEL_MAP flag.


All existing callers of drm_gem_dma_dumb_create_internal() will have
DRM_MODE_DUMB_KERNEL_MAP set to maintain existing behavior.

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

Rob Herring (3):
  drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
  drm/gem-dma: Use the dma_*_attr API variant
  drm/gem-dma: Support DRM_MODE_DUMB_KERNEL_MAP flag

 drivers/gpu/drm/adp/adp_drv.c                 |  1 +
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  1 +
 drivers/gpu/drm/arm/malidp_drv.c              |  1 +
 drivers/gpu/drm/drm_client.c                  |  2 +
 drivers/gpu/drm/drm_dumb_buffers.c            |  4 +
 drivers/gpu/drm/drm_fb_dma_helper.c           |  4 +
 drivers/gpu/drm/drm_gem_dma_helper.c          | 93 ++++++++++++-------
 drivers/gpu/drm/logicvc/logicvc_drm.c         |  1 +
 drivers/gpu/drm/meson/meson_drv.c             |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c |  5 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  1 +
 drivers/gpu/drm/stm/drv.c                     |  3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  1 +
 drivers/gpu/drm/vc4/vc4_bo.c                  |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +
 drivers/gpu/drm/verisilicon/vs_drm.c          |  2 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  2 +
 include/drm/drm_dumb_buffers.h                |  3 +
 include/drm/drm_gem_dma_helper.h              |  3 +
 20 files changed, 94 insertions(+), 40 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog


