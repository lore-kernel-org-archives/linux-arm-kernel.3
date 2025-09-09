Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A3BCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgB5/eaGOgbLBRjURiTdteqdeHb+1rDTURjinJsvu9M=; b=ntoLCLdu1oW+WozWtav6vpQW2+
	snAaKeEhIgHwdGnyIoNT/GozaZnPs1MPSHgWvsGw+3atMRAmwyiZ22ChLHEF9qVW3wOIrmuTxybXJ
	xwNuZuDM1K7r1fwk2tyX4eu8T5sLKeH+mE0Gm2CwB+J+S4gA4nXKKQcwqPUhz5kuAUXW4l/PHQydC
	WjEM1lYp7mkacZeUHE3lgRVZEu/4bYdmcnlshr6rkeTeEGp20VyDSCQ+kkmuwD6luqHzy7Oa2PCEd
	ME/l9fMxdskAA4hahYdDKXnm/sIvJJ9HydJS7I/MqUCqhy5MW2L3xrpl3p+YeuFr9GiOFxhHTajNw
	miqWN8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21c-00000008x99-3Thm;
	Tue, 09 Sep 2025 17:21:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzHt-00000007iuO-42So
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6069060224;
	Tue,  9 Sep 2025 14:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF22C4CEF4;
	Tue,  9 Sep 2025 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757427937;
	bh=KOCPAbXyhBmrq4G3esSPg3HAVWaUxAD+l+/Z/GxwYro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oykfebDOD3Pse+tzCSjCAz2s+XpsZGxDPQ/oNpP6TdYxUuVH2F8km/Wy8s6O8bmN3
	 xVhTAeGeGcjUnd9Dk9zwOF4xjV+dkYAcHqxAipqz6Gr/TC7mVeLo6zCsEuvaaDlaug
	 BE5n5vqVrmcC0evZDAnBfDwy6j0BOBqoS6vnK2tS5aitlBmddzJ5UIEkIa7ZFSJ463
	 FoxbJh9p05npZAl3B+5sm+DFXCf65W6IW4mesh0TBMgrqeEVtdviNoW67oexfgaAft
	 3SvD9ZCZCJJv3L1K4gtEYswSHx2F3Mi3Cfk4JIszfdjMFy3E0sHNOJIXvN4IpH1sEf
	 UqUyLae88PdeA==
Date: Tue, 9 Sep 2025 15:25:30 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 07/28] iommu/arm-smmu-v3: Move TLB range invalidation
 into a macro
Message-ID: <aMA42g-QWYzOwg7r@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-8-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819215156.2494305-8-smostafa@google.com>
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

On Tue, Aug 19, 2025 at 09:51:35PM +0000, Mostafa Saleh wrote:
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 2698438cd35c..a222fb7ef2ec 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1042,6 +1042,70 @@ static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
>  	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
>  }
>  
> +/**
> + * arm_smmu_tlb_inv_build - Create a range invalidation command
> + * @cmd: Base command initialized with OPCODE (S1, S2..), vmid and asid.
> + * @iova: Start IOVA to invalidate
> + * @size: Size of range
> + * @granule: Granule of invalidation
> + * @pgsize_bitmap: Page size bit map of the page table.
> + * @smmu: Struct for the smmu, must have ::features
> + * @add_cmd: Function to send/batch the invalidation command
> + * @cmds: Incase of batching, it includes the pointer to the batch
> + */
> +#define arm_smmu_tlb_inv_build(cmd, iova, size, granule, pgsize_bitmap, smmu, add_cmd, cmds) \
> +{ \
> +	unsigned long _iova = (iova);						\
> +	size_t _size = (size);							\
> +	size_t _granule = (granule);						\
> +	unsigned long end = _iova + _size, num_pages = 0, tg = 0;		\
> +	size_t inv_range = _granule;						\

This is pretty gross and I've been (very sporadically) trying to replace
the similar macro we have on the CPU side with static inline functions
instead.

Can you use an inline function here too?

Will

