Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98390F53D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkdyDWWsGp3Fmhy3prTooqCTRvo9/B60/HeijnsHXA4=; b=w4+DUGTZQ3K9rLDsYicAD+EsOZ
	ZbOhORBpzDpn5SjaIBb/keYx2vH3BSRKa9Fn3OKyJl+qf0OIsr3m5PCmpYNSyOb8af6DgDb+hrT6W
	yeZ7dfZ6xegcEDA1WWa7aZv4R9sFw8lmMICjkUBVMy3b3CSw2MlqmnLmx96YAu3KY7vYPAyunfeea
	uZxih8JGVgJsAG5ymRgjkfZOuhBPzaVzNnjxl8L+YAzMatJJCWl7YDjLG3fclaO8VFJvJjN1HFzaT
	101CCNIOYR2+OmSOx7+h096R/mNEgO0UvjeGtQTFx/wMUKSmbETd171PJ6BGXY6oYnrlwzxQdk2lg
	iE3IzEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29jg-00000004JjM-3ojZ;
	Mon, 16 Mar 2026 15:20:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29jd-00000004JiC-2Wpa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:20:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 732A61477;
	Mon, 16 Mar 2026 08:19:53 -0700 (PDT)
Received: from [10.57.61.116] (unknown [10.57.61.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28E0F3F778;
	Mon, 16 Mar 2026 08:19:58 -0700 (PDT)
Message-ID: <68add41b-bafa-4884-be70-c03d6ce851eb@arm.com>
Date: Mon, 16 Mar 2026 15:19:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] iommu/arm-smmu-v3: Add register display to
 debugfs
To: Qinxin Xia <xiaqinxin@huawei.com>, will@kernel.org, jpb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 wangzhou1@hisilicon.com, prime.zeng@hisilicon.com, fanghao11@huawei.com,
 jonathan.cameron@huawei.com, linuxarm@huawei.com
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-3-xiaqinxin@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260313104351.3502293-3-xiaqinxin@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_082001_730199_9C84F8AB 
X-CRM114-Status: GOOD (  21.62  )
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

On 2026-03-13 10:43 am, Qinxin Xia wrote:
> Add register display functionality to debugfs.This allows reading
> and displaying key SMMU register values including control registers
> and queue pointers.
> 
> The registers file shows:
> - CR0, CR1, CR2 control registers
> - Command and Event queue pointers
> 
> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
> ---
>   .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 68 ++++++++++++++++++-
>   1 file changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
> index 542bd6047f26..f9bf955f3351 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
> @@ -12,11 +12,20 @@
>    * - Capability reporting covering all major SMMU features and configuration
>    * - Extensible architecture designed for adding future debug functionality
>    * - Comprehensive error handling and resource cleanup
> + * - Display of control registers (CR0, CR1, CR2) with bitfield decoding
> + * - Command and Event queue pointer monitoring (PROD/CONS)
> + *
> + * Register Information Displayed:
> + * - CR0: SMMU global control with enable states and queue enables
> + * - CR1/CR2: Additional control and configuration registers
> + * - CMDQ_PROD/CONS: Command queue producer and consumer pointers
> + * - EVTQ_PROD/CONS: Event queue producer and consumer pointers
>    *
>    * Directory Structure:
>    * /sys/kernel/debug/iommu/arm_smmu_v3/
>    * └── smmu0/
> - *     └── capabilities    # SMMU feature capabilities and configuration
> + *     ├── capabilities    # SMMU feature capabilities and configuration
> + *     └── registers	   # SMMU Key registers
>    *
>    * The capabilities file provides detailed information about:
>    * - Architecture version and translation stage support (Stage1/Stage2)
> @@ -24,6 +33,11 @@
>    * - Stream table size and command/event queue depths
>    * - All feature bits from the SMMU device structure
>    *
> + * The register display provides crucial visibility into:
> + * - SMMU operational state (enabled/disabled)
> + * - Queue operation and potential stalls
> + * - Configuration settings affecting all streams
> + *
>    * Copyright (C) 2025 HiSilicon Limited.
>    * Author: Qinxin Xia <xiaqinxin@huawei.com>
>    */
> @@ -69,6 +83,54 @@ static int smmu_debugfs_capabilities_show(struct seq_file *seq, void *v)
>   }
>   DEFINE_SHOW_ATTRIBUTE(smmu_debugfs_capabilities);
>   
> +/**
> + * smmu_debugfs_registers_show() - Display SMMU register values
> + * @seq: seq_file to write to
> + * @v: private data (SMMU device)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int smmu_debugfs_registers_show(struct seq_file *seq, void *v)
> +{
> +	struct arm_smmu_device *smmu = seq->private;
> +	void __iomem *base;
> +
> +	if (!smmu || !smmu->base) {
> +		seq_puts(seq, "SMMU not available\n");
> +		return 0;
> +	}
> +
> +	base = smmu->base;
> +
> +	seq_puts(seq, "SMMUv3 Key Registers:\n");
> +
> +	/* 32-bit control registers */
> +	seq_printf(seq, "CR0: 0x%08x [%s%s%s]\n",
> +		   readl_relaxed(base + ARM_SMMU_CR0),
> +		   readl_relaxed(base + ARM_SMMU_CR0) & CR0_SMMUEN ?
> +		   "Enabled " : "Disabled ",
> +		   readl_relaxed(base + ARM_SMMU_CR0) & CR0_EVTQEN ?
> +		   "EventQ " : "",
> +		   readl_relaxed(base + ARM_SMMU_CR0) & CR0_CMDQEN ?
> +		   "CmdQ " : "");

There's really no point printing these extra strings, since if any of 
those were *not* enabled then we'd have already failed probe and never 
created the debugfs entry. And if anyone ever were to be trying to 
change the driver behaviour at that level, I'd very much expect them to 
be able to be able to read the bottom 4 bits of a CR0 value in hex anyway ;)

Thanks,
Robin.

> +
> +	seq_printf(seq, "CR1: 0x%08x\n", readl_relaxed(base + ARM_SMMU_CR1));
> +	seq_printf(seq, "CR2: 0x%08x\n", readl_relaxed(base + ARM_SMMU_CR2));
> +
> +	/* 32-bit queue pointer registers */
> +	seq_printf(seq, "CMDQ_PROD: 0x%08x\n",
> +		   readl_relaxed(base + ARM_SMMU_CMDQ_PROD));
> +	seq_printf(seq, "CMDQ_CONS: 0x%08x\n",
> +		   readl_relaxed(base + ARM_SMMU_CMDQ_CONS));
> +	seq_printf(seq, "EVTQ_PROD: 0x%08x\n",
> +		   readl_relaxed(base + ARM_SMMU_EVTQ_PROD));
> +	seq_printf(seq, "EVTQ_CONS: 0x%08x\n",
> +		   readl_relaxed(base + ARM_SMMU_EVTQ_CONS));
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(smmu_debugfs_registers);
> +
>   /**
>    * arm_smmu_debugfs_setup() - Initialize debugfs for SMMU device
>    * @smmu: SMMU device to setup debugfs for
> @@ -120,6 +182,10 @@ int arm_smmu_debugfs_setup(struct arm_smmu_device *smmu, phys_addr_t ioaddr)
>   				 &smmu_debugfs_capabilities_fops))
>   		goto err_cleanup;
>   
> +	if (!debugfs_create_file("registers", 0444, smmu_dir, smmu,
> +				 &smmu_debugfs_registers_fops))
> +		goto err_cleanup;
> +
>   	pr_info("SMMUv3 debugfs initialized for smmu%pa\n", &ioaddr);
>   	return 0;
>   


