Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B0BC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 07:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VC0GWEM0TOvbpRj503Lx4FHEsT4eElQEaARZ2JDT8L8=; b=bpH2j68CRN4/eJ1j6mCjWR3sDN
	mG8lWJ5XUHF+XIbNgwxsg6AjhKgR2qxolRnJTvcgd//Ax0ZmXwBNq7iYDfV0NU/FEQyIzc8NhNmwW
	tEF8UOJy0F8kD1HmLwrSOnsyVR66EaJlUC3Hrhmfn5qv6eqk8DHSmsfbV8EWgUWPJGkJjPNMCkEBc
	FPALr4+9hNOPqvwUvutB4HhtfDL5Cnpgsps1VrGcl72GrudyYULYSWVki/sQwRZox+1tU4YuHEyTQ
	ly6jLnWqBnitJfOi6zrJK9asKWuB63oha+7fk4Z92/oYNvgypOur448UUzJyAARlS0cD7go8vU7oA
	uOnMj6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3VA5-0000000FZys-1sPu;
	Sat, 12 Apr 2025 07:20:21 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3V8H-0000000FZqE-2OnR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 07:18:30 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so1059718e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 00:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744442308; x=1745047108; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VC0GWEM0TOvbpRj503Lx4FHEsT4eElQEaARZ2JDT8L8=;
        b=PjdS63vCvhNQuAI5HaiJQUyqpW9sfSlQhpddtGYUmjCuaCkcj2fpWJjzY5QM6CH2FP
         /EUSv5aCnNkJT6q9U4a/WMrFNChjzx6zHxEX/9D14tjRTWPTo+XQNjCxFTFbaJoOm9bD
         l0N9Mp1Ryvw5xCguE84vHh+FuU7N7j7Nqh9B18h6KLFKfmnNUjFi6P7GCn2vrfto3NzP
         s0i9MF9jH5Yu+JuMpEdakvzxc/vuFXNFuljTNEne0MNg12DAuRrVLA1fJSR4Z18GE5WW
         3rMIUbup9jsiCGuQ/wQeOapYuPYKL9jMNAH/cvvnEHPh7LzvRRcCTs7RNHHkQi8GJoxx
         cQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744442308; x=1745047108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC0GWEM0TOvbpRj503Lx4FHEsT4eElQEaARZ2JDT8L8=;
        b=QYxXWUtpV0Uz2a6rkt5I3o1lwEoc7n4NkHKMUYxYRKYHRHduhkSGhezut9M/yYhMCa
         zg38+fcnMNRHmD6VlS7D7OAZrOjfNKS69+g+WUzZl7spple35FLjkXOdw9wFaFGThuw8
         RFsuXpyu9AOYB/GY+QJ0i6bb2f+GMsAmoSRhoJRn4U2tWMIFa+KASqqN4NN2YbdhrZPH
         GIn1MFpTUSLBfUnPnUFK36GMpY4MzYJFS286xzD9QtM+/CMOV+1dvwbVup2Re/FxJA/J
         xqtxOvoB3oeR3VTGu0rwx/jjCslRy4W80LbdQp1wbRvS48GRuEMBQ57fY1NZ/vNgvQL3
         t0cg==
X-Forwarded-Encrypted: i=1; AJvYcCW312pdxkkU5RNZZX2VqXT+E99YLWlWkfmcgCpwVmIlkTHhcRq2gPFbT3XV5L7r90eB4SiU/AnPtoRGT0OVEgds@lists.infradead.org
X-Gm-Message-State: AOJu0YzvycQO8WsRWY65XWP7i8rMPL01E7CLIfECV6G/3ld5ifLbfJa7
	Z0Lpbo+1pPeIcOiKCnqOGV5e7ago6EKnF4kll4a3dGHH6F2OAxxIo5xXNlSAXpp7/f1ZvKxBIrj
	9KYgw3YkpwaqImMaAsyQnC2Zc3ns=
X-Gm-Gg: ASbGncs5+7oJ517pQ4nX18Bib7Zf//D4q1sYmiOjs4/cDRevWFWpHUagqcIYJTHRjzN
	sUmrgixEkmk0N3QZlxm21b47/kThu4eCWkM5tBZhWHCoa5YUupLqTHWoiZJ+E394v+IdlFrKNyr
	B3fr/BXWh6W5o1X/eBW9pbBw==
