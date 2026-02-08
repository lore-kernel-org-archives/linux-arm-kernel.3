Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D87EF06E1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 18:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAVjMilgP7Cobl7oJaZI+06vjmsSnkfpZXOf2OAmtCE=; b=kJcS4jSNS5dfohrBsO3Ozljjkd
	zA0/D15/v52cGgNJ82ZJQcaHrEaAdTbPBkwiDGz8zhk9Rx4tCZpsnuZ3A+kCQhKgau+m13Qmc1lI2
	RuU/famwxGWROia06NNfEoEmAKb0f9+0jBXv//zcBbZyKGkNTRgcs55IN/vrjUBYAtbbyy12Q+h2Z
	ZzIbq5qWBjium6VCMNJySCJw9FXosL1SC/f9RQ0RHMF3/8+Pzt9pjIs4Owjg2KMSciRqhfXxWczSE
	oWDl02J3OYP5CgyAHHpbftbe9IiVrSaZPxB3eBQlvFBmCNl1UATEvDuNbbFpUhR+KoXaExXxxWu73
	X0WmWAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp9ei-0000000DYZI-3Okg;
	Sun, 08 Feb 2026 18:37:12 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp9ef-0000000DYW6-0rKo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 18:37:10 +0000
Message-ID: <8b5f128c-14e4-4b15-8aba-cf8dfcb51c54@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770575701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAVjMilgP7Cobl7oJaZI+06vjmsSnkfpZXOf2OAmtCE=;
	b=J0VzRsFGlp2mDU0G1ZgNoUq+3/r48SYB8f0iDNGTotmv3sWFca+jZIX+oY7rNhijmoCTKL
	LduWXrma7/3rhVxJLkIpFbipMncRJWxXacsUlcL/mB9yozoM84xZSszAoZO01HCysNHVFa
	ofD7Y1xlFvp3VdQkDMGO70lAFjXIqIs=
Date: Mon, 9 Feb 2026 02:34:53 +0800
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
 <3f88cd49-68f1-4276-a067-b7c6beadb27c@linux.dev>
 <86ms1m9lp3.wl-maz@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <86ms1m9lp3.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_103709_405460_641967A7 
X-CRM114-Status: GOOD (  46.61  )
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

