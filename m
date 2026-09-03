Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8077C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0PiIrFTy0jAZPA55N8PvRPAL536lW/v4rDJ21ApSMo=; b=CEZcCcUMbSGuSxbc//iLX5qKgH
	1r5j1p3pWG6j2eS6sFpCbdMMNKzPGMrck42c90idmzwEHacAwee81Y+4mUtlBL6C81dji/GHM2dzR
	t5+Lo/7dzvwZmyNsdsp5RBRHLQWTGsN9eQai7twNr3GJNYdF1CNAHJi8865RUqpxTmN6T/SG/UqJ5
	aW/hBKtMenibtroYsrJlJy2pSRYO7ZrA9RSlqOAiRmmMEPNiOU/D08e8217d5F2yuNWZg/CQrk5qO
	y/nSrf6Ntn3DeWFbLdngCAH5iwkeg03mJZHNGPytJtxyDYRo0q8kwSBK14hDOAlhGC5P4QaMqdxnW
	0flIqICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28fb-0000000HXSR-21eZ;
	Thu, 03 Sep 2026 14:44:03 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28fY-0000000HXRe-3jx0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:44:02 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-85524903a9cso1736382b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 07:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788446639; x=1789051439; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0PiIrFTy0jAZPA55N8PvRPAL536lW/v4rDJ21ApSMo=;
        b=bKywiD4Nxy5wBEcCEUYBIgy4PZpkX0R8zPuAMKfznck9GTHtasXmm3eSmvxT5FSrWh
         aC4Vye6sCBV+ZSr1DlVsHQNeq8wGJFbLvlc67OH0GqIRorxIvDrBgS5JGAxCjYvgWMHy
         XOqWT1jhNBKvha/H5eK3bIpLFy/XIt+y/NLaJZOuqVMSPQkccjBrGMUohUXj6CU43WDu
         GM6BIMpr0hILQ1lBpQtxIRvCS3TRhF1EMxfyrIwMUgncSCdnes1wWr7wRtQ045nTwOhq
         mTHHmJBj9N1l1dDm23h2xbPjGbh0hPKsCyM3jo2+zXPEevcqgaUmT1DtUE5EtlzfZi6B
         0gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446639; x=1789051439;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0PiIrFTy0jAZPA55N8PvRPAL536lW/v4rDJ21ApSMo=;
        b=Mo2q+v7nA3oepVTDI99/5fMw0KTtItgyAAkJNS39QXDtDlUKJLb7LNXhQhYbGijGVS
         jXIgVvVrDvZjyht49ELEVvGTj2lavLlhFF3SwDI2XIn5T23aw7awWB6wSi8eEd+w9AL9
         mKsOe2mpJYMOqKmTyXuaBPFE1vJqBVCMe1C9iympdOZ+nS56CKlmeDNpbQ6+iAkeVSor
         RFvpqRj0aMx1g8BO8suaWZrhnhxAsV4s7nfnZdUFFAFGCg57sJsIq4Q5jps7p+GC7c7J
         NLdddw/YGNesdi7bbgCsHT7bGgjzMT39JXj9Se2D6LMHC+oggcpZC7jjaYRL2xK5asx/
         q7kQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhAnA5VTtzgrpTr3DxEfxhXjuiowHdMFzJn/OnSULVY0JMS2ZZJLUA57LJ/Yp4oeK/B7NF6N6nZMNpxkiKpduo@lists.infradead.org
X-Gm-Message-State: AFuF++lIk3xKQz/5SlqhI+ypzH6UyHDnwn221jt18JbCXccQFr3XBa67
	UJ6ZUcZFy/KDeqKqKXwROWU2NKQmQXMx/+qZnyqqbJ6LmikkpDxalu1qfRgVQRi74YlwxgYl899
	MNtFsbg==
