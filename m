Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0432E83EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 08:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJvGt7s8JNtP3SsZ3S09HKPpVrd466t4v0LgkkRbzps=; b=zA58eF4mulfcZoVn42QeRRiyk8
	xewnnbnmZTs0A2A2+jPlXnZckDLDh4ilPjM3xJAqyLDpgBh4vxfYr30kyLFAh6HVLO2NrNojUWq5d
	2PaZspiJt/lEaX6Yto6ClaN0AlF7ebzil3fbB2B4U3XeNlRUcxxLGRnTSDSa/9fnNtQBqJPcZDR/y
	Wny/igHtH89WFepgI0xh0ksKJf+8s5NuMBxGKCb12zRmozHhDSEtCDZGA5XzZBR3//RrL3HSPZJAu
	/LDgRBG7vlnRUcZufQXsv5+bvPn4LHC5r563y0SSLmP9kP6pe3OW98s6bd4DJIw1CkKJxXr+YW50M
	YJ8cd/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYIF-0000000872X-0BjR;
	Wed, 04 Feb 2026 08:31:23 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYI6-000000086ZJ-1rry
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 08:31:19 +0000
Message-ID: <3f88cd49-68f1-4276-a067-b7c6beadb27c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770193746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJvGt7s8JNtP3SsZ3S09HKPpVrd466t4v0LgkkRbzps=;
	b=ozkXa3oRSqL0pW6TZmVec7dzzDltMBrBxgtPsbRrpkqaxkwxYhT4d29cvEPDbyN7trAdBR
	NgULJ6hqoKqhEMhjpdn1Q7jx3QjfMzCl5ffzYqrZpwwwZsJol11tJ5L0/AeZ8LmC1AXSv0
	KFerAdFSk6IOSNvoHurxVupZFuuHYMU=
Date: Wed, 4 Feb 2026 16:28:57 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3 02/16] KVM: arm64: nv: Implement nested Stage-2 page
 table walk logic
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 wanghaibin.wang@huawei.com
References: <20240614144552.2773592-1-maz@kernel.org>
 <20240614144552.2773592-3-maz@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20240614144552.2773592-3-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_003115_057755_29FDBA59 
X-CRM114-Status: GOOD (  23.62  )
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

Hi Marc,

[ chewing through the NV code.. ;-) ]

On 6/14/24 10:45 PM, Marc Zyngier wrote:
> From: Christoffer Dall <christoffer.dall@linaro.org>
> 
> Based on the pseudo-code in the ARM ARM, implement a stage 2 software
> page table walker.

[...]

> +static u32 compute_fsc(int level, u32 fsc)
> +{
> +	return fsc | (level & 0x3);
> +}
> +
> +static int get_ia_size(struct s2_walk_info *wi)
> +{
> +	return 64 - wi->t0sz;
> +}
> +
> +static int check_base_s2_limits(struct s2_walk_info *wi,
> +				int level, int input_size, int stride)
> +{
> +	int start_size, ia_size;
> +
> +	ia_size = get_ia_size(wi);
> +
> +	/* Check translation limits */
> +	switch (BIT(wi->pgshift)) {
> +	case SZ_64K:
> +		if (level == 0 || (level == 1 && ia_size <= 42))

It looks broken as the pseudocode checks the limits based on
*implemented PA size*, rather than on ia_size, which is essentially the
input address size (64 - T0SZ) programmed by L1 hypervisor. They're
different.

We can probably get the implemented PA size by:

AArch64.PAMax()
{
	parange = get_idreg_field_enum(kvm, ID_AA64MMFR0_EL1, PARANGE);
	return id_aa64mmfr0_parange_to_phys_shift(parange);
}

Not sure if I've read the spec correctly.

> +			return -EFAULT;
> +		break;
> +	case SZ_16K:
> +		if (level == 0 || (level == 1 && ia_size <= 40))
> +			return -EFAULT;
> +		break;
> +	case SZ_4K:
> +		if (level < 0 || (level == 0 && ia_size <= 42))
> +			return -EFAULT;
> +		break;
> +	}
> +
> +	/* Check input size limits */
> +	if (input_size > ia_size)

This is always false for the current code. ;-)

