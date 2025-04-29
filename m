Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF5EC3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PN2fPM9RQoCTPXB4B9XFqTVhXX0UMZxTQo24wURnSIU=; b=maWGELDezDhXRoJgkqD0UAbqkY
	V5NhZlxduZLAZKk39pzAK2Sa9rbIMGkdmpieW64OU1fte//EKcnfnqeMeFxVoC4FLGX8Hu9BMmBWG
	Ax16XwEvuFAG4ayIYZbCXLtet73z6gxP0/iK6S8XQMGkV8QEt8h50fUvJ0Ph63I4egrRxEISCEMUP
	mNQmXk3ZaK+HWDpNTgTpSUjgcW8RnGLKYsL/PpT4Nn82a+VF8yz6jhdYHixcR5SFkYbTQSFHN/Mrt
	QDjnS7JGnMx5UEPr7eS1MYYEvW2ip58QLidwncx4GP3miHC4P6N3avlYSXLXrdMLySZScOoHlyZCr
	f51Kg6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ljM-00000009uVU-1o5U;
	Tue, 29 Apr 2025 14:14:40 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lUk-00000009pyb-235Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:59:35 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d938fcb70cso14670595ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745935173; x=1746539973; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN2fPM9RQoCTPXB4B9XFqTVhXX0UMZxTQo24wURnSIU=;
        b=MfVNCOoeSHsgx5QkStv56KjdVZLy5Oz4uz9fJULSn61IyNsIq8vw0zZFQuzOVOGwGb
         VwuFZnIcyOKyoX+Ek7bWYxaQ8GoW2F2MkOFMb7TGx0ha/efYiF0mTBaW/tbIiY+vdBAT
         lnZLirRW0G+GmJMJOW8CG/NJT2JhsqHx+R/HAUYjHkxYy2XPNzuVh4qbhzau8KFPWACw
         ub01okaIlSjm3fKir/lGZLXrWTNQJDkm+3F2aqgV7C7JLKGJud7FU0MdDPCQK6Tc0ZpH
         nhsLiV23g+wrQISfJ9lF09k81eu3DW2dFZJfxTR0REwlD0J3VMCkaTikkYboX69LBQU0
         LaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935173; x=1746539973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN2fPM9RQoCTPXB4B9XFqTVhXX0UMZxTQo24wURnSIU=;
        b=vtonN2gboJbjGZ3MJpsJmVdB1g8ZJ+hEeRDF1kSNquDdzYboqZSGcxlbc9XhjlhKGY
         pPGsJ4NO74yFAzD+lp/KtxBMW9ZAj7xskoIwwA4W4ZPfiEgjQVeVKbtBfSTg7lCxWBsN
         /62Ib3uvCpFNaA3cIKDmXUaI3hDMGvJL9ZZbXpeipamN3Ntjm1BT3Hwjc6vYlWYtgoBq
         9/Xi/SlIvq4YQ6nXI4C+kuII+6sw30h8nxiPq7MOxSOzTLtljeAlaDRq/L8GbWtv2XhY
         xAadcZi04LfJQecyjVI/nE4VrNQ4ZuGHDUprwJxSxi/W3aIPisuFobgYFtYbfVCwwezC
         Z64Q==
X-Forwarded-Encrypted: i=1; AJvYcCXULfgOxGsaXdYpqmaZbuRhqZNxze0/ergTSuy5Z4QaDiIrxaAx+2NG+y6wsXTj+inlbN2mwEFmR3BYgXsgWanE@lists.infradead.org
X-Gm-Message-State: AOJu0YwSLwxvjkOyuZzBuFAzBGB8O+36yxAEVCpBoNWL0aehbtlX5xj0
	K4DxPCxhrjTGEDe32puEd19ZXXjy34ex8iYxd+CuD5aOw5svbIwwQr/6aVAkRnlQGnOxFKWoa50
	aSimM5CGYmkE9eP93+grYGQ1j8PU=
X-Gm-Gg: ASbGncv0k46uN18I8TU41HM26Dr1ljwYem6QMEH34T7sCOnKI443wT4PYO8sXVrhH8F
	oRXW5cfH2SmQsWtfzOBa7mPnpLJ4XE1o9koTq4nxABDAJlQFB1DFWiM65IyPuei/D0zB9yVIhz5
	r+Bl6D+nCFOw9BqvibvoOH1qfuuIReUzLQMxLCdzHPxEMr9J5x7rc=
X-Google-Smtp-Source: AGHT+IEdTO5hNn1ezgivOymNsegNzfJ83eKjctWNeTpWMsM57J4OJKn3z6ximxQld4YNySvnfhfQGQpz4RThMZJUjO0=
X-Received: by 2002:a05:6e02:3e02:b0:3d4:3ab3:5574 with SMTP id
 e9e14a558f8ab-3d95d24557emr38606775ab.3.1745935173509; Tue, 29 Apr 2025
 06:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250428205619.227835-1-robdclark@gmail.com> <20250428205619.227835-4-robdclark@gmail.com>
 <2e074d63-ad0c-47fa-aeb0-cb03c81829fe@arm.com>
