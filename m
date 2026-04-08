Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D881073C98
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZ2yuTZvfsrt02dodKOU1pTCiBawJg1GQIriROlTJHs=; b=gBPorwZm5JEleY2lIiTtEd3xu+
	5XaEX/Lrs5Z74O6YHeJCZV99OCNB2vlHekM8Hf/AfPN13NdpVyPeml6r8lm5RiPCRoo0GZhit3F1V
	2QeKQuB8gvg6t8ziMbzzb9Uf60KAFAq4aYAiLgAO9W9UXnAxtqxXhrCa3lWeWbNf+1v826Rk9gEGj
	p0ms0LNfpxykHfDwCAX4YBVPZTtejZiBBuKJa0tl+udX3k4OdGj8owBT8dcImBg/B8t9GIoiuJKd0
	VCAmfeUuWNyXp0QfVtIPIMGtNgtyux5IqVajoZTeHyIYt0FrwxStq/CrGQ/ij1clSqLrE7rQtMiYR
	Ea+FOhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQeO-00000008ibn-2Iwr;
	Wed, 08 Apr 2026 11:00:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQeN-00000008ibG-0KQg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:00:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 461D0444C5
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 11:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F7FC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 11:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775646046;
	bh=0OfgS+n/fNHdA6iHaO+uqBDCD2A8pXnvnNC61V/pXfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bRVBbQly3XBWY1dTEzOEwlNr0HfuGL1bTGHzsMkQtqFOHYtF5lhWJKIjXAHNOSeRO
	 i3wpQ4md7jGhUCJLSyjGLBKck9fixNCf6lbZSPOQ75UYEv3KVoMz/3BTijIM1cXq1r
	 eD81XeKn/cWcQBnyVwCKQKzAoJ7FNNwT1QkF7UthrOxerX6xeaadm4akAQs/EVmAxC
	 6tQerp4BeZOZhoxYvNhcZD0ZgiblFxYTJGApIrxiSYdP+YCpkx0JUHFQ25gHNrFJH/
	 8SJSNSJwNVVWlQmyjZkupyQK2+Lx1Ua3qEllSqeH7CWAxnFEqDHNsLWfpZXWTm5tF/
	 eFUmqQg2CAcwg==
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50d8e11b948so31204771cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 04:00:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgUHTSjyLYszonYPPFFLLKv3ihz1MSLBrTJ3ExC+dooum7KnSt8tD6A+dcxPvXzQ8v0Rk5hWkMoiH+m5vf9Tnh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/+NsWCrRGbNg+vn0ilGdVaLSM6tL78TGs/uFECDsKMHHaVdM+
	87GSPs+QB6fVmOpKlfbSeaUDJBQCQZ24P5UT3XgN9OEvNKvvtLfhqY3wRa6bES9Es/xfLvLIs9e
	lb+S1mNwaPwK8ILtDUsDenw1NLhkBlJ8=
X-Received: by 2002:a05:622a:1e9a:b0:50d:7587:dc46 with SMTP id
 d75a77b69052e-50d7587e069mr271418751cf.12.1775646045425; Wed, 08 Apr 2026
 04:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <20260408025115.27368-2-baohua@kernel.org>
 <02b0464a-13f6-4e0c-ad69-0f494bfacbf4@arm.com>
In-Reply-To: <02b0464a-13f6-4e0c-ad69-0f494bfacbf4@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 8 Apr 2026 19:00:34 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x-73NTcef0Ep8wKUQviC=4KvGh3BfwGMqNFQt0fTPt=Q@mail.gmail.com>
X-Gm-Features: AQROBzCZTm-M-8NVQt7j0TfFWeTANOKbOR2ssF4vKWCEH8fhyZKDU6z1LoiRbbI
Message-ID: <CAGsJ_4x-73NTcef0Ep8wKUQviC=4KvGh3BfwGMqNFQt0fTPt=Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] arm64/hugetlb: Extend batching of multiple
 CONT_PTE in a single PTE setup
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org, 
	Xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_040047_158426_1D04192C 
X-CRM114-Status: GOOD (  19.72  )
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

On Wed, Apr 8, 2026 at 6:32=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> > For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
> > we can batch CONT_PTE settings instead of handling them individually.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >  arch/arm64/mm/hugetlbpage.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> > index a42c05cf5640..bf31c11ebd3b 100644
> > --- a/arch/arm64/mm/hugetlbpage.c
> > +++ b/arch/arm64/mm/hugetlbpage.c
> > @@ -110,6 +110,12 @@ static inline int num_contig_ptes(unsigned long si=
ze, size_t *pgsize)
> >               contig_ptes =3D CONT_PTES;
> >               break;
> >       default:
> > +             if (size < CONT_PMD_SIZE && size > 0 &&
> > +                             IS_ALIGNED(size, CONT_PTE_SIZE)) {
>
> Nit: Having the lower bound check before upper bound is natural to
> read, so this should be size > 0 && size < CONT_PMD_SIZE (i.e written
> the other way around).

Thanks very much for reviewing, Dev. As we discussed in patch 0/8,
this should be
PMD_SIZE, not CONT_PMD_SIZE. I will use size > 0 && size < PMD_SIZE
in the next version.

>
> Also IS_ALIGNED needs to go below size.

Sure, thanks!

>
>
> > +                     contig_ptes =3D size >> PAGE_SHIFT;
> > +                     *pgsize =3D PAGE_SIZE;
> > +                     break;
> > +             }
> >               WARN_ON(!__hugetlb_valid_size(size));
> >       }
> >
> > @@ -359,6 +365,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int=
 shift, vm_flags_t flags)
> >       case CONT_PTE_SIZE:
> >               return pte_mkcont(entry);
> >       default:
> > +             if (pagesize < CONT_PMD_SIZE && pagesize > 0 &&
> > +                             IS_ALIGNED(pagesize, CONT_PTE_SIZE))
> > +                     return pte_mkcont(entry);

Here it should be pagesize > 0 && pagesize < PMD_SIZE as well :-)

> > +
> >               break;
> >       }
> >       pr_warn("%s: unrecognized huge page size 0x%lx\n",
>

Best Regards
Barry

