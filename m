Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AF0C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJhBrTcV/2KTHPEGx8A5eIEZm9bF8mIMQSTTxnrKh3w=; b=GgMbn0T7bVnC1iU+6LZVG8Tp3j
	VD7onUKQXYrOHZYSph4wgr/ruhP0AOfhne7EV8liFa5J3Ve51LaAGGXT6ko/49caukTfKDaXbCCgz
	N6k1sNueaU6DKt1iRUF4u3nBvfdPK9sIMnZJyHx6GtlbLEJOMe84qCxrHYT6GwtteDb9j4K04sALt
	Tn+/ppVZV785tq/oxlO5x8/giSbxRYcAyTFeEasPlGKpvXwdc8wXqiuESv64juMWIAAKQGSAMpULy
	3AsfoQy/fRdHDdOwZW0XkuzTV2dWlOUT1+U7Cz7UbAdnHVvZMtmovSOXqifRSoJQnFC0RMl8eslvA
	bTHuNFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdn-0000000DfX7-2KwO;
	Wed, 28 May 2025 16:28:31 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJ1K-0000000DarF-40Yd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:48:49 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-70e1d8c2dc2so70297b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748447326; x=1749052126; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJhBrTcV/2KTHPEGx8A5eIEZm9bF8mIMQSTTxnrKh3w=;
        b=PqXKXClKzQ3Sfeuv2nVRZ3k9fgX1hg1/loye/XtBC9hqNd72OaMWwBZNTEulKJw2FW
         zg3f/oeTDigjoHLqHzKdkGoHhQb9NQZCJ/xQk4CdMPtacH9Qb+Tle4jq08g9jDH7B71G
         f2Tf6GCv8xSZmKxCexdvyTuBHzp6vqLPIg2B3z2tKbIeklFMmYayisoqmETRLzGutMv4
         1QggDLqL3THmihd9CO+fi2+kKt8QsiWGSUJ3bHbUe1YJ9kIXBO4d+j6Tc/fXGy8ndPYp
         BwKNM0NABkBU6KnYN5/Cs6vJf2gqaPz/yEG7xizwYWRKGOMZs7iFoPNM2DiLAJB39Zm7
         7T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748447326; x=1749052126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJhBrTcV/2KTHPEGx8A5eIEZm9bF8mIMQSTTxnrKh3w=;
        b=pt2kN370WrKEpXohHnCpn8eWSEFocHAI4CvidJxjWWfJzi8XWUxfT4yo91Drglctys
         DVI+/LvAuPPID+vQIJUB5JmJuG/ysTkri9EpObfm+JPiRO2YsncKRROC6Y0d6o/4g19P
         5sERBpb9j9M2k5da+dJ3I76BJgJWYeXbfxbr38eodCzK1OiS6gNGT8jni3LXntvryaWC
         x/KsAmBLjHYPXWJ9089gvZIH48JiAju6TbZD09Uyat7WvykTwxirCOuVNM5MqYpljS8v
         0DuFEtJ5BVvY3IRkXrMhaeL3KlLTkBlaSyaaVNXRxcqc181AYk1rizsf1YbD4cHowG0b
         DMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtdKG1vI+7CVo7ANalgADLBIRvwb+OTIQN5CObNSK7EbxtM6CI4myWbh4uTDm2NhMxknQ19ZtTlNoo98nd3s7Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzmxZMs6z25qTvzc2d9oApPwBy6AfQsOGtMQskyH3gvarQ/d+b2
	hBiz/p3s+T5SFKIoAnPaI+cJvy3fb68y0aZDNA3alWXQ0s0af1SyS5bHLZwVTsp0BM8cbXKb4OH
	3dKfgKfnCT9F2v4VG7OOhkmohMH8T2CdnYx1A9jFn
X-Gm-Gg: ASbGncuDDm271ULypJmyKzvQS2lGnLnxFYmopZDCAj6z6tiY1Yi5uc1vyNzh2bKl5EO
	CVAY4znfrCAm1yK5HVX1DByyUtcQxA8BSB2COlR/HgFPZhVXY44ch2kcVHfobeoq7aCwS68NW+w
	yHl81MG/Nr+vSTONKQ59R5Dbbttws0TxiqdlU92yHg5yIy5U0fzo6XkITJKFQdvkNRqbDkDacGt
	m9x6w==
X-Google-Smtp-Source: AGHT+IELfFCth5Pbkc2q+fs3hGfuRfgdVh0Gdule7jkxxm4LWUKEs85HrAmHhTzH2guxXlvKX1XFjzs03oe3LxVeaz0=
X-Received: by 2002:a05:690c:c02:b0:6fb:9280:5bf4 with SMTP id
 00721157ae682-70e2da69ba1mr219329397b3.30.1748447325426; Wed, 28 May 2025
 08:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com> <aBqlkz1bqhu-9toV@google.com>
