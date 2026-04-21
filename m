Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D157F8FA90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HR8pEK2cn0y8lVddup7nzKUo5sA0iDvpJ001KkxeSd8=; b=gp9UDVDFRU/mLsXGMyXBGwq/HA
	5DytNPqYrSPUPPSGnh54yVtbqCBXtw1VxOq1B+8sApOzO/aDHFtXLCgmSsnn4AoygxhgC5JSfUitV
	/98XRjrFzADtt6HNmln/jUinWKNxgroe9JQk9jxmE73h+fQiVJFkWeXwkcX3v/ItKwKQ3j5VFb/ba
	L0ebasA6GO5JIWR+ZQi5R1qacVjbSOGa+j7H85pBwWg3qYMoX6eCwqPjdHxE+f0tRs0C3A+/3Xr1L
	uriNB4AqNNJsNKbpJgXcYCUg1KuJL6SQpJpFC3zARE5yywv4ULdg4jIbAMLEudws29xAuCOaclCtF
	rjfpE1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCzy-00000008pYY-2Jc4;
	Tue, 21 Apr 2026 15:26:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCzw-00000008pYS-2iPo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDE226011F;
	Tue, 21 Apr 2026 15:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5569AC2BCB3;
	Tue, 21 Apr 2026 15:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776785207;
	bh=w3GsHD5BJ+Jbn6VdZQFnRDPvTckSfOnqGtiOVW0QHqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlydgGTrM+kflkQWRzj/IYRsO0NfvhdryoyQD+E3ABAeB0Qeo9Q+xNyhU2EdzO4hR
	 v4J/6YTXO97SjlGBdKasA7nINKxfPWsh9ff3yXqKvo2PkWJHX/HnvY3avKf/cRTJmW
	 kj++F+huXGqh47wZf+uokGMVzbmmWhWGUSlgwaWd5FLHi9ZfdWMSTP/hYQ4ANUJJLC
	 tTxk5kCN1ib0TGx6TRTusnFyf+ob99+cwFKgp2KepS95SzKx2M2drbAUQTWQ1iUqwC
	 +anM7DxI6LGDryxBkL0nVPzLLE11BTViN0vTEaj2FCLoR4S/tjCNJ65STus/91D+96
	 1+HeJAIU6K69A==
Date: Tue, 21 Apr 2026 16:26:42 +0100
From: Will Deacon <will@kernel.org>
To: leo.jiang1224@foxmail.com
Cc: robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Stop queue allocation retry at
 PAGE_SIZE
Message-ID: <aeeXMrCvOIwvvWy-@willie-the-truck>
References: <tencent_F6E384A40D990A279B460A0CDE1927FDF509@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_F6E384A40D990A279B460A0CDE1927FDF509@qq.com>
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

On Sat, Apr 18, 2026 at 01:31:43PM +0800, leo.jiang1224@foxmail.com wrote:
> From: LoserJL <leo.jiang1224@foxmail.com>
> 
> In arm_smmu_init_one_queue(), the loop reduces max_n_shift if
> dmam_alloc_coherent() fails. However, since dmam_alloc_coherent()
> allocates at least PAGE_SIZE, retrying with a smaller size after
> a PAGE_SIZE failure is logically redundant.
> 
> Moreover, if a sub-page retry were to succeed due to concurrent memory
> release, the hardware would be configured with a smaller queue depth
> despite a full page being allocated. This leads to inefficient memory
> usage and unnecessary hardware performance limitation.
> 
> Terminate the loop once qsz reaches PAGE_SIZE to ensure logical
> consistency and optimal hardware configuration.
> 
> Signed-off-by: LoserJL <leo.jiang1224@foxmail.com>

No pseudonyms, please.

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index e8d7dbe495f0..e0ec118ff560 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4418,7 +4418,14 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>  		qsz = ((1 << q->llq.max_n_shift) * dwords) << 3;
>  		q->base = dmam_alloc_coherent(smmu->dev, qsz, &q->base_dma,
>  					      GFP_KERNEL);
> -		if (q->base || qsz < PAGE_SIZE)
> +		/*
> +		 * If allocation succeeds, we're done. If it fails, only retry
> +		 * if the requested size is still larger than a page. Since
> +		 * dmam_alloc_coherent() allocates at least PAGE_SIZE, retrying
> +		 * with a sub-page size is logically redundant and could lead
> +		 * to sub-optimal hardware configuration.

What do you mean by "sub-optimal hardware configuration"? I think you can
probably just drop this comment.

> +		 */
> +		if (q->base || qsz <= PAGE_SIZE)
>  			break;

I think this part is fine.

Will

