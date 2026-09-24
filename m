Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03080C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAXAvIz7zlOWq5JW1V29jLS6pvvcRbCsb7OX7n/liA4=; b=uqr8NuS7PfT2pFIyiCRVKrCCm1
	EVNyBqu8TRG6+UEQtm4w7Xawi8BD6AGSnvjK3qvvTGVX0Wep9iX1z/8fze/re6D3LQpwQIYrFtSkf
	w7Ff94I+YCnBKdvWUgzBg4lDDKZ8dyBCZfce8+0SuXgo9EeZbns3bdJ0IFoSq5QLvJznE5hR+pHW0
	qesj7+/K/q47rerBvMyiq2dSsY5POk2RHokhl48bz4fuLy2QDlE+EYyC4A5qGHQuSZyPqri2P3ohK
	DUaWgxewkXl9S/qs/uGzE5HGZpr9pPmSIQmm+yIRm6i/vUSJmU5Y2Gn7zaR00FuZnX20KbGGA7Uam
	DaogD5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qBA-0000000C9ET-3h6Y;
	Thu, 24 Sep 2026 20:36:28 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qB8-0000000C9E6-0BJZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:36:27 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-532e9ad9a1eso84421cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790282185; cv=none;
        d=google.com; s=arc-20260327;
        b=ItxIWK++ZAdeIF8lyikF9YDAJcWzacb4DO9MpIeA2/xRkRX1ICDBgOIymXnbUFfszM
         Pvk7rFlz6anbvJvrlsl3xjWUF7dAlXCzjdZyF45/M0lN7Pqv2WjOqm9gcNcH+KbaluFo
         +K+BsEGyAGY+dbJrECDvj0ZlMLWvLExn6Jd7+3Us0lNA3bmHBfUmq7euy1hcJgu/C2ZU
         Q6jQUySQplS4bDRZT+KB5D3Jnm0BGXL0zzQAcfcwXotvfU4MKz4d6JyevZTIQvl/aPeE
         BvfpepdDWaO8WjbOyqaD3O9SgNQjti+4pSEL46BH4yHxYBsD430Xhc2dM1JZLSYE45TK
         lKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAXAvIz7zlOWq5JW1V29jLS6pvvcRbCsb7OX7n/liA4=;
        fh=m715FjFr3eEkWherAK0KEmkzPmLYly5+8uzaC9iKt+U=;
        b=ryF8S8Arm8jZGxIAuZGFMk5yjlgWwafW94ZZv8wwDL+/DEzY7FTrdq6CtHtxAMV3NW
         yxC6PhuxeAhnYKiEZ1J9gI14XJHWntZKI+yxNtUfzViBW6ZomUO4yDm2BbQ9SKeV/O0F
         DCvwK/NqcbSlsDsM/6d9Auxie6drvlW0TGR3eh0pyZCTSqGjw8fEKzNxJCxWtXBy00D2
         WgqPDKltOaCRIhrFzhnfJtz+WhhjwdRaHwi7vxBsRPt+jpnvPtquDoY9mVRi4PUQyrPo
         lGREhbkyNGO125VAbGcEyq9zQ2ivWfyfwEomUS99wP1U/c5aAj/Fph1o5sNaruQPlNtr
         EQrQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790282185; x=1790886985; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pAXAvIz7zlOWq5JW1V29jLS6pvvcRbCsb7OX7n/liA4=;
        b=p5IsjqPBgMEU1V1n7P5KIrDtvT7/OzO+oGC8MpyktdQGDhwDHdaymnyGyaclLwINSY
         6EYgKCvLbN//cHry/lzWFyIeo3v4VmW0gu53b+1iJSV6ykgdTp9k5J0Fykq593CPrwEK
         Rpnj7NI60NEQCyKUI9JyiU9STJTDCjdIfe05fQtja2S+sR6wyAQ27tcviUcZO4uNeuyR
         H/Q+cv8lOEVo+a/+Yae6ziKhslHdXeYlmOR+7CFJNt1ugyXs9svDJ4AogNGsZjynqZNj
         ZLMpFpW/wlqxgjuaAA0HGv9XUvi01AgT32eeLpdPbR4t9oV/q8lSkXUmk4mxsbMR/5dU
         fiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282185; x=1790886985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAXAvIz7zlOWq5JW1V29jLS6pvvcRbCsb7OX7n/liA4=;
        b=Pgdn67hqiUACOeJPTfeta2K6kQOMC4gEnX/3ewkW1Uq7CZcqhXJAgnkzK05hHArXgP
         hfIVRy7SECRDV69x/ARBgPCpWLfpkDLU0zPjlWiLtyb7q2WEwOtL5yoS0vLItIl/7TwG
         J82vcNT0HBVyWlz3p0XoFXz26YW5EITucjhxLmxgtmw43HiJiqVOv0xvgeXj4v3+CV8K
         ZHhznMwXpJocgx1TpRmOcTKvskwha2atoFBX4Sz4Eyb0WV0Iw+zmY9OM24YSzfg8nTMc
         QhpIjLqCoavR4AE7lERu22hVWAEwMjDyPQDsvBwjpGPgSXCfDATRFHg/BKi2j3zeC7AD
         fOpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8UQeYS9myQfDFS7GvqNTdLmN3RPHftU8C62ysh57KXvgFpniR81rgPe8u+xw6dMfWnkVpUuBXwusT6GjPl3oF@lists.infradead.org
