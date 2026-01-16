Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D86EC982CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NO9avectM4oqIErpCHYan5QDEY3yIsqWHROY9nL0nfY=; b=mBQpGwSNhzut6eUJeg13Ggom1r
	iU/7wPzUpOuOQ7dUmjAwHr7CmzNljEBhEQDKaSFU1zerIjWhp5mwlCzWj9TxcKRDTBmL45t9w2hvT
	bzW2SWhKHQp3xhTw4czZxyEMGqcl9uNAhAyrjJ/51azepQQRhYtlGNKUrqgikdH+mrdTmCD6uKVnB
	RB3sJsCG3MGnGbnxKyOyJpTG3SXYuT35XSq/J4Efxm3oSHCWptT6Lcsm6oOsiswWtSHG3KRdx0eKS
	60WLh/AVjr53F7nzCYph1zt8dYUzpUVHoyjwLFaZWTgrgjUTRj2ZbwjukGzX4uPEqNIRiH4nPGztt
	tMbXvzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglWj-0000000EKfm-18hZ;
	Fri, 16 Jan 2026 15:14:17 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglWg-0000000EKf5-1ovF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 15:14:15 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-88a3d2f3299so21215556d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 07:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768576453; x=1769181253; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NO9avectM4oqIErpCHYan5QDEY3yIsqWHROY9nL0nfY=;
        b=UkHBZXxI5BsfHGIO0Zwb1VWTXZlE7Og2POLDMwDA+CzDxc70hHuZzlZvFW0W08esvk
         gj6nBq6MQ2qzmlebN+IwCZagEMigdOQJ5t6jivwO+5V5snij0mfuC9d6Jw2nCL5XEC5S
         eFrMn/fm+EyQYOnqMo4NpfVm0O09ZCeBhrTliHxEdzXEWoCW6dn8jQazKqyaQ9QHomIy
         Wzwl7Nkrxi/WjT+JEG8xOWR19hv3usK/kD6B1My33i63lwtBvMBVqNBAesDhPjO/5C0l
         eKlflT8ptKqOtVJnFnczxNnTWCekImlh1idk0KvHzqJc6lfR7QoszxfC2DuUokPu8Ctt
         65Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576453; x=1769181253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NO9avectM4oqIErpCHYan5QDEY3yIsqWHROY9nL0nfY=;
        b=sqyYij5zjKK09flxLgsTBcR7WfvcO1KzfoKZgzVyhu2MJICsvBK3iGC+w32ruK3pHp
         G1LQLsi17HD9Bh2R4sXeMiw5pxoQb6VkK1WIeO/qrTKHxdOrWfFbmtChQghLnPSnYWsG
         07EvN20AahHadSju350Mz0yrm/O4VS49+++K6lPNlBG4t4UEFw6qe1PxnZC0uHkOkNQk
         N70V/Mlb3oIIsH8VVlWp9Tsdf8g+HtUlVt59FgWiB0kXJfEzbiXYLHCXQMC7k89qftFx
         QqWXbH5Htg79eOnUFqzpUDpgiXc1U0eCj+JeqhVLXZKWEoXgyS50XDSy4m3QwO6o6khX
         lTbw==
X-Forwarded-Encrypted: i=1; AJvYcCVlU170Mi8HGtuKFqSkK4QJQI6dN7P1iAdxSEvvicu3gCrHTPbRYWUj58i1A5iiMw5MAQA8IbdFx0HJ8Hhvzp0e@lists.infradead.org
X-Gm-Message-State: AOJu0YzI8F62H8VQ04PYHZUX7fjEpriSYBKtn9F+RMwL7R8hEluNUM98
	3w8w/1AiaAYy2IHO9cc8zeO9CgEm+TyEnxqliDWvD7lt57Uw26icN4DKd/gmfdBVyepz3kYlLvj
	kQvXpFNIVFfdivs1gVZyfmCEb6kPja1k=
X-Gm-Gg: AY/fxX45eyemdNCYUEq8RLyO4F6k+ERR2w2yRFYhjDdaCpNhzlxIzR8J+eqJPHlmfiZ
	AaedA/QFPgBVojjTYwCygB/4amxLF3HqtiirxsVnG1OG/8TmZA491GB0L4X5+CS0Ef27/UXuvYt
	aS7Sv6/i5hGRVZyTT0YtweScqkzAyBI4ylgnFEeFuN2VpeiGjMkrQ4aE77PqS/hFdJkSR3+GWTo
	xnMUFc1aB1qrndDj1UBXmoJ/BoX82dFjrCqru2PFy5uA8XeowQihorxHbH5mMd/Mo5lsLXr7A==
X-Received: by 2002:a05:6214:1c8e:b0:88f:ce04:3261 with SMTP id
 6a1803df08f44-8942dbed93amr49871526d6.6.1768576452689; Fri, 16 Jan 2026
 07:14:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260106132203.kdxfvootlkxzex2l@master> <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
 <20260107014601.dxvq6b7ljgxwg7iu@master> <db4d0a19-598b-48ff-accc-f5940a481035@arm.com>
In-Reply-To: <db4d0a19-598b-48ff-accc-f5940a481035@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 16 Jan 2026 23:14:01 +0800
X-Gm-Features: AZwV_Qhh25guirGdCd3FvYx-1o2HRDCiexeYBr732qjmPh2DKC6RTtL0fDbc61E
Message-ID: <CAGsJ_4zAxhSDqvN5tzSeHR-kifaxm_GbPhHCeSkYsRJk=uHN-Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file large folios
To: Dev Jain <dev.jain@arm.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_071414_482022_E3811614 
X-CRM114-Status: GOOD (  16.29  )
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

> >
> > I mean maybe we can skip it in try_to_unmap_one(), for example:
> >
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 9e5bd4834481..ea1afec7c802 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -2250,6 +2250,10 @@ static bool try_to_unmap_one(struct folio *folio=
, struct vm_area_struct *vma,
> >                */
> >               if (nr_pages =3D=3D folio_nr_pages(folio))
> >                       goto walk_done;
> > +             else {
> > +                     pvmw.address +=3D PAGE_SIZE * (nr_pages - 1);
> > +                     pvmw.pte +=3D nr_pages - 1;
> > +             }
> >               continue;
> >  walk_abort:
> >               ret =3D false;
>
> I am of the opinion that we should do something like this. In the interna=
l pvmw code,
> we keep skipping ptes till the ptes are none. With my proposed uffd-fix [=
1], if the old
> ptes were uffd-wp armed, pte_install_uffd_wp_if_needed will convert all p=
tes from none
> to not none, and we will lose the batching effect. I also plan to extend =
support to
> anonymous folios (therefore generalizing for all types of memory) which w=
ill set a

I posted an RFC on anon folios quite some time ago [1].
It=E2=80=99s great to hear that you=E2=80=99re interested in taking this ov=
er.

[1] https://lore.kernel.org/all/20250513084620.58231-1-21cnbao@gmail.com/

> batch of ptes as swap, and the internal pvmw code won't be able to skip t=
hrough the
> batch.

Interesting =E2=80=94 I didn=E2=80=99t catch this issue in the RFC earlier.=
 Back then,
we only supported nr =3D=3D 1 and nr =3D=3D folio_nr_pages(folio). When
nr =3D=3D nr_pages, page_vma_mapped_walk() would break entirely. With
Lance=E2=80=99s commit ddd05742b45b08, arbitrary nr in [1, nr_pages] is now
supported, which means we have to handle all the complexity. :-)

Thanks
Barry

