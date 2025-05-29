Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D2DC5B553
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59hS0MkzKJXc59NrQgViQhOudUVo0YC4RPrtVcYEmhM=; b=HrjlUDFaM3CzeVS7/xjbIIGKxA
	OX3CtjILsZsgTNcpSLaRkNSHscM2xYpgkqI+f4Datl8o+eRHe6xBFUSHWHiGLszT/48gns1tlNGkf
	hxau+S3y6TIbVj5aL86svLZI5C3LBXoGrGO1ndePpN5OXo1TGrGv30RoNUtOGpqFvCqQDgjiy+eCq
	JBx+6CprK74oYiGOdVQNjL71z+kniCuRSuHnCRAzBTr2RCqDBAev1mBbg+UBnuMXBrAJy80YbgjNJ
	kzr6yztTxYv4BZy0BJOWMKDAOH+VYfiwtjoRHbwZE2r9vWgP5HE+LhaWBAa6R5ZSGv3yNfcOpJQGy
	oVTj3vKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKftf-0000000G9KD-3m3y;
	Thu, 29 May 2025 16:14:23 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfKk-0000000G60v-2VWf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 15:38:19 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e7da171c504so981941276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748533097; x=1749137897; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59hS0MkzKJXc59NrQgViQhOudUVo0YC4RPrtVcYEmhM=;
        b=BwSNXMGVyC5wHFZkCoNeRYBxboTrw7IV8p1couv8d+9Q1nttFeWS5tncO8gCd4hJzD
         IbqQCX5HUtSs82PaelcHK7sOJRw+TB/fDQj/pvvfzxA3RS2sX4Lmxw6JjIawwm9vMYN5
         8Sv31cPHWdg6hslb7spJMePCm8J5PvHR3EcrxoMRT//n2ORXFRhzEQ8RVLfWkvcU0Rls
         IcsNKPbmjRi0LByifoIg7pDa2h4iADu69eqKCjw2rTsLHN2ZU94O7H0N8T4aAb8Uq+N2
         vi61q/ilVC2AJ7a0ADXdAllRmuTr9tbgQ71IXlyInIUYNvRJ80HxUtDMZoaggLdRpJP4
         O6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748533097; x=1749137897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59hS0MkzKJXc59NrQgViQhOudUVo0YC4RPrtVcYEmhM=;
        b=CthG7sW568uZuWR/gc/HdhnChVoWyyZ3UFOEiFBrKk/VjfdqdCMOacGBY3sQZzhLGb
         mmILfAaBh4yrvmh8480TSP5zEDblMwg8/8YshXCco/VM8DO2QQTn3HOB94DU9p8G/ksX
         ofvx/5gvouT1kho+K6AmEEZc5NdFyPKOWjO3a49EWLINYfkgN1eTKQwBaGgwZ8f8omjW
         oTlDMQB/6ZVWOfFvdTpMzoX7M6NhS8Dml+W/wwHZZGvlNk3/gSc2G0+n+EDQtlE9aFof
         ufnMf9/N0B3ysSSzvMQmt80Yi9oL300NuVm2Zp2ghlGYU5BO5YCCtREECizzaUbGUzcj
         3KZw==
X-Forwarded-Encrypted: i=1; AJvYcCXVMIEtr/6Ryom9/4HhcvfPd7EMG+GVhwqpLuxVb9IsX/3hqKcGzCt1JTaryDcuMJh5uk91Lsf/Ir7PSvz6w4Yk@lists.infradead.org
X-Gm-Message-State: AOJu0YyumKYNoikOuYytjtYxtDQ/CdOLudHtetmWkOLD6gVVceNCoruE
	Luy4arD90kzfsdi9b32vd2Id3jw+FRqW6znk8qD+C9lI9Ftp3W7Ww9uLzdKCs84d5//8jhu7ZU9
	IE3bwiPWGvKBX6H7bFZe/fqRSPP0tI9D651JNNlfw
X-Gm-Gg: ASbGncs0OxN9gYQv5/RzrehgARD/QmVtqZZq9Yfs/Uaf351nayUl4uYyHXF5Gb1IZz2
	s3HjkIT7qhxUDepetnOwPcbFAggXXrQPwDpX0IbkZ9K0W4zPg+C+e9M8yxCWo4GLgjl99t25qpw
	bf9Ki+nf3HcLhOE3iu0sE/HvNI/7PDDUQ20ztQUePYddFCblcRQSh8yDcghruqVT89z83FcJAwf
	9v61Q==
X-Google-Smtp-Source: AGHT+IFR1qIxg3DrCDwLoec3/Bow8uX+lKtS4uCaQmLEMzaDiZzqKZfkx5upp36mpzAbpQJS3YxhrYvCs4/T2jiOb1I=
X-Received: by 2002:a05:690c:4c0f:b0:70f:87c5:5270 with SMTP id
 00721157ae682-70f8b54d40dmr38902587b3.19.1748533096510; Thu, 29 May 2025
 08:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-6-jthoughton@google.com> <aBqj3s8THH9SFzLO@google.com>
 <aDdwXrbAHmVqu0kA@linux.dev> <aDd-lbrJAX62UQLn@google.com> <aDh1sgc5oAYDfGnF@google.com>
