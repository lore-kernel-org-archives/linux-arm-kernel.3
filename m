Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFA1C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+wVm0O3fLs717kLlJ0lgkcnKr3swR2QmyL6mIFat3o=; b=iVEEZbJMuM5EMSjeY7vaDJRLfD
	Uicmmj1YCurqwymfUs/GHYaPI0OK3Y0OVe7v6v3UQ+K3941XzKZdC6EV8PNyHPG/KRaoSDuwheFxV
	9IU7MTBii0VlfYNwkGPL5RGA8gaaHkF0Xm6Zx9KUVHy57MedjLJvGrm6B4pH0WWKzcjDk1woiP8Pb
	VNYnE4dY2+Fc3Ts/3NfTN0yI6yEYzgfx8twI20razOI8B89SzPZYS8EJKnYnhu4g+KOqzepG9m6QV
	ekGotQO1divBtdCZz8mEQO7M/tnEvWE07ZEBlJGRc0p7bStXZ45XKwBgKD65WUTZRkjHvHZhxXQOf
	kG3cPF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hxU-0000000EJmg-2mu2;
	Wed, 02 Sep 2026 10:12:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hxS-0000000EJmB-0yDx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:12:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 978F1165C;
	Wed,  2 Sep 2026 03:12:34 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4343F3F882;
	Wed,  2 Sep 2026 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788343958; bh=WAV5GySQgV5zJK3fV42hf/X4XKvZR2TNrIIR65/Ii/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvGJZjuXcefswVZMeXVpzZFWYLDCPY4NfBo2oEJ6eLUHq+gAqWIKw/uOcGoO9GPae
	 3z9256KeR1MmyNSGzfZ0fhgy6CpRK5EkhAU1silcMJeCLHZd4qOUtM0ZvI+xZhq++8
	 NnmmjoohY2pjIoVgViPORTaAN8Klu8+QnHO/0n5E=
Date: Wed, 2 Sep 2026 11:12:30 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 04/17] KVM: arm64: Introduce per-EC entry handlers for
 pKVM
Message-ID: <apf2jvCicXlw7JYP@e143914.arm.com>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
 <20260831163421.272420-5-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163421.272420-5-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_031242_394835_90CA3BEE 
X-CRM114-Status: GOOD (  23.23  )
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

On Mon, Aug 31, 2026 at 05:34:08PM +0100, Fuad Tabba wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
> Add an ESR_EL2.EC-indexed handler table, entry_hyp_vm_handlers[],
> consulted from flush_hyp_vcpu() on re-entry when the previous exit was
> a trap: sync_hyp_vcpu() records the exit reason in the hyp vCPU as
> exit_code, and the trap's exception class comes from its ESR_EL2.
> 
> Entry carries the host's requested PC updates to the hyp vCPU: add
> vcpu_copy_flag() to copy a masked set of flags between the two vCPU
> structures, with PC_UPDATE_REQ covering INCREMENT_PC and the
> pending-exception flags. The wholesale iflags copy moves into the
> non-protected branch; a protected vCPU takes only PC_UPDATE_REQ.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Not really looked at nVHE much (or pkvm ever), but:

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/include/asm/kvm_host.h      | 19 +++++++++++++
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 ++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c     | 39 +++++++++++++++++++++++---
>  3 files changed, 57 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 27fe0cd5b2d7a..78a4d387f9fd4 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1033,11 +1033,28 @@ struct kvm_vcpu_arch {
>  		set;						\
>  	})
>  
> +#define __vcpu_copy_flag(vt, vs, flagset, f, m)			\
> +	do {							\
> +		typeof(vs->arch.flagset) tmp, val;		\
> +								\
> +		__build_check_flag(vs, flagset, f, m);		\
> +								\
> +		val = READ_ONCE(vs->arch.flagset);		\
> +		val &= (m);					\
> +		__vcpu_flags_preempt_disable();			\
> +		tmp = READ_ONCE(vt->arch.flagset);		\
> +		tmp &= ~(m);					\
> +		tmp |= val;					\
> +		WRITE_ONCE(vt->arch.flagset, tmp);		\
> +		__vcpu_flags_preempt_enable();			\
> +	} while (0)
> +
>  #define vcpu_get_flag(v, ...)	__vcpu_get_flag((v), __VA_ARGS__)
>  #define vcpu_set_flag(v, ...)	__vcpu_set_flag((v), __VA_ARGS__)
>  #define vcpu_clear_flag(v, ...)	__vcpu_clear_flag((v), __VA_ARGS__)
>  #define vcpu_test_and_clear_flag(v, ...)			\
>  	__vcpu_test_and_clear_flag((v), __VA_ARGS__)
> +#define vcpu_copy_flag(vt, vs, ...) __vcpu_copy_flag((vt), (vs), __VA_ARGS__)
>  
>  /* KVM_ARM_VCPU_INIT completed */
>  #define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(0))
> @@ -1055,6 +1072,8 @@ struct kvm_vcpu_arch {
>  #define INCREMENT_PC		__vcpu_single_flag(iflags, BIT(1))
>  /* Target EL/MODE (not a single flag, but let's abuse the macro) */
>  #define EXCEPT_MASK		__vcpu_single_flag(iflags, GENMASK(3, 1))
> +/* Cover both PENDING_EXCEPTION and EXCEPT_MASK for global operations */
> +#define PC_UPDATE_REQ		__vcpu_single_flag(iflags, GENMASK(3, 0))
>  /* Host-set: the hyp flushes the non-protected vCPU state in on entry */
>  #define PKVM_HOST_STATE_DIRTY	__vcpu_single_flag(iflags, BIT(4))
>  
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index c904647d2f760..49a0a992047ba 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -26,6 +26,9 @@ struct pkvm_hyp_vcpu {
>  	 * per-cpu pointer tracking us. Otherwise, NULL if not loaded.
>  	 */
>  	struct pkvm_hyp_vcpu **loaded_hyp_vcpu;
> +
> +	/* The previous exit's ARM_EXCEPTION_* code. */
> +	u32 exit_code;
>  };
>  
>  /*
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index b6bfe502bcd04..ca7122b0bccdd 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -31,6 +31,17 @@ unsigned int hyp_gicv3_nr_lr;
>  
>  void __kvm_hyp_host_forward_smc(struct kvm_cpu_context *host_ctxt);
>  
> +typedef void (*hyp_entry_exit_handler_fn)(struct pkvm_hyp_vcpu *);
> +
> +static void handle_vm_entry_generic(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	vcpu_copy_flag(&hyp_vcpu->vcpu, hyp_vcpu->host_vcpu, PC_UPDATE_REQ);
> +}

This is added here because the full copy of iflags was moved into the
!pkvm_hyp_vcpu_is_protected() section, so is needed temporarily until
each EC has its own handler.

Thanks,
Joey

