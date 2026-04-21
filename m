Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C007DF8FA98
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rfu5dFxDRKxm0VgVCctusaOfZAaax27C1/pfHbQgx9M=; b=yRyl5E4mEhqHXpyTkR0C9XjwIG
	5RVLBo5tH7UrF/QJ1Xo/yP5sGLUpGgUTCka3owYanF+EgFazs1z5iAxYHHy+n+UEfIZYAhg8PLYes
	yK6lMOUCwXs8lt46evOeqKdhrrgod8MMcomGOfnVDMoRMgtfP2ro36qRG+Vr2wbkSyUYLmi2X0qa+
	0cZNo+C+LbI9fCGctJTi3nVqDr0AIZAew2OAiMj6Clr89pDlsKpMqij0z9fmnuAfkx3X49Fll255Q
	/rmT7emhA1DLSjK2hIo3EwkQUs1IFYWt8NSzij3BEDB1+4pwYjkyDqFMxFqFAMMgtw0ptUxLuvyHD
	/K3AaLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDTA-00000008rxv-3aB1;
	Tue, 21 Apr 2026 15:57:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDT8-00000008rxS-0AVM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:56:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21A0627B5;
	Tue, 21 Apr 2026 08:56:49 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE0223FAF5;
	Tue, 21 Apr 2026 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776787014; bh=D3W8mI+PUSgL8Ci0Ng3HSt4aWC16NYcoiFjJr0+hrC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aYrhviLfI3Fg5ruouPOBbG6V0sHMDezGjatQJpbBbCfe/K4aGUJLj7ruZDfkxJf2O
	 5fF96QfrTySz/D8Lc0aOUU+jSuShuxYCmWYIqCZvVYA4db2GaZQvPxf+IZ1vUXcuT2
	 8t+sZb3VRjG1jZx+zICs1KFQBNEvb+C7UIbbCah0=
Message-ID: <0fdf4b1f-90f2-4f69-9d2b-dc5f608e9c1c@arm.com>
Date: Tue, 21 Apr 2026 16:56:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3: Stop queue allocation retry at
 PAGE_SIZE
To: leo.jiang1224@foxmail.com, will@kernel.org
Cc: joro@8bytes.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <tencent_F6E384A40D990A279B460A0CDE1927FDF509@qq.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <tencent_F6E384A40D990A279B460A0CDE1927FDF509@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085658_201555_16668AFC 
X-CRM114-Status: GOOD (  19.98  )
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

On 18/04/2026 6:31 am, leo.jiang1224@foxmail.com wrote:
> From: LoserJL <leo.jiang1224@foxmail.com>
> 
> In arm_smmu_init_one_queue(), the loop reduces max_n_shift if
> dmam_alloc_coherent() fails. However, since dmam_alloc_coherent()
> allocates at least PAGE_SIZE, retrying with a smaller size after
> a PAGE_SIZE failure is logically redundant.

Says who? It's certainly not a guarantee offered by the DMA API itself, 
and indeed some allocation paths can definitely still allocate less than 
a page - e.g. anything which hits a per-device or global coherent pool.

> Moreover, if a sub-page retry were to succeed due to concurrent memory
> release, the hardware would be configured with a smaller queue depth
> despite a full page being allocated. This leads to inefficient memory
> usage and unnecessary hardware performance limitation.
> 
> Terminate the loop once qsz reaches PAGE_SIZE to ensure logical
> consistency and optimal hardware configuration.

That's really not an argument - even if an allocator does happen to 
over-allocate for the requested size, that is hardly the caller's 
concern; and as far as "optimal" queue sizes go in this case, those very 
much depend on the number of CPUs issuing commands and volume of 
expected stall/PRI events - in many cases PAGE_SIZE would already be far 
too small to really work well.

Also note that if we _were_ to fail to allocate a PAGE_SIZE or smaller 
queue, there would be very little chance of the subsequent allocation(s) 
for the stream table succeeding, so realistically the driver is probably 
going to end up failing to probe in such circumstances anyway.

Thanks,
Robin.

> Signed-off-by: LoserJL <leo.jiang1224@foxmail.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index e8d7dbe495f0..e0ec118ff560 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4418,7 +4418,14 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>   		qsz = ((1 << q->llq.max_n_shift) * dwords) << 3;
>   		q->base = dmam_alloc_coherent(smmu->dev, qsz, &q->base_dma,
>   					      GFP_KERNEL);
> -		if (q->base || qsz < PAGE_SIZE)
> +		/*
> +		 * If allocation succeeds, we're done. If it fails, only retry
> +		 * if the requested size is still larger than a page. Since
> +		 * dmam_alloc_coherent() allocates at least PAGE_SIZE, retrying
> +		 * with a sub-page size is logically redundant and could lead
> +		 * to sub-optimal hardware configuration.
> +		 */
> +		if (q->base || qsz <= PAGE_SIZE)
>   			break;
>   
>   		q->llq.max_n_shift--;


