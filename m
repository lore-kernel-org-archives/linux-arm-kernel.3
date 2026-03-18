Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597BF10775F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAkU63pLMoy/ab4JaKcBL7wEYweJaV+3lWwRK97+kIY=; b=BaeFYxcqa/wprdN5XA4JuhxwDQ
	Z2p10SIbMsfmeVi3uddeS2hXECTP9VN45+eSL+SQxwl7uMO9HuVNIQSwbxdhJLeIRnOc+e0WqQ/hn
	G6zPlzsqTRtNU7TWGZf+FXzOtwEWSNdZh7QjfByodk6/lUALr2IK/4YH0/3QoRZlYXfIsDzurzvYM
	T7xv4QZE9h4WVmEovfzrXO4Y8YUjjyUhPZsh0x12Be+PtoTv8pyaNivz69vat7CCd7SFsr6KiOhhK
	Buj0Cf9UzrNTjPj19uozix1FQ7Srge6um6DuVqfUP9IKedGWgGOjYz6QGA2TP14TybNXhhkh8lfoS
	IE1S83iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ujQ-000000094zZ-0n7l;
	Wed, 18 Mar 2026 17:30:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ujN-000000094ym-1Qec
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 353874417F;
	Wed, 18 Mar 2026 17:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807DCC19421;
	Wed, 18 Mar 2026 17:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855052;
	bh=XPx/yjvwyXAw7enHLNKPnNMYBVBUVEXGERhVxlQJpoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMeBMOAL3e7UC4bl+EQYKpGV94hdghAJhWzjCgt36Ph4uDLD37wBMd4hO+Nv5n1f0
	 M7EJsbDo3PubNZUZzLQxEslrOEcCxuTjcYqsGe6NhKWwhgufvkXGL1tX3r03sZhwA1
	 IP1sNZW9BHQ3R5aG14WWZ1mpN/Wy+BCw6oTbupuk9Ttp5eTbRXgSJZnlrVsEOXzWb7
	 r/c4b65UuoiPM80BvnIK5tPpgeKDZXHaCNGCHYItqyl68oTF9gC949U49c5iF3DlbS
	 6u9FHxJNDYgjixZu5RYwFEvmHVsfooz+c/opQjOPUzqn6+VCsalG2TUSq8yXa0VIXr
	 q42yyqIwwG1FQ==
Date: Wed, 18 Mar 2026 17:31:04 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 06/30] KVM: arm64: Pull ctxt_has_ helpers to start of
 sysreg-sr.h
Message-ID: <20260318173104.GD2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-6-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-6-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_103053_426774_0884342A 
X-CRM114-Status: GOOD (  17.35  )
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

On Fri, Mar 06, 2026 at 05:00:58PM +0000, Mark Brown wrote:
> Rather than add earlier prototypes of specific ctxt_has_ helpers let's just
> pull all their definitions to the top of sysreg-sr.h so they're all
> available to all the individual save/restore functions.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>

> ---
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 84 +++++++++++++++---------------
>  1 file changed, 41 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index a17cbe7582de..5624fd705ae3 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -16,8 +16,6 @@
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
>  
> -static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
> -
>  static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
>  {
>  	struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
> @@ -28,47 +26,6 @@ static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
>  	return vcpu;
>  }
>  
> -static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
> -{
> -	return host_data_ptr(host_ctxt) != ctxt;
> -}
> -
> -static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
> -{
> -	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> -
> -	if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
> -		return &vcpu->arch.external_mdscr_el1;
> -
> -	return &ctxt_sys_reg(ctxt, MDSCR_EL1);
> -}
> -
> -static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
> -{
> -	struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
> -
> -	if (!(ctxt_is_guest(ctxt) &&
> -	      test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
> -		return read_cpuid_id();
> -
> -	return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
> -}
> -
> -static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
> -{
> -	*ctxt_mdscr_el1(ctxt)	= read_sysreg(mdscr_el1);
> -
> -	// POR_EL0 can affect uaccess, so must be saved/restored early.
> -	if (ctxt_has_s1poe(ctxt))
> -		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
> -}
> -
> -static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
> -{
> -	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
> -	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
> -}
> -
>  static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
>  {
>  	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> @@ -131,6 +88,47 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
>  	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
>  }
>  
> +static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
> +{
> +	return host_data_ptr(host_ctxt) != ctxt;
> +}
> +
> +static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
> +{
> +	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> +
> +	if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
> +		return &vcpu->arch.external_mdscr_el1;
> +
> +	return &ctxt_sys_reg(ctxt, MDSCR_EL1);
> +}
> +
> +static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
> +{
> +	struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
> +
> +	if (!(ctxt_is_guest(ctxt) &&
> +	      test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
> +		return read_cpuid_id();
> +
> +	return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
> +}
> +
> +static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
> +{
> +	*ctxt_mdscr_el1(ctxt)	= read_sysreg(mdscr_el1);
> +
> +	// POR_EL0 can affect uaccess, so must be saved/restored early.
> +	if (ctxt_has_s1poe(ctxt))
> +		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
> +}
> +
> +static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
> +{
> +	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
> +	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
> +}
> +
>  static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>  {
>  	ctxt_sys_reg(ctxt, SCTLR_EL1)	= read_sysreg_el1(SYS_SCTLR);
> 
> -- 
> 2.47.3
> 
> 

