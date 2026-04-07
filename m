Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37B3FEEF52
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lNjW+dxr/buBuPTrI5vfayHnWO+C+X6rAlTXc04424=; b=itWdYNaMvSSD6AizrBjL76QvA4
	AOvTiNybjzYQoYwWIIVxaHJbVuK9eJKUvZFv7BBJOYjcBR4m2gZ50fR9RJR2FgIIJL9Ld4fY1PMn6
	7r2wB48kaYSm4OyMWunW2FinU07P4OmEdczJnIvZaA8UKS/GkfiVghZksKKJl0WJboWk26RPntI1w
	7SMDSsO0Rxb7wIP8WUZ7H9gHeYBzAoZwQgye0nOaOAvT61T9aHGpF+Xx4uISz+/sLxcvVljfVEAh+
	Ycl6lkUMD10+F63bWkbbyd3QgiFwwG6hqT7VAosrv6SrWST8kIGM0GOa/RZk6AjMwSBbsgFMC5/Ri
	gRMqkzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7vP-00000006fM4-3LCK;
	Tue, 07 Apr 2026 15:01:07 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7vN-00000006fLh-3IGp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:01:06 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-899a5db525cso47232816d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 08:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775574064; cv=none;
        d=google.com; s=arc-20240605;
        b=O6pFLU5NoImVmphGYZmuSbM3d/ELscdq0mY3SsNOGBQ5AsfpTMuFXJ1lS9vFzzU+w6
         BXpynjL3wPfTfckE+sVJjZO50oXZyRUbYjRvogCVIWKU/+RNSNcd2wk5oMbcPzyPXfGp
         FdQNUPA3uJnrQ9ztzV4yvgm5DBh97mkxyqCLlOboJLtZz9jkdfz4K9372WR8RetU7AAf
         SkBVuw/R3Y23ES1HeggBCAUjarHNt/4F/Y+FB91jnnrxWrCciwK2i+0d8YEY+OVbjzIA
         It1lIiAWKALB/nOlsu4f+UtOPB5kgCj1n7xyzZpnov7R5DO5/bEHo9TmighY9S0ybXfG
         emsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lNjW+dxr/buBuPTrI5vfayHnWO+C+X6rAlTXc04424=;
        fh=8/QEcnQtHK1lphNhH+9RfaHYTYeiaWutXNfpxxGIZT4=;
        b=MeSihjjiGVUcYIaClI9jFJAg4U5sS0A6SbXti8muDcPfTM5JnOrOP5mE0X4/WSri1M
         hUIgBDb4QFz1GyAmNuMjJAIrTVn6fSa96ywY6kOetK3H9gC+RuJ7m7s+jGUzVkmWje1u
         GbIncmXryfOVXh7d6Knm3azcZsCh/qzQn2XxNPvvRDcVQXCNJe4Bej9MZvZ12Jqbb8Eg
         alrotDxTZa0EhChPv7o32zXcN4pHKJyuIkP3U12m1Al253lTOxQLxEuH6QHmcpPmcPbP
         YMc1C9ZJTNf4TKzoUC4+cNvM4kEefWMb99aRFtkoLq2KoXr3Tm0NWgKrhL/lZ8HYhQpb
         zv9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775574064; x=1776178864; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lNjW+dxr/buBuPTrI5vfayHnWO+C+X6rAlTXc04424=;
        b=YbajE8KxTuc4Y96aIKrNMI8y+dtFDnxg4+Wxx44PeGOkYkPJzCB5GW2MK3UZy5jqT7
         ZlVfzIqw5UDFW3cOaxbeqZ1cf7PPhYu6jxd9b8MjcSHbHyGr2fFz9pIBRCCk3LVfCyuP
         2KF/sqAvZVcAZh/6MhfT8zFchX1MhYZrid4NOoF1MomLFzrL7v9nPaJZaevTnrTFcgAw
         rzG60iJKXQXHzMSD51hA0uIEmuIUrMtxdUxwveY1bhZ7EJmReN6wCBzf1FkBi8ebcyxd
         /L0W54s/zwDuDm2l0w9sRDujcXckrWHSvHE2imvtUrAwdnaM9r62dhpzSEtCGzOtniPY
         ymAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574064; x=1776178864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lNjW+dxr/buBuPTrI5vfayHnWO+C+X6rAlTXc04424=;
        b=BzpvgRDBB+XtU00zWFmo/3m6EOf8DV1v+hFMsSKLFmwALUpH5sYrJTrsT3Al6kvUGK
         PfWv36meeWmokJrMbz1AXUMR1XMNodfPASfvRos22tXPh6/Z38CpmqOJc49jEsMvQ3A/
         yyF4qFoc3JlNWzDaM0V39K8WRaGRcr8/2XLtavLwUFtyxko20fojyePKo4W1J2pm33wu
         c0Akx/kcZgMYm0GXeOuyteRQamvLGiQFRkI/eSKztd5palvvROwgVDuwVF2tZzEYjQ9j
         jV+KeBEVvlacaLXxZl7wPQJ8VFJyAMXJxEs3r2goilpauGd736GgpK4YkFUfnbwzt56G
         U5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVflqxtkWFCv08u0jQReiPFfwo3WzzUQP8nU2yU8l+swXErzDWA8AWqPQQkBIB3FuAJz/UB88R1laOCyssiconQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzFsmF6EmkpgllJfeNUW7f+ocK+g9wCWYcobMo4SyfqxwP78/BR
	h67ZKXEPstj7TL7l0iSBxDMRbHUbhSe36ZA275b66V5LKYL1b6z3/SjlMM5qo2qhMKhE2hdGVd+
	/BHg/7CqRXAvh0NeJCUNHMUcRIysUWJg=
