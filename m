Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D206C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32qgoYfovQ3gS/SAum8cU1W1nbKSlw2h8oFp1ZvYf5Q=; b=jk/Qz7Ou8gMMQksVCIOZz2NjcJ
	nQ+2hQj1dzhqrEkGmwzQ6xpxvqyoFLaPRIXgBEVAnPmRE58MVZ3nSjhP7c5AA3U/49t5HzVt/9E8e
	I+3hLVuvqKr8QVDmTbzn6J371hahk9EPrFilFukZeCeMKG9AikpB85AG/BIVyjcXTRwcBptHh2XMQ
	7H2Zuklyz3OXCZSWHc0rGMwYR/L6GdW2AR6Z8HJBIzUCt0W0J/q9jy9cPdyK99I3FAzV5oxGlI6/M
	rsNEKGEqx8BGZ+C6/vZ0uxpTPTNHlNv6CPRYMA7jdxgnqSbmvLPfXQvNltW5PF6lTOtsiTbhxS5p2
	6IvwCKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdG-0000000Dell-1aUg;
	Wed, 28 May 2025 16:27:58 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIbO-0000000DXVo-2j3x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:21:59 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso3861772276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748445718; x=1749050518; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32qgoYfovQ3gS/SAum8cU1W1nbKSlw2h8oFp1ZvYf5Q=;
        b=dxFaLV25gXPE73qMnclDYULyaFTCSeIlDaZe/zq+y1UWJdaG1LdruBErKwTP1McHBU
         6CEs8SrwUOZNzrZHmyWmE0VB+uYDrXiBcSoOEu1yRNUjfOCG/ieciIB/8mzJoaGzR0j2
         FW6yyPiwx0wIZTeErSqvO6URDIoekf+sitIfo7qiKxNKwuYHum2tKyx/ovNYL3n3zMSB
         ssYO6cLsaRXwOwqdoGf78y+3RGgFx7IiMqakU3AjaZILpEYDcNxCcE39ydAOOIeaPc6L
         oBW4NU6nXkNJtGBENkOhU4PJk3F1fbhvh9O/fAnxcvNuVE+o+f2aEdIkwfrhDDwTr6Ue
         X9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748445718; x=1749050518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32qgoYfovQ3gS/SAum8cU1W1nbKSlw2h8oFp1ZvYf5Q=;
        b=Vez/xtp75Mz1jwCf+2NuU7urYHeJKPycsCGnwqdYXeA8AinILI74OAxjbTN2d2dt1D
         aggZVpb9vzL/oRzN5evDDkgIIDkr/lmIMMEjxLg2OAkxtuBywGFDu8gJ8UN6M3AjErxH
         T2Hc4ukoYnbeV40R2TjzMwb8OwnCjYg0jDzAkHT1iiNGqzavtt2H4qQisLmVXqxYzDsR
         7NaM11X375qqSKNoV4R4tVqJpm5Br0/ZqdgY4SM1pUosJZs7Ko3apvGQMLwMzIs8ajO7
         U+TKkh+gE/IDXsvkH8bPIe9fudK4uItapxgI1GQfIHQt+FQ/TId5YIOpaHRzNCGyAbfp
         kxRw==
X-Forwarded-Encrypted: i=1; AJvYcCUJU17x0VbUhvrefU9E5KydEMPHfotXBYuWhgE6Ql21gJ4vvvvidVIBLTOVFVQFs0KMieJtmHY3pDoAcUo7d/UT@lists.infradead.org
X-Gm-Message-State: AOJu0YxnKjYF6NPV3RtqLHToCJu4ddl7U9zUYNN8N28tGTnFeZxI+QHk
	3yTdaOh3Kgq1YNyYWCPxaeELs/MwkVu4lV2PZiMe936tAePZPxhpC9jLhKa05ISpAznXfLFw2Ga
	cdoQLKcVC6iwt6w9zIOZcBoTipjLQSU/t9IfY5DiZ
