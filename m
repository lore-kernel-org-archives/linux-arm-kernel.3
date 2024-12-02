Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C23E69E8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 20:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCBUeYFV3fpgaA8Zw2GoHbzl3MSDJwsSgusnPSoLN4k=; b=vRXkgC/NPR4KOyGfxBIkeAVbJ6
	NRCV/I6Jdmyn1ZRG7NNtjgWkvmFQtuBZ/5eB5maiEIUF2/3VCEPHvodBh9GsJTuSZpiMkj2UCu4M4
	4scUDabrxNzug0/DaDW0iBLZpt2LQIFxq7khSl1PV21YcNZ8GGnSpPYL9wwEmIWXx5BoXhEdjJU77
	VzaL+7AacCeko5GSQnRfchjiA3Z0iVg1HoThi1/YHYDBw96vMf+Qnb99e6Cm+TUiik1MbgohYS3xH
	2I8OVYxOjYph6n2xBurJkPefO8J19qwIwMXH9KkwGIFJbypob0/YP/ANaXD5AoAC+WsGamEbEb8hy
	f6Lnia9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tICnj-00000007OFI-0C1u;
	Mon, 02 Dec 2024 20:13:47 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBl4-00000007FIY-2vsz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 19:06:59 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d0aab1aafcso27273a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 11:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733166416; x=1733771216; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCBUeYFV3fpgaA8Zw2GoHbzl3MSDJwsSgusnPSoLN4k=;
        b=ehvoaY1NsYteuyvE7GvWzeb+PgzjbwbpI/7vMG5xtuUjj3mHdXbTlJNYQ/CUrFRNjY
         LGS6YiQYrTa5DsR8yKYl3pie4GfIVAIugtHUIT2tTCUq0dQzzq10CLj/PqPAA9qlMsO+
         rlEMKqqmR7IYhyfPHyrzTCFl0HeL72V7Ee8iKAqu2I+prtStCZ0UeGxBvkms3i5sAPfL
         +7yvRUHlk8IbRAM5hXD9rgnadQtYIdiDTVP/h4NRev5HRXRg1fx3yEcNKhP1SENESW+E
         7NHr2GlDP3PGLL+dzZ3FtyylflF69B/CcIaAXf620juxCyPs85ilp4lpQNo9PM7VP4Y2
         a6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733166416; x=1733771216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCBUeYFV3fpgaA8Zw2GoHbzl3MSDJwsSgusnPSoLN4k=;
        b=Tm2v/bjM2tuidAOTpunn9Eh2iZS6OJMxI7kgwJlVS+b8P5z4DlY9L3pmcYl01fHhoB
         IV2ZLkFGGJ0mbmJLvWFJ/OCv44TF4KAHjfzJusgHStF03X04VMMDa3G9hSkf36inz5ZW
         UbEUQYBez6PGpNceFY3XU3MStoFSSx10+ZMgcPI6yb9Q0Vnl6KkEDMUbqKNESZBwR2zS
         yv6IKKR3zKSVTnuooiy0JDb5PCC4wcjaaC7bi3LY6lxQGJYLisrXq1TZdd+mwuZ6UrMN
         Ognu87Q4pwcMGluveb7S1BymtCyK6gK+NfWi+72U9ViJijF6uuLH5REG4RY+0Joz20n+
         dKTg==
X-Forwarded-Encrypted: i=1; AJvYcCWBCrx9LYpQUR30g4xwX78f6QpPH8BNPdRjguAvsYj7gpOp36NiXmscZA+6d0GPSSx54e/TLHp2kDoxqwwQaUvu@lists.infradead.org
X-Gm-Message-State: AOJu0YyuvkBnPhJSombQSyI0f79azl5rxsrNaPoKeYS6+j6xMeiPrF6J
	Gqfwgn0Hq5/BrAa5CFswoVzoR5zTjI8Cdo5LJBf/bxHrzaLLK34rdQetmGdwc7GrQtRrCeJws4X
	m5BFhIJkf3ks2NmEK+0v6PdnI+/sTVi0hVAcA
X-Gm-Gg: ASbGncvtj8n7FNpGdqrP3RKC6BqWGRs25s1rM6dHdewTr2QdUncxSFv0tVD/VO7LZyt
	0HIxG+21gECQd/HcUX/2QKscutH3aYSUihn4mRwJLlbP40Is+aEC7H8ohCsYeEIVzxQ==
X-Google-Smtp-Source: AGHT+IH9j98cJW7npDpW6xfQsvGNfNPkd9QkcAkOZ8rrdyy7XAgOVooDJ8GQtMc27kWKIX+xFIqscW8kLPQx7naDkhU=
X-Received: by 2002:a05:6402:1117:b0:5d0:8752:cecd with SMTP id
 4fb4d7f45d1cf-5d098217d8cmr287064a12.3.1733166415531; Mon, 02 Dec 2024
 11:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20241024162516.2005652-1-smostafa@google.com> <20241024162516.2005652-2-smostafa@google.com>
 <CAE2F3rDyj8WohXHTa1H3_gqTndyJL3cUEfBnXCEibNo1oYTt3A@mail.gmail.com> <Z02kIaxP96am-P2f@google.com>
In-Reply-To: <Z02kIaxP96am-P2f@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Mon, 2 Dec 2024 11:06:44 -0800
Message-ID: <CAE2F3rAj74u5cs_iVTuU+RqJRYPTceVMqww9EFwC7X03Xave5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/io-pgtable-arm: Fix stage-2 map/umap for
 concatenated tables
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_110658_737324_6ABFC3F4 
X-CRM114-Status: GOOD (  39.12  )
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

