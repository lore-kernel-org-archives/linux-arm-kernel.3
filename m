Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E29CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 17:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91uNeVi7E5itXjn+yrF9A0btFNxYpnsRMUT8GeDqvCI=; b=C/bWWc9PmqDGwGfqIWLLOmn0Qq
	7vQ1X08R1/dH5bZWfWcwJAl/2hG+F/Rii+6yGnNDiLRJ102m8GjP9U/3NtR4NNaJIATntt1s1pFsM
	3hqw6YViSRIDGwyl3WNFfTw3TpuXD3wMczUnVl+haBCwjud8nG5U+BbXfjvGaoeU679E5AsMTIIpJ
	I56jN2Yz84yaBed2NrdwQgf4PnJrTOb2NP+t3yd7CP0+mEpvwa9T15EvHh+x8tc37308ITfAZVOoY
	Lin5s0DNZ2X81L8M6hRjzXpjsmeSIPkSD1BXwDjM2ydaZnnbyCnd/fcwpO0aIWS7IRo2F23ID8nBs
	Z0PKelEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4bh-00000006gG4-3ze8;
	Tue, 23 Jun 2026 17:08:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4be-00000006gFR-3hxE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 17:08:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F22B14BF;
	Tue, 23 Jun 2026 10:08:08 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34D7B3F62B;
	Tue, 23 Jun 2026 10:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782234492; bh=ADQsnugpFHOxuOxzTph2IW6GGFQJ6O5IwKd6BdjGweM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QhyoxRA7HjCf8/agBkdHSW4FjaPUxoIO2W2pmMUtZ318jEYJfOnK/ZBEtsdyTPH7T
	 ACSjdThyLAFzSuwkDruxCYsK2sQRa3zvNt2wpaZh1LamZmZYEAAW5MNvJa5gr7cAtC
	 wyU0cVSBm5o6W/adqj6i8O6EXBxX4UuqBLYxrA7Y=
Message-ID: <3463e5cf-05d3-4e4b-ac22-699e5f95589b@arm.com>
Date: Tue, 23 Jun 2026 18:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] iommu/qcom: Add NULL ctx check in TLB invalidation
 paths
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_100815_071273_C4AC6228 
X-CRM114-Status: GOOD (  17.53  )
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

On 23/06/2026 1:20 pm, Mukesh Ojha wrote:
> to_ctx() returns qcom_iommu->ctxs[asid], which can be NULL if the
> corresponding context bank failed to probe or was already removed.
> qcom_iommu_tlb_sync(), qcom_iommu_tlb_inv_context(), and
> qcom_iommu_tlb_inv_range_nosync() all dereference the returned pointer
> directly, risking a NULL pointer dereference.

But if there's no context bank, then how has a domain been allocated in 
order to permit io-pgtable operations that would eventually call into 
qcom_flush_ops at all? Can you please clarify whether you've actually 
observed a real-world issue here, and if so how?

Thanks,
Robin.

> Add WARN_ON(!ctx) guards with continue so TLB operations skip
> broken context banks without crashing.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 40fb0408dc07..51b60b296bb8 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -121,6 +121,9 @@ static void qcom_iommu_tlb_sync(void *cookie)
>   		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
>   		unsigned int val, ret;
>   
> +		if (WARN_ON(!ctx))
> +			continue;
> +
>   		iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
>   
>   		ret = readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, val,
> @@ -138,6 +141,10 @@ static void qcom_iommu_tlb_inv_context(void *cookie)
>   
>   	for (i = 0; i < fwspec->num_ids; i++) {
>   		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
> +
> +		if (WARN_ON(!ctx))
> +			continue;
> +
>   		iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
>   	}
>   
> @@ -157,6 +164,9 @@ static void qcom_iommu_tlb_inv_range_nosync(unsigned long iova, size_t size,
>   		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
>   		size_t s = size;
>   
> +		if (WARN_ON(!ctx))
> +			continue;
> +
>   		iova = (iova >> 12) << 12;
>   		iova |= ctx->asid;
>   		do {


