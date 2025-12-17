Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1582FD65C47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pIj46nVvtUq+4eec5aThnrTEmEGNk5gVfAEDmgIrpg=; b=GLu77hKLseEjibEXH04nFRe5A5
	c0a6ngbELyIxyPsViGSC7mZeSO6bZMy+6Ya058A/Q4q4PQG65BGkVPF7awah70dAh4c589AIaPqAM
	c2AxAoq5fY75G6oZyhf+K860jv8WKoXjD7bRERd5pD1s3wSwMwxIxC+3V28NNvowibhCUjxThT/yN
	YduKIYriDLnX7Gg4zUYK1VIjo75tQGkrOQ+TNIlTgwyd6a0jnkfrVc63ThsYNnCZYk8SGekbo70kj
	XTMHCFkS/wPLjflPa6imL4ByYplINOyef1xdTqjjp/xbF/vd8l/fVk5zjaAQqPRu/IfEqqjoXWO97
	Y7gu656w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrl4-00000006sBG-3xom;
	Wed, 17 Dec 2025 13:40:02 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrl2-00000006sA0-2enK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 13:40:02 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-349bb6f9c86so7429878a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 05:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765978794; x=1766583594; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pIj46nVvtUq+4eec5aThnrTEmEGNk5gVfAEDmgIrpg=;
        b=I/m+r6hZ1nrOKZoTWf2AIQI0XsYh5UmrfxyrPxkS/uA7T+JWBe7DPa/p7uZ63HT8b5
         rd6jqK+Y4rWKjvTedYSgVPd/csZ4648RYl4cCywDCKCY2u6Ls7QpY+8UfF2PLrrO3QnG
         T3rY9B5aYK0FuS5iHmSKHxGVQTtfU2V5GfTmlaiyJzXv/OXq6t+BwQYRsXjuYtiAwTc5
         y/f3kX0o0wjsG9fC5Jyw1tJPLG2bPyz1PRXWjpWeS9hf5hYxh0R+JeXpfkK7qUKdwXyb
         SDg381pv0wnTrBBjhomZFp0V3HLhCp/IYLs5W3fHQ1Ln5uFZKJNh5e9YVW25NoHaaLlZ
         Jrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978794; x=1766583594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pIj46nVvtUq+4eec5aThnrTEmEGNk5gVfAEDmgIrpg=;
        b=HqEU4/piXL+KBnl+l3yQGaOAVvon9xmuzEw55u33mz40vMM41qaHQsbh676UJx1BnK
         IWuOibyeu6Qz2izLvcK7i8lmUQt5OM6V5e/Jey72EooQ2LuDp/3HvreNeMAd+IqQQIsX
         YqGFZ2hCojKOJd1X+BEKfEfMVsbtlIzakYV861htdQKeqcvPryuhrH/04u84zOydUQZi
         /zZMOYkCExXP7Lucgsq7IMPzqF/MreG4voKwl+FnQb0at1bR24x/nisWlKHM8mc1VJ0/
         chMvj51BqJRM95omNocrLsaH4Z2ZdoAoEow0xNW1vTJHynbc/dJjWnbf3lAYuXOvNdGl
         K1tA==
X-Forwarded-Encrypted: i=1; AJvYcCWJJTe6wOTSKIKG9ixCi3SDE0bCUjvW5N5X4FYkI202rQsf+REyiWuQqcZBLf8Z4nSziwd23dCsz/r9HhYBcTHE@lists.infradead.org
X-Gm-Message-State: AOJu0YwWY//a+ZGh1NC2o2Bd9YFv2ORN0Amxx3MvuaRBxvPjP74d0/Bq
	ZAjF8Fc/pZwyjL/YOXfv3Hl5kgip4Kqyo+PJAlZ7zSsmGGNmyvHRMVCsjQVOuA==
