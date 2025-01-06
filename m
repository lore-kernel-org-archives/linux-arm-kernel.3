Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC60E77199
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 20:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2Rfd2Cv9eccj61P+e/MPmJwn2zXrpKlX2wizShaDUM=; b=4gsN1ikcqJxzlDbj6V+1B5EKMi
	2j1FkMhmCErbsRWix/KJTRGdiQqItAx0BSCkeYfDZ/Kt+y2I7TGl9H57JU2ubj8lk8lVsOWvYPhUF
	8pEeyoGs26CtZ4EP2xxXFWUItLvbCyIEOeiV5pZiJHVQBTy8VYLx/hpKlJhk9C6Ms39z3A4ALkX6z
	hPx1w78axCckv2wZ4NQZuM30CE+stbrj6oDkV16lfBL6Cif1kVCJ4cvOZndnq62JDpSOk8WqCDcrK
	7hTHucC85WwQkZZAcgQlnIGvydzvnLaMtltBuEMlGYPsNxeeqC1g6Y7akEorkVniQ9hL4oKZyhGNr
	36O/Wvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu8k-00000002ejp-15pR;
	Mon, 06 Jan 2025 20:55:58 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu5Z-00000002e5Y-26Ve
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 20:52:42 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-51640f7bbd3so4548722e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 12:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736196760; x=1736801560; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2Rfd2Cv9eccj61P+e/MPmJwn2zXrpKlX2wizShaDUM=;
        b=F/yo+Ip+yjtHR2OxUUSQ1KjvgLKDhIqxo1fzimvpCJVr+6UxkluK1Y0lkb1TjHlUL5
         4n6BvXiFLrayZnKm1U2rxl3YxYok4ixmmUPTBFHiQnRCOY5R2EI5WEnV9TUQ49K1Ms/c
         mTVH/nVs23NoKH8F6UB7LOj9i1VR62F0w97yfiaBwfTTdq4Hse6HbS4oQfRoFFS5O1m9
         Y08MAtnA6QY0+f/JaM5tRW8O7Rfe06wwWwJsVn/bcnlzWTB3HyIwwzDHVwW707FfacDm
         e35ONYu+GI83QyyxLY0IX1xuxkm3p10F/OnoO9kP92vJtpqJKz4Y63FvVCjbaiVTHPy0
         TFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196760; x=1736801560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2Rfd2Cv9eccj61P+e/MPmJwn2zXrpKlX2wizShaDUM=;
        b=by/Npjgzhxwaqvvlwl6//yctJtnzHCoYy4yLdVEf9VButjEOGzRUBlZ4so5CPx1DIV
         Axjm9hF1CXMrjsPlNQZ08d8UPqef6juS2oDNAeo5cmpRTAHcD5N83dmi6F+5b4Y9TkuE
         xp63bRrgxLFagMhVW9ugU5dkkTd+wJcaXKHx+XORGHlvLcN2Y/iiDHFT7tAELts3bvMK
         Uk+3EoX7NiGs3hy39L0AIEtkCvPE7YbnTI0T61+QinUvJzrhaIlRSWfs6jaaNjfl3lIM
         tsK0lBJDsLj0zi5yARMXZtGGIErlSds+IXBI9QkrDUiw8Yw+89GJRmeuJ9yBUO72mwQT
         0Vsw==
X-Forwarded-Encrypted: i=1; AJvYcCUhqtv660BgemnuRPXgB37/Oc7jVqasfgAuO2Dmby3UaIfUU4Mqwcd1sDA+TYh8LucdhDh3becc3ZTaIW2ALIC/@lists.infradead.org
X-Gm-Message-State: AOJu0YyYVeG13M0z/0yQ75yRprAgTI/kMab4YZhh4CfNsL+QBEtHqO3z
	gxJthFPhtOujhPUkk9hqvyH3a5RaQF3PH6kpEQSQ6vLUnDRM9x95S0RiS9IcfvcnRN9ecxUTzSJ
	k7GKDBMmdq36bjjPqQKy1fV11yBGhtKZSmjc=
X-Gm-Gg: ASbGncvRcWKAQPaokLQ/J6vaPoZm2dhNW4dIWQ0RbnqW7fi1rNWZXvkoGE6PADsOLl1
	PjwpLdmrRIm8Uok+P26i2iCtqdDOwqvA9y5DwPa/Xp+3VSvL3h+CORQzOBoZc+gROrFHjm+18
