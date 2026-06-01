Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E618CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhFxldIBjPBUTua/YfxeMMHdCARnPekS5WZgGemC+8Q=; b=2XbcjVA1a2uAc/sscN/NeB5H4g
	X8NvCfIW6Lp13TI0KBwZSYH4K+m92b2Y+M7rkxzZAEiFdgnJNB90uHzUcANUOMrZLCMqvn5GUE5ML
	IngMtTzS7U8gy1ZYHvxHMHtUbxAXHTc9r+FiylcOcPt3mO8d85JEPOiGwdheUGleIqr0tsyVVw5UX
	t5I7iiT44YlTtKjmbMFVB6eBusy5vWJ1qWwM40ph1PXjqP98fextff5mZh5LBBaI5qU+Zwzf22gce
	BNOSsrPL2v35nTBegjXwVWyKRdYlALWaUwLBRZnWwNIaQdaqIP7EWKWRPQG0WYfvO09eOfEQ+Ww96
	mdQBLXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8B2-0000000BiBU-3Zy9;
	Mon, 01 Jun 2026 19:19:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8B0-0000000BiB3-0bJC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:19:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D52EC406BA;
	Mon,  1 Jun 2026 19:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923771F0089B;
	Mon,  1 Jun 2026 19:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780341593;
	bh=NhFxldIBjPBUTua/YfxeMMHdCARnPekS5WZgGemC+8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CwF7GgViXVTYL1XEQ2gUlw926h25cBeIJxhIIw1viptMID57r7cX+f0DUXabsu03t
	 4BRMGy9VA/EfK7NbtHNvjQVSexU5wREpbHtorKHQ4zB+ZB3dxOdkXfBJPb2M38WeoB
	 es4OPC998fhMoOcv5Uk97ngxz5MPBtr/FyrlkP0vrkTX3lXcKtAFsY3X7Ypy8AxG8i
	 Jab/oU53bM1AZwe6qZHvszeaLbwE3wxPo+A1f6GZBPG6/hAZsXkorDD3A6k+ImBVPs
	 LH3n7Kv7N07piD1tddbkO76DNN+4NsHWnM0qG5pv1Crz+hAljaFYZRzmaiCes3H+g6
	 tig2fe2IztQ1g==
Date: Mon, 1 Jun 2026 12:19:52 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Flush HCR_EL2.VSE to deliver SErrors to pKVM
 guests
Message-ID: <ah3bWEOQUB27gMS3@kernel.org>
References: <20260531154548.1505799-1-tabba@google.com>
 <ah3agGh1s61HKiPG@kernel.org>
 <CA+EHjTyLWoM6_pSzC4bqN+EKpuAtDoKOZN39B0UMR_Va5Af_XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyLWoM6_pSzC4bqN+EKpuAtDoKOZN39B0UMR_Va5Af_XQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_121954_219112_726A065B 
X-CRM114-Status: GOOD (  27.61  )
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

On Mon, Jun 01, 2026 at 08:17:18PM +0100, Fuad Tabba wrote:
> On Mon, 1 Jun 2026 at 20:16, Oliver Upton <oupton@kernel.org> wrote:
> >
> > On Sun, May 31, 2026 at 04:45:48PM +0100, tabba@google.com wrote:
> > > With pKVM enabled, the host injects a virtual SError by setting
> > > HCR_EL2.VSE on its vCPU copy, but flush_hyp_vcpu() only flows TWI/TWE
> > > into the hyp vCPU that runs, so VSE never reaches it and a deferred
> > > (masked) SError is never delivered. VSE is a host-owned injection
> > > control, not a trap-configuration bit, so restricting the host's
> > > trap-register values should not have dropped it. Flow it on entry;
> > > sync_hyp_vcpu() already copies hcr_el2 back, so delivery is reflected
> > > to the host.
> >
> > Might be worth mentioning that flush_hyp_vcpu() also forwards VSESR_EL2
> > from the host since that bit is _just_ out of context of this diff :)
> 
> Sure, would you like me to respin? Or would one of the maintainers
> kindly add that? :)

Marc is kindly dealing with the tree for the time being so hopefully
he can throw it in.

Thanks,
Oliver

> > > Fixes: b56680de9c648 ("KVM: arm64: Initialize trap register values in hyp in pKVM")
> > > Reported-by: Sashiko (local):gemini-3.1-pro
> > > Signed-off-by: Fuad Tabba <tabba@google.com>
> >
> > Reviewed-by: Oliver Upton <oupton@kernel.org>
> >
> > Thanks,
> > Oliver
> >
> > > ---
> > > Not an urgent fix. I should stop running Sashiko...
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > index 06db299c37a8..9e4a20df6409 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > @@ -129,9 +129,14 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> > >       hyp_vcpu->vcpu.arch.ctxt        = host_vcpu->arch.ctxt;
> > >
> > >       hyp_vcpu->vcpu.arch.mdcr_el2    = host_vcpu->arch.mdcr_el2;
> > > -     hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> > > +     /*
> > > +      * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
> > > +      * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
> > > +      * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
> > > +      */
> > > +     hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
> > >       hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> > > -                                              (HCR_TWI | HCR_TWE);
> > > +                                              (HCR_TWI | HCR_TWE | HCR_VSE);
> > >
> > >       hyp_vcpu->vcpu.arch.iflags      = host_vcpu->arch.iflags;
> > >
> > > --
> > > 2.54.0.929.g9b7fa37559-goog
> > >