X-Gm-Gg: AY/fxX4tyDeAw/1l2ia4aZkrUW11zzxGhEMzIzTZzpCW4/oQBARJd0qxovbhsYRM20H
	Tg43oIm6hzLxmFHvMIdNhOkmx+7WhsVq3xLH4dOhqUsaOr4SmkhPBIV7yd07RobDY3UMJUvmM/h
	BA5q6wu4Rge5/8TegMRkF5poY9lbeItHEj+mYibHu97GoWZ76JJ+YxBaCWUD5WN4A+FdF6pXA0w
	5yzKa8rKSS+hd91J8nwHjvFCIyYY1jPTmj4GNI0ulsgKGOuWL4dwzt+QHLj70+8+B704zBLu6DS
	o9CA2/UhcyNNnxnp0lSve5OsE7ByPHY3Df1aj72dgqzBK9elNf9jg7xYFTDNLdVy4GJ6dxsfG5A
	y4fosokhu3OWZDZuYcVFoGDlAJAsb6+yhkoc3sw0MG0tBsLamehJEhsBR+nWtUs4wS3ob+iwQ/K
	3xLhuUA0jcgH5rvpvlETJAER8Wz91AMd7L2MkqQUdFZINfUa5g7DcewVRSQ0mnq8asdjOPEbwUi
	1PAYf+d5wcRx7fVsYq2eV8bHEo=
X-Google-Smtp-Source: AGHT+IG3LzjynQX7X4H7S9Io3Ynamjd2a9PPbU+36SGNDnZcAgiWppcnGVLBSdjNiAVnsvjUFOBbeQ==
X-Received: by 2002:a17:90b:2ccf:b0:340:cb18:922 with SMTP id 98e67ed59e1d1-34abd71f7e6mr16889624a91.14.1765978794294;
        Wed, 17 Dec 2025 05:39:54 -0800 (PST)
