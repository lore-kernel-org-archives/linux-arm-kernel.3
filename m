Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1596CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXZ7+Ibvsh1cXMBq66vw8RmPmdICgys8MaS/4a4cgSE=; b=p/Bajtzh9dRerAJDiBgh1dpj23
	K8XyM+pm+5Ln82HAN+uPKy4wZSSd9Ww203n5q2RVz15wsGSSDsicZbmUm6cIIHIUXZw70Ii+wWkEt
	Qai29N3X14CTYzkGVpgtlSj2onOlA/zC53Gv+Yq7FJO4a6r/2EAsir7Yf0N8s34c5zERhxVtBGvGQ
	aQaAdKz+mxXpm2rimkjerke2JexQ9mQM0qUL3x44GONJx9Crc4+DiT6sOQro7hEkZXahNLHJrUnSx
	Ey7wRdqKBcLOQiD9nQpVcl2pPZuZV+F6uBDGG7XCwIFLQJobPSYGjnm5yWq4uQLTUyfpUVagfzXd4
	ecJWWxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0B0-0000000F4s5-0hX7;
	Wed, 17 Sep 2025 21:58:58 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0Ax-0000000F4BY-0Rs1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:58:56 +0000
Date: Thu, 18 Sep 2025 06:56:27 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758146199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MXZ7+Ibvsh1cXMBq66vw8RmPmdICgys8MaS/4a4cgSE=;
	b=qNRhO/emD7xbps2428sDp6IrSxnPCufvt9GFU3kcjyRVvZv/+Rh7BH6jm+WQFppq1XLJ99
	jeu17o6yf4WksZPpOza8BduvHVt8qrsQIHmEtKaodDV5fJ1ygRt5yKfxO7wGJJPuZ9AvlU
	N+Npk3U3NqcMV2/RnayFLNRolyP7IMg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Subject: Re: [PATCH 07/13] KVM: arm64: selftests: Provide helper for getting
 default vCPU target
Message-ID: <aMsui6JZ0q1z4pSc@vm4>
References: <20250917212044.294760-1-oliver.upton@linux.dev>
 <20250917212044.294760-8-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917212044.294760-8-oliver.upton@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_145855_296073_5CCF3FD0 
X-CRM114-Status: GOOD (  23.83  )
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

