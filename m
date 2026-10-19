Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5161CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvNBlD/JZ8hRBqmq1fD5HU1ZQqr0SeMst3WentULn88=; b=QVGiwzPK3QdZ+nSGqqhIzOevm4
	LXUzCFbLg4ljbqmGln8UCYDarOd6eh4haPeyF1VQJcFTQs46sRP0moBq13ibG/Bat1mQH/XWmp0xl
	Ve58mPtuMm7KD9FMuIvcDSYN4norcIdBCerZT1SSZAuGO9oGwaIll/iDaNdQoqDT72sfDsYTymhvg
	gVWGCEky/wYj3aNQ2sI5duMHLeGSn3ZU2IgEsuEKXLEb/JC/I5wRJQZij3s/RwBkN6lSoi8Ld5HX5
	w3v6OF0Fe1DTVrzUqakxSJPac7sDM32NP0JXpNEIvprKSwbf7u9X2VVaPlw2Z3jc96Eq1M4bBB2wJ
	FCleyyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkC1-000000075iu-1pLY;
	Mon, 19 Oct 2026 10:02:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkBi-000000075f4-3GDp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:02:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so8684925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 03:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792404107; x=1793008907; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JvNBlD/JZ8hRBqmq1fD5HU1ZQqr0SeMst3WentULn88=;
        b=czGtJgvH7L9JQnhz5RbmoNqqSbYDTqmf74bakPpr6OtCcK5+H5/bZ9bDoZ5/p2yJE2
         k5lUdLY+a3V/uXy7HeDK1k2yFXPpL2b26tRV98DWHaNI1N5lIgNzrK9r5SOekEPeaRli
         egkS8TDTONVKuxvHAXndv5K4M+nTNZl4MZEzMdh5brqrB+0vbs+isSo51wU4/09tUJoG
         TOFVit826a0q53S0nE3O1kgotb6iXevV7BMIGXEvOxFDPwdg8vM/cXj1sCBsgdeJWsEG
         1o0ycXZ2MPZB62nCS2wCjhP2mWSanSJ6Wuegj85pqsPmn8I84ferTQCZLWcnxyUUNBOH
         EONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404107; x=1793008907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvNBlD/JZ8hRBqmq1fD5HU1ZQqr0SeMst3WentULn88=;
        b=CqlykdlW1SdbVHH5BVN5H30VleOZjlfaCShGS2dctGGtye58Z/iErBG+4BUAe1RNbg
         +jzHJa7d/ipjpgPQFUmMfWqk3aWlhlEqR8e5KHzQzZxHu6I2V3oPcpG9dhhGJf2g6T7Z
         gUoxuaW3DpBNEp1WZSy04LuVAuZNaaueTaXxQD/bPazmynauv+bjn70AFxpWlTjREORn
         hTa+ViaXxowTVlkk9K745N/SOp04J8Ys4fXplFov0sPu/PX4KMn2z0AcAOSGbG9gL7gL
         911gC7DD4AtZHuV9s2NTzlZCJg/DddUMvzq+Xlpv7hQMrsMFeCVlQ0DK24af8hqXK6oi
         yXJA==
X-Forwarded-Encrypted: i=1; AKwUvBwC9Wx9ep0bmSeX6STUp6A109sSTiRzR3i+hrLH0nlQ7xgMg/iCAJisUqn7UemJgGZh5V328kvlky08B/JtDC7U@lists.infradead.org
X-Gm-Message-State: AFq9FYKyow9saYv9LFGkXmUcbo5a1dR82Kn5o2sEwyOaacCmkiAiT7j9
	+n9RjgmlQ0IEGeREUqQINx9t8gXWz3EHbTVEFhL3nzt0EZ+I+5art96bT70vV+CcxA==
