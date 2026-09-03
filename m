Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C0C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jepDX0FobScpvhoQHC25avp5Il/0jZZ+6SCAUX+k/50=; b=xEcsbVqh977znm/hQ+V+0+6gHr
	dLT5Zs75A57zV41ORSksg2eCuzsR7HGgwzQeO/zbCfvcIrwmhUDCcmwWHCJmhw2LWncmcxHhSUSbK
	sf9+8DdtOfIXBYyB4gy+cAOHxmCXz6o8AY7Pq+KwCfqMqJtDF7caQcaQOnZZNpKy/Cv6apyVMqyc3
	9kxbEnb84p3j2agSXl0qafhiJp3woFlRmD8Csj1gi3vNL8JicCqeYKlTR41iArk4mhJwGaJ525IMF
	w8UfEh30/yA4y/vsxT+r8Zc9bzEbMD/9vcDaU3eG12VFPSGtjzc7j2fWHUyhuQ0DPKH2DOGjsny5y
	HmWmDDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Ui-0000000HWbJ-3SFw;
	Thu, 03 Sep 2026 14:32:48 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Ue-0000000HWaY-3sk6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:32:47 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso3643241a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788445963; x=1789050763; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jepDX0FobScpvhoQHC25avp5Il/0jZZ+6SCAUX+k/50=;
        b=GJmkpTgKbxCoeEC+7VYvkYTVc0z2TPqW6kwxN+dQM020tKlneuxBAfjKoI2VIL1QuG
         kBO6wf/WpJ2381n2mIMhKPYWehVb+6OTlAeFt3zGW2yksG1b/AmX2LfU9+A5K4tXHFkz
         OjZ42GLe0Ygz/cZXUtHp9wMCOwZph9/BE3vTAfSJxT55qhs/VfpSG9p1OQorc+luIh3m
         PZUENySVHcWKvhDYP8aA0OvMOPrAuTh6Z9LDoafqWYLGvZbDVkLfZv+0RLYVEHThazDC
         jXu7mfaMNCcFcCwG9vykGgUqT9f2vyucLRceAQTIp9lba+CaYHFic++CfVFlOpTKPFTr
         fWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445963; x=1789050763;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jepDX0FobScpvhoQHC25avp5Il/0jZZ+6SCAUX+k/50=;
        b=siq5eH/+eiJ7rIG4zMPLpdqZnsw7Cui6x3j5JB/h3ny3II85kPePmoDbXT2j/hfUJx
         EGkHOvGXzV3XM8YF9Jhlj8X9eYfuin7jLoGoRCd4I9QJwZF/aIEXMvNrzBhP8NORI8iF
         u/ucT1LeKCJ0ZrKqoLV2MCRLa3dqVHVgJPEFaWMRaFBw3emwULvLm1q5ANgpfarDeNYt
         AMkCTyKrewDYhC1A7YUjNpzp5QPOwD+fmJiKoSv9YwZKjlaq/3b0U8yK02Y6PWVnha7W
         gGB3xS4pLmgGwrcLTHKLM+gasM/lr5/gToRXQV+qVXpMSkPl2yiCYdhE4SIMTSBz5YQx
         X2Iw==
X-Forwarded-Encrypted: i=1; AKwUvByEbPk2bzFCdIXisScJIssZLJlCyxwdPr2xu6yP74lA8vnhxwIfSeLSmcfqpmeKBBQCdwvnFgJnNUQyQX8zWjHf@lists.infradead.org
X-Gm-Message-State: AFuF++lPRrzwVTCyzEUXHhQJ3gqA/2wGQFq1x4RkF1uk8zudv1+qV6fh
	FptSXUN6g4xnBycroQ+UDxaoeU/PfnPohJFnDkrnZwnVcRLjn9+4iY2oPW6yzvCr0WOd+MoKNYQ
	elp58rA==
