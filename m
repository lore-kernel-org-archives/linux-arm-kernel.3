Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00B7CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKESfzRrAwjpeW4Er5VzbYPBdZnA/cv5c/T+odrF6V0=; b=UTtd+EjMAxd0566/SygR861DRk
	uzSpH6oSHjARoLSpG5o5pCwsLMk7gRaylE8zI3TrGbvQLDoIcEYmvXSjzAr1POTmY3nUxis3m49fr
	D2KcJxXc7KqSHcC6v00jMoj1YSdLz5Z6LuADbK6erG7tLNsMZC6q+IrfXewSnFQVLf1z1fuLvluXG
	2/DieqONVqUUslW9uuGeEuuLpkAyUee9jYNb7gtlkQ1UN1kTQGBq2Tllhao9KASAILriu7SqLwKab
	PRdia0whBQ4u6393vJoeWkjuR0zZD9gfWw+dDN70TIeTFtptiTqahJjnwNb548cJwKXnqxKEmanYy
	izBgm6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBANY-00000000Xg4-3MFM;
	Mon, 28 Sep 2026 12:22:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBANV-00000000Xf3-0hSI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:22:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 433F41570;
	Mon, 28 Sep 2026 05:22:34 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90E813F86F;
	Mon, 28 Sep 2026 05:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790598157; bh=YqYdTxNeBlZi+/azfWQ1G2jvXgUS9DTeh9xNNha/Wvk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IOTsN3UUwyJ+fUcqsO0r7V8LIhv8FhEMvL5PNRQ9AAtbUomLDP+Vi786MDTQUb4xs
	 X4gc4rNxMMtoFgW9Qw+KnIguPEsQ7cIBNuch13kl+q6izgXNMpROd9iMio08KKWZsF
	 /4Ox0sC5g4QnA0oWPFApbogXCvGaaHwEqwD11SG8=
Message-ID: <887e91bc-03a0-4977-aed6-baa2e069d9ee@arm.com>
Date: Mon, 28 Sep 2026 13:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/qcom: Invalidate TLB during context init
To: me@samcday.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Joerg Roedel <jroedel@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260928-qcom-iommu-clean-contexts-v1-1-c88fe2b4ff48@samcday.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260928-qcom-iommu-clean-contexts-v1-1-c88fe2b4ff48@samcday.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_052241_292806_C770A059 
X-CRM114-Status: GOOD (  35.38  )
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

On 28/09/2026 7:27 am, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
> 
> qcom_iommu derives each context bank's ASID from DT data, so a kernel
> booted via kexec reuses the same ASIDs as its predecessor.
> 
> Programming a new TTBR0 doesn't discard entries the SMMU has already
> cached under that ASID, so these residual and stale
> translations/table-walks will go into effect as soon as the context is
> enabled again.
> 
> On MSM8916 devices (I confirmed it on both a Samsung Galaxy A5 and a
> DragonBoard 410c) the result is MDP5 taking context faults on
> framebuffer IOVAs and stuck in a continuous underrun storm during scan
> out, if the previous kernel had itself initialized the display and
> programmed the SMMU.
> 
> arm-smmu invalidates the whole TLB in arm_smmu_device_reset() before
> enabling the SMMU. qcom_iommu can't do that on these TZ-managed devices
> (SMMU_SCR1.GASRAE=1), however.

Can you not hit SMMU_CBn_TLBIALL in qcom_iommu_ctx_probe()? That would 
seem like the logical equivalent.

Thanks,
Robin.

> Instead, qcom_iommu now invalidates each context bank by ASID whilst it
> is still disabled, before programming it for the new domain. Secured
> contexts are protected by TZ so they're skipped.
> 
> There's been previous discussion on the list (see link) about how to
> best deal with this kind of situation. This patch opts for a fix in the
> incoming kernel, rather than the outgoing one. This ensures newer
> kernels will always behave correctly, and also covers the kdump use
> case.
> 
> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> Link: https://lore.kernel.org/all/20240319154756.GB2901@willie-the-truck/
> Assisted-by: LLM
> Signed-off-by: Sam Day <me@samcday.com>
> ---
> Tested on my DragonBoard 410c. Starting from one unpatched kernel
> scanning out at 640x480 and kexecing into the same kernel at 1280x720
> results in context faults starting at the first IOVA past the previous
> kernel's mapped extent, with continuous MDP5 underruns thereafter.
> During this time I observed an all-blue HDMI signal. With the patch
> applied, the same kexec hop is free of faults, and the HDMI signal is
> clean throughout.
> 
> Further, it was proven that kexecing into an unpatched kernel and
> causing the fault storm can then be resolved by subsequently kexecing
> into a patched kernel.
> ---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 32 +++++++++++++++++++++-----------
>   1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 21d18ce67b982..a37955cd90d5e 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -111,23 +111,26 @@ iommu_readq(struct qcom_iommu_ctx *ctx, unsigned reg)
>   	return readq_relaxed(ctx->base + reg);
>   }
>   
> +static void qcom_iommu_ctx_tlb_sync(struct qcom_iommu_ctx *ctx)
> +{
> +	unsigned int val, ret;
> +
> +	iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
> +
> +	ret = readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, val,
> +				 (val & 0x1) == 0, 0, 5000000);
> +	if (ret)
> +		dev_err(ctx->dev, "timeout waiting for TLB SYNC\n");
> +}
> +
>   static void qcom_iommu_tlb_sync(void *cookie)
>   {
>   	struct qcom_iommu_domain *qcom_domain = cookie;
>   	struct iommu_fwspec *fwspec = qcom_domain->fwspec;
>   	unsigned i;
>   
> -	for (i = 0; i < fwspec->num_ids; i++) {
> -		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
> -		unsigned int val, ret;
> -
> -		iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
> -
> -		ret = readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, val,
> -					 (val & 0x1) == 0, 0, 5000000);
> -		if (ret)
> -			dev_err(ctx->dev, "timeout waiting for TLB SYNC\n");
> -	}
> +	for (i = 0; i < fwspec->num_ids; i++)
> +		qcom_iommu_ctx_tlb_sync(to_ctx(qcom_domain, fwspec->ids[i]));
>   }
>   
>   static void qcom_iommu_tlb_inv_context(void *cookie)
> @@ -270,6 +273,13 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>   		/* Disable context bank before programming */
>   		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
>   
> +		/* The TLB may still hold cached and stale entries for this
> +		 * ASID, if a previous kernel programmed the SMMU before
> +		 * a kexec into this kernel.
> +		 */
> +		iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
> +		qcom_iommu_ctx_tlb_sync(ctx);
> +
>   		/* Clear context bank fault address fault status registers */
>   		iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
>   		iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
> 
> ---
> base-commit: 3339792beb5fb1c9c423c544ba2fbc235e7d7f75
> change-id: 20260926-qcom-iommu-clean-contexts-3ccda804c08d
> 
> Best regards,


