Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E97CA0EEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jY3sNtwdFAAn0D3rH2WM6exJASiMf81df/QjJ9/2MSs=; b=izfVkuyBh3YVeVd+KBFJ3CNXKE
	SF4aWC+KB3vnYqY2PcpMCSu560IFE6chxcahgTkL7QyKLNlhlRdnlxCWWckdYBoWWt5XBYS/Kx1J2
	Suw+EVSrQ676UaDwCqN/jPGcJMVDbVrRMFxByZZ/KmdtVHjp4YjKict4NHmC9uKeF24H5b+JtUvP8
	pZexkYyp7RYZPXzfIsRYUQn5oCFb3BeZ36O4OFLLNbc+hlFtynDgZLv124Ok5H64RXWIjcFyI06mw
	GszWtkwx490IVar9cqMFltuAnomFBVuAGA3lLRxdf6bdhKdKVhiCqN+eGGo13bBHyESgKY+m3odVj
	SAPNycZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0u6-00000003Qd4-3qxv;
	Fri, 15 Aug 2025 20:19:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umz0W-00000003Edj-3GZF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 18:18:30 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-242d3be5bdfso13585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 11:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755281907; x=1755886707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY3sNtwdFAAn0D3rH2WM6exJASiMf81df/QjJ9/2MSs=;
        b=WlYUK/hzHGz9k+RWbT8FDrhoUn/8c9r7/Dgj53CM6XZ1+yaCYvnJjAGpl3IGpLQzCN
         lKktzF+YMMabfLyZxm4pK2zQldz3FgBHnP9UwbAzG56i0042xiyW5uhLGIb+R3va6XBi
         DMUYwVV/+vVWlyjX4I/B+yBId3NkkY6fR72VemewZFeAJKeOs6/D04hncp0PtWuU4Q/Z
         d5tOVB/GXikpeU4JGPdyGmql3u/qXg/reRAS3sqUlUi50C5JF11eQOV4H757s97w7eEk
         Ano10kLppdcrt+l1cuEOy3SHgazL4AFhaHz0O1BPgGa0GiTzS7soJACy2ejXVR/L0SkV
         lXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755281907; x=1755886707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jY3sNtwdFAAn0D3rH2WM6exJASiMf81df/QjJ9/2MSs=;
        b=aVJC7i6SvhJK1avseTVusDKgPBz0JTnB/SWuIL3w2vqcmVEsBVV7S1AQv4Gi+A54m0
         Jm2GyaH1Wsx42unbi5uNJOirvza6XIGCXpmNIrLYuoyErqJDBmikCTd+qU8hN8ZmSuKK
         Gq4aaw6WVqO5tSCJelcIDc8iBgo3bGJPceRuGua5dNoiVLuhGi5Qp8jtrsJD7Gi17+nv
         F6+iArD9nbgGksoFrqM+C6HxxnVjWiJf5/LOBi2wrxVKgPmbQc8WcvHclAW8swWcnqyA
         eDu7j1ATb3KgzJdI2psL6mRIirv7BUS1wg9LzGX/pGVPpGu9RylPx10i6gh0mosJ9HBH
         QelA==
X-Forwarded-Encrypted: i=1; AJvYcCV3xmbG3KnS+vbToQX7byqPUlS0Psf35D43H7QxXBhS0JD+xWYDbOtxHYg+G1PVMxxarpSIXkZdX2IsXX+GZON+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Gh+DU1zV9Ydchs/rwfJxih/oz/z4LWOqqBxsgi5JCBlSeNyr
	OSs1YlBFig/4dFLWQY21+Tvn07/fLNR5/CCS+Iw6hUyqZGSzw1uSrCV5k90Ybmk12nR+kosUFjL
	hITaa9F0qcx9zz1jK/kFWKF78hv+jWAxGOqTOkKV5
