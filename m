Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F94CC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wtc8z1lt0l7J7qwleBMoPVIkOE4MKmf5AJAUWp638/g=; b=y2D3YH0wTvTOt02ROD9Z6YpNI0
	H4TRy69YcLWWZnm6jB14U4bfVhfXAgqmmK14Sk7sy0Ub1IaDTaXTQ/XrwpUO4SLozAntcFp8683MU
	3K+C6AtGersYIGCGd1r7qP3AVF4ZEKjBtduKrIV0Wsw3masZSUcKA6geyPtpmf363BKqPaKiMjfqJ
	ASSaVlbccqMnR+bBJETKttKAHl+A+BVv/uTa029gOxLwQs92SfXPllgqr4L2376ab51Hw3D9aKUL6
	5PJhmpQvBclndoHkPwKDSpJinlq0tR1Lmpgsb5hnrstAyIcnXKTS/IeINb9ZgHiI/xtJQMXdTs0xD
	BiA61pMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfOj-0000000G6gL-3PRZ;
	Thu, 29 May 2025 15:42:25 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKegf-0000000G1A1-2MtC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:56:54 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-311b0ec138eso1012654a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748530612; x=1749135412; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wtc8z1lt0l7J7qwleBMoPVIkOE4MKmf5AJAUWp638/g=;
        b=aGEcHoE1DsDSNAZTSj+pHi5ixWNzz8CURLUygDzB+7QXRjNIIRapo7kqV6bDqEE8PX
         XcLR7D4onQcOZX9mEsIbEviagJw3EEDITXc+iA8BZ/fYveE98AhwiDKLY6xznzxMy00t
         0yVqUQzx7GlPMKZkI7K8zws32yH5zwVnBGP4+d4WKstImP+OJ5t0zHWunTUtjUVee1Cc
         sAl4krFRj+G/PNHymYMgUWvWPUde6P0fWqFMxAA4FPgAGHiOO6NeRXXk2qle8mWv6uVR
         EivNrsAycJhxBkEN2DYjHaInlP753qLU7Z27DTuoj+P1X2bMd53crRKmcUNkB+Wp/4Zm
         DvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748530612; x=1749135412;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wtc8z1lt0l7J7qwleBMoPVIkOE4MKmf5AJAUWp638/g=;
        b=Z837GYkvP6Bg3i2OUWygWnGZzN3jtytiBWQ+gB4v+jfl2t1xIKyptqXHaCPq1VHAJg
         0QBeD1n890bg0Y+AE2qvx7p6GJZ6x/ZBWQ9QaxmtWSpVhI/2/os9byelgVT6+Ozi04q6
         iGcVYK0OXAm718B+FgDz/w996yShYLAXMYFGQFeQ4/ONmbDNrMkZQxDDTQYUvFcP8ZhL
         yA5MhLaaOD6tZplgkQn95rc1Sl0zKc7tsiIxscKIphqnBmB7D8XSRUj62HzwHJ3/y5mV
         BhK+YLL2JBa4hRzrnAhY8hIo1v4d5j74ijtF93C/3Bkmc+bViIeOdLP02tCnxUHPCBqM
         hNTw==
X-Forwarded-Encrypted: i=1; AJvYcCVTUj6FvoosFyKBfLLUfOu/Eyy2rHNEv5YSpWFMWkQXOsG5pugwZ9CgalqrpTHmkNgzBEX8ZkU8vdQsJ3X3ORPw@lists.infradead.org
X-Gm-Message-State: AOJu0YxKFkwy0eIsA7SKjSgiu/OBp0lrd0WgIdzzBV71nvGM/5VccJ4i
	XWn62NzU7z0mTCXKyq1zZwWmcsBheTjdstYtunr84yAMn7oWwtCmRdOV/FelqgjjEhf4nNkVgiX
	FIKAJ8g==
