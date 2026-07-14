Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E46C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHbvi2QfhAaf34o+4KbfPlqiDqDZm9ft1GC/EbztkuU=; b=IrswB9X1n5+/ulhTL0/1K8b9Ap
	fZSX+iiYaaPs2c8iyZa7+2t1uSyqauwzMJ71L/0SsOuENjq9z+500DCwRj1FddiYR5lbEnZjwAPRX
	iyHZ4ZUg16Z9bTz9YCLgqaoYDJ2w+rhBWjmK3Ox1QitL4lm+7IskFin+uN+EwVTElssIoXMgcK0V5
	6GjX20JvTzbctWtbMNRBh3Fyrqrcum+gMwNLno+o8ZeH5P6HilGWl9Q2Ms3JPr2Zd3019tgI/Jyya
	htvAx/tk9+Nm/Nbnk2abB/zKb0p39zeAEnkf0rhFOaNZ1UD3ZjXg+qKf/MPXUBAfiwl8T7G2LNvrV
	pbmhsBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVVK-0000000AvBy-3dGZ;
	Tue, 14 Jul 2026 05:16:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVVI-0000000AvBX-2HnV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:16:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so3428436f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 22:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784006182; cv=none;
        d=google.com; s=arc-20260327;
        b=p04VyoEtDV7FYjI6d7p0SaFjMxwDw5JIwV5ZLLGsU6D/YF6iP/ja8pWNnA37qym+db
         mamUj64B8/yOc8sSYdRj9hFSfs0xRF9sByW01SnHtRqE8khp+JwBtLTH2+mqnJDa+7gb
         7r1RopPwaXeLYiIPjVX46DQecm1uugS2MqYrwYK55N0KrRBFw7QgmBBUpMa1YLT4vHt8
         ndUYS3uH4V3AC1uBXA4vmbGWw7O3JVxX8mK2jNXePUMOQLvMw7Zrmfamsi8i9U7r6HIl
         7UxIhIq137yAxM8eE+/X2PidMQGr2Y1nn6NWIXqpReDv68/1kjfvK1JpqoZxLM3dsBlK
         w7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iHbvi2QfhAaf34o+4KbfPlqiDqDZm9ft1GC/EbztkuU=;
        fh=e2cAcLnloyvKS2WNaOih2APAxbmXAOv2jofb3bzip/E=;
        b=JgHGHMcgw8nQEdRToViMZSFlp+TeOFJHCyBKeI3Ts0FWn3fQRDKMQ51tzOdZ8OL95u
         bgQ3GUpiJxB35px4B+jDzUCfZ5tHMXzPDT8vr0SProBMql/z5lQQZcBf6e4bIF01WCDR
         HVMa6UMZK84sBDiQ1srKToUWDGVTNLB1xmJCqxwXp5pi5PxbPHf8xes9KYfYjM6oE2L2
         UlKq18oq13U/Cd44plOy/alrqFD0BJqEbH1gOe+gHTNFpMGEB/+uf4WZnEZvr3AwzmKO
         xvfr2Ik83A/3O70quikkrhYmSgGNwW/rt3bPOUKCXiH+2htlwWB/nN39FR5hP+0aOO9O
         lhfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784006182; x=1784610982; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHbvi2QfhAaf34o+4KbfPlqiDqDZm9ft1GC/EbztkuU=;
        b=MaFcMSy5RdIBAqIffYXHHDtGc3uaPePPCnAoKoR7PV2hFPF6ISJOgHLLwnBjSZsdcr
         CLy4iqPUAmhx9FzxpPKxVd9eJLSba/e/sptB2LdKQJVy6D4yK+WS9DDlq/JE6Qy9qVh/
         PdSQs4WUcgNOj4cic3TDEBxkfvuwoMTH+HdMmDQ6bnZHO0PdPIngj8QPJNZIzC7Sbbdy
         pHVqVKwASCyAnTwi0fjjvEB/MKrxq4F84kXe8t7tza7sC5Q3rgxBhklIhV2ve0rsCGYx
         e5fk1GdubwZC/ZGzPtaeZpDAoB/xQM7ZiuOsSaromA+Wm71gBX3o6izSKsId82hDk9iF
         WO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784006182; x=1784610982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHbvi2QfhAaf34o+4KbfPlqiDqDZm9ft1GC/EbztkuU=;
        b=i6fIet+TdJcVZA+kFBPHyHIXmOfB/Nk7RR2u+K3NUSZ3UQkHlMtTcjm5vKdgswMUPG
         AX1A9qnz555JEuO9Yhfhi0iMa2rNbv6geJudOzMvRwgdGzDV63YG6AIlVpYW4aEbkJw4
         1axt6MG5IfuHmsnM/kMhyYqjHCfomLhmFMBbztivJ/IlZFP8GiTOJDzWJnY3B5YKRX0J
         1JwHJnTMWSNygVKQxZqTO2A85OHOsZVOj1Wfz3oADE2fJ5cn9PSYXRmVc5yk35Q526Cr
         Ya7SYqOHGnbwCIJCeR0QZV6U2C1iV7PDAGcg3QjNn90n7aUkYjq3ldmWtZmrlUH2ZlD0
         sk8g==
X-Forwarded-Encrypted: i=1; AHgh+Rqb5TAQsSmOY1i3akSK+jTFvHKlcgvHS9HoLghF15Unw+lieIH+ZCS2Rk0IHNKkeeDJkdrsk5LOhp2HPjOXcd5U@lists.infradead.org
X-Gm-Message-State: AOJu0YyeFb6lt0G8qPuJBxxxPyAVjb+27SB5+NM9bGf6szOs041HVHwv
	+XmOKSjg2Gg5fLp6nUfEUy91CelZkm4p0Ro+Pbuquw4gTp0vlHhGizUPBO4zb31O8bVSNkCEUuU
	2PAbFfAwJkzVgv2O2QxoWpZHLMzJ+C24=
