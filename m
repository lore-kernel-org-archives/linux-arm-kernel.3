Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C3FC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XbNBEXalOL7wiFA7qwtlOxm81Xd6k8sewjrN0xUfqI=; b=2um+gFecM9UZvI9OVs/qKm7mxE
	LNI7HWKQn35eRAX3BjnvSsfZQvPFG+mtT9YmYEAmdFoWOH9sHZPwIpZSv4U1sC9qY6whFHm2351pl
	R+qxK4cZYzy0yRs5sDrUjlqYpUHa20ELb7AV6tSQDWl1J8eejiX7NGTEReKl1RKpzUdgyfeehEWY5
	N7yF7a+1CGD/O0nrYGu2o1OvDvwMHjckEK1lbJg2ZgxkWv9wq9JxJsGXjjiLqJHvP50MouiWjdncs
	xAp2h7XWqBwSSe0t8apbUwTlz6O2OIKJWBLblKTZz8UTwCJ6QKXefhj6i21ejLtm0kMl/HwfB0o0/
	yZ/jFEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Yz-00000006EpU-28Nk;
	Tue, 22 Sep 2026 17:45:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Yz-00000006EpC-0IdB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:45:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 712434368A;
	Tue, 22 Sep 2026 17:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38251F000FF;
	Tue, 22 Sep 2026 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790099152;
	bh=3XbNBEXalOL7wiFA7qwtlOxm81Xd6k8sewjrN0xUfqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LK/JYxRBXLqT9oNDbHo0Vmb4Kvj0SOxpClLPhlDhoEDp990c2FuIfud12HQJuvoxi
	 bDGECRYUfdSZP9gXhK4fXF614eddRmfhGFyn3I5yvyMc5JGtE8JWdEnqplwGl+30wp
	 IgFFys8YWwUU/5cihbkrSBZb77Gp190OamEKXHrXLnzKxw4mjcFgUR4trsz+gvyhfm
	 NkjzqhIVxzST0eRe/o24/p9M2Ef1ZchwIqf095j6f1qxLjBuNLY4oxTPM4672c12dP
	 GifkY8ow2B/PzWEoKFKZ6UhhlpfkA0s204foNKtzVTN2L1kzD9wUQvZUXezjpuhwZz
	 57kC61yAXm67A==
Date: Tue, 22 Sep 2026 18:45:43 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 02/14] arm64: Add ESR fault helpers
Message-ID: <arK8ZnBSFwmjizuk@gremlin>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-2-787bd3bc7e3f@kernel.org>
 <arK0N7H1w-pcixba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arK0N7H1w-pcixba@kernel.org>
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

On Tue, Sep 22, 2026 at 10:00:39AM -0700, Oliver Upton wrote:
> On Tue, Sep 22, 2026 at 03:17:56PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Add helper functions which operate directly on an ESR value rather than
> > trying to access the register itself.
> >
> > These mirror equivalent KVM vCPU wrappers in kvm_emulate.h and allow those
> > wrappers and KVM's stage-2 fault handling to operate on a plain ESR value.
> >
> > This is needed to later generate a synthetic fault for the stage-2 page
> > table pre-faulting mechanism.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  arch/arm64/include/asm/esr.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> > index f816f5d77f1a..9c0205983d9a 100644
> > --- a/arch/arm64/include/asm/esr.h
> > +++ b/arch/arm64/include/asm/esr.h
> > @@ -437,6 +437,50 @@
> >  #ifndef __ASSEMBLER__
> >  #include <asm/types.h>
> >
> > +static __always_inline u8 esr_get_ec(unsigned long esr)
> > +{
> > +	return ESR_ELx_EC(esr);
> > +}
>
> Why do we need to wrap the macro in an inline function?

It seemed like a more consistent way of doing this but looking through the code
ESR_ELx_EC() is referenced directly in quite a few places so will swap out.

>
> > +static __always_inline bool esr_trap_is_iabt(unsigned long esr)
> > +{
> > +	return esr_get_ec(esr) == ESR_ELx_EC_IABT_LOW;
> > +}
> > +
> > +static __always_inline bool esr_abt_is_s1ptw(unsigned long esr)
> > +{
> > +	return esr & ESR_ELx_S1PTW;
> > +}
>
> This helper doesn't make a ton of sense outside of KVM, since
> ESR_ELx.S1PTW is RES0 (not RAZ) outside of a stage-2 abort.

OK, kvm_emulate.h better?

>
> Thanks,
> Oliver

--
Cheers, Lorenzo

