Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC59C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 03:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBvGb5qenRrsnlW7ZV/vGRFaGIHQgeYKe9QqCseZxGk=; b=d176uJwsFfhZU/VtA9x+WyMU/s
	3+xjnZ2EhEqgNCvFJpsw2wES4oFX+uuateRSllImrkWk0qO41yJl2be6o03pgKInDROACZ4simiFc
	XoUVb8ePKgXSzXXy+9EliZxZHBjpItCsEzF6SJWOrWnMJT7rN+b9OEeXBu4TeMeNhK3VJlRrvlJbX
	f4DG6lzgPxvo+c/eMhOqUn9mzqZX2v8df+J/9sHaa/N65ZjXcnbaZA9a+fSukvtau9WE1OeNIYW9x
	azlqdWoWajME774qRvpOR9JOT7S/jbzdjbHTZ28Xn9S1oXcNkwoEMyscsWjZcWYnfN+SGZo7Uqu6+
	GGV+NDDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovQd-00000006n8W-1oDS;
	Wed, 29 Jul 2026 03:57:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovQc-00000006n7c-0vdh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 03:57:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8485B44E52
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 03:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A011F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 03:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785297477;
	bh=WBvGb5qenRrsnlW7ZV/vGRFaGIHQgeYKe9QqCseZxGk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RpUFKb++/Cu1R9QdgIAMmG4bMtpgEjj7oopRFu0mJQ7mWzEX1KVb2XBnrpffzpf5Q
	 epwwZya6sFKpBI+/bdhekqpsqTw3erbHOD1wMabVRwdytc80V929PrpZKU4TgV8V91
	 iE0TeY2AWFF47hbsv3Yhh5Z1ofwSlf/liGFjCGlsN1H4vY0+I9IUKxKbl8CVeTGIhq
	 ZPZxHPf0wa1gRUbOPZODyCeuHAC+hQRPcmc6Fcmot9yk6EvNBuFAUQ42DzU9y9sgb7
	 x5w/0FiEuB7YSCR1ywTRxSjPm9Ojx/3esTtijMlDNBgRc5+KB+lz0nxtL27fqm/yHm
	 bOk1shrU+tHrQ==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e99ef0902so34242985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 20:57:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoL/5fuDnhW3nCnOivOC9GJTFoPhbzi7zYhJRhup/51nDPTlj/kzEBy+dMBvaw0JVrLRx5iutdboggJUE+sU/M2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+XjgD92u5v0L72+32rgB0nG08DOGdVh8Bs435xRqAi1HbmmoV
	dOTUdsgkTjkiVMWjJO2C/fkDi/Laj+uf4hWQK7WANjoxdcpiLB0mPSjgvPC5jn8Oju10x5GZvs3
	0lusYVw2MC43Rcyxo2k/spxpyZN3xJw8=
X-Received: by 2002:a05:620a:4725:b0:932:de54:130f with SMTP id
 af79cd13be357-93302644959mr540835685a.57.1785297476778; Tue, 28 Jul 2026
 20:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260715120813.3609949-3-jiangwen6@xiaomi.com>
 <20260721181729.305137-1-devnexen@gmail.com> <CAGsJ_4wWhvKA=BmPwCrGv06kq07QMP6CKES1mGUnx=HmiDPGLw@mail.gmail.com>
In-Reply-To: <CAGsJ_4wWhvKA=BmPwCrGv06kq07QMP6CKES1mGUnx=HmiDPGLw@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 29 Jul 2026 11:57:45 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wUveHA4mvkhrkdtyOeZzsNOmY-TxVN-dHpb=sN-Gr6YA@mail.gmail.com>
X-Gm-Features: AUfX_myvKscN0E2hsqpXT_KCvHtoTt4qoIZaeHJpupKzp4Iofdn6Pn4vkmIM3xQ
Message-ID: <CAGsJ_4wUveHA4mvkhrkdtyOeZzsNOmY-TxVN-dHpb=sN-Gr6YA@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] arm64/vmalloc: Allow arch_vmap_pte_range_map_size
 to batch multiple CONT_PTE
To: David Carlier <devnexen@gmail.com>
Cc: jiangwenxiaomi@gmail.com, dev.jain@arm.com, david@kernel.org, 
	urezki@gmail.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 29, 2026 at 11:45=E2=80=AFAM Barry Song <baohua@kernel.org> wro=
te:
>
> On Wed, Jul 22, 2026 at 2:17=E2=80=AFAM David Carlier <devnexen@gmail.com=
> wrote:
> >
> > Barry, Wen - the returned span is capped at PMD_SIZE >> 1 but only
> > checked for CONT_PTE_SIZE alignment. In the batched vmap() path pages
> > are only contiguous within a naturally aligned block, so when a PMD
> > boundary splits a batch the next region starts mid block and the span
> > runs past the contiguous run - set_huge_pte_at() maps the wrong pages,
> > tail of the array left unmapped, no warning.
> >
> > What do you think of clamping the span to the pfn physical alignment,
> > like 8xx does:
> >
> >         while (!IS_ALIGNED(PFN_PHYS(pfn), size))
> >                 size >>=3D 1;
>
> Thanks, David.
>
> I noticed that 8xx has simplified this to a simple
>
>     if (!IS_ALIGNED(PFN_PHYS(pfn), size))
>
> Could we do the same here?
>
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vm=
alloc.h
> index d665f9d68742..a27101e24f76 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -46,6 +46,8 @@ static inline unsigned long
> arch_vmap_pte_range_map_size(unsigned long addr,
>
>         size =3D min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
>         size =3D rounddown_pow_of_two(size);
> +       if (!IS_ALIGNED(PFN_PHYS(pfn), size) || size < CONT_PTE_SIZE)
> +               return PAGE_SIZE;
>         return size;
>  }

On second thought, the caller is walking the PUD, PMD, and PTE
page tables, so it won't pass anything that crosses a PMD
boundary here.
otherwise, the caller has been wrong. for example:

static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end=
,
                        phys_addr_t phys_addr, pgprot_t prot,
                        unsigned int max_page_shift, pgtbl_mod_mask *mask)
{
        pmd_t *pmd;
        unsigned long next;
        int err =3D 0;

        ...
        do {
                next =3D pmd_addr_end(addr, end);

                if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
                                        max_page_shift)) {
                        *mask |=3D PGTBL_PMD_MODIFIED;
                        continue;
                }

                err =3D vmap_pte_range(pmd, addr, next, phys_addr, prot,
max_page_shift, mask);
                if (err)
                        break;
        } while (pmd++, phys_addr +=3D (next - addr), addr =3D next, addr !=
=3D end);
        return err;
}

I guess we don't need to do anything here, David?

Barry

