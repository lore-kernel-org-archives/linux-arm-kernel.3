Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4F5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzI1smX7/IMyEGD/fNZX1tdlHe3Ey7XN1U8MbWwGg2c=; b=C/aD6sXTMIz9mdrbfX9IRc50Ds
	g2GjI+5xmMQtrXtxODnW6B1QsdWSgfMlVXdXHZwV6uxpyq6aDokdtMb0+nmtIw8XrYo663URMur8X
	oug2Abb/CMmG5MSmbp/eqIxxTsXziZgXoTVSXowEcIwvJJDcLBSQbY20qVPCaSwAnDwwGCnZTEKyw
	aLRLXQ2/9gKZVMcjpYdA5d3ehFKz2qv1gTtN+VV5n+QdgIi4MpQFcFsbTIefLf/SAmMbpJ+bA6OS1
	FBjKpnnKOR31bSlFLbuqYQl2VH0Ujubn2QZwov8eGgcTeke/kWallgqtwbV/fYfJ0qBcK2F5wluj4
	v/ucEuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28hL-0000000HXlZ-31Tx;
	Thu, 03 Sep 2026 14:45:51 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28hJ-0000000HXkr-0qHk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:45:50 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so4616a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 07:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788446748; x=1789051548; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzI1smX7/IMyEGD/fNZX1tdlHe3Ey7XN1U8MbWwGg2c=;
        b=IQJOecPrZ0PmDVaLiOR+KQ/hORhLzg2V9T1pl/jEw+yd9quFneyhsxAZMRsSNAHTIK
         iXX5ASM96vNIB/T4OJYTS1e22u5qlBRVTbo7C/26Eynr4xVqeT4+0dI4liChv7lcAuoV
         OUDwzmIh5gNIS3N/YzJWdCfzwW8gxj+cPzHH/hZNpWGaQ7JzC/NbLosd/5TDz9HtK60r
         Gh2mxxSq2JFdyP2SAP2646oqO6lja9h298Fp4sXo5mTywPDME7w1KjxEfR9G2iyFyFdt
         kUf/e1Q+o0hcZ4nFQHBUexI8ZO8Sh6kdzUinERdk+giEY6Hwy+emqeFUjN7WA1yPFmth
         EDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446748; x=1789051548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzI1smX7/IMyEGD/fNZX1tdlHe3Ey7XN1U8MbWwGg2c=;
        b=Rog48DgVPKKH9X/9w7dKIN3qvNDVZe1cKC5T+J+aQB/AP6XeNr2gFaQWgpH7kYeHVO
         XDcdrIK6Kc7q6bEoRuFZYeS/2wMtSRtbDv8O9qLbl7PgUF58Md6LZglpm4bbHxFmqhpX
         cU6LorU/KKQ8Be8nuCvkyg/zcLAklSOpMXQddlstf+DTJOg8S7AB7OTGkl2iS5bW+VC4
         AoW/7jyuJfWzWK3Acl2kOA33G0w8XfFqTeajudyUmGaPc/o+BTZgtlf8pWMBxJh2A1F/
         O88Bj7WIYWS9njz5yuDJjPx32r3x0nrsu+ZYh4B5C56ucENkkUJeV7vcBNBPyO7V9rR5
         12dQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1Ko9eNh8HRysequb43bzdK5UR2fr52m9GKtd8IjQiXO49ltAWvHddlnR/lxpxGIRBE500fnfwAUmQ6BhgrBJL@lists.infradead.org
X-Gm-Message-State: AFuF++mtB61C7r/NPLCH2+qHSCdM+mB6Vi9s++ZxCQ98z0CTxycGBNjE
	h9Ga5cRaYHBvTtcJD4P41wJMHgyim/EYGtTfeBvV6/u4BSWm2T+2c9XcOtnv+uaaVBCzxn9+KgX
	PLUXtpA==
