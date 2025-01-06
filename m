Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB416E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 20:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiqohGVrJhuzrDGTEf8iJUOT0kiba9U3wDyHV7/Xg5E=; b=XlNzumVcWc4wcd2Beulhy/6vIZ
	+6DbVFkEskE+nx7VP3Sj2QieVJ7WkHeuQxH2DTZEHD7Us7SHn7GcaRacLfdt5yjTQhenSBaNwET3b
	m6SNn1pNIvvMwGkLbgm3nbT7SYnymfTOqletsiPZAgiumoI/oL71COaOn7ZpiUTEEMSA/6n2kF+L0
	sny8cqpJPC/D9oQHY5wtQjiYwzdGuhm6Hc/DRjPVyrgygGLOSxhOf+l5Ra3d2AAMImfioKrIwlTtg
	u8yNHCySKQ1doO1FWEqGlHnOstC/sTtQ1EL6j+7tMb0ZWLAz4+nqfcYd5BVbVDtF/bHt69bzQMNMH
	jNxxQVTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuCI-00000002fUi-0DVU;
	Mon, 06 Jan 2025 20:59:38 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu9G-00000002esE-35qA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 20:56:31 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4afd68271b6so3625095137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 12:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736196989; x=1736801789; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiqohGVrJhuzrDGTEf8iJUOT0kiba9U3wDyHV7/Xg5E=;
        b=ORu6A5Nxjt1DJBEvHduKk3yqtqM6SaUfTYEpBdg8BrNIKw0fchSGLB398xZIlkTnsK
         cl4KnBKkpMUGWq3Ah9P88RqE8hSDXE0i2d6KyrS5Z41Mikyb5wqKZa4fxchpxMOuCRTG
         ixAvxET07hEAjipvACZez4Ubp+kEqKCVA7tNGwmeyn4PKTUQhfl7z5prTM0eIvB5N0w8
         FWPWVNohrDqvfd3TmJVe+63qTAUcos3vwcBfXCAqcmOHhqjVDQWmqH9p4bDfYDV7fbhz
         AJPps9xeXdiecjNO0aLLDKAKLC3OCE3Dql9NvFxoXmMUmJXeRm7/a1fCQiyNKkQOa0Q6
         jYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196989; x=1736801789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiqohGVrJhuzrDGTEf8iJUOT0kiba9U3wDyHV7/Xg5E=;
        b=kDg99tARVS/b/AlIaPOfV5eASBVtiqFaw7z/pnQaylNNCrOfEAWREDuaTvnzOL+bjy
         oj/kAodN8xbAMTVhbZIJmTvSPKWt1hh30QUDVS+vZKw87sb/mYJRaBiPPAuC0dmGgQgG
         pFp04YcijDVKASFnvEifCi+iC/tycp1Oi6WHR7oIVZxew9fiPYjnQAWe6C3dxRCKQQJc
         YclYzrac7t4n5NkYesahoOQfs/ZsxcY2o8PSApkKCBgW2vv4lSwJwnNghPKiVxMYdnJR
         WhjHpkaDPYDjKQIViG4L7Ncl4u90Epw/8FSO0ZqBtJyfjsIR+kV27DIdf9uuzipxLKzI
         wf6g==
X-Forwarded-Encrypted: i=1; AJvYcCVNnaUiLB45DZJsX7BmEK0yfZZyG8yKO6dn2gCNXgu8dRiWFYEVT9614o0nOTzPPcl9jfjFj70eUefLaZ0dnldO@lists.infradead.org
X-Gm-Message-State: AOJu0YzRrUw+IZXOtHPuu/bPHgsuyYoIRpwYHm9YilSyLaL2rnHLS/I/
	AqFO0UjpKhR51xgkGUzEM7MD1AB0l25ZgqCo2HWzDHYRsFC453jdSweoJYEhOyZQMvlIdE6RMfv
	HH2Fyc9hxT+QCZSOjKJaHkDFrnLo=
X-Gm-Gg: ASbGncs3ZwO/hKpSDIZjt01Ea0xJI73bke6f5XvrBis7nqDCsRRxapjsCm4JkXx0+1r
	/5MpsY4GBDpxeq7IWWGiDKBtz+Y7zfURCJMOYFnHVJos+Wu0zqxhCe6d0G5Zc2Vvtu2TtZdHr
X-Google-Smtp-Source: AGHT+IGchQ0Bce7X1wuXttAt3aVwQiwbDDT1I62efkCM90IBmP4m5AWOgNoNmGlRI31N78EGqSjoMi4R6FPX4H90+PU=
X-Received: by 2002:a05:6102:41a3:b0:4b2:7446:fc18 with SMTP id
 ada2fe7eead31-4b2cc4597f3mr48692637137.17.1736196989356; Mon, 06 Jan 2025
 12:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20250106031711.82855-1-21cnbao@gmail.com> <20250106031711.82855-2-21cnbao@gmail.com>
 <e68b8279-fe16-462a-bf99-6b4d90e96904@linux.alibaba.com> <CAGsJ_4wMuDYxuEMcA0jYvekt26Uvz86kjWbo0nz-ZZzuiyEOQQ@mail.gmail.com>
 <b65e145b-a754-41bb-8322-f93c24f6b7d1@linux.alibaba.com> <CAK1f24ksqXUKquPUu3hL3qZha6fOSz2xjRcy83CDg_rdOcZB6g@mail.gmail.com>
 <CAGsJ_4zxdPREb-jmjrjNWySiVwPLbXfj5pG541kYyXXPD4_vBg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zxdPREb-jmjrjNWySiVwPLbXfj5pG541kYyXXPD4_vBg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 7 Jan 2025 09:56:18 +1300