On Wed, Sep 17, 2025 at 02:20:37PM -0700, Oliver Upton wrote:
> The default vCPU target in KVM selftests is pretty boring in that it
> doesn't enable any vCPU features. Expose a helper for getting the
> default target to prepare for cramming in more features. Call
> KVM_ARM_PREFERRED_TARGET directly from get-reg-list as it needs
> fine-grained control over feature flags.
> 
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  tools/testing/selftests/kvm/arm64/psci_test.c   |  2 +-
>  .../testing/selftests/kvm/arm64/smccc_filter.c  |  2 +-
>  .../selftests/kvm/arm64/vpmu_counter_access.c   |  4 ++--
>  tools/testing/selftests/kvm/get-reg-list.c      |  9 ++++++---
>  .../selftests/kvm/include/arm64/processor.h     |  2 ++
>  .../testing/selftests/kvm/lib/arm64/processor.c | 17 +++++++++++------
>  6 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/psci_test.c b/tools/testing/selftests/kvm/arm64/psci_test.c
> index cf208390fd0e..0d4680da66d1 100644
> --- a/tools/testing/selftests/kvm/arm64/psci_test.c
> +++ b/tools/testing/selftests/kvm/arm64/psci_test.c
> @@ -89,7 +89,7 @@ static struct kvm_vm *setup_vm(void *guest_code, struct kvm_vcpu **source,
>  
>  	vm = vm_create(2);
>  
> -	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> +	kvm_get_default_vcpu_target(vm, &init);
>  	init.features[0] |= (1 << KVM_ARM_VCPU_PSCI_0_2);
>  
>  	*source = aarch64_vcpu_add(vm, 0, &init, guest_code);

I wonder if the ioctl() can be called unconditionally in the 
aarch64_vcpu_add() function. If the intention is that the kvm selftest
code needs to write this way I am fine with that.

Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

> diff --git a/tools/testing/selftests/kvm/arm64/smccc_filter.c b/tools/testing/selftests/kvm/arm64/smccc_filter.c
> index eb5551d21dbe..a8e22d866ea7 100644
> --- a/tools/testing/selftests/kvm/arm64/smccc_filter.c
> +++ b/tools/testing/selftests/kvm/arm64/smccc_filter.c
> @@ -64,7 +64,7 @@ static struct kvm_vm *setup_vm(struct kvm_vcpu **vcpu)
>  	struct kvm_vm *vm;
>  
>  	vm = vm_create(1);
> -	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> +	kvm_get_default_vcpu_target(vm, &init);
>  
>  	/*
>  	 * Enable in-kernel emulation of PSCI to ensure that calls are denied
> diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> index 36a3a8b4e0b5..2a8f31c8e59f 100644
> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> @@ -430,7 +430,7 @@ static void create_vpmu_vm(void *guest_code)
>  	}
>  
>  	/* Create vCPU with PMUv3 */
> -	vm_ioctl(vpmu_vm.vm, KVM_ARM_PREFERRED_TARGET, &init);
> +	kvm_get_default_vcpu_target(vpmu_vm.vm, &init);
>  	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
>  	vpmu_vm.vcpu = aarch64_vcpu_add(vpmu_vm.vm, 0, &init, guest_code);
>  	vcpu_init_descriptor_tables(vpmu_vm.vcpu);
> @@ -525,7 +525,7 @@ static void run_access_test(uint64_t pmcr_n)
>  	 * Reset and re-initialize the vCPU, and run the guest code again to
>  	 * check if PMCR_EL0.N is preserved.
>  	 */
> -	vm_ioctl(vpmu_vm.vm, KVM_ARM_PREFERRED_TARGET, &init);
> +	kvm_get_default_vcpu_target(vpmu_vm.vm, &init);
>  	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
>  	aarch64_vcpu_setup(vcpu, &init);
>  	vcpu_init_descriptor_tables(vcpu);
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index 91f05f78e824..f4644c9d2d3b 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -116,10 +116,13 @@ void __weak finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>  }
>  
>  #ifdef __aarch64__
> -static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
> +static void prepare_vcpu_init(struct kvm_vm *vm, struct vcpu_reg_list *c,
> +			      struct kvm_vcpu_init *init)
>  {
>  	struct vcpu_reg_sublist *s;
>  
> +	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, init);
> +
>  	for_each_sublist(c, s)
>  		if (s->capability)
>  			init->features[s->feature / 32] |= 1 << (s->feature % 32);
> @@ -127,10 +130,10 @@ static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *ini
>  
>  static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
>  {
> -	struct kvm_vcpu_init init = { .target = -1, };
> +	struct kvm_vcpu_init init;
>  	struct kvm_vcpu *vcpu;
>  
> -	prepare_vcpu_init(c, &init);
> +	prepare_vcpu_init(vm, c, &init);
>  	vcpu = __vm_vcpu_add(vm, 0);
>  	aarch64_vcpu_setup(vcpu, &init);
>  
> diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
> index 5a4b29c1b965..87f50efed720 100644
> --- a/tools/testing/selftests/kvm/include/arm64/processor.h
> +++ b/tools/testing/selftests/kvm/include/arm64/processor.h
> @@ -357,4 +357,6 @@ static __always_inline u64 ctxt_reg_alias(struct kvm_vcpu *vcpu, u32 encoding)
>  	return KVM_ARM64_SYS_REG(alias);
>  }
>  
> +void kvm_get_default_vcpu_target(struct kvm_vm *vm, struct kvm_vcpu_init *init);
> +
>  #endif /* SELFTEST_KVM_PROCESSOR_H */
> diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
> index 311660a9f655..5ae65fefd48c 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> @@ -267,19 +267,24 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
>  	}
>  }
>  
> +void kvm_get_default_vcpu_target(struct kvm_vm *vm, struct kvm_vcpu_init *init)
> +{
> +	struct kvm_vcpu_init preferred = {};
> +
> +	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &preferred);
> +
> +	*init = preferred;
> +}
> +
>  void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
>  {
>  	struct kvm_vcpu_init default_init = { .target = -1, };
>  	struct kvm_vm *vm = vcpu->vm;
>  	uint64_t sctlr_el1, tcr_el1, ttbr0_el1;
>  
> -	if (!init)
> +	if (!init) {
> +		kvm_get_default_vcpu_target(vm, &default_init);
>  		init = &default_init;
> -
> -	if (init->target == -1) {
> -		struct kvm_vcpu_init preferred;
> -		vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &preferred);
> -		init->target = preferred.target;
>  	}
>  
>  	vcpu_ioctl(vcpu, KVM_ARM_VCPU_INIT, init);
> -- 
> 2.47.3
> 

