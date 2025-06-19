Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AD2C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L14MhPCmJwLjnWpqDBJd3xLI0/88Q79lN1jAxvvwTio=; b=LynurcGqU8+s616KL2hbv5bCQo
	BcQteZmnQVBZNO4eaE4x6KJCP4xZ9aqh0HSOvkqpBW336AB5WErYTcz9+87bZwRipGs6t6nOwynFW
	RrFj8z/2FbBxs/x+IoC6t7reuKvIUF8BQDMAbdPvvYbt9Zd44Fue+/sT8dbpapIveDvdxVd8W7yOq
	lkApJvJOXiV6RDQ/ySw2jra04Vxel7Xwhg2Cemt1ii+WwvEsUxAIYfUhRLv3AIBT5Wdyi+Gov1Nyt
	59d5PJ8ZlF8IT7aXjUcAwo2K0w6RWmmcNjy5o8svB31xlll6MSlQ79aNizWZKNmg7DmWVYg4kG8g+
	bn4N/9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHSe-0000000DTJP-2MfH;
	Thu, 19 Jun 2025 15:45:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDiG-0000000Cw1l-3BBM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15657A510DA;
	Thu, 19 Jun 2025 11:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D00C4CEEA;
	Thu, 19 Jun 2025 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750333547;
	bh=vHD3lkaGKBaHMp6CdM1wZKNCsSPyM5DrFzrbeCyGBAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sAQ/3TwkHh4tQny7cI0HaO5x3reXpZGwght1TNFGLHkVqT2VcLfQwYoafTXZdKJ8E
	 pkEwQMfdQXLe9JopRJuwqPlDxDGVzpMStLRBs+PzCYRKs2iR7Tg48zGsuYtVaR1XMK
	 P/U2Rohl3rmIQPiwEa70bQ3kqvJIz9Xbg8QHgFWkwfXfP1N8Cutc0AHM/HrVFk2qYD
	 LQ5UZeix+K8IGaOplmtbU8EyaB2TDRexl+WovO2T/vvpbwxuxsvsESbp5bDJSesFrT
	 9RgAJDhuRJxatju67tTg932hwF/eHBvcS+QL/D3qKE0lA7w1iyk458gB3R9tpDEqNn
	 HwWiUp9bNwWyg==
Date: Thu, 19 Jun 2025 17:01:30 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Joao Martins <joao.m.martins@oracle.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 17/62] KVM: SVM: Add enable_ipiv param, never set
 IsRunning if disabled
Message-ID: <2eqjnjnszlmhlnvw6kcve4exjnpy7skguypwtmxutb2gecs3an@gcou53thsqww>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-19-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-19-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_044548_938147_D10CEC27 
X-CRM114-Status: GOOD (  33.67  )
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

On Wed, Jun 11, 2025 at 03:45:20PM -0700, Sean Christopherson wrote:
> From: Maxim Levitsky <mlevitsk@redhat.com>
> 
> Let userspace "disable" IPI virtualization for AVIC via the enable_ipiv
> module param, by never setting IsRunning.  SVM doesn't provide a way to
> disable IPI virtualization in hardware, but by ensuring CPUs never see
> IsRunning=1, every IPI in the guest (except for self-IPIs) will generate a
> VM-Exit.

I think this is good to have regardless of the erratum. Not sure about VMX,
but does it make sense to intercept writes to the self-ipi MSR as well?

