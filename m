Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A47BC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCEV3hl0mBvDZ4PNrKNkj058/iLgsnmExBD2WEhK4lQ=; b=pc3PJW1NkjunyuTwkrlKaIGOiz
	IG0hX4SARA+da/iAeM/+JPL4n7e3EsrgwDCJo3EZLrQGIScZXOFCYlbqWvo1jO88ALib2wPeN1FBV
	eBxLWj1s79DI0Y6F9w9HKfow6dBG7IUkWGNBpv8G6Rrvh/+p8gbBA1Zh0QBu4X/kNYOTVi0jHQC9R
	iqkX5Ys1pcuLHaYcvzo3yGp0w/ODkBcG/Zc5vzXIWxooYHnEYtA6sTicYlyL/EM+RiIpjQcxQK+NH
	gmwNXrIa4rAHp4lVL2s0pLFtaqSkzX+oUdnDnO4FhBkmDrFqfRNT0x09hLDld2G0ArhAetdFM20rB
	KyKWlbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNsN-0000000D9EF-0vjx;
	Tue, 20 May 2025 14:23:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNoi-0000000D8bg-3jz2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:19:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42A9044CBF;
	Tue, 20 May 2025 14:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D321BC4CEE9;
	Tue, 20 May 2025 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747750780;
	bh=IhI7l0xll5O16+UQEAHx7/Spa+EO1wPRI2Jo0GWGLO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PY7Kpq/DkMUxa0RJK1glOHkLQ0yju+gu+78/ONN5U2/iZPdJAkr7v2gQtDQI3Vy0P
	 C85Xph9xpGhxuZ4G11BAJsEckSnQNki90dbSESkQe9owE0DWADkb0/saqhGg1bA87V
	 ir1rUJTBccUVYCAuABeX3MMt9oAkmjz+EHbHhOn4EFsIJBEuQoMjunVKuxPW9IB3K9
	 gptP2JYxxjjFVpf6370gNVBibQnXxw+tAf8p6goxp4RXNr8upbBGd0HbvYJU/dcphg
	 FnfELYEzZl9tqKs0i93aOB0qO5iVsaxdAf7o+99Y7ERWHXkTu/dqPXr38c9SSopNrv
	 LGrQTNW8HJfhQ==
Date: Tue, 20 May 2025 15:19:34 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 2/7] iommu/arm-smmu: Move handing of RESUME to the
 context fault handler
Message-ID: <20250520141933.GD18711@willie-the-truck>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
 <20250515-msm-gpu-fault-fixes-next-v6-2-4fe2a583a878@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-2-4fe2a583a878@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_071940_974987_D65A8791 
X-CRM114-Status: GOOD (  29.89  )
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

On Thu, May 15, 2025 at 03:58:44PM -0400, Connor Abbott wrote:
> The upper layer fault handler is now expected to handle everything
> required to retry the transaction or dump state related to it, since we
> enable threaded IRQs. This means that we can take charge of writing
> RESUME, making sure that we always write it after writing FSR as
> recommended by the specification.
> 
> The iommu handler should write -EAGAIN if a transaction needs to be
> retried. This avoids tricky cross-tree changes in drm/msm, since it
> never wants to retry the transaction and it already returns 0 from its
> fault handler. Therefore it will continue to correctly terminate the
> transaction without any changes required.
> 
> devcoredumps from drm/msm will temporarily be broken until it is fixed
> to collect devcoredumps inside its fault handler, but fixing that first
> would actually be worse because MMU-500 ignores writes to RESUME unless
> all fields of FSR (except SS of course) are clear and raises an
> interrupt when only SS is asserted. Right now, things happen to work
> most of the time if we collect a devcoredump, because RESUME is written
> asynchronously in the fault worker after the fault handler clears FSR
> and finishes, although there will be some spurious faults, but if this
> is changed before this commit fixes the FSR/RESUME write order then SS
> will never be cleared, the interrupt will never be cleared, and the
> whole system will hang every time a fault happens. It will therefore
> help bisectability if this commit goes first.
> 
> I've changed the TBU path to also accept -EAGAIN and do the same thing,
> while keeping the old -EBUSY behavior. Although the old path was broken
> because you'd get a storm of interrupts due to returning IRQ_NONE that
> would eventually result in the interrupt being disabled, and I think it
> was dead code anyway, so it should eventually be deleted. Note that
> drm/msm never uses TBU so this is untested.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 +++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 14 --------------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 ++++++
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 548783f3f8e89fd978367afa65c473002f66e2e7..3e0c2c7c639b0c09243578ebb95129398c630ef2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -406,6 +406,12 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>  			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
>  
>  		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> +
> +		if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
> +			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
> +					  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
> +		}
> +
>  		return IRQ_HANDLED;
>  	}
>  
> @@ -416,6 +422,9 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>  	if (!tmp || tmp == -EBUSY) {
>  		ret = IRQ_HANDLED;
>  		resume = ARM_SMMU_RESUME_TERMINATE;
> +	} else if (tmp == -EAGAIN) {
> +		ret = IRQ_HANDLED;
> +		resume = 0;
>  	} else {
>  		phys_addr_t phys_atos = qcom_smmu_verify_fault(smmu_domain, cfi.iova, cfi.fsr);

Hrm, this debug stuff looks like it could use some clean-up. Not for
this series, but I may have a quick look on top...

Will

