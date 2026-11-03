Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D831606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GLctAYkW;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SOfMxzkm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m96nh3pIfd5T2dHjgVJW57pUnSKhZsnJmnbKqdVYY3w=; b=GLctAYkWWb+uVI
	s61tibrmotPPR86rsGvTU4Hjh22jHaLSCz40C6fiKzojJLcmKAv0wm+l9ZQ+nLWvAxRuw11L+REKk
	+NgNnmv8vcQ4buQAOKBl4TCcOHVf1WMT/kfzWFQO4a3gtaRcqz38bkhb+BjYwxaFX1B3KB+5DBacV
	RFwylea3ht2O8uWGyjmXQX74/rtQWlP8JLAV5jFrq5Ard7SS7une+kgu+ZBgW3h0iaRadHkP1jxmG
	+vNNPq5lUwWPgPgklc8qoespUaCcJHOaXI12IOM7hnuBSYjhyshlg4RliehEFLj/zoVS2nCh2f0ib
	rBRzwMR8m5NrU4Jd8gZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAxg-00000001lhm-0iKn;
	Tue, 03 Nov 2026 09:37:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAxc-00000001lgA-0vtt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:37:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E745716F3;
	Tue,  3 Nov 2026 01:37:37 -0800 (PST)
Received: from [10.57.66.79] (unknown [10.57.66.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06A0E3F632;
	Tue,  3 Nov 2026 01:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793698661; bh=4hSUFNsDMJJkO6LJAwKFbCYlyI1ujmGAiIPD2tV7jDc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SOfMxzkmC0WLCulHw8RhMkwhBbOS3LfHThPnXAfMcQ1ejTjY8GOyHWmk0VeH0M+Kj
	 DoqLF5MwvyySThN1AIT3/ZrIT2TMGZkLcWwUHiB1/xts4ToUmXfC2kEXOS3XMJFRMI
	 IXVzE9me7YgLPHBjn6uG14p9+OONA7PoSNQraelY=
Message-ID: <29e7d214-b7b0-403a-a40f-dbc5b6951e22@arm.com>
Date: Tue, 3 Nov 2026 09:37:37 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] KVM: arm64: Move stage-2 teardown into kvm_vm_s2_ops
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Raghavendra Rao Ananta <rananta@google.com>, Fuad Tabba <tabba@google.com>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-4-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261103084742.1302597-4-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_013744_546539_BF742F20 
X-CRM114-Status: GOOD (  18.85  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad

On 03/11/2026 08:47, Fuad Tabba wrote:
> Replace kvm_stage2_destroy()'s is_protected_kvm_enabled() and
> KVM_PGT_FN() dispatch with a vm_stage2_destroy hook in kvm_vm_s2_ops,
> like the other stage-2 operations. Both pKVM flavors share
> pkvm_stage2_destroy(). Like kvm_vm_stage2_destroy(), it takes the range
> from kvm_phys_size().
> 
> No functional change intended.

Someone beat you on this (well almost) ;-)

https://lore.kernel.org/all/4304d0c7-2220-4add-9c71-e6dc6b4fbc11@arm.com


> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 ++
>   arch/arm64/kvm/mmu.c              | 24 +++++++++++++-----------
>   2 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 97332ffcb1300..b36779bafae9b 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -233,6 +233,7 @@ struct kvm_vcpu_ops {
>   
>   struct kvm_gfn_range;
>   struct kvm_s2_fault_desc;
> +struct kvm_pgtable;
>   
>   struct kvm_vm_s2_ops {
>   	bool (*vm_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> @@ -243,6 +244,7 @@ struct kvm_vm_s2_ops {
>   	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
>   				      phys_addr_t start, u64 size,
>   				      bool may_block);
> +	void (*vm_stage2_destroy)(struct kvm_pgtable *pgt);
>   	int (*vm_mem_abort)(const struct kvm_s2_fault_desc *s2fd);
>   };
>   
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 10b425a0141be..9df3c80a5acd1 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1029,17 +1029,16 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
>   	} while (addr = next, addr != end);
>   }
>   
> -static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
> +static void kvm_vm_stage2_destroy(struct kvm_pgtable *pgt)
>   {
> -	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
> +	stage2_destroy_range(pgt, 0, kvm_phys_size(pgt->mmu));
> +	kvm_pgtable_stage2_destroy_pgd(pgt);
> +}
>   
> -	/* pKVM walks its mapping tree, not the IPA space, and reschedules per mapping */
> -	if (is_protected_kvm_enabled())
> -		pkvm_pgtable_stage2_destroy_range(pgt, 0, BIT(ia_bits));
> -	else
> -		stage2_destroy_range(pgt, 0, BIT(ia_bits));
> -
> -	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
> +static void pkvm_stage2_destroy(struct kvm_pgtable *pgt)
> +{
> +	pkvm_pgtable_stage2_destroy_range(pgt, 0, kvm_phys_size(pgt->mmu));
> +	pkvm_pgtable_stage2_destroy_pgd(pgt);
>   }
>   
>   /**
> @@ -1126,7 +1125,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>   	return 0;
>   
>   out_destroy_pgtable:
> -	kvm_stage2_destroy(pgt);
> +	kvm->arch.vm_s2_ops->vm_stage2_destroy(pgt);

minor nit: should we retain the kvm_stage2_destroy() to dispatch the 
callback ?

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Cheers
Suzuki


>   	mmu->pgt = NULL;
>   out_free_pgtable:
>   	kfree(pgt);
> @@ -1246,7 +1245,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>   	write_unlock(&kvm->mmu_lock);
>   
>   	if (pgt) {
> -		kvm_stage2_destroy(pgt);
> +		kvm->arch.vm_s2_ops->vm_stage2_destroy(pgt);
>   		kfree(pgt);
>   	}
>   
> @@ -3152,6 +3151,7 @@ static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
>   	.vm_age_gfn			= no_age_gfn,
>   	.vm_test_age_gfn		= no_age_gfn,
>   	.vm_stage2_unmap_range		= no_stage2_unmap_range,
> +	.vm_stage2_destroy		= pkvm_stage2_destroy,
>   	.vm_mem_abort			= protected_pkvm_mem_abort,
>   };
>   
> @@ -3161,6 +3161,7 @@ static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
>   	.vm_age_gfn			= pkvm_age_gfn,
>   	.vm_test_age_gfn		= pkvm_test_age_gfn,
>   	.vm_stage2_unmap_range		= pkvm_stage2_unmap_range,
> +	.vm_stage2_destroy		= pkvm_stage2_destroy,
>   	.vm_mem_abort			= kvm_vm_mem_abort,
>   };
>   
> @@ -3170,6 +3171,7 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
>   	.vm_age_gfn			= kvm_vm_age_gfn,
>   	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
>   	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
> +	.vm_stage2_destroy		= kvm_vm_stage2_destroy,
>   	.vm_mem_abort			= kvm_vm_mem_abort,
>   };
>   


