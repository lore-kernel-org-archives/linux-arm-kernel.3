Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D031E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 17:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr8r//vN2Czec+tejyZLABnIxiih+moPq7M5hQENusQ=; b=3l63P8akjueDSIgG0Zee7FX19C
	BU6TClfmh5jQRG7yn8C/aY4+8uTQjYOIa87UmZtYWz62DTu1labgzlBiT+lVl4uFzNQCRn2XbdIwT
	cx5zejFhzUowUshaq+Eb9n0kUeQDJNrT0IcVs056ZZBhGpabVL2v/rPZgggseJ6bHhLSWS5kK/zl0
	lPIuZfDn8SE83kzljMalEqAlbdzrsMpu+JtAgByJv0pv13NoZ3MB6Ywi0Jft7av7WaK1uzYn/Hpd6
	F4DWzyxoKZ/tzhbxXRrGQzHCHU2WmVa3JBiX6XLfl4iP+dPeGi8Wk9LcVpJUhouw9+V72ONvEGBFu
	tnufKjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPQi-0000000B2p7-0Y0r;
	Thu, 02 Jan 2025 17:56:20 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPOH-0000000B2Fl-1iUj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 17:53:50 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e3fd6cd9ef7so15278893276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 09:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735840427; x=1736445227; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vr8r//vN2Czec+tejyZLABnIxiih+moPq7M5hQENusQ=;
        b=h9RmrZ/lWQoErr13oOyAXfgx5w4b6KeV6rQ+uwAU7oe7Lp/iol6N21iADgGFDxSx2q
         L9KWGIKqwcs2LQpM5XOIEhSsDFFZD0IU0p3aJhY8vLHmKVrhwTTHY3heUfeSFwV+tRLk
         T6Ql7ikTDnf+vcol9n1rIjDgV7eQ/b+snX2fv46e+BitR7oEoXk1fo8l+HgxEBYhTK8/
         XaPucTbeDZ3APlzNZ6Vg2bUsxLewYHgQJGuw+4o+WMg+TebhIQgnKTwBZa/pBgs2hXIl
         Hw25z29urrHUUd02I20LOamqQjF2oDhkSu77pdvRzcu3qF4Un8OZDttMYV9iASJXGR9c
         OTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735840427; x=1736445227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vr8r//vN2Czec+tejyZLABnIxiih+moPq7M5hQENusQ=;
        b=nco+fGvDPGIWkJmJa/+S44CxKXzx6A6BVaJe+YMNMbccZCsORKQ26OQYuVzaP+aqzV
         WuMAugslqXzLIJE03nRzASOVrEqCIdB05/ht8lK4BOVjtL0A7EwOkjPvUo+WTxukbQCr
         otSFupP7wXD/LNsVqWNyErbcHANo7x4ZZ1KxjlgHo+LnmymmZp/odQwapWIBGLmbzphS
         Rmxlh4oq0pNiqaO9ArZAPq0Z89oFwB2D8afaRg1+B+Kj7S4YLxqXqoPGFv4e+2PcRkHr
         O9wV+w48dGEW8luiDzp7HStgoGyKkfRzOup+u4LTWt390YhlHZ1dEfKzD3YhipCcC68W
         rKMw==
X-Forwarded-Encrypted: i=1; AJvYcCV4hD0KYjheQAl7jOcp2hfw9G1dVdHbL4lzzfiVLSmXejwXBGVAkabF5RwC0vJLqpmt79DOZ8mDb2rpmLRUjyQD@lists.infradead.org
X-Gm-Message-State: AOJu0YzIID+V7Bwjv42I7qzGG2JNbs9g/Rp1pFKpPPz1N+4mThdhNrDB
	E9FjIhWCamHJeSfN+ktw3wxHDEAE0BnRFcSiYFPmLGx/XNW/P7YMAWY9RivKdujt9QGyk+KmsDF
	4hJiK6VES03VqyexltWtw2hN1H31IlY41y6px
X-Gm-Gg: ASbGnctPFbwvTVxpYqqrnx4XCYcTcKm9zXBLaX20wb/gMlOAKmjLG43XRWRn21nJinf
	Ot5t2Kl1vKqQ5JElvjbONfyauSG0HzRF0MPtaxQ==
X-Google-Smtp-Source: AGHT+IGk7bu0mC922JwLX9wsU00L7s3HiJmMdoo9Mzmq87IWKCchv+EYdPQCyAedtINMva3EGggnhenJUHAMWLgAmoc=
X-Received: by 2002:a05:690c:620c:b0:6ea:88d4:fd4f with SMTP id
 00721157ae682-6f3f7f07081mr293349917b3.18.1735840426897; Thu, 02 Jan 2025
 09:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com> <Z2simHWeYbww90OZ@x1n>