X-Gm-Gg: AfdE7cnGrLRwk6sA69ICMH7u3O3i4Vl7sDVeO4KupOkzVEGX2n8xPTwP1slQYjbuMhF
	kvdhuY8AguizFJkCFFNWAz+WfJ4W40tckkLYViUvnYB8FMoRMw2Hhi/w6NGOwAs+83Zmg+KQJ4m
	Amm1aAXbYtq+Iz/kJsi/5K9YVhAKbM+eV5TU8GPcwkZfw9GuaJDUshMGWSn7yuKsGsaR3ClalWC
	ZrMZN18pfDCCtc/bfgh2yj8vu3WUKHft2V6I63VlKMrd0SjaikkQgz3LVSplnWtoTQzd8eQjg==
X-Received: by 2002:a05:6000:2013:b0:47d:f01e:83cf with SMTP id
 ffacd0b85a97d-47f2dd0a07fmr13768845f8f.58.1784006181734; Mon, 13 Jul 2026
 22:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260709073823.6643-1-jiangwen6@xiaomi.com> <20260709073823.6643-6-jiangwen6@xiaomi.com>
 <aa5d2aa2-89c8-4b6c-9a28-5c22143277b0@arm.com>
In-Reply-To: <aa5d2aa2-89c8-4b6c-9a28-5c22143277b0@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Tue, 14 Jul 2026 13:16:12 +0800
X-Gm-Features: AUfX_mxsvUtzI2D0AgHPIRqMMW6_Ug3R10MrIF7o3aE9P-mmfmUpHGE00EZO9xk
Message-ID: <CAHKocdG7iO=S+pZLSs+mYO3GmVC_WvpC0V_1Tjj7RZ-YxWVh_w@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, ryan.roberts@arm.com, 
	"Barry Song (Xiaomi)" <baohua@kernel.org>, Wen Jiang <jiangwen6@xiaomi.com>, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_221624_614630_F092E31C 
X-CRM114-Status: GOOD (  30.11  )
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

On Mon, 13 Jul 2026 at 23:19, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 09/07/26 1:08 pm, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > In many cases, the pages passed to vmap() may include high-order
> > pages. For example, the systemheap often allocates pages in descending
> > order: order 8, then 4, then 0. Currently, vmap() iterates over every
> > page individually=E2=80=94even pages inside a high-order block are hand=
led
> > one by one.
> >
> > This patch detects physically contiguous pages (regardless of whether
> > they are compound or non-compound) by scanning with
> > num_pages_contiguous(), and maps them as a single contiguous block
> > whenever possible. The mapping order is determined by taking the
> > minimum of the contiguous page count and the pfn alignment, allowing
> > graceful degradation when pfn alignment is less than the contiguous
> > range.
> >
> > Pages with the same page_shift are coalesced and mapped via
> > vmap_pages_range_noflush_walk() to avoid page table rewalk.
> >
> > As users typically allocate memory in descending orders (e.g.
> > 8 =E2=86=92 4 =E2=86=92 0), once an order-0 page is encountered, we sto=
p scanning
> > for contiguous pages since subsequent pages are likely order-0 as well.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  mm/vmalloc.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 85 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index d2a4d649af549..db0492151ad08 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3543,6 +3543,89 @@ void vunmap(const void *addr)
> >  }
> >  EXPORT_SYMBOL(vunmap);
> >
> > +static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
> > +{
> > +     if (arch_vmap_pmd_supported(prot) && size >=3D PMD_SIZE)
> > +             return PMD_SHIFT;
> > +
> > +     return arch_vmap_pte_supported_shift(size);
> > +}
>
> Need to throw in a preparatory patch for this, which will (in addition to
> introduction of the vm_shift() function) do:
>

Hi Dev,

Your suggestion is to extract "vm_shift" into a separate patch, say
Patch 5, to make it a common utility function just like Patch 3. And
move the existing code that can use vm_shift into this new patch as
well, correct?

Thanks,
Wen

> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index afaa14ebf17bb..dac87e1cd484b 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4175,10 +4175,7 @@ void *__vmalloc_node_range_noprof(unsigned long si=
ze, unsigned long align,
>                  * supporting them.
>                  */
>
> -               if (arch_vmap_pmd_supported(prot) && size >=3D PMD_SIZE)
> -                       shift =3D PMD_SHIFT;
> -               else
> -                       shift =3D arch_vmap_pte_supported_shift(size);
> +               shift =3D vm_shift(prot, size);
>
>                 align =3D max(original_align, 1UL << shift);
>         }
>
>
>
> > +
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +             pgprot_t prot, unsigned int max_steps, unsigned int idx)
> > +{
> > +     unsigned int nr_contig;
> > +     int order;
> > +
> > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> > +             return 0;
> > +
> > +     nr_contig =3D num_pages_contiguous(&pages[idx], max_steps);
> > +     if (nr_contig < 2)
> > +             return 0;
> > +
> > +     order =3D ilog2(nr_contig);
> > +
> > +     /* Limit order by pfn alignment */
> > +     order =3D min_t(int, order, __ffs(page_to_pfn(pages[idx])));
>
> You missed Sashiko's point here :) the pfn may be zero and this
> will blow up. You can just first derive the pfn and do the clamping
> only when pfn > 0.
>
>

Will fix this.

Thanks,
Wen
>
> > +
> > +     if (vm_shift(prot, PAGE_SIZE << order) =3D=3D PAGE_SHIFT)
> > +             return 0;
> > +
> > +     return order;
> > +}
> > +

