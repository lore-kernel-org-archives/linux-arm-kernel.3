Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A95EC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWTItkLdaNcYG8wfYq3YekuPNOywaSYtZm4aiNMSYwU=; b=I4507h+Q75XdhxdTgEkBG2ZWVr
	Gos09bXOcN3iEhgazq4n8HLq183WGNexodBDL5BvVb3NizZ/RAe5PaXHZxiS9i7IScnhZBQM8PRAh
	LZWcmk7DknNnzy8PSk2OJ4guE5Bu+WKdtWVmv2j0S5ooiHavMG6qZgxOLIiXGFvufNLZaYxLtMjON
	88Knp3llLNSRG7OZx9+PRCqdcUY1oiDxN1e2mQTfPTZdXilpvcCZUTIVzR2qlnlB4kBXxP/J62Ws7
	fqX/LE+n/hJ47snfJd99Xe3XrawIQxFOwmssLDMF8eJYXenBhHZ7GOaTg6lyHiaSkXbw8FRuy3K3q
	+fNEQ6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCbS-00000002Pdd-032n;
	Wed, 26 Aug 2026 12:19:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCbP-00000002PdG-3m5r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 12:19:37 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4765eec32e1so94203f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 05:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787746774; cv=none;
        d=google.com; s=arc-20260327;
        b=mrbYtvpjHYNlCUKvpxAutRX23xCQ1fKUiCvEIkPsT/zn9ItK2rLA8+6eeZ2bwHJ9s6
         doCRmBG4bta61dgvluNYfHr2ppQSMkNs0eBGhpjb4XVDvLOEPzHQrwjtAnd64LjFcKZ4
         E384sD0A/Vp1SUHiN53a7QEU/FW2hHsZ7HzZYSMNFavDi3NYipLW+IHiCQ5PdmwaPZlf
         7u0qvHkliC4iNu00pg8O+i3v2adzFuP7OVDs4G2Ef4HobIIloWTr7K3TjAj2A98rA1cI
         GiCbH84uWK+fTZOlpGXvRxGh7gMrkreUXhQitPsfzZQV8x0IRde3AigPVfG5Wxcom99N
         hh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HWTItkLdaNcYG8wfYq3YekuPNOywaSYtZm4aiNMSYwU=;
        fh=QP56PI+S5sbBbZoK8WlwCZvIJnrJXqTlyqC2Z5F40BM=;
        b=EPR/tWi7iVh9akHDiteHB/CrtNj962Zzbv8GoMjldwbsLgC4V1idRkzsV2WtzQRczC
         rruCyToBZ8b9s5FkRNp2phIQwjzPp1r0hjPMxgqEXx2AJeLrcKdbRCKGeCcRIgJpN+Cb
         qgj4T4HWM3SLHzvxis1IcaUuhn/qMiUUmAYChyknlmhZ9qRBUavgBDwBe1pahCpVCXMa
         H76HQ1s7OZkPqeubp0qs8+VJIJc/CIxLoFipnvOB6n8Es9Phml/1d+9kbObUbyrJzXYo
         Gblry+uK3O6pWQDIaHrH2oCXZ0Wyae2zPbmLofpXJzGq5n2syNQ8ldHs7Jz6nsL2knk3
         RKRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787746774; x=1788351574; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HWTItkLdaNcYG8wfYq3YekuPNOywaSYtZm4aiNMSYwU=;
        b=GRSLRnU7ZPj9RG+2tiMJKE3IMCDfjAXh+YozCUz7xmPkjY6BQ9lN+xIf2eiTEynfhi
         tx9xO3VmPtBKMpUizq2KgDJbYO9pPsGD14st/IGtIquKsA7olTqOtD6S0/+IRsdX64Y2
         fBHflZoW+7DThz3sz+NIPlWhbRsSB9/M/JuN0JwdJlQ9N2ZUfLUPrfKtq9FoMdIVXVEP
         00zU8v2gHxthPbxFZDrna7koFI8R8I3m/8OQOmTnUfi+1MXZhn2fa6yMwWlzQ+lSzCOV
         dzYwvBl+KRDvjNANVn76+ZKxReTp7f7tUwH49UBo/8gZmio7b/WxGpJ8PssWniBCoIZM
         yjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787746774; x=1788351574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWTItkLdaNcYG8wfYq3YekuPNOywaSYtZm4aiNMSYwU=;
        b=PlQ3HYbAzWUg+cFIscQdUvpFQ+Vxy9LkJRJ9KIa2zs2Du8hmRQ600s4x9JbqzqnanA
         5z4uCgK+bLHbyimKfe4fSYDSBv2yTtTw80AgLS+HMVb477F/cdo0GwJx8kXmXtdHVp5o
         ncAPatFwVU4HMprv9gFCi73yqYHPg8xYZ6bZiJgrMg163Q0SmLAb1WsRbW+2Imbmfamh
         96UuScD3YWqZFxHGL3XWQlijavj8g2f8uyhQiSbF/yPnH/BVzbYG6/SQmTRt3UqFNemu
         OcDYJ0e7qkzZk+9nYFhVk+oebFBIG5JNFoVJxYKMk5qNo+Y1ZjUnqe6KLaAkdycZbTyK
         R6xA==
