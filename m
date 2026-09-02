Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2549CC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjVl9xzFfNgY952LphDWb8k5JraTM7MAooStXeF8NfA=; b=0AyyajHvdfrrotgyujKOIrYtgp
	0biS8uVUBGyr5QPsZrhofLfb5YcDoAOaZGnH/cXA62LkuAyN1b11oDWXM1dmoqIqGIV2k98oO7gqD
	A74SM8zO/kZ2FR/RX0HTfEmzNvVt3UJMVbc9tfEsjIy/xeKgvrc/7JIOGf38bGqbJeRwyCLnRDu2B
	YjR3R2r+63dC8XvT4MNjmlgB87OK1eANwX3aFzm4DyZ+NI5m6WNu8Yjo85LyFGgkuWeCjjsNfeGv6
	85XJ14AATM+RmZtxZTBXF5oTpY8SnqszaEpETOOSamQ8vs9gMifHv5qKQ2vpGuEQmJ9NtiOlGRJd1
	J4vkiDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mrd-0000000F4dj-3CC9;
	Wed, 02 Sep 2026 15:27:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mra-0000000F4dH-1kx2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:27:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so11922915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788362816; x=1788967616; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sjVl9xzFfNgY952LphDWb8k5JraTM7MAooStXeF8NfA=;
        b=MVgA90usT5fLzK3KcFA5lBBewoiwWwRO6YKQaB7CCWvKV3Fy+RERFbSfqmAFVnS+Fi
         Rn6mzd78thiHjEFOb/9xi+Cwuw2upybQmKdG+3QagU+anIi8rHv1B7TVEudQB0t6rZnI
         AZWaoNtgyLzzzfMNysswVk8fyqX98YpPGaklHvwYsUjtoYJPEAEsYqBg9NBdnOX/VDiy
         y5zhtvfRwepAxeA7utpeacRgkEzcrs06frjNHT5NLyT1Kw8NviObfsJUsLCz3A/dQwN6
         VSDMjgg61+JfuH2igccFh+75iAOc+D+6zdwvnmWiBXzq9QJJI1RQUfv0IiW08D/hfOQe
         zKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362816; x=1788967616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjVl9xzFfNgY952LphDWb8k5JraTM7MAooStXeF8NfA=;
        b=XgWx+2LfqEAmN/QMtzhlTO8lLNmyILWdsWyiUBfRTS9VYwMxDiM/op3xJGKF8odf4J
         iUrFdjkM1HblWhgRGAkfO8S7Gtwo0oxiHoJbYLmHsQVJHPAOriFiKudwtQKe/uXAqAZA
         9xVLrs2cVP3WzQTEAxLFRaY5i+M98yDlRwlXu0JkZaz8yvWv74eZDBTjS4ld5IOtXV9P
         EU7V32KifqJTwHZGXfhEgcvE+n/oHM/45W6sRk93sjwhoY21DiseBFj8hfXN76jrnV/W
         aMDFWG/tPACvjSHrE22TPFx5yia1n5cURIgN8BMt0KQvjLkfDaJ42K7F/DvhU1fe6BkW
         n4DA==
X-Forwarded-Encrypted: i=1; AHgh+RqalxMIPnTQdfqGLVc1mSo6AzHBBCnbuUDAJn9noj0WTldT8BThfRlhbRgh3q3Fh18JU3QbP5qo/Cz723RCjvsY@lists.infradead.org
X-Gm-Message-State: AFuF++lyNOI5D9OTYK6Z9MfVlBXymftzdfZ3NeGVkJcuKerZIv+sDkEm
	W53k/FKsuA94s6A/XNuLQlTeaxuw07k+mfrLBHiWBRBtzI7jxFUi7ii3X38gIrznOw==
X-Gm-Gg: AR+sD12AtPvFajSma177fZ2X3xc+zTWvjdQ6/RC8WL3WyyRJ04xTlcGrGWi7PdnJvw8
	ZJJzH0acchpOsEWxEZxznpOP80+cNk6l1+SqFPzZiGh4qBELcMvVOI2m7p6Xpvi4sItSgAXJsvV
	Ch2e43S4OWhFNXYhsR2yUL8RN0r7vRaj1k3LCiYIZa4SV1RjcrvUcL6DNLtHyiG0hVM8Mrg1kZU
	4NCzEyp+xWfnDZIQzKzA0h4ikH9AeK71BMQQFOhIWC4nCCMzklSwumKz2B3sCRFPFzf/MIUnoHe
	uk7jXQmcd5Wk0iyioZWH5x7aMB6lecbmBJ+pRo9FgYbHkQ0pEwtxcVVzeVFJuc8f8SnF3E9/mZQ
	hVbB2golmMyzxohQwUC8BdtmuxXaRSByxcfoFG/j3X7u9iIwSVBwuL6anRRCB6+DrLecfds0Nsi
	9oBmQV1F5Q1e3PPuHb3e+WZpRsOSer+geGbIJBURWwbMK6iOJXdpMgWi6NS+txUlAQdD6CbcUiu
	ve+D++hrY8kQYJIXPCBurL2m1taIOPgBJhxQDXgNJU=
