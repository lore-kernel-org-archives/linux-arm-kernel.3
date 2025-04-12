Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E956DC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 05:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmcQ3QSDEsYPOXt4vueIi6q3EffCVeNKtD8G4iyJL/E=; b=qcCU1Q+qBVu62PVJZdFjUPuXQk
	538uJIkVZuyj4z1eh5SAOrbgCzF51pWVawioW3K28OR9QCzKey8bFft46pKWs2iJwGngmzFLqOuNF
	+0BC5mq3RHz4OO1FobMDgORf7O1q3o8Aky2yXaBo92HaLRbwsO/dxtBIdzuIyHsP/2FPHWBjA7aVt
	Z17YhxL5+4JzYj/f/iSoHPXMDusJk2SynY7YjHNYBbgc3oLjcTzgXzug5QgBcyp66ODCQTa9pCdxm
	uHQgXWM3IGwJ6WihKjELqU9IsxP8wrOlrxuuYl3V54uuk4I+pO7Th7PoR7MjpX8Nh/yX44yGuAEWc
	wJV6wCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3T5k-0000000FS6e-1qP1;
	Sat, 12 Apr 2025 05:07:44 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3T3w-0000000FS1V-1Hfq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 05:05:53 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso4821819a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 22:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744434350; x=1745039150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmcQ3QSDEsYPOXt4vueIi6q3EffCVeNKtD8G4iyJL/E=;
        b=moEG8PyuNTiUuc4Tm8OJ7HFcOcRmeKPdAjJ4tIOvhwd5Pzpphe4rI72RNk9GT8a0tJ
         rzs9D5EkTQ9SIg0y0Pc0dukWgWU6iD3aKYNFTW6zthICfOytYoV1mA4aG7GwiAiS6JY3
         5YPPaB0WNClCvXoznSn5UeiHSilNUxbJc61erGV/mtlGGcBjIkblgvWdGo3DhNKeiJ8j
         06/LszClH9BQ30/xdEKGldoH8XdF5PD6GLbrlomak8l/tGLOZGLUb35gYjk8KM9l00US
         dresYLP2pztdaDyibZE9taPKVGqMwqW8gEidgYEW8iG2u2HoYUoQfp0Ln7U9hBmAelQ7
         YBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744434350; x=1745039150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmcQ3QSDEsYPOXt4vueIi6q3EffCVeNKtD8G4iyJL/E=;
        b=VG3BJj5eP81wyhCklmNj5WGDJnRI7fXMRB/z9XldoBLxovLsQ3spIKQ/IYp2i2VtYq
         XZKAhmWN9u0DRchHg0TIuVxwpx5ljtCcyM26qFO2ypXi4en8DujHrbUF7w1/2wdSByPj
         3ceBF/wLrYbqeEsA2DBstNCAaxiGYBnqSPJQJZm3wQzt+vqNDu7AP/nyqArCCdzs4vxw
         h4jXcitX1Q1q38xXsxNiX90OcjSVV7+akHhxLsYNkBQf6FdtG9Xf3El4fYBXwSaKxYCq
         nO7Hntbg0A7gxAQ+G22ft201/dQb+cCk0F29ewU1Pn6r5BSybOUq3thtMO5GuRqAywk8
         GhlA==
X-Forwarded-Encrypted: i=1; AJvYcCWB6Uo08lcjcmOmWfVCAig0Z2L0d4vbsacvJ+JtS/FRvTI7r7pBySqFtuOMZ6ueGrq4ZywsmPb8AqwwQ50wKjIr@lists.infradead.org
X-Gm-Message-State: AOJu0YyoQHZLJHOPZ4+kMUXgPIkvfPv9gUorvo4J3R4X3NkHt0a0RmJf
	zTlP8adX+XSMLHb2/rM8ACypgzQB+3U/5oEvP+a9pq88lRf18S7mSl/XvZGXAsymPph/TnfesUO
	6Bjv1SbTLYN8dDO3ZfI2iV2UESFs=
X-Gm-Gg: ASbGncvk4m024cRnlK/NFiEBtRilvEfSOME+uAEl+WqQxSVxDfxxrNzCwHJr3VF0Nd7
	h+zzPonuGWXYjintzVSrTkY7xyfr+OnraJHvdNpj7K8/P1vvkdyNuJMfljmuficYh2M+5CuiW8Q
	NOX2OCBl9/G1qNc17p36KXIA==
X-Google-Smtp-Source: AGHT+IHBf+UMftA4CGaOd6iqURletqUiakkY5VrOrUEsqMmq4BL3w7CAqbX9kxxB8kCkj2w+GTEZDzOe3fvcpG2pkPk=
X-Received: by 2002:a05:6402:2406:b0:5f3:26be:d0a8 with SMTP id
 4fb4d7f45d1cf-5f3701434fbmr4395531a12.34.1744434349861; Fri, 11 Apr 2025
 22:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250407092243.2207837-1-xavier_qy@163.com> <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
 <7dccb3a2-f5e2-4f9e-8f5c-465a1d3ffdb6@arm.com>
