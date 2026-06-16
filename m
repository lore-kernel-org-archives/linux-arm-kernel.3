Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94A7CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 20:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mX65hj6pHJKi5UZV5lw/UMIZ0zXM54bmOLByN+V/vGs=; b=gj+tp/eKYg60oGw4lejO/W+9fy
	Y7cWasmaGeKKkP7+7tj52r4jxh4PhB5UzRsg2JZYCMHEdmAad+LsddRciXq0IlBzsZaiEY2HgwcQt
	Bcv3Cgndw/pPWvLfYQ2VNYkUToODnpBu0YaZvFO2FwL7F7/DqeKKw0O/Vd/LzaTTHWxTvQC7En3xI
	j/Kw0kYcJO2fMOVLX0wwpZJ7BUc39n64h78tYNxQbneakl+Q2lCOoGd8oWMdEzAPnPDMQywl2ZAxP
	YjNgqHwQNo3OYQaJzYcuh8dQGmSbf6TmcQ0yJZyDFsPX3x3VHu++7ghPtt8C0gsnn5clWOlWZfTLM
	GLuGufEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaBG-0000000GHSj-0WFz;
	Tue, 16 Jun 2026 20:14:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaBF-0000000GHSd-27KC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 20:14:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7A0B43457;
	Tue, 16 Jun 2026 20:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6044B1F000E9;
	Tue, 16 Jun 2026 20:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781640880;
	bh=mX65hj6pHJKi5UZV5lw/UMIZ0zXM54bmOLByN+V/vGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QiYGCEuTZ/ct0jFJNuBbo5YeJwkX0i3J2Rj1OFr54KSD85o8iFZ6avC0An/qnKWXW
	 p7bS61sBaEzlSOw0ZS3VmR2ao0iNIQt3SErQxjE8sBf9Tj2GlXMhEUyoOl9ACCSmBC
	 CIbdHIDMvZ0W4ejSakSn2uG9lMyQoX63Z16Uh4ZfHNAKDgtWA1GGszKEyd/ZefhOQ9
	 EQy9dZil82utpIkQoGZ06OZ2QJfdCbIajeDjO9+VzpSAyEKclk+jbb9oOhsfSUHtuP
	 aLbsDP5W7TQcSxTKGByZFqo32tj2BlM2txKR5PAt6k5KK632bf4sucoSBc87TgPD5V
	 OMBsJ1WpoVMJg==
Date: Tue, 16 Jun 2026 13:14:39 -0700
From: Oliver Upton <oupton@kernel.org>
To: Weiming Shi <bestswngs@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Zhong Wang <wangzhong.c0ss4ck@bytedance.com>,
	Xuanqing Shi <shixuanqing.11@bytedance.com>
Subject: Re: [PATCH] KVM: arm64: nv: Translate vEL2 PSTATE to EL1 in
 kvm_hyp_handle_mops()
Message-ID: <ajGur_YEMoMLZPSF@kernel.org>
References: <20260616114943.81188-2-bestswngs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616114943.81188-2-bestswngs@gmail.com>
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

Hi Weiming,

Thanks for the fix.

