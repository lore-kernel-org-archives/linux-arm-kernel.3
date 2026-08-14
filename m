Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ECFC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=at1k/9Z9ZhmcftbemOkXe7Ys6/+ROo6SJwW0LU1Rb54=; b=urHogazwFoD9giaQuI+Gnp+hqA
	B6qKVWmzJiPXG5XedA7o4TwPLNoPbWKZf6tdH1sVVUY/1wblyiertc3U7U9eYX+fsnhf2fyAboItH
	zMPoTnvQqp4SCfBSmRyQ8o7UJE+2UU78Q8WW1bKCZIrDPwzQvGRY+5oav02GESpG158R/I04U8AX+
	WyKu5g1oUGD0JhcHJnou78zpbEqujRsjNFaiFeV/eHMCIjhbVpgzpyxST8nTlzWODrV5ZhXxEVnnO
	L4h801ikUwo2xkNplNpC+lm24eoTr5ZQP82av/XhUbYG1J73rr4+FMAmhyCpJsrU1nbo8urPhun4Q
	4siXhasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuymm-00000003Agq-3tbx;
	Fri, 14 Aug 2026 20:45:52 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuymk-00000003Afb-33M1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:45:52 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-51c15a5b265so357491cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 13:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786740348; cv=none;
        d=google.com; s=arc-20260327;
        b=hyklO7U8EB8/MraF4/PvO1eyeTwR0f+etdaGXxNdTaMUK6083BTswPgkG2zv8zf2Ju
         S+Rdi1et83B/Qh5isWkUZ4Cf4LwjlE2ZrESah4C5HVH6nFGymltSJqrgBdq7KAXDPNBP
         4pEVrSjqMI+3kxs36CtDqRbgCY5rGpZ7B41BGW4bR0hTcx1+1uiNbf1Db3xowKIqVa+U
         A5wR6Ydr00QuO6tFjkU2/yCaZcLPBb4EqybLGarIMSOORMFO9mfloZUdZSruo//45vM2
         KfAOYFmT2mkzGtchOsljZRwYfbwjBuRdPMFspKYo6lLHieDbS/w7+fSJqHQ1J1Pl6PiX
         V9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=at1k/9Z9ZhmcftbemOkXe7Ys6/+ROo6SJwW0LU1Rb54=;
        fh=7aS0yvr7Iv95eGgLSgSwTvNoyeLSRaamln/KbaQ7kCY=;
        b=EN5kPrto/eXJWof+pY3y3Jzgh2NoPDyqN4qPV7I7yp02VT++00EYp4dc7cdRuyrrFQ
         9rzaZ9SwIpgHvjLEeLbpk28y0zeFzLxZWhwN1jmZjz/ryjSkcpWlJteZsPyLStA7GQhy
         9Uk815fA8RlAwLFKTBSxPRWv8Ya9iHo2rgSQ4EsWZH07Vubmx2vhtWmUmrZZqqDBZXtO
         0OWcQ4HBa8ajCFAMjmHfmX/e8088UC6+Tdb31PwWegxkdabjjBRnKnJR+B0KQDDqGIRV
         RgpARxOomKBv9RCIVavmx6rqX2TEHWsNmUWxAWOShLw8W/OpMxzipgv6YJzBpDepORRi
         IFag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786740348; x=1787345148; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=at1k/9Z9ZhmcftbemOkXe7Ys6/+ROo6SJwW0LU1Rb54=;
        b=lpK5xBiVWC3d7RMiSsoxoMUc9VZvSD3+gzQx1fcNw8ToVnaFUej+uMWzk2Fnmm/E8+
         7GZfScKeyn/8uZpXqmWQUYXKZA4Jm/p5T9M6vYv/GomxWiW8/DJToajJJoTUS33kb2zm
         tminHhwBtHhOUUKfdNW0hszLgfo2hSllJf2lkSibcmUlANbwR7jAcRVDX1cV9+PSCgv5
         aTMzYjuSWFJKaN0Eh0B2WsYTsasd2yOQNrnNNJ83lGu3qapVlOqLdgyKtL5Hbm3nRCJ6
         tXu4QV7dikL9Hw5CpKJQU3MnEE8OrXmlrVXB2KZUCqokNCvy/8zUoR6YZdjfGk6y2ZHh
         E7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740348; x=1787345148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=at1k/9Z9ZhmcftbemOkXe7Ys6/+ROo6SJwW0LU1Rb54=;
        b=R9i7vgnmhC1wsYJyxqu1Pvtqe22nPpkfFABFvCKmnO+sGH09pioolG2xsS5hJ2xg5+
         6HaoBSczgoBP9yoi64ams6T/XGzOeKR1C+5hZZGVlO8Ey3jzuoxqAAq5xlkPqirum0we
         mOKzoKP78w+ha5M4c1nmjsecMG2hNz53w1+5nruwWsezTGhu8J8AnhjKeRZ+UySnmjRa
         jGWbb2qSkr+L08c23FHGib59+lUQT4MmGgscI2VxuwXUOnxR4xwxCdRUrKRulr6Q+qA3
         J1iooef4amBpqC55gwpiH95crZF8jPVb/sxH2CYN4jF+S/HxQrc4Km2c0o29FUj1OqDS
         4zyQ==
