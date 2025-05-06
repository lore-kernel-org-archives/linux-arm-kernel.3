Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C73FC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWa1958Ck3Ouke896+A/YePMyR3FUtHokxNwVGKtViw=; b=0QQUyvezHFvaKTGJAAh+K+DjKd
	pFDoQvXgn1GmxmiViILi34/PgFcl8wJBbj87lz9lw7xqX3qoTUwUYICmj4A2O5M3efxy9eJsHroi5
	Wh1iMyP10ROMXV0diJe0+obqkNiN8pR/Xm/5PPW2iShg31PbX62e/P+oAkFp/jB1X79o4EM2SAcAk
	TMqCbHt3gqF0j83h8eQkqI1dhG8hOKwvYXEmOPTKdw1tET3V39pr2bkKMtncP1yOrYCti/U3wNf+b
	qNU3Myp9sCm+eJWXPYsPJw+bQtaPgRA/E8SrPTL3LMiRF3rNGxgU3qMYEkuRDMnq4gV1NaZc7DNm8
	pF1Jwnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKRA-0000000CWxg-0JlE;
	Tue, 06 May 2025 15:42:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHM0-0000000BtXQ-42Am
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 669AA6154C;
	Tue,  6 May 2025 12:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCEEC4CEEE;
	Tue,  6 May 2025 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534296;
	bh=uHFytVThoQE6dUumluQFq3LQiUBoMdRX4mX8c3oM/4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j+35fbHBzNKxob6ajbve9++4e8fpbs6JR0eRq111tR5VN13esZUIzNzg1FBgVP3T+
	 hNdgE+3iiK07JzUljoCZV5tmOCow4qUFHS9KS1bmi4dBTTGgLqa3/N4iMhLVuo2B+2
	 L+gsWTLL5cdUlGMCzPqMYMVJsOJROiqSDURspw2woMSmGFFWGgGNmou9TKzXboevc0
	 qfByVdUPxhAbUYi9KV5fM/cCk0USbLf5qTtt8OHNF4YSkwB8X0+zK8l12RQAkTWcF7
	 awpCxLTZy5t27xW3csBWhG2TSaPtZ2XoybDzTqDNxL5euuaJjSjqs89oRVEXv2X2pz
	 8OoPKtjwDf8WQ==
Date: Tue, 6 May 2025 13:24:50 +0100
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
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Message-ID: <20250506122449.GB723@willie-the-truck>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
> asserts an interrupt. The only way to clear that bit is to resume the
> transaction by writing SMMU_CBn_RESUME, but typically resuming the
> transaction requires complex operations (copying in pages, etc.) that
> can't be done in IRQ context. drm/msm already has a problem, because
> its fault handler sometimes schedules a job to dump the GPU state and
> doesn't resume translation until this is complete.
> 
> Work around this by disabling context fault interrupts until after the
> transaction is resumed. Because other context banks can share an IRQ
> line, we may still get an interrupt intended for another context bank,
> but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
> it assuming that interrupts are disabled which is accomplished by
> removing the bit from ARM_SMMU_CB_FSR_FAULT. SMMU_CBn_FSR.SS won't be
> asserted unless an external user enabled stall-on-fault, and they are
> expected to resume the translation and re-enable interrupts.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> Reviewed-by Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 +++++++++++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
>  3 files changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 186d6ad4fd1c990398df4dec53f4d58ada9e658c..a428e53add08d451fb2152e3ab80e0fba936e214 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -90,12 +90,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>  	struct arm_smmu_domain *smmu_domain = (void *)cookie;
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	u32 reg = 0;
> +	u32 reg = 0, sctlr;
> +	unsigned long flags;
>  
>  	if (terminate)
>  		reg |= ARM_SMMU_RESUME_TERMINATE;
>  
> +	spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
>  	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> +
> +	/*
> +	 * Re-enable interrupts after they were disabled by
> +	 * arm_smmu_context_fault().
> +	 */
> +	sctlr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> +	sctlr |= ARM_SMMU_SCTLR_CFIE;
> +	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
> +
> +	spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
>  }
>  
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e6079edc6393d1938c98 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
>  		return IRQ_NONE;
>  
> +	/*
> +	 * On some implementations FSR.SS asserts a context fault
> +	 * interrupt. We do not want this behavior, because resolving the
> +	 * original context fault typically requires operations that cannot be
> +	 * performed in IRQ context but leaving the stall unacknowledged will
> +	 * immediately lead to another spurious interrupt as FSR.SS is still
> +	 * set. Work around this by disabling interrupts for this context bank.
> +	 * It's expected that interrupts are re-enabled after resuming the
> +	 * translation.

s/translation/transaction/

> +	 *
> +	 * We have to do this before report_iommu_fault() so that we don't
> +	 * leave interrupts disabled in case the downstream user decides the
> +	 * fault can be resolved inside its fault handler.
> +	 *
> +	 * There is a possible race if there are multiple context banks sharing
> +	 * the same interrupt and both signal an interrupt in between writing
> +	 * RESUME and SCTLR. We could disable interrupts here before we
> +	 * re-enable them in the resume handler, leaving interrupts enabled.
> +	 * Lock the write to serialize it with the resume handler.
> +	 */

I'm struggling to understand this last part. If the resume handler runs
synchronously from report_iommu_fault(), then there's no need for
locking because we're in interrupt context. If the resume handler can
run asynchronously from report_iommu_fault(), then the locking doesn't
help because the code below could clear CFIE right after the resume
handler has set it.

I think the broader problem is that we can end up reporting a spurious
fault when the irq is shared between context banks. However, your change
to ARM_SMMU_CB_FSR_FAULT fixes that afaict:

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index ff84ce3b8d8567d3402e945e8277ca2a87df9a4e..5fe8e482457f905529a08aea14ea5656d3e31328 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -214,7 +214,6 @@ enum arm_smmu_cbar_type {
>  					 ARM_SMMU_CB_FSR_TLBLKF)
>  
>  #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
> -					 ARM_SMMU_CB_FSR_SS |		\
>  					 ARM_SMMU_CB_FSR_UUT |		\
>  					 ARM_SMMU_CB_FSR_EF |		\
>  					 ARM_SMMU_CB_FSR_PF |		\

because now any subsequent spurious IRQs will return IRQ_NONE. So I
don't see why we need the locking at all. What am I missing?

Also, I think your change probably exposes a benign bug in the qcom
debug code as qcom_tbu_halt() has the following:

if ((fsr & ARM_SMMU_CB_FSR_FAULT) && (fsr & ARM_SMMU_CB_FSR_SS))
	...

Will