Hi Mostafa,

On Mon, Dec 2, 2024 at 4:12=E2=80=AFAM Mostafa Saleh <smostafa@google.com> =
wrote:
>
> Hi Daniel,
>
> On Sat, Nov 30, 2024 at 08:20:10PM -0800, Daniel Mentz wrote:
> > On Thu, Oct 24, 2024 at 9:26=E2=80=AFAM Mostafa Saleh <smostafa@google.=
com> wrote:
> > >
> > > When calculating the max number of entries in a table, Where
> > > RM_LPAE_LVL_IDX() understands the concatenated pgds and can return
> > > an index spanning more than one concatenated table (for ex for 4K
> > > page size > 512).
> > > But then, max_entries is calculated as follows:
> > > max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - map_idx_start;
> > >
> > > This leads to a negative index in the page table, where for:
> > > - map: do nothing (no OOB) as fortunately all comparisons are signed,
> > >   but it would return a negative mapped value.
> > >
> > > - unmap: it would leak any child tables as it skips the loop over
> > >   =E2=80=9C__arm_lpae_free_pgtable=E2=80=9D
> > >
> > > This bug only happens when map/unmap is requested with a page size
> > > equals to the first level of the concatenated table (for 40 bits inpu=
t
> > > and 4K granule would be 1GB) and can be triggered from userspace with
> > > VFIO, by choosing a VM IPA in a concatenated table > 0 and using
> > > huge pages to mmap with the first level size.
> > >
> > > For example, I was able to reproduce it with the following command
> > > with mainline linux and mainline kvmtool:
> > >
> > > ./lkvm run --irqchip gicv3 -k {$KERNEL} -p "earlycon" -d {$ROOTFS}  -=
-force-pci -c \
> > > `nproc` --debug -m 4096@525312 --vfio-pci 0000:00:03.0  --hugetlbfs  =
/hugepages
> > >
> > > Where huge pages with 1GB would be used and using IPA in the second t=
able
> > > (512GB for 40 bits SMMU and 4K granule).
> > >
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >  drivers/iommu/io-pgtable-arm.c | 17 ++++++++++++++---
> > >  1 file changed, 14 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtabl=
e-arm.c
> > > index 0e67f1721a3d..3ecbc024e440 100644
> > > --- a/drivers/iommu/io-pgtable-arm.c
> > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > @@ -199,6 +199,17 @@ static phys_addr_t iopte_to_paddr(arm_lpae_iopte=
 pte,
> > >         return (paddr | (paddr << (48 - 12))) & (ARM_LPAE_PTE_ADDR_MA=
SK << 4);
> > >  }
> > >
> > > +/*
> > > + * Using an index returned from ARM_LPAE_PGD_IDX(), which can point =
to
> > > + * concatenated PGD concatenated, get the max entries of a that tabl=
e.
> >
> > I believe the macro that returns an index is called ARM_LPAE_LVL_IDX
> > not ARM_LPAE_PGD_IDX.
> >
>
> Yes, the comment is not quite accurate, although ARM_LPAE_PGD_IDX()
> calls ARM_LPAE_PGD_IDX() which is the problem.

I assume you mean the problem is that ARM_LPAE_LVL_IDX() calls into
ARM_LPAE_PGD_IDX().

I find that ARM_LPAE_PGD_IDX is a misnomer as it returns a number of
bits as opposed to an index. Something like ARM_LPAE_PGD_EXTRA_BITS
would be a more appropriate name.

>
> Thanks,
> Mostafa
>
> > > + */
> > > +static inline int arm_lpae_max_entries(int i, struct arm_lpae_io_pgt=
able *data)
> > > +{
> > > +       int ptes_per_table =3D ARM_LPAE_PTES_PER_TABLE(data);
> > > +
> > > +       return ptes_per_table - (i & (ptes_per_table - 1));
> > > +}
> > > +
> > >  static bool selftest_running =3D false;
> > >
> > >  static dma_addr_t __arm_lpae_dma_addr(void *pages)
> > > @@ -390,7 +401,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgta=
ble *data, unsigned long iova,
> > >
> > >         /* If we can install a leaf entry at this level, then do so *=
/
> > >         if (size =3D=3D block_size) {
> > > -               max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - map_i=
dx_start;
> > > +               max_entries =3D arm_lpae_max_entries(map_idx_start, d=
ata);
> > >                 num_entries =3D min_t(int, pgcount, max_entries);
> > >                 ret =3D arm_lpae_init_pte(data, iova, paddr, prot, lv=
l, num_entries, ptep);
> > >                 if (!ret)
> > > @@ -592,7 +603,7 @@ static size_t arm_lpae_split_blk_unmap(struct arm=
_lpae_io_pgtable *data,
> > >
> > >         if (size =3D=3D split_sz) {
> > >                 unmap_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data)=
;
> > > -               max_entries =3D ptes_per_table - unmap_idx_start;
> > > +               max_entries =3D arm_lpae_max_entries(unmap_idx_start,=
 data);
> > >                 num_entries =3D min_t(int, pgcount, max_entries);
> > >         }
> > >
> > > @@ -650,7 +661,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io=
_pgtable *data,
> > >
> > >         /* If the size matches this level, we're in the right place *=
/
> > >         if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> > > -               max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - unmap=
_idx_start;
> > > +               max_entries =3D arm_lpae_max_entries(unmap_idx_start,=
 data);
> > >                 num_entries =3D min_t(int, pgcount, max_entries);
> > >
> > >                 /* Find and handle non-leaf entries */
> > > --
> > > 2.47.0.105.g07ac214952-goog
> > >
> > >

