Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1690DD7788C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eNPEXbGjjbaiO5gLWYNnJe8fknrZY7YEqet0rgTKPw=; b=TyuM9wMh1NWGf2V1xnM3FPHixX
	mVFaBALqq1X58w9wdOwj9OCvyHWH9LYlHaT5YfWKVWPWJymsjrwVcEO5efcQVGy133hZLCxomJ8v/
	g02LB5RFK9YoRBFuccuaQDemug78BBsrFQz9CjXcpywFd5aA+M+p5wiC6VLG+Dkkm3J9mbLGX5Mun
	/NptP9uHOYjg09LPVapRXr2rWgWUtv/YcW68MW9Qb1yJNu2sxvndt7/5/IfEEqAoeMgwfkbGuT4a5
	zAhJu+CvJqycD5T3t94YpfnqPrb/c2znEosR5h6N7iG4YvAvelJtJSe2Sx5/LCfGIr2Zeg8SlWY/D
	jKIopZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKd2-00000009G9v-1Guh;
	Fri, 23 Jan 2026 17:07:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKd0-00000009G9Q-1K9R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1DDD44042;
	Fri, 23 Jan 2026 17:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F0EC4CEF1;
	Fri, 23 Jan 2026 17:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188041;
	bh=9rUMilIkpNWtjs/T2EfzZx31jZHYz4VdqIi8b2c0JrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=msNaMqX6KYDUOvOEOGX9DVjUrkfHhPyna2/uTUXTB1Mfn+jEouENQNmTCEeDZsCUQ
	 7SEUmcw+ZzoflGOLJj6bzpvd15muSZMZusyAh16GZxVIHtyyCAfsIKaB+aztqt0iBc
	 1T+jQA2nkNA+9mqK+3Fpl1Ur8V8EHOECXJNmRyAyOU4rsuRPcajnBjjAhYMjlv5HnA
	 YEuyQ+5VMes+kenXZydHFB/m8Cb6C7qahbmGdBLHQco0BTexSVJx85JvQ4fIkhYxiy
	 1+EckLMegEbN8q7kcDmD9JKuBndnt0J0TsZb2yDqbrDuitgksHiCrdW7gimjgfIwVg
	 LWPxkLhqs6vDw==
Date: Fri, 23 Jan 2026 17:07:15 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@nvidia.com, balbirs@nvidia.com, miko.lenczewski@arm.com,
	peterz@infradead.org, kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 7/7] iommu/arm-smmu-v3: Perform per-domain
 invalidations using arm_smmu_invs
Message-ID: <aXOqwymxe-nzYpwU@willie-the-truck>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <308ed579c724879a4a20b19ccdcb33e917597d77.1766174731.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <308ed579c724879a4a20b19ccdcb33e917597d77.1766174731.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_090722_396666_928DC0C7 
X-CRM114-Status: GOOD (  14.33  )
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

On Fri, Dec 19, 2025 at 12:11:29PM -0800, Nicolin Chen wrote:
> Replace the old invalidation functions with arm_smmu_domain_inv_range() in
> all the existing invalidation routines. And deprecate the old functions.
> 
> The new arm_smmu_domain_inv_range() handles the CMDQ_MAX_TLBI_OPS as well,
> so drop it in the SVA function.
> 
> Since arm_smmu_cmdq_batch_add_range() has only one caller now, and it must
> be given a valid size, add a WARN_ON_ONCE to catch any missed case.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   7 -
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  29 +--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 165 +-----------------
>  3 files changed, 11 insertions(+), 190 deletions(-)

It's one thing replacing the invalidation implementation but I think you
need to update some of the old ordering comments, too. In particular,
the old code relies on the dma_wmb() during cmdq insertion to order
updates to in-memory structures, which includes the pgtable in non-strict
mode.

I don't think any of that is true now?

Will

