Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DEDEDA68E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWtnwgsWY+aXWMpSDD7oYksPIe7RPtQw+HrZTw9fzmo=; b=Z1VBIvOxIaxFIsDexum/m+SKJ0
	6/kqijnrd8aMlDa5b++QwfydUL9RLBNVZmid1oM7dwjb0qtI2+0dss+dgh4lB+jXdwhmGi3uuknU2
	fSG89PNALlasHPjmBWCvs8dEtA6pMKBzfBAQkgFhmqDDwZN1nPgc9ryycsh1tXzyRItd3tpVX8SLX
	sDNF/UuvAzZf4Of9gnxRPAqMM9xu9eJJtkftKXtD1FM9EFqDu22Kt/weLMJ2EOlyRFG2XvP1dhwY5
	SWAzVmQbCRPl4NfJiC1oVBWSHk/zd6Deunj/yz7pswzZMo/+1LhtQtpQjQOBSzXTvvrgTRnrIPRCt
	6KVvnQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRw5-0000000FS0k-1Kle;
	Tue, 03 Mar 2026 15:45:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRw4-0000000FS0M-0not
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:45:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 453FC60053;
	Tue,  3 Mar 2026 15:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D603C116C6;
	Tue,  3 Mar 2026 15:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772552723;
	bh=NUOXljTmyEDWmFoNWuqeCGEceTr+9T1FfZUnN2JoicQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=inPxIq+4LXTnLQcAVhY1kUwBow604IPD6/gzLaYafeWUMzEc+5rjaTvs7wwxzw/K/
	 sWeyKo8hHuXaE0K05ZHO1PBj7S8eFKNnpX3t9ttA/HqDFu0GqHdSNoaT+Q7r8MzWbU
	 MKAyyVPoIPSBR9NOhs+iBqIbZDH3ir95p2/Fb/KezvNYWWjUMOXtyjNwBAQdW0kxdi
	 pXvnbxWoK6pWg9KigG7uHSDom3kJvrDHf68hVVbcaNizQ89jq9wk9j2ln3bAxBql8x
	 SKRTj0LfQNMSpZvWv3+qeY+TLtRgs+gzkkA0yNwBUpWPx5+4PdAIyB/aLdRfvIY9qP
	 7ButtyUJ4xZoA==
Date: Tue, 3 Mar 2026 15:45:16 +0000
From: Will Deacon <will@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 07/35] KVM: arm64: Remove is_protected_kvm_enabled()
 checks from hypercalls
Message-ID: <aacCDMhYJLMWVaIQ@willie-the-truck>
References: <20260119124629.2563-1-will@kernel.org>
 <20260119124629.2563-8-will@kernel.org>
 <aYtGWwcVrDQeGCma@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYtGWwcVrDQeGCma@raptor>
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

Hi Alex,

Thanks for having a look.

On Tue, Feb 10, 2026 at 02:53:15PM +0000, Alexandru Elisei wrote:
> On Mon, Jan 19, 2026 at 12:46:00PM +0000, Will Deacon wrote:
> > When pKVM is not enabled, the host shouldn't issue pKVM-specific
> > hypercalls and so there's no point checking for this in the pKVM
> > hypercall handlers.
> > 
> > Remove the redundant is_protected_kvm_enabled() checks from each
> > hypercall and instead rejig the hypercall table so that the
> > pKVM-specific hypercalls are unreachable when pKVM is not being used.
> > 
> > Reviewed-by: Quentin Perret <qperret@google.com>
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/include/asm/kvm_asm.h   | 20 ++++++----
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 63 ++++++++++--------------------
> >  2 files changed, 32 insertions(+), 51 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index a1ad12c72ebf..2076005e9253 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -60,16 +60,9 @@ enum __kvm_host_smccc_func {
> >  	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
> >  	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
> >  	__KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
> > +	__KVM_HOST_SMCCC_FUNC_MIN_PKVM = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
> >  
> >  	/* Hypercalls available after pKVM finalisation */
> 
> This comment should be removed, I think the functions that follow, up to
> and including __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM, are also available with
> kvm-arm.mode=nvhe.
>
> If you agree that the comment should be removed, maybe a different name for
> the define above would be more appropriate, one that does not imply pkvm?

I'd rather keep the comment, as it delimits the blocks of hypercalls and
is informative for the case when pKVM is enabled.

I suppose we could reword it like:


diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index c4246c34509a..6c79f7504d80 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -51,7 +51,7 @@
 #include <linux/mm.h>
 
 enum __kvm_host_smccc_func {
-       /* Hypercalls available only prior to pKVM finalisation */
+       /* Hypercalls that are unavailable once pKVM has finalised. */
        /* __KVM_HOST_SMCCC_FUNC___kvm_hyp_init */
        __KVM_HOST_SMCCC_FUNC___pkvm_init = __KVM_HOST_SMCCC_FUNC___kvm_hyp_init + 1,
        __KVM_HOST_SMCCC_FUNC___pkvm_create_private_mapping,
@@ -62,7 +62,7 @@ enum __kvm_host_smccc_func {
        __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
        __KVM_HOST_SMCCC_FUNC_MIN_PKVM = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
 
-       /* Hypercalls available after pKVM finalisation */
+       /* Hypercalls that are always available and common to [nh]VHE/pKVM. */
        __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
        __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
        __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
@@ -76,7 +76,7 @@ enum __kvm_host_smccc_func {
        __KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
        __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM = __KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 
-       /* Hypercalls available only when pKVM has finalised */
+       /* Hypercalls that are available only when pKVM has finalised. */
        __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
        __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
        __KVM_HOST_SMCCC_FUNC___pkvm_host_donate_guest,


WDYT?

> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index a7c689152f68..eb5cfe32b2c9 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -169,9 +169,6 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
> >  	DECLARE_REG(u64, hcr_el2, host_ctxt, 3);
> >  	struct pkvm_hyp_vcpu *hyp_vcpu;
> >  
> > -	if (!is_protected_kvm_enabled())
> > -		return;
> > -
> >  	hyp_vcpu = pkvm_load_hyp_vcpu(handle, vcpu_idx);
> >  	if (!hyp_vcpu)
> >  		return;
> 
> I've always wondered about this. For some hypercalls, all the handler does is
> marshal the arguments for the actual function (for example,
> handle___kvm_adjust_pc() -> __kvm_adjust_pc()), but for others, like this one,
> the handler also has extra checks before calling the actual function.  Would you
> mind explaining what the rationale is?

Basically, any hypercall available post-pKVM finalisation needs to check
all pointer arguments that it takes. It's best to do this in the early
handler so that the backend code can just operate on a safe pointer
(either because the underlying memory has been pinned or because it's
been repainted to point at a hypervisor-managed data structure). That
also allows us to share a bunch of code (e.g. __kvm_vcpu_run()) with
nVHE.

The reason handle___kvm_adjust_pc() doesn't do this is simply because
this series focusses purely on the guest memory side of things; once
we've got that, then we can work on hardening the vCPU/VM structures and
these hypercalls will get tightened up by that work. In fact, that
specific hypercall will do _nothing_ for a protected VM!

Will

