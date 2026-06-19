Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E98CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJE6cIYV1OOaFfhZSUjqsaXExfjdxdplzfZm/ifnrlk=; b=SkFwb8x1cZ1gcoG3c5YvrTj9Fc
	ocFAnNrKpOVMq2ZK4HiuCDSG7E9m6mIVrBbK78kvEs9Z0COGD6K2DYNr6nyPg4uPhmaPiGERmFM1N
	uOOVAlotbUmBFI9p2lsVb/9pHOMGFredaYf7Gt2fsIsBtOYfTDMfl0pF/Lws05h0ElXyJXuHWORnS
	k4j+XPupHp3HymnDiJPeKiUuwRF30/zohPGKrKfoLBmof/hXVCyXmZ1uBeC5zxb4AEJiuPZ0L+de0
	2w7z0QU0zCMJ1PL2wXVJ+dRKD53vREPkwOlLFPl12+qLOdAaGDLUH2+JPg/J+iyeMhM92+SnAxMFj
	3BTLN1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waf5H-00000002vVT-2QqY;
	Fri, 19 Jun 2026 19:40:59 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waf5F-00000002vV4-1MkE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 19:40:58 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-519ed52bcc6so255531cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 12:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781898055; cv=none;
        d=google.com; s=arc-20260327;
        b=n+xc+k0BuBYdfEtJK0zTQKWc1U095klgwRpInmog2Axl2UUlP9BD8ZkaB4qYdFaayp
         Nwvhtrnn05mmp7DIkKoHf/WqqyqxTtXDjGhd0bgX5imDCMFlmemAZrgvA9VccLxJewHT
         og7Xq6V7MWr9S4G3xHeFLmQ+WhhyzKtvjgoDWWN5K9G3mkYWA/zJFP0br1lEiW8FQe0R
         yGOHz+aSceiO+mihHPVQTaAn5iMPAPN6b2K3yxBTUxp9fae4HBdL6XHIFVwzMHlxiOcB
         XW+hj+JJBIE3mP4k+Myp0pStfJqNJaWt28GGn8641LPK71RMt7FSFnIDKGqrQvlFsLxB
         DZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dJE6cIYV1OOaFfhZSUjqsaXExfjdxdplzfZm/ifnrlk=;
        fh=dc0mgzgNJ1UEFTz0rdyd+g30U6NAG1qRWwGIE9jww7Y=;
        b=SO1aqfJrW6e41E1ehZeLPZ8AD3DZcYHp4eDAmUTzRu7ssZps8LSi/PIDdBVIeeiyyE
         ZjfoIOgZRLD1uLwetjPg03w9OExinWc9XGeYDkdUqusnpWchBXWOHqetaoBdPlsg8u21
         6Jx6tjj9dB/K9q2qu4NoLY4+7sWzCEvESUcC5EB0idfLixpxLzePJolEOBkxW5HFb9SL
         hZ3gakGk+VZ1TWzUo8JCJwT2rNOM7hTRtW7mpedflCs5euIthMNq6vroeBItGSzMT7zO
         iFr7x00Z7jKJhG9q3LKFiLlPJoxXD5ecxuvd9V4nIVO+uMUjNw6PyR8QzHaseRpoAe7b
         LS7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781898055; x=1782502855; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJE6cIYV1OOaFfhZSUjqsaXExfjdxdplzfZm/ifnrlk=;
        b=vcBbK0+w/2A/aqk7YOsqGS7pFQxElxnCKrwkb8ImHB/RXDFVYAQtqW9Nx+IX8AU8TZ
         KZy9WtSt3Jj8DhyfUdyNw4AktoSCxh4M438OL9eQFGZvU7oX1LvCvy2SMnPf0pv58Rm+
         ybJoBfLWI3OQpzvrtb93eQ1AC/65zVrXr2Oc6NBFYC2s2seXl5VrMCoCohKDCoBIlvw+
         DpRFJfgmeQFqR1dFbhsyPKhTo/M3MAUEZli4flFFqohvPSLcvO+zNaYkQ8h3wv4BBbdu
         OhkM5jDq4LAaTYvRHVte1Vm00Gqt9RbdLnPPKHiA24bYnaiH2XtoC3iUqZoHf7tEUNWK
         h7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781898055; x=1782502855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJE6cIYV1OOaFfhZSUjqsaXExfjdxdplzfZm/ifnrlk=;
        b=dAMx5EpX39JlR7dbAcun+a3/bH/HDLAAAjmVmKWr1+DijR5o1hngOzW2B3ljVlOkj8
         XPVd/pG8a53svHLuvRzPGVgb/UTxZwTpxTR/LgUjzjX+CSWS6+hd496XUsMJtG/5T66a
         58kseiCAi1vtc7F3O1/ytF48EUHHiWuc5Eq95C05YofLJb22ShCo5cL4yugA3BbIx3+y
         Rjl1PaFLIJI6Kd5h0C+/dgkYAuhQ2Xjr9gjUh8zwb4ECYQc+tpPW1gPQRfs3rR7oYuqB
         GYt+OZB8JU0aNVU3moQaQ0cfaJjLWAfxTbrVTretmbSmHknI2ZjrzUJx6728mOwArj1X
         Z/pQ==