X-Gm-Gg: ASbGncvUCCBcwEdwmqmr/dBCrCmmEmgCbq69wSqtrs6okdf5YxN37jxtFOimNr0oKE9
	uKuQmE672hsOprXlsR1+df0AtTy+LHVx9Mmuiv/V4+HZpDWvIeLF4/xGUb0RgJ3+M296dwjhP0Z
	tkGPuFDy4ucDZOFKyDgGEUeAFmRxm9zum9dzaRtp87mFwprRZ/TEOuedQM+pg3PlMB3x5oJyWW8
	E2lVA==
X-Google-Smtp-Source: AGHT+IFSzzwtG0QBLjREdP8rJp3MI7Sye8YaM/FgQl/WLbT3PKgJS/6Q9/qQMcY7F2ocTfZADqMYbCZWjE0ffy1ogQw=
X-Received: by 2002:a05:6902:2b0c:b0:e78:f7a0:fd02 with SMTP id
 3f1490d57ef6-e7f61839725mr2840203276.37.1748445717406; Wed, 28 May 2025
 08:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-2-jthoughton@google.com> <aBqi7fDtnvxzxV1V@google.com>
In-Reply-To: <aBqi7fDtnvxzxV1V@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 28 May 2025 11:21:21 -0400
X-Gm-Features: AX0GCFti85Bmslv3UKy35YTx4AbsV0M4oMVo9TuLb01TfEKfWoCE-rNdRG1Yeks
Message-ID: <CADrL8HUMm0PUqx-xNdPvSMP6z4gzs2OTUJG1sdyy88D-XWxT3g@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_082158_709588_EA12B609 
X-CRM114-Status: GOOD (  42.82  )
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

On Tue, May 6, 2025 at 8:01=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Jan 09, 2025, James Houghton wrote:
> > Use one of the 14 reserved u64s in struct kvm_userspace_memory_region2
> > for the user to provide `userfault_bitmap`.
> >
> > The memslot flag indicates if KVM should be reading from the
> > `userfault_bitmap` field from the memslot. The user is permitted to
> > provide a bogus pointer. If the pointer cannot be read from, we will
> > return -EFAULT (with no other information) back to the user.
>
> For the uAPI+infrastructure changelog, please elaborate on the design goa=
ls and
> choices.  The "what" is pretty obvious from the patch; describe why this =
is being
> added.
>
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> >  include/linux/kvm_host.h | 14 ++++++++++++++
> >  include/uapi/linux/kvm.h |  4 +++-
> >  virt/kvm/Kconfig         |  3 +++
> >  virt/kvm/kvm_main.c      | 35 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 55 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 401439bb21e3..f7a3dfd5e224 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -590,6 +590,7 @@ struct kvm_memory_slot {
> >       unsigned long *dirty_bitmap;
> >       struct kvm_arch_memory_slot arch;
> >       unsigned long userspace_addr;
> > +     unsigned long __user *userfault_bitmap;
> >       u32 flags;
> >       short id;
> >       u16 as_id;
> > @@ -724,6 +725,11 @@ static inline bool kvm_arch_has_readonly_mem(struc=
t kvm *kvm)
> >  }
> >  #endif
> >
> > +static inline bool kvm_has_userfault(struct kvm *kvm)
> > +{
> > +     return IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT);
> > +}
>
> Eh, don't think we need this wrapper.  Just check the CONFIG_xxx manually=
 in the