X-Google-Smtp-Source: AGHT+IFLiLwyTBvPtX7l0P7EQ8rMXvaqE9UNBWkLkHbTzS/r3LHIOdCrvyM+xTKCfcE6uvzj056mhsUlEnnOYlPNiIk=
X-Received: by 2002:a05:6122:8c07:b0:516:157c:a72e with SMTP id
 71dfb90a1353d-51b75c308b3mr40676401e0c.3.1736196760165; Mon, 06 Jan 2025
 12:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20250106031711.82855-1-21cnbao@gmail.com> <20250106031711.82855-2-21cnbao@gmail.com>
 <e68b8279-fe16-462a-bf99-6b4d90e96904@linux.alibaba.com> <CAGsJ_4wMuDYxuEMcA0jYvekt26Uvz86kjWbo0nz-ZZzuiyEOQQ@mail.gmail.com>
 <b65e145b-a754-41bb-8322-f93c24f6b7d1@linux.alibaba.com> <CAK1f24ksqXUKquPUu3hL3qZha6fOSz2xjRcy83CDg_rdOcZB6g@mail.gmail.com>
In-Reply-To: <CAK1f24ksqXUKquPUu3hL3qZha6fOSz2xjRcy83CDg_rdOcZB6g@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 7 Jan 2025 09:52:29 +1300
Message-ID: <CAGsJ_4zxdPREb-jmjrjNWySiVwPLbXfj5pG541kYyXXPD4_vBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm: set folio swapbacked iff folios are dirty in try_to_unmap_one
To: Lance Yang <ioworker0@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, ryan.roberts@arm.com, 
	zhengtangquan@oppo.com, ying.huang@intel.com, kasong@tencent.com, 
	chrisl@kernel.org, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_125241_539919_2D0E99B4 
X-CRM114-Status: GOOD (  24.20  )
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

On Tue, Jan 7, 2025 at 3:40=E2=80=AFAM Lance Yang <ioworker0@gmail.com> wro=
te:
>
> On Mon, Jan 6, 2025 at 5:34=E2=80=AFPM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
> >
> >
> >
> > On 2025/1/6 17:03, Barry Song wrote:
> > > On Mon, Jan 6, 2025 at 7:40=E2=80=AFPM Baolin Wang
> > > <baolin.wang@linux.alibaba.com> wrote:
> > >>
> > >>
> > >>
> > >> On 2025/1/6 11:17, Barry Song wrote:
> > >>> From: Barry Song <v-songbaohua@oppo.com>
> > >>>
> > >>> The refcount may be temporarily or long-term increased, but this do=
es
> > >>> not change the fundamental nature of the folio already being lazy-
> > >>> freed. Therefore, we only reset 'swapbacked' when we are certain th=
e
> > >>> folio is dirty and not droppable.
> > >>>
> > >>> Suggested-by: David Hildenbrand <david@redhat.com>
> > >>> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > >>
> > >> The changes look good to me. While we are at it, could you also chan=
ge
> > >> the __discard_anon_folio_pmd_locked() to follow the same strategy fo=
r
> > >> lazy-freed PMD-sized folio?
> > >
> > > it seems you mean __discard_anon_folio_pmd_locked() is lacking
> > > folio_set_swapbacked(folio) for dirty pmd-mapped folios?
>
> Good catch!
>
> Hmm... I don't recall why we don't call folio_set_swapbacked for dirty
> THPs in __discard_anon_folio_pmd_locked() - possibly to align with
> previous behavior ;)
>
> If a dirty PMD-mapped THP cannot be discarded, we just split it and
> restart the page walk to process the PTE-mapped THP. After that, we
> will only mark each folio within the THP as swap-backed individually.
>
> It seems like we could cut the work by calling folio_set_swapbacked()
> for dirty THPs directly in __discard_anon_folio_pmd_locked(), skipping
> the restart of the page walk after splitting the THP, IMHO ;)

Yes, the existing code for PMD-mapped THPs seems quite inefficient. It spli=
ts
the PMD-mapped THP into smaller folios, marks each split PTE as dirty, and
then iterates over each PTE. I=E2=80=99m not sure why it=E2=80=99s designed=
 this way=E2=80=94could
there be a specific reason behind this approach?

However, it does appear to handle folio_set_swapbacked() correctly, as only
a dirty PMD will result in dirty PTEs being generated in
__split_huge_pmd_locked():

        } else {
                pte_t entry;

                entry =3D mk_pte(page, READ_ONCE(vma->vm_page_prot));
                if (write)
                        entry =3D pte_mkwrite(entry, vma);

                if (!young)
                        entry =3D pte_mkold(entry);

                /* NOTE: this may set soft-dirty too on some archs */
                if (dirty)
                        entry =3D pte_mkdirty(entry);

                if (soft_dirty)
                        entry =3D pte_mksoft_dirty(entry);

                if (uffd_wp)
                        entry =3D pte_mkuffd_wp(entry);

                for (i =3D 0; i < HPAGE_PMD_NR; i++)
                        VM_WARN_ON(!pte_none(ptep_get(pte + i)));

                set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
        }



>
> Thanks,
> Lance
>
>
> > > and it seems !(vma->vm_flags & VM_DROPPABLE) is also not
> > > handled properly?
>
>
> >
> > Right.

Thanks
Barry