X-Gm-Gg: AYBFou3Xhal65GYAmad3VWUB8sOOld3/JggoK4gercwY7kIPmBYpEzTq3AkjhdvpDa3
	jqYeGjAvZN/q/+kTkPmGrZeXUosBWSBCXk00DdqbpH5Zt0wHq8T7Hgt0eqFV/jfoKu0Us0avfqr
	5PWo6yZ0LtRT3zWFo0xuuGDWb4p0cktlnhUO4Gu69H90RAEFAgk4tgQ4dgs1bEwgHlmLFoO8Wmg
	nk1LXONFv3lUrELuDfkoAh7438Y4/YuGIGhHPJcIsgklvKfIobW5X8GJ1kSm/ArnwG1Y5h0sNo3
	m+o+wy7hVyG4YNkqUDZW+1C7kj+UHz8XXHoLCAdeToOVz9+Zb9NwuIm3kbjWWoJlU3EVdi5kMaK
	sHZ7tOc7KbuWFBU5b5qjutQp2M5MyUfXuTjemQ9ra/i1u2WyVVeHjcNdu38AzoajftnFWT4mfU1
	l4SnNoHa1fWDTOSGwXUC+fpLjM2aNGFHakPkJgk6KbXLKYBACV1hYKemxneDtZvezSqaoLRHHMC
	E2WtKFeqUBE9kos/ESe3y0qGtmcjK4e45wqRWvClAk=
X-Received: by 2002:a05:600c:674f:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a1d75fce45mr143600135e9.14.1792404021999;
        Mon, 19 Oct 2026 03:00:21 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d85f92d9sm190610495e9.4.2026.10.19.03.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:00:19 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:00:15 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Ensure TLBs and I-cache are private to
 each vCPU in pKVM
Message-ID: <atXqLxU5bBtJ8U9W@google.com>
References: <20261014125510.2928306-1-fuad.tabba@linux.dev>
 <20261014125510.2928306-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014125510.2928306-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030150_858386_1DBB3230 
X-CRM114-Status: GOOD (  29.79  )
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

