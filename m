Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C94CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 00:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WQqOqFaR8S6Kxc8KfBqHhYsGrjh61dZF/m/XQ0uNMYQ=; b=mwlQDvit4mTVvLQ3DmYGTmV8vP
	0ARDsDXGJoo8+mlYMBMVmaWbENwncDnVjhBwt8xgypr3Q45QIvYgDjTCYHbDV+tQ+RqmMNjx2gCcQ
	2Oj894fVffRUrKm4OunuQAupAKexvgJ38k05St67hYhWvEKC9jSIemcwUJxERK8g1R1PZP7SW/6IZ
	wjshntnmAVtTjNO9MntPOTk8xjbrji0CTjqpHywO3nTLAqB299qGALEDSLwj0bh+j4R1DJ7qdS270
	FptPagnZL8jtCv5BS+mH3Cdf1vRcbRrA/Gb7pD/tACPE0yMKF7iHV+qveuJva3haE9Glp5CX6O2nT
	SSvAwcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyMe-00000005BfK-10Yg;
	Fri, 09 Oct 2026 00:21:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyMa-00000005Bdg-3Ruv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 00:21:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a17baef589so26841255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791505286; x=1792110086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQqOqFaR8S6Kxc8KfBqHhYsGrjh61dZF/m/XQ0uNMYQ=;
        b=XRFEWfUlxouw/8CavQIffup/L4kIO4qkfBp22LPm6a5wM1OGgG9tgtEaAjz5fUUPVB
         j9VRdyeV+MFWx5298T1JbcElPfMucplDqvi57B7aSMxKFMv4uLEoh9ERJ6SLI+8dMP6b
         wliSSh7BsuahcbEPQJVs63fInW1u7PlyjdYVSj4rmSY1shB7qKxozJJ0+xomPdnTWGgK
         /7dh9T2PKArZ/557HuiS7Omnr4FWgkYilB/Eeg9aL/5syTBxGS5i7RAv4/kz32wxZlGg
         ZiXEYyFh89hmbdCsa/7mDy2MTo2W2bJU6z2gOIGdop/SMm29GqjtrJjjUidtQCYIS6xP
         gN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791505286; x=1792110086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQqOqFaR8S6Kxc8KfBqHhYsGrjh61dZF/m/XQ0uNMYQ=;
        b=ScCq6OGmtfrZJSVWUa9BOTYAqkFFsHlmHdpzAkDcCdkF/wWznLVXEw6jyF9eltGeYE
         m3bkRegcPFxPIdevSLewy989OD+8PkRwJ/1frZJQcTkuEX/6xDYKKU0JlCUbDogtyiea
         f5NMKx7JfWSSjtthqcoO16Ch2AF0MiiWT/RBkMY6iKGwS9FyvSAyhSLKJv4lCACh68a0
         jhGDJetUllJZD5OZcuwFM6PxnwxdZRnHUYSICKtbtlqW/pZt5xdP61C6ThTNJ8vBZcRw
         nYdUqvuCu+qNQoKpNWWFBGUpLMmCKnHZt4oMeMpY1DJmDWK2lda63zotaYFwGZdU/JeD
         PvGw==
X-Forwarded-Encrypted: i=1; AKwUvBxSwxJHByWel+X1q1sBh2A2WLhGpQglvvmvAJJDu/YRk3o9iHlJIfL7g04++PESDDVSoiwdlcubVj2xwvDOflMR@lists.infradead.org
X-Gm-Message-State: AFuF++ldJLtCewhDcs2DPvrWRA61RP8L8jOqcVnNa5Blx0Qe4Ni0jZy4
	LhtmbmzuimlaCQLtl/s0SwYnyTZP2ccYukdxdaLgR9NGWDylcfmXqXb0
X-Gm-Gg: AYBFou1Jqo9F7W057vROvaB59Vg0t6uB6Gx2cbfKp2dm3uQNPXgNYuaKbZDKJX71YGP
	Zf/P7jFEECV1fEzq9dqDRZ8jDZMkadndNWhsUyCvNwPYRzgKnpe/olHU6p5c7JzQycPGA33sa3d
	84LbNPXIy77b1kuO4TLyYt/xVkCkGfBkEZpImR8npP1n3RAC88ONwMmwRomh0+2xjiWThGT4uZW
	1TI1Kj6iCsDcOdYzhEe8avqhW5lcPHzUSF4kQ224AfxTD8kOVgAUh0xts9T906WkPi1/iyTben3
	9idXmsGCRNbiugilKHBH8dGjsXxIjQaam4kde6UjzEJRwbg7j6vzjDsIdqszTakTNFeo3qSliOj
	T4Jy9ZZgOFU3Ljep5u5FAMnIMSQtUoth9GOSBh1AnIg20qsOl4BJYqUDIXBsXbEBB0h4x3/FP6N
	hwjxFbsCmfJeQDNIOFLRAnsTWNbyiCjcfQ8k71/WCeA4sOv1TrgyRFP0vR4F4zDmXM2+KwWqDB6
	XRARiW4YtzBgfay1TRRpT6kdO3WeeEZWh0qiXEnxcvph5r80geUYNh4dliyeelt2ISZaQ9lYHO4
	ThK5DBlrurbcbx0Wh5a+v7Wcn4dzk/7oUnsafst9vCofemc/UnFq/dzxSpbHuZI+/Pjjuwv8YGy
	9le8Mobs=