Message-ID: <CAGsJ_4xT3M_PKAekAertMqJAafr6BqKnkjkn3gbs5o2LeRn3gQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm: set folio swapbacked iff folios are dirty in try_to_unmap_one
To: Lance Yang <ioworker0@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, ryan.roberts@arm.com, 
	zhengtangquan@oppo.com, kasong@tencent.com, chrisl@kernel.org, 
	Barry Song <v-songbaohua@oppo.com>, Ying Huang <ying.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_125630_777514_0857076B 
X-CRM114-Status: GOOD (  31.22  )
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

On Tue, Jan 7, 2025 at 9:52=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrote=
:
>
> On Tue, Jan 7, 2025 at 3:40=E2=80=AFAM Lance Yang <ioworker0@gmail.com> w=
rote:
> >
> > On Mon, Jan 6, 2025 at 5:34=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> > >
> > >
> > >
> > > On 2025/1/6 17:03, Barry Song wrote:
> > > > On Mon, Jan 6, 2025 at 7:40=E2=80=AFPM Baolin Wang
> > > > <baolin.wang@linux.alibaba.com> wrote:
> > > >>
> > > >>
> > > >>
> > > >> On 2025/1/6 11:17, Barry Song wrote:
> > > >>> From: Barry Song <v-songbaohua@oppo.com>
> > > >>>
> > > >>> The refcount may be temporarily or long-term increased, but this =
does
> > > >>> not change the fundamental nature of the folio already being lazy=
-
> > > >>> freed. Therefore, we only reset 'swapbacked' when we are certain =
the
> > > >>> folio is dirty and not droppable.
> > > >>>
> > > >>> Suggested-by: David Hildenbrand <david@redhat.com>
> > > >>> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > >>
> > > >> The changes look good to me. While we are at it, could you also ch=
ange
> > > >> the __discard_anon_folio_pmd_locked() to follow the same strategy =
for
> > > >> lazy-freed PMD-sized folio?
> > > >
> > > > it seems you mean __discard_anon_folio_pmd_locked() is lacking
> > > > folio_set_swapbacked(folio) for dirty pmd-mapped folios?
> >
> > Good catch!
> >
> > Hmm... I don't recall why we don't call folio_set_swapbacked for dirty
> > THPs in __discard_anon_folio_pmd_locked() - possibly to align with
> > previous behavior ;)
> >
> > If a dirty PMD-mapped THP cannot be discarded, we just split it and
> > restart the page walk to process the PTE-mapped THP. After that, we
> > will only mark each folio within the THP as swap-backed individually.
> >
> > It seems like we could cut the work by calling folio_set_swapbacked()
> > for dirty THPs directly in __discard_anon_folio_pmd_locked(), skipping
> > the restart of the page walk after splitting the THP, IMHO ;)
>
> Yes, the existing code for PMD-mapped THPs seems quite inefficient. It sp=
lits
> the PMD-mapped THP into smaller folios, marks each split PTE as dirty, an=
d

Apologies for the typo, I meant splitting a PMD-mapped THP into a PTE-mappe=
d
THP.

> then iterates over each PTE. I=E2=80=99m not sure why it=E2=80=99s design=
ed this way=E2=80=94could
> there be a specific reason behind this approach?
>
> However, it does appear to handle folio_set_swapbacked() correctly, as on=
ly
> a dirty PMD will result in dirty PTEs being generated in
> __split_huge_pmd_locked():
>
>         } else {
>                 pte_t entry;
>
>                 entry =3D mk_pte(page, READ_ONCE(vma->vm_page_prot));
>                 if (write)
>                         entry =3D pte_mkwrite(entry, vma);
>
>                 if (!young)
>                         entry =3D pte_mkold(entry);
>
>                 /* NOTE: this may set soft-dirty too on some archs */
>                 if (dirty)
>                         entry =3D pte_mkdirty(entry);
>
>                 if (soft_dirty)
>                         entry =3D pte_mksoft_dirty(entry);
>
>                 if (uffd_wp)
>                         entry =3D pte_mkuffd_wp(entry);
>
>                 for (i =3D 0; i < HPAGE_PMD_NR; i++)
>                         VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>
>                 set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
>         }
>
>
>
> >
> > Thanks,
> > Lance
> >
> >
> > > > and it seems !(vma->vm_flags & VM_DROPPABLE) is also not
> > > > handled properly?
> >
> >
> > >
> > > Right.
>
> Thanks
> Barry