In-Reply-To: <Z2simHWeYbww90OZ@x1n>
From: James Houghton <jthoughton@google.com>
Date: Thu, 2 Jan 2025 12:53:11 -0500
Message-ID: <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
To: Peter Xu <peterx@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Yan Zhao <yan.y.zhao@intel.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, 
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_095349_455920_4B4DB86C 
X-CRM114-Status: GOOD (  72.28  )
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

On Tue, Dec 24, 2024 at 4:07=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
>
> James,

Hi Peter!

> On Wed, Dec 04, 2024 at 07:13:35PM +0000, James Houghton wrote:
> > This is a continuation of the original KVM Userfault RFC[1] from July.
> > It contains the simplifications we talked about at LPC[2].
> >
> > Please see the RFC[1] for the problem description. In summary,
> > guest_memfd VMs have no mechanism for doing post-copy live migration.
> > KVM Userfault provides such a mechanism. Today there is no upstream
> > mechanism for installing memory into a guest_memfd, but there will
> > be one soon (e.g. [3]).
> >
> > There is a second problem that KVM Userfault solves: userfaultfd-based
> > post-copy doesn't scale very well. KVM Userfault when used with
> > userfaultfd can scale much better in the common case that most post-cop=
y
> > demand fetches are a result of vCPU access violations. This is a
> > continuation of the solution Anish was working on[4]. This aspect of
> > KVM Userfault is important for userfaultfd-based live migration when
> > scaling up to hundreds of vCPUs with ~30us network latency for a
> > PAGE_SIZE demand-fetch.
>
> I think it would be clearer to nail down the goal of the feature.  If it'=
s
> a perf-oriented feature we don't need to mention gmem, but maybe it's not=
.

In my mind, both the gmem aspect and the performance aspect are
important. I don't think one is more important than the other, though
the performance win aspect of this is more immediately useful.

>
> >
> > The implementation in this series is version than the RFC[1]. It adds..=
.
> >  1. a new memslot flag is added: KVM_MEM_USERFAULT,
> >  2. a new parameter, userfault_bitmap, into struct kvm_memory_slot,
> >  3. a new KVM_RUN exit reason: KVM_MEMORY_EXIT_FLAG_USERFAULT,
> >  4. a new KVM capability KVM_CAP_USERFAULT.
> >
> > KVM Userfault does not attempt to catch KVM's own accesses to guest
> > memory. That is left up to userfaultfd.
>
> I assume it means this is an "perf optimization" feature then?  As it
> doesn't work for remote-fault processes like firecracker, or
> remote-emulated processes like QEMU's vhost-user?

For the !gmem case, yes KVM Userfault is not a replacement for
userfaultfd; for post-copy to function properly, we need to catch all
attempted accesses to guest memory (including from things like
vhost-net and KVM itself). It is indeed a performance optimization on
top of userfaultfd.

For setups where userfaultfd reader threads are running in a separate
process from the vCPU threads, yes KVM Userfault will make it so that
guest-mode vCPU faults will have to be initially handled by the vCPU
threads themselves. The fault information can always be forwarded to a
separate process afterwards, and the communication mechanism is
totally up to userspace (so they can optimize for their exact
use-case).

> Even though it could still 100% cover x86_64's setup if it's not as
> complicated as above?  I mean, I assumed above sentence was for archs lik=
e
> ARM that I remember having no-vcpu-context accesses so things like that i=
s
> not covered too.  Perhaps x86_64 is the goal?  If so, would also be good =
to
> mention some details.

(In the !gmem case) It can't replace userfaultfd for any architecture
as long as there are kernel components that want to read or write to
guest memory.

The only real reason to make KVM Userfault try to completely replace
userfaultfd is to make post-copy with 1G pages work, but that requires
(1) userspace to catch their own accesses and (2) non-KVM components
catch their own accesses.

(1) is a pain (IIUC, infeasible for QEMU) and error-prone even if it
can be done, and (2) can essentially never be done upstream.

So I'm not pushing for KVM Userfault to replace userfaultfd; it's not
worth the extra/duplicated complexity. And at LPC, Paolo and Sean
indicated that this direction was indeed wrong. I have another way to
make this work in mind. :)

For the gmem case, userfaultfd cannot be used, so KVM Userfault isn't
replacing it. And as of right now anyway, KVM Userfault *does* provide
a complete post-copy system for gmem.

When gmem pages can be mapped into userspace, for post-copy to remain
functional, userspace-mapped gmem will need userfaultfd integration.
Keep in mind that even after this integration happens, userfaultfd
alone will *not* be a complete post-copy solution, as vCPU faults
won't be resolved via the userspace page tables.

