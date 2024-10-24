Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1CCCE8E67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+/O+pJH11f8wpR0mjT2+CrDg1xH0ttuy43CkcWxt0w=; b=VKzfqlNkYs/OHw2SPSqCk2pAVt
	bevrLAztbpz2SqKOzHqZK1dxkf6NWHQmPoTw9dG+JtITcgw6DWvPa4IU2ahV/7GAI+KlfmA3LGqGW
	tYWyvtMIrYPx4s+ZL9FSBVybRtkomTmA6aJCyg2XFhM8sZ2jB84wKl9NW2F7CM+TswrLg5H0NDUVa
	OpzPsNZyGFqHE8oCHBq8o/1VUgW6OjC0yLyJUDNzvP9Wpris3krGPlMCbTRu/2B76tCcnzQRTtMRn
	InESzr44E1gqnNOc8a/SCVse2ukBrBNsYqqw4Iw2UI5LHrUQYC5BKgAeaSPrX9brJywkKh6yDxDQq
	Lrxdd4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wWa-00000000HLZ-2LFj;
	Thu, 24 Oct 2024 12:01:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wV1-00000000H8v-0zMC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:59:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37453339;
	Thu, 24 Oct 2024 04:59:58 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38F2F3F71E;
	Thu, 24 Oct 2024 04:59:27 -0700 (PDT)
Message-ID: <aa763283-97fc-4b50-828d-8b64aa749bdd@arm.com>
Date: Thu, 24 Oct 2024 12:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Add judgment on the size and granule
 parameters passed in
To: goutongchen <goutongchen@uniontech.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: =?UTF-8?B?6Iuf5rWp?= <gouhao@uniontech.com>
References: <20241024100224.62942-1-goutongchen@uniontech.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241024100224.62942-1-goutongchen@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_045931_412832_2DC6C0BD 
X-CRM114-Status: GOOD (  19.29  )
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

On 24/10/2024 11:02 am, goutongchen wrote:
> In the arm_smmu_tlb_inv_range_s1 and arm_smmu_tlb_inv_range_s2
> functions, the size and granule passed in must be judged.
> It must be ensured that the passed in parameter is not 0 and
> the size is an integer multiple of the granule, otherwise it
> will cause an infinite while loop.
> 
> This was encountered during testing, and was initially triggered
> by passing in a size value of 0, causing the kernel to crash.
> 
> [    8.214378][  T675] xhci_hcd 0000:0b:00.0: new USB bus registered, assigned bus number 1
> [   68.246185][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
> [   68.246866][    C0] rcu:     0-....: (5999 ticks this GP) idle=796c/1/0x4000000000000000 softirq=161/161 fqs=2999
> [   68.247924][    C0] rcu:     (t=6000 jiffies g=-699 q=1 ncpus=128)
> [   68.248452][    C0] CPU: 0 PID: 675 Comm: kworker/0:2 Not tainted 6.6.0-25.02.2500.002.uos25.aarch64 #1
> [   68.249237][    C0] Hardware name: Inspur     CS5260F     /CS5260F          , BIOS 4.0.16 05/31/22 16:53:51
> [   68.250029][    C0] Workqueue: events work_for_cpu_fn
> [   68.250497][    C0] pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   68.251188][    C0] pc : arm_smmu_tlb_inv_range_s1+0xf0/0x158
> [   68.251704][    C0] lr : arm_smmu_tlb_inv_walk_s1+0x44/0x68
> [   68.252189][    C0] sp : ffff80008044b780
> [   68.252530][    C0] x29: ffff80008044b780 x28: 0000000000000000 x27: 0000000000001000
> [   68.253212][    C0] x26: 0000000000000600 x25: 0000000000000001 x24: 0000000000000600
> [   68.253857][    C0] x23: 0000000000000000 x22: 0000000000001000 x21: fffffc64e2e59000
> [   68.254544][    C0] x20: 0000000039c1d1a6 x19: ffff3fe944c40280 x18: 0000000000000000
> [   68.255240][    C0] x17: 626d756e20737562 x16: ffffb0e7e08c1008 x15: 0000000000000000
> [   68.255930][    C0] x14: ffff3ef8c1ea15cd x13: ffff3ef8c1ea15cb x12: fffffcfba30e3880
> [   68.256538][    C0] x11: 00000000ffff7fff x10: ffff80008044b6b0 x9 : ffffb0e7decd1b5c
> [   68.257126][    C0] x8 : 0000000000000dc0 x7 : ffff3ee8c4148000 x6 : ffff3ee8c4148000
> [   68.257822][    C0] x5 : 0000000000000008 x4 : 0000000000000000 x3 : ffff3fe944c40800
> [   68.258497][    C0] x2 : 0000000000000010 x1 : 0000000000000020 x0 : ffffb0e7dfd6c3d0
> [   68.259185][    C0] Call trace:
> [   68.259451][    C0]  arm_smmu_tlb_inv_range_s1+0xf0/0x158
> [   68.259933][    C0]  arm_smmu_tlb_inv_walk_s1+0x44/0x68
> [   68.260384][    C0]  __arm_lpae_map+0x1f0/0x2c0

