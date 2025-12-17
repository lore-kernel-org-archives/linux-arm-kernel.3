Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3525D65C55
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPDdMXZZsLtKOyovtwhN09mXlcfNuAwH5YZ14Ik7l9w=; b=PRoJBjgYRPKVQVMpFlQ8av3gYO
	2jxgRdGVWue0WJwej6R9RR7A+yC79an0H31Pg6WQziLHW3yAO1ZOPXNkxEGmxEtD+8pW/66kkY/z+
	BzuJWWXt4F85CtKOD8fpKcyKt8TIvkBpo4SjPytdAFYeO4fCmsX+JyER63lyd6HPYPU5OLxmNXhxs
	lRLGCyTUKqw6wPMBx4N5OenGRebqH80sh1boYkHBbulhxuEBnzuw5awGf0zvEJLrUbannvIs2FoQ9
	6x6ODnZxsQPmHcrGvVT2UTHWEpdjMmujDxUBfRfAeM/wNVIO7grfyI2Qi9V6vunMs7iEzCF+Z9rxc
	GpDVOl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsXO-00000006wnm-1V1u;
	Wed, 17 Dec 2025 14:29:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsXL-00000006wn4-2YNx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:29:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91910FEC;
	Wed, 17 Dec 2025 06:29:44 -0800 (PST)
Received: from [10.57.79.105] (unknown [10.57.79.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 495223F73B;
	Wed, 17 Dec 2025 06:29:48 -0800 (PST)
Message-ID: <f04bdf46-c752-43ec-88fa-dcd37f29d374@arm.com>
Date: Wed, 17 Dec 2025 14:29:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/46] arm64: RMI: Activate realm on first VCPU run
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20251217101125.91098-1-steven.price@arm.com>
 <20251217101125.91098-12-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251217101125.91098-12-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062955_911761_8D09DF5E 
X-CRM114-Status: GOOD (  21.05  )
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

On 17/12/2025 10:10, Steven Price wrote:
> When a VCPU migrates to another physical CPU check if this is the first
> time the guest has run, and if so activate the realm.
> 
> Before the realm can be activated it must first be created, this is a
> stub in this patch and will be filled in by a later patch.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v12
> ---
>   arch/arm64/include/asm/kvm_rmi.h |  1 +
>   arch/arm64/kvm/arm.c             |  6 +++++
>   arch/arm64/kvm/rmi.c             | 42 ++++++++++++++++++++++++++++++++
>   3 files changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index cb7350f8a01a..e4534af06d96 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -69,6 +69,7 @@ void kvm_init_rmi(void);
>   u32 kvm_realm_ipa_limit(void);
>   
>   int kvm_init_realm_vm(struct kvm *kvm);
> +int kvm_activate_realm(struct kvm *kvm);
>   void kvm_destroy_realm(struct kvm *kvm);
>   void kvm_realm_destroy_rtts(struct kvm *kvm);
>   
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 941d1bec8e77..542df37b9e82 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -951,6 +951,12 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
>   			return ret;
>   	}
>   
> +	if (kvm_is_realm(vcpu->kvm)) {
> +		ret = kvm_activate_realm(kvm);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	mutex_lock(&kvm->arch.config_lock);
>   	set_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &kvm->arch.flags);
>   	mutex_unlock(&kvm->arch.config_lock);
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index e57e8b7eafa9..98929382c365 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -223,6 +223,48 @@ void kvm_realm_destroy_rtts(struct kvm *kvm)
>   	WARN_ON(realm_tear_down_rtt_range(realm, 0, (1UL << ia_bits)));
>   }
>   
> +static int realm_ensure_created(struct kvm *kvm)
> +{
> +	/* Provided in later patch */
> +	return -ENXIO;
> +}
> +
> +int kvm_activate_realm(struct kvm *kvm)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	int ret;
> +
> +	if (!kvm_is_realm(kvm))
> +		return -ENXIO;
> +
> +	if (kvm_realm_state(kvm) == REALM_STATE_ACTIVE)
> +		return 0;
> +
> +	guard(mutex)(&kvm->arch.config_lock);
> +	/* Check again with the lock held */
> +	if (kvm_realm_state(kvm) == REALM_STATE_ACTIVE)
> +		return 0;
> +
> +	ret = realm_ensure_created(kvm);
> +	if (ret)
> +		return ret;
> +
> +	/* Mark state as dead in case we fail */
> +	WRITE_ONCE(realm->state, REALM_STATE_DEAD);
> +
> +	if (!irqchip_in_kernel(kvm)) {
> +		/* Userspace irqchip not yet supported with realms */
> +		return -EOPNOTSUPP;
> +	}

super minor nit: We could do this check before create the realm, within
the config_lock'ed region.

Suzuki


