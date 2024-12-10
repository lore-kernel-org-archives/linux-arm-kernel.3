Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1F4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yfe/IPxj106TIMlUGmp9HTFrG04jOzQx15g1/7tYHh0=; b=KyG81dn07LBb6V3xxueDUPLFdQ
	wpz9jGlyozv97gw1rIkJBjrTHwO1BA9llRDC4CdJToK8Vi1o8CRJlKRMfUH9bndZJBTqutVTAn54d
	Zu7MhSaOGbxHnF9uIbbfPDDtUqLsvqEDr4QZBdMy6SHmNunbhHK0ilNBP6Ce1uhuEKYujiHb/KwW1
	a1zAO5vLOVvvEund/U9+PdU7HXHDfGRVWgcgYpNzJ1suswOFnYk08YFUhWLLQ3tlIpDaTyYp/lnvc
	kqv+6uYSBNe3N6ehnKTjMWvludkOyuoqjEQ3huJbqYt5bO2CtLu4ouZ31n87QlwN/xMSgF7aGroOY
	oIFE3QsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKp4f-00000009pjQ-2cnv;
	Tue, 10 Dec 2024 01:30:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnwY-00000009g1O-3fxq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 00:17:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83AF3A40FC9;
	Tue, 10 Dec 2024 00:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F7AC4CED1;
	Tue, 10 Dec 2024 00:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733789857;
	bh=lSFohh6EEzkapzsoFRJjsaUOUmAfNgO9Vcd4zWYdiWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSip9Vr5cEcHTGp8skeF2R+vmYNJK0fOli0FGaS4B4/2jFR6uUr9Ar9oxFRhhZ0XG
	 h7DnSPZBbPEir7yU6wi5F3gVaxCUUvuih9pgU9oRcvvUm5cdokOwAANoKfuy8TVehD
	 AtwBSYcG7WMUJXdTCLIQg9htAFXdzsZSg5dSDfMo8ZD9k7Hf0mPWfh8YRrwbPGRs5c
	 1hZl1fhmqQ51axqxuoDdqEsMThQLf08L6MqtIDYXVHUttOqY5qyCFbRhymWXVl85y4
	 70Zsm1C0qR+F7Aifyte5ixGte4GNOMas6cWVojmJDdxDitrNCUekC9WsMclLz8RTsK
	 YLXjPWZfcXKAw==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	patches@lists.linux.dev
Subject: Re: [PATCH 0/3] iommu/arm-smmuv3: Update domain_alloc_paging_flags()
Date: Tue, 10 Dec 2024 00:17:26 +0000
Message-Id: <173378567932.4189360.5507988351679593105.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0-v1-0bb8d5313a27+27b-smmuv3_paging_flags_jgg@nvidia.com>
References: <0-v1-0bb8d5313a27+27b-smmuv3_paging_flags_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161738_974559_9CF55057 
X-CRM114-Status: UNSURE (   6.82  )
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

On Thu, 05 Dec 2024 11:43:26 -0400, Jason Gunthorpe wrote:
> The last cycle saw the removal of the NULL device during domain allocation
> and the introduction of domain_alloc_paging_flags(). Update smmuv3 to this
> new design.
> 
> Jason Gunthorpe (3):
>   iommu/arm-smmu-v3: Remove arm_smmu_domain_finalise() during attach
>   iommu/arm-smmu-v3: Make domain_alloc_paging_flags() directly determine
>     the S1/S2
>   iommu/arm-smmu-v3: Remove domain_alloc_paging()
> 
> [...]

Applied to arm64 (for-joerg/arm-smmu/updates), thanks!

[1/3] iommu/arm-smmu-v3: Remove arm_smmu_domain_finalise() during attach
      https://git.kernel.org/arm64/c/48e7b8e284e5
[2/3] iommu/arm-smmu-v3: Make domain_alloc_paging_flags() directly determine the S1/S2
      https://git.kernel.org/arm64/c/bb857c5c0150
[3/3] iommu/arm-smmu-v3: Remove domain_alloc_paging()
      https://git.kernel.org/arm64/c/cdfb9840fcc6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

