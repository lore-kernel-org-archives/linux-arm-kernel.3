Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0B7103E179
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekNYQr0MspHvgGKGXsBrqosNcU+AIkNIxlLjOM05G1Y=; b=Ov8X6+KlFkpqv5KjpjJ6d8ulZj
	loqISTbkmkcpCKDU1KYjeBXQZf/aMcK4r9/AibveqSsSY3OpX396d+G2WwH6AJfugUUadXozkfAYE
	UTmY/A8sbFKNeqWXrAPsHQt0kLwvERAhC5hSyyRxoNsq4TT4A5LRPnr47Nbm1bX0pv+X57CdDQvey
	dtxQNJHKNr2YhXGmuDXPWNB1GnRjbHNPZECP/r4ZvXS9exNm4T17TTGqrTkxlYQbrM3GKY1FsnCbp
	BfYDloamgOskRPbIdovM8tw74f6qczgn8GFIZ/MAbSZ+fuTR2ilDr+dJD3Jy9BPdbPsk3e6t6kVrY
	7AMtENGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rBN-00000008VLD-18vC;
	Wed, 18 Mar 2026 13:43:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rBK-00000008VKA-2Nj7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:43:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5A1E1BF7;
	Wed, 18 Mar 2026 06:43:22 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BD9C3F73B;
	Wed, 18 Mar 2026 06:43:27 -0700 (PDT)
Date: Wed, 18 Mar 2026 13:43:22 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: Re: [PATCH 04/17] KVM: arm64: Replace fault_is_perm with a helper
Message-ID: <20260318134322.GA3915656@e124191.cambridge.arm.com>
References: <20260316175451.1866175-1-maz@kernel.org>
 <20260316175451.1866175-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316175451.1866175-5-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_064330_722326_1109CF76 
X-CRM114-Status: GOOD (  22.69  )
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

On Mon, Mar 16, 2026 at 05:54:37PM +0000, Marc Zyngier wrote:
> Carrying a boolean to indicate that a given fault is slightly odd,

ESR_ELx_FSC_SLIGHTLY_ODD :D
(probably should be "that a given fault is a permission fault is..")

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> as this is a property of the fault itself, and we'd better avoid
> duplicating state.
> 
> For this purpose, introduce a kvm_s2_fault_is_perm() predicate that
> can take a fault descriptor as a parameter. fault_is_perm is therefore
> dropped from kvm_s2_fault.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/mmu.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 2a7128b8dd14f..1b32f2e6c3e61 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1711,8 +1711,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>  }
>  
>  struct kvm_s2_fault {
> -	bool fault_is_perm;
> -
>  	bool write_fault;
>  	bool exec_fault;
>  	bool writable;
> @@ -1732,6 +1730,11 @@ struct kvm_s2_fault {
>  	vm_flags_t vm_flags;
>  };
>  
> +static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
> +{
> +	return kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> +}
> +
>  static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
>  				     struct kvm_s2_fault *fault)
>  {
> @@ -1888,7 +1891,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>  	if (s2fd->nested)
>  		adjust_nested_exec_perms(kvm, s2fd->nested, &fault->prot);
>  
> -	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
> +	if (!kvm_s2_fault_is_perm(s2fd) && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
>  		/* Check the VMM hasn't introduced a new disallowed VMA */
>  		if (!fault->mte_allowed)
>  			return -EFAULT;
> @@ -1905,6 +1908,7 @@ static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
>  static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  			    struct kvm_s2_fault *fault, void *memcache)
>  {
> +	bool fault_is_perm = kvm_s2_fault_is_perm(s2fd);
>  	struct kvm *kvm = s2fd->vcpu->kvm;
>  	struct kvm_pgtable *pgt;
>  	int ret;
> @@ -1922,7 +1926,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  	 */
>  	if (fault->vma_pagesize == PAGE_SIZE &&
>  	    !(fault->force_pte || fault->s2_force_noncacheable)) {
> -		if (fault->fault_is_perm && fault->fault_granule > PAGE_SIZE) {
> +		if (fault_is_perm && fault->fault_granule > PAGE_SIZE) {
>  			fault->vma_pagesize = fault->fault_granule;
>  		} else {
>  			fault->vma_pagesize = transparent_hugepage_adjust(kvm, s2fd->memslot,
> @@ -1936,7 +1940,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  		}
>  	}
>  
> -	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
> +	if (!fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
>  		sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
>  
>  	/*
> @@ -1944,7 +1948,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  	 * permissions only if fault->vma_pagesize equals fault->fault_granule. Otherwise,
>  	 * kvm_pgtable_stage2_map() should be called to change block size.
>  	 */
> -	if (fault->fault_is_perm && fault->vma_pagesize == fault->fault_granule) {
> +	if (fault_is_perm && fault->vma_pagesize == fault->fault_granule) {
>  		/*
>  		 * Drop the SW bits in favour of those stored in the
>  		 * PTE, which will be preserved.
> @@ -1977,7 +1981,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  	bool write_fault = kvm_is_write_fault(s2fd->vcpu);
>  	bool logging_active = memslot_is_logging(s2fd->memslot);
>  	struct kvm_s2_fault fault = {
> -		.fault_is_perm = perm_fault,
>  		.logging_active = logging_active,
>  		.force_pte = logging_active,
>  		.prot = KVM_PGTABLE_PROT_R,
> -- 
> 2.47.3
> 

