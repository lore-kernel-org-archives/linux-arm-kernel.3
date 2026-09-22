Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350DBC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMv2HRQWdI7L1EwnVqaI+B6hRyZmxW7nfB0fpJ4Rdio=; b=sB6tJ29KvQgZzEZcsmjpa2RPvG
	sXyi+MgLAcWEMmfESTGf2o5FVXWa23n7LMfZDJWCcCilYo9iSeHZCSKezUOLkNRdJhpvkumF5qG4V
	uzkvKERZ4QHIWp+jpycktBusvW52tS3kqEF/4rxKzZheRCGIFku7UB7BwXqMbXDqGC6a9jbIKAnFV
	6AAQpC1fL+Jm3EpsHb+Pi2y0OdOc69Mr6gXHyhrb1WhJht8/ia8cWUVaPZeDFHGYEydZpJbnEMtTJ
	U4jMzxeYEZv1d0Lxj5189C8HNzP9W4xhn3XlAY3WEKKth3r5h9rBREoQfnAuyLCSyutyVyu8G/v5d
	PAdTj3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95dU-00000006Lyn-0B6c;
	Tue, 22 Sep 2026 18:54:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95dS-00000006LyW-3X5s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:54:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F30640C45;
	Tue, 22 Sep 2026 18:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D671F0089A;
	Tue, 22 Sep 2026 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790103274;
	bh=fMv2HRQWdI7L1EwnVqaI+B6hRyZmxW7nfB0fpJ4Rdio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jXm+/bDndA1K7nV2TVA2OZew3t2LMKoY2U41Xm37ETzJXswGN7qSuV2hjBBflMwyK
	 axDrW6s7WkRuuSTt1eseU+bUHh+18gEbk9yHlwDhLxTsZ9Buj2TaWQs1a4t7kJcChc
	 inCyrVZOg63PPJEFjnEDiOe/fsVPfJqgXYR+7Lbx7mpp9vvfhUF1KmoRv7P0SKnIWu
	 I3Grt4Lc/l48/koMYkNzv7/dm4OxPWMqkL+mLE5sk29TUcavHAmcA6TWWdzarBHyR4
	 WtV96sN96nZg/PT9N2jxlxzs7R/XWwRZaHt2YGz5YIh5v/HTdhiWTCTqy8l29MOjYI
	 HwtBQcXixVirA==
Date: Tue, 22 Sep 2026 19:54:25 +0100
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
Message-ID: <arLOn49vQ4EA1brY@gremlin>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org>
 <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com>
 <arK5ynpRi7VbY7Ek@gremlin>
 <arK8seJVT9wYgVCP@google.com>
 <arLD-eZ6dRvfZ52q@kernel.org>
 <arLJ4AbNN9Y_IUna@gremlin>
 <arLM-vJDoO7gQJXM@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLM-vJDoO7gQJXM@google.com>
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

On Tue, Sep 22, 2026 at 11:46:18AM -0700, Sean Christopherson wrote:
> On Tue, Sep 22, 2026, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Sep 22, 2026 at 11:07:53AM -0700, Oliver Upton wrote:
> > > On Tue, Sep 22, 2026 at 10:36:49AM -0700, Sean Christopherson wrote:
> > > > On Tue, Sep 22, 2026, Lorenzo Stoakes (ARM) wrote:
> > > > > On Tue, Sep 22, 2026 at 10:23:43AM -0700, Sean Christopherson wrote:
> > > > > > Rather than have kvm_arch_vcpu_allow_pre_fault_memory(), what if we add a more
> > > > > > generic kvm_is_vcpu_loadable()?  That way we don't need to worry as much about
> > > > > > the return value, the connection to vcpu_load() is obvious, and we don't need to
> > > > > > add another pre-check if future (or cleaned-up existing?) ioctls want to do
> > > > > > vcpu_load() in common code.
> > > > >
> > > > > ...this is exactly what I started out with.
> > > > >
> > > > > But then you are in a pickle, because _really_ you need to do that check in
> > > > > vcpu_load(). Which is a void function. Which is called by every single
> > > > > architecture all over the place.
> > > > >
> > > > > So you'd have actually no way of signalling the error back.
> > > > >
> > > > > Of course those places are arch code and you could say 'arches should know
> > > > > better and if they call it it's fine not to call the arch 'can you load'
> > > > > function.
> > > >
> > > > Yes, that's my vote.  It'd be easy enough to clarify that "rule" with a comment
> > > > in linux/kvm_host.h.
> > >
> > > I feel like trying to make this generic will wind up under-documenting
> > > the single example we have with the pre fault ioctl. Putting the comment
> > > into a header practically guarantees that nobody will read it either.
> > >
> > > I'd favor doing something like below and sticking the comment inline in
> > > the ioctl handler. Unless I'm missing something blatantly obvious, I
> > > don't see why the x86 or s390 pre-conditions can't be tested early too.
>
> Oh, they definitely can.  I'm a-ok with using kvm_arch_pre_fault_allowed() on
> s390 and x86, the only option I am against is adding kvm_arch_pre_fault_allowed()
> but then not using it on architectures that obviously perform that exact check.
>
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -3961,6 +3961,11 @@ bool __weak kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu)
> > >  	return false;
> > >  }
> > >
> > > +int __weak kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
> > > +{
> > > +	return 0;
> > > +}
>
> There should be no need for a __weak placeholder since this code is guarded by
> CONFIG_KVM_GENERIC_PRE_FAULT_MEMORY=y.  I.e. force architectures to define the
> API.  I don't think it's a coincidence that all of arm64, s390, and x86 ended up
> with restrictions; pre-faulting is far from a simple operation.
>
> Actually, that's an argument for a dedicated kvm_arch_pre_fault_allowed() versus
> a generic kvm_is_vcpu_loadable(): it helps force future architectures to actually
> think about when exactly pre-faulting is safe.

Ack on all and I agree __weak is not necessary in this case and probably quite
useful to make arches define it.

Will take this approach on respin thanks all!

--
Cheers, Lorenzo