X-Received: by 2002:a05:600c:1906:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49ce57e7a9dmr97272945e9.4.1788362815816;
        Wed, 02 Sep 2026 08:26:55 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4642235sm77916425e9.2.2026.09.02.08.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:26:54 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:26:51 +0100
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
Message-ID: <aphAO_nmoTzI6Yvf@google.com>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
 <20260831163421.272420-6-fuad.tabba@linux.dev>
 <apg7KNpamnpYi-kl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apg7KNpamnpYi-kl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_082658_493117_5B3D3C3D 
X-CRM114-Status: GOOD (  30.40  )
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

On Wed, Sep 02, 2026 at 04:05:12PM +0100, Vincent Donnefort wrote:
> On Mon, Aug 31, 2026 at 05:34:09PM +0100, Fuad Tabba wrote:
> > flush_hyp_vcpu() copies the host's mdcr_el2, TWI/TWE and debug state
> > into the hyp vCPU on every entry, so for a protected vCPU the host's
> > trap configuration overrides the one pkvm_vcpu_init_traps() computed
> > at EL2. Move those copies into the non-protected branch, and sync the
> > debug state back for non-protected vCPUs only: a protected guest's
> > debug registers are hypervisor-owned, and it takes the host's TWI/TWE
> > at vCPU load. MDCR_EL2.TDA traps only the guest's own accesses; it
> > does not stop the world switch from loading host-supplied breakpoints
> > and MDSCR_EL1.
> > 
> > EL2's mdcr_el2 starts from 0, and HPMN == 0 is reserved without
> > FEAT_HPMN0. Set HPMN to the CPU's event counter count at vCPU load,
> > the value the host's copy carried; a protected guest's PMU accesses
> > trap regardless.
> > 
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 31 +++++++++++++++++++-----------
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c     |  2 +-
> >  2 files changed, 21 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index ca7122b0bccdd..14e847b122abf 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -231,7 +231,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  	u8 esr_ec;
> >  
> >  	fpsimd_sve_flush();
> > -	flush_debug_state(hyp_vcpu);
> >  
> >  	/*
> >  	 * If we deal with a non-protected guest and the state is potentially
> > @@ -241,7 +240,14 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> >  		if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
> >  			flush_hyp_vcpu_state(hyp_vcpu);
> > +
> > +		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> > +		hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> > +							 (HCR_TWI | HCR_TWE);
> > +
> > +		hyp_vcpu->vcpu.arch.mdcr_el2 = host_vcpu->arch.mdcr_el2;
> >  		hyp_vcpu->vcpu.arch.iflags = host_vcpu->arch.iflags;
> > +		flush_debug_state(hyp_vcpu);
> >  	} else {
> >  		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
> >  	}
> > @@ -249,17 +255,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  	/* __hyp_running_vcpu must be NULL in a guest context. */
> >  	hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
> >  
> > -	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
> >  	/*
> > -	 * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
> > -	 * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
> > -	 * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
> > +	 * A host-injected vSError is masked by the guest's own PSTATE.A, so it
> > +	 * applies to protected guests too.
> >  	 */
> > -	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
> > -	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> > -						 (HCR_TWI | HCR_TWE | HCR_VSE);
> > -
> > -	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
> > +	hyp_vcpu->vcpu.arch.hcr_el2 &= ~HCR_VSE;
> > +	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) & HCR_VSE;
> > +	hyp_vcpu->vcpu.arch.vsesr_el2 = host_vcpu->arch.vsesr_el2;
> >  
> >  	flush_hyp_vgic_state(hyp_vcpu);
> >  
> > @@ -288,7 +290,8 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
> >  	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> >  
> >  	fpsimd_sve_sync(&hyp_vcpu->vcpu);
> > -	sync_debug_state(hyp_vcpu);
> > +	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +		sync_debug_state(hyp_vcpu);
> 
> nit: We can't use the else arm below?

or actually could we move the check into sync_debug_state() just like
sync_hyp_timer_state() does?

> 
> >  
> >  	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> >  		host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
> > @@ -329,6 +332,12 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
> >  		/* Propagate WFx trapping flags */
> >  		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
> >  		hyp_vcpu->vcpu.arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
> > +
> > +		/* HPMN == 0 is reserved without FEAT_HPMN0. */
> > +		if (system_supports_pmuv3())
> > +			u64p_replace_bits(&hyp_vcpu->vcpu.arch.mdcr_el2,
> > +					  FIELD_GET(ARMV8_PMU_PMCR_N, read_sysreg(pmcr_el0)),
> > +					  MDCR_EL2_HPMN);
> >  	} else {
> >  		memcpy(&hyp_vcpu->vcpu.arch.fgt, hyp_vcpu->host_vcpu->arch.fgt,
> >  		       sizeof(hyp_vcpu->vcpu.arch.fgt));
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 459bd9eb7e4bc..e85f13233da08 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -102,7 +102,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
> >  
> >  	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP)) {
> >  		val |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
> > -		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME | MDCR_EL2_HPMN_MASK);
> > +		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME);
> >  	}
> >  
> >  	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DebugVer, IMP))
> > -- 
> > 2.39.5
> > 

-- 
Vincent