On 2/6/26 7:05 PM, Marc Zyngier wrote:
> On Wed, 04 Feb 2026 08:28:57 +0000,
> Zenghui Yu <zenghui.yu@linux.dev> wrote:
> >
> > Hi Marc,
> >
> > [ chewing through the NV code.. ;-) ]
> 
> You fool! :)
> 
> >
> > On 6/14/24 10:45 PM, Marc Zyngier wrote:
> > > From: Christoffer Dall <christoffer.dall@linaro.org>
> > >
> > > Based on the pseudo-code in the ARM ARM, implement a stage 2 software
> > > page table walker.
> >
> > [...]
> >
> > > +static u32 compute_fsc(int level, u32 fsc)
> > > +{
> > > +	return fsc | (level & 0x3);
> > > +}
> > > +
> > > +static int get_ia_size(struct s2_walk_info *wi)
> > > +{
> > > +	return 64 - wi->t0sz;
> > > +}
> > > +
> > > +static int check_base_s2_limits(struct s2_walk_info *wi,
> > > +				int level, int input_size, int stride)
> > > +{
> > > +	int start_size, ia_size;
> > > +
> > > +	ia_size = get_ia_size(wi);
> > > +
> > > +	/* Check translation limits */
> > > +	switch (BIT(wi->pgshift)) {
> > > +	case SZ_64K:
> > > +		if (level == 0 || (level == 1 && ia_size <= 42))
> >
> > It looks broken as the pseudocode checks the limits based on
> > *implemented PA size*, rather than on ia_size, which is essentially the
> > input address size (64 - T0SZ) programmed by L1 hypervisor. They're
> > different.
> >
> > We can probably get the implemented PA size by:
> >
> > AArch64.PAMax()
> > {
> > 	parange = get_idreg_field_enum(kvm, ID_AA64MMFR0_EL1, PARANGE);
> > 	return id_aa64mmfr0_parange_to_phys_shift(parange);
> > }
> >
> > Not sure if I've read the spec correctly.
> 
> I think that's also the way I read AArch64_S2InvalidSL(), which more
> or less mirrors the above.
> 
> The question is what should we limit it to? Is it PARange, as you
> suggest? Or the IPA range defined by userspace at VM creation (the
> type argument, which ends up in kvm->arch.mmu.pgt->ia_bits)?
> 
> I think this is the former, but we probably also need to handle the
> later on actual access (when reading the descriptor). Failure to read
> the descriptor (because it is outside of a memslot) should result in a
> SEA being injected in the guest.

Yup. Do you suggest something like

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index cdeeb8f09e72..cdd900305047 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -293,8 +293,10 @@ static int walk_nested_s2_pgd(struct kvm_vcpu
*vcpu, phys_addr_t ipa,

 		paddr = base_addr | index;
 		ret = read_guest_s2_desc(vcpu, paddr, &desc, wi);
-		if (ret < 0)
+		if (ret < 0) {
+			out->esr = ESR_ELx_FSC_SEA_TTW(level);
 			return ret;
+		}

 		new_desc = desc;

The current code doesn't specify the FSC when we fail to read the
descriptor.

> >
> > > +			return -EFAULT;
> > > +		break;
> > > +	case SZ_16K:
> > > +		if (level == 0 || (level == 1 && ia_size <= 40))
> > > +			return -EFAULT;
> > > +		break;
> > > +	case SZ_4K:
> > > +		if (level < 0 || (level == 0 && ia_size <= 42))
> > > +			return -EFAULT;
> > > +		break;
> > > +	}
> > > +
> > > +	/* Check input size limits */
> > > +	if (input_size > ia_size)
> >
> > This is always false for the current code. ;-)
> 
> Yup. At least that doesn't introduce any extra bug! :)
> 
> >
> > > +		return -EFAULT;
> > > +
> > > +	/* Check number of entries in starting level table */
> > > +	start_size = input_size - ((3 - level) * stride + wi->pgshift);
> > > +	if (start_size < 1 || start_size > stride + 4)
> > > +		return -EFAULT;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/* Check if output is within boundaries */
> > > +static int check_output_size(struct s2_walk_info *wi, phys_addr_t output)
> > > +{
> > > +	unsigned int output_size = wi->max_oa_bits;
> > > +
> > > +	if (output_size != 48 && (output & GENMASK_ULL(47, output_size)))
> > > +		return -1;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * This is essentially a C-version of the pseudo code from the ARM ARM
> > > + * AArch64.TranslationTableWalk  function.  I strongly recommend looking at
> > > + * that pseudocode in trying to understand this.
> > > + *
> > > + * Must be called with the kvm->srcu read lock held
> > > + */
> > > +static int walk_nested_s2_pgd(phys_addr_t ipa,
> > > +			      struct s2_walk_info *wi, struct kvm_s2_trans *out)
> > > +{
> > > +	int first_block_level, level, stride, input_size, base_lower_bound;
> > > +	phys_addr_t base_addr;
> > > +	unsigned int addr_top, addr_bottom;
> > > +	u64 desc;  /* page table entry */
> > > +	int ret;
> > > +	phys_addr_t paddr;
> > > +
> > > +	switch (BIT(wi->pgshift)) {
> > > +	default:
> > > +	case SZ_64K:
> > > +	case SZ_16K:
> > > +		level = 3 - wi->sl;
> > > +		first_block_level = 2;
> > > +		break;
> > > +	case SZ_4K:
> > > +		level = 2 - wi->sl;
> > > +		first_block_level = 1;
> > > +		break;
> > > +	}
> > > +
> > > +	stride = wi->pgshift - 3;
> > > +	input_size = get_ia_size(wi);
> > > +	if (input_size > 48 || input_size < 25)
> > > +		return -EFAULT;
> > > +
> > > +	ret = check_base_s2_limits(wi, level, input_size, stride);
> > > +	if (WARN_ON(ret))
> > > +		return ret;
> > > +
> > > +	base_lower_bound = 3 + input_size - ((3 - level) * stride +
> > > +			   wi->pgshift);
> > > +	base_addr = wi->baddr & GENMASK_ULL(47, base_lower_bound);
> > > +
> > > +	if (check_output_size(wi, base_addr)) {
> > > +		out->esr = compute_fsc(level, ESR_ELx_FSC_ADDRSZ);
> >
> > With a wrongly programmed base address, we should report the ADDRSZ
> > fault at level 0 (as per R_BFHQH and the pseudocode). It's easy to fix.
> >
> 
> Yup. Although this rule describe S1 rather than S2 (we don't seem to
> have anything saying the same thing for S2), but I expect the
> behaviour to be exactly the same.

The rule does describe s2. :)

R_BFHQH:

" When an Address size fault is generated, the reported fault code
  indicates one of the following:

  If the fault was generated due to the TTBR_ELx used in the translation
  having nonzero address bits above the OA size, then a fault at level
  0. "

where TTBR_ELx is the general name which also applies to VTTBR_EL2.

AArch64.S2Walk also clearly describes this behaviour (I read DDI0478G.b
J1-8122).

> > > +static void vtcr_to_walk_info(u64 vtcr, struct s2_walk_info *wi)
> > > +{
> > > +	wi->t0sz = vtcr & TCR_EL2_T0SZ_MASK;
> > > +
> > > +	switch (vtcr & VTCR_EL2_TG0_MASK) {
> > > +	case VTCR_EL2_TG0_4K:
> > > +		wi->pgshift = 12;	 break;
> > > +	case VTCR_EL2_TG0_16K:
> > > +		wi->pgshift = 14;	 break;
> > > +	case VTCR_EL2_TG0_64K:
> > > +	default:	    /* IMPDEF: treat any other value as 64k */
> > > +		wi->pgshift = 16;	 break;
> > > +	}
> > > +
> > > +	wi->sl = FIELD_GET(VTCR_EL2_SL0_MASK, vtcr);
> > > +	/* Global limit for now, should eventually be per-VM */
> > > +	wi->max_oa_bits = min(get_kvm_ipa_limit(),
> >                               ^^^
> >
> > Should we use AArch64.PAMax() instead? As the output address size is
> > never larger than the implemented PA size.
> >
> > Now I'm wondering if we can let kvm_get_pa_bits() just return PAMax for
> > (based on the exposed (to-L1) AA64MFR0.PARange value) and use it when
> > possible.
> 
> Yes, that was the plan all along, but I got sidetracked.

OK. The concern is that PARange is writable from userspace,
init_nested_s2_mmu() can not get a fixed PAMax vaule (kvm_get_pa_bits())
until AA64MMFR0_EL1 has became immutable (i.e., VM has started).

I need to think it over.

Thanks,
Zenghui