X-Received: from pfgr14.prod.google.com ([2002:a05:6a00:c48e:b0:847:926b:dc17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:138d:b0:857:74ae:ad76
 with SMTP id d2e1a72fcca58-86141ae9ad6mr626813b3a.26.1788446639057; Thu, 03
 Sep 2026 07:43:59 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:43:58 -0700
In-Reply-To: <20260903083857.33034-B-seiden@linux.ibm.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-24-seiden@linux.ibm.com>
 <aphMx5hsoXwIpNjt@google.com> <20260903083857.33034-B-seiden@linux.ibm.com>
Message-ID: <apmHrnxRLl9BuVhn@google.com>
Subject: Re: [PATCH v7 23/23] KVM: s390: arm64: Add KVM_S390_ARM64 Kconfig and Makefile
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_074400_939836_E471BBF6 
X-CRM114-Status: GOOD (  41.01  )
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

On Thu, Sep 03, 2026, Steffen Eiden wrote:
> On Wed, Sep 02, 2026 at 09:20:23AM -0700, Sean Christopherson wrote:
> > On Mon, Aug 31, 2026, Steffen Eiden wrote:
> > > diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
> > > index 8d3ee17a1bcb..9c69ea16031e 100644
> > > --- a/arch/s390/kvm/Kconfig
> > > +++ b/arch/s390/kvm/Kconfig
> > > @@ -53,4 +53,33 @@ config KVM_S390_UCONTROL
> > >  
> > >  	  If unsure, say N.
> > >  
> > > +config KVM_S390_ARM64
> > > +	def_tristate y
> > > +	prompt "KVM support for hardware accelerated arm64 guests"
> > > +	depends on HAS_IOMEM
> > > +	depends on KVM
> > 
> > Is this actually necessary?  I.e. does kvm.ko need to be *loaded* in order for
> > kvm-arm64.ko to be loaded?
> > 
> > If kvm-arm64.ko does indeed have a hard dependency on kvm.ko, then I think it
> > makes sense to not have redundant "select" statements below.  As an outsider,
> > it's super confusing because the KVM_S390_ARM64 are incomplete, e.g. are lacking
> > things like VIRT_XFER_TO_GUEST_WORK (at least, I assume those are lacking), and
> > makes it hard to see what is actually unique to kvm-arm64.ko.
> > 
> > If kvm-arm64.ko doesn't have a dependency on kvm.ko, e.g. to initialize hardware
> > or something, then this "depends on" should go away.
> 
> 
> It is a bit more complicated unfortunately. KVM_S390_ARM64 depends on
> KVM as there is code around in the kernel & drivers (arch and common)
> which depends on CONFIG_KVM we need as well. I did not want to leak arch
> local configs to common code if I can avoid that.
> I could change it to select KVM ? Do you have another idea on how to
> solve this issue?

I would do something similar to what KVM x86 does.

> The two modules are completely independent at compile and runtime. So
> kvm does not have to be loaded for kvm-arm64 to work.
> 
> VIRT_XFER_TO_GUEST_WORK is only lacking for now. I will add it later.
> Currently the kvm-arm64 module is incomplete anyways but I did not want
> to send a 60+patches series and rather stage the introduction over
> multiple series.
> 
> I will remove the duplicated config selections. Thanks for pointing it
> out. In previous series I had an explicit KVM_S390 config. Both KVM_S390
> and KVM_ARM64 selected KVM. But this created too much churn around the
> whole tech-stack 

LOL, what exactly are you expecting to happen?  You're trying to squeeze support
in for a completely different architecture, of course there's going to be churn.

This absolutely needs to be as precisely and correct as possible, otherwise it'll
be painfully difficult to maintain,  And to some extent, just for others to review.
E.g. as is, it's at all not clear to me which of the IS_ENABLED(CONFIG_KVM) checks
in arch/s390 apply to both flavors of virtualization, versus which are specific to
"native" s390 virtualization.

I realize this is outside of my immediate scope, but getting this "right" isn't
just an s390 thing, because these details bleed into common KVM, and even affect
other architectures, e.g. when trying to make "treewide" KVM changes.

And FWIW, while it might seem daunting, from my perspective it's not actually that
much churn to do things "right".  Provide KVM_S390_NATIVE, and then have KVM reflect
the "weakest" of S390_NATIVE vs. S390_ARCH.  I.e. make KVM=m if either of the "real"
KVMs will be a module.  That requires some creative shenanigans, but it's not hard,
just weird.

> (default config change, s390 is the odd one out for the KVM config meaning, ...).

Nah, x86 is the odd one, where CONFIG_KVM=m doesn't even guarantee kvm.ko gets
built :-)

E.g. something like this, which probably doesn't compile and isn't the desired
end state, as several of the Kconfig selections need to be reworked into #defines
provided by header files, but AFAICT it does what I want/intend.

config KVM
	def_tristate m if (KVM_S390_NATIVE = m || KVM_S390_ARM64 = m)
	select HAVE_KVM_CPU_RELAX_INTERCEPT
	select KVM_COMMON
	select HAVE_KVM_IRQCHIP
	select HAVE_KVM_IRQ_ROUTING
	select KVM_VFIO
	select VIRT_XFER_TO_GUEST_WORK

config KVM_S390_NATIVE
	def_tristate y
	prompt "Kernel-based Virtual Machine (KVM) support"
	select KVM if (y && KVM_S390_ARM64 != m)
	select KVM_ASYNC_PF
	select KVM_ASYNC_PF_SYNC
	select HAVE_KVM_NO_POLL
	select KVM_MMU_LOCKLESS_AGING
	select KVM_GENERIC_PRE_FAULT_MEMORY
	select HAVE_KVM_INVALID_WAKEUPS
	help
	  Support hosting paravirtualized guest machines using the SIE
	  virtualization capability on the mainframe. This should work
	  on any 64bit machine.

	  This module provides access to the hardware capabilities through
	  a character device node named /dev/kvm.

	  To compile this as a module, choose M here: the module
	  will be called kvm.

	  If unsure, say N.

config KVM_S390_UCONTROL
	bool "Userspace controlled virtual machines"
	depends on KVM
	help
	  Allow CAP_SYS_ADMIN users to create KVM virtual machines that are
	  controlled by userspace.

	  If unsure, say N.

config KVM_S390_ARM64
	def_tristate y
	prompt "KVM support for hardware accelerated arm64 guests"
	depends on HAS_IOMEM
	select KVM if (y && KVM_S390_NATIVE != m)
	select GUEST_PERF_EVENTS if PERF_EVENTS
	select HAVE_KVM_VCPU_RUN_PID_CHANGE
	select HAVE_KVM_IRQ_BYPASS
	select KVM_MMIO
	select SCHED_INFO
	select XARRAY_MULTI
	help
	  Enable support for hosting virtualized, hardware-accelerated arm64
	  virtual machines on s390 systems using the Start ARM Execution (SAE)
	  instruction. This requires hardware models that support the Arm
	  execution facility (AEF).

	  The module provides a character device named /dev/kvm-arm64 to expose
	  the hardware capabilities.

	  To compile this driver as a module, choose M here. The module will
	  be called kvm-arm64.

	  If unsure, say N.

