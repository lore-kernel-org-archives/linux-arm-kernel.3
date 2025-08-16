Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64574CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 01:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4ItdIwW0Nn2rbKUapLvi+7KaOlcmfEY49F8WH61kT0=; b=fSokJFBV5J/YV6cN++O7Q6pqv7
	gM62/AvdYHN0o1sYS3hwHbLX5DjLBEALLA7AFbRvZc0YDXLqg5S5b9P6jKPuGnItVsOKHfbXbI8BN
	aMVx2Wt17Lzc08tLf29wHof3UKzbINDrnXeDkfS/JWi5HLoWG9uKbhTQcKDuJ4YIONv4W2TVCY59r
	wozGSsZ+UY1SZU+eNT39NmMnNYx1mQi5SjYzs5y+Vrp9nd+h2Yu5ujLSLi7xhx2fXrEO3ewyxQSM9
	rkhqti/9Y77sPGVvWOg9GFhOzJvBmHaoDZI8GSvWwdcrtDtxT7VdPXVmNoKcI8UMfkDNJ7eO0YAvR
	8xIiyxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un6Cs-00000003uYg-1i8I;
	Sat, 16 Aug 2025 01:59:42 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un6A5-00000003tPx-480V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 01:56:51 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-242d3be5bdfso39545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 18:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755309409; x=1755914209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4ItdIwW0Nn2rbKUapLvi+7KaOlcmfEY49F8WH61kT0=;
        b=31HjJCVmcejFLjQfh9575YEPAFUW+FVw1U6ZjsSu+cECk+6D8XWzfwLzCZa6AR+x4s
         vLmA/axz7nOnohZQkZ9nphtvORqwNblyGwqoLybWOUCn2e6mmXsgIMWqmWNLBTsPfVVT
         dOtk78JZDOxeQG5myOEkrV2nzJRWEPTCNh12tplqe5ugaLNup4T97x01I7kG/b+1QDy4
         OzADkk4dUdyvpD2vsHvGwRGehaJU5gDRvSf6K9cbNcLebn7R/7uOgQVfYSIhe1HVeMv/
         2e+uVyViFaSCVqc9q3+2obZULGz5aF2cugA5rfAt1Rs62pkZB5NTUvMPxrp4/c4Ce1qH
         OmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755309409; x=1755914209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4ItdIwW0Nn2rbKUapLvi+7KaOlcmfEY49F8WH61kT0=;
        b=nfYUwMn7m6Xx4sEVLBPZuxxegbs58TI12zVFxNsA7EJnSuCiJHNQuDKzl+d4rmYvFU
         Ag4cF5QwOkqV8oREa8v77I+P+aAP7OfR0bZc9bD9+GwgvazcgojloVmvRYBcp+iMvc+l
         Zp04uv5WBI8x+GIg4RUSED5KvudjKrBUbOfSXF+AGoETnojLjSkgxflEKzeolAuyc0YC
         kPO5oWX5v19PZsMNEsGMBKFN+Frmt4K8tS/ZvKxyBtUjVFXKzI8f5I5PXZzqZ4NyhDO8
         DNHB87dfRuCN1GUX+0FQKxpg/aesU/RxNT2xB1h2ZkZ5K5IxD0CowrWtAwqPzWruFhuq
         KGkw==
X-Forwarded-Encrypted: i=1; AJvYcCWYqyjmJrtJSRUs0a9D9euq6+sYDkLBhUEMPM896O4bBXHYJ7hRy3seG9YoxGmXRNbN8TxlVEctmYgd9XfXcDyn@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ5NNW6K83xClcdPr7txfMfu7UDmzT2AGDHwYwjwDeycn6xmus
	Ugc4o+4KuaOtCdJNooWQfAgY8a1466x7aXrizZfPl7PN08PGzbu0yrEiZTktrDiu5nV3uWSFMrP
	3q44EutRfp5nmktIVVAHCSSxo6yzjwSa8y+TKZ9G/
X-Gm-Gg: ASbGnct7kYu0e+ZAou5SyCKTqiRYrrAwSzGvi2rwLEY62k7ARHh6MC7Es00F/8NLqH4
	UsoLezkBQw9zy/Rfi3tMsy04oJSeqHV/Rax5hKiXvQPwnmkSFKfdZrmRHawleFRcrO87Xe1kQvI
	UeImQrAG4norLskkPsBKuaKlvgz1n3voJ40xY4a1ar642LKWZ3Od70HZY3JHBA6iFp6kem9i1lg
	gbJRxr0IezwKp7B35WPPG+BqNBbM6gkIZ7M7DTZQrc=