X-Gm-Gg: ASbGncvngAfMirtyOcwOVftujToPWpor9vvocxrW1NE9BF8SEpPxboqagqUmFf8O1Qc
	fJBM8Oh21f9S45FGSLQDuW+F9EQhJvl+z6p4FK/96qjA52R2SluLgoCM8mpshvk6Ll2UL0ScmcD
	grLTDjyDgj20llkleqMp3oizCQiftnBHRcUlIJnFe1SVvNj0ycezHWlEjrk2rzfykaA6g/NyD4v
	55BchbH6lxwBspqscUR4L25c6K32ega9NOi/FBt+LaC6FbjItlyPw==
X-Google-Smtp-Source: AGHT+IG/MLfEHn+NUjk3JeTkvygoGYy2JeIHzIrZZHZgIjMPHcITqpps3JgVEHZ+BBPTyF9DrPEKdybZgIAFZ8JuvHo=
X-Received: by 2002:a17:902:f709:b0:242:abac:2aae with SMTP id
 d9443c01a7336-24478e4ac08mr177905ad.12.1755281907107; Fri, 15 Aug 2025
 11:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250611104844.245235-1-steven.price@arm.com> <20250611104844.245235-20-steven.price@arm.com>
 <CAGtprH-on3JdsHx-DyjN_z_5Z6HJoSQjJpA5o5_V6=rygMSbtQ@mail.gmail.com>
 <80c46a5c-7559-4763-bbf2-6c755a4b067c@arm.com> <CAGtprH_6DYk8POPy+sLc3RL0-5gcrTdPNcDWFTssOK5_U4B3Nw@mail.gmail.com>
 <23be7cdb-f094-4303-87ae-2fdfed80178b@arm.com>
In-Reply-To: <23be7cdb-f094-4303-87ae-2fdfed80178b@arm.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 15 Aug 2025 11:18:15 -0700
X-Gm-Features: Ac12FXxRfPJJ5CiXj1SEYOdMuRetA156ExPvVO3KltOm1QNQAryxM5r582UfZ7g
Message-ID: <CAGtprH9rbW173qZyC5_cHkKT5J4YDSg8itFcR2VZvSY88fsGrQ@mail.gmail.com>
Subject: Re: [PATCH v9 19/43] arm64: RME: Allow populating initial contents
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_111828_818784_25D89CEA 
X-CRM114-Status: GOOD (  39.48  )
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

