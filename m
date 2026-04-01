Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EADFF4937
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 03:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTv29Vnp2mYwxve5owJHC/KKzZqLuMvjhSdKDQpyHms=; b=QU+dOctYJzy7hw9qR8wclcAnof
	nWr6F+TmElDYVO5YFgR2jrBkSQkwuaHnfOZfpAN2ixQBg9FWnO+PEs0Q0CLHQsPmCE3Mx0w/uz3/n
	CIMhlrKtROuaCy72PLexGvIAADStP1R5cE+lkH+nax9osQHgCsqPvHqiM76wzR3kwP8nIXRloEzHH
	mm3GUiuhIhF0p/5QCas+CwN5cV8Hp7iOKIbaKpsOrwOMa4f+e8DvnZ3Jq2dCeFl92MapobDOuyz/E
	w+frwsR2IONVuHina8VysqtA+eCTnobgsNe31haOIXymZaJDG525HPK5dlC0USuGejUKehq8hir4p
	uwGtnKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7m61-0000000Dszy-3EKC;
	Wed, 01 Apr 2026 03:18:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7m5z-0000000Dszb-0DkX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 03:18:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC0712E99;
	Tue, 31 Mar 2026 20:18:11 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9313C3F915;
	Tue, 31 Mar 2026 20:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775013497; bh=ffCwt7tLZzRDrhNmFIilVOdNcywEiho2JhdBiZv7pXI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GRP1Cq94GtnROBZ9zfMNV5opZ7cwxhg70F8oVYaFLJq/c4KPnS/dnn7jRp2E1vjIH
	 a3FEnk4RPX2Yr2BsdLpUZm9hEx7JOTWCwJCTPM9VfrCrNH9Ay09Cb63q05hw3QUeba
	 1bxp6gCAzFJ7txvh8b+tpTY9E1pFqKQFSAgPRXoM=
Message-ID: <ee8eaa98-fe0d-4c13-b441-f6e8ba1aac5f@arm.com>
Date: Wed, 1 Apr 2026 08:48:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/30] KVM: arm64: Replace fault_is_perm with a helper
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-18-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-18-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_201819_192991_AB85842D 
X-CRM114-Status: GOOD (  21.28  )
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

On 27/03/26 5:06 PM, Marc Zyngier wrote:
> Carrying a boolean to indicate that a given fault is a permission fault
> is slightly odd, as this is a property of the fault itself, and we'd
> better avoid duplicating state.
> 
> For this purpose, introduce a kvm_s2_fault_is_perm() predicate that
> can take a fault descriptor as a parameter. fault_is_perm is therefore
> dropped from kvm_s2_fault.
> 
> Tested-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/arm64/kvm/mmu.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 09e32f08028e4..1e0d93d6d265a 100644
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