> one or two places where code isn't guarded by an #ifdef.
>
> >  struct kvm_memslots {
> >       u64 generation;
> >       atomic_long_t last_used_slot;
> > @@ -2553,4 +2559,12 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_v=
cpu *vcpu,
> >                                   struct kvm_pre_fault_memory *range);
> >  #endif
> >
> > +int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot=
,
> > +                   gfn_t gfn);
> > +
> > +static inline bool kvm_memslot_userfault(struct kvm_memory_slot *memsl=
ot)
>
> I strongly prefer kvm_is_userfault_memslot().  KVM's weird kvm_memslot_<f=
lag>()
> nomenclature comes from ancient code, i.e. isn't something I would follow=
.
>
> > +{
> > +     return memslot->flags & KVM_MEM_USERFAULT;
>
> I think it's worth checking for a non-NULL memslot, even if all current c=
allers
> pre-check for a slot.
>
> > @@ -2042,6 +2051,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >               if (r)
> >                       goto out;
> >       }
> > +     if (mem->flags & KVM_MEM_USERFAULT)
> > +             new->userfault_bitmap =3D
> > +               (unsigned long __user *)(unsigned long)mem->userfault_b=
itmap;
>
>         if (mem->flags & KVM_MEM_USERFAULT)
>                 new->userfault_bitmap =3D u64_to_user_ptr(mem->userfault_=
bitmap);

Applied this change to the other cast (where we do access_ok()) as well, th=
anks!

>
> >       r =3D kvm_set_memslot(kvm, old, new, change);
> >       if (r)
> > @@ -6426,3 +6438,26 @@ void kvm_exit(void)
> >       kvm_irqfd_exit();
> >  }
> >  EXPORT_SYMBOL_GPL(kvm_exit);
> > +
> > +int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot=
,
> > +                    gfn_t gfn)
>
> I think this series is the perfect opportunity (read: victim) to introduc=
e a
> common "struct kvm_page_fault".  With a common structure to provide the g=
fn, slot,
> write, exec, and is_private fields, this helper can handle the checks and=
 the call
> to kvm_prepare_memory_fault_exit().
>
> And with that in place, I would vote to name this something like kvm_do_u=
serfault(),
> return a boolean, and let the caller return -EFAULT.

Returning 'true' from kvm_do_userfault() without a
kvm_prepare_memory_fault_exit() looked a bit strange at first, but I
don't have strong feelings. I'll add a small comment there.

>
> For making "struct kvm_page_fault" common, one thought would be to have a=
rch code
> define the entire struct, and simply assert on the few fields that common=
 KVM needs
> being defined by arch code.  And wrap all references in CONFIG_KVM_GENERI=
C_PAGE_FAULT.
>
> I don't expect there will be a huge number of fields that common KVM need=
s, i.e. I
> don't think the maintenance burden of punting to arch code will be high. =
 And letting
> arch code own the entire struct means we don't need to have e.g. fault->a=
rch.present
> vs. fault->write in KVM x86, which to me is a big net negative for readab=
ility.
>
> I'll respond to the cover letter with an attachment of seven patches to s=
ketch out
> the idea.

Looks great! Thanks very much!

>
> > +{
> > +     unsigned long bitmap_chunk =3D 0;
> > +     off_t offset;
> > +
> > +     if (!kvm_memslot_userfault(memslot))
> > +             return 0;
> > +
> > +     if (WARN_ON_ONCE(!memslot->userfault_bitmap))
> > +             return 0;
>
> '0' is technically a valid userspace address.  I'd just drop this.  If we=
 have a
> KVM bug that results in failure to generate usefaults, we'll notice quite=
 quickly.
>
> > +
> > +     offset =3D gfn - memslot->base_gfn;
> > +
> > +     if (copy_from_user(&bitmap_chunk,
> > +                        memslot->userfault_bitmap + offset / BITS_PER_=
LONG,
> > +                        sizeof(bitmap_chunk)))
>
> Since the address is checked during memslot creation, I'm pretty sure thi=
s can
> use __get_user().  At the very least, it should be get_user().

Thanks! I agree, __get_user() should be fine.

>
> > +             return -EFAULT;
> > +
> > +     /* Set in the bitmap means that the gfn is userfault */
> > +     return !!(bitmap_chunk & (1ul << (offset % BITS_PER_LONG)));
>
> test_bit()?

Thanks for all the feedback and applying it for me in those patches
you sent back. :)