> >
> > When enabling KVM_MEM_USERFAULT for a memslot, the second-stage mapping=
s
> > are zapped, and new faults will check `userfault_bitmap` to see if the
> > fault should exit to userspace.
> >
> > When KVM_MEM_USERFAULT is enabled, only PAGE_SIZE mappings are
> > permitted.
> >
> > When disabling KVM_MEM_USERFAULT, huge mappings will be reconstructed
> > (either eagerly or on-demand; the architecture can decide).
> >
> > KVM Userfault is not compatible with async page faults. Nikita has
> > proposed a new implementation of async page faults that is more
> > userspace-driven that *is* compatible with KVM Userfault[5].
> >
> > Performance
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > The takeaways I have are:
> >
> > 1. For cases where lock contention is not a concern, there is a
> >    discernable win because KVM Userfault saves the trip through the
> >    userfaultfd poll/read/WAKE cycle.
> >
> > 2. Using a single userfaultfd without KVM Userfault gets very slow as
> >    the number of vCPUs increases, and it gets even slower when you add
> >    more reader threads. This is due to contention on the userfaultfd
> >    wait_queue locks. This is the contention that KVM Userfault avoids.
> >    Compare this to the multiple-userfaultfd runs; they are much faster
> >    because the wait_queue locks are sharded perfectly (1 per vCPU).
> >    Perfect sharding is only possible because the vCPUs are configured t=
o
> >    touch only their own chunk of memory.
>
> I'll try to spend some more time after holidays on this perf issue. But
> will still be after the 1g support on !coco gmem if it would work out. As
> the 1g function is still missing in QEMU, so that one has higher priority
> comparing to either perf or downtime (e.g. I'll also need to measure
> whether QEMU will need minor fault, or stick with missing as of now).
>
> Maybe I'll also start to explore a bit on [g]memfd support on userfault,
> I'm not sure whether anyone started working on some generic solution befo=
re
> for CoCo / gmem postcopy - we need to still have a solution for either
> firecrackers or OVS/vhost-user.  I feel like we need that sooner or later=
,
> one way or another.  I think I'll start without minor faults support unti=
l
> justified, and if I'll ever be able to start it at all in a few months ne=
xt
> year..

Yeah we'll need userfaultfd support for !coco gmem when gmem supports
mapping into userspace to support setups that use OVS/vhost-user.

And feel free to start with MISSING or MINOR, I don't mind. Eventually
I'll probably need MINOR support; I'm happy to work on it when the
time comes (I'm waiting for KVM Userfault to get merged and then for
userspace mapping of gmem to get merged).

FWIW, I think userspace mapping of gmem + userfaultfd support for
userspace-mapped gmem + 1G page support for gmem =3D good 1G post-copy
for QEMU (i.e., use gmem instead of hugetlbfs after gmem supports 1G
pages).

Remember the feedback I got from LSFMM a while ago? "don't use
hugetlbfs." gmem seems like the natural replacement.

> Let me know if there's any comment on above thoughts.
>
> I guess this feauture might be useful to QEMU too, but QEMU always needs
> uffd or something similar, then we need to measure and justify this one
> useful in a real QEMU setup.  For example, need to see how the page
> transfer overhead compares with lock contentions when there're, say, 400
> vcpus.  If some speedup on userfault + the transfer overhead is close to
> what we can get with vcpu exits, then QEMU may still stick with a simple
> model.  But not sure.

It would be nice to integrate this into QEMU and see if there's a
measurable win. I'll try to find some time to look into this.

For GCE's userspace, there is a measurable win. Anish posted some
results a while ago here[1].

[1]: https://lore.kernel.org/kvm/CAF7b7mqrLP1VYtwB4i0x5HC1eYen9iMvZbKerCKWr=
CFv7tDg5Q@mail.gmail.com/

> When integrated with this feature, it also means some other overheads at
> least to QEMU.  E.g., trap / resolve page fault needs two ops now (uffd a=
nd
> the bitmap).

I think about it like this: instead of UFFDIO_CONTINUE + implicit wake
(or even UFFDIO_CONTINUE + UFFDIO_WAKE; this is how my userspace does
it actually), it is UFFDIO_CONTINUE (no wake) + bitmap set. So it's
kind of still two "ops" either way... :) and updating the bitmap is
really cheap compared to a userfaultfd wake-up.

(Having two things that describe something like "we should fault on
this page" is a little bit confusing.)

> Meanwhile even if vcpu can get rid of uffd's one big
> spinlock, it may contend again in userspace, either on page resolution or
> on similar queuing.  I think I mentioned it previously but I guess it's
> nontrivial to justify.  In all cases, I trust that you should have better
> judgement on this.  It's just that QEMU can at least behave differently, =
so
> not sure how it'll go there.

The contention that you may run into after you take away the uffd
spinlock depends on what userspace is doing, yeah. For example in GCE,
before the TDP MMU, we ran into KVM MMU lock contention, and then
later we ran into eventfd issues in our network request
submission/completion queues.

>
> Happy holidays. :)

You too!

Thanks for the feedback, Peter! Let me know if I've misunderstood any
of the points you were making.

> Thanks,
>
> --
> Peter Xu
>