X-Gm-Gg: AeBDievDN3Gi0gq+eJJzz7D1icZUnc8GUR3MR15SelsTbnG+Vxyk1Ypa4BlD4bxFKqu
	7FRaOo0tt35VoIbVfHvQIkpd58IPohbLqnSKOethpIhotiSWwGR7fPycTLPCO/SA/IaMX1O2H/N
	38jkcookQz9t2Fe33x4KUKg3s+G4cW2d43QmKalfH78U+aON/RqnBGD9/fDpkbofd4uha9BP3KE
	prGH/X8AAcQPjoF8ewy7Bmz/yQizTDQb7s7tVUrO9FVdaf9dLFG5hqm23MZnsd8znBLNvh27UUh
	saxfjA==
X-Received: by 2002:a05:6214:2f13:b0:89e:cb8b:a77e with SMTP id
 6a1803df08f44-8a704abb8dfmr284541396d6.32.1775574064233; Tue, 07 Apr 2026
 08:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260326094308.1161335-1-wenst@chromium.org> <CGME20260327054445eucas1p2d1ac645faccf16272c3a12406400a364@eucas1p2.samsung.com>
 <CAGXv+5G2H3CSic5hCSd2g6RrfGyNSbpYS7Z9uo-XUn6No3a4Rw@mail.gmail.com> <52a26d5b-67ec-4a99-98f6-6216e930cdb7@samsung.com>
In-Reply-To: <52a26d5b-67ec-4a99-98f6-6216e930cdb7@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 8 Apr 2026 00:00:27 +0900
X-Gm-Features: AQROBzCwFYJ79nrP10FU2NCqyXv-mL-J9T-1EOFubFcU9cyDki20zWlIqj79km4
Message-ID: <CAAQKjZO=h9uegjBOi7dqq0DM3o2B9gJ9mkM+40pEXMHY87unvw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/exynos: Random cleanups
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_080105_854572_29591D62 
X-CRM114-Status: GOOD (  17.20  )
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

2026=EB=85=84 3=EC=9B=94 31=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 11:39, =
Marek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On 27.03.2026 06:44, Chen-Yu Tsai wrote:
> > On Thu, Mar 26, 2026 at 5:43=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> >> Here are some cleanups for the exynos drm driver. This was done as par=
t
> >> of the conversion of the driver to GEM DMA helpers. These patches have
> >> no dependency, unlike the actual conversion, so I am sending them
> >> separately for inclusion now.
> >>
> >> Please take a look.
> > I should add that these patches were only compile tested.
>
> I've tested this on the real hardware and it works fine.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks Marek, :)
Inki Dae

>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
>

