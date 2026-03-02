Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7687AEA4E3E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWBkNjFzwyc2+9a+OYS1igmYVLGKwS2CUF9Ja/ph5AQ=; b=0jWCoH7667EP5blV3JblIBq0a9
	XL2uMYPdHPZOvACz3fUA9Ua9zAnSduWOlJ9Yr3eHBw5pr+biDdJn46NrjpDmI2Kfx56jDHO4gZ9UD
	QoOptnuX9jLweGiGjot6BS2PCIeoY6BKnKNu8j1PyBoTkGfpkWxVbJf2agaY9B4fXvHnoccsafPtU
	3p6rwDIPWYbvHoYtxM3wMLkALB/9cKL1mFnGil6du40qJIsYwdIvK87tyfC8BGUVbhnhVa7p0sWUu
	djC4GzXzTt3V+QtajQ/PGkDbSlti/r4XbpFLQCKANGZ9Ct6XQ3eemegQbC9ukcqWMmZWFJjOCmBN0
	mQXOUd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6Au-0000000DUnt-1e2o;
	Mon, 02 Mar 2026 16:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6At-0000000DUnY-14om
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 16:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UWBkNjFzwyc2+9a+OYS1igmYVLGKwS2CUF9Ja/ph5AQ=; b=hS8/5iHoxB/a7cJrWI/7CRWF+H
	p3AciwD5zrxKRh3rAxcv5ryx7WQ5plA7qIXjMmyr4vMEHD77QDQhWnfiX4qSIHOhx/pFzmel1UnuK
	WSGRgSJyzzgn92B6mOU5InxURa4H7rlbPUDGQQ7lBAglkOqoPwnkiy4FNeL9D23LdBHy/hMuMeA9X
	0BR9U6uJJ1vW3zPPcBj843ygGz79lNSu34bPLO0bvuOGcKPlL6sSK84k1LUbWDXbIU08QKEKtHbmS
	emCPQEge4lGjGwX5FkdE/nMBd06xbJo0vYWjCladRBchh1SCYnPQJi5biqRnQXqUMZn8jst5Txcxx
	ChokTpGw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6Ap-00000000a2q-3DYA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:31:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BB8114BF;
	Mon,  2 Mar 2026 08:31:01 -0800 (PST)
Received: from [10.57.55.216] (unknown [10.57.55.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FEBE3F694;
	Mon,  2 Mar 2026 08:31:03 -0800 (PST)
Message-ID: <92fe1041-e8fe-4015-8e3b-872cbcce66a2@arm.com>
Date: Mon, 2 Mar 2026 16:31:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/46] arm64: RMI: Activate realm on first VCPU run
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
 Vishal Annapurve <vannapurve@google.com>
References: <20251217101125.91098-1-steven.price@arm.com>
 <20251217101125.91098-12-steven.price@arm.com> <86seai8fbd.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86seai8fbd.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_163112_097463_9C1C5FD6 
X-CRM114-Status: GOOD (  26.16  )
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

On 02/03/2026 14:40, Marc Zyngier wrote:
> On Wed, 17 Dec 2025 10:10:48 +0000,
> Steven Price <steven.price@arm.com> wrote:
>>
>> When a VCPU migrates to another physical CPU check
> 
> To another physical CPU?
> 
> That's not what kvm_arch_vcpu_run_pid_change() tracks. It really is
> limited to a new PID being associated to the vpcu thread. Which is
> indeed the case when the vpcu runs for the first time, but that's
> about it.
> 
> If you need to track the physical CPU, we have some tracking for it in
> vcpu_load(), but that'd need some rework.

Sorry that was just a complete brainfart when I wrote that commit
message. We don't care about physical CPUs - this is just catching the
first VCPU run. Thanks for catching that.

>> if this is the first
>> time the guest has run, and if so activate the realm.
>>
>> Before the realm can be activated it must first be created, this is a
>> stub in this patch and will be filled in by a later patch.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> New patch for v12
>> ---
>>  arch/arm64/include/asm/kvm_rmi.h |  1 +
>>  arch/arm64/kvm/arm.c             |  6 +++++
>>  arch/arm64/kvm/rmi.c             | 42 ++++++++++++++++++++++++++++++++
>>  3 files changed, 49 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
>> index cb7350f8a01a..e4534af06d96 100644
>> --- a/arch/arm64/include/asm/kvm_rmi.h
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -69,6 +69,7 @@ void kvm_init_rmi(void);
>>  u32 kvm_realm_ipa_limit(void);
>>  
>>  int kvm_init_realm_vm(struct kvm *kvm);
>> +int kvm_activate_realm(struct kvm *kvm);
>>  void kvm_destroy_realm(struct kvm *kvm);
>>  void kvm_realm_destroy_rtts(struct kvm *kvm);
>>  
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 941d1bec8e77..542df37b9e82 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -951,6 +951,12 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
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
>> index e57e8b7eafa9..98929382c365 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -223,6 +223,48 @@ void kvm_realm_destroy_rtts(struct kvm *kvm)
>>  	WARN_ON(realm_tear_down_rtt_range(realm, 0, (1UL << ia_bits)));
>>  }
>>  
>> +static int realm_ensure_created(struct kvm *kvm)
>> +{
>> +	/* Provided in later patch */
>> +	return -ENXIO;
>> +}
>> +
>> +int kvm_activate_realm(struct kvm *kvm)
>> +{
>> +	struct realm *realm = &kvm->arch.realm;
>> +	int ret;
>> +
>> +	if (!kvm_is_realm(kvm))
>> +		return -ENXIO;
> 
> nit: you already checked for this in caller.

Ack

>> +
>> +	if (kvm_realm_state(kvm) == REALM_STATE_ACTIVE)
>> +		return 0;
> 
> You probably also want to return early once the realm has been marked
> as dead -- it shouldn't be able to be a zombie and die twice.

Indeed, >= would be a better check.

Thanks,
Steve

>> +
>> +	guard(mutex)(&kvm->arch.config_lock);
>> +	/* Check again with the lock held */
>> +	if (kvm_realm_state(kvm) == REALM_STATE_ACTIVE)
>> +		return 0;
>> +
>> +	ret = realm_ensure_created(kvm);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Mark state as dead in case we fail */
>> +	WRITE_ONCE(realm->state, REALM_STATE_DEAD);
>> +
>> +	if (!irqchip_in_kernel(kvm)) {
>> +		/* Userspace irqchip not yet supported with realms */
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	ret = rmi_realm_activate(virt_to_phys(realm->rd));
>> +	if (ret)
>> +		return -ENXIO;
>> +
>> +	WRITE_ONCE(realm->state, REALM_STATE_ACTIVE);
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


