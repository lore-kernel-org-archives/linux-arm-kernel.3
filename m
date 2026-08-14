Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42647C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 21:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/erZy2n38i8Q19od1dHI45fS0KoMtthuq5RrnDN/Dg=; b=ABJfP5deUbRtQGOjiSgLF9HYO0
	9PMuQnbDWp3+m/S3S0vqltuYDY6zdKo/Z7Fy0N8Xo0egHKhOGp2hn5WTLaI4SH6pNepripOtQptEt
	vC7Ns054NIevuqNdGQKUMVEhzgsfemmOb1e5iqi2zqM6hojwgbw0BpEzHhsXZG6iDxRVQMaIRmklU
	OCHrfXDAQP7KYWnyEV2KFdJ/zvola07M9L5Ogz2QtzD5jQIIJ02Y3bZLRtoqsNA29aEJxKzB61xHz
	d3iWEh4c/fYhNJFQ5FawQ6f1gw3MFy4P/sWiYVqtUqj5whyAdTMc7cCvBLTrOBG3gxs4ahib2KCj1
	3utWRz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuzuQ-00000003Ezn-0Bar;
	Fri, 14 Aug 2026 21:57:50 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuzuN-00000003EzP-2yyU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 21:57:49 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51c10ed63c0so364101cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 14:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786744666; cv=none;
        d=google.com; s=arc-20260327;
        b=JfW+APUXQ7H9/Eo2azef0aiWpeNeOSgLoaNKi8s5FMwrMtg9k38u35+nP2yHjo2Z1w
         GFWgm7puIlSP2Ou+/ZAy3RhYEPFDebiKBIsy8HzU+OHoy3fqMVaNffmKZaLWDjV/0sQv
         GZVFjN/hbflGHduAjC0WbM8TNx8IXhd83rXUa1op1uU2HYZVIpSJsImdR9NUsEN8jGEA
         ipsrXXDBC5JVwYl2jE7qxXoHEtvYJ9y8NWP7Lul+lUZzdTWvkaRAdlvznOqlBfcj6QXp
         UxOklDOthwkqtIrx1hTAfITWNbYA1pHvmNoR6sc5QfDsh5OULmfeEkTR9l5+yvhJPtmm
         EGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q/erZy2n38i8Q19od1dHI45fS0KoMtthuq5RrnDN/Dg=;
        fh=l1oB6kgXn/W1rLesm1T9kDeCm2sd3YejMkLd3O9u/Jk=;
        b=eCjLXBMQ98gRdtUeTb8yRlqaeyIMNq3qhyMTchmbUd4svMyd5QVpz2L81epeZeG/wH
         wUkZg2M+L2scGKEctSNoN3gwM23FrivFOD7K2OBly+rwIOk2uW/cFAWZcQwqZpbQBkXv
         fXG8MoqBbBrV7YOry+V1iltP02V6pAAhqR+9b6s3ZDJIFNg7DVZhmnB8wkmmUINxLD09
         uBOpEMrX4iffF5sB6/lvOvOC4hHinQqKsnmE6G6GnOdN8AKEyIJRAhRhyWYMP0HLmYhG
         oSeHRqzw4zkbJZJCqOGS332f/ZUUcftVy0AT+xBYP1/SezX/anUTPjsWUr/IbWCAjVNU
         7B9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786744666; x=1787349466; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q/erZy2n38i8Q19od1dHI45fS0KoMtthuq5RrnDN/Dg=;
        b=Ed5WffccBzcCu7+RcHiCWdDyEEsvTc5R1njP0TabgfOKBAPsDRfH45VOdmOCrHBuIF
         pMe/7jEGXneDKKRLEi0NCcCqvdohK/D/7cPbQ2rJIWopHU1Bia3UH1Ph8rMeeoJiZg3X
         tbco4tVDUeiK16A8X9yem276ShiH0PGHCHLTlYXzU5i8RSTfwikbjQY2rf1AU1K+C/Ey
         RUtMTQoo0DG2UqyFWqs5VGN+CnqXHWVr20PhLpyXglIjUOsHGshFOCXdJn1z2r32vaHs
         h5g01+0uouTbuKTYjv9u4rgmtIztkp5oH75VzpJcHI/uw2IycCg26IeqEeRsGF73VGTK
         0meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786744666; x=1787349466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/erZy2n38i8Q19od1dHI45fS0KoMtthuq5RrnDN/Dg=;
        b=mkHi+ZFJv4uXOTBFKyFISwjjy0kHU76jhCQw+7fnGWK0s6qLsOmCz+EHEFvqSip94Q
         gE/nNQeCUhGnyLcG0dSYgNBele1TyGydmN8X/gi363uFhniWqIGXuWv7ydoyxfuyd1kM
         y7etsStMQMRsGxPODNVHUthqjbXCLCwtO5aMJcYhZZfggu4rTzIo//IGAWCH435cgVFt
         eTczyeUMQB4UtoTvur65rz2AOjnZ00szc5JSBxQiTPw5l+5qx1TnneXG0iO2Qwq38dEC
         jrdXYYZkyNmeJeb9TNsX015IH+aVzbu8pkSUXSYms9/Rs/6CutRjT/rZBc3o3+rVaKFl
         dKtA==
