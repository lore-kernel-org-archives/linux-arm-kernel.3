Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065F0C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+YGRuTP0DFkwY53W+VAP0dMbCx4iIs4U3Fk1KxNIFU=; b=PL5KY2ERfHewK6wGl4l35j/gRE
	LRj+b/rMSc3K/HwJEDCftdhXLj03b7NKp5rufHiRXIlk0RdqQQMG7qYe3KYZfnfRfWYVRDCwW3pmY
	elGH766g2RI5m5G4Yvj6siaywXXHEv6jnd9/fjfb44fYn2gD2F0QTYdct7eQgquyF4DG2rNnbDD6Y
	gMdDi9gMZ1nzium6pVsbvMK1itGS0c57pEEMXm984u1IEs0KweNPb3x8+5szVhsCsRSUHwtRqb4jQ
	l5ORi2oddpn2WetB8gP56f5re1osBHeb9hiz3UJA2N5Xo506VNPSj0FrEM5SyRRRHMzRt0JGL7gtf
	MAMYOTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mWj-0000000F2pZ-1YqA;
	Wed, 02 Sep 2026 15:05:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mWh-0000000F2ow-0TIA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:05:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso10869955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788361521; x=1788966321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x+YGRuTP0DFkwY53W+VAP0dMbCx4iIs4U3Fk1KxNIFU=;
        b=Oj1fpLN9n9m+8PSkm2nFtWip/yisgTQ2LctNilOxabl4ROzGplToClTd9TEWcN4Mf+
         XbR5ias8D0I1UkOSwsA2XL7wSJy8YnrMgjX7DG7+oQkISA/gfwULrFVTdnHPxuBKDAZf
         /ol8hwyUo/ptE5k/2upKAfw1T8gIwsPA8JsCcMtf+vFoFR9Cyz1PdZCQj9KAinMj8Ujq
         FfKyTq5bbqMNaxxaDtzIDIiRT7uC2iuRE5jVTwYiQssi8PYteYyCuUcN5SOSktf7Sbda
         e4f0GwYdvPXyGzzrSJt4kkbE+ymLXIfcCMBdsHFeHAOvoVm/py2uNh4mJwX/kk65W5gt
         93fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361521; x=1788966321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+YGRuTP0DFkwY53W+VAP0dMbCx4iIs4U3Fk1KxNIFU=;
        b=O5tQUHQKPnMw+tO5LiHJ+YHfhnZFolnBJ8HbqX93tqWvewHKLanUSNz/ZLeRpKSUuO
         WcXjn3ZtNIGP5FTR7JyCFu6XgU0wOAnKNYp0vCwTDbyNz/qNJl0t/cWuLRZl4BmnE2d1
         4W1BnI3Re7751fvUikY0aue43O/KICBBhYSPtipSgUkYfqlc5Frd9yAVmbhg9nfspEV6
         1QfynsNUGXQZcomLkujVCFadzCE7bYYci+2cwYU53towmQP3cFbF/XSycj7rCRhTYs1+
         dNT4jLTl8gSXD626Gb12rH3blPSz6YaaLn0ND/SSZZ4RiuD8F9a+kJi+R3jjGS5V45vT
         7BSw==
X-Forwarded-Encrypted: i=1; AHgh+RoIBTwPhkSFzyh+e7McawXEQGxQ5Le60IrVwI3GHjwfXaMwBX8KCynxEQ8WnhUfJH/pXz7y9hSwwpTz7cUF33es@lists.infradead.org
X-Gm-Message-State: AFuF++kCekg7MJkuPnjulLPR3yOfYapa9Jky1hnV4xA9R9k3HvQ1XlY0
	Pni8babl6JMdv1RNEYTwhv9i+pifa7KysmdLvz2M3xeAmvY9kLvqiWThWrOwt+00Bg==
X-Gm-Gg: AR+sD11Nry+a/38wFSSfZPKG4Za1tHccGA9IcZvpDE2ZH3dIfzRMW8GvXZ5ukEQjYO/
	9V3rTce/xoJALASEuhJCXo5Zoa1oK4WRG1krPTTgLYBbUEVTy92+xlXakZHx/9PiIWxXrFB54Ih
	DysoP0hOi0uwVmEIlTtw7dYqghoQ+RPu0S5sy70gsla6PcG9KYJC7cBKRbl5pP2NNOjtXc2GfY0
	jjuuv1mNWT48m7sp6qGWoBwJ8RZy53920305jvkMI6ACRTWClaTkHTRwXry4Q+55iC8pxmy57kK
	MV1/Gp0sSMW1RxOWVWynUZyyMs9XKHYmirbqC1ivl9c+3bvNTceoFF8gQKIEqXOPkzU0vqCtwYD
	+4mlqqk0qz/HfKqqyE2wPqtUQ+9YRM9GzhHY/neUgvT9Wmx59qgJkO1ZBYG/SGnvnhhqZUMn+qI
	VMdzmPJfConVOwduweGetV/B1apP/D6O9xn0WDjuk1x+pAWP3vT8K5uNEvVOQ4+w==
