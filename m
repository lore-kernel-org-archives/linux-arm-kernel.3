Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D050C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZjH76UHpmDstUPipU1jxx0J7jtyxEHdRgZMTUCEI6Y=; b=NmfHd7Kfb/STN/81OluXek7jm7
	hfi8mbI8EAmnhhq7GFKs+TRnkd5L45D2SuXSdBdb0ZJ2lxo/wU4x8tUIE7xacYiNQ74xP7+5ExKZR
	DhX3b55s5ST2FwawnXdbdV7OfheOR6k7Ifk4MnMNuWVdVLdxABVxjznjZvPBIzPBdBa6Cvww4X5+3
	qqCEaa04dyVJM9Vp3W4rQNnRv8lGiqyNb8bteyvu4BxQxZWoQooFFsY5oiQm+6yUVxGxYkyIYMFIE
	Uv+Ykd9KTCW07Ru7LxVC5Vo9WTJaB7MMxApQ/2Wps+SLn+XHyDX9oa7HLDQzdicnXSPKJCUwqjEqj
	KES1TvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquQt-0000000HV2a-2fNp;
	Mon, 03 Aug 2026 15:18:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquQq-0000000HV1w-48uk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:18:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42554143D;
	Mon,  3 Aug 2026 08:18:19 -0700 (PDT)
Received: from [10.1.25.28] (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F7343F66F;
	Mon,  3 Aug 2026 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785770303; bh=a5G5LMPPyNBg/dAf4FAYnm9izzvFgYrpS6qSIas4tHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P/EjJyabE9lK32euTx1Wi9058FfNuSTH0MKFDFNkN+UG8A8xu4flKej/XWEImcgKK
	 gUmWZDMAAlZyiQqrXlUaBmnNnsFkclTihe0Qx9fOzWmpPYsPFeOYYcsmMBJPuq5Q3E
	 YxIzxM++5YQhYrS+i1gT99OSEKDffNCIVgT7C+dk=
Message-ID: <bb5ed17a-532f-4b05-8e8c-cbda3cb0433f@arm.com>
Date: Mon, 3 Aug 2026 16:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 19/37] KVM: arm64: CCA: Activate realms on first vCPU
 run
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-20-steven.price@arm.com> <8633wvcrqr.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <8633wvcrqr.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_081825_122165_E731FD80 
X-CRM114-Status: GOOD (  22.37  )
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

On 03/08/2026 13:29, Marc Zyngier wrote:
> On Wed, 15 Jul 2026 15:28:21 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> Use kvm_arch_vcpu_run_pid_change() to check if this is the first time
>> the realm guest has run. If this is the first run then activate the
>> realm.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>>
>> ---
>> Changes since v12:
>>  * Fix commit message
>>  * Change realm_state checks to be >= REALM_STATE_ACTIVE to avoid a dead
>>    guest being revived by kvm_activate_realm().
>> ---
>>  arch/arm64/include/asm/kvm_rmi.h |  1 +
>>  arch/arm64/kvm/arm.c             |  6 +++++
>>  arch/arm64/kvm/rmi.c             | 45 ++++++++++++++++++++++++++++++--
>>  3 files changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
>> index 5461c49bea4d..5cb99c187202 100644
>> --- a/arch/arm64/include/asm/kvm_rmi.h
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -96,6 +96,7 @@ void kvm_init_rmi(void);
>>  u32 kvm_rmm_ipa_limit(void);
>>  
>>  int kvm_init_realm(struct kvm *kvm);
>> +int kvm_activate_realm(struct kvm *kvm);
>>  void kvm_destroy_realm(struct kvm *kvm);
>>  int kvm_realm_teardown_stage2(struct kvm *kvm);
>>  void kvm_destroy_rec(struct kvm_vcpu *vcpu);
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 534d33b7c67a..df33322b8fea 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -1034,6 +1034,12 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
>>  			return ret;
>>  	}
>>  
>> +	if (kvm_is_realm(vcpu->kvm)) {
>> +		ret = kvm_activate_realm(kvm);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	mutex_lock(&kvm->arch.config_lock);
>>  	set_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &kvm->arch.flags);
>>  	mutex_unlock(&kvm->arch.config_lock);
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index 94776a9262c9..53b5b18f2275 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -687,7 +687,7 @@ static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
>>  	return ret;
>>  }
>>  
>> -static int __maybe_unused realm_ensure_created(struct kvm *kvm)
>> +static int realm_ensure_created(struct kvm *kvm)
>>  {
>>  	lockdep_assert_held(&kvm->arch.config_lock);
>>  
>> @@ -793,7 +793,7 @@ int noinstr kvm_rec_enter(struct kvm_vcpu *vcpu)
>>  	return ret;
>>  }
>>  
>> -static int __maybe_unused kvm_create_rec(struct kvm_vcpu *vcpu)
>> +static int kvm_create_rec(struct kvm_vcpu *vcpu)
>>  {
>>  	struct user_pt_regs *vcpu_regs = vcpu_gp_regs(vcpu);
>>  	unsigned long mpidr = kvm_vcpu_get_mpidr_aff(vcpu);
>> @@ -893,6 +893,47 @@ void kvm_destroy_rec(struct kvm_vcpu *vcpu)
>>  	rec->rec_page = NULL;
>>  }
>>  
>> +int kvm_activate_realm(struct kvm *kvm)
>> +{
>> +	struct realm *realm = &kvm->arch.realm;
>> +	struct kvm_vcpu *vcpu;
>> +	unsigned long i;
>> +	int ret;
>> +
>> +	if (kvm_realm_state(kvm) >= REALM_STATE_ACTIVE)
>> +		return 0;
>> +
>> +	if (!irqchip_in_kernel(kvm)) {
>> +		/* Userspace irqchip not yet supported with realms */
>> +		return -EOPNOTSUPP;
>> +	}
> 
> This could race with the irqchip being created on another CPU. Also,
> an irqchip being in kernel doesn't mean it is ready, and I suspect
> you also need to check that it has been initialised.

Good point - moving the config_lock up and checking vgic_initialized()
makes sense.

>> +
>> +	guard(mutex)(&kvm->arch.config_lock);
>> +	/* Check again with the lock held */
>> +	if (kvm_realm_state(kvm) >= REALM_STATE_ACTIVE)
>> +		return 0;
>> +
>> +	ret = realm_ensure_created(kvm);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Mark state as dead in case we fail */
>> +	kvm_set_realm_state(kvm, REALM_STATE_DEAD);
>> +
>> +	kvm_for_each_vcpu(i, vcpu, kvm) {
>> +		ret = kvm_create_rec(vcpu);
>> +		if (ret)
>> +			return ret;
>> +	}
> 
> If the realm is dead, shouldn't the KVM view of death apply as well?

Indeed that would be a good improvement. I'll change these error paths
to include a kvm_vm_dead() call.

Thanks,
Steve

>> +
>> +	ret = rmi_realm_activate(virt_to_phys(realm->rd));
>> +	if (ret)
>> +		return -ENXIO;
>> +
>> +	kvm_set_realm_state(kvm, REALM_STATE_ACTIVE);
>> +	return 0;
>> +}
>> +
>>  void kvm_destroy_realm(struct kvm *kvm)
>>  {
>>  	struct realm *realm = &kvm->arch.realm;
> 
> Thanks,
> 
> 	M.
> 


