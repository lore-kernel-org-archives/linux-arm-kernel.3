Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00752CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCcLIDDnOoxHdYRU9P8keoMRhkXOjRIh20wyihxDHR0=; b=bf/Zn0ckCHa7dvOxNbqQdB4KvS
	VsmyQkJ8QLBnFLD+zmzw5v3JSk4x5Z6rGeTrejSQOW0YGde1rVO+xBB+ZdZhHssoAi9MlWUi9ojGu
	stl3FUonYszXJHKWRi1I+aYj1Oi7Yrexq2XILiZ+ShQckziKQs44DiofbxuKzoyV3Z5c7R1FSe3Sj
	4fesKYOYFgZFR/Jj/jqYe3J9P23P1OZXg/kzlnt5BnFNaGvucTnB2dPMOorG7so3M9ljWLZEIAXTb
	DYDOuh4DsZjU3umxRIYt/o3kS1xfXrF0M9FBszFobFxHm2BdgrTq6zt3ir+yFjAl0nGGNk/eghBAe
	V96IdzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cur-0000000G2nl-46jy;
	Tue, 14 Oct 2025 11:10:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cup-0000000G2mI-1MzZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:10:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FFC01A9A;
	Tue, 14 Oct 2025 04:09:53 -0700 (PDT)
Received: from [10.57.7.84] (unknown [10.57.7.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AC723F66E;
	Tue, 14 Oct 2025 04:09:59 -0700 (PDT)
Message-ID: <526186fa-d17a-4b79-b51d-83492b19c941@arm.com>
Date: Tue, 14 Oct 2025 12:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] iommu/io-pgtable-arm: Simplify error prints for
 selftests
To: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, praan@google.com,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-2-smostafa@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250929155001.3287719-2-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_041003_405377_8CFECDA4 
X-CRM114-Status: GOOD (  18.19  )
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

On 2025-09-29 4:49 pm, Mostafa Saleh wrote:
> At the moment, if the self test fails it prints a lot of information
> about the page table (size, levels...) this requires access to many
> internals, which has to be exposed in the next patch moving the
> tests out.
> 
> Instead, we can simplify the print, using ias, oas, pgsize_bitmap
> and fmt is enough to identify the failed case, and the rest can
> be deduced from the code.

That is the same cfg information already logged at the start of the 
test, so if it's not useful to dump the actual internal details of the 
ops then just remove the whole function and make life even simpler. 
(Otherwise export it or turn it into a callback.)

Thanks,
Robin.
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>   drivers/iommu/io-pgtable-arm.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 7e8e2216c294..00218af5d5f7 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -1299,14 +1299,10 @@ static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
>   
>   static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
>   {
> -	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> -	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> +	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(ops)->cfg;
>   
> -	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
> -		cfg->pgsize_bitmap, cfg->ias);
> -	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
> -		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
> -		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
> +	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit oas %u-bit\n",
> +		cfg->pgsize_bitmap, cfg->ias, cfg->oas);
>   }
>   
>   #define __FAIL(ops, i)	({						\