On Wed, Oct 14, 2026 at 01:55:10PM +0100, Fuad Tabba wrote:
> All vCPUs of a VM share its VMID, so KVM flushes a physical CPU's TLBs
> and I-cache for the VM whenever a different vCPU of that VM is loaded
> there (vcpu_prepare_mmu()). Commit fce886a602073 ("KVM: arm64: Plumb the
> pKVM MMU in KVM") moved pKVM guests, protected or not, onto the
> hypervisor's stage-2 and VMID, and the host stopped flushing for them.
> Nothing at EL2 flushes instead, so a vCPU can hit TLB and I-cache
> entries that another vCPU of the same VM left on that CPU.
> 
> Track the last vCPU loaded on each physical CPU in the hyp VM, and flush
> at EL2 in __pkvm_vcpu_load() when it changes.
> 
> Fixes: fce886a602073 ("KVM: arm64: Plumb the pKVM MMU in KVM")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 +++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  8 ++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 21 ++++++++++++++++++---
>  3 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index 9abfe6b7e942b..02c8fc7a10904 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -54,6 +54,9 @@ struct pkvm_hyp_vm {
>  	unsigned short refcount;
>  	hyp_spinlock_t lock;
>  
> +	/* Per physical CPU, the vcpu_idx of the last vCPU of this VM loaded there. */
> +	int *last_vcpu_ran;

Unlikely to be a problem in pratice, but vcpu_idx is "unsigned int". I wonder if
this shouldn't be unsigned int here too and initialised to UINT_MAX?

> +
>  	/*
>  	 * The vCPU initialised RUNNABLE: claimed under vm_table_lock,
>  	 * released only if its own init fails.
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index d715aa942577e..f0b77236c871e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -827,11 +827,19 @@ DEFINE_KVM_HOST_HCALL(void, __pkvm_vcpu_load,
>  	pkvm_handle_t, handle, unsigned int, vcpu_idx, u64, hcr_el2)
>  {
>  	struct pkvm_hyp_vcpu *hyp_vcpu;
> +	int *last_ran;
>  
>  	hyp_vcpu = pkvm_load_hyp_vcpu(handle, vcpu_idx);
>  	if (!hyp_vcpu)
>  		return;
>  
> +	/* TLBs and I-cache are private to each vCPU, see vcpu_prepare_mmu(). */
> +	last_ran = &pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu)->last_vcpu_ran[hyp_smp_processor_id()];
> +	if (*last_ran != vcpu_idx) {
> +		__kvm_flush_cpu_context(hyp_vcpu->vcpu.arch.hw_mmu);
> +		*last_ran = vcpu_idx;
> +	}
> +
>  	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
>  		u64 dfr0 = read_sysreg(id_aa64dfr0_el1);
>  
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index ac020d0501d2e..f18fa762746c9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -489,10 +489,11 @@ static void unpin_host_vcpus(struct pkvm_hyp_vcpu *hyp_vcpus[],
>  }
>  
>  static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
> -			     unsigned int nr_vcpus, pkvm_handle_t handle)
> +			     int *last_vcpu_ran, unsigned int nr_vcpus, pkvm_handle_t handle)
>  {
>  	struct kvm_s2_mmu *mmu = &hyp_vm->kvm.arch.mmu;
>  	int idx = vm_handle_to_idx(handle);
> +	unsigned long cpu;
>  
>  	hyp_vm->kvm.arch.pkvm.handle = handle;
>  
> @@ -512,6 +513,10 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
>  	mmu->vtcr = host_mmu.arch.mmu.vtcr;
>  	mmu->arch = &hyp_vm->kvm.arch;
>  	mmu->pgt = &hyp_vm->pgt;
> +
> +	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
> +		last_vcpu_ran[cpu] = -1;
> +	hyp_vm->last_vcpu_ran = last_vcpu_ran;
>  }
>  
>  static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *host_vcpu)
> @@ -887,6 +892,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, void __kern *pgd_hva)
>  	size_t vm_size, pgd_size;
>  	unsigned int nr_vcpus;
>  	pkvm_handle_t handle;
> +	int *last_vcpu_ran;
>  	void *pgd = NULL;
>  	int ret;
>  
> @@ -915,13 +921,19 @@ int __pkvm_init_vm(struct kvm *host_kvm, void __kern *pgd_hva)
>  		goto err_unpin_kvm;
>  	}
>  
> +	last_vcpu_ran = hyp_alloc(array_size(hyp_nr_cpus, sizeof(*last_vcpu_ran)));
> +	if (!last_vcpu_ran) {
> +		ret = hyp_alloc_errno();
> +		goto err_free_hyp_vm;
> +	}
> +
>  	ret = -ENOMEM;
>  
>  	pgd = map_donated_memory_noclear(pgd_hva, pgd_size);
>  	if (!pgd)
> -		goto err_free_hyp_vm;
> +		goto err_free_last_ran;
>  
> -	init_pkvm_hyp_vm(host_kvm, hyp_vm, nr_vcpus, handle);
> +	init_pkvm_hyp_vm(host_kvm, hyp_vm, last_vcpu_ran, nr_vcpus, handle);
>  
>  	ret = kvm_guest_prepare_stage2(hyp_vm, pgd);
>  	if (ret)
> @@ -938,6 +950,8 @@ int __pkvm_init_vm(struct kvm *host_kvm, void __kern *pgd_hva)
>  	kvm_guest_destroy_stage2(hyp_vm);
>  err_remove_mappings:
>  	unmap_donated_memory(pgd, pgd_size);
> +err_free_last_ran:
> +	hyp_free(last_vcpu_ran);
>  err_free_hyp_vm:
>  	hyp_free(hyp_vm);
>  err_unpin_kvm:
> @@ -1112,6 +1126,7 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>  		hyp_free(hyp_vcpu);
>  	}
>  
> +	hyp_free(hyp_vm->last_vcpu_ran);
>  	hyp_free(hyp_vm);
>  	hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
>  	return 0;
> -- 
> 2.39.5
> 

