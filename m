Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651B9E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcqApmbWKT3sk0GInf43OOPg0TCNmwV698Dx8iiW9/8=; b=CkcznW42rV/Kzhu64LEtQvffL5
	qXyWlUb4NQQ4Kr52+nuVkxeWEJlZiDmG7Hg+miRGnkDko54w7kHkhcsT4ykRkn+lPSLRhzvGG2hWN
	5xKQIVq1VqHsmGRwilksKFvAAzrdRBUMuI+w/fIieo4XHL5uNav58uxC96xPyKrvLT2Kewqm4i7I0
	f3xTbnrCWdbaRNXGCsTn+P2QWxGTQZsHSIuwk8IFgo+ayvyyl5Pyn5byr/PE2StKDinl3P+RXruPE
	pkZ/g5E8F7/Ku0v7WEhCHGc0XHg8+uQ3qQgOCX0tzNeRRMx5s0cdByBhJxinIQDOVSvDifnxQ2kBr
	0AzBsOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsfJ-00000002QZv-2b6G;
	Mon, 06 Jan 2025 19:21:29 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsZk-00000002PRD-3sF5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 19:15:46 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-5189a440a65so8582058e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 11:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736190943; x=1736795743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcqApmbWKT3sk0GInf43OOPg0TCNmwV698Dx8iiW9/8=;
        b=jL4wgs7NSbT3uSDqDlZCZjddkzPq1sP1TAkFIlEzSyiYbzMjtx1p9qNYIJEgh1u7oS
         uNsN/NUdEmjTo7lCnrHa3AscIeNmWk/oSO023wZ7pNIFQuAin5flrVycMQ9D1dvTHjE2
         LYsq9xKX33rTt+uEXSUd0iRYBH08zTMSY6E6OIbbk4xPGqJVfygnKzGGFyCHJSMibDZm
         kEFIddNnmubYUK7CydHVSKZPUoobC7PvciSVQz2E2gMCNwmThIx9vQdAKziEJIHSoERS
         GPz+SZSjroDfFZroT1iks0ikx5ygoosVT2HLpvMdAcZZTCjKBJqbEI6oXt3/UNR5Jnr9
         ubCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736190943; x=1736795743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcqApmbWKT3sk0GInf43OOPg0TCNmwV698Dx8iiW9/8=;
        b=Ki33TsBnluigz8C3P9T5gU4eDJrGpcYpJ6JbugGChLCh70ZjAxUXnT5wXMnUvRAy9L
         fRSv8EAzqcub33VeaWiD2Wr4L1YtE5KtNRCxjP1BfQFEomvm54pwAt0/8MicyX92Qg44
         m1pkPwgX8toDO6PF1J8OjoptP8KR1pRgcEGaqjhT9EzmgHsP94H8i6lscbXK4F+LwYbr
         20cWtm2WPxxp/la1BIUdYw4cPmgCzDseH36IuGUcwPqCCUBkzdO/YPRea+OsqNKpnF0w
         IPfrRnr5Xy/f75FZjnYchpK6mZVNChPDnZhoM8SGQpkN67Xoi4mt4MTMesn/KkAsxUKj
         t23g==
X-Forwarded-Encrypted: i=1; AJvYcCWBtGDC/vna1PMsyvcDNycoLO0BTyF1qFKxJO2UJg6H4Qv1GIaHq9O8Nmrbefhb/XFkJ9PVa7jCnWXHLe4ZZVcf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzs00DHxsc8kKQb18Y/CxRjQMhruIK0XUt7bji3DUm1ZxSPBdA
	WHnNsiIx9ZahXpy1VfdCn+OUWskGBmj9PJBQ2hA6xvK0Dnxkz+gVYy4YmQQaN7GTkKC9Df8tH8J
	ucPiZwD260Rrk4XYQ15UWiZk2h/M=
X-Gm-Gg: ASbGncshNUnA0/VT2J13Z12ekA33ZnUBvhR3dKuepOVK9dhP8EvqVFFDkGmh3fqg9AQ
	uWAZo47neGfDwwqcwe9+kYLZxLCvvRrnQ61AK1vH5M34oNPHMji2YSQaNte1fediHStRVlZOt