Huh? This invalidation path is for mapping a block entry, and the size 
is the size of that block per ARM_LPAE_BLOCK_SIZE(lvl, data) - how can 
it possibly be 0?

Thanks,
Robin.

> [   68.260796][    C0]  arm_lpae_map_pages+0xec/0x150
> [   68.261215][    C0]  arm_smmu_map_pages+0x48/0x130
> [   68.261654][    C0]  __iommu_map+0x134/0x2a8
> [   68.262098][    C0]  iommu_map_sg+0xb8/0x1c8
> [   68.262500][    C0]  __iommu_dma_alloc_noncontiguous.constprop.0+0x180/0x270
> [   68.263145][    C0]  iommu_dma_alloc+0x178/0x238
> [   68.263557][    C0]  dma_alloc_attrs+0xf8/0x108
> [   68.263962][    C0]  xhci_mem_init+0x1e8/0x6d0
> [   68.264372][    C0]  xhci_init+0x88/0x1d0
> [   68.264736][    C0]  xhci_gen_setup+0x284/0x468
> [   68.265121][    C0]  xhci_pci_setup+0x60/0x1f8
> [   68.265506][    C0]  usb_add_hcd+0x278/0x650
> [   68.265860][    C0]  usb_hcd_pci_probe+0x218/0x458
> [   68.266256][    C0]  xhci_pci_probe+0x7c/0x270
> [   68.266660][    C0]  local_pci_probe+0x48/0xb8
> [   68.267074][    C0]  work_for_cpu_fn+0x24/0x40
> [   68.267548][    C0]  process_one_work+0x170/0x3c0
> [   68.267999][    C0]  worker_thread+0x234/0x3b8
> [   68.268383][    C0]  kthread+0xf0/0x108
> [   68.268704][    C0]  ret_from_fork+0x10/0x20
> 
> Signed-off-by: goutongchen <goutongchen@uniontech.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 8321962b3714..16b2e9ec0e60 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -282,6 +282,13 @@ static void arm_smmu_tlb_inv_range_s1(unsigned long iova, size_t size,
>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>   	int idx = cfg->cbndx;
>   
> +	if (size == 0 || granule == 0 || (size % granule) != 0) {
> +		dev_err(smmu->dev,
> +				 "The size or granule passed in is err. size=%lu, granule=%lu\n",
> +				 size, granule);
> +		return;
> +	}
> +
>   	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
>   		wmb();
>   
> @@ -309,6 +316,13 @@ static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
>   	int idx = smmu_domain->cfg.cbndx;
>   
> +	if (size == 0 || granule == 0 || (size % granule) != 0) {
> +		dev_err(smmu->dev,
> +				 "The size or granule passed in is err. size=%lu, granule=%lu\n",
> +				 size, granule);
> +		return;
> +	}
> +
>   	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
>   		wmb();
>   

