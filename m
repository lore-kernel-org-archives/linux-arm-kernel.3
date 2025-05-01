Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F97EC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 05:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ajprlg+s4993P4LGMO5ZNBmeiTXr19klHoz0G+I0WL0=; b=TQHZE80DSdmoGF
	Rqhm7SX1P4K0hm1aCDwiHmMij0xMjGsV2yDKm6XiraZh32LJUDF+Dsp9FUQIZbAwnTOaoDJqhfap2
	vyTpdDjzNTa0ZmH4znoRs8F6vu9AcGBF5iBvAj0wBKCFk+dsoH6FtfCkZm0XiodViwLdvzb27XA45
	O6DoUdzh3duNCqcQlCCFyx4gIZ9gAIzHMpYe4oXBUAKNW3yIvQDui2ZL7z7QpyxzV0Wr2/UJdbFEf
	FSLA2RIX1p9oIaDjeNQSVWXHL78DNA5ElUHUoP7DZfLQQu52L+p3fOXOx8vCoeh5YL+gKrWBozc49
	rOhZwq4yddiaeGiULQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAMFI-0000000EkPJ-3FiM;
	Thu, 01 May 2025 05:14:04 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAMDO-0000000EkGp-2b7P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 05:12:08 +0000
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so4859061fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 22:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746076321; x=1746681121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ajprlg+s4993P4LGMO5ZNBmeiTXr19klHoz0G+I0WL0=;
        b=CRsN1wNUNf87JrVXkDJqJPKHaNHpQfGLrRrWC1kEBELLpZ6m49d/kbIPYUouZzX1oz
         LgV8simzLOTyZY+UTDVd3/vcTcY7xuMpCWw1VEimW+zZcpP1HB6T3vGGNiaR5lFCnjcl
         5jWfwHn66CNdlzEtYlUf+BqSQG+JAPFB9cjI+JV4uEIpJU69bwJ3UUOwfDEdQM22bR+v
         OorqIpvusi3cfXSxumn8928zmK1kDx0tu3fPEWAwDbSzToKeOjPs39dZ3oZnMhsktRHD
         BrElaMZNy2QPU3G4uWpXR/Girm/MIOF0VevZ2t4/nwnUBHcDsOCT7QhvcBdr1b8SeEFD
         Yxyg==
X-Forwarded-Encrypted: i=1; AJvYcCVV4HnWZcTaS8Wuom+TVzuqZS4WWyR7PXsm8kDb4CNfjkvuQpCiBjo7yTBhuLr0X3wikxqOZYyD8gavBgZObM3B@lists.infradead.org
X-Gm-Message-State: AOJu0YzklcaMg2Jx13qRPzvAVrISNsxQLiipSvCHVeFbR3NX75gT9k3/
	YR14r7sYxhW4FsMRj6aPNqMCfsSkAVg6V8a532NtQhO75GG8vuVVYge7IuCH
X-Gm-Gg: ASbGncue3fnMgQC3x7uLKE8ACoR8ByrM8v8WS7AtgPB55o+MeqrHqNP40ZcsFr8Ok8V
	JbPAAcpB8cX/zdWGxNQm/OCWm4niP9no67oH6lW31SsWrcggTbo3wQz1i7GIJscbwURqMF81Kc2
	unBxf8jSxGpLlbpHij7QXRPlJ1ZutOME0I+017X1hWJShzNqCNDa4yPq7FkpLAF1dODTvbP6hff
	MqEr1m86gI5oV+AjIQG7mR4z1gkNHuHLNgbrMKuvEeqF+hIiFwims5Zi4Pyn2jC8Zecq4H6dcjK
	9sjrGVvQebrilmKB5goS2cfJJVH/c6RcNkMKK2f7VVDLdsftxomq9gWW998Ljd/S1wxsQYt66A=
	=
X-Google-Smtp-Source: AGHT+IHp4zTUC6AmNsgtbIT1QTmcT5/4B3MbfwmgTfh1T14KXoPC9Z7QGaG//Q10p+squLbFjPKIKg==
X-Received: by 2002:a2e:a5c9:0:b0:318:7f36:da6f with SMTP id 38308e7fff4ca-31f950cccd0mr4092261fa.26.1746076320851;
        Wed, 30 Apr 2025 22:12:00 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31e9485363dsm4762041fa.61.2025.04.30.22.11.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 22:12:00 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso5529111fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 22:11:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURlGN0sTjZEfnsIh9GkwnhdRylOLoSWBKPXZDcAn30kZTbY1YmUqv0Hqk7ZeNxMs5eDLnbvcbEDiibzw7iULw+@lists.infradead.org
X-Received: by 2002:a2e:a902:0:b0:309:23ea:5919 with SMTP id
 38308e7fff4ca-31f950cc7admr4279341fa.31.1746076319318; Wed, 30 Apr 2025
 22:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250430095325.477311-1-andre.przywara@arm.com>
In-Reply-To: <20250430095325.477311-1-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 May 2025 13:11:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v65-YTLbzwxE_X31+Rc76FA+POjEejCCAhYbMxge3175KA@mail.gmail.com>
X-Gm-Features: ATxdqUHTuNPlh61n7f8lB4pnNO-UYTl-k-uXFS9Jz53D2xoCXFTQKPt4GQyFAJU
Message-ID: <CAGb2v65-YTLbzwxE_X31+Rc76FA+POjEejCCAhYbMxge3175KA@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_221206_657171_EC535015 
X-CRM114-Status: GOOD (  18.41  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Apr 30, 2025 at 5:53=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the orde=
r
> of the last two arguments was different between the users and the
> definition: features became flags and flags became features.
>
> This just didn't end up in a desaster yet because most users ended up

                               ^ typo?

Will fix when applying.

ChenYu

> passing 0 for both arguments, and other clocks (for the new A523 SoC) are
> not yet used.
>
> Swap the order of the arguments in the definition, so that users stay
> untouched.
>
> Fixes: cdbb9d0d09db ("clk: sunxi-ng: mp: provide wrappers for setting fea=
ture flags")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu_mp.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.=
h
> index b35aeec70484d..8fc7fdb7ef494 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.h
> +++ b/drivers/clk/sunxi-ng/ccu_mp.h
> @@ -109,8 +109,7 @@ struct ccu_mp {
>                                              _mshift, _mwidth,          \
>                                              _pshift, _pwidth,          \
>                                              _muxshift, _muxwidth,      \
> -                                            _gate, _features,          \
> -                                            _flags)                    \
> +                                            _gate, _flags, _features)  \
>         struct ccu_mp _struct =3D {                                      =
 \
>                 .enable =3D _gate,                                       =
 \
>                 .m      =3D _SUNXI_CCU_DIV(_mshift, _mwidth),            =
 \
> --
> 2.25.1
>
>

