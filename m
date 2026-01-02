Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52060FA3753
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBw6jLCJqAbKt1gkP3x7IcMHDaYkQ9qOJdP3tWYRjcc=; b=JKxfUuBFzQgMakXcgU3cLCH7Kw
	VTvwVi99tVVirVNzH1lhLCvr7yJ+pdsXiVi+G/5FkD8DX7jPNJ8kU6Ihv50jX0mCSIvxnUJaUw/OI
	WelDVPTqPSWRMjvWpNhzJxLqe4cBSFM1tUavjMtGB7GYNISBpHIPGV40TgSCtYZoeHYbm11UnuoD6
	vHEFy1f+VR7Bk8NR1dPVk21v9Sa+J/m3Q3VJXmBy4nqKq3sxnuZZGAvE9EU994wGLWE94jrCr/QHU
	kBDI8m5XB+5Ni5v2phiA1yq1F6LDpbzolTXTjBvEPq1WdZTBIZ/wTCpGA2bI2GhE5lRXRZyPM1VA1
	hCIgyCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbihl-00000008YjI-3wCM;
	Fri, 02 Jan 2026 17:12:49 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbihi-00000008Yi7-33qP;
	Fri, 02 Jan 2026 17:12:48 +0000
Date: Fri, 2 Jan 2026 17:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767373964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rBw6jLCJqAbKt1gkP3x7IcMHDaYkQ9qOJdP3tWYRjcc=;
	b=tE3edi5dhKdd1e36NLf+C61+fg98V5chjikLV24JwFiW9GnZCHh5NRwOvEyOW+ozrhieYo
	hHIlCrKKBYF/gSbrNYalY/OPgEJM8dNARujl6Uiuqa5V2geAPoIry9JOrOcH4h/2f3DEhM
	mOCd6qfzfDqEhcx2+z7etRL8NSM+u64=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/21] KVM: selftests: Stop passing VMX metadata to
 TDP mapping functions
Message-ID: <rkbap4vemw6yu52djlg7lerquuhucw3urlvbvfpekfxgnibosf@ijebzfchpulp>
References: <20251230230150.4150236-1-seanjc@google.com>
 <20251230230150.4150236-12-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230230150.4150236-12-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_091247_042689_8B2FF2F2 
X-CRM114-Status: GOOD (  20.00  )
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

On Tue, Dec 30, 2025 at 03:01:40PM -0800, Sean Christopherson wrote:
> From: Yosry Ahmed <yosry.ahmed@linux.dev>
> 
> The root GPA can now be retrieved from the nested MMU, stop passing VMX
> metadata. This is in preparation for making these functions work for
> NPTs as well.
> 
> Opportunistically drop tdp_pg_map() since it's unused.
> 
> No functional change intended.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/include/x86/vmx.h | 11 ++-----
>  .../testing/selftests/kvm/lib/x86/memstress.c | 11 +++----
>  tools/testing/selftests/kvm/lib/x86/vmx.c     | 33 +++++++------------
>  .../selftests/kvm/x86/vmx_dirty_log_test.c    |  9 +++--
>  4 files changed, 24 insertions(+), 40 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
> index 1fd83c23529a..4dd4c2094ee6 100644
> --- a/tools/testing/selftests/kvm/include/x86/vmx.h
> +++ b/tools/testing/selftests/kvm/include/x86/vmx.h
> @@ -557,14 +557,9 @@ bool load_vmcs(struct vmx_pages *vmx);
>  
>  bool ept_1g_pages_supported(void);
>  
> -void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm, uint64_t nested_paddr,
> -		uint64_t paddr);
> -void tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm, uint64_t nested_paddr,
> -	     uint64_t paddr, uint64_t size);
> -void tdp_identity_map_default_memslots(struct vmx_pages *vmx,
> -				       struct kvm_vm *vm);
> -void tdp_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
> -			 uint64_t addr, uint64_t size);
> +void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr, uint64_t size);
> +void tdp_identity_map_default_memslots(struct kvm_vm *vm);
> +void tdp_identity_map_1g(struct kvm_vm *vm,  uint64_t addr, uint64_t size);
>  bool kvm_cpu_has_ept(void);
>  void vm_enable_ept(struct kvm_vm *vm);
>  void prepare_virtualize_apic_accesses(struct vmx_pages *vmx, struct kvm_vm *vm);
> diff --git a/tools/testing/selftests/kvm/lib/x86/memstress.c b/tools/testing/selftests/kvm/lib/x86/memstress.c
> index 00f7f11e5f0e..3319cb57a78d 100644
> --- a/tools/testing/selftests/kvm/lib/x86/memstress.c
> +++ b/tools/testing/selftests/kvm/lib/x86/memstress.c
> @@ -59,7 +59,7 @@ uint64_t memstress_nested_pages(int nr_vcpus)
>  	return 513 + 10 * nr_vcpus;
>  }
>  
> -static void memstress_setup_ept_mappings(struct vmx_pages *vmx, struct kvm_vm *vm)
> +static void memstress_setup_ept_mappings(struct kvm_vm *vm)
>  {
>  	uint64_t start, end;
>  
> @@ -68,16 +68,15 @@ static void memstress_setup_ept_mappings(struct vmx_pages *vmx, struct kvm_vm *v
>  	 * KVM can shadow the EPT12 with the maximum huge page size supported
>  	 * by the backing source.
>  	 */
> -	tdp_identity_map_1g(vmx, vm, 0, 0x100000000ULL);
> +	tdp_identity_map_1g(vm, 0, 0x100000000ULL);
>  
>  	start = align_down(memstress_args.gpa, PG_SIZE_1G);
>  	end = align_up(memstress_args.gpa + memstress_args.size, PG_SIZE_1G);
> -	tdp_identity_map_1g(vmx, vm, start, end - start);
> +	tdp_identity_map_1g(vm, start, end - start);
>  }
>  
>  void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vcpus[])
>  {
> -	struct vmx_pages *vmx;
>  	struct kvm_regs regs;
>  	vm_vaddr_t vmx_gva;
>  	int vcpu_id;
> @@ -87,11 +86,11 @@ void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vc
>  
>  	vm_enable_ept(vm);
>  	for (vcpu_id = 0; vcpu_id < nr_vcpus; vcpu_id++) {
> -		vmx = vcpu_alloc_vmx(vm, &vmx_gva);
> +		vcpu_alloc_vmx(vm, &vmx_gva);
>  
>  		/* The EPTs are shared across vCPUs, setup the mappings once */
>  		if (vcpu_id == 0)
> -			memstress_setup_ept_mappings(vmx, vm);
> +			memstress_setup_ept_mappings(vm);

Oh and if you're feeling nitpicky while applying, I think this call can
actually be moved outside of the loop now, right after vm_enable_ept(),
dropping the whole vcpu_id == 0 special case.

>  
>  		/*
>  		 * Override the vCPU to run memstress_l1_guest_code() which will

