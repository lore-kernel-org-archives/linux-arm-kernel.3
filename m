Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD50D0D176
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 21:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAl4mT9ClQ66ApYDdRh37vRFtfRzA3LnN8VwrWYqNtE=; b=V3WwSjm6olmBSe59N2kCm8b/8t
	9RxNnuw9ukT+AVVC9/j+rHbxrLKPeBcauWLmqbdU5b0tIg0AsNmP9vwAGVzsyTzCubQ+l8hjSdGSx
	VPet22VPhU0WEIajDPdySKRo0ZCD2uqW6SOVMHcTghz5thZDpQhiqAi35ZOtodC3c+fBQ7rr2cuI+
	ZavrTxDrxYKh0muhSMq68n52Ajp65KXYIivFK0uvAkiIOBvfFq+5a3RtgHocNExrQaJEf36oBp5LT
	H/wogbn+5dYnGIUu4Ys3b29hAPuill5t9hHBG+MAPY0xXfv5ZNj2JdhR8+o83ykQINsbiyzF/+1H+
	gZMXtbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdawy-0000000FeqY-2LBi;
	Wed, 07 Jan 2026 21:20:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdawv-0000000Fepv-28pB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 21:20:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2165C40760;
	Wed,  7 Jan 2026 21:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8764C4CEF1;
	Wed,  7 Jan 2026 21:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767820811;
	bh=XppcCCr54iQac7uOZIwfkqrMvFp+4S0tQ8tyUXRWq2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H1wVe3lEekvn4ymad67HRPhWzdiop2wQhGm26cdCqx22b1BvLmgKeiSJ4/2uH71Bn
	 NOSQBLa/jH3ephtfi22M1EbcgBH/vO+GRoJLFfXA8OgufwHw+O3Wj327xQW1T4+oCY
	 fQ2HJaNKOvqXq9+JUr2fxEEo5liSzvjZ0eOi3IEOHEhDgLcbPxychrLr7G8/Gy3jcU
	 Yt/Qi+hfQMoFvzx7hjK9Dpgo4RvPmtUaU1zafl9XSkW0oj+bax07P1yvJa+eaQk2vf
	 VJNLqbURkMbkuw4T6kPr893I3Q5bI54FJGkdGbfGc39h6gS/WF+C24EosePea9gppA
	 6WVMSOTzlHmWA==
Date: Wed, 7 Jan 2026 21:20:06 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com, smostafa@google.com
Subject: Re: [PATCH rc v5 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <aV7OBrH-TDiGRblt@willie-the-truck>
References: <cover.1766093909.git.nicolinc@nvidia.com>
 <58f5af553fa7c3b5fd16f1eb13a81ae428f85678.1766093909.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58f5af553fa7c3b5fd16f1eb13a81ae428f85678.1766093909.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_132013_594218_DC4E5E9D 
X-CRM114-Status: GOOD (  17.64  )
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

On Thu, Dec 18, 2025 at 01:41:56PM -0800, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> C_BAD_STE was observed when updating nested STE from an S1-bypass mode to
> an S1DSS-bypass mode. As both modes enabled S2, the used bit is slightly
> different than the normal S1-bypass and S1DSS-bypass modes. As a result,
> fields like MEV and EATS in S2's used list marked the word1 as a critical
> word that requested a STE.V=0. This breaks a hitless update.
> 
> However, both MEV and EATS aren't critical in terms of STE update. One
> controls the merge of the events and the other controls the ATS that is
> managed by the driver at the same time via pci_enable_ats().
> 
> Add an arm_smmu_get_ste_update_safe() to allow STE update algorithm to
> relax those fields, avoiding the STE update breakages.
> 
> After this change, entry_set has no caller checking its return value, so
> change it to void.
> 
> Note that this change is required by both MEV and EATS fields, which were
> introduced in different kernel versions. So add get_update_safe() first.
> MEV and EATS will be added to arm_smmu_get_ste_update_safe() separately.
> 
> Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 ++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 18 ++++++++++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 27 ++++++++++++++-----
>  3 files changed, 37 insertions(+), 10 deletions(-)

Hmm. So this appears to ignore the safe bits entirely, whereas the
rationale for the change is that going from {MEV,EATS} disabled to
enabled is safe (which I agree with). So what prevents an erroneous
hitless STE update when going from {MEV,EATS} enabled to disabled after
this change?

Will