> +		return -EFAULT;
> +
> +	/* Check number of entries in starting level table */
> +	start_size = input_size - ((3 - level) * stride + wi->pgshift);
> +	if (start_size < 1 || start_size > stride + 4)
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +/* Check if output is within boundaries */
> +static int check_output_size(struct s2_walk_info *wi, phys_addr_t output)
> +{
> +	unsigned int output_size = wi->max_oa_bits;
> +
> +	if (output_size != 48 && (output & GENMASK_ULL(47, output_size)))
> +		return -1;
> +
> +	return 0;
> +}
> +
> +/*
> + * This is essentially a C-version of the pseudo code from the ARM ARM
> + * AArch64.TranslationTableWalk  function.  I strongly recommend looking at
> + * that pseudocode in trying to understand this.
> + *
> + * Must be called with the kvm->srcu read lock held
> + */
> +static int walk_nested_s2_pgd(phys_addr_t ipa,
> +			      struct s2_walk_info *wi, struct kvm_s2_trans *out)
> +{
> +	int first_block_level, level, stride, input_size, base_lower_bound;
> +	phys_addr_t base_addr;
> +	unsigned int addr_top, addr_bottom;
> +	u64 desc;  /* page table entry */
> +	int ret;
> +	phys_addr_t paddr;
> +
> +	switch (BIT(wi->pgshift)) {
> +	default:
> +	case SZ_64K:
> +	case SZ_16K:
> +		level = 3 - wi->sl;
> +		first_block_level = 2;
> +		break;
> +	case SZ_4K:
> +		level = 2 - wi->sl;
> +		first_block_level = 1;
> +		break;
> +	}
> +
> +	stride = wi->pgshift - 3;
> +	input_size = get_ia_size(wi);
> +	if (input_size > 48 || input_size < 25)
> +		return -EFAULT;
> +
> +	ret = check_base_s2_limits(wi, level, input_size, stride);
> +	if (WARN_ON(ret))
> +		return ret;
> +
> +	base_lower_bound = 3 + input_size - ((3 - level) * stride +
> +			   wi->pgshift);
> +	base_addr = wi->baddr & GENMASK_ULL(47, base_lower_bound);
> +
> +	if (check_output_size(wi, base_addr)) {
> +		out->esr = compute_fsc(level, ESR_ELx_FSC_ADDRSZ);

With a wrongly programmed base address, we should report the ADDRSZ
fault at level 0 (as per R_BFHQH and the pseudocode). It's easy to fix.

> +static void vtcr_to_walk_info(u64 vtcr, struct s2_walk_info *wi)
> +{
> +	wi->t0sz = vtcr & TCR_EL2_T0SZ_MASK;
> +
> +	switch (vtcr & VTCR_EL2_TG0_MASK) {
> +	case VTCR_EL2_TG0_4K:
> +		wi->pgshift = 12;	 break;
> +	case VTCR_EL2_TG0_16K:
> +		wi->pgshift = 14;	 break;
> +	case VTCR_EL2_TG0_64K:
> +	default:	    /* IMPDEF: treat any other value as 64k */
> +		wi->pgshift = 16;	 break;
> +	}
> +
> +	wi->sl = FIELD_GET(VTCR_EL2_SL0_MASK, vtcr);
> +	/* Global limit for now, should eventually be per-VM */
> +	wi->max_oa_bits = min(get_kvm_ipa_limit(),
                              ^^^

Should we use AArch64.PAMax() instead? As the output address size is
never larger than the implemented PA size.

Now I'm wondering if we can let kvm_get_pa_bits() just return PAMax for
(based on the exposed (to-L1) AA64MFR0.PARange value) and use it when
possible.

Thanks,
Zenghui

