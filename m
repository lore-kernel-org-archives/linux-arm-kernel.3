Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33B8C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxi4w+/B7pXHn9XdCEw4+G4vTl1xQW/kaBWB75dr2vg=; b=qcbzxoDyhVQWR21Cq5361u1nbW
	bgmlgFYuZdd5qPFCBKlDxlc4xeq1EmYltyKlPgYbeZpzc4qUOnLXRgGlZlH1RKJ+9zwwkwAwRD8/S
	KtEBgz5mMdSW4/lFhRcdn12uF60zBrHvGiY15Our1T6AOI/CLy2SuG0ryKuBl26uYRnGpOWGgfTfK
	zbWcLdgVT/YFMtWqqeq7yWwFVVFIBBr5yOsVGEOdzvxFQspYS9IXFI9k15WxKpvf4T2+KJgTe+gDl
	/hh2vN4NAGDLS0Vc2Ka95Y6Il8wwj8nb/4EwEh1UNn3eP4B3w7q3Ka5PlszHWHW8FWOkPunMRCKKN
	A9livktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeg1-0000000CpYK-0TPN;
	Wed, 22 Jul 2026 21:40:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefu-0000000CpUw-2MT6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 06192600B0;
	Wed, 22 Jul 2026 21:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BF31F00A3A;
	Wed, 22 Jul 2026 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756421;
	bh=fxi4w+/B7pXHn9XdCEw4+G4vTl1xQW/kaBWB75dr2vg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CZXjUFl31LodjipmpbwvoT8x5DPGd6uwznXSaxumd9KcN0ajOrgoYc+sWVvcD9Ep2
	 XUyFcgMCeCSj4Abfd/IfnjakEVgYORCnof6ZcVLQQiNKgLZfeclCyoLJ/lSYB0+F3K
	 SoHe3B22RftZNYoljcD8/noK7/0doyGf/6rSMr7uYO/IaKaFkbC9DH41VcWmdksSYv
	 CoiWBtPFTWKdyjJEMS2oINFxwOmf+uF+1/YfDs5F608wx3A2tkyXymezcQOA0VTpUi
	 QjGycePhV7EqEYQBZRMMyLxPLXsute8jRbgVNzhAVKPrVI8N+S7qrdzvYB2IW2trj9
	 lMz+4rR1RJT3Q==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	joro@8bytes.org,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Declare eats_s1chk and eats_trans as host-endian u64
Date: Wed, 22 Jul 2026 22:39:28 +0100
Message-ID: <178472616634.2880644.9585737854027024973.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615194533.3290010-1-nicolinc@nvidia.com>
References: <20260615194533.3290010-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 15 Jun 2026 12:45:33 -0700, Nicolin Chen wrote:
> arm_smmu_get_ste_update_safe() declares the eats_s1chk and eats_trans
> locals as __le64, but initializes them from FIELD_PREP(), which returns a
> host-endian value, and passes them through cpu_to_le64() at the use sites.
> 
> Sparse reports the following warnings:
> 
> >> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1122:38: sparse: sparse: cast from restricted __le64
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1124:33: sparse: sparse: cast from restricted __le64
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Declare eats_s1chk and eats_trans as host-endian u64
      https://git.kernel.org/iommu/c/445528627447

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

