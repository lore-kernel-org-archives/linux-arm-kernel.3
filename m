Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F59C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arqFWN4nQQjCPwl8RAe4w0zwDHOl79ODnxqKCgfBmwE=; b=imxwk9J3SsifZSjz3BizyG5Wba
	RX7P4xNC+Cinfh0IIZBsyFrtsWYKt8PhmtSq4sp6jkN/sgd7WPiLdkrrV9fkpLb9ok/mTpYF6qP+Q
	dZOhKoTixf8uUusH18EQJU8+eGxjw9UgrMumighZf29ytwYr7aQrLRPjTNDniiYLc09+v57P1LjEv
	crMt0ic/FpGnHecowqaPw3/4Juj/V05jd2stSn2ZdE7/KGos6fJzWQLOshvbDXYqhQdIi2CwmZLRJ
	9TllhdVfgl+V4asfpbcX814WAL/orKUVe9R83gDawD19H/C0dn1TYtUEr3mNfh+vt9NqQ9u2HAZon
	sl99IFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Eu-00000006brG-0XrO;
	Tue, 11 Mar 2025 18:22:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3zM-00000006YiF-3KAB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 455EB5C1031;
	Tue, 11 Mar 2025 18:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7045AC4CEE9;
	Tue, 11 Mar 2025 18:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716359;
	bh=2l2XhsUVNSUFOt0o115rgFxjPYd6cJC3mPPoy2QKMPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBp//bpjCPjkHJ3ILoEGKodCweFXovgnjhV4rgtptw6/m7Zzj+p53kp6VirBwPjci
	 ViqhpM3WG8v8ETukGo+d+tkJ5+UZrx/2WI4/3npcj7S5hHyFjIpzNk5so1NwKI2SDA
	 56aimhHxBxSfY5fPuF9w8Snvo0ygOn1CHugTZN37xPdvF0uWcL8uBhIu1U1FxIvheX
	 KicV+Z5wY8TTNwCVT+LjSsl22yyuAooJZdrvCII5MOtMqC/SoUF0Fo/Y6YNvIWar96
	 eTO5pXYPd84De8yIqwxuvOB7ohjcXX0sIUdmmxRgQEVGRobJGFII6Cc232+TCNhfyn
	 aMc2Gsa+5e/KQ==
Date: Tue, 11 Mar 2025 18:05:54 +0000
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250311180553.GB5216@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_110600_944878_4607DDF2 
X-CRM114-Status: GOOD (  17.00  )
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

On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> This will be used by drm/msm for GPU page faults, replacing the manual
> register reading it does.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++-----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
>  3 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f539557a39866a932360d4e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>  
>  	if (list_empty(&tbu_list)) {
>  		ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -					 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +					 cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>  
>  		if (ret == -ENOSYS)
>  			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>  	phys_soft = ops->iova_to_phys(ops, cfi.iova);
>  
>  	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +				 cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>  	if (!tmp || tmp == -EBUSY) {
>  		ret = IRQ_HANDLED;
>  		resume = ARM_SMMU_RESUME_TERMINATE;
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
>  				      struct arm_smmu_context_fault_info *cfi)
>  {
>  	cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> +	cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
>  	cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -	cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +	cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +	cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);

We already have an implementation hook (->get_fault_info()) which the
qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
That thing dumps these registers already so if we're moving that into
the core SMMU driver, let's get rid of the hook and move everybody over
rather than having it done in both places.

>  	cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> +	cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);

I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
it for stage-2 domains.

Will

