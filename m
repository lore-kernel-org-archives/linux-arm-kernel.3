Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F598E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgw74pbzQOf9UEZB4b9jvrVoAlAXMJvCMe1RoioPGgE=; b=j1RktW41TZukTYhQeKvAIajb4a
	ZfygbPASuuXrptyTlZPLebb6kUfE7Avrf3gOHTj828UXVJQpuQVEQ9fNPIZVu7TVNfsYK3SS1yffE
	+ApySxMCJkDwNBw8IqIsZIU8LbQItlq/FXbD/27i9N489F65SeD+Nlp8H2zVhQpqEfzCCJ7xdcXWL
	joxuJpW43h3fMhRD05syR3J+Fs91YD7LSEmMB0AvxlQSg4SzRey6xq+807LZ+gjwlKbJX3daY/Cwd
	4wuZya9W0+gAYhsbSdn0uDgkFtCy6CcBEUDJ+tsjHqOfdD55K1gBp9zsjIPGL9KjwQESApcx9ilwI
	tHf5byXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8UD-00000004Omb-3eIb;
	Fri, 13 Dec 2024 16:25:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8T7-00000004OUq-3wDX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:24:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 545731480;
	Fri, 13 Dec 2024 08:25:08 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9A1B3F5A1;
	Fri, 13 Dec 2024 08:24:38 -0800 (PST)
Date: Fri, 13 Dec 2024 16:24:36 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: ryan.roberts@arm.com, catalin.marinas@arm.com, will@kernel.org,
	corbet@lwn.net, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v1 1/5] arm64: Add TLB Conflict Abort
 Exception handler to KVM
Message-ID: <20241213162436.GC30314@mazurka.cambridge.arm.com>
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-2-miko.lenczewski@arm.com>
 <86o71irucr.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86o71irucr.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_082446_012956_F34F897C 
X-CRM114-Status: GOOD (  21.99  )
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

Apologies again for spam (replied instead of group-replied).

On Wed, Dec 11, 2024 at 05:40:36PM +0000, Marc Zyngier wrote:
> On Wed, 11 Dec 2024 16:01:37 +0000,
> Mikołaj Lenczewski <miko.lenczewski@arm.com> wrote:
> > 
> > Currently, KVM does not handle the case of a stage 2 TLB conflict abort
> > exception. The Arm ARM specifies that the worst-case handling of such an
> > exception requires a `tlbi vmalls12e1`.
> 
> Not quite. It says (I_JCCRT):
> 
> <quote>
> * For the EL1&0 translation regime, when stage 2 translations are in
>   use, either VMALLS12E1 or ALLE1.
> </quote>
> 
> > Perform such an invalidation when this exception is encountered.
> 
> What you fail to describe is *why* this is needed. You know it, I know
> it, but not everybody does. A reference to the ARM ARM would
> definitely be helpful.
> 

You are correct. Will update the commit message.

> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index c9d46ad57e52..c8c6f5a97a1b 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1756,6 +1756,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
> >  	ipa = fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
> >  	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
> >  
> > +	if (esr_fsc_is_tlb_conflict_abort(esr)) {
> > +		// does a `tlbi vmalls12e1is`
> 
> nit: this isn't a very useful comment.
> 

Will remove it.

> > +		__kvm_tlb_flush_vmid(&vcpu->kvm->arch.mmu);
> > +		return 1;
> > +	}
> 
> That's not enough, unfortunately. A nested VM has *many* VMIDs (the
> flattening of all translation contexts that the guest uses).
> 
> So you can either iterate over all the valid VMIDs owned by this
> guest, or more simply issue a TLBI ALLE1, which will do the trick in a
> much more efficient way.
> 
> The other thing is that you are using an IS invalidation, which is
> farther reaching than necessary. Why would you invalidate the TLBs for
> CPUs that are only innocent bystanders? A non-shareable invalidation
> seems preferable to me.
>

You are completely correct here. I had forgotten about nested VMs, and
agree that issuing a `tlbi alle1` is simpler and more efficient. I agree
also on not using an IS invalidation.

