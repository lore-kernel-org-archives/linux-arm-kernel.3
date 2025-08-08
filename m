Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3984C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abYPtt9gp7dt5yQH3k623AWoEHl0Hr24WYJOo0TOVqs=; b=QyOchiDkGcgkNiiVZRZqk2y3uA
	BNj/9o+xJuiP0PUFDuSfxhvEAaOgW2LU/zOznlJcMe7H7PpjpTr8hTXDTrJeSUqFOi22LScPYs/VA
	tQBxbf31P6u7wciFdrOKvBZ6Vt/BZh7lhy3tES0UXAzg3tsy3Un1xqLiTD0qJ4dgMhivAfjxeyAld
	zQf5yu4OLgpYEbRSm60CQ8J8WY6e+g8wgEHQZ3c36WFllZFVt5fUgfyMe4qkpWYRbncZy9UpUU/Vo
	yOP4MK27s05bp+e1aztvkiUhamav0NPmRpiCJBrGSy0rN+Yl+Dr/Lh17h6xl3CnpLodfyYUMulSCs
	IiudX5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLzQ-00000002mE5-0LZW;
	Fri, 08 Aug 2025 12:14:28 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLNe-00000002gZz-2SSa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:35:28 +0000
Message-ID: <3c52f485-cde4-44ef-8ffd-a61a671359db@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754652788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abYPtt9gp7dt5yQH3k623AWoEHl0Hr24WYJOo0TOVqs=;
	b=AXMjcCvxLwSFAD/YRaO8PD0GKrgmIk2ml8mkVGam9Wpw+pdwiNWB7g9mSzWcYDD78BAnhb
	xJAEMRuY7gcOBFzy0sZZGnIQtr7Gi6Ui/Muf7vFoYS0KWhwvCXh3nwU/0p1q113F5funUo
	Fk3qVMMCxaWr5FIkILLswNSejIidwlo=
Date: Fri, 8 Aug 2025 19:32:54 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/8] KVM: arm64: Rename pkvm.enabled to
 pkvm.is_protected
Content-Language: en-US
To: Fuad Tabba <tabba@google.com>, kvmarm <kvmarm@lists.linux.dev>,
 arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250729120014.2799359-1-tabba@google.com>
 <20250729120014.2799359-2-tabba@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kunwu Chan <kunwu.chan@linux.dev>
In-Reply-To: <20250729120014.2799359-2-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_043527_063979_8398D301 
X-CRM114-Status: GOOD (  16.84  )
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

On 2025/7/29 20:00, Fuad Tabba wrote:
> The 'pkvm.enabled' field in struct kvm_protected_vm is confusingly named.
> Its purpose is to indicate whether a VM is a pKVM protected VM, not
> whether the VM itself is enabled or running.
> 
> For a non-protected VM, the VM can be fully active, yet this field would
> be false. This ambiguity can lead to incorrect assumptions about the VM's
> operational state and makes the code harder to reason about.
> 
> Rename the field to 'is_protected' to make it unambiguous that the flag
> tracks the protected status of the VM.
> 
> No functional change intended.
> 
lgtm

> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 4 ++--
>   arch/arm64/kvm/hyp/nvhe/pkvm.c    | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3e41a880b062..55dc7cd83e40 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -252,7 +252,7 @@ struct kvm_protected_vm {
>   	pkvm_handle_t handle;
>   	struct kvm_hyp_memcache teardown_mc;
>   	struct kvm_hyp_memcache stage2_teardown_mc;
> -	bool enabled;
> +	bool is_protected;
>   };
>   
>   struct kvm_mpidr_data {
> @@ -1522,7 +1522,7 @@ struct kvm *kvm_arch_alloc_vm(void);
>   
>   #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>   
> -#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.enabled)
> +#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.is_protected)
>   
>   #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
>   
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 338505cb0171..6198c1d27b5b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -406,7 +406,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
>   	hyp_vm->host_kvm = host_kvm;
>   	hyp_vm->kvm.created_vcpus = nr_vcpus;
>   	hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
> -	hyp_vm->kvm.arch.pkvm.enabled = READ_ONCE(host_kvm->arch.pkvm.enabled);
> +	hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
>   	hyp_vm->kvm.arch.flags = 0;
>   	pkvm_init_features_from_host(hyp_vm, host_kvm);
>   }

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

-- 
Thanks,
        Kunwu Chan.