In-Reply-To: <aDh1sgc5oAYDfGnF@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 29 May 2025 11:37:39 -0400
X-Gm-Features: AX0GCFvRkUpRdhgyNhHX3Yph3U7NSJ2ckkL4g5EEunTqQRjiIBENP29k9ut9k84
Message-ID: <CADrL8HWgnuU9pyQfLcm9qpSJicfwgmc9qRzksA38x5_utexaug@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
To: Sean Christopherson <seanjc@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_083818_655995_A9FBA720 
X-CRM114-Status: GOOD (  33.35  )
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

On Thu, May 29, 2025 at 10:56=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Wed, May 28, 2025, Sean Christopherson wrote:
> > On Wed, May 28, 2025, Oliver Upton wrote:
> > > On Tue, May 06, 2025 at 05:05:50PM -0700, Sean Christopherson wrote:
> > > > > +       if ((old_flags ^ new_flags) & KVM_MEM_USERFAULT &&
> > > > > +           (change =3D=3D KVM_MR_FLAGS_ONLY)) {
> > > > > +               if (old_flags & KVM_MEM_USERFAULT)
> > > > > +                       kvm_mmu_recover_huge_pages(kvm, new);
> > > > > +               else
> > > > > +                       kvm_arch_flush_shadow_memslot(kvm, old);
> > > >
> > > > The call to kvm_arch_flush_shadow_memslot() should definitely go in=
 common code.
> > > > The fancy recovery logic is arch specific, but blasting the memslot=
 when userfault
> > > > is toggled on is not.
> > >
> > > Not like anything in KVM is consistent but sprinkling translation
> > > changes / invalidations between arch and generic code feels
> > > error-prone.
> >
> > Eh, leaving critical operations to arch code isn't exactly error free e=
ither :-)
> >
> > > Especially if there isn't clear ownership of a particular flag, e.g. =
0 -> 1
> > > transitions happen in generic code and 1 -> 0 happens in arch code.
> >
> > The difference I see is that removing access to the memslot on 0=3D>1 i=
s mandatory,
> > whereas any action on 1=3D>0 is not.  So IMO it's not arbitrary sprinkl=
ing of
> > invalidations, it's deliberately putting the common, mandatory logic in=
 generic
> > code, while leaving optional performance tweaks to arch code.
> >
> > > Even in the case of KVM_MEM_USERFAULT, an architecture could potentia=
lly
> > > preserve the stage-2 translations but reap access permissions without
> > > modifying page tables / TLBs.
> >
> > Yes, but that wouldn't be strictly unique to KVM_MEM_USERFAULT.
> >
> > E.g. for NUMA balancing faults (or rather, the PROT_NONE conversions), =
KVM could
> > handle the mmu_notifier invalidations by removing access while keeping =
the PTEs,
> > so that faulting the memory back would be a lighter weight operation.  =
Ditto for
> > reacting to other protection changes that come through mmu_notifiers.
> >
> > If we want to go down that general path, my preference would be to put =
the control
> > logic in generic code, and then call dedicated arch APIs for removing p=
rotections.
> >
> > > I'm happy with arch interfaces that clearly express intent (make this
> > > memslot inaccessible), then the architecture can make an informed
> > > decision about how to best achieve that. Otherwise we're always going=
 to
> > > use the largest possible hammer potentially overinvalidate.
> >
> > Yeah, definitely no argument there given x86's history in this area.  T=
hough if
> > we want to tackle that problem straightaway, I think I'd vote to add th=
e
> > aforementioned dedicated APIs for removing protections, with a generic =
default
> > implementation that simply invokes kvm_arch_flush_shadow_memslot().

I'm happy to add something like kvm_arch_invalidate_shadow_memslot()
which invokes kvm_arch_flush_shadow_memslot() by default (and has a
lockdep assertion for holding the slots lock), with no architectures
currently providing a specialization. Feel free to suggest better
names.

Or we could do kvm_arch_userfault_changed(/* ... */, bool enabled),
and, for the default implementation, if `enabled =3D=3D true`, do
kvm_arch_invalidate_shadow_memslot(), else do nothing. Then x86 can
specialize this. This arguably still leaves the responsibility of
unmapping/invalidating everything to arch code...

Let me know your preferences, Sean and Oliver.

>
> Alternatively, we could punt on this issue entirely by not allowing users=
pace to
> set KVM_MEM_USERFAULT on anything but KVM_MR_CREATE.  I.e. allow a FLAGS_=
ONLY
> update to clear USERFAULT, but not set USERFAULT.
>
> Other than emulating poisoned pages, is there a (potential) use case for =
setting
> KVM_MEM_USERFAULT after a VM has been created?

Today, Google's userspace does not know when creating memslots that we
will need to enable KVM_MEM_USERFAULT. We could delete and re-add the
memslots of course, but overall, for any userspace, I think adding
this restriction (for what seems to be a non-issue :)) isn't worth it.

Thanks!