X-Google-Smtp-Source: AGHT+IGLwhjL9UXOMlhWpGMgmfF7c6ZHFDY4fNpjB3r/u10XhaPNH3+4egF0XulPfge8tMvLS6WHPop4Po6A7QGLagI=
X-Received: by 2002:a05:6122:829d:b0:523:dd87:fe86 with SMTP id
 71dfb90a1353d-527c3587e86mr4217419e0c.6.1744442308131; Sat, 12 Apr 2025
 00:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250407092243.2207837-1-xavier_qy@163.com> <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
 <20250411130309.7894f204@pumpkin>
In-Reply-To: <20250411130309.7894f204@pumpkin>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 12 Apr 2025 15:18:16 +0800
X-Gm-Features: ATxdqUFAFVllearhPjdozPth5ZeaWQwWAltFxkp3eDui7FtSHRmQqUd3TJv7524
Message-ID: <CAGsJ_4xy=62Gtb2W4P0Fss4XZiuJvQikgO6MXtg4TB_2FX7haA@mail.gmail.com>
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
To: David Laight <david.laight.linux@gmail.com>
Cc: Xavier <xavier_qy@163.com>, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, ryan.roberts@arm.com, ioworker0@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_001829_610159_557AE618 
X-CRM114-Status: GOOD (  26.57  )
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

On Fri, Apr 11, 2025 at 8:03=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 11 Apr 2025 09:25:39 +1200
> Barry Song <21cnbao@gmail.com> wrote:
>
> > On Mon, Apr 7, 2025 at 9:23=E2=80=AFPM Xavier <xavier_qy@163.com> wrote=
:
> > >
> > > This commit optimizes the contpte_ptep_get function by adding early
> > >  termination logic. It checks if the dirty and young bits of orig_pte
> > >  are already set and skips redundant bit-setting operations during
> > >  the loop. This reduces unnecessary iterations and improves performan=
ce.
> > >
> > > Signed-off-by: Xavier <xavier_qy@163.com>
> > > ---
> > >  arch/arm64/mm/contpte.c | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > > index bcac4f55f9c1..ca15d8f52d14 100644
> > > --- a/arch/arm64/mm/contpte.c
> > > +++ b/arch/arm64/mm/contpte.c
> > > @@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_=
pte)
> > >
> > >         pte_t pte;
> > >         int i;
> > > +       bool dirty =3D false;
> > > +       bool young =3D false;
> > >
> > >         ptep =3D contpte_align_down(ptep);
> > >
> > >         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> > >                 pte =3D __ptep_get(ptep);
> > >
> > > -               if (pte_dirty(pte))
> > > +               if (!dirty && pte_dirty(pte)) {
> > > +                       dirty =3D true;
> > >                         orig_pte =3D pte_mkdirty(orig_pte);
> > > +               }
> > >
> > > -               if (pte_young(pte))
> > > +               if (!young && pte_young(pte)) {
> > > +                       young =3D true;
> > >                         orig_pte =3D pte_mkyoung(orig_pte);
> > > +               }
> > > +
> > > +               if (dirty && young)
> > > +                       break;
> >
> > This kind of optimization is always tricky. Dev previously tried a simi=
lar
> > approach to reduce the loop count, but it ended up causing performance
> > degradation:
> > https://lore.kernel.org/linux-mm/20240913091902.1160520-1-dev.jain@arm.=
com/
> >
> > So we may need actual data to validate this idea.
>
> You might win with 3 loops.
> The first looks for both 'dirty' and 'young'.
> If it finds only one it jumps to a different loop that continues
> the search but only looks for the other flag.

However, there's no concrete evidence that this loop is a hot path. It migh=
t
save a few instructions when the first PTE is both young and dirty, but in
many cases, none of the PTEs are either. Previous profiling indicates that
the actual hot path lies in the rmap walk to locate the page table entries
during folio_reference in the reclamation path.

I suspect the code you're optimizing isn't actually part of a hot path at a=
ll.

>
>         David
>
> >
> > >         }
> > >
> > >         return orig_pte;
> > > --
> > > 2.34.1
> > >
> >

Thanks
Barry