On Tue, Jun 16, 2026 at 07:49:44PM +0800, Weiming Shi wrote:
> When a nested virtualisation guest is running its virtual EL2 (vEL2),
> fixup_guest_exit() rewrites vcpu_cpsr() to the guest's virtual exception
> level: a hardware PSTATE.M of EL1{t,h} is presented as EL2{t,h}. The
> hardware, however, executes vEL2 at EL1.
> 
> kvm_hyp_handle_mops() runs on the fast guest re-entry path, where it
> clears the single-step bit and restores SPSR_EL2 directly from
> vcpu_cpsr():
> 
> 	*vcpu_cpsr(vcpu) &= ~DBG_SPSR_SS;
> 	write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> 
> For a guest hypervisor this writes the vEL2 view (PSTATE.M == EL2h) into
> the hardware SPSR_EL2 without translating it back. The fast path re-enters
> the guest via __guest_enter()/ERET without going through
> __sysreg_restore_el2_return_state(), so neither to_hw_pstate() nor the
> "return to a less privileged mode" safety check there (which would set
> PSR_IL_BIT) is applied. The ERET therefore restores PSTATE.M = EL2h and
> re-enters the guest at the real EL2 with a guest-controlled ELR, escaping
> stage-2 and the guest/host boundary.
> 
> This is reachable on a kernel with FEAT_MOPS running a KVM nested guest
> (kvm-arm.mode=nested): KVM sets HCRX_EL2.MCE2, which the guest hypervisor
> cannot clear for its own context (is_nested_ctxt() is false), so a vEL2
> MOPS exception is taken to the host and dispatched to kvm_hyp_handle_mops()
> with VCPU_IN_HYP_CONTEXT set.
> 
> Translate EL2{t,h} back to EL1{t,h} before writing SPSR_EL2, mirroring
> kvm_hyp_handle_eret(). For non-nested guests vcpu_cpsr() never holds an
> EL2 mode, so the translation is a no-op and behaviour is unchanged.

The changelog is unnecessarily verbose, instead:

  kvm_hyp_handle_mops() resets the single-step state machine as part of
  rewinding state for a MOPS exception by modifying vcpu_cpsr() and
  writing the result directly into hardware.

  In the case of nested virtualization, vcpu_cpsr() is a synthetic value
  such that the rest of KVM can deal with vEL2 cleanly. That means the 
  value requires translation before being written into hardware, which is
  unfortunately missing from the MOPS handler.

  Fix it by directly modifying SPSR_EL2 and avoiding the synthetic state
  altogether, which will be resynchronized on the next 'full' exit back
  to KVM.

Also:

Cc: stable@vger.kernel.org

Definitely meets the bar :)

> Fixes: 2de451a329cf ("KVM: arm64: Add handler for MOPS exceptions")
> Assisted-by: Claude:claude-opus-4-8
> Reported-by: Zhong Wang <wangzhong.c0ss4ck@bytedance.com>
> Reported-by: Xuanqing Shi <shixuanqing.11@bytedance.com>
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index e9b36a3b27bbc..a6b7963ddbf0b 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -448,6 +448,8 @@ static inline bool __populate_fault_info(struct kvm_vcpu *vcpu)
>  
>  static inline bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exit_code)
>  {
> +	u64 spsr, mode;
> +
>  	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
>  	arm64_mops_reset_regs(vcpu_gp_regs(vcpu), vcpu->arch.fault.esr_el2);
>  	write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
> @@ -457,7 +459,26 @@ static inline bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	 * instruction.
>  	 */
>  	*vcpu_cpsr(vcpu) &= ~DBG_SPSR_SS;
> -	write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> +
> +	/*
> +	 * For a guest hypervisor, vcpu_cpsr() holds the vEL2 view
> +	 * (PSTATE.M == EL2h) installed by fixup_guest_exit(), but vEL2
> +	 * runs at EL1. Translate it back before restoring SPSR_EL2, as in
> +	 * kvm_hyp_handle_eret().
> +	 */
> +	spsr = *vcpu_cpsr(vcpu);
> +	mode = spsr & (PSR_MODE_MASK | PSR_MODE32_BIT);
> +	switch (mode) {
> +	case PSR_MODE_EL2t:
> +		mode = PSR_MODE_EL1t;
> +		break;
> +	case PSR_MODE_EL2h:
> +		mode = PSR_MODE_EL1h;
> +		break;
> +	}
> +	spsr = (spsr & ~(PSR_MODE_MASK | PSR_MODE32_BIT)) | mode;
> +
> +	write_sysreg_el2(spsr, SYS_SPSR);

As I allude to in the modified changelog, I'd rather we just manipulate
the hardware value of SPSR_EL2 directly. We already do this in
kvm_hyp_handle_eret()

	spsr = read_sysreg_el2(SYS_SPSR);
	write_sysreg_el2(spsr & ~DBG_SPSR_SS, SYS_SPSR);

Thanks,
Oliver