X-Forwarded-Encrypted: i=1; AFNElJ925vp8ov2CA6jvwffiyjBbc8NPie9uOLifMqJSX6vQRAVeEfIdQK6fUfb8gxj0nVx6LyNVWH/9Zkt1Hnf4JiwM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8STEEpo4gkIJ7B9VH+yGr6av1b/vGZ4RyajISuhcyBj0QjnWp
	39AiZ+SMAwnGZaJHArknbeXd9aFS2gjB1NcnbU+1Fn4+t2u8mVizBZI+HOzDJUf6ycC6cknnS9B
	Fc8C8P30yX+73Wf7YXg5TvrJe9k6W5By3Er0M6koI
X-Gm-Gg: AfdE7cmht2W2rPqsotgAm7MFxF7qh2ph7gaSC3brPppx+xyoRPDOnhiE6fizAFf/gYn
	WfpEVLxrlDjvVxZ3bYjDPTV+567uaPDMru5+/aVxMZTcJ4v2OQEh2JLjegPc7+dJpKMvoe1P4TQ
	9dxUVQyslWv/j0WTQNbFFlZQ/s6zjxk7OooQvxD4SvZdp3uVmx1l+hkDFd8YQ86RfOB293cnmHU
	LPm4q55O+sEDGna9eOomnEUc7Vi5KbkxSQ0iQ70HLtu4JsT0YqUsYbF4NatCxCJpz2vbg==
X-Received: by 2002:a05:622a:11c5:b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-519e891bc2bmr8238871cf.9.1781898053871; Fri, 19 Jun 2026
 12:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
In-Reply-To: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Fri, 19 Jun 2026 12:40:41 -0700
X-Gm-Features: AVVi8CfGMSn6U3ZYxuzVWyR1AQuFNJS8d4-0Q4Dfsm2iT6SBHKVnQMNx3er3cMg
Message-ID: <CAE2F3rABU2_d+e+NuFJ3ngDCEnGuVCsmE612V9RAKmyAX-R9Mw@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_124057_400513_449CF606 
X-CRM114-Status: GOOD (  32.80  )
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

On Thu, Jun 18, 2026 at 2:06=E2=80=AFAM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
> Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
> provides a compile-time opt-out for hardware affected by SMMU errata
> related to the contiguous bit.

Have you considered making this a runtime option? Compare this with
arm_smmu_device_iidr_probe() where the smmuv3 driver disables certain
features based on the identified implementation and the errata
affecting that implementation.

> On the mapping side, __arm_lpae_map() detects when the requested size
> matches a contiguous range at the next level, sets the CONT bit on all
> PTEs in the group, then recurses with the base block size and an
> adjusted pgcount.

I would perform this check at the current level not the previous
level. See comments below.

>
> On the unmapping side, the CONT bit is cleared from all PTEs in the
> affected contiguous group before any individual entry is invalidated,
> following the Break-Before-Make requirement of the architecture.

