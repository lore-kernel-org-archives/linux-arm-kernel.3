Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6040C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hG2I/HuDKXt1ra2aKJOzjd3ZnRb0UiNU2P36VE8WR8I=; b=RVI1ZMXseQwPOuWPXnnganhmqN
	21zUJLWV1Q/elChCkPNR+TBWqgb13PfpobIrjbxh3qdSSPlg08CG8aRmUhC/41v4w3/z5ge5p7Bfn
	OyZh8ubdoc39lmlg3vMYKTFjMjkuJeKeuoUIgVuM1UVkkoUQYVLb+nn28p7Xk6FKhSYVbG5gLtKpi
	HRQ7qxTGQ2CMI77l8ozXSo0iJr4WoSDcLpYbbOVbYo3chRih2Qwv/5N5y4EFuY6xVUTVvS5UPEyCi
	eSsDvNdofr2KSyKj4sX+2AwdSgfha4thOrxNCraakh6oCCPYm7j9SEO6mkVQ8Z/4QWEsZU8BA4gAl
	tqyODa9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90wa-00000005bnR-0JoJ;
	Tue, 22 Sep 2026 13:54:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90wY-00000005bn8-1yBv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:53:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E52E36020F;
	Tue, 22 Sep 2026 13:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C814E1F00893;
	Tue, 22 Sep 2026 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790085237;
	bh=hG2I/HuDKXt1ra2aKJOzjd3ZnRb0UiNU2P36VE8WR8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ca4lFUr4euo5Xgp+dxMXJWCi3lA8/uwBp63YGXdeyD2+IG4aq7L8gIgiMT4Y/qXMj
	 aijgAN5hfihe11qkkucgrH9nINl9UYRCTXzJQW6SIbsubyoMrtVzm3xq1PscSFYwki
	 C5VZ87jdxDps8LjRNU/8veWcP5WTuwNVu3jX8Z9gqEYZsxNuPYSVVkB2CPIYpnEnKR
	 IrJIjoxwcwBJJn9M+fcY0eA6uCBzGDKAKdH2vr8IRLcwlkiA/w6CG0Lc+15xYifxez
	 hM4ykAYUtmEDmSZqcP7SU0Oq80FVlc8TSWj1SuluJyPp+iVKjDhLF14n0Y3ipbGtUL
	 oYl5fr01HKnDw==
Date: Tue, 22 Sep 2026 14:53:49 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sean Christopherson <seanjc@google.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>
Subject: Re: [PATCH v2 00/13] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
Message-ID: <arKB2imOcg4MhXMF@gremlin>
References: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
 <yq5abj9p38vq.fsf@kernel.org>
 <arJ1BDEzY5CANjjB@gremlin>
 <yq5a8q4t305j.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a8q4t305j.fsf@kernel.org>
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

On Tue, Sep 22, 2026 at 06:37:04PM +0530, Aneesh Kumar K.V wrote:
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> writes:
>
> > On Tue, Sep 22, 2026 at 03:28:33PM +0530, Aneesh Kumar K.V wrote:
> >> > This is because pKVM instantiates vCPUs upon run,
> >> >
> >>
> >> Can pKVM instantiate the hyp vCPU during pre-faulting ?
> >
> > It would be an unusual and unexpected thing to do - suddenly a pre-fault
> > operation is initialising a vCPU explicitly for pKVM.
> >
> > A caller is not going to reasonably expect this and might treat a failure to
> > pre-alloc as fine to carry on whereas in fact it was a failure to initailised a
> > pKVM vCPU.
> >
> > It'd also require significant changes to how pKVM is set up, right now it's
> > hardcoded to be done unconditionally at run via kvm_arch_vcpu_run_pid_change()
> > -> pkvm_create_hyp_vcpu(), so all that would have to change and be checked and
> > tested and... that'd be really out of scope I think :)
> >
> > And pre-faulting really makes most sense BEFORE you run a VM. It doesn't make so
> > much sense mid-run.
> >
> > But more fundamentally, the stage 2 page tables, as I understand it, are owned
> > by pKVM and so aren't really available to be pre-faulted.
> >
> > Maybe unprotected-under-pKVM VMs but then it's questionable as to how useful
> > that would be given that it would be confusing to users vs. how it works for
> > other VMs.
> >
> > So in general, no I don't think it's a good idea.
> >
> > And even if we wanted to pursue some version of this, it's _definitely_ out
> > of scope for the initial pre-faulting bring-up series.
> >
> >>
> >>
> >> > but pre-faulting is  typically performed before a vCPU is run.  It would be confusing and
> >> > inconsistent to error out on non-running vCPUs but to pre-fault running
> >> > ones.
> >>
> >>
> >> I use KVM pre-faulting when transitioning pages from shared to private
> >
> > You mean you'd prefer to use? Or you are using it on another arch?
> >
> >> with CoCo guest. This ensures that a trusted device can DMA to private
> >> memory before the guest accesses it.
> >
> > Hm what do you mean by private memory?
> >
> > I see:
> >
> > #ifndef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> > {
> > 	return false;
> > }
> > #endif
> >
> > And only x86 selects KVM_GENERIC_MEMORY_ATTRIBUTES?
> >
> > Do you mean something else?
> >
>
> I am using this with ARM CCA-DA, based on the patch series from Jack Thomson <jackabt.amazon@gmail.com>.
>
> https://gitlab.arm.com/linux-arm/kvmtool-cca/-/commit/80e7aad61c5639de2f0cb4a5525dad0c96156428
>
> We do this while the VM is running.

Right, that's a non-mainline kernel I guess? Which presumably implements private memory.

Jack himself experienced a panic with his pKVM code, so the code you're using is
not upstreamable, unfortunately. And he'd already shelved pKVM support AFAICT.

And reviewers pointed out actually implementing the pKVM stuff properly would be
quite involved, even if you wanted to do that (hence follow-up).

Also you end up stuck with the same problems as I mentioned above - you can't
sanely bring the vCPU pre-run, so now you have extremely weird behaviour - only
pre-faults if vCPU initialised, running, and unprotected pKVM.

Protected pKVM support is a whole other layer of complexity and it's not obvious
that you're really achieving what pre-fault is supposed to.

In any case Oliver literally just asked me to _simplify_ weird edge cases for
this series :) so I am not sure something like that is going to be accepted.

Are you sure you're actually running in pKVM mode btw? CCA doesn't AFAICT? In
which case this series _should_ work fine for you.

Anyway, if we really do need to add something for pKVM it needs to be a follow
up. Let's get the basics working first :)

(Note that kvmtool will need to be updated to retry pre-fault on -EAGAIN, -EINTR
 as this series can, albeit unlikely, return -EAGAIN.)

>
> -aneesh

--
Cheers, Lorenzo