X-Gm-Message-State: AFuF++mZaj2aaBStesLirR0j8AUMFtGIn9XXG+aP6V+BUJ113YbPg/oK
	ScemFzMVSpaXZcY0SFjcaXmxoEYdMgUdn7iudcPpunQJvLOBFjaDNbDyEu8PHuXol9WLIV7DRa5
	AR8tSF2mdY5KpeNak5HvbwexyS8qVPQFCZ1fvmSn77Y4C7Bofxhq8S05jTUs=
X-Gm-Gg: AYBFou1TfCxmPpfNiRq/208Hlu770WiZQ3AMqVhv4VSS0AX3Zz13kMdJNdzoNOP8xf1
	hwN9rpPYWmEH7HCbmielGL+uVBlGIwuoUATHfcak0Gqp/ZnoVBjtv4hbJX3uQpReT/RXqBiOhxI
	8CU6KpmAusFQp3FV0LT6W6UvfpeI4HQAIfmBmQ+S5PTDM2h2XMKGM0M6JAChYNcUdRamgSGbKhm
	ebm9h2nUAljK0v8PM/4oTCI9tJbjQeAgAoqGzw8vWaiXxxPQLEeUXbajjcYIsdizfLdfP0I272W
	sAvMeAgGcAohOS6HqDQaVElVjCi+kLCtnNca+HG/h1wN+OdzFttW
X-Received: by 2002:a05:622a:c2:b0:532:d72d:3e9c with SMTP id
 d75a77b69052e-5330c0eb219mr1811851cf.6.1790282183927; Thu, 24 Sep 2026
 13:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
In-Reply-To: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Thu, 24 Sep 2026 13:36:12 -0700
X-Gm-Features: AclHuK9Edhkw7dI8hy3s30oHjoVQuRqWKT854I2fNS_opd9KtYkgWbWonloZqbA
Message-ID: <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_133626_118300_A05A9755 
X-CRM114-Status: GOOD (  35.00  )
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

On Mon, Sep 21, 2026 at 4:44=E2=80=AFAM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-ar=
m.c
> index 476c0e25631af..01d98959c514f 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -86,6 +86,21 @@
>  /* Software bit for solving coherency races */
>  #define ARM_LPAE_PTE_SW_SYNC           (((arm_lpae_iopte)1) << 55)
>
> +/* PTE Contiguous Bit */
> +#define ARM_LPAE_PTE_CONT              (((arm_lpae_iopte)1) << 52)
> +
> +/*
> + * Contiguous hint group sizes per granule:
> + *
> + *------------------------------------------------------------------
> + *| Page Size | CONT PTE |  Block  | CONT Block | L1 Block | CONT L1 |
> + *------------------------------------------------------------------
> + *|     4K    |   64K    |   2M    |    32M     |    1G    |   16G   |
> + *|    16K    |    2M    |  32M    |     1G     |          |         |
> + *|    64K    |    2M    | 512M    |    16G     |          |         |
> + *------------------------------------------------------------------
> + */

I find this comment redundant. People can find this information in the
Arm architecture specification.