X-Forwarded-Encrypted: i=1; AHgh+RojB86hs02Z+V5FPFpyX9FJsSo3fRyLdA7FmQn2qC58roMTox6V95bFY8F09vPvqaQzYgh0hAnng/wJm09w3U/L@lists.infradead.org
X-Gm-Message-State: AOJu0YyHvYiS6WW7yiRQVTM/Fx9Flri9umQEaHEy73WtGS0MdV12wvOh
	1XCb6TKpOCAPApFuCRP96+/qagvyzqQeio8pHOGN5Z+VC4sjcZGfS8bxnqRi7bF692aorhPwjJi
	AJCRvL+ryxREzdCrO1j2CSohs0XWxS4wVtumzUmgW
X-Gm-Gg: AR+sD13qIbMbckOzvNIYv+fV4YBmTm5tTKdONU4INJm7TTjpUoqP7k/lSUUY+WTaYDd
	XVLD0Sm/XGX9fEpXIw+sIly24SGL2yJJqZrQH+hASg4eNcFKQ2K1T+mbZo1vCmIaIjdpRFsP3gl
	5Am2Fom+3rp1dtjrtpbUcOcJBCzjkgYaR67a0Sg26RIwHaAHBI6CDGj6hH2tBwN/wu0MtX/SSia
	VddgV2rvQY5akU9zhv2kZzW87abUPBofINCE88H+rKWyPJEXGl75hXCj033v8nkiyxfOhafCgnC
	gpobNZsRukuSYsfbpNzXKVQirS1qxsAoHV9OdlBcTw==
X-Received: by 2002:a05:622a:620b:b0:527:f08f:56a2 with SMTP id
 d75a77b69052e-52d845c09f5mr27121721cf.8.1786740347730; Fri, 14 Aug 2026
 13:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com> <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
In-Reply-To: <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Fri, 14 Aug 2026 13:45:36 -0700
X-Gm-Features: AUfX_mw7BuTuxcGh8LnvM7gYfz3LaE3KvKBdBRwSQq9-7IAPRVvGMYyqokzfJAo
Message-ID: <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_134551_094777_E280F62B 
X-CRM114-Status: GOOD (  46.83  )
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

On Thu, Aug 13, 2026 at 11:13=E2=80=AFPM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
>
>
>
> On 8/11/2026 10:34 AM, Daniel Mentz wrote:
> > On Mon, Aug 3, 2026 at 11:19=E2=80=AFPM Vijayanand Jitta
> > <vijayanand.jitta@oss.qualcomm.com> wrote:
> >> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable=
-arm.c
> >> index 476c0e25631af..23a238de53ed5 100644
> >> --- a/drivers/iommu/io-pgtable-arm.c
> >> +++ b/drivers/iommu/io-pgtable-arm.c
> >> [...]
> >> +static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *c=
fg)

