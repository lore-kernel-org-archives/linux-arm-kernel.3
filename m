Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE98110F92EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 02:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjDv9x64RsqHnAuAN+wXapD1deuuWHxdiqwhKuCAq+g=; b=4Iph5dKTJzRIc8LULYC4LIQqvS
	Kw56bElrR4Bh/1il+16oruU2xwlss3aUUtNFoUow195v2b5G+Y/Wr0FJ6tCn6sWTNCdPBuEXMPsu2
	PLlGv2OaxknuNWGEPZP6i6boyHXexSltHdsOl7c8SPAfzWqMH/oxQTN3UjiwTa8jRzJQiDBlekueU
	soUPPcowshX0uGz36pWJxoOLScohixr2gBKb9dL/4bPlErY3N/SU3TETnc76IjDXG0N11ucXR+FF7
	BnKHlhJKGRBysp7lKX/SFZuXlCJ+FoaLnthhzo0HlLVi4At9eusYP3HED+iqVLARue4wc+k4IK0ti
	5NOj8Yig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lFU-0000000DqGm-3aef;
	Wed, 01 Apr 2026 02:24:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lFS-0000000DqGK-0Sh0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 02:24:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C2033161;
	Tue, 31 Mar 2026 19:23:54 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C08583F7D8;
	Tue, 31 Mar 2026 19:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775010239; bh=HLoh86vohO7b+KpMGVA+Fn4nF+utzpab4GyEmA9Mmds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q8F8ZxCr6LZ/IpozivO+rH0nqoEn0hdZQZ19RD6aSibySieRfPtpjhCY+nLqIBOjc
	 7545JvSbZgJa5mNDrWj/olggUf13ofWNP6sf7Ie7eQ0mEiruktxat4mtgNnKZsW+eD
	 6qoJsAP0iU4rU3Y+e9aWUkMGxV2aDVe0UrXeK0z0=
Message-ID: <418441bc-d0b3-42c6-a7b1-aa4e2b17f536@arm.com>
Date: Wed, 1 Apr 2026 07:53:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/30] KVM: arm64: Hoist MTE validation check out of
 MMU lock path
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-13-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-13-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_192402_276831_18C79A3B 
X-CRM114-Status: GOOD (  18.54  )
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
> From: Fuad Tabba <tabba@google.com>
> 
> Simplify the non-cacheable attributes assignment by using a ternary
> operator. Additionally, hoist the MTE validation check (mte_allowed) out
> of kvm_s2_fault_map() and into kvm_s2_fault_compute_prot(). This allows
> us to fail faster and avoid acquiring the KVM MMU lock unnecessarily
> when the VMM introduces a disallowed VMA for an MTE-enabled guest.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 0c71e3a9af8b0..ee2a548999b1b 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1870,18 +1870,21 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
>  	if (fault->exec_fault)
>  		fault->prot |= KVM_PGTABLE_PROT_X;
>  
> -	if (fault->s2_force_noncacheable) {
> -		if (fault->vm_flags & VM_ALLOW_ANY_UNCACHED)
> -			fault->prot |= KVM_PGTABLE_PROT_NORMAL_NC;
> -		else
> -			fault->prot |= KVM_PGTABLE_PROT_DEVICE;
> -	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC)) {
> +	if (fault->s2_force_noncacheable)
> +		fault->prot |= (fault->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
> +			       KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
> +	else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
>  		fault->prot |= KVM_PGTABLE_PROT_X;
> -	}
>  
>  	if (fault->nested)
>  		adjust_nested_exec_perms(kvm, fault->nested, &fault->prot);
>  
> +	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
> +		/* Check the VMM hasn't introduced a new disallowed VMA */
> +		if (!fault->mte_allowed)
> +			return -EFAULT;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1918,15 +1921,8 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>  		}
>  	}
>  
> -	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
> -		/* Check the VMM hasn't introduced a new disallowed VMA */
> -		if (fault->mte_allowed) {
> -			sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
> -		} else {
> -			ret = -EFAULT;
> -			goto out_unlock;
> -		}
> -	}
> +	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
> +		sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
>  
>  	/*
>  	 * Under the premise of getting a FSC_PERM fault, we just need to relax


