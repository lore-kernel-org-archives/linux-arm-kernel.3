Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392BEC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwXB7IJjlaB8/LFgWGY2W9SyVRX56trli9CAewYqEk0=; b=sSy5ZAWJ6VdjNd6H7CA0eGD17d
	frPOex8P7AUilqIqb9IJ2QQg4y3sFt0xmFZy8Rc8RKSIjeGFWRh048vx08O/X3x8HH10+XfKlJJtJ
	OA2VNlyiJ3JHP1zBWGPnfUw0Zew76OUnvgnf6Fhj52nMcro9kdtwxxCT57h1rDdHR2Ekv2CHxdHyU
	eK65yH6NWDVRIhGx7H5HkT3vzS4Whie12fM1HV2D0S4HogJCjmErt24ZhbfFeSyUYW/Kr1eel09MU
	OGDYddDuuVdHvo5dSFe4cTRH3J/6BYW9oOSoN7v24HxwcyBBwvRRyxC6JTdWbapQtLCDvDQ2u2wyz
	mL0U4V/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zys-00000005N66-0pXE;
	Tue, 22 Sep 2026 12:52:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zyq-00000005N5s-3obB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:52:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 80837406C0;
	Tue, 22 Sep 2026 12:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7401F000FF;
	Tue, 22 Sep 2026 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790081536;
	bh=zwXB7IJjlaB8/LFgWGY2W9SyVRX56trli9CAewYqEk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ScPnuTaAx+eHTBSVHGS81l0qJF871mpilRUw6iIOhoIedfp2tpP2WU8Dh5G37I61R
	 XAz51OaoK7pxeDsk48QlwqEDREYfvLbwKcyFXf4YyE9n1tNZNiNyTq29RD+skOcX5y
	 GHmYmvcfgUPm9Dp2mwY4PUGp+inda2N5/bJoBgZ2fKH7CoF+Kh46/NFwQCGYNkz1kv
	 9zRitwCSfYrfMsfvybQRxZOYESPsv3ev+RfpqEutx8cppFTaMFohlNIiuBsERqKJ8o
	 Ui/vSKE1Ia74snqxS7sBefQi9n+pE89jtO4VfAo86yH0XD6Ehb2Qpx239KVoVNcSQ3
	 mgN3kKjvYDm3g==
Date: Tue, 22 Sep 2026 13:52:07 +0100
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
Message-ID: <arJ1BDEzY5CANjjB@gremlin>
References: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
 <yq5abj9p38vq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5abj9p38vq.fsf@kernel.org>
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

On Tue, Sep 22, 2026 at 03:28:33PM +0530, Aneesh Kumar K.V wrote:
> > This is because pKVM instantiates vCPUs upon run,
> >
>
> Can pKVM instantiate the hyp vCPU during pre-faulting ?

It would be an unusual and unexpected thing to do - suddenly a pre-fault
operation is initialising a vCPU explicitly for pKVM.

A caller is not going to reasonably expect this and might treat a failure to
pre-alloc as fine to carry on whereas in fact it was a failure to initailised a
pKVM vCPU.

It'd also require significant changes to how pKVM is set up, right now it's
hardcoded to be done unconditionally at run via kvm_arch_vcpu_run_pid_change()
-> pkvm_create_hyp_vcpu(), so all that would have to change and be checked and
tested and... that'd be really out of scope I think :)

And pre-faulting really makes most sense BEFORE you run a VM. It doesn't make so
much sense mid-run.

But more fundamentally, the stage 2 page tables, as I understand it, are owned
by pKVM and so aren't really available to be pre-faulted.

Maybe unprotected-under-pKVM VMs but then it's questionable as to how useful
that would be given that it would be confusing to users vs. how it works for
other VMs.

So in general, no I don't think it's a good idea.

And even if we wanted to pursue some version of this, it's _definitely_ out
of scope for the initial pre-faulting bring-up series.

>
>
> > but pre-faulting is  typically performed before a vCPU is run.  It would be confusing and
> > inconsistent to error out on non-running vCPUs but to pre-fault running
> > ones.
>
>
> I use KVM pre-faulting when transitioning pages from shared to private

You mean you'd prefer to use? Or you are using it on another arch?

> with CoCo guest. This ensures that a trusted device can DMA to private
> memory before the guest accesses it.

Hm what do you mean by private memory?

I see:

#ifndef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
{
	return false;
}
#endif

And only x86 selects KVM_GENERIC_MEMORY_ATTRIBUTES?

Do you mean something else?

Or are you saying we should match x86? I don't think we have the same
semantics as them, I don't think there's an equivalent for us, and of
course no private memory in the sense of the predicate above.

In any case I think anything wanting to add additional functionality to
pre-faulting would have to be a follow-up anyway.

>
> -aneesh

--
Cheers, Lorenzo

