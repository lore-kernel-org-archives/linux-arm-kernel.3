Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDE0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rehLc87S0/3bTgONnTH9nSQ1Q/RH5/ZGY178l2UxrsM=; b=mvF5BVnpzzTKed8grvIgKm8baZ
	n0nyNFyvyLStGBEEaePimharbKVQ1empkqMOigjldhP6MgIREfnRP9AFtPB7ijUkoOTIxxNdPvjqd
	XvTi3fi3j3HcBwxtCTRbVG/OofmQxYmVvOa/pIEAl0BU+bzeUt6ndbSMExvH3CyjBQ4jj/f+Pc5zp
	Dh+Ky8QhW7wfQJRzxqm0o1uaoz3yEIWP2tInB//pAAacYPPY35IuMuoWZsMYzGKswNOpuW5sN/n8z
	KUTsvYd9b7SAMxXIewFSVgPXcNYfjafuj4Ji+pTEjPglPv8z2n/A5uH4yp4DW+6BdBawleDoPHCGn
	k3O0dC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITFN-00000005cxD-1HpQ;
	Mon, 10 Nov 2025 14:51:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITFK-00000005cwL-0QWz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:51:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 208FB2F;
	Mon, 10 Nov 2025 06:51:43 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50B833F63F;
	Mon, 10 Nov 2025 06:51:49 -0800 (PST)
Message-ID: <bc25a11a-d5b7-45de-bb99-c78100e5055d@arm.com>
Date: Mon, 10 Nov 2025 14:51:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] KVM: arm64: Fix MTE flag initialization for
 protected VMs
To: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, vladimir.murzin@arm.com
References: <20251110134525.3768197-1-tabba@google.com>
 <20251110134525.3768197-4-tabba@google.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251110134525.3768197-4-tabba@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_065154_213705_8BDC6329 
X-CRM114-Status: GOOD (  21.48  )
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

Hi Fuad,

On 11/10/25 13:45, Fuad Tabba wrote:
> The function pkvm_init_features_from_host() initializes guest
> features, propagating them from the host. The logic to propagate
> KVM_ARCH_FLAG_MTE_ENABLED (Memory Tagging Extension)
> has a couple of issues.
> 
> First, the check was in the common path, before the divergence for
> protected and non-protected VMs. For non-protected VMs, this was
> unnecessary, as 'kvm->arch.flags' is completely overwritten by
> host_arch_flags immediately after, which already contains the MTE flag.
> For protected VMs, this was setting the flag even if the feature is not
> allowed.
> 
> Second, the check was reading 'host_kvm->arch.flags' instead of using
> the local 'host_arch_flags', which is read once from the host flags.
> 
> Fix these by moving the MTE flag check inside the protected-VM-only
> path, checking if the feature is allowed, and changing it to use the
> correct host_arch_flags local variable. This ensures non-protected VMs
> get the flag via the bulk copy, and protected VMs get it via an explicit
> check.
> 
> Fixes: b7f345fbc32a ("KVM: arm64: Fix FEAT_MTE in pKVM")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/pkvm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index f6f8996c4f97..7e370e31260d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -337,9 +337,6 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
>  	/* CTR_EL0 is always under host control, even for protected VMs. */
>  	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
>  
> -	if (test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &host_kvm->arch.flags))
> -		set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
> -
>  	/* No restrictions for non-protected VMs. */
>  	if (!kvm_vm_is_protected(kvm)) {
>  		hyp_vm->kvm.arch.flags = host_arch_flags;
> @@ -372,6 +369,11 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
>  		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_GUEST_HAS_SVE);
>  	}
>  
> +	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_MTE)) {
> +		set_bit(KVM_CAP_ARM_MTE, allowed_features);

Isn't allowed_features a bitmap for the KVM_ARCH_VCPU_ defines? I think
MTE is treated as a property of the VM.

> +		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_MTE_ENABLED);
> +	}
> +
>  	bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
>  		   allowed_features, KVM_VCPU_MAX_FEATURES);
>  }


Thanks,

Ben


