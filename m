Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2ABFCC9B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OoV76OKOjG7uxIKEUxi5pEmwh+JGNhbt1HMoxK+jnjw=; b=nCLp2/FnDUJ3Y2FwC/ryD1mRVz
	b7oUfSPuHnotVb8atN/msKhsBt64ts2Dfmc1BG1ojPeyyREfTIHFmN8r8I4O2qzkPER+knB4C1m/t
	1aTvyyiWg5UTPRF5ueH3L+YxDokx/TxgvLP0eOVU+LMc1e8Vrb5d2hK4Rq5XMizA3MUeyo04hpoYD
	thu1LV2CETzgKRcCFiR1QJUuU9W5el99jXjC/w14Gk+C4GZmFFK9DZzx3Zh4ytKI6gab5kCczK1+k
	dmimGEwLJvUQbXNtKXp+kgP8jEqw7U53ygpad49gRf5jKQioo3YpCzi1J6Ns+++W2pi8k9q9SWvmb
	92ZKfk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznj6-00000008eAT-1muP;
	Tue, 10 Mar 2026 03:25:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznj3-00000008e9h-3ofs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:25:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ae5423b02aso57663175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 20:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773113141; x=1773717941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OoV76OKOjG7uxIKEUxi5pEmwh+JGNhbt1HMoxK+jnjw=;
        b=lFR+M6XWZe1CN5RSP2b5Lcf80Zwm7zJAUokRwQWqn9YkIUN3A9i567Gv2XXfiy1nvz
         xRkM4qgnTtd/K/hnG18X9e1zjdFfSFsQU3XPEQkxhvn+5ewu/7wdWI3kdv7IRn93RE0x
         VyuQn9cCB1sli6QItvDPB9S4c9/XdzlBLLhY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113141; x=1773717941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoV76OKOjG7uxIKEUxi5pEmwh+JGNhbt1HMoxK+jnjw=;
        b=kX4IC6uhbx1zrYmhJrUqdGZM6IWY8t844EZvFUeczikbj/idz6ZKT1Ga9veeb8zYin
         wrMnRwijTeecbF6rhup4cs76rcNpArPe0BbeVBrcGdA2yYOl+CMfPiJGcV6eGpK2YUUM
         f3G2PDBb0y22rknY/vPIMKSEU92qNgP0FeCcdMiIJIkttdUE3NWockyWYim7ccgz2/SW
         oHLt6Fyz63TWWajqSE++ynNU5/REAeuKl5IROFmMUL1mtFI4Ohn3gHzUhORDQi95w+Ys
         AOc4Brly+16WIbfZezmtqR4euHMosgsP+2tKmue2SodKXaLmvb8igZvI2UxD7wFAb2SC
         F/DA==
X-Forwarded-Encrypted: i=1; AJvYcCVMEGzflKClaIWuF4UpG47IOpe5qC5uNsIfXw9eUZk3jNoh30WsIq8qNpTXMBJ5KNKxt+1fiAzdv+oxaPHc4rW5@lists.infradead.org
X-Gm-Message-State: AOJu0YwDpLk8ySM2kbl0Ar26i3a3J7sKTApXGl9v06xWbCAmWbZijNo4
	hh4+3cnbSAg/sVy0WavR0IqJXUxHCS6bomk7mZGulYjZKPfFRz8mrg92j+kzzbf1jw==
