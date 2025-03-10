Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707F5C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XnPLtUq7gfXI+7/0APvhFGaW+4ilm1CeUoTlvhHmsDI=; b=rJildqQxiTzEyzoae0yBbRUYdX
	W+otbMmerSsH56j83vGv25RYbzpujIZD8KTGbRlj8nMIvcoWeS0+//0dC4BJDfg8Vmqn2ZLUFRnOd
	Jy6tB5B1texp1L9qgdR+Ct8n7Fv2OAQjfq1QsIDPnn1TNfTRwJJQs1E4LBuFelWIBAKHljmhJ7VTC
	aT+qrxPNgz0xjp+mBcLywTREZaxHgMLYRxbnrkeKGS7CdEo7MMiouoFj6LsMLFh+lai659Uow++1V
	JEf7ujfcjadxMQYbZF0AKRm8pOYHMGyG186349h+0f3vxbKO6qK+zthyngnh1EJRF6GhLqMzDN5JN
	coiX8DcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjJt-00000003nYV-2PRT;
	Mon, 10 Mar 2025 20:01:49 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjIF-00000003n70-06x4;
	Mon, 10 Mar 2025 20:00:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741636789; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mTWhI5ljOxaH+MZDEieAyDNSUiszcmKsQaV0GCeb1LuLbcokr8+lKYjtkfVgPmYvC9ngOt4G1EmnqXbVbrg2Na5nF651Ang7Rmgxxd3BMuF3oHd4j2s/IocV22Te1XjfvaSCDcTZm2ozP3fCZarMe9KAg+OgwU0M8xCPdhyUa7A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741636789; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XnPLtUq7gfXI+7/0APvhFGaW+4ilm1CeUoTlvhHmsDI=; 
	b=CowNFAKRa1rulQAjGp406e5k3Ji8XogVwTmLpPw4E0cGkKvj7/9GlVP1Sm/AE/zmHVMMPjl0nQmW/icflW7iQZD8UtgR8qDwfByHjjZ8wFCxsBbYALIUTWTvs9ZAhW4CypE1baiIS8m95pXqHr5z+4qfrA5KpKTaB0A5RTTjahU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741636789;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XnPLtUq7gfXI+7/0APvhFGaW+4ilm1CeUoTlvhHmsDI=;
	b=eJbETDYHzZaq0ZHObtlo93olKYwZ24KkPAakpeCc9NHqep4SkdkWi6ouJRfo9sHC
	WgN/SnIxyLCx0XXgHW2+ZiWwZRAIaVe8wEhu6YqMMDddyfxB/TBgqtaP9bpCE93vrsu
	OHRLcz40aLLG0DMuq4NTPBcOtBNIVCb50wwFGXvE=
Received: by mx.zohomail.com with SMTPS id 1741636786814304.76226844373525;
	Mon, 10 Mar 2025 12:59:46 -0700 (PDT)
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
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v1 0/6] drm/panfrost: Add support for AARCH64_4K page table format
Date: Mon, 10 Mar 2025 16:59:15 -0300
Message-ID: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130007_137357_F74291DD 
X-CRM114-Status: UNSURE (   9.41  )
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

Following the previous RFC [0], this is the first iteration on Panfrost
support for AARCH64_4K page table format.

Currently, Panfrost only supports MMU configuration in LEGACY mode, as
named by Bifrost. This is a (modified) version of LPAE "Large Physical
Address Extension", which in Linux we've called ARM_MALI_LPAE.

This commit adds support for conditionally enabling AARCH64_4K page
table format in Panfrost, based on the newly added GPU_CONFIG_AARCH64_4K
flag. This way, we can progressively move away from the legacy format
once enough testing has been done on each target.

The patchset only enables the new format on Mediatek MT8188, which has
been tested on a Mediatek Genio 700 EVK (MT8390) board, with an
integrated Mali-G57 MC3 GPU. No regressions were reported in Mesa CI [1]
for the rest of the currently supported platforms.

[0] https://lore.kernel.org/all/20250226183043.140773-1-ariel.dalessandro@collabora.com/
[1] https://gitlab.freedesktop.org/mesa/mesa/

Thanks!

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
  drm/panfrost: Unify panfrost_mmu_enable/disable common code
  drm/panfrost: Add support for AARCH64_4K page table format
  drm/panfrost: Enable AARCH64_4K page table format on mediatek_mt8188
  drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost
    models

 drivers/gpu/drm/panfrost/panfrost_device.h   |  16 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c      |   1 +
 drivers/gpu/drm/panfrost/panfrost_features.h |   3 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c      | 159 ++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_regs.h     |  36 +++++
 5 files changed, 189 insertions(+), 26 deletions(-)

-- 
2.47.2


