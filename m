Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36F6C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EiGG8q8Ypx/hjnGEBryYxRlKkl1JEhEiUgVdwoleck=; b=CmagntcbDmv600zMilUr8browY
	yQtEqt2+ln8ciizfKK91frJ4uZAhS/xKWhRZ1ezAEM6Br7lc4OR97zYPHGQqBp1Bme/LZoFh5xoTO
	OmFdgyjHRp3QGThTUJtMQZKTew3RAt/Rv5OLd8OFBqUc+1dwpszOwqlrfvB3lOqUfEI+2Ddg+gIpm
	k8u2ghInlnqyLPZkgRRa9LkuV2Z8F57tNhuI4KlGjF2WhIy2Ipx3FOBcCbMp6t7LniaIF8aC0k9s8
	3kwqFD6zldAej90oyEmqXR+bBvdf4wXNbmZi8McVJCg6q1Z6YVhAgclY4tXyjsLO9+R/4BXDdw6+7
	fzmFfkZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2zR3-0000000BtjP-0goO;
	Thu, 10 Apr 2025 21:27:45 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2zPE-0000000BtWy-2kHh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 21:25:54 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso1135450241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 14:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744320351; x=1744925151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EiGG8q8Ypx/hjnGEBryYxRlKkl1JEhEiUgVdwoleck=;
        b=IQKeAsM1/e+JVQmx4nrG8eu5p96ZWyF15XIJjo5qj1h/EU4Kv9+rMXvdnAx2R/17Rc
         gA+UhiaHvIu8DXW2zC1XKkbXpA4GYUsKniUTJfA3hTpqxuIvaZ5B2JFcnUn3fchUAoXu
         AO0rTkv3u8b2Hvh28xgVblzShTvajSfhhEWtE+OSQBQkX1xV0OIhFTJvgTlJSg6YYpod
         w6feTAn3SjyIDQl7wBoSOznAjLzVfs3ae+xxSAMCC97ze4ylJUkVXMqDHrQ73wHxAqKA
         yxfsRWgIEJftxyfFYiB+URw03oI6kHYiwMUdKBnyRK4ulZqFbTUfl5lIRdL9l8hjQI+d
         QQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744320351; x=1744925151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EiGG8q8Ypx/hjnGEBryYxRlKkl1JEhEiUgVdwoleck=;
        b=snCkDvivA633v3GJCkJFIHYaD+Wo4qIMBngW2ai0NeTjN6iI5hhYqLnZ+vOaEYSLqR
         5xvJjZrSBcAWIoDnYZbkiRQOrcsIFrjTE5+NxouEhOnd7kxecdYIwP1AXbLyzFTmAwCi
         FMtOX/4QMC0N4f64E78RBaBFfGW//b5Wg6cWgf+K1B8FjsYof2a8TvXXVo9njg42ku3b
         vA9DrVDiKL/uHP+4IznS3MvKieNbFld787KJAVHBhJd0LuU41auRSshH094xvyt47fiM
         tGadmK8wPwmzMPNLoYxYhXA5yCQxpJx1uyOgGduc9lwIqAKwOoolllJf8A/xM9JBySGp
         zfyw==
X-Forwarded-Encrypted: i=1; AJvYcCVUpqH8SXnUqDvDe1wWuiavshPF7dWYoCdVwVmhjTc9Gcs4KGk/R0v3XkWIUW7DuS1fBe/tcDCEWNg4Lplnt9dr@lists.infradead.org
X-Gm-Message-State: AOJu0Yweaa3HAxrsTbWqe6tSbSt7FkTNA3KA4dVugLOdHGmfsXYbvQrQ
	M7voi8dGOKY9q3Raa0kgGjgRiWrzbH7TqMw9w7ND7vDWA2qmODEpSmQguDxOpjtDfcNnwdy00P2
	6qidMJTomu5VSE9U3LUWSZLjrF0THqbeKFTU=
X-Gm-Gg: ASbGnctKb8HkNgYi1nmmGLkIjJZrvbBdGwcDq/rBwv8eD4a1gO6oqjkhzrFSWQvW/N/
	wrnQJb3afMRdGw2SBWlimIJ6EzgC9n2JfU3VIU21i7E0Ay5hsK7Z2wdkJu5xMok/G3XmHUD88XV
	3JM3pCy633P6vbRpDrZTGbKQ==
X-Google-Smtp-Source: AGHT+IEfzYZgK9rqI0AZQud+O+0HlkwA6VIS/f8C6bC/2AhXMWCcqKze/Dn/RUKa7DKwsgxGidzJ0RV9Q+CYQbY8IUM=
X-Received: by 2002:a05:6102:5794:b0:4bb:e14a:9451 with SMTP id
 ada2fe7eead31-4c9e4ffeed0mr130766137.20.1744320351320; Thu, 10 Apr 2025
 14:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250407092243.2207837-1-xavier_qy@163.com>
In-Reply-To: <20250407092243.2207837-1-xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 11 Apr 2025 09:25:39 +1200
X-Gm-Features: ATxdqUH9N-t9OCDB_pg-Pg6mX6VUE1BGbgJLAvFu-pe7UQ0ejkz_VnYeEs6P1hE
Message-ID: <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
To: Xavier <xavier_qy@163.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	ryan.roberts@arm.com, ioworker0@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_142552_694942_7E7C0E87 
X-CRM114-Status: GOOD (  18.35  )
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

On Mon, Apr 7, 2025 at 9:23=E2=80=AFPM Xavier <xavier_qy@163.com> wrote:
>
> This commit optimizes the contpte_ptep_get function by adding early
>  termination logic. It checks if the dirty and young bits of orig_pte
>  are already set and skips redundant bit-setting operations during
>  the loop. This reduces unnecessary iterations and improves performance.
>
> Signed-off-by: Xavier <xavier_qy@163.com>
> ---
>  arch/arm64/mm/contpte.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..ca15d8f52d14 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>
>         pte_t pte;
>         int i;
> +       bool dirty =3D false;
> +       bool young =3D false;
>
>         ptep =3D contpte_align_down(ptep);
>
>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
>                 pte =3D __ptep_get(ptep);
>
> -               if (pte_dirty(pte))
> +               if (!dirty && pte_dirty(pte)) {
> +                       dirty =3D true;
>                         orig_pte =3D pte_mkdirty(orig_pte);
> +               }
>
> -               if (pte_young(pte))
> +               if (!young && pte_young(pte)) {
> +                       young =3D true;
>                         orig_pte =3D pte_mkyoung(orig_pte);
> +               }
> +
> +               if (dirty && young)
> +                       break;

This kind of optimization is always tricky. Dev previously tried a similar
approach to reduce the loop count, but it ended up causing performance
degradation:
https://lore.kernel.org/linux-mm/20240913091902.1160520-1-dev.jain@arm.com/

So we may need actual data to validate this idea.

>         }
>
>         return orig_pte;
> --
> 2.34.1
>

Thanks
Barry