In-Reply-To: <aBqlkz1bqhu-9toV@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 28 May 2025 11:48:09 -0400
X-Gm-Features: AX0GCFuLPsZ5TxH5z7efpKpwgvPpjgQZqJBp0wjKrKAAM8LNrge9ZlG7omP9Ut0
Message-ID: <CADrL8HXjLjVyFiFee9Q58TQ9zBfXiO+VG=25Rw4UD+fbDmxQFg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] KVM: Introduce KVM Userfault
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_084846_994595_F139D6DD 
X-CRM114-Status: GOOD (  24.49  )
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

On Tue, May 6, 2025 at 8:13=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Jan 09, 2025, James Houghton wrote:
> >   KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
> >   KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
> >   KVM: Allow late setting of KVM_MEM_USERFAULT on guest_memfd memslot
> >   KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION
> >   KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
> >   KVM: arm64: Add support for KVM_MEM_USERFAULT
> >   KVM: selftests: Fix vm_mem_region_set_flags docstring
> >   KVM: selftests: Fix prefault_mem logic
> >   KVM: selftests: Add va_start/end into uffd_desc
> >   KVM: selftests: Add KVM Userfault mode to demand_paging_test
> >   KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
> >   KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd toggle tests
> >   KVM: Documentation: Add KVM_CAP_USERFAULT and KVM_MEM_USERFAULT
> >     details
> >
> >  Documentation/virt/kvm/api.rst                |  33 +++-
> >  arch/arm64/kvm/Kconfig                        |   1 +
> >  arch/arm64/kvm/mmu.c                          |  26 +++-
> >  arch/x86/kvm/Kconfig                          |   1 +
> >  arch/x86/kvm/mmu/mmu.c                        |  27 +++-
> >  arch/x86/kvm/mmu/mmu_internal.h               |  20 ++-
> >  arch/x86/kvm/x86.c                            |  36 +++--
> >  include/linux/kvm_host.h                      |  19 ++-
> >  include/uapi/linux/kvm.h                      |   6 +-
> >  .../selftests/kvm/demand_paging_test.c        | 145 ++++++++++++++++--
> >  .../testing/selftests/kvm/include/kvm_util.h  |   5 +
> >  .../selftests/kvm/include/userfaultfd_util.h  |   2 +
> >  tools/testing/selftests/kvm/lib/kvm_util.c    |  42 ++++-
> >  .../selftests/kvm/lib/userfaultfd_util.c      |   2 +
> >  .../selftests/kvm/set_memory_region_test.c    |  33 ++++
> >  virt/kvm/Kconfig                              |   3 +
> >  virt/kvm/kvm_main.c                           |  54 ++++++-
> >  17 files changed, 419 insertions(+), 36 deletions(-)
>
> I didn't look at the selftests changes, but nothing in this series scares=
 me.  We
> bikeshedded most of this death this in the "exit on missing" series, so f=
or me at
> least, the only real question is whether or not we want to add the uAPI. =
 AFAIK,
> this is best proposal for post-copy guest_memfd support (and not just bec=
ause it's
> the only proposal :-D).

The only thing that I want to call out again is that this UAPI works
great for when we are going from userfault --> !userfault. That is, it
works well for postcopy (both for guest_memfd and for standard
memslots where userfaultfd scalability is a concern).

But there is another use case worth bringing up: unmapping pages that
the VMM is emulating as poisoned.

Normally this can be handled by mm (e.g. with UFFDIO_POISON), but for
4K poison within a HugeTLB-backed memslot (if the HugeTLB page remains
mapped in userspace), KVM Userfault is the only option (if we don't
want to punch holes in memslots). This leaves us with three problems:

1. If using KVM Userfault to emulate poison, we are stuck with small
pages in stage 2 for the entire memslot.
2. We must unmap everything when toggling on KVM Userfault just to
unmap a single page.
3. If KVM Userfault is already enabled, we have no choice but to
toggle KVM Userfault off and on again to unmap the newly poisoned
pages (i.e., there is no ioctl to scan the bitmap and unmap
newly-userfault pages).

All of these are non-issues if we emulate poison by removing memslots,
and I think that's possible. But if that proves too slow, we'd need to
be a little bit more clever with hugepage recovery and with unmapping
newly-userfault pages, both of which I think can be solved by adding
some kind of bitmap re-scan ioctl. We can do that later if the need
arises.

> So... yes?

Thanks Sean!

> Attached are a variation on the series using the common "struct kvm_page_=
fault"
> idea.  The documentation change could be squashed with the final enableme=
nt patch.
>
> Compile tested only.  I would not be the least bit surprised if I complet=
ely
> butchered something.

Looks good! The new selftests work just fine.

