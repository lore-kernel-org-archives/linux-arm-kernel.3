Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC7EC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 05:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0Kj0yc9XxyPL81uujyygKc80rtEnUflq8odLifFS04=; b=NYT3mMAJRxiTk7VFUv6D+CjMRp
	zluLQFVSq81VQHu1YbyukVFS/v2ZU2u25CN9vd1alSXMSTd6smxlnkI7oOR4RMV78HXZ2Km1/Ni6S
	UdC5aW2auVYNJo21VCFOOuHS8iZ+rb8hBdWmSmQK1GKTPtkE29azZYx22vjiCV3xEqqYgRi+j959+
	remdAIqDKmuZybXNhNXmziDXx3YqO0dXnMl2nuidft+B+G1hqzwdEZCEARkFvBOCfsBx4rOfafDtp
	jgMRZI/S8GRORuL+5mAuQOKmtPsJ+7UG3NJWl9GodKdYUDhKT8EeJCqRJmamVJU+YAXqpzpOtXmAW
	NPtr6pJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtefF-0000000DIhL-3q3h;
	Tue, 11 Aug 2026 05:04:37 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtefD-0000000DIgy-2Eid
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 05:04:37 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51c01c79467so106941cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 22:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786424673; cv=none;
        d=google.com; s=arc-20260327;
        b=TbseC6ZqxEIbGMuJwWOfx4uUXbBU4l0+b6+KQfQMGkBlgf8YxwdwuFK9OOXspbKW9m
         Tfwl5G4sUqyxIcvdQB11RAgs0BE1tiptv7d53RQR9/H6wp4kgdj+kvPgCBoDLu3i/h5S
         mD65ic7hjfR0o2XqGIlye384KZ3B8Xx/8M0H6O/f0YevSII//n23+ZyrjdAWaX5EV7Gg
         2P9xtqSI5Zrsb+R4TwPNxPCNSvBKp/GjdKLnygxT6ZPNyGY7lbSGv9qzTFrj9Td/5Bdq
         hdXKU6McPeZMPbZZ5PfiAyO2s+py25BXQZeCTP/GmxJbLcRNkH8UPRRb0IqZhemoV0fF
         rwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0Kj0yc9XxyPL81uujyygKc80rtEnUflq8odLifFS04=;
        fh=PqPazRrrdbDnhF1jOQ5mHXAKvuQvMyM0tLu1R7RI1Lg=;
        b=hXrkNnC/5XDr0jfQ7z+oPYbImE6IJsFopZ5c9AcEG/AVKxDCoTjdTF4BKYbx0kswnZ
         YxH9AosvSLpXyiUX5N+7Tc85gwLKEjkqY7xP+GA9Rjcio57F5VnFANYL/pK7H3kNTAzg
         lgJ0TNPgYvUNLZGffPEntyKpTp27JXKLcz/kHNC5OpTQJ3yDTc+PJ7rg9eCm/ryOSikQ
         lJwcT2B1/MG43lVkz8oyrpY+xEs6+iXekk1RhUKRAc+gGaIt71vEIYGB9IYsa/DMKAgM
         nC5Yl/a5YJJ+1VvBRDRsH7nZmhGYGXPOG8BAkeExAej8U8+KGyLHZix+djcR9h4p+Q9Q
         hYrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786424673; x=1787029473; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l0Kj0yc9XxyPL81uujyygKc80rtEnUflq8odLifFS04=;
        b=mIAO6RdND8AzkgVDAJLeXmBDcHRtGp/ZRTchaXZEps51Npsv2NipS4I0yUwbaStXqH
         brXyIdjoInZVAgP4g/xrsmM6qEoyqT1koJlywNPeot172GDA69bBzPcYaOsDk5ApKh32
         UKKiMDS0yO6YT71cYLZEkew4Sp97EJtNqGaRNDf/0KdjdclkwdFshFrarnF3pE0ybGn/
         ft75sU3r8PG/4ZrQk6Yqgoa1WPc8d3VQjFybw47tXhAZqvbsRtZg4OuPGTEXkraiHwYA
         FGRB9hLCm81LMiX0usfwwnfbSaqdKeda0Je5WL51mx+D0xkK94Ie0XPyn8dJkMDfWjgd
         AorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424673; x=1787029473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0Kj0yc9XxyPL81uujyygKc80rtEnUflq8odLifFS04=;
        b=lkIDpksKonh5plq5x3xDMr2+2VRAGwfeu4dcbqh2Bg8TuOSQAueVyvVaSsiBxutLXM
         CO2ZVXQwT+fDcZ/XTnYL86XIhLVSCAy2ydfAkIZ+fC9EGyWXvyvlY53oSUf6JkLCUZ28
         Lb/r0bBzZPwR1AXtWu/NASolevmmho5hl6c9h+e7Xu0mFYRFGSmotFREmTMxcN75VbsO
         GCekxCQZ3sjvLERRpIlwoKxXK8JxsKq1PbOg0VgYxEGPdTLLCGcO8YELX/dD68t7YAu1
         vDOVAHPfYiFzUVX6/tWfIxWVY07qgKqBalxmKXOuJ491MUHrrvxI07NoUDgXSxAT+Msx
         D6lA==
