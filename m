Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA5DC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYSOqVERmoLufYUc+VgdIGa26F88+bWdDgX4ohmoDow=; b=xDQG2fl1N606z88le9q1l9pV3N
	h6qyxRJ2hO+WGK8RF1dzBIi70oGHDI2PyN7bqGTn7eo1eRJcyte1KqiHZMkohnpp+pd/tDFL/TPgf
	p0IJ0uJbNhi0ssZqi5YQFhdtg2Fp5iTR5raVtXN8BKAdx1rTsDuidR0PlUteXJ5+dHNagV/OqisGL
	MH+4nMSprhjqZcFmqt0YzNPLI2RODKv7Pv2bu7xCAPOeiToM/nXfZwVCb3w6mc8ONFUci8qURL5lW
	KWRmfYb74pgEYLxjn7ch5+4j7Oqe42RXpjz/536xC70QqijkP80ZblQuIBeLBm5O2eXj6O6FJJuGw
	Pb840/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94oY-00000006G2M-3Une;
	Tue, 22 Sep 2026 18:01:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94oX-00000006G2F-2cAL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:01:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10CE64040D;
	Tue, 22 Sep 2026 18:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74781F000FF;
	Tue, 22 Sep 2026 18:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790100116;
	bh=XYSOqVERmoLufYUc+VgdIGa26F88+bWdDgX4ohmoDow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cTFAgg2FOfaMX2m8EsEsOewd3kmF8o+nqmZIgHsg1+9dfNvjg7UsJBnBr7cQLe1gc
	 NRZa7rq/dJvOZbE4iJ8qwH9xFN5HvTNU602lYu19aCdlJ8/ZK8eFBFvjLwON208EmW
	 XDFJRh666HOdgBM4mCysh18oZxVAtffvfijp+CEreSklJcAeStfU5ZVdmz/W+G1cMw
	 tvX2+GxoohyHrtHGMZv+Cxrry+VZhichA61P71tzJM/TfaD+SUPE5zsm6ygKShkw1+
	 aQtV+4k7suG2DbR/RXLPSqzlhNoXCFydrrlCIBti5D3+SZI3a/BwrfTF6KEv229og0
	 k/Vt3CWjh0zuQ==
Date: Tue, 22 Sep 2026 19:01:48 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
Message-ID: <arK8-Hec3-5o4jYs@gremlin>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org>
 <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com>
 <arK5ynpRi7VbY7Ek@gremlin>
 <arK8seJVT9wYgVCP@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arK8seJVT9wYgVCP@google.com>
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

On Tue, Sep 22, 2026 at 10:36:49AM -0700, Sean Christopherson wrote:
> On Tue, Sep 22, 2026, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Sep 22, 2026 at 10:23:43AM -0700, Sean Christopherson wrote:
> > > Rather than have kvm_arch_vcpu_allow_pre_fault_memory(), what if we add a more
> > > generic kvm_is_vcpu_loadable()?  That way we don't need to worry as much about
> > > the return value, the connection to vcpu_load() is obvious, and we don't need to
> > > add another pre-check if future (or cleaned-up existing?) ioctls want to do
> > > vcpu_load() in common code.
> >
> > ...this is exactly what I started out with.
> >
> > But then you are in a pickle, because _really_ you need to do that check in
> > vcpu_load(). Which is a void function. Which is called by every single
> > architecture all over the place.
> >
> > So you'd have actually no way of signalling the error back.
> >
> > Of course those places are arch code and you could say 'arches should know
> > better and if they call it it's fine not to call the arch 'can you load'
> > function.
>
> Yes, that's my vote.  It'd be easy enough to clarify that "rule" with a comment
> in linux/kvm_host.h.

I note you dodge the actually difficult question of what this wrapper function
would look like ;)

So maybe like:

static int kvm_vcpu_load(struct kvm_vcpu *vcpu)
{
	int err;

	err = kvm_arch_allow_vcpu_load(vcpu);
	if (err)
		return err;

	vcpu_load(vcpu);
	return 0;
}

?

And I do like that you'd actually gate the right thing, I feel you on that,
obviously since this kind of predicate is what I started out with.

But I'm also looking to do the smallest possible thing here that fits the series
and doesn't preface it with a 'change how core kvm does something'.

But if Oliver/Marc feel this is viable then sure can go with it.

(Also naming is hard, kvm_vcpu_load()? do_vcpu_load()? maybe_vcpu_load()?
checked_vcpu_load()? vcpu_load_checked()? :P)

>
> > But you're still stuck with the problem of where exactly you put this check.
> >
> > So then do you put that check in a wrapper around it?
> >
> > Instead you can make the predicate 'don't prefault on a not-yet-initialised
> > vCPU' which is pretty sensible I think, have a specific place to put it and
> > all's well with the world.
>
> But look at it from an x86 perspective.  Pretty much everyone will look at this
> and expect:
>
>   bool kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu)
>   {
> 	return vcpu->kvm->arch.pre_fault_allowed;
>   }

I'm not sure I really get your point here at all? :)

Why would it matter what people who are too lazy to go check the implementation
assume about an arch hook?

>
> > > I'd also be tempted to say it can be a macro, not a __weak function.  E.g.
> >
> > Yeah it can be many things but why would you want a macro if you could possibly
> > avoid it? :)
>
> Because it allows arch code to dererefence "struct kvm_vcpu" in kvm_host.h,
> i.e. allows "inlining" the check.

Yeah I mean, micro-optimising a path run on a costly startup operation seems a
little unnecessary? :)

It seems the convention is __weak but I'm not going to die on this hill.

(C type safety is something of a myth but I do prefer to try to have what
little protection it offers when possible :)

--
Cheers, Lorenzo

