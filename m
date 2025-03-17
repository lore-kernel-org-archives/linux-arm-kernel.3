Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74268C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w2PUHcSecse+pehFOqz8LoEZY+5oNJsWhoVGSb9IYhM=; b=Dd26ReaMJjmkaahiOTAKFhEypN
	lhoima179SMi3WWpqUsP2zQLGUwRMgOC5oFX21Qe3Q0whMv2K2/4ruE8VSDYBWRjo0PyzQTLHPoxd
	/yBNUaKQ8VElPHIv1wpjiBmaDLuYYVsQRJBzz2Ns86fUaAqbN6CQOapme8iOuM9AAqa6+d2MmUtyd
	1WK+0CfRwZJ2NClS2kwsTkLbMJzaG+ubo6Pvo3Tk3OdBo0EJvdq2EYngFLxfIDGHPIG10kh1cziGv
	z2+zJzkLMOtlSvHF6gmeEn3PwVH0e2gy/UrfmOV8r+N+WqAvIzVGdxLxkGEaJze/Han0AhHEIFvs/
	FboeKzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBtv-000000033Hm-3GX6;
	Mon, 17 Mar 2025 14:57:11 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBre-000000032Zq-2STM;
	Mon, 17 Mar 2025 14:54:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742223275; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M1VNdrAj5oc9FpRE6pFNkZ4u0JB4zbIPDuYhAuq7Ix2zKDlpOp3dHgrw4FiBPhcnOGf6Wz9GzkA9s5IyFOpjIuyBGac6DFi5cVGptceqMa0lUmHB7++DlPY6md3ac12/C2P0kLpRtju91o7KeRL835xWGQQffDODqIcTiichgpE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742223275; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w2PUHcSecse+pehFOqz8LoEZY+5oNJsWhoVGSb9IYhM=; 
	b=kTrKYomtic4qkvQ27g5u/wSJv60IzY8NWyZisxqxCo1s5gXeo7Lz7maGNq2oAQKDwqnB0VvNPV2V8+bpERJozMwQOwbKjs0PfPkuVpsIqozq7Odt7+LhdTopGZaBPVJXIynr9dva9sZcoh3DjkeOI9qpFVoZKA1Yz2nS/rRVHVE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742223275;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=w2PUHcSecse+pehFOqz8LoEZY+5oNJsWhoVGSb9IYhM=;
	b=Lm6le1K+gNlNVDiix2eq3N357e3nBMmoZy+how0rlLpqnYfRfCoJDavOZAnZZUWI
	P0oFPC9Ko0Xui9Y5iY3KGnbCso3xn85Do5l+e4UsBMFZ3dFNFZ4opzuhTFOWSTLwwMR
	1pL9gYJ1bM9PHh89QsdFkMpCbcU9J1a+ek+8Vv3g=
Received: by mx.zohomail.com with SMTPS id 1742223273794544.7426387763203;
	Mon, 17 Mar 2025 07:54:33 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com,
	robh@kernel.org,
	steven.price@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	kernel@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sjoerd@collabora.com,
	angelogioacchino.delregno@collabora.com,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v4 0/6] drm/panfrost: Add support for AARCH64_4K page table format
Date: Mon, 17 Mar 2025 11:52:39 -0300
Message-ID: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_075450_676423_62C8A532 
X-CRM114-Status: UNSURE (   8.36  )
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

Hi all,

This is a new iteration on Panfrost support for AARCH64_4K page table
format. The main reason behind this patchset is that MediaTek MT8188 SoC
(ARM Mali-G57 MC3 GPU) constantly faults due to the actual Panfrost cache
configuration.

Currently, Panfrost only supports MMU configuration in "LEGACY" (as Bifrost
calls it) mode, a (modified) version of LPAE "Large Physical Address
Extension", which in Linux we've called "mali_lpae".

This patchset adds support for conditionally enabling AARCH64_4K page table
format. To achieve that, a "GPU optional quirks" field was added to
`struct panfrost_features` with the related flag.

Note that, in order to enable AARCH64_4K mode, the GPU variant must have
the HW_FEATURE_AARCH64_MMU feature flag present.

The patchset only enables the new format on Mediatek MT8188 and MT8192,
which have been tested on a Mediatek Genio 700 EVK (MT8390) and Mediatek
Genio 1200 EVK (MT8395) boards respectively.

Thanks!

Changes in v4:
* Fixed panfrost_mmu_cfg_init() return value on warning.

Changes in v3:
* Fixed error handling in panfrost_mmu_ctx_create().

Changes in v2:
* Dropped panfrost_mmu_enable/disable unification.
* Rename gpu_configs as gpu_quirks.
* Added error handling on page table not properly aligned.
* Enabled AARCH64_4K format on MediaTek MT8192 as well.
* Minor fixes.

Changes in v1:
* Added "Set IOMMU_CACHE flag" patch.
* Replaced `panfrost_mmu->enable()` function pointer by `cfg` struct
prepared during init time.
* Made mali_lpae/aarch64_4k name more clear.
* Added GPU_CONFIG_AARCH64_4K flag to enable AARCH64_4K page table
  format.
* Enabled AARCH64_4K mode only on mediatek-mt8188.

Ariel D'Alessandro (6):
  drm/panfrost: Set IOMMU_CACHE flag
  drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
  drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost
    models
  drm/panfrost: Add support for AARCH64_4K page table format
  drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8188
  drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192

 drivers/gpu/drm/panfrost/panfrost_device.h   |  16 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c      |   2 +
 drivers/gpu/drm/panfrost/panfrost_features.h |   3 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c      | 150 +++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_regs.h     |  36 +++++
 5 files changed, 196 insertions(+), 11 deletions(-)

-- 
2.47.2