On Fri, Aug 15, 2025 at 8:48=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> >>>> +static int populate_region(struct kvm *kvm,
> >>>> +                          phys_addr_t ipa_base,
> >>>> +                          phys_addr_t ipa_end,
> >>>> +                          unsigned long data_flags)
> >>>> +{
> >>>> +       struct realm *realm =3D &kvm->arch.realm;
> >>>> +       struct kvm_memory_slot *memslot;
> >>>> +       gfn_t base_gfn, end_gfn;
> >>>> +       int idx;
> >>>> +       phys_addr_t ipa =3D ipa_base;
> >>>> +       int ret =3D 0;
> >>>> +
> >>>> +       base_gfn =3D gpa_to_gfn(ipa_base);
> >>>> +       end_gfn =3D gpa_to_gfn(ipa_end);
> >>>> +
> >>>> +       idx =3D srcu_read_lock(&kvm->srcu);
> >>>> +       memslot =3D gfn_to_memslot(kvm, base_gfn);
> >>>> +       if (!memslot) {
> >>>> +               ret =3D -EFAULT;
> >>>> +               goto out;
> >>>> +       }
> >>>> +
> >>>> +       /* We require the region to be contained within a single mem=
slot */
> >>>> +       if (memslot->base_gfn + memslot->npages < end_gfn) {
> >>>> +               ret =3D -EINVAL;
> >>>> +               goto out;
> >>>> +       }
> >>>> +
> >>>> +       if (!kvm_slot_can_be_private(memslot)) {
> >>>> +               ret =3D -EPERM;
> >>>> +               goto out;
> >>>> +       }
> >>>> +
> >>>> +       while (ipa < ipa_end) {
> >>>> +               struct vm_area_struct *vma;
> >>>> +               unsigned long hva;
> >>>> +               struct page *page;
> >>>> +               bool writeable;
> >>>> +               kvm_pfn_t pfn;
> >>>> +               kvm_pfn_t priv_pfn;
> >>>> +               struct page *gmem_page;
> >>>> +
> >>>> +               hva =3D gfn_to_hva_memslot(memslot, gpa_to_gfn(ipa))=
;
> >>>> +               vma =3D vma_lookup(current->mm, hva);
> >>>> +               if (!vma) {
> >>>> +                       ret =3D -EFAULT;
> >>>> +                       break;
> >>>> +               }
> >>>> +
> >>>> +               pfn =3D __kvm_faultin_pfn(memslot, gpa_to_gfn(ipa), =
FOLL_WRITE,
> >>>> +                                       &writeable, &page);
> >>>
> >>> Is this assuming double backing of guest memory ranges? Is this logic
> >>> trying to simulate a shared fault?
> >>
> >> Yes and yes...
> >>
> >>> Does memory population work with CCA if priv_pfn and pfn are the same=
?
> >>> I am curious how the memory population will work with in-place
> >>> conversion support available for guest_memfd files.
> >>
> >> The RMM interface doesn't support an in-place conversion. The
> >> RMI_DATA_CREATE operation takes the PA of the already delegated
> >> granule[1] along with the PA of a non-delegated granule with the data.
> >
> > Ok, I think this will need a source buffer from userspace that is
> > outside guest_memfd once guest_memfd will support a single backing for
> > guest memory. You might want to simulate private access fault for
> > destination GPAs backed by guest_memfd ranges for this initial data
> > population -> similar to how memory population works today with TDX
> > VMs.
>
> Yes, that might well be the best option. At the moment I'm not sure what
> the best approach from the perspective of the VMM is. The current setup
> is nice because the VMM can populate the VM just like a normal non-coco
> setup, so we don't need to special-case anything. Requiring the VMM to
> load the initial contents into some other memory for the purpose of the
> populate call is a little ugly.

IIUC ARM CCA architecture requires two buffers for initial memory
population irrespective of whether we do it within kernel or in
userspace.

IMO, doing it in the kernel is uglier than doing it in userspace.
Baking the requirement of passing two buffers into userspace ABI for
populate seems cleaner to me.

>
> The other option is to just return to the double-memcpy() approach of
> emulating an in-place content-preserving populate by the kernel copying
> the data out of guest_memfd into a temporary page before doing the
> conversion and the RMM copying back from the temporary page. I worry
> about the performance of this, although it doesn't prevent the first
> option being added in the future if necessary. The big benefit is that
> it goes back to looking like a non-coco VM (but using guest_memfd).

Populate path is CoCo specific, I don't see the benefit of trying to
match the behavior with non-coco VMs in userspace.

>
> > Note that with single backing around, at least for x86, KVM
> > shared/private stage2 faults will always be served using guest_memfd
> > as the source of truth (i.e. not via userspace pagetables for shared
> > faults).
>
> Indeed, it's not yet clear to me whether we can only support this
> "single backing" world for CCA, or if it's going to be an option
> alongside using guest_memfd only for protected memory. Obviously we need
> the guest_memfd changes to land first too...

Having a dual backing support just for supporting the initial populate
seems overkill to me. How much payload in general are we talking about
in terms of percentage of total memory size?

IMO, dual backing for guest_memfd was a stopgap solution and should be
deprecated once we have single memory backing support.
CoCo VMs should default to using single backing going forward. Mmap
support [1] for guest_memfd is close to getting merged. In-place
conversion support is likely to follow soon.

[1] https://lore.kernel.org/all/20250729225455.670324-1-seanjc@google.com/

>
> At the moment I'm planning to post a v10 of this series soon, keeping
> the same API. But we will definitely want to support the new guest_memfd
> approach when it's ready.
>
> Thanks,
> Steve
>

