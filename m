Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892DDC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KU72ElW/WJuvWFFEt8qn0cRYWtv7/uUdQgw0J+lE/vo=; b=NOiFjeK8thLz5VgjMP5AAZJEfp
	5ESfKczfor4jk/UdMDu/HyWqCNUdGWDuLl72bPqUwt0m94YRZi3EilwEeoXd8Z+WmGL+vGaXtCl0d
	RNKx/gCyBW670OZl8/Go3aBX+ApHSmX//WwT8+bqxiBtnwa5CLPqwXtiBvZIUG4EETM0ye3GwiLTa
	O/fk8U12UXE+DBy/gyqfpJVNNK9pz37hayG72upXqtdCmb/UXxpuO2eItAJLvH8kOQLzf8Vah9Fyb
	RizDRKZZ2Ng28kgTqqThsKsCuIbm6voKkTZYk3q1WSw+kHRi0YwF33RtkoYokE/Zkq0aFPgjd3/ES
	hSV3Jo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Se-0000000HWMi-1pwh;
	Thu, 03 Sep 2026 14:30:40 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Sc-0000000HWMG-1Yrd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:30:39 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-85f3a39f3beso214726b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788445837; x=1789050637; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KU72ElW/WJuvWFFEt8qn0cRYWtv7/uUdQgw0J+lE/vo=;
        b=aRhjrGAeUycKZkzF/6jZXdfhdOqBmAKyV3x++DZ6aAGKpXsqPKmNHW4+nSwJmXKIvW
         UgVyVUZ69nEi/yTht01+wW7MhUJ6zAtoyWBJokD0q+k9gg0IBJ0tsdmUNdqQRP2oQzkA
         Ye4ZAvM1gcX4BofDOAqnDUEaUrX4rF4Nx8JquYclLIylVu0O7pZ/wnR/mBxGklD8UB4y
         uGenrG5v8ecUDbKs2XaeMeIi83DNFXquEMJA8J9vkqD10Axpf6WksbZAUin+rSltUQu6
         8eEGV2/HW1JbrGCv80Wpokgr1OeQVPvaJP1KDoBON1ydqwsLOYIPxhhxIIDmOJ3DLbWA
         Rl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445837; x=1789050637;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KU72ElW/WJuvWFFEt8qn0cRYWtv7/uUdQgw0J+lE/vo=;
        b=ksOALunKdQIyi8UR99yogOAvsqLg0zM5rPfAYIFZ8BWGCfcBhqumM48gBfXKleQukd
         5tfJQpz18ac43aOBDGMNamWmY0/jcX3EQyv7Yh5ViaSurO+wUNjhkRDRR/BJJRo7Q1Ab
         Da7t3P15NMw1SW7hDeq/pu0pd27jbu8Ij3BOhrC3ESXWu5StKvkoiC6hUBb1qWFDZUiB
         PqDTpWO/rXdhS3oQgCuvYUkdt71DmyuTzfwJeI55uWRy5aj1EZzB7b6XQC+PgEpqkMCc
         Wgss8a+zUqhuaubbyebOUIz544XdP2Sz9imEm0Fd8LF02N8BmSvxCmC+jFS/bW0sWtWn
         Bliw==
X-Forwarded-Encrypted: i=1; AKwUvBwQOX5rlNrXLvknH1/BaRv8xSqqjPP/To2wK8SKtgUw2+sVWC/DnT8PqsEWyxHJOFRd0HJJ91crBTqQwW2986su@lists.infradead.org
X-Gm-Message-State: AFuF++nEOZP/7T+sH+n24PFT8J1fEB67fn1rRcNEJ0EFzIXUj7aKA/G+
	rbTqaWLao4czQgUhFtrWo0vGyfTSB9Q6dWBeu+GJ6CZdXMutmUTqydzxaQSnfnO92b22z45T24f
	yLzpFIA==
X-Received: from pfll28.prod.google.com ([2002:a05:6a00:159c:b0:84d:f9cf:1f3d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4106:b0:847:8449:2ba6
 with SMTP id d2e1a72fcca58-85ed23def83mr20907159b3a.8.1788445836362; Thu, 03
 Sep 2026 07:30:36 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:30:35 -0700
In-Reply-To: <20260903114241.33034-C-seiden@linux.ibm.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-3-seiden@linux.ibm.com>
 <apdweRfqt4dTxcU9@google.com> <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com> <20260903114241.33034-C-seiden@linux.ibm.com>
Message-ID: <apmEi1NmOUvmUBFP@google.com>
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
X-CRM114-CacheID: sfid-20260903_073038_697402_DF04BE2B 
X-CRM114-Status: GOOD (  25.26  )
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
> On Wed, Sep 02, 2026 at 09:14:21AM -0700, Sean Christopherson wrote:
> > And taking things a few steps further, we can solve the MMIO issue in a more
> > elegant way, and eliminate the runtime string building in this patch (after looking
> > more closely, that code needs to be jettisoned no matter what, there's simply no
> > reason to specify the names at runtime since they're separate compilation units).
> > 
> > Rather than splatter #defines throughout header files, deal with the bulk of the
> > pain in Makefile.kvm.  By feeding conditionals into Makefile.kvm, the s390+arm64
> > build can easily omit coalesced_mmio.o and async_pf.o, define __KVM_HAVE_ARCH_MMIO
> > programatically without having to change other architectures, and solve the naming
> > stuff.
> 
> Yes, this is a great idea. Thank you. I second you, this looks more clean
> and stable than the stuff we came up with :) 

Looking more at arch/s390/kvm/Kconfig and virt/kvm/Kconfig, we might need/want to
to build out infrastructure to handle this sort of thing in a more generic fashion?

Which probably isn't that much infrastructure?  It's more just changing how arch
code communicates with common KVM?  I.e. instead of providing boolean configs in
virt/kvm/Kconfig, formalize communicating HAVE-type macros through the Makefile.
That might even be a net positive in the long run, as it will make it easier to
provide defaults for the common cases.

I say that because unless there's magic I'm unaware of these Kconfigs also needs
to be configured per-KVM, not per-kernel:

  - KVM_MMU_LOCKLESS_AGING, otherwise aging on arm64 will unintentionally be done
    outside of mmu_lock.

  - KVM_GENERIC_PRE_FAULT_MEMORY, so that arm64 doesn't need to provide a stub
    for something it doesn't support

  - HAVE_KVM_MSI, because presumably it's needed for arm64 support.

  - HAVE_KVM_READONLY_MEM, same story as HAVE_KVM_MSI.

Which isn't _that_ many knobs, but add in KVM_MMIO, KVM_ASYNC_PF, and
KVM_ASYNC_PF_SYNC, and it's enough that I think we should think about the big
picture and not play whack-a-mole.

Actually, thinking about this more, what I've proposed here, plus the pattern of
#define-ing macros in arch-specific kvm_host.h files, should suffice.  For things
like __KVM_HAVE_ARCH_VM_FREE, it absolutely makes sense to #define the macro in
kvm_host.h since it's very directly tied to an arch callback.  Whereas with KVM_MIO
and KVM_ASYNC_PF, because they enable compilation of C files, it makes sense to
define them in Makefiles.

So I think the "gap" is purely that the four knobs listed above need handling
(and arguably KVM_MMU_LOCKLESS_AGING is ok as-proposed).  But I do think we should
try our best to be more thoughtful than we usually are when deciding how to enable
common code, because obviously s390+arm64 is adding wrinkles no one has had to deal
with before.