X-Received: from pgcv12.prod.google.com ([2002:a05:6a02:530c:b0:cc1:57f5:f8fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4408:b0:857:4dea:e2fe
 with SMTP id d2e1a72fcca58-85ed8ed8414mr20185879b3a.13.1788446747432; Thu, 03
 Sep 2026 07:45:47 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:45:46 -0700
In-Reply-To: <apmFClPZ2WcDINmT@google.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-3-seiden@linux.ibm.com>
 <apdweRfqt4dTxcU9@google.com> <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com> <20260903114241.33034-C-seiden@linux.ibm.com>
 <apmEi1NmOUvmUBFP@google.com> <apmFClPZ2WcDINmT@google.com>
Message-ID: <apmIGgMEN8w-kQAm@google.com>
Subject: Re: [PATCH v7 02/23] KVM: Make device name configurable
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
X-CRM114-CacheID: sfid-20260903_074549_266533_6EAE7C60 
X-CRM114-Status: GOOD (  36.31  )
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

On Thu, Sep 03, 2026, Sean Christopherson wrote:
> On Thu, Sep 03, 2026, Sean Christopherson wrote:
> > On Thu, Sep 03, 2026, Steffen Eiden wrote:
> > > On Wed, Sep 02, 2026 at 09:14:21AM -0700, Sean Christopherson wrote:
> > > > And taking things a few steps further, we can solve the MMIO issue in a more
> > > > elegant way, and eliminate the runtime string building in this patch (after looking
> > > > more closely, that code needs to be jettisoned no matter what, there's simply no
> > > > reason to specify the names at runtime since they're separate compilation units).
> > > > 
> > > > Rather than splatter #defines throughout header files, deal with the bulk of the
> > > > pain in Makefile.kvm.  By feeding conditionals into Makefile.kvm, the s390+arm64
> > > > build can easily omit coalesced_mmio.o and async_pf.o, define __KVM_HAVE_ARCH_MMIO
> > > > programatically without having to change other architectures, and solve the naming
> > > > stuff.
> > > 
> > > Yes, this is a great idea. Thank you. I second you, this looks more clean
> > > and stable than the stuff we came up with :) 
> > 
> > Looking more at arch/s390/kvm/Kconfig and virt/kvm/Kconfig, we might need/want to
> > to build out infrastructure to handle this sort of thing in a more generic fashion?
> > 
> > Which probably isn't that much infrastructure?  It's more just changing how arch
> > code communicates with common KVM?  I.e. instead of providing boolean configs in
> > virt/kvm/Kconfig, formalize communicating HAVE-type macros through the Makefile.
> > That might even be a net positive in the long run, as it will make it easier to
> > provide defaults for the common cases.
> > 
> > I say that because unless there's magic I'm unaware of these Kconfigs also needs
> > to be configured per-KVM, not per-kernel:
> > 
> >   - KVM_MMU_LOCKLESS_AGING, otherwise aging on arm64 will unintentionally be done
> >     outside of mmu_lock.
> > 
> >   - KVM_GENERIC_PRE_FAULT_MEMORY, so that arm64 doesn't need to provide a stub
> >     for something it doesn't support
> > 
> >   - HAVE_KVM_MSI, because presumably it's needed for arm64 support.
> > 
> >   - HAVE_KVM_READONLY_MEM, same story as HAVE_KVM_MSI.
> 
> And in the opposite direction, HAVE_KVM_VCPU_RUN_PID_CHANGE also falls into this
> category.  That one is probably better handled as a #define in header files?

Continuing the conversation with myself, add in HAVE_KVM_NO_POLL and
HAVE_KVM_INVALID_WAKEUPS (which reminds me, valid_wakeup should really be moved
into s390's kvm_vcpu_arch).

> > Which isn't _that_ many knobs, but add in KVM_MMIO, KVM_ASYNC_PF, and
> > KVM_ASYNC_PF_SYNC, and it's enough that I think we should think about the big
> > picture and not play whack-a-mole.
> > 
> > Actually, thinking about this more, what I've proposed here, plus the pattern of
> > #define-ing macros in arch-specific kvm_host.h files, should suffice.  For things
> > like __KVM_HAVE_ARCH_VM_FREE, it absolutely makes sense to #define the macro in
> > kvm_host.h since it's very directly tied to an arch callback.  Whereas with KVM_MIO
> > and KVM_ASYNC_PF, because they enable compilation of C files, it makes sense to
> > define them in Makefiles.
> > 
> > So I think the "gap" is purely that the four knobs listed above need handling
> > (and arguably KVM_MMU_LOCKLESS_AGING is ok as-proposed).  But I do think we should
> > try our best to be more thoughtful than we usually are when deciding how to enable
> > common code, because obviously s390+arm64 is adding wrinkles no one has had to deal
> > with before.
> > 