X-Forwarded-Encrypted: i=1; AHgh+Rqh3ka2JxXOVeq8okmMCeo89nTtVC69ws8zhELiTcF21Sv/0pBueqfgDf7Dg9Xczod0MyYoANaDpD6QgQv9slzw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1wEeJXG4bvwo0hhUZ0NtRbXm/+Rt6fhJvr2AvO8S4kUGy/eQf
	tcCegJDNdn43PxP95H2FuDaI4XKrM1LBomJoZ1Y2YzZucvba3td8XGPbJoFaQYMgFOAmDzODIwp
	5ZHMMa9+U+f2iBYlI0uHrKwEaiUNJKxaUk5Y4eE4i
X-Gm-Gg: AR+sD10+sVkbkiHwhzxPmGe3iT7O2CNSWDsnQPxwOFm5yCJoQeA4PLNTh7m2eC7/xyo
	KeEou/1+mcVBkOac4lQswlR8a1l+c+hg1zz6QO9veLa7YUIMUwDS/1KFqTUOv9MBlrjsSfhCQY6
	Yypx54+p1rFKTLL0u6GvyBNriq+kgfk/2EmB5gs80MvRDi46fMUUCi6Pk/3lTGrxZAxOB+nCP65
	si7qvFQ4b1iI5WBxpXOPSbUpXrfdH/F/Hxyx2WEbo8HR0WqBlfNTxo5pxkwVeP6Cr6m+1d1/iX7
	MPtG0BIPhVn6CuPChSaInMo3lIlSR+CxbmjM9qJLo5PahaCU3C9K
X-Received: by 2002:ac8:5e4e:0:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-52d84770c21mr23823461cf.10.1786744665581; Fri, 14 Aug 2026
 14:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
In-Reply-To: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Fri, 14 Aug 2026 14:57:34 -0700
X-Gm-Features: AUfX_mw13XLnJC6leTXSRX-bWXhXBbTh-sh7eRo2QsAUaW0Ge3uaaXn1mQEwLlI
Message-ID: <CAE2F3rB7zpPFfC376mP=god9HWRmKOaQUEgPVzKScxS12pZrvQ@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_145748_051006_89EDB211 
X-CRM114-Status: GOOD (  27.11  )
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

