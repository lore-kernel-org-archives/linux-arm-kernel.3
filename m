Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCF3C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxKD6MZV0cczvzvcQ3dRZVhm2UVoyxFi9Xx/3Aaxtk0=; b=gXqZHYeGbznORDcy9NzEOvRzPW
	KWcnol5us/ZDvXJZrg4INcUPon4CLXloNch3s4pxwXwu7FY6XLu5ZgDtE0+wlhXu5k9R9BpNJ3FL7
	OBeFscDsTNVKmZb4BisB3tY+t0E+bkI1mT+gu8BSWuOJ9f6X8lCGOOdDwMF8a1sMB+zQk7kBLzv4E
	+qrbL+e+NK5+bkq9lRcTJ3CdAO8QS3tIO741Q1ssncQdNK0fDIaOogMLgMjb857dlwU2lJi3IDFUP
	rWzmz4hmeiqfBSjKdKnddfd5DH1lVj6RHebcUiB2dUMEiafiiZanFCNk/62uqyVqDSgkmyEUn7kWv
	qo8885AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4S0-0000000DFw7-1cQk;
	Fri, 25 Sep 2026 11:50:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Ry-0000000DFva-0nBU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 11:50:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF234169C;
	Fri, 25 Sep 2026 04:50:40 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1F353F86F;
	Fri, 25 Sep 2026 04:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790337044; bh=QVCeiKaLLsWqFAAQeL9n0+h8tt+vp+tZtOpFNlQ3uRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SvrqnLBui3M+PrATNF/BP/rA6CJ5DGdYxCAJft3/xiR14cPQcEvRfcJIPsSQxAGoz
	 xIKuAjGm0HQCK6kPgoni6UCZ1QNEdGsGP+fTEzNiH6+GqVN89AsMVcJTvbkoe2PWbl
	 r0s5D58XQ2hSGXwtCFtmPqkU+U66vuwoEOVWS70Q=
Date: Fri, 25 Sep 2026 12:50:38 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v19 4/7] firmware: arm_rmm: Add support for SRO
Message-ID: <arZgDmHV8uK1kv8R@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-5-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924135201.850038-5-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_045046_322714_E3308E03 
X-CRM114-Status: GOOD (  18.76  )
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

On Thu, Sep 24, 2026 at 02:51:58PM +0100, Suzuki K Poulose wrote:
> +static int rmi_sro_donate_contig(struct rmi_sro_state *sro,
> +				 unsigned long sro_handle,
> +				 unsigned long donatereq,
> +				 struct arm_smccc_1_2_regs *out_regs,
> +				 gfp_t gfp)
> +{
> +	unsigned long block_size_fld = RMI_DONATE_BLOCK_SIZE(donatereq);
> +	unsigned long block_size = rmi_addr_block_size_to_bytes(block_size_fld);
> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
> +	unsigned long state = RMI_DONATE_STATE(donatereq);
> +	unsigned long size = block_size * count;
> +	unsigned long addr_range;
> +	unsigned long donated_granules;
> +	unsigned long donated_size;
> +	int ret;
> +	void *virt;
> +	phys_addr_t phys;
> +
> +	/*
> +	 * The RMM specification requires contiguous allocations are always a
> +	 * power of 2
> +	 */
> +	if (WARN_ON_ONCE(!is_power_of_2(size)))
> +		return -EINVAL;
> +
> +	/* Reuse the cached address range if we have one */
> +	for (int i = 0; i < sro->addr_count; i++) {
> +		unsigned long entry = sro->addr_list[i];
> +
> +		if (RMI_ADDR_RANGE_BLOCK_SIZE(entry) == block_size_fld &&
> +		    RMI_ADDR_RANGE_COUNT(entry) == count &&
> +		    RMI_ADDR_RANGE_STATE(entry) == state &&
> +		    IS_ALIGNED(RMI_ADDR_RANGE_ADDR(entry), size)) {
> +			sro->addr_count--;
> +			swap(sro->addr_list[sro->addr_count],
> +			     sro->addr_list[i]);
> +
> +			goto mem_donate;
> +		}
> +	}
> +
> +	ret = rmi_sro_ensure_capacity(sro, 1);
> +	if (ret)
> +		return ret;
> +
> +	virt = alloc_pages_exact(size, gfp);
> +	if (!virt)
> +		return -ENOMEM;
> +	phys = virt_to_phys(virt);
> +
> +	if (state == RMI_OP_MEM_DELEGATED) {
> +		phys_addr_t delegated_phys;
> +
> +		if (rmi_delegate_range(phys, size, &delegated_phys)) {
> +			if (!rmi_undelegate_range(phys, delegated_phys - phys))
> +				free_pages_exact(virt, size);
> +			return -ENXIO;
> +		}
> +	}
> +
> +	addr_range = phys & RMI_ADDR_RANGE_ADDR_MASK;
> +	FIELD_MODIFY(RMI_ADDR_RANGE_BLOCK_SIZE_MASK, &addr_range, block_size_fld);
> +	FIELD_MODIFY(RMI_ADDR_RANGE_COUNT_MASK, &addr_range, count);

Courtesy of an LLM - if we get a contiguous/4K pages request for 4MB
(1024 pages), the above 10-bit field becomes 0. Should we reject the
request or the updated spec will guarantee this won't happen?

Somewhat related, with RMI_BLOCK_L2 or higher and appropriate count we
can easily go over the MAX_PAGE_ORDER allocation and fail alloc_pages()
(the contig case). IIUC, the kernel can reject the donation but current
TF-RMM does not report RMI_OP_CAN_CANCEL (R_SZVNK says it can be
cancelled). It gets complicated if we want to support large contiguous
allocations here (e.g. alloc_contig_pages() can sleep). I'd rather just
cancel the request, not support such large sizes.

[...]

> +static int rmi_sro_donate_noncontig(struct rmi_sro_state *sro,
> +				    unsigned long sro_handle,
> +				    unsigned long donatereq,
> +				    struct arm_smccc_1_2_regs *out_regs,
> +				    gfp_t gfp)
> +{
> +	unsigned long block_size_fld = RMI_DONATE_BLOCK_SIZE(donatereq);
> +	unsigned long block_size = rmi_addr_block_size_to_bytes(block_size_fld);
> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
> +	unsigned long state = RMI_DONATE_STATE(donatereq);
> +	unsigned long found = 0;
> +	unsigned long donated_granules;
> +	unsigned long granules_per_block = block_size >> PAGE_SHIFT;
> +	unsigned long consumed_blocks;
> +	int addr_list_start = sro->addr_count;
> +	int ret, i;

[...]

> +	for (int i = 0, src = addr_list_start + consumed_blocks;

Nit: we have 'int ret, i' earlier already, so you can drop the 'int'
here.

[...]

> +/*
> + * rmi_sro_execute: Execute an RMI command that is Stateful but not memory
> + * tranfserring. Takes regs, filled with the FIDs and the arguments in place.
> + *
> + * Returns :
> + *  -ECANCELLED - If the operation had to be aborted and SRO was cancellable.

Nit: -ECANCELED.

> + *  Otherwise, returns the result of the RMI command.
> + */
> +long rmi_sro_execute(struct arm_smccc_1_2_regs *regs)
> +{
> +	bool cancelled = false;
> +	unsigned long sro_handle = regs->a1;
> +
> +	rmi_smccc_invoke(regs);
> +
> +	sro_handle = regs->a1;

Nit: drop the first initialisation maybe?

-- 
Catalin

