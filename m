Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FFBC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MDTtMD6afFelOIcTq7k9liLCAKGpA6j8Nmw+cyJu0M=; b=q+xY4krmMOFGSpFzCokOrBIzcA
	pPEDjscY9JidsEsnnaPVdLJf0a1kputBYRd+4BHbLaMgGeUqCnDZapwT5if01SM0wJau562ycEawY
	VimzK6r8X1zIuBGYD5bHJXQ3/h8wTrJmX3yUemdjVp7K0+mG0HUOu9QhIPQuofmhLJnYvaUAWr9c6
	cYiddUW0RQ9XeRxpS7AcbOVUDeF8pcuklk1SXA0UX/fZYHMreitWLE6XG6Yg5aZSus4RQTLGNLRZg
	iGpgRqJyFDcWHfimQz7eBaQN6882Bdgp/FVYYvkFTfJS4vPM6fnCtvIJYuSQLMLEu7D/MQepqsx+B
	viY2/FLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gaG-0000000Ah2c-1DFI;
	Thu, 24 Sep 2026 10:21:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gaF-0000000Ah2W-0tov
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:21:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 307D5600AA;
	Thu, 24 Sep 2026 10:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC031F000FF;
	Thu, 24 Sep 2026 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790245301;
	bh=5MDTtMD6afFelOIcTq7k9liLCAKGpA6j8Nmw+cyJu0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kGkEvjDMzPW27fY1HkTF00AU0znEB3Gyp4m8m1hR0k/f4qggxQBCJqGjd9CWbDz/F
	 M0y1SvvOPq4yUHmQnBmmk/zHxiLKwk8bdniJxMDAnQJFD8JL9IVLgs9YYgUShjftxL
	 fzq+AeTbP2NSP3MZZq+t9YGKbLx/9ZuXmk5RaS0mwSXMtIIM3x0SteKmlYbDrmjY4B
	 ADZqFJzdo0iA59Rx1p+Es3npbjhiln69opfVKWdl3hvHfMESY2u3HJkULAOWvkU8oN
	 vnT+Lufabt0xGR7NQLdJzbSwMPZnkXiyyBzXEEI6Q5Xn9aqsN4skFT2L7WWqVnF/YT
	 PKvtLJsgSOvLw==
Date: Thu, 24 Sep 2026 11:21:35 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Xi Ruoyao <xry111@xry111.site>, Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KVM: arm64: Trap guest MPAM accesses whenever MPAM is
 implemented
Message-ID: <arT5r6Tqg9PnSYLz@willie-the-truck>
References: <20260911104715.307500-1-fuad.tabba@linux.dev>
 <868q5579ol.wl-maz@kernel.org>
 <CA+EHjTw0U0d91Cv4NYEJvUuT=JabwZeeYwpZ2P1xyVeOVX46Ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw0U0d91Cv4NYEJvUuT=JabwZeeYwpZ2P1xyVeOVX46Ew@mail.gmail.com>
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

On Tue, Sep 15, 2026 at 07:51:00PM +0100, Fuad Tabba wrote:
> On Sun, 13 Sept 2026 at 11:00, Marc Zyngier <maz@kernel.org> wrote:
> [...]
> > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> [...]
> > >  static void cpu_hyp_init_context(void)
> > >  {
> > > + u64 pfr0 = __read_sysreg_by_encoding(SYS_ID_AA64PFR0_EL1);
> > > + u64 pfr1 = __read_sysreg_by_encoding(SYS_ID_AA64PFR1_EL1);
> > > +
> >
> > Why not directly read_sysreg(id_aa64pfr0_el1) and co?
> > __read_sysreg_by_encoding() is useful when the encoding comes from a
> > variable, but it looks odd in the case of a literal sysreg.
> 
> It applies the arm64.nompam override, which is what
> finalise_el2_state() tests. With the override set, EL2 setup leaves
> the MPAM traps alone, and a raw read_sysreg() would still see MPAM in
> the ID registers, so KVM would write MPAM2_EL2 on exactly the firmware
> the option exists for. I'll add a comment.
> 
> [...]
> > > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> [...]
> > > @@ -298,14 +298,17 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
> [...]
> > >   /* trap guest access to MPAMIDR_EL1 */
> > > - if (system_supports_mpam_hcr()) {
> > > + if (read_sysreg_s(SYS_MPAMIDR_EL1) & MPAMIDR_EL1_HAS_HCR) {
> >
> > This is going to suck under NV. The host hypervisor is of course going
> > to set MPAMHCR_EL2.TRAP_MPAMIDR_EL1, and we're in for a recursive trap
> > on the hottest possible path in KVM. Which is silly as the actual
> > write to MPAMHCR_EL2 is free (it lands in NVMem[]).
> >
> > This really should be replaced by a flag called HAS_MPAM_HCR, just
> > like you have HAS_MPAM.
> 
> I'll probe MPAMIDR_EL1.HAS_HCR once in cpu_hyp_init_context(), next to
> HAS_MPAM, and test the flag in both trap functions instead.
> 
> I'll hold off on v4 until Will has had a chance to comment as well.

I'm planning to generalise the logic you added recently in
gmid_el1_accessible() so that __cpuinfo_store_cpu() stores the values
in 'struct cpuinfo_arm64' with the overrides already applied. I don't
think that directly impacts this patch, but it should make the general
shape of things easier to reason about. I also need it for the parallel
hotplug work.

If you fancy helping with that, please let me know.

Will