On Mon, Aug 3, 2026 at 11:19=E2=80=AFPM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
> +static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
> +{
> +       unsigned long pg_size, blk_size, l1_blk_size, cont_sizes =3D 0;
> +       unsigned long cont_leaf_size, cont_blk_size, cont_l1_blk_size;
> +       int pg_shift, bits_per_level;
> +
> +       if (!cfg->pgsize_bitmap || (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO=
_CONT_HINT))
> +               return 0;
> +
> +       pg_shift =3D __ffs(cfg->pgsize_bitmap);
> +       bits_per_level =3D pg_shift - ilog2(sizeof(arm_lpae_iopte));
> +       pg_size =3D 1UL << pg_shift;
> +       blk_size =3D pg_size << bits_per_level;
> +       l1_blk_size =3D blk_size << bits_per_level;
> +
> +       cont_leaf_size =3D arm_lpae_num_cont(pg_size) * pg_size;
> +       if ((cfg->pgsize_bitmap & pg_size) &&
> +           arm_lpae_cont_size_fits(cfg, cont_leaf_size))
> +               cont_sizes |=3D cont_leaf_size;
> +
> +       if (cfg->pgsize_bitmap & blk_size) {
> +               cont_blk_size =3D arm_lpae_num_cont(blk_size) * blk_size;
> +               if (arm_lpae_cont_size_fits(cfg, cont_blk_size))
> +                       cont_sizes |=3D cont_blk_size;
> +       }
> +
> +       /*
> +        * l1_blk_size is only set in pgsize_bitmap if level-1 blocks are
> +        * supported for this granule (not 16K/64K, per
> +        * arm_lpae_restrict_pgsizes()), so no extra gating is needed her=
e.
> +        */
> +       if (cfg->pgsize_bitmap & l1_blk_size) {
> +               cont_l1_blk_size =3D arm_lpae_num_cont(l1_blk_size) * l1_=
blk_size;

Our AI model is saying that this might overflow cont_l1_blk_size on 32
bit platforms i.e. 16 * 1G doesn't fit into a 32 bit type. It says
that cont_l1_blk_size will be truncated to 0, and
arm_lpae_cont_size_fits() then calls ilog2(0) which is undefined.

> +               if (arm_lpae_cont_size_fits(cfg, cont_l1_blk_size))
> +                       cont_sizes |=3D cont_l1_blk_size;
> +       }
> +
> +       return cont_sizes;
> +}
[...]
> @@ -660,6 +829,8 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgt=
able *data,
>  {
>         arm_lpae_iopte pte;
>         struct io_pgtable *iop =3D &data->iop;
> +       size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> +       int num_cont =3D arm_lpae_num_cont(block_size);
>         int i =3D 0, num_entries, max_entries, unmap_idx_start;
>
>         /* Something went horribly wrong and we ran out of page table */
> @@ -674,10 +845,22 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_p=
gtable *data,
>                 return 0;
>         }
>
> +       /*
> +        * Normalize an exact whole-CONT-group request down to the
> +        * equivalent block_size/pgcount, mirroring __arm_lpae_map().
> +        */
> +       if (!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) &=
&
> +           num_cont > 1 && size =3D=3D block_size * num_cont) {
> +               pgcount *=3D num_cont;
> +               size =3D block_size;
> +       }
> +
>         /* If the size matches this level, we're in the right place */
> -       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> +       if (size =3D=3D block_size) {
> +               size_t cont_size =3D num_cont * block_size;
> +
>                 max_entries =3D arm_lpae_max_entries(unmap_idx_start, dat=
a);
> -               num_entries =3D min_t(int, pgcount, max_entries);
> +               num_entries =3D min_t(size_t, pgcount, max_entries);
>
>                 /* Find and handle non-leaf entries */

This comment is no longer accurate. The handling now extends beyond
non-leaf entries.

>                 for (i =3D 0; i < num_entries; i++) {
> @@ -687,6 +870,40 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pg=
table *data,
>                                 break;
>                         }
>
> +                       /*
> +                        * A real CONT group must always be invalidated a=
s a
> +                        * unit, so reject an unmap that splits one. Chec=
k the
> +                        * PTE's own CONT bit rather than the caller's si=
ze,
> +                        * since a legitimate unmap can span multiple pri=
or
> +                        * iommu_map() calls and its size alone doesn't s=
ay how
> +                        * the underlying PTEs were grouped. Only the fir=
st and
> +                        * last entries can straddle a group boundary; an
> +                        * interior CONT-tagged entry's group is necessar=
ily
> +                        * fully covered by this unmap, since groups can'=
t
> +                        * overlap without also covering everything betwe=
en
> +                        * them.
> +                        */
> +                       if (pte & ARM_LPAE_PTE_CONT) {
> +                               bool ok =3D true;
> +
> +                               if (i =3D=3D 0)
> +                                       ok =3D ok && IS_ALIGNED(iova, con=
t_size);
> +                               if (i =3D=3D num_entries - 1)
> +                                       ok =3D ok && IS_ALIGNED(iova + (i=
 + 1) * block_size,
> +                                                             cont_size);
> +
> +                               /*
> +                                * Stop short of this entry instead of re=
turning
> +                                * 0: entries before i may already have h=
ad
> +                                * non-leaf sub-tables torn down above, s=
o the
> +                                * caller needs the real unmapped count, =
and the
> +                                * loop exit below still clears/gathers e=
ntries
> +                                * [0, i) correctly.
> +                                */
> +                               if (WARN_ON_ONCE(!ok))

Consider aligning with the following WARN_ONCE in the same function:

WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");

> +                                       break;

I think this behavior is inconsistent: when a problem is detected at
the beginning of the unmap range, you return without modifying the
table, whereas if it's detected at the end, the code proceeds with
unmapping and leaves the table misconfigured. Could these checks be
performed before entering the loop?

> +                       }
> +
>                         if (!iopte_leaf(pte, lvl, iop->fmt)) {
>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
>