X-Forwarded-Encrypted: i=1; AHgh+RoBU5dF4FOpsuy21hj6b30kJjwEX7vEGEaVVqHvEXqYeY1sSUv80jxl3bWF085Fubaccqtq5a69j/64A1OPLIwI@lists.infradead.org
X-Gm-Message-State: AOJu0YwNm7ubMvLTOTejeuWX7wzdz9LqMYnwL6tPad1Hct/kxktbJF00
	HPmqwbP3uKOY7gu5Qz2RzyjGWeQjMVpWp/1J6hqgUr6jd+QhgXVlnSEmXpKfZv/xjnPmS7j5bRT
	7IxTx6XhyrFweqcYV8OYj146qqea59oFT/tnFF4Ez
X-Gm-Gg: AR+sD12X6vZoCAkf6Nz2iuHBocytAJJTd14f//9lSmJbDZH7zEc7TLQP/EJZmQVrzB9
	rmTHphqe9MIGQbSAr/UfK8Fx+k/usVSEG1DvAEVFliRJYkm2VcbNh/Ju7Eh4j7dOKNW4YrcfPzF
	Qa6ad+Ep0QHnQ6TUSOl8B5cFn5PxLmCdZdzsnNoWTa46vjNL1c/5sv8esmTjadXJLKxGRWEJ+BH
	U5Tr2WVeGgwMIsGsJ+ZJ0PjJtEyH++sVQEBPUD81sgeF7cJmfrnoHWdjsf1d1DO73UhrautXoM5
	z7kr7yKFBuU9P6cTwLbkF5eEDAUtFVrd47FWdZzN5A==
X-Received: by 2002:ac8:7fc9:0:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-52d58236f99mr2540931cf.12.1786424672376; Mon, 10 Aug 2026
 22:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
In-Reply-To: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Mon, 10 Aug 2026 22:04:20 -0700
X-Gm-Features: AUfX_mz1Q0EQxjJGjo9fyY36FF5Mbr8Jb4EcjiIK9bRp6c3Ih6EjCsTWhRnEfds
Message-ID: <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>, 
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_220435_622739_EE9F5689 
X-CRM114-Status: GOOD (  34.14  )
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
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-ar=
m.c
> index 476c0e25631af..23a238de53ed5 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> [...]
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

bits_per_level is also calculated in arm_lpae_alloc_pgtable(). I'm
wondering if we can somehow re-use that value, although, I do
understand that data->bits_per_level is only populated later.

> +       pg_size =3D 1UL << pg_shift;

In arm_lpae_restrict_pgsizes(), they call the same value "granule".
Can we align with that and call it granule instead of pg_size?

> +       blk_size =3D pg_size << bits_per_level;

I'm wondering if we can re-use the macro ARM_LPAE_BLOCK_SIZE. I do
acknowledge, though, that this macro doesn't work in this context,
because (d)->bits_per_level is still not populated.
Also, for consistency, you might want to call this l2_blk_size.