X-Forwarded-Encrypted: i=1; AHgh+RqS9CRv4wc3A3yYjqLnx032NSzjS35Uhjn89KXb4Cx76IbbLs82grQnmi+NsOHkViE/W/AHXd456j9CNbIUrzrR@lists.infradead.org
X-Gm-Message-State: AFuF++kSObrveKkEpWoq1LIGDHlsRxxHaUZo/Pm7c9zodGPlq5pmrMjK
	9feZXVbaIhe2kVcOoPEP3WWQmcDaJCGfRu+83hspXTT0w/XOqVJWC38ZlbVLVCgn1SCw7IgZ6w/
	sLcFnIoH9VpCkt7u41la5SNp27zUOCKU=
X-Gm-Gg: AR+sD11SJrmIlkZvtKiQbIjC3kfFeiOP3RNTYeevYruBkZUj1AAIDxp1wX96KbTPoCH
	j/y32FTrFFDj0d9rOrn+NIFsiNJRIc4YvCzdccty6yXmJmb+fiWfhEtYiMpCS2SkaNt5ymqcWUK
	6zKQ1LQxya4wpEwdx8iHirjBfyXkhVC/eY9onKGJbCWsgbk2xvtUaavkRzFkNPZ4xUsPrW8Z2Lt
	6mndTSn1XJREYkA+beEdeLW/fCGg0SGz2IS5efuAWVKDnXGA8jzR6BszBxvIWgGJODSSH7FIIuU
	qhxnzapg7kv9N4X9xeos4q39+arm5Kj3QzBcAhxFmpjOLw5v2nKGU89M0Mk0AfNkxfd38qbjYdW
	AqrPuSRd0G3E2Mx4GQXhljhPM40Yfqn6POm/2Vz/T
X-Received: by 2002:a05:6000:4711:b0:47f:8e4c:8a4c with SMTP id
 ffacd0b85a97d-482e27403cfmr3428181f8f.4.1787746773692; Wed, 26 Aug 2026
 05:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
 <20260730090647.2401252-4-xueyuan.chen21@gmail.com> <2931f8a6-3780-4d6a-b19d-61cbbdad1a3a@intel.com>
 <1e04196a-7079-4a8d-a1b7-844e60d08728@kernel.org> <687afc72-5b6a-4138-8d33-fe5b6b7aef00@intel.com>
 <26e6340e-9551-4d18-b6d7-86cd400a5b88@kernel.org>
In-Reply-To: <26e6340e-9551-4d18-b6d7-86cd400a5b88@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Wed, 26 Aug 2026 20:19:22 +0800
X-Gm-Features: AcwNN1VU5Mbc85A7hVGohdOOFmdIUTao66TRdBDCw720fDhJHgSyn-6YsLEVidU
Message-ID: <CA+qSx6wyvivrp5P-vLSmXeEK8GCs00ThKLSq4C8q7bLLLXUPwA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] x86/mm: add set_direct_map_ro_noflush()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, akpm@linux-foundation.org, ljs@kernel.org, 
	usama.arif@linux.dev, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rppt@kernel.org, ryan.roberts@arm.com, ziy@nvidia.com, baohua@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_051935_990748_4806C055 