X-Google-Smtp-Source: AGHT+IGjIbEibm7TAU0Qy99Qr9hDz/0we50Y7edVXGYdgrm7Uw4jOk5StezzxSbZkloheGwBu8Np97ishY6Mw8oSHGs=
X-Received: by 2002:a17:903:18e:b0:223:2630:6b86 with SMTP id
 d9443c01a7336-2447a749a14mr766545ad.7.1755309408800; Fri, 15 Aug 2025
 18:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250611104844.245235-1-steven.price@arm.com> <20250611104844.245235-20-steven.price@arm.com>
 <CAGtprH-on3JdsHx-DyjN_z_5Z6HJoSQjJpA5o5_V6=rygMSbtQ@mail.gmail.com>
 <80c46a5c-7559-4763-bbf2-6c755a4b067c@arm.com> <CAGtprH_6DYk8POPy+sLc3RL0-5gcrTdPNcDWFTssOK5_U4B3Nw@mail.gmail.com>
 <23be7cdb-f094-4303-87ae-2fdfed80178b@arm.com>
In-Reply-To: <23be7cdb-f094-4303-87ae-2fdfed80178b@arm.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 15 Aug 2025 18:56:36 -0700
X-Gm-Features: Ac12FXy9Nf5jI_ZDaA0g-5pDhbHHzOx-JhcDUdLC5lWZaTciSyoinSl41owJHk4
Message-ID: <CAGtprH-TChZuLgb0sOU_14YGpCynw7sukLT0tP9sEzzd040dHw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250815_185650_048800_07A7BAA3 
X-CRM114-Status: GOOD (  46.13  )
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
> On 14/08/2025 17:26, Vishal Annapurve wrote:
> > On Wed, Aug 13, 2025 at 2:30=E2=80=AFAM Steven Price <steven.price@arm.=
com> wrote:
> >>
> >> On 01/08/2025 02:56, Vishal Annapurve wrote:
> >>> On Wed, Jun 11, 2025 at 3:59=E2=80=AFAM Steven Price <steven.price@ar=
m.com> wrote:
> >>>>
> >>>> +static int realm_create_protected_data_page(struct realm *realm,
> >>>> +                                           unsigned long ipa,
> >>>> +                                           kvm_pfn_t dst_pfn,
> >>>> +                                           kvm_pfn_t src_pfn,
> >>>> +                                           unsigned long flags)
> >>>> +{
> >>>> +       unsigned long rd =3D virt_to_phys(realm->rd);
> >>>> +       phys_addr_t dst_phys, src_phys;
> >>>> +       bool undelegate_failed =3D false;
> >>>> +       int ret, offset;
> >>>> +
> >>>> +       dst_phys =3D __pfn_to_phys(dst_pfn);
> >>>> +       src_phys =3D __pfn_to_phys(src_pfn);
> >>>> +
> >>>> +       for (offset =3D 0; offset < PAGE_SIZE; offset +=3D RMM_PAGE_=
SIZE) {
> >>>> +               ret =3D realm_create_protected_data_granule(realm,
> >>>> +                                                         ipa,
> >>>> +                                                         dst_phys,
> >>>> +                                                         src_phys,
> >>>> +                                                         flags);
> >>>> +               if (ret)
> >>>> +                       goto err;
> >>>> +
> >>>> +               ipa +=3D RMM_PAGE_SIZE;
> >>>> +               dst_phys +=3D RMM_PAGE_SIZE;
> >>>> +               src_phys +=3D RMM_PAGE_SIZE;
> >>>> +       }
> >>>> +
> >>>> +       return 0;
> >>>> +
> >>>> +err:
> >>>> +       if (ret =3D=3D -EIO) {
> >>>> +               /* current offset needs undelegating */
> >>>> +               if (WARN_ON(rmi_granule_undelegate(dst_phys)))
> >>>> +                       undelegate_failed =3D true;
> >>>> +       }
> >>>> +       while (offset > 0) {
> >>>> +               ipa -=3D RMM_PAGE_SIZE;
> >>>> +               offset -=3D RMM_PAGE_SIZE;
> >>>> +               dst_phys -=3D RMM_PAGE_SIZE;
> >>>> +
> >>>> +               rmi_data_destroy(rd, ipa, NULL, NULL);
> >>>> +
> >>>> +               if (WARN_ON(rmi_granule_undelegate(dst_phys)))
> >>>> +                       undelegate_failed =3D true;
> >>>> +       }
> >>>> +
> >>>> +       if (undelegate_failed) {
> >>>> +               /*
> >>>> +                * A granule could not be undelegated,
> >>>> +                * so the page has to be leaked
> >>>> +                */
> >>>> +               get_page(pfn_to_page(dst_pfn));
> >>>
> >>> I would like to point out that the support for in-place conversion
> >>> with guest_memfd using hugetlb pages [1] is under discussion.
> >>>
> >>> As part of the in-place conversion, the policy we are routing for is
> >>> to avoid any "refcounts" from KVM on folios supplied by guest_memfd a=
s
> >>> in-place conversion works by splitting and merging folios during
> >>> memory conversion as per discussion at LPC [2].
> >>
> >> CCA doesn't really support "in-place" conversions (see more detail
> >> below). But here the issue is that something has gone wrong and the RM=
M
> >> is refusing to give us a page back.
> >
> > I think I overloaded the term "in-place" conversion in this context. I
> > was talking about supporting "in-place" conversion without data
> > preservation. i.e. Host will use the same GPA->HPA range mapping even
> > after conversions, ensuring single backing for guest memory. This is
> > achieved by guest_memfd keeping track of private/shared ranges based
> > on userspace IOCTLs to change the tracking metadata.
>
> Yes, so for a destructive conversion this is fine. We can remove the
> page from the protected region and then place the same physical page in
> the shared region (or vice versa).
>
> Population is a special case because it's effectively non-destructive,
> and in that case we need both the reference data and the final
> (protected) physical page both available at same time.
>
> >>
> >>>
> >>> The best way to avoid further use of this page with huge page support
> >>> around would be either:
> >>> 1) Explicitly Inform guest_memfd of a particular pfn being in use by
> >>> KVM without relying on page refcounts or
> >>
> >> This might work, but note that the page is unavailable even after user
> >> space has freed the guest_memfd. So at some point the page needs to be
> >> marked so that it cannot be reallocated by the kernel. Holding a
> >> refcount isn't ideal but I haven't come up with a better idea.
> >>
> >> Note that this is a "should never happen" situation - the code will ha=
ve
> >> WARN()ed already - so this is just a best effort to allow the system t=
o
> >> limp on.
> >>
> >>> 2) Set the page as hwpoisoned. (Needs further discussion)
> >>
> >> This certainly sounds like a closer fit - but I'm not very familiar wi=
th
> >> hwpoison so I don't know how easy it would be to integrate with this.
> >>
> >
> > We had similar discussions with Intel specific SEPT management and the
> > conclusion there was to just not hold refcounts and give a warning on
> > such failures [1].
> >
> > [1] https://lore.kernel.org/kvm/20250807094241.4523-1-yan.y.zhao@intel.=
com/
>
> So these paths (should) all warn already. I guess the question is
> whether we want the platform to limp on in these situations or not.
> Certainly converting the WARNs to BUG_ON would be very easy, but the
> intention here was to give the user some chance to save their work
> before killing the system.
>
> Just WARNing might be ok, but if the kernel allocates the page for one
> of it's data structures then it's effectively a BUG_ON - there's no
> reasonable recovery. Reallocation into user space we can sort of handle,
> but only by killing the process.

Makes sense, this scenario is different from TDX as the host will run
into GPT faults if accessing memory owned by the realm world with no
good way to recover. Let's try to find the right complexity to take on
when handling errors for such rare scenarios, without relying on
refcounts as we start looking into huge page support.

>
> >>> This page refcounting strategy will have to be revisited depending on
> >>> which series lands first. That being said, it would be great if ARM
> >>> could review/verify if the series [1] works for backing CCA VMs with
> >>> huge pages.
> >>>
> >>> [1] https://lore.kernel.org/kvm/cover.1747264138.git.ackerleytng@goog=
le.com/
> >>> [2] https://lpc.events/event/18/contributions/1764/