I'm wondering if we need this function at all. I'm trying to
understand that would happen if we advertise page sizes that cannot
possibly be used given the constraints imposed by cfg->ias and
cfg->oas.
arm_lpae_read_and_clear_dirty() appears to check if the end of the
iova range is out-of-bounds (WARN_ON((iova + size - 1) &
~(BIT(cfg->ias) - 1))), but function arm_lpae_map_pages() appears to
not have such a check.

If we need to restrict the "cont sizes", we could consider Will's
suggestion: Add all the sizes to cfg->pgsize_bitmap in
arm_lpae_restrict_pgsizes, and then subsequently clamp it like so

cfg->pgsize_bitmap &=3D (BIT(cfg->ias) - 1))
cfg->pgsize_bitmap &=3D (BIT(cfg->oas) - 1))

That would be shorter than the 39-line arm_lpae_get_cont_sizes function.

> >> +/*
> >> + * Install num_entries leaf entries starting at ptep (index map_idx_s=
tart
> >> + * within the current table), tagging arm_lpae_num_cont()-sized group=
s with
> >> + * the contiguous hint where both idx and paddr are aligned to the gr=
oup
> >> + * size. Entries in a misaligned group are installed without the hint=
.
> >> + *
> >> + * idx and paddr both advance by block_size per entry, so their align=
ment
> >> + * relative to the group size is invariant across a run of entries wi=
thin
> >> + * this call: once a group qualifies (or fails to), every later whole=
 group
> >> + * does too, up to num_entries. This merges each such run into a sing=
le
> >> + * arm_lpae_init_pte() call instead of one call per group.
> >> + */
> >
> > Can you provide an example for when this function installs descriptors
> > where the contiguous bit is only set on a subset of them. I would
> > assume that the contiguous bit is either set for all descriptors or
> > none of them.
> >
>
> That assumption doesn't hold in general -- it's only true when the
> map request happens to start and end on a cont_size boundary. For an
> arbitrary map_pages() call it usually doesn't.

I believe you won't see arbitrary map_pages() calls. I understand that
these calls are exclusively coming from __iommu_map_domain_pgtbl()
which uses iommu_pgsize() to determine optimal page sizes.

> Example, 4K granule (num_cont =3D 16, cont_size =3D 64K),
> iova =3D paddr =3D 0x1000, pgcount =3D 34:
>
>    - idx 1..15  (off !=3D 0, misaligned prefix):        installed plain
>    - idx 16..31 (off =3D=3D 0, paddr now 64K-aligned):     installed w/ C=
ONT
>    - idx 32..34 (off =3D=3D 0, remaining < num_cont):      installed plai=
n

In the example you provided, I expect that you'll receive three
separate calls from __iommu_map_domain_pgtbl:
 * idx 1..15 with pgsize 4KB
 * one call with pgsize 64KB
 * idx 32..34 with pgsize 4KB

If I took your argument further, I could argue that we'd also have to
check if we can put down a block mapping if iova =3D paddr =3D 0x0 and
pgcount =3D 512, but we're not doing that either.

Could you provide the input parameters to the iommu_map() call that
resulted in the parameters you provided i.e. iova =3D paddr =3D 0x1000,
pgcount =3D 34:

>
> One arm_lpae_install_leaf() call, three chunks, CONT set on only the
> middle one.
>
> >> +static int arm_lpae_install_leaf(struct arm_lpae_io_pgtable *data,
> >> +                                unsigned long iova, phys_addr_t paddr=
,
> >> +                                arm_lpae_iopte prot, int lvl,
> >> +                                int map_idx_start, int num_entries, i=
nt num_cont,
> >> +                                arm_lpae_iopte *ptep, size_t *mapped)
> >> +{
> >> +       size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> >> +       size_t cont_size =3D num_cont * block_size;
> >> +       int done =3D 0;
> >> +
> >> +       while (done < num_entries) {
> >> +               int idx =3D map_idx_start + done;
> >> +               int remaining =3D num_entries - done;
> >> +               int off =3D idx % num_cont;
> >> +               arm_lpae_iopte pte =3D prot;
> >> +               int chunk, ret;
> >> +
> >> +               if (off) {
> >> +                       /* Misaligned prefix: advance to the next boun=
dary */
> >> +                       chunk =3D min_t(int, num_cont - off, remaining=
);
> >> +               } else if (remaining >=3D num_cont && IS_ALIGNED(paddr=
, cont_size)) {
> >> +                       /* Aligned: merge every full group in this run=
 */
> >> +                       chunk =3D remaining - remaining % num_cont;
> >> +                       pte |=3D ARM_LPAE_PTE_CONT;
> >> +               } else {
> >> +                       /*
> >> +                        * Aligned idx but paddr doesn't line up with =
cont_size,
> >> +                        * or too short for a full group. That holds f=
or the
> >> +                        * rest of this call too, so install the remai=
nder
> >> +                        * plain in one go.
> >> +                        */
> >> +                       chunk =3D remaining;
> >> +               }
> >> +
> >> +               ret =3D arm_lpae_init_pte(data, iova, paddr, pte, lvl,=
 chunk, ptep);
> >> +               if (ret)
> >> +                       return ret;
> >> +
> >> +               *mapped +=3D chunk * block_size;
> >> +               ptep +=3D chunk;
> >> +               iova +=3D chunk * block_size;
> >> +               paddr +=3D chunk * block_size;
> >> +               done +=3D chunk;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned =
long iova,
> >>                           phys_addr_t paddr, size_t size, size_t pgcou=
nt,
> >>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte=
 *ptep,
> >> @@ -462,21 +608,44 @@ static int __arm_lpae_map(struct arm_lpae_io_pgt=
able *data, unsigned long iova,
> >>         size_t block_size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> >>         size_t tblsz =3D ARM_LPAE_GRANULE(data);
> >>         struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
> >> -       int ret =3D 0, num_entries, max_entries, map_idx_start;
> >> +       bool cont_hint_enabled =3D !(cfg->quirks & IO_PGTABLE_QUIRK_AR=
M_NO_CONT_HINT);
> >> +       int num_entries, max_entries, map_idx_start;
> >> +       int num_cont =3D cont_hint_enabled ? arm_lpae_num_cont(block_s=
ize) : 1;
> >> +       bool use_cont =3D cont_hint_enabled && num_cont > 1;
> >>
> >>         /* Find our entry at the current level */
> >>         map_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> >>         ptep +=3D map_idx_start;
> >>
> >> +       /*
> >> +        * Normalize an exact whole-CONT-group request down to the
> >> +        * equivalent block_size/pgcount so it funnels through the sam=
e
> >> +        * leaf path below. arm_lpae_install_leaf() independently deci=
des,
> >> +        * per sub-chunk, whether the CONT hint actually applies.
> >> +        */
> >> +       if (use_cont && size =3D=3D block_size * num_cont) {
> >> +               pgcount *=3D num_cont;
> >> +               size =3D block_size;
> >
> > This appears to me as if you're throwing away information about
> > whether this mapping request is suitable for the contiguous bit, and
> > then in arm_lpae_install_leaf(), you're trying to recover that
> > information. Can't you just do "prot |=3DARM_LPAE_PTE_CONT" here and
> > then completely avoid the logic in arm_lpae_install_leaf?
> >
>
> That optimization only applies to the exact-whole-group case already
> handled above (size =3D=3D block_size * num_cont). A single map_pages()
> call can also cover the general case shown above, where a misaligned
> prefix/suffix surrounds one or more aligned groups within the same
> call. Setting prot |=3D ARM_LPAE_PTE_CONT unconditionally here would
> incorrectly tag those misaligned entries with the hint.

Due to how __iommu_map_domain_pgtbl and iommu_pgsize operate, I don't
expect to see the prefixes and suffixes that you are describing.
Instead, I expect we'll see separate calls to __arm_lpae_map(): One
for the prefix, one for the set of aligned groups and another one for
the suffix.

>
> arm_lpae_install_leaf()'s off/remaining logic is what detects those
> group boundaries per chunk, so I don't think we can drop it in favor
> of always setting prot |=3D CONT at this call site. The size =3D=3D
> block_size * num_cont check here is just a fast path for the common
> whole-group case, avoiding a walk through install_leaf() for something
> the caller has already told us.
>