X-Received: from pgac2.prod.google.com ([2002:a05:6a02:2942:b0:cc4:37bf:2cab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:33a8:b0:3d0:6c90:5a33
 with SMTP id adf61e73a8af0-3d9ad9a2a0bmr20468355637.4.1788445963198; Thu, 03
 Sep 2026 07:32:43 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:32:42 -0700
In-Reply-To: <apmEi1NmOUvmUBFP@google.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-3-seiden@linux.ibm.com>
 <apdweRfqt4dTxcU9@google.com> <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com> <20260903114241.33034-C-seiden@linux.ibm.com> <apmEi1NmOUvmUBFP@google.com>
Message-ID: <apmFClPZ2WcDINmT@google.com>
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
X-CRM114-CacheID: sfid-20260903_073244_967322_66D3E6C5 
X-CRM114-Status: GOOD (  32.06  )
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
> On Thu, Sep 03, 2026, Steffen Eiden wrote:
> > On Wed, Sep 02, 2026 at 09:14:21AM -0700, Sean Christopherson wrote:
> > > And taking things a few steps further, we can solve the MMIO issue in a more
> > > elegant way, and eliminate the runtime string building in this patch (after looking
> > > more closely, that code needs to be jettisoned no matter what, there's simply no
> > > reason to specify the names at runtime since they're separate compilation units).
> > > 
> > > Rather than splatter #defines throughout header files, deal with the bulk of the
> > > pain in Makefile.kvm.  By feeding conditionals into Makefile.kvm, the s390+arm64
> > > build can easily omit coalesced_mmio.o and async_pf.o, define __KVM_HAVE_ARCH_MMIO
> > > programatically without having to change other architectures, and solve the naming
> > > stuff.
> > 
> > Yes, this is a great idea. Thank you. I second you, this looks more clean
> > and stable than the stuff we came up with :) 
> 
> Looking more at arch/s390/kvm/Kconfig and virt/kvm/Kconfig, we might need/want to
> to build out infrastructure to handle this sort of thing in a more generic fashion?
> 
> Which probably isn't that much infrastructure?  It's more just changing how arch
> code communicates with common KVM?  I.e. instead of providing boolean configs in
> virt/kvm/Kconfig, formalize communicating HAVE-type macros through the Makefile.
> That might even be a net positive in the long run, as it will make it easier to
> provide defaults for the common cases.
> 
> I say that because unless there's magic I'm unaware of these Kconfigs also needs
> to be configured per-KVM, not per-kernel:
> 
>   - KVM_MMU_LOCKLESS_AGING, otherwise aging on arm64 will unintentionally be done
>     outside of mmu_lock.
> 
>   - KVM_GENERIC_PRE_FAULT_MEMORY, so that arm64 doesn't need to provide a stub
>     for something it doesn't support
> 
>   - HAVE_KVM_MSI, because presumably it's needed for arm64 support.
> 
>   - HAVE_KVM_READONLY_MEM, same story as HAVE_KVM_MSI.

And in the opposite direction, HAVE_KVM_VCPU_RUN_PID_CHANGE also falls into this
category.  That one is probably better handled as a #define in header files?

> Which isn't _that_ many knobs, but add in KVM_MMIO, KVM_ASYNC_PF, and
> KVM_ASYNC_PF_SYNC, and it's enough that I think we should think about the big
> picture and not play whack-a-mole.
> 
> Actually, thinking about this more, what I've proposed here, plus the pattern of
> #define-ing macros in arch-specific kvm_host.h files, should suffice.  For things
> like __KVM_HAVE_ARCH_VM_FREE, it absolutely makes sense to #define the macro in
> kvm_host.h since it's very directly tied to an arch callback.  Whereas with KVM_MIO
> and KVM_ASYNC_PF, because they enable compilation of C files, it makes sense to
> define them in Makefiles.
> 
> So I think the "gap" is purely that the four knobs listed above need handling
> (and arguably KVM_MMU_LOCKLESS_AGING is ok as-proposed).  But I do think we should
> try our best to be more thoughtful than we usually are when deciding how to enable
> common code, because obviously s390+arm64 is adding wrinkles no one has had to deal
> with before.
> 