In-Reply-To: <2e074d63-ad0c-47fa-aeb0-cb03c81829fe@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 29 Apr 2025 06:59:20 -0700
X-Gm-Features: ATxdqUHI0I0FZW2gLzxkvF3EsTwzlI4FDJUgZ3k8m88LbsKKtn-nlD3_9TKUqac
Message-ID: <CAF6AEGs8gPtmYeYBMCn3r=w4eq4pk25fdS=YeqMYUySj7kz0ow@mail.gmail.com>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Joao Martins <joao.m.martins@oracle.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_065934_531949_50143992 
X-CRM114-Status: GOOD (  30.45  )
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

On Tue, Apr 29, 2025 at 5:38=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 28/04/2025 9:54 pm, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In situations where mapping/unmapping squence can be controlled by
> > userspace, attempting to map over a region that has not yet been
> > unmapped is an error.  But not something that should spam dmesg.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/iommu/io-pgtable-arm.c | 18 ++++++++++++------
> >   include/linux/io-pgtable.h     |  8 ++++++++
> >   2 files changed, 20 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index f27965caf6a1..99523505dac5 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -475,7 +475,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtabl=
e *data, unsigned long iova,
> >               cptep =3D iopte_deref(pte, data);
> >       } else if (pte) {
> >               /* We require an unmap first */
> > -             WARN_ON(!selftest_running);
> > +             WARN_ON(!selftest_running && !(cfg->quirks & IO_PGTABLE_Q=
UIRK_NO_WARN_ON));
>
> If we are going to have this as a general mechanism then the selftests
> should use it as well.

Makes sense, I can remove the selftest_running hack in the next version.

BR,
-R

> Thanks,
> Robin.
>
> >               return -EEXIST;
> >       }
> >
> > @@ -649,8 +649,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_=
pgtable *data,
> >       unmap_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> >       ptep +=3D unmap_idx_start;
> >       pte =3D READ_ONCE(*ptep);
> > -     if (WARN_ON(!pte))
> > -             return 0;
> > +     if (!pte) {
> > +             WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN=
_ON));
> > +             return -ENOENT;
> > +     }
> >
> >       /* If the size matches this level, we're in the right place */
> >       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> > @@ -660,8 +662,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_=
pgtable *data,
> >               /* Find and handle non-leaf entries */
> >               for (i =3D 0; i < num_entries; i++) {
> >                       pte =3D READ_ONCE(ptep[i]);
> > -                     if (WARN_ON(!pte))
> > +                     if (!pte) {
> > +                             WARN_ON(!(data->iop.cfg.quirks & IO_PGTAB=
LE_QUIRK_NO_WARN_ON));
> >                               break;
> > +                     }
> >
> >                       if (!iopte_leaf(pte, lvl, iop->fmt)) {
> >                               __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
> > @@ -976,7 +980,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg =
*cfg, void *cookie)
> >       if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
> >                           IO_PGTABLE_QUIRK_ARM_TTBR1 |
> >                           IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
> > -                         IO_PGTABLE_QUIRK_ARM_HD))
> > +                         IO_PGTABLE_QUIRK_ARM_HD |
> > +                         IO_PGTABLE_QUIRK_NO_WARN_ON))
> >               return NULL;
> >
> >       data =3D arm_lpae_alloc_pgtable(cfg);
> > @@ -1079,7 +1084,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cf=
g *cfg, void *cookie)
> >       struct arm_lpae_io_pgtable *data;
> >       typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr =3D &cfg->arm_lpae_s2_cfg=
.vtcr;
> >
> > -     if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
> > +     if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
> > +                         IO_PGTABLE_QUIRK_NO_WARN_ON))
> >               return NULL;
> >
> >       data =3D arm_lpae_alloc_pgtable(cfg);
> > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > index bba2a51c87d2..639b8f4fb87d 100644
> > --- a/include/linux/io-pgtable.h
> > +++ b/include/linux/io-pgtable.h
> > @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
> >        *
> >        * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pag=
etable.
> >        * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttr=
s bits
> > +      *
> > +      * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> > +      *      mappings, but silently return -EEXISTS.  Normally an atte=
mpt
> > +      *      to map over an existing mapping would indicate some sort =
of
> > +      *      kernel bug, which would justify the WARN_ON().  But for G=
PU
> > +      *      drivers, this could be under control of userspace.  Which
> > +      *      deserves an error return, but not to spam dmesg.
> >        */
> >       #define IO_PGTABLE_QUIRK_ARM_NS                 BIT(0)
> >       #define IO_PGTABLE_QUIRK_NO_PERMS               BIT(1)
> > @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
> >       #define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA         BIT(6)
> >       #define IO_PGTABLE_QUIRK_ARM_HD                 BIT(7)
> >       #define IO_PGTABLE_QUIRK_ARM_S2FWB              BIT(8)
> > +     #define IO_PGTABLE_QUIRK_NO_WARN_ON             BIT(9)
> >       unsigned long                   quirks;
> >       unsigned long                   pgsize_bitmap;
> >       unsigned int                    ias;