X-Google-Smtp-Source: AGHT+IEOksNt6WLBVwwH9cCjd/EZtQ2Y3bLCTU4Al9fuM3w6GA9Cf3/1B4op9exa2/CpdjOTCglkD0RIbFs=
X-Received: from pjbpq14.prod.google.com ([2002:a17:90b:3d8e:b0:311:2c1f:b0d8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c09:b0:30c:4b1d:330
 with SMTP id 98e67ed59e1d1-311e7460123mr9878567a91.27.1748530611851; Thu, 29
 May 2025 07:56:51 -0700 (PDT)
Date: Thu, 29 May 2025 07:56:50 -0700
In-Reply-To: <aDd-lbrJAX62UQLn@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-6-jthoughton@google.com> <aBqj3s8THH9SFzLO@google.com>
 <aDdwXrbAHmVqu0kA@linux.dev> <aDd-lbrJAX62UQLn@google.com>
Message-ID: <aDh1sgc5oAYDfGnF@google.com>
Subject: Re: [PATCH v2 05/13] KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_075653_607935_0597F5F3 
X-CRM114-Status: GOOD (  30.47  )
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

On Wed, May 28, 2025, Sean Christopherson wrote:
> On Wed, May 28, 2025, Oliver Upton wrote:
> > On Tue, May 06, 2025 at 05:05:50PM -0700, Sean Christopherson wrote:
> > > > +	if ((old_flags ^ new_flags) & KVM_MEM_USERFAULT &&
> > > > +	    (change == KVM_MR_FLAGS_ONLY)) {
> > > > +		if (old_flags & KVM_MEM_USERFAULT)
> > > > +			kvm_mmu_recover_huge_pages(kvm, new);
> > > > +		else
> > > > +			kvm_arch_flush_shadow_memslot(kvm, old);
> > > 
> > > The call to kvm_arch_flush_shadow_memslot() should definitely go in common code.
> > > The fancy recovery logic is arch specific, but blasting the memslot when userfault
> > > is toggled on is not.
> > 
> > Not like anything in KVM is consistent but sprinkling translation
> > changes / invalidations between arch and generic code feels
> > error-prone.
> 
> Eh, leaving critical operations to arch code isn't exactly error free either :-)
> 
> > Especially if there isn't clear ownership of a particular flag, e.g. 0 -> 1
> > transitions happen in generic code and 1 -> 0 happens in arch code.
> 
> The difference I see is that removing access to the memslot on 0=>1 is mandatory,
> whereas any action on 1=>0 is not.  So IMO it's not arbitrary sprinkling of
> invalidations, it's deliberately putting the common, mandatory logic in generic
> code, while leaving optional performance tweaks to arch code.
> 
> > Even in the case of KVM_MEM_USERFAULT, an architecture could potentially
> > preserve the stage-2 translations but reap access permissions without
> > modifying page tables / TLBs.
> 
> Yes, but that wouldn't be strictly unique to KVM_MEM_USERFAULT.
> 
> E.g. for NUMA balancing faults (or rather, the PROT_NONE conversions), KVM could
> handle the mmu_notifier invalidations by removing access while keeping the PTEs,
> so that faulting the memory back would be a lighter weight operation.  Ditto for
> reacting to other protection changes that come through mmu_notifiers.
> 
> If we want to go down that general path, my preference would be to put the control
> logic in generic code, and then call dedicated arch APIs for removing protections.
> 
> > I'm happy with arch interfaces that clearly express intent (make this
> > memslot inaccessible), then the architecture can make an informed
> > decision about how to best achieve that. Otherwise we're always going to
> > use the largest possible hammer potentially overinvalidate.
> 
> Yeah, definitely no argument there given x86's history in this area.  Though if
> we want to tackle that problem straightaway, I think I'd vote to add the
> aforementioned dedicated APIs for removing protections, with a generic default
> implementation that simply invokes kvm_arch_flush_shadow_memslot().

Alternatively, we could punt on this issue entirely by not allowing userspace to
set KVM_MEM_USERFAULT on anything but KVM_MR_CREATE.  I.e. allow a FLAGS_ONLY
update to clear USERFAULT, but not set USERFAULT.

Other than emulating poisoned pages, is there a (potential) use case for setting
KVM_MEM_USERFAULT after a VM has been created?