> +static int arm_lpae_num_cont(size_t size)
> +{
> +       switch (size) {
> +       case SZ_4K:
> +       case SZ_2M:
> +       case SZ_1G:
> +               return 16;

I'm thinking that if you use something like

return BITS_PER_TYPE(size_t) >=3D 64 ? 16 : 1

i.e. return 16 only on 64 bit platforms, then you can avoid those
overflow checks in various places. Same for the SZ_512M cases.

> +       case SZ_64K:
> +       case SZ_32M:
> +       case SZ_512M:
> +               return 32;
> +       case SZ_16K:
> +               return 128;
> +       default:
> +               return 1;
> +       }
> +}
> +
>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned lon=
g iova,
>                           phys_addr_t paddr, size_t size, size_t pgcount,
>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *p=
tep,
> @@ -462,20 +495,41 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtabl=
e *data, unsigned long iova,
>         size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
>         size_t tblsz =3D ARM_LPAE_GRANULE(data);
>         struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
> -       int ret =3D 0, num_entries, max_entries, map_idx_start;
> +       int num_cont =3D arm_lpae_num_cont(block_size);
> +       size_t cont_size =3D 0, entries_per_map;
> +       int num_entries, max_entries, map_idx_start;
> +       bool cont =3D false;
> +
> +       if (num_cont > 1 && block_size <=3D SIZE_MAX / num_cont)
> +               cont_size =3D num_cont * block_size;
>
>         /* Find our entry at the current level */
>         map_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
>         ptep +=3D map_idx_start;
>
>         /* If we can install a leaf entry at this level, then do so */
> -       if (size =3D=3D block_size) {
> +       if (size =3D=3D block_size ||
> +           (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) &&

I'm thinking that the check for IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT is
redundant. If this quirk is active, none of the contiguous sizes were
advertised, so no one should call this function with any of the
contiguous sizes.

> +            size =3D=3D cont_size)) {
> +               int ret;
> +
> +               cont =3D size =3D=3D cont_size;
> +               if (cont && (!IS_ALIGNED(iova, size) || !IS_ALIGNED(paddr=
, size)))

These alignment checks are also redundant. We can rely on the caller
to pass properly aligned values. It's also inconsistent, because it
verifies alignment only for contiguous sizes.

> +                       return -EINVAL;
> +
> +               entries_per_map =3D size / block_size;

Can't you just do

pgcount *=3D num_cont;

Wouldn't that be easier?

>                 max_entries =3D arm_lpae_max_entries(map_idx_start, data)=
;
> -               num_entries =3D min_t(int, pgcount, max_entries);
> -               ret =3D arm_lpae_init_pte(data, iova, paddr, prot, lvl, n=
um_entries, ptep);
> +               num_entries =3D min_t(size_t, pgcount,
> +                                   max_entries / entries_per_map) * entr=
ies_per_map;
> +               if (!num_entries)
> +                       return -EINVAL;

I believe this check is also redundant. Can we remove it?

> +               if (cont)
> +                       prot |=3D ARM_LPAE_PTE_CONT;
> +
> +               ret =3D arm_lpae_init_pte(data, iova, paddr, prot, lvl,
> +                                       num_entries, ptep);
>                 if (!ret)
> -                       *mapped +=3D num_entries * size;
> -
> +                       *mapped +=3D num_entries * block_size;
>                 return ret;
>         }
>
> @@ -660,12 +714,18 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_p=
gtable *data,
>  {
>         arm_lpae_iopte pte;
>         struct io_pgtable *iop =3D &data->iop;
> +       size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> +       int num_cont =3D arm_lpae_num_cont(block_size);
> +       size_t cont_size =3D 0, entries_per_map;
>         int i =3D 0, num_entries, max_entries, unmap_idx_start;
>
>         /* Something went horribly wrong and we ran out of page table */
>         if (WARN_ON(lvl =3D=3D ARM_LPAE_MAX_LEVELS))
>                 return 0;
>
> +       if (num_cont > 1 && block_size <=3D SIZE_MAX / num_cont)
> +               cont_size =3D num_cont * block_size;
> +
>         unmap_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
>         ptep +=3D unmap_idx_start;
>         pte =3D READ_ONCE(*ptep);
> @@ -675,9 +735,27 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pg=
table *data,
>         }
>
>         /* If the size matches this level, we're in the right place */
> -       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> +       if (size =3D=3D block_size ||
> +           (!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) =
&&

Checking for IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT is redundant. Can we remove =
it?

> +            size =3D=3D cont_size)) {
> +               entries_per_map =3D size / block_size;
>                 max_entries =3D arm_lpae_max_entries(unmap_idx_start, dat=
a);
> -               num_entries =3D min_t(int, pgcount, max_entries);
> +               num_entries =3D min_t(size_t, pgcount,
> +                                   max_entries / entries_per_map) * entr=
ies_per_map;
> +               if (!num_entries)
> +                       return 0;
> +
> +               /*
> +                * A CONT group must be invalidated as a unit. Reject a r=
equest that
> +                * starts or ends inside a tagged group before changing a=
ny PTEs.
> +                */
> +               if ((READ_ONCE(*ptep) & ARM_LPAE_PTE_CONT &&
> +                    !IS_ALIGNED(iova, cont_size)) ||
> +                   (READ_ONCE(ptep[num_entries - 1]) & ARM_LPAE_PTE_CONT=
 &&
> +                    !IS_ALIGNED(iova + num_entries * block_size, cont_si=
ze))) {
> +                       WARN_ONCE(true, "Unmap of a partial CONT IOPTE gr=
oup is not allowed");
> +                       return 0;
> +               }
>
>                 /* Find and handle non-leaf entries */
>                 for (i =3D 0; i < num_entries; i++) {
> @@ -691,7 +769,8 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgt=
able *data,
>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
>
>                                 /* Also flush any partial walks */
> -                               io_pgtable_tlb_flush_walk(iop, iova + i *=
 size, size,
> +                               io_pgtable_tlb_flush_walk(iop,
> +                                                         iova + i * bloc=
k_size, block_size,
>                                                           ARM_LPAE_GRANUL=
E(data));
>                                 __arm_lpae_free_pgtable(data, lvl + 1, io=
pte_deref(pte, data));
>                         }
> @@ -702,9 +781,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pg=
table *data,
>
>                 if (gather && !iommu_iotlb_gather_queued(gather))
>                         for (int j =3D 0; j < i; j++)
> -                               io_pgtable_tlb_add_page(iop, gather, iova=
 + j * size, size);
> +                               io_pgtable_tlb_add_page(iop, gather,
> +                                                       iova + j * block_=
size, block_size);
>
> -               return i * size;
> +               return i * block_size;
>         } else if (iopte_leaf(pte, lvl, iop->fmt)) {
>                 WARN_ONCE(true, "Unmap of a partial large IOPTE is not al=
lowed");
>                 return 0;
> @@ -943,8 +1023,23 @@ static void arm_lpae_restrict_pgsizes(struct io_pgt=
able_cfg *cfg)

I want to re-iterate what I wrote earlier: I think we should change
this function's name. This is what our AI model has to say:

Originally, arm_lpae_restrict_pgsizes() performed a purely monotonic reduct=
ion:

  1. Identified the translation granule (e.g. matching CPU PAGE_SIZE).
  2. Performed a bitwise-AND (cfg->pgsize_bitmap &=3D page_sizes) to
discard non-granule sizes.
  3. Clamped ias and oas.

With this commit, it now:

  1. Restricts to the base granule sizes (&=3D page_sizes).
  2. Expands the bitmap with synthesized contiguous sizes (|=3D num_cont * =
size).
  3. Restricts again against ias and oas (&=3D GENMASK_ULL(...)).

Calling a function ..._restrict_... when it actively synthesizes and
injects new page sizes violates the principle of least astonishment.

>         }
>
>         cfg->pgsize_bitmap &=3D page_sizes;
> +       if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT)) {
> +               unsigned long sizes =3D cfg->pgsize_bitmap;
> +
> +               while (sizes) {
> +                       unsigned long size =3D BIT(__ffs(sizes));
> +                       int num_cont =3D arm_lpae_num_cont(size);
> +
> +                       if (size <=3D ULONG_MAX / num_cont)
> +                               cfg->pgsize_bitmap |=3D num_cont * size;
> +                       sizes &=3D ~size;
> +               }
> +       }
> +
>         cfg->ias =3D min(cfg->ias, max_addr_bits);
>         cfg->oas =3D min(cfg->oas, max_addr_bits);
> +       cfg->pgsize_bitmap &=3D GENMASK_ULL(cfg->ias, 0);
> +       cfg->pgsize_bitmap &=3D GENMASK_ULL(cfg->oas, 0);
>  }

Gemini added the following. I have to admit, though, that I'm not
familiar enough with dirty bit tracking to determine if this is a real
concern.

Interaction with Hardware Dirty Tracking (IO_PGTABLE_QUIRK_ARM_HD)

When Hardware Dirty Tracking (ARM_LPAE_PTE_DBM) is enabled on Stage-1 table=
s:
 * In visit_dirty() / arm_lpae_read_and_clear_dirty(), dirty bits are
queried and cleared on a page-by-page granularity
(iopte_set_writeable_clean(ptep)).
 * If a single 4KB page within a 64KB CONT group is marked clean while
neighboring pages remain marked dirty/writeable, the descriptors in
that group will differ in access permissions (AP[2]).
 * According to Arm ARM D8.3.1, all descriptors in a contiguous block
must share identical permissions and attributes. If dirty tracking is
active on a domain, consider whether IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
should be set or whether CONT sizes should be suppressed when
IO_PGTABLE_QUIRK_ARM_HD is active.