> +       l1_blk_size =3D blk_size << bits_per_level;
> +
> +       cont_leaf_size =3D arm_lpae_num_cont(pg_size) * pg_size;
> +       if ((cfg->pgsize_bitmap & pg_size) &&

Is (cfg->pgsize_bitmap & pg_size) ever false?

[...]

> +/*
> + * Install num_entries leaf entries starting at ptep (index map_idx_star=
t
> + * within the current table), tagging arm_lpae_num_cont()-sized groups w=
ith
> + * the contiguous hint where both idx and paddr are aligned to the group
> + * size. Entries in a misaligned group are installed without the hint.
> + *
> + * idx and paddr both advance by block_size per entry, so their alignmen=
t
> + * relative to the group size is invariant across a run of entries withi=
n
> + * this call: once a group qualifies (or fails to), every later whole gr=
oup
> + * does too, up to num_entries. This merges each such run into a single
> + * arm_lpae_init_pte() call instead of one call per group.
> + */

Can you provide an example for when this function installs descriptors
where the contiguous bit is only set on a subset of them. I would
assume that the contiguous bit is either set for all descriptors or
none of them.

> +static int arm_lpae_install_leaf(struct arm_lpae_io_pgtable *data,
> +                                unsigned long iova, phys_addr_t paddr,
> +                                arm_lpae_iopte prot, int lvl,
> +                                int map_idx_start, int num_entries, int =
num_cont,
> +                                arm_lpae_iopte *ptep, size_t *mapped)
> +{
> +       size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> +       size_t cont_size =3D num_cont * block_size;
> +       int done =3D 0;
> +
> +       while (done < num_entries) {
> +               int idx =3D map_idx_start + done;
> +               int remaining =3D num_entries - done;
> +               int off =3D idx % num_cont;
> +               arm_lpae_iopte pte =3D prot;
> +               int chunk, ret;
> +
> +               if (off) {
> +                       /* Misaligned prefix: advance to the next boundar=
y */
> +                       chunk =3D min_t(int, num_cont - off, remaining);
> +               } else if (remaining >=3D num_cont && IS_ALIGNED(paddr, c=
ont_size)) {
> +                       /* Aligned: merge every full group in this run */
> +                       chunk =3D remaining - remaining % num_cont;
> +                       pte |=3D ARM_LPAE_PTE_CONT;
> +               } else {
> +                       /*
> +                        * Aligned idx but paddr doesn't line up with con=
t_size,
> +                        * or too short for a full group. That holds for =
the
> +                        * rest of this call too, so install the remainde=
r
> +                        * plain in one go.
> +                        */
> +                       chunk =3D remaining;
> +               }
> +
> +               ret =3D arm_lpae_init_pte(data, iova, paddr, pte, lvl, ch=
unk, ptep);
> +               if (ret)
> +                       return ret;
> +
> +               *mapped +=3D chunk * block_size;
> +               ptep +=3D chunk;
> +               iova +=3D chunk * block_size;
> +               paddr +=3D chunk * block_size;
> +               done +=3D chunk;
> +       }
> +
> +       return 0;
> +}
> +
>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned lon=
g iova,
>                           phys_addr_t paddr, size_t size, size_t pgcount,
>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *p=
tep,
> @@ -462,21 +608,44 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtabl=
e *data, unsigned long iova,
>         size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
>         size_t tblsz =3D ARM_LPAE_GRANULE(data);
>         struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
> -       int ret =3D 0, num_entries, max_entries, map_idx_start;
> +       bool cont_hint_enabled =3D !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_N=
O_CONT_HINT);
> +       int num_entries, max_entries, map_idx_start;
> +       int num_cont =3D cont_hint_enabled ? arm_lpae_num_cont(block_size=
) : 1;
> +       bool use_cont =3D cont_hint_enabled && num_cont > 1;
>
>         /* Find our entry at the current level */
>         map_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
>         ptep +=3D map_idx_start;
>
> +       /*
> +        * Normalize an exact whole-CONT-group request down to the
> +        * equivalent block_size/pgcount so it funnels through the same
> +        * leaf path below. arm_lpae_install_leaf() independently decides=
,
> +        * per sub-chunk, whether the CONT hint actually applies.
> +        */
> +       if (use_cont && size =3D=3D block_size * num_cont) {
> +               pgcount *=3D num_cont;
> +               size =3D block_size;

This appears to me as if you're throwing away information about
whether this mapping request is suitable for the contiguous bit, and
then in arm_lpae_install_leaf(), you're trying to recover that
information. Can't you just do "prot |=3DARM_LPAE_PTE_CONT" here and
then completely avoid the logic in arm_lpae_install_leaf?

> +       }
> +
>         /* If we can install a leaf entry at this level, then do so */
>         if (size =3D=3D block_size) {
> +               int ret;
> +
>                 max_entries =3D arm_lpae_max_entries(map_idx_start, data)=
;
> -               num_entries =3D min_t(int, pgcount, max_entries);
> -               ret =3D arm_lpae_init_pte(data, iova, paddr, prot, lvl, n=
um_entries, ptep);
> -               if (!ret)
> -                       *mapped +=3D num_entries * size;
> +               num_entries =3D min_t(size_t, pgcount, max_entries);
>
> -               return ret;
> +               if (!use_cont) {
> +                       ret =3D arm_lpae_init_pte(data, iova, paddr, prot=
, lvl,
> +                                               num_entries, ptep);
> +                       if (!ret)
> +                               *mapped +=3D num_entries * size;
> +                       return ret;
> +               }
> +
> +               return arm_lpae_install_leaf(data, iova, paddr, prot, lvl=
,
> +                                            map_idx_start, num_entries,
> +                                            num_cont, ptep, mapped);