X-Received: by 2002:a05:600c:524a:b0:4a1:8824:c9ba with SMTP id 5b1f17b1804b1-4a18e49234fmr2630825e9.18.1791505286061;
        Thu, 08 Oct 2026 17:21:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4987casm3364605e9.1.2026.10.08.17.21.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 17:21:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] iommu, drm/rockchip: Map private-domain imports from DMA addresses
Date: Fri,  9 Oct 2026 02:21:12 +0200
Message-Id: <20261009002114.67851-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_172128_897325_F2F846E8 
X-CRM114-Status: GOOD (  11.15  )
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

Diederik reported failed video-buffer imports on RK3588 with
DMABUF_DEBUG. The proposed warn-only mode [1] confirmed CPU-side
attachment access in rockchip_gem_iommu_map() during Sway video resizing.

This RFC keeps Rockchip's private scanout domain. Patch 1 copies live
iommu-dma mappings into another domain. Patch 2 uses it for PRIME
imports. Unsupported inputs keep the old page-based path, which remains
unfixed under strict DMABUF_DEBUG.

Rob's MSM approach assumes direct DMA [2]. Rockchip's attachment instead
provides IOVAs from the VOP's default domain, which cannot be mapped
unchanged into the private domain. Each import retains both mappings
and adds one reverse lookup per 4 KiB.

Christian rejected reverse translation in the earlier MSM proposal [3].
Robin NAKed exporting iommu_get_dma_domain() [4]. Keeping the helper in
dma-iommu.c does not resolve the physical-address objection.

Sharing the first VOP's default DMA domain, as Exynos does, would avoid
the translation but also change native-buffer mapping.

Is retaining the private domain and reverse-translating the DMA mappings
an acceptable direction? If so, I'll address the remaining limitations
before posting a non-RFC version.

Base: mainline 602042bf29f6. The warn-only RFC is not a prerequisite.
No stable backport requested. Strict-by-default DMABUF_DEBUG took effect
in v7.3-rc4.

Testing (builds and QEMU only):

- W=1 object and stub builds passed on arm64, ARM32 with/without LPAE,
  x86-64 GCC/Clang, i386, s390, RISC-V and UML, including dynamic SWIOTLB.
- Rockchip strict/warn A/B reproduced the control failure and warning.
  Treatments checked every page and byte in 83 imports each. Primary
  buffers had 1/127/507 DMA segments under the default 64 KiB limit.
- SMMUv3 strict/lazy tests, missing-source, bounds and rollback tests
  passed. Real bounced attachments exercised alignment and pool
  rejection with no target mapping or DMA.
- Invalid forced-SWIOTLB Rockchip provider runs are excluded. Expected
  segment-limit and unsupported-fallback diagnostics remain.

The rig uses a custom Rockchip IOMMU model and the real GEM callback in a
test module, not VOP2, Sway or a real exporter. RK3588 hardware, two-VOP
and 32-bit ARM runtime testing are outstanding.

Hardware testing is welcome, particularly with Diederik's Sway resize
workload. Compare control and both patches on the same base/config,
first with strict DMABUF_DEBUG, then with the warn-only RFC on both.
Please report full dmesg, config, exporter and visible display problems.
Keep a known-good boot kernel. DMABUF_DEBUG=n testing is welcome too.

Developed and tested with LLM assistance.

[1] https://lore.kernel.org/r/20261005064133.7305-1-kmehltretter@gmail.com/
[2] https://lore.kernel.org/r/20261006131000.81501-1-robin.clark@oss.qualcomm.com/
[3] https://lore.kernel.org/r/bd4e5ece-1358-4e0b-bb04-ba9de62d26f6@amd.com/
[4] https://lore.kernel.org/r/47bf9a4c-2a47-4e93-bcdf-8d953c9a5ab8@arm.com/

Reports:
https://lore.kernel.org/r/DLR74W1U9YPC.375IK0HOYHDIG@cknow-tech.com/
https://lore.kernel.org/r/DLYLA3WQNN3X.3FB9MO8ZWBQ5@cknow-tech.com/

Karl Mehltretter (2):
  iommu: Add iommu_map_sgtable_dma()
  drm/rockchip: Map imported buffers from DMA addresses

 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  19 ++-
 drivers/iommu/dma-iommu.c                   | 131 ++++++++++++++++++++
 include/linux/iommu.h                       |  12 ++
 3 files changed, 157 insertions(+), 5 deletions(-)


base-commit: 602042bf29f6efde39cfb5fdd9289bf4854bc0c5
-- 
2.53.0