X-Gm-Gg: ATEYQzzA2cqZ+trMWeQtPM0GD+4378WIXDLEfgsc6mi8lbRW2m/fwxJS5syBM0pXHoK
	kIgH8RzAFYFLNC6PS/oFkVfrxoDxSxSCXifp1VckpYl3V0kqNEG15Z494vQVfXVl0JEseo/XlKc
	tb19cJX2E+SqmQ/ZNjM/hFBdUFJtmstIBNFnXaxJ+3FsUblxUHirzmH1pcwsRDxV7C41BFkpZuI
	SW3d+BSzRFOLUB1Dt6PFhBcqfdJUQAU1GEaKyHelDPSLUEJoe891ZkVSE/qlRhxCvvfqDuLxHHQ
	jNcScpwjTrdsTye45Qs+lM0JPLc2VuMU6OnJwybeETASzQ3L+NB8CAztT/3YDG0hyc1/BUlyunp
	44xm54cFRDA947/Y6nqfDDc5WeYz94oPFN7Y2oWf3fBjG5shwjmQNHBslz1YR/YaFfXZ2GbQgei
	pLJ86wzxCDTJ11+rk3zRD1p82h1sWNXOru74d3wYV2TRzR6rUw2YbhcGanhbVF2E3OwBZOFJ5rM
	JfU8lrl
X-Received: by 2002:a17:903:2452:b0:2ae:5752:af82 with SMTP id d9443c01a7336-2ae82498328mr120569975ad.49.1773113140915;
        Mon, 09 Mar 2026 20:25:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm126695095ad.5.2026.03.09.20.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:25:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/4] drm/gem-dma: Support dedicated DMA device for allocation
Date: Tue, 10 Mar 2026 11:25:05 +0800
Message-ID: <20260310032511.2545500-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202542_002665_9F14B6E2 
X-CRM114-Status: GOOD (  18.38  )
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

(resent with Samuel's email address fixed)

Hi folks,

This series expands the "dedicated DMA device" support in DRM to the GEM
DMA helpers, and converts the MediaTek DRM driver to setting the DMA
device and dropping the custom GEM helpers that implemented this
function.

Various display drivers implement the "dedicated DMA device" support
with custom GEM helpers. These include Exynos, MediaTek, and Rockchip
to name a few. Allwinner does something entirely different, calling
of_dma_configure() on the virtual display device using the OF node of
the actual DMA device. Recently this causes a warning if IOMMUs are
involved.

This series intends to allow the core helpers to deal with it, and not
have every driver implement it in slightly different ways, duplicating
code.

Patch 1 adds dedicated DMA device support to drm_prime_pages_to_sg().
I believe this was missing from the original change that added dedicated
DMA devices for PRIME.

Patch 2 adds support for dedicated DMA device to the GEM DMA helpers
for GEM buffer allocation and mmap.

Patch 3 converts the MediaTek DRM driver to use the dedicated DMA device
support, and drop all the remaining custom GEM callbacks that deal with
it.

Patch 4 converts the Allwinner sun4i DRM driver to use the dedicated DMA
device support, instead of the of_dma_configure() hack it currently has.

The series should be merged through drm-misc-next so that other drivers
can take advantage of the change.

I also intend to try to convert the Exynos and Rockchip drivers, however
both also have options to set DMA_ATTR_NO_KERNEL_MAPPING when using
dma_alloc_attrs() to allocate memory for the buffers. I intend to
resurrect the DRM_MODE_DUMB_KERNEL_MAP work from Rob Herring [1]
to handle this. The Rockchip driver also has custom IOMMU attachment
that I'm still trying to understand.


Thanks
ChenYu


Chen-Yu Tsai (4):
  drm/prime: Limit scatter list size with dedicated DMA device
  drm/gem-dma: Support dedicated DMA device for allocation and mapping
  drm/mediatek: Set dedicated DMA device and drop custom GEM callbacks
  drm/sun4i: Use backend/mixer as dedicated DMA device

 drivers/gpu/drm/drm_gem_dma_helper.c   |  21 ++-
 drivers/gpu/drm/drm_prime.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_crtc.c    |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  21 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |   1 -
 drivers/gpu/drm/mediatek/mtk_gem.c     | 231 -------------------------
 drivers/gpu/drm/mediatek/mtk_gem.h     |  17 --
 drivers/gpu/drm/sun4i/sun4i_backend.c  |  27 +--
 drivers/gpu/drm/sun4i/sun8i_mixer.c    |  27 +--
 9 files changed, 46 insertions(+), 302 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.h

-- 
2.53.0.473.g4a7958ca14-goog


