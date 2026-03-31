Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B227FF60D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 06:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ltx9qgv0ZJfXJV+fakzVSjyFJKz1+cYJF1V4n3gJOfk=; b=slj8PdTUcnAfvwwNMz8HQnzKea
	evfqHsAflj28JoQ7aeWXBndL90wG2rA2YhT5nS3tkDJWh+rRAAHnZj9aWTkw8MCXlYeaOkeVw839j
	2WDRR96Uxk7wYjpBOeby6qds/29pJgIk9u4MpVXSfLyLIwEbYrCjYV/Orm6HOB+hGd6zhTbjq7ow/
	pDrgm0o113QoeJaK5cWYa1i6sBLMz51bX/NBUzsX/qxtCwM7JjxNY101MaRdTIK9dQoyF6WAOGg+f
	1FoRjerbFgTho7uTOOqv9HT9vh8SBgh6rl34K0z7vvINbF3702112+WppUaU7bRH8ml/Q6qyNEcR1
	OVnhCieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7T32-0000000CPv5-2Pz2;
	Tue, 31 Mar 2026 06:58:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7T2z-0000000CPug-0qpC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 06:57:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47AC4495B;
	Mon, 30 Mar 2026 23:57:49 -0700 (PDT)
Received: from [10.57.18.211] (unknown [10.57.18.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A77703F7D8;
	Mon, 30 Mar 2026 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774940275; bh=2tOMaJp56iXUOV/xkh3Q08VCKzhADZC2/A1u7wVNqcE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jUXTOiLI9uc4O/BtVmCD3Pfg6t+oABR1hnVEsw1GT0cmK6m8Z8yv2axk3OU8o/8ns
	 E+sb+tkKwzB96Osa4oxz67fau7jGEOlCGveXKEBX4SYadsF6KoNdegLMx9hyzeKSKi
	 zmUnKQuO2UoHxyr3MRgMXyzl4mtuN2b8FKFr48No=
Message-ID: <8bd2b649-01b5-44f4-a034-c202e226e97c@arm.com>
Date: Tue, 31 Mar 2026 12:27:48 +0530
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
X-CRM114-CacheID: sfid-20260330_235757_447385_D68B176F 
X-CRM114-Status: GOOD (  19.50  )
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

Is not the existing code block bit more cleaner though ?

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