> 
> To avoid setting the real IsRunning bit, while still allowing KVM to use
> each vCPU's entry to update GA log entries, simply maintain a shadow of
> the entry, without propagating IsRunning updates to the real table when
> IPI virtualization is disabled.
> 
> Providing a way to effectively disable IPI virtualization will allow KVM
> to safely enable AVIC on hardware that is susceptible to erratum #1235,
> which causes hardware to sometimes fail to detect that the IsRunning bit
> has been cleared by software.
> 
> Note, the table _must_ be fully populated, as broadcast IPIs skip invalid
> entries, i.e. won't generate VM-Exit if every entry is invalid, and so
> simply pointing the VMCB at a common dummy table won't work.
> 
> Alternatively, KVM could allocate a shadow of the entire table, but that'd
> be a waste of 4KiB since the per-vCPU entry doesn't actually consume an
> additional 8 bytes of memory (vCPU structures are large enough that they
> are backed by order-N pages).
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> [sean: keep "entry" variables, reuse enable_ipiv, split from erratum]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 32 ++++++++++++++++++++++++++------
>  arch/x86/kvm/svm/svm.c  |  2 ++
>  arch/x86/kvm/svm/svm.h  |  8 ++++++++
>  3 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index 0c0be274d29e..48c737e1200a 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -292,6 +292,13 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
>  	/* Setting AVIC backing page address in the phy APIC ID table */
>  	new_entry = avic_get_backing_page_address(svm) |
>  		    AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
> +	svm->avic_physical_id_entry = new_entry;
> +
> +	/*
> +	 * Initialize the real table, as vCPUs must have a valid entry in order
> +	 * for broadcast IPIs to function correctly (broadcast IPIs ignore
> +	 * invalid entries, i.e. aren't guaranteed to generate a VM-Exit).
> +	 */
>  	WRITE_ONCE(kvm_svm->avic_physical_id_table[id], new_entry);
>  
>  	return 0;
> @@ -769,8 +776,6 @@ static int svm_ir_list_add(struct vcpu_svm *svm,
>  			   struct amd_iommu_pi_data *pi)
>  {
>  	struct kvm_vcpu *vcpu = &svm->vcpu;
> -	struct kvm *kvm = vcpu->kvm;
> -	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
>  	unsigned long flags;
>  	u64 entry;
>  
> @@ -788,7 +793,7 @@ static int svm_ir_list_add(struct vcpu_svm *svm,
>  	 * will update the pCPU info when the vCPU awkened and/or scheduled in.
>  	 * See also avic_vcpu_load().
>  	 */
> -	entry = READ_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id]);
> +	entry = svm->avic_physical_id_entry;
>  	if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
>  		amd_iommu_update_ga(entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK,
>  				    true, pi->ir_data);
> @@ -998,14 +1003,26 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  	 */
>  	spin_lock_irqsave(&svm->ir_list_lock, flags);
>  
> -	entry = READ_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id]);
> +	entry = svm->avic_physical_id_entry;
>  	WARN_ON_ONCE(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK);
>  
>  	entry &= ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
>  	entry |= (h_physical_id & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK);
>  	entry |= AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
>  
> +	svm->avic_physical_id_entry = entry;
> +
> +	/*
> +	 * If IPI virtualization is disabled, clear IsRunning when updating the
> +	 * actual Physical ID table, so that the CPU never sees IsRunning=1.
> +	 * Keep the APIC ID up-to-date in the entry to minimize the chances of
> +	 * things going sideways if hardware peeks at the ID.
> +	 */
> +	if (!enable_ipiv)
> +		entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
> +
>  	WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);
> +
>  	avic_update_iommu_vcpu_affinity(vcpu, h_physical_id, true);
>  
>  	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
> @@ -1030,7 +1047,7 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
>  	 * can't be scheduled out and thus avic_vcpu_{put,load}() can't run
>  	 * recursively.
>  	 */
> -	entry = READ_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id]);
> +	entry = svm->avic_physical_id_entry;
>  
>  	/* Nothing to do if IsRunning == '0' due to vCPU blocking. */
>  	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK))
> @@ -1049,7 +1066,10 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
>  	avic_update_iommu_vcpu_affinity(vcpu, -1, 0);
>  
>  	entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
> -	WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);
> +	svm->avic_physical_id_entry = entry;
> +
> +	if (enable_ipiv)
> +		WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);

If enable_ipiv is false, then isRunning bit will never be set and we 
would have bailed out earlier. So, the check for enable_ipiv can be 
dropped here (or converted into an assert).

- Naveen


