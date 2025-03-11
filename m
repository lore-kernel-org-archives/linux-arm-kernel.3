Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B69BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Do4V78/vCOEeYvb3/zGwfGgU52BdbHbtNrlRlQ77Omw=; b=fn/fdwoes5FO48lxYb7P5AGCSg
	XmKbYEM/vyVODXWsoyMnKs2hGNIkL2Xc1cRg6Llrc4kQ8eD4mAIPYOVeYuhLFsB/6eRNtxnjZyaSq
	tS4ZIqXbGAE1ZblKYiLO1fohUjfb7i9iAa10zmht3kj1uOJKuPW84mZKiDrHllt7xeakftrf8Wjip
	Xnuh3KrcoQcgpw00qdPAOF96PhHSCiecpGmfCHFCoZsF/axWVAP2KLiaFVfh0SxK0FMVF6Idsu+pf
	bIJBS/VoDX0TsuCsVKFeunueOYp0wT2gsBXC/qXHcyDzluEbXwTjWba8/wsavFljCvOkgglNERxa6
	QA0ggrPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4I9-00000006cMi-04fh;
	Tue, 11 Mar 2025 18:25:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts41X-00000006Z93-0f7n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:08:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C12015C1031;
	Tue, 11 Mar 2025 18:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F234FC4CEE9;
	Tue, 11 Mar 2025 18:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716494;
	bh=etYsz2cyQgiE5xns0t3/s7Ls+X0fhLbE/rB4gyB3lcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AgR4rUzgd/9gtAJnSSxDj0ui8uRMjkM7iiqeBpRb+3xekGWBLH//FenNMJocNXovb
	 e2Hs6lepS57k5SakJTPMdOHvw0WeSGHfY8mCsjGBHJMw5AS60LZWsjiV1r0I+M/ag3
	 zjCQdNEp3+J4yq5dodMHN4l635t5LMb/uvlOg1oZ9hWSKqYofTIgNhMTvio69UXL3c
	 pcE0JCVgRYkfWynuxPrXS5vt7LlueCZ0Szrnsid4JW5qITH5jkDmAJy3Gaeavc19yW
	 OmMdvMnX3N7Hot1Rds09kwylnFMB9CyME7ub13Q0YFhO9FrlNpOsJQ3laoUWtOFLNU
	 V/ePzW8XHQi5g==
Date: Tue, 11 Mar 2025 18:08:08 +0000
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
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
Message-ID: <20250311180807.GC5216@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_110815_307228_1BB862D2 
X-CRM114-Status: GOOD (  19.72  )
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

On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
> In some cases drm/msm has to resume a stalled transaction directly in
> its fault handler. Experimentally this doesn't work on SMMU500 if the
> fault hasn't already been acknowledged by clearing FSR. Rather than
> trying to clear FSR in msm's fault handler and implementing a
> tricky handshake to avoid accidentally clearing FSR twice, we want to
> clear FSR before calling the fault handlers, but this means that the
> contents of registers can change underneath us in the fault handler and
> msm currently uses a private function to read the register contents for
> its own purposes in its fault handler, such as using the
> implementation-defined FSYNR1 to determine which block caused the fault.
> Fix this by making msm use the register values already read by arm-smmu
> itself before clearing FSR rather than messing around with reading
> registers directly.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
>  3 files changed, 27 insertions(+), 27 deletions(-)

[...]

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635efb3968a0bd3ff237 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
>  	ARM_SMMU_DOMAIN_NESTED,
>  };
>  
> +struct arm_smmu_context_fault_info {
> +	unsigned long iova;
> +	u64 ttbr0;
> +	u32 fsr;
> +	u32 fsynr0;
> +	u32 fsynr1;
> +	u32 cbfrsynra;
> +	u32 contextidr;
> +};
> +
>  struct arm_smmu_domain {
>  	struct arm_smmu_device		*smmu;
>  	struct io_pgtable_ops		*pgtbl_ops;
> @@ -380,6 +390,7 @@ struct arm_smmu_domain {
>  	const struct iommu_flush_ops	*flush_ops;
>  	struct arm_smmu_cfg		cfg;
>  	enum arm_smmu_domain_stage	stage;
> +	struct arm_smmu_context_fault_info cfi;

Does this mean we have to serialise all faults for a given domain? That
can't be right...

Will