X-CRM114-Status: GOOD (  38.96  )
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

Hi David, Dave,

Thanks for the review and the discussion.

I'll switch the helper to a page-based signature and do the flush
internally:

    int set_direct_map_ro(struct page *page, unsigned long nr_pages)

I originally chose the address-based signature to prepare for the
interface conversion, but since that work stalled, I'll keep the
helper consistent with the other set_direct_map*() helpers.

The remaining comments will be addressed in v7, which
will be based on the latest mm-unstable.

Thanks,
Xueyuan

On Wed, Aug 26, 2026 at 1:31=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/25/26 18:57, Dave Hansen wrote:
> > On 8/25/26 09:43, David Hildenbrand (Arm) wrote:
> >>> int set_direct_map_invalid_noflush(struct page *page)
> >>> int set_direct_map_default_noflush(struct page *page)
> >>> int set_direct_map_valid_noflush(struct page *page, unsigned nr, ...
> >>> int set_direct_map_ro_noflush(const void *addr, unsigned long nr_page=
s)
> >>>
> >>> Which one of these things is not like the other, despite being named
> >>> just like them?
> >>>
> >> That's called out in the cover letter:
> >>
> >> "
> >> This series adds set_direct_map_ro_noflush() so mm code can make a
> >> direct-map range read-only, then uses it for the persistent huge zero
> >> folio. The helper is direct-map specific, takes an address-based range=
 as
> >> discussed for set_direct_map* helpers[2], and leaves TLB invalidation =
to
> >> the caller.
> >> "
> >
> > My concern is not so much what the function is doing or whether or how
> > the specific function is documented. It's more about whether the new
> > function is consistent across all functions with a similar purpose and
> > name. Also, if it is _not_ consistent there needs to be reasoning behin=
d
> > the inconsistency. I think that is missing here.
>
> Yes, the intend from the submitter was to prepare for the interface chang=
e to
> keep them consistent.
>
> I agree that for now it should just consume pages instead of an address a=
nd keep
> the interface consistent in this series.
>
> >
> > In this case, look at the call site:
> >
> >       addr =3D (unsigned long)folio_address(huge_zero_folio);
> >       set_direct_map_ro_noflush((void *)addr, HPAGE_PMD_NR);
> >
> > It *has* a folio. But it does a folio_address() and two casts to massag=
e
> > it into the type for set_direct_map_ro_noflush().
> >
> > If set_direct_map_ro_noflush() just took a 'struct page *', there would
> > be one folio=3D>page conversion, no casting, and complete consistency w=
ith
> > the other set_direct_map*() functions.
>
> Again, I agree with that, and the idea was to keep the interface consiste=
nt as
> it gets converted; it's just that the series that does the conversion sta=
lled.
>
> >
> > I'd also be OK with set_direct_map_ro_noflush() taking a folio, with th=
e
> > implication being that it might eventually make sense to convert the
> > other set_direct_map*() functions to folios. But page vs. folio
> > confusion is much less likely to cause bugs than a void* versus another
> > pointer.
> >
> > IOW, what I think I want is:
> >
> > int set_direct_map_ro_noflush(struct page *page, unsigned long nr_pages=
)
>
> Yes, or as will said
>
>         int set_direct_map_ro(struct page *page, unsigned long nr_pages)
>
> performing the flush internally.
>
> >
> > Or _maybe_:
> >
> > int set_direct_map_ro_noflush(struct folio *folio)
>
> I think I raised it before, but using folios on this interface is not a g=
ood
> idea. Primarily because
>
> a) Once we decouple struct folio from struct page this interface would on=
ly be
> available for folios and ...
>
> b) ... the huge zero page (currently huge zero folio) is on of the exampl=
es that
> *currently* is a folio but very likely won't be a folio in the future. On=
ly
> anon+pagecache that really need mapcounts and all that will be folios.
>
> c) I don't expect any further real folio users (IOW, anonymous folios or
> pagecache folios), but could imagine non-folio users.
>
> --
> Cheers,
>
> David