In-Reply-To: <7dccb3a2-f5e2-4f9e-8f5c-465a1d3ffdb6@arm.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Sat, 12 Apr 2025 13:05:13 +0800
X-Gm-Features: ATxdqUF7hj7xajw8pWYtG6W9HcBwU0cx0wU6iVE9RZKOEDT2l8HVv-NXGVrK21g
Message-ID: <CAK1f24=5-VVJoE75wrskXxrGi=KmrbxSYH9P69PRPiOxQuArpA@mail.gmail.com>
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
To: Dev Jain <dev.jain@arm.com>, Xavier <xavier_qy@163.com>
Cc: Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, ryan.roberts@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_220552_350429_2778F45B 
X-CRM114-Status: GOOD (  27.36  )
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

On Sat, Apr 12, 2025 at 1:30=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
> +others
>
> On 11/04/25 2:55 am, Barry Song wrote:
> > On Mon, Apr 7, 2025 at 9:23=E2=80=AFPM Xavier <xavier_qy@163.com> wrote=
:
> >>
> >> This commit optimizes the contpte_ptep_get function by adding early
> >>   termination logic. It checks if the dirty and young bits of orig_pte
> >>   are already set and skips redundant bit-setting operations during
> >>   the loop. This reduces unnecessary iterations and improves performan=
ce.
> >>
> >> Signed-off-by: Xavier <xavier_qy@163.com>
> >> ---
> >>   arch/arm64/mm/contpte.c | 13 +++++++++++--
> >>   1 file changed, 11 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >> index bcac4f55f9c1..ca15d8f52d14 100644
> >> --- a/arch/arm64/mm/contpte.c
> >> +++ b/arch/arm64/mm/contpte.c
> >> @@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_p=
te)
> >>
> >>          pte_t pte;
> >>          int i;
> >> +       bool dirty =3D false;
> >> +       bool young =3D false;
> >>
> >>          ptep =3D contpte_align_down(ptep);
> >>
> >>          for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >>                  pte =3D __ptep_get(ptep);
> >>
> >> -               if (pte_dirty(pte))
> >> +               if (!dirty && pte_dirty(pte)) {
> >> +                       dirty =3D true;
> >>                          orig_pte =3D pte_mkdirty(orig_pte);
> >> +               }
> >>
> >> -               if (pte_young(pte))
> >> +               if (!young && pte_young(pte)) {
> >> +                       young =3D true;
> >>                          orig_pte =3D pte_mkyoung(orig_pte);
> >> +               }
> >> +
> >> +               if (dirty && young)
> >> +                       break;
> >
> > This kind of optimization is always tricky. Dev previously tried a simi=
lar
> > approach to reduce the loop count, but it ended up causing performance
> > degradation:
> > https://lore.kernel.org/linux-mm/20240913091902.1160520-1-dev.jain@arm.=
com/
> >
> > So we may need actual data to validate this idea.
>
> The original v2 patch does not work, I changed it to the following:
>
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..db0ad38601db 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm,
> unsigned long addr,
>   }
>   EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>
> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> +       int _start; \
> +       pte_t *_ptep =3D ptep; \
> +       for (_start =3D start; _start < CONT_PTES; _start++, ptep++) { \
> +               if (pte_##flag(__ptep_get(_ptep))) { \
> +                       orig_pte =3D pte_mk##flag(orig_pte); \
> +                       break; \
> +               } \
> +       }
> +
>   pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>   {
>          /*
> @@ -169,11 +179,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>          for (i =3D 0; i < CONT_PTES; i++, ptep++) {
>                  pte =3D __ptep_get(ptep);
>
> -               if (pte_dirty(pte))
> +               if (pte_dirty(pte)) {
>                          orig_pte =3D pte_mkdirty(orig_pte);
> +                       CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
> +                       break;
> +               }
>
> -               if (pte_young(pte))
> +               if (pte_young(pte)) {
>                          orig_pte =3D pte_mkyoung(orig_pte);
> +                       CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
> +                       break;
> +               }
>          }
>
>          return orig_pte;
>
> Some rudimentary testing with micromm reveals that this may be
> *slightly* faster. I cannot say for sure yet.

Yep, this change works as expected, IIUC.

However, I'm still wondering if the added complexity is worth it for
such a slight/negligible performance gain. That said, if we have
solid numbers/data to back it up, all doubts would disappear ;)

Thanks,
Lance

>
> >
> >>          }
> >>
> >>          return orig_pte;
> >> --
> >> 2.34.1
> >>
> >
> > Thanks
> > Barry
> >
>