Received: from [172.27.236.53] (ec2-13-250-3-147.ap-southeast-1.compute.amazonaws.com. [13.250.3.147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c25b7d59dsm18602604a12.6.2025.12.17.05.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:39:53 -0800 (PST)
Message-ID: <87df4cba-b191-49cf-9486-fc379470a6eb@gmail.com>
Date: Wed, 17 Dec 2025 21:39:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] KVM: arm64: Enable HDBSS support and handle HDBSSF
 events
To: Tian Zheng <zhengtian10@huawei.com>, maz@kernel.org,
 oliver.upton@linux.dev, catalin.marinas@arm.com, corbet@lwn.net,
 pbonzini@redhat.com, will@kernel.org
Cc: linux-kernel@vger.kernel.org, yuzenghui@huawei.com,
 wangzhou1@hisilicon.com, yezhenyu2@huawei.com, xiexiangyou@huawei.com,
 zhengchuan@huawei.com, linuxarm@huawei.com, joey.gouly@arm.com,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 suzuki.poulose@arm.com
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
 <20251121092342.3393318-5-zhengtian10@huawei.com>
Content-Language: en-US
From: Robert Hoo <robert.hoo.linux@gmail.com>
In-Reply-To: <20251121092342.3393318-5-zhengtian10@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_054000_907561_BFAC3847 
X-CRM114-Status: GOOD (  37.47  )
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

On 11/21/2025 5:23 PM, Tian Zheng wrote:
> From: eillon <yezhenyu2@huawei.com>
> 
> Implement the HDBSS enable/disable functionality using the
> KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl.
> 
> Userspace (e.g., QEMU) can enable HDBSS by invoking the ioctl
> at the start of live migration, configuring the buffer size.
> The feature is disabled by invoking the ioctl again with size
> set to 0 once migration completes.
> 
> Add support for updating the dirty bitmap based on the HDBSS
> buffer. Similar to the x86 PML implementation, KVM flushes the
> buffer on all VM-Exits, so running vCPUs only need to be kicked
> to force a VM-Exit.
> 
> Signed-off-by: eillon <yezhenyu2@huawei.com>
> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  10 +++
>   arch/arm64/include/asm/kvm_mmu.h  |  17 +++++
>   arch/arm64/kvm/arm.c              | 107 ++++++++++++++++++++++++++++++
>   arch/arm64/kvm/handle_exit.c      |  45 +++++++++++++
>   arch/arm64/kvm/hyp/vhe/switch.c   |   1 +
>   arch/arm64/kvm/mmu.c              |  10 +++
>   arch/arm64/kvm/reset.c            |   3 +
>   include/linux/kvm_host.h          |   1 +
>   8 files changed, 194 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index d962932f0e5f..408e4c2b3d1a 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -87,6 +87,7 @@ int __init kvm_arm_init_sve(void);
>   u32 __attribute_const__ kvm_target_cpu(void);
>   void kvm_reset_vcpu(struct kvm_vcpu *vcpu);
>   void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu);
> +void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu);
> 
>   struct kvm_hyp_memcache {
>   	phys_addr_t head;
> @@ -793,6 +794,12 @@ struct vcpu_reset_state {
>   	bool		reset;
>   };
> 
> +struct vcpu_hdbss_state {
> +	phys_addr_t base_phys;
> +	u32 size;
> +	u32 next_index;
> +};
> +
>   struct vncr_tlb;
> 
>   struct kvm_vcpu_arch {
> @@ -897,6 +904,9 @@ struct kvm_vcpu_arch {
> 
>   	/* Per-vcpu TLB for VNCR_EL2 -- NULL when !NV */
>   	struct vncr_tlb	*vncr_tlb;
> +
> +	/* HDBSS registers info */
> +	struct vcpu_hdbss_state hdbss;
>   };
> 
>   /*
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> index e4069f2ce642..6ace1080aed5 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -331,6 +331,23 @@ static __always_inline void __load_stage2(struct kvm_s2_mmu *mmu,
>   	asm(ALTERNATIVE("nop", "isb", ARM64_WORKAROUND_SPECULATIVE_AT));
>   }
> 
> +static __always_inline void __load_hdbss(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	u64 br_el2, prod_el2;
> +
> +	if (!kvm->enable_hdbss)
> +		return;
> +
> +	br_el2 = HDBSSBR_EL2(vcpu->arch.hdbss.base_phys, vcpu->arch.hdbss.size);
> +	prod_el2 = vcpu->arch.hdbss.next_index;
> +
> +	write_sysreg_s(br_el2, SYS_HDBSSBR_EL2);
> +	write_sysreg_s(prod_el2, SYS_HDBSSPROD_EL2);
> +
> +	isb();
> +}
> +
>   static inline struct kvm *kvm_s2_mmu_to_kvm(struct kvm_s2_mmu *mmu)
>   {
>   	return container_of(mmu->arch, struct kvm, arch);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 870953b4a8a7..64f65e3c2a89 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -79,6 +79,92 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>   	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
>   }
> 
> +void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu)
> +{
> +	struct page *hdbss_pg = NULL;
> +
> +	hdbss_pg = phys_to_page(vcpu->arch.hdbss.base_phys);
> +	if (hdbss_pg)
> +		__free_pages(hdbss_pg, vcpu->arch.hdbss.size);
> +
> +	vcpu->arch.hdbss = (struct vcpu_hdbss_state) {
> +		.base_phys = 0,
> +		.size = 0,
> +		.next_index = 0,
> +	};
> +}
> +
> +static int kvm_cap_arm_enable_hdbss(struct kvm *kvm,
> +				    struct kvm_enable_cap *cap)
> +{
> +	unsigned long i;
> +	struct kvm_vcpu *vcpu;
> +	struct page *hdbss_pg = NULL;
> +	int size = cap->args[0];
> +	int ret = 0;
> +
> +	if (!system_supports_hdbss()) {
> +		kvm_err("This system does not support HDBSS!\n");
> +		return -EINVAL;
> +	}
> +
> +	if (size < 0 || size > HDBSS_MAX_SIZE) {
> +		kvm_err("Invalid HDBSS buffer size: %d!\n", size);
> +		return -EINVAL;
> +	}
> +

I think you should check if it's already enabled here. What if user space calls 
this twice?

> +	/* Enable the HDBSS feature if size > 0, otherwise disable it. */
> +	if (size) {
> +		kvm_for_each_vcpu(i, vcpu, kvm) {
> +			hdbss_pg = alloc_pages(GFP_KERNEL_ACCOUNT, size);
> +			if (!hdbss_pg) {
> +				kvm_err("Alloc HDBSS buffer failed!\n");
> +				ret = -ENOMEM;
> +				goto error_alloc;
> +			}
> +
> +			vcpu->arch.hdbss = (struct vcpu_hdbss_state) {
> +				.base_phys = page_to_phys(hdbss_pg),
> +				.size = size,
> +				.next_index = 0,
> +			};
> +		}
> +
> +		kvm->enable_hdbss = true;
> +		kvm->arch.mmu.vtcr |= VTCR_EL2_HD | VTCR_EL2_HDBSS;

VTCR_EL2_HA is also a necessity for VTCR_EL2_HDBSS to take effect.

> +
> +		/*
> +		 * We should kick vcpus out of guest mode here to load new
> +		 * vtcr value to vtcr_el2 register when re-enter guest mode.
> +		 */
> +		kvm_for_each_vcpu(i, vcpu, kvm)
> +			kvm_vcpu_kick(vcpu);
> +	} else if (kvm->enable_hdbss) {
> +		kvm->arch.mmu.vtcr &= ~(VTCR_EL2_HD | VTCR_EL2_HDBSS);
> +
> +		kvm_for_each_vcpu(i, vcpu, kvm) {
> +			/* Kick vcpus to flush hdbss buffer. */
> +			kvm_vcpu_kick(vcpu);
> +
> +			kvm_arm_vcpu_free_hdbss(vcpu);
> +		}
> +
> +		kvm->enable_hdbss = false;
> +	}
> +
> +	return ret;
> +
> +error_alloc:
> +	kvm_for_each_vcpu(i, vcpu, kvm) {
> +		if (!vcpu->arch.hdbss.base_phys && !vcpu->arch.hdbss.size)
> +			continue;
> +
> +		kvm_arm_vcpu_free_hdbss(vcpu);
> +	}
> +
> +	return ret;
> +}
> +
>   int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>   			    struct kvm_enable_cap *cap)
>   {
> @@ -132,6 +218,11 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>   		}
>   		mutex_unlock(&kvm->lock);
>   		break;
> +	case KVM_CAP_ARM_HW_DIRTY_STATE_TRACK:
> +		mutex_lock(&kvm->lock);
> +		r = kvm_cap_arm_enable_hdbss(kvm, cap);
> +		mutex_unlock(&kvm->lock);
> +		break;
>   	default:
>   		break;
>   	}
> @@ -420,6 +511,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   			r = kvm_supports_cacheable_pfnmap();
>   		break;
> 
> +	case KVM_CAP_ARM_HW_DIRTY_STATE_TRACK:
> +		r = system_supports_hdbss();
> +		break;
>   	default:
>   		r = 0;
>   	}
> @@ -1837,7 +1931,20 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
> 
>   void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>   {
> +	/*
> +	 * Flush all CPUs' dirty log buffers to the dirty_bitmap.  Called
> +	 * before reporting dirty_bitmap to userspace.  KVM flushes the buffers
> +	 * on all VM-Exits, thus we only need to kick running vCPUs to force a
> +	 * VM-Exit.
> +	 */
> +	struct kvm_vcpu *vcpu;
> +	unsigned long i;
> 
> +	if (!kvm->enable_hdbss)
> +		return;
> +
> +	kvm_for_each_vcpu(i, vcpu, kvm)
> +		kvm_vcpu_kick(vcpu);
>   }
> 
>   static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index cc7d5d1709cb..9ba0ea6305ef 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -412,6 +412,49 @@ static exit_handle_fn kvm_get_exit_handler(struct kvm_vcpu *vcpu)
>   	return arm_exit_handlers[esr_ec];
>   }
> 
> +static void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu)
> +{
> +	int idx, curr_idx;
> +	u64 *hdbss_buf;
> +	struct kvm *kvm = vcpu->kvm;
> +	u64 br_el2;
> +
> +	if (!kvm->enable_hdbss)
> +		return;
> +
> +	dsb(sy);
> +	isb();
> +	curr_idx = HDBSSPROD_IDX(read_sysreg_s(SYS_HDBSSPROD_EL2));
> +	br_el2 = HDBSSBR_EL2(vcpu->arch.hdbss.base_phys, vcpu->arch.hdbss.size);
> +
> +	/* Do nothing if HDBSS buffer is empty or br_el2 is NULL */
> +	if (curr_idx == 0 || br_el2 == 0)
> +		return;
> +
> +	hdbss_buf = page_address(phys_to_page(vcpu->arch.hdbss.base_phys));
> +	if (!hdbss_buf) {
> +		kvm_err("Enter flush hdbss buffer with buffer == NULL!");
> +		return;
> +	}
> +
> +	guard(write_lock_irqsave)(&vcpu->kvm->mmu_lock);
> +	for (idx = 0; idx < curr_idx; idx++) {
> +		u64 gpa;
> +
> +		gpa = hdbss_buf[idx];
> +		if (!(gpa & HDBSS_ENTRY_VALID))
> +			continue;
> +
> +		gpa &= HDBSS_ENTRY_IPA;
> +		kvm_vcpu_mark_page_dirty(vcpu, gpa >> PAGE_SHIFT);
> +	}
> +
> +	/* reset HDBSS index */
> +	write_sysreg_s(0, SYS_HDBSSPROD_EL2);
> +	vcpu->arch.hdbss.next_index = 0;
> +	isb();
> +}
> +
>   /*
>    * We may be single-stepping an emulated instruction. If the emulation
>    * has been completed in the kernel, we can return to userspace with a
> @@ -447,6 +490,8 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
>   {
>   	struct kvm_run *run = vcpu->run;
> 
> +	kvm_flush_hdbss_buffer(vcpu);
> +
>   	if (ARM_SERROR_PENDING(exception_index)) {
>   		/*
>   		 * The SError is handled by handle_exit_early(). If the guest
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 9984c492305a..3787c9c5810d 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -220,6 +220,7 @@ void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu)
>   	__vcpu_load_switch_sysregs(vcpu);
>   	__vcpu_load_activate_traps(vcpu);
>   	__load_stage2(vcpu->arch.hw_mmu, vcpu->arch.hw_mmu->arch);
> +	__load_hdbss(vcpu);
>   }
> 
>   void kvm_vcpu_put_vhe(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 7cc964af8d30..91a2f9dbb406 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1843,6 +1843,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (writable)
>   		prot |= KVM_PGTABLE_PROT_W;
> 
> +	if (writable && kvm->enable_hdbss && logging_active)
> +		prot |= KVM_PGTABLE_PROT_DBM;
> +
>   	if (exec_fault)
>   		prot |= KVM_PGTABLE_PROT_X;
> 
> @@ -1950,6 +1953,13 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
> 
>   	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
> 
> +	/*
> +	 * HDBSS buffer already flushed when enter handle_trap_exceptions().
> +	 * Nothing to do here.
> +	 */
> +	if (ESR_ELx_ISS2(esr) & ESR_ELx_HDBSSF)
> +		return 1;
> +
>   	if (esr_fsc_is_translation_fault(esr)) {
>   		/* Beyond sanitised PARange (which is the IPA limit) */
>   		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index 959532422d3a..65e8f890f863 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -161,6 +161,9 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu)
>   	free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
>   	kfree(vcpu->arch.vncr_tlb);
>   	kfree(vcpu->arch.ccsidr);
> +
> +	if (vcpu->arch.hdbss.base_phys || vcpu->arch.hdbss.size)
> +		kvm_arm_vcpu_free_hdbss(vcpu);
>   }
> 
>   static void kvm_vcpu_reset_sve(struct kvm_vcpu *vcpu)
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 5bd76cf394fa..aa8138604b1e 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -876,6 +876,7 @@ struct kvm {
>   	struct xarray mem_attr_array;
>   #endif
>   	char stats_id[KVM_STATS_NAME_SIZE];
> +	bool enable_hdbss;
>   };
> 
>   #define kvm_err(fmt, ...) \
> --
> 2.33.0
> 
> 