X-Received: by 2002:a05:600c:a086:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49ce5815dddmr111164645e9.11.1788361518474;
        Wed, 02 Sep 2026 08:05:18 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm40161205e9.2.2026.09.02.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:05:16 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:05:12 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 05/17] KVM: arm64: Skip fixed-feature state flush for
 protected vCPUs
Message-ID: <apg7KNpamnpYi-kl@google.com>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
 <20260831163421.272420-6-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163421.272420-6-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_080523_179276_5BA5842D 
X-CRM114-Status: GOOD (  27.23  )
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

On Mon, Aug 31, 2026 at 05:34:09PM +0100, Fuad Tabba wrote:
> flush_hyp_vcpu() copies the host's mdcr_el2, TWI/TWE and debug state
> into the hyp vCPU on every entry, so for a protected vCPU the host's
> trap configuration overrides the one pkvm_vcpu_init_traps() computed
> at EL2. Move those copies into the non-protected branch, and sync the
> debug state back for non-protected vCPUs only: a protected guest's
> debug registers are hypervisor-owned, and it takes the host's TWI/TWE
> at vCPU load. MDCR_EL2.TDA traps only the guest's own accesses; it
> does not stop the world switch from loading host-supplied breakpoints
> and MDSCR_EL1.
> 
> EL2's mdcr_el2 starts from 0, and HPMN == 0 is reserved without
> FEAT_HPMN0. Set HPMN to the CPU's event counter count at vCPU load,
> the value the host's copy carried; a protected guest's PMU accesses
> trap regardless.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 31 +++++++++++++++++++-----------
>  arch/arm64/kvm/hyp/nvhe/pkvm.c     |  2 +-
>  2 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index ca7122b0bccdd..14e847b122abf 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -231,7 +231,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	u8 esr_ec;
>  
>  	fpsimd_sve_flush();
> -	flush_debug_state(hyp_vcpu);
>  
>  	/*
>  	 * If we deal with a non-protected guest and the state is potentially
> @@ -241,7 +240,14 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
>  		if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
>  			flush_hyp_vcpu_state(hyp_vcpu);
> +
> +		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> +		hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> +							 (HCR_TWI | HCR_TWE);
> +
> +		hyp_vcpu->vcpu.arch.mdcr_el2 = host_vcpu->arch.mdcr_el2;
>  		hyp_vcpu->vcpu.arch.iflags = host_vcpu->arch.iflags;
> +		flush_debug_state(hyp_vcpu);
>  	} else {
>  		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
>  	}
> @@ -249,17 +255,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	/* __hyp_running_vcpu must be NULL in a guest context. */
>  	hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
>  
> -	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
>  	/*
> -	 * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
> -	 * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
> -	 * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
> +	 * A host-injected vSError is masked by the guest's own PSTATE.A, so it
> +	 * applies to protected guests too.
>  	 */
> -	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
> -	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> -						 (HCR_TWI | HCR_TWE | HCR_VSE);
> -
> -	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
> +	hyp_vcpu->vcpu.arch.hcr_el2 &= ~HCR_VSE;
> +	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) & HCR_VSE;
> +	hyp_vcpu->vcpu.arch.vsesr_el2 = host_vcpu->arch.vsesr_el2;
>  
>  	flush_hyp_vgic_state(hyp_vcpu);
>  
> @@ -288,7 +290,8 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
>  	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
>  
>  	fpsimd_sve_sync(&hyp_vcpu->vcpu);
> -	sync_debug_state(hyp_vcpu);
> +	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> +		sync_debug_state(hyp_vcpu);

nit: We can't use the else arm below?

>  
>  	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
>  		host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
> @@ -329,6 +332,12 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
>  		/* Propagate WFx trapping flags */
>  		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
>  		hyp_vcpu->vcpu.arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
> +
> +		/* HPMN == 0 is reserved without FEAT_HPMN0. */
> +		if (system_supports_pmuv3())
> +			u64p_replace_bits(&hyp_vcpu->vcpu.arch.mdcr_el2,
> +					  FIELD_GET(ARMV8_PMU_PMCR_N, read_sysreg(pmcr_el0)),
> +					  MDCR_EL2_HPMN);
>  	} else {
>  		memcpy(&hyp_vcpu->vcpu.arch.fgt, hyp_vcpu->host_vcpu->arch.fgt,
>  		       sizeof(hyp_vcpu->vcpu.arch.fgt));
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 459bd9eb7e4bc..e85f13233da08 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -102,7 +102,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
>  
>  	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP)) {
>  		val |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
> -		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME | MDCR_EL2_HPMN_MASK);
> +		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME);
>  	}
>  
>  	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DebugVer, IMP))
> -- 
> 2.39.5
> 