X-Google-Smtp-Source: AGHT+IGI4L9aG9KQIYmcNGvadzGYb122Qid6REXJuL0qufX+aQeAZdnpQA5Rs3oza+4oIfLW73+wS3vWEJ8BQ270kb4=
X-Received: by 2002:a05:6122:1992:b0:516:2d4e:448a with SMTP id
 71dfb90a1353d-51b75c3a30cmr47151828e0c.3.1736190943561; Mon, 06 Jan 2025
 11:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20250106031711.82855-1-21cnbao@gmail.com> <8dafd991-9d2a-48f2-b35d-5c2049992c84@lucifer.local>
In-Reply-To: <8dafd991-9d2a-48f2-b35d-5c2049992c84@lucifer.local>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 7 Jan 2025 08:15:32 +1300
Message-ID: <CAGsJ_4wNzfwWOL33LHK+omnCdO9QB4_jTes5gVHQXtJ8=G5D_w@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm: batched unmap lazyfree large folios during reclamation
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, ioworker0@gmail.com, david@redhat.com, 
	ryan.roberts@arm.com, zhengtangquan@oppo.com, ying.huang@intel.com, 
	kasong@tencent.com, chrisl@kernel.org, baolin.wang@linux.alibaba.com, 
	Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_111544_962460_4650E96E 
X-CRM114-Status: GOOD (  20.20  )
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

On Tue, Jan 7, 2025 at 6:28=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Mon, Jan 06, 2025 at 04:17:08PM +1300, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > Commit 735ecdfaf4e80 ("mm/vmscan: avoid splitting lazyfree THP during
> > shrink_folio_list()") prevents the splitting of MADV_FREE'd THP in madv=
ise.c.
> > However, those folios are still added to the deferred_split list in
> > try_to_unmap_one() because we are unmapping PTEs and removing rmap entr=
ies
> > one by one. This approach is not only slow but also increases the risk =
of a
> > race condition where lazyfree folios are incorrectly set back to swapba=
cked,
> > as a speculative folio_get may occur in the shrinker's callback.
> >
> > This patchset addresses the issue by only marking truly dirty folios as
> > swapbacked as suggested by David and shifting to batched unmapping of t=
he
> > entire folio in  try_to_unmap_one(). As a result, we've observed
> > deferred_split dropping to  zero and significant performance improvemen=
ts
> > in memory reclamation.
>
> You've not provided any numbers? What performance improvements? Under wha=
t
> workloads?

The number can be found in patch 3/3 at the following link:
https://lore.kernel.org/linux-mm/20250106031711.82855-4-21cnbao@gmail.com/

Reclaiming lazyfree mTHP will now be significantly faster.
Additionally, this patch
addresses the issue with the misleading split_deferred counter. The
split_deferred
counter was intended to track operations like unaligned unmap/madvise, but =
in
practice, the majority of split_deferred cases result from memory reclamati=
on
of aligned lazyfree mTHP. This discrepancy rendered the split_deferred
counter highly
misleading.

>
> You're adding a bunch of complexity here, so I feel like we need to see
> some numbers, background, etc.?

I agree that I can provide more details in v2. In the meantime, you can
find additional background information here:

https://lore.kernel.org/linux-mm/CAGsJ_4wOL6TLa3FKQASdrGfuqqu=3D14EuxAtpKmn=
ebiGLm0dnfA@mail.gmail.com/

>
> Thanks!
>
> >
> > Barry Song (3):
> >   mm: set folio swapbacked iff folios are dirty in try_to_unmap_one
> >   mm: Support tlbbatch flush for a range of PTEs
> >   mm: Support batched unmap for lazyfree large folios during reclamatio=
n
> >
> >  arch/arm64/include/asm/tlbflush.h |  26 ++++----
> >  arch/arm64/mm/contpte.c           |   2 +-
> >  arch/x86/include/asm/tlbflush.h   |   3 +-
> >  mm/rmap.c                         | 103 ++++++++++++++++++++----------
> >  4 files changed, 85 insertions(+), 49 deletions(-)
> >
> > --
> > 2.39.3 (Apple Git-146)

Thanks
Barry