My understanding is that for unmap operations, the following rule applies:

The IOVA range targeted by an unmap operation must exactly match the
IOVA range of a previous map operation. Partial unmap operations are
not allowed.

The iopgtable code previously had a function named
arm_lpae_split_blk_unmap() which allowed a block mapping to be split
up. However, that function has since been removed, which aligns with
prohibiting partial unmaps.
The other concern I have is a potential race condition: While one
thread clears the contiguous bit, another thread could try to unmap
the same descriptor.

Consider dropping support for partial unmap and just triggering a
WARN_ON() if you detect that a contiguous group is partially unmapped.

> +static inline int arm_lpae_cont_pmds(unsigned long size)

PMD is not a term that is used in this file. I advise against
introducing this term.

> +static u32 arm_lpae_find_num_cont(struct arm_lpae_io_pgtable *data, int =
lvl)
> +{
> +       if (lvl =3D=3D ARM_LPAE_MAX_LEVELS - 2)
> +               return arm_lpae_cont_pmds(ARM_LPAE_BLOCK_SIZE(lvl, data))=
;
> +       else if (lvl =3D=3D ARM_LPAE_MAX_LEVELS - 1)
> +               return arm_lpae_cont_ptes(ARM_LPAE_BLOCK_SIZE(lvl, data))=
;

Consider supporting the contiguous bit at lookup level 1.

>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned lon=
g iova,
>                           phys_addr_t paddr, size_t size, size_t pgcount,
>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *p=
tep,
> @@ -463,6 +583,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable =
*data, unsigned long iova,
>         size_t tblsz =3D ARM_LPAE_GRANULE(data);
>         struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
>         int ret =3D 0, num_entries, max_entries, map_idx_start;
> +       u32 num_cont =3D 1;
>
>         /* Find our entry at the current level */
>         map_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> @@ -505,6 +626,24 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable=
 *data, unsigned long iova,
>                 return -EEXIST;
>         }
>
> +       if (arm_lpae_pte_is_contiguous_range(data, size, lvl + 1, &num_co=
nt)) {

I would recommend performing this check at the actual level not at the
previous lookup level i.e. not at the (lvl - 1) level. Imagine the
following situation: The granule size is 4KB, the initial lookup level
is 2, and size is 32MB. I'm wondering if in that case, it'll just keep
recursing until it hits (WARN_ON(lvl >=3D ARM_LPAE_MAX_LEVELS - 1)).

> +#ifdef CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT
> +static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
> +                               unsigned long iova, int lvl,
> +                               arm_lpae_iopte *ptep, size_t num_entries)
> +{
> +       struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
> +       u32 num_cont =3D arm_lpae_find_num_cont(data, lvl);
> +       arm_lpae_iopte *cont_ptep;
> +       arm_lpae_iopte *cont_ptep_start;
> +       unsigned long cont_iova;
> +       int offset, itr;
> +
> +       cont_ptep =3D ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
> +       cont_iova =3D round_down(iova,
> +                              ARM_LPAE_BLOCK_SIZE(lvl, data) * num_cont)=
;

As a result of this round_down() function, you are accessing a
descriptor that describes an IOVA outside the range targeted by the
iommu_unmap call. Consequently, you might race against another thread
accessing the same descriptor.

> +       cont_ptep +=3D ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
> +       cont_ptep_start =3D cont_ptep;
> +
> +       /*
> +        * iova may not be aligned to the contiguous group boundary; incl=
ude
> +        * any leading entries so round_up() covers all overlapping group=
s.
> +        */
> +       offset =3D ARM_LPAE_LVL_IDX(iova, lvl, data) -
> +                ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
> +       num_entries =3D round_up(offset + num_entries, num_cont);
> +
> +       for (itr =3D 0; itr < num_entries; itr++) {
> +               WRITE_ONCE(*cont_ptep, READ_ONCE(*cont_ptep) & ~ARM_LPAE_=
PTE_CONT);

This read-modify-write operation is not safe due to the potential race
described above.

> +               cont_ptep++;
> +       }
> +
> +       if (!cfg->coherent_walk)
> +               __arm_lpae_sync_pte(cont_ptep_start, num_entries, cfg);
> +}
> +#else
> +static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
> +                               unsigned long iova, int lvl,
> +                               arm_lpae_iopte *ptep, size_t num_entries)
> +{
> +}
> +#endif
> +
>  static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>                                struct iommu_iotlb_gather *gather,
>                                unsigned long iova, size_t size, size_t pg=
count,
> @@ -660,7 +841,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgt=
able *data,
>  {
>         arm_lpae_iopte pte;
>         struct io_pgtable *iop =3D &data->iop;
> -       int i =3D 0, num_entries, max_entries, unmap_idx_start;
> +       int i =3D 0, num_cont =3D 1, num_entries, max_entries, unmap_idx_=
start;
>
>         /* Something went horribly wrong and we ran out of page table */
>         if (WARN_ON(lvl =3D=3D ARM_LPAE_MAX_LEVELS))
> @@ -675,9 +856,15 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pg=
table *data,
>         }
>
>         /* If the size matches this level, we're in the right place */
> -       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> +       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data) ||
> +           (size =3D=3D arm_lpae_find_num_cont(data, lvl) *
> +                    ARM_LPAE_BLOCK_SIZE(lvl, data))) {
> +               size_t pte_size;
> +
>                 max_entries =3D arm_lpae_max_entries(unmap_idx_start, dat=
a);
> -               num_entries =3D min_t(int, pgcount, max_entries);
> +               num_cont =3D arm_lpae_check_num_cont(data, size, lvl);
> +               num_entries =3D min_t(int, num_cont * pgcount, max_entrie=
s);
> +               pte_size =3D size / num_cont;
>
>                 /* Find and handle non-leaf entries */
>                 for (i =3D 0; i < num_entries; i++) {
> @@ -687,11 +874,27 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_p=
gtable *data,
>                                 break;
>                         }
>
> +                       /*
> +                        * Break-Before-Make: before invalidating any lea=
f
> +                        * entry, clear the CONT bit from every entry in =
the
> +                        * contiguous group(s) and flush the TLB, as requ=
ired
> +                        * by the architecture.  arm_lpae_cont_clear() co=
vers
> +                        * the full [iova, iova + num_entries * pte_size)=
 range
> +                        * via round_up(), so subsequent entries read bac=
k
> +                        * CONT=3D0 and skip this block.
> +                        */
> +                       if (pte & ARM_LPAE_PTE_CONT) {
> +                               arm_lpae_cont_clear(data, iova, lvl, ptep=
, num_entries);
> +                               io_pgtable_tlb_flush_walk(iop, iova,
> +                                                         num_entries * p=
te_size,
> +                                                         ARM_LPAE_GRANUL=
E(data));

I believe this is inefficient. Consider the case where we unmap 2MB
worth of IOVA space mapped by 512 4KB page descriptors with the
contiguous bit set. If I'm not mistaken, you're running CMOs
(__arm_lpae_sync_pte) twice for every page descriptor. In addition,
io_pgtable_tlb_flush_walk() will submit an extra CMD_SYNC and wait for
it's completion.

Additionally, you perform rounding in arm_lpae_cont_clear(). However,
io_pgtable_tlb_flush_walk() is called on the original, potentially
unaligned range. Can this lead to under invalidation? Again, my
preference would be to drop support for partial unmaps which would
also remove the requirement for calling io_pgtable_tlb_flush_walk()
here.

> +                       }
> +
>                         if (!iopte_leaf(pte, lvl, iop->fmt)) {
>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
>
>                                 /* Also flush any partial walks */
> -                               io_pgtable_tlb_flush_walk(iop, iova + i *=
 size, size,
> +                               io_pgtable_tlb_flush_walk(iop, iova + i *=
 pte_size, pte_size,
>                                                           ARM_LPAE_GRANUL=
E(data));
>                                 __arm_lpae_free_pgtable(data, lvl + 1, io=
pte_deref(pte, data));
>                         }

