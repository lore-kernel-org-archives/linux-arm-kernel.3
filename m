Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87424C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3Q51sZ60y2IRit4uwnvdvwQuRZcBvSxnxMj6vQGFPQ=; b=HEcvegcKOcSNy5r5dOuSSQluOW
	aKA0sr9Xdjwd8xNf+62X1L9Ib3hGFATUWeqVN3c3RNsRhA4S3LGND5p8fnQ2s7fbf0kWCHBUl6xPT
	VPWsxps75xqmqAtfuCuC6lk6vIg+9S8ODy16i1uU+je3525skL+OqQutlWnlcoUWSL38gCK6ni4s4
	mGRs9SQ6xEm1IAwxNzxYIOa330KRVmZACwJLegT774Kvux+Go5fcmIKAkomKJvo+JXhKQmj1Yi9Tm
	5v1aUOhFuMqcp7bHaU1Tws+uxi48GR84iTrlHufqFkQiotfBMPO4uCQG8koR/XL0SyW0Ki4zPfVCj
	Yt0dsRRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28lj-000000045yc-2cOg;
	Tue, 08 Apr 2025 13:13:35 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26XC-00000003k2L-2dyc;
	Tue, 08 Apr 2025 10:50:31 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4212271b3a.1;
        Tue, 08 Apr 2025 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744109426; x=1744714226; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3Q51sZ60y2IRit4uwnvdvwQuRZcBvSxnxMj6vQGFPQ=;
        b=fNDDCxfFKS+u6xnRWloRwmD2LMSN45Ncq9cojY2sB2QplWeydpuF07qUgcfheHu2Rt
         EehK7ZhvWOoHB7F2dh3mDQHcWnH9jNDh7hvbBe6usedJCLmH9T6QUdBhhfYVSZ7Joylz
         PpQ8+g3r6NuAVz+u9I0nXWRhFH+ooWCxtwdRb3XdKACxoM6kh8VxSxJHzTp2JANHwxF1
         zxY0xB+SP9VFdK7btvWqQbERz3LJhOKeQP79Zv2QBln3asQ9h+Kvegx11+rYir9qiA+Z
         5gotKdyzyj/IUR3BoknXwc8Zm6piTqFx7fpPLj/u8rc2sodJn1nD8CP3m3dnVEtSn49M
         sdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109426; x=1744714226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3Q51sZ60y2IRit4uwnvdvwQuRZcBvSxnxMj6vQGFPQ=;
        b=G5VOaE1iV6/JC+l5j7YMViL4PDwQNfkWBnX9LotUgWt4p01BYkzwJrxPYI9Snb/EIQ
         P2g+S9eCJXVRmSuMFF/y7sQfHjJdnZksbGyLT2o94Nib7WD7mIXuzqGN7Gdu597jhjRB
         oNKVQYELqr9IJEe2rcQNk5y2LMpj+q1CMcNCG6Y51vTG97l0jOC7nE3x+NbncpFC0VwU
         9u9Dxe8FW6vvj0ivOSzr+HgHWEr2PlbqQ3D9hJTu1Vppti+YP1Bdbs9oq8zQ5p0fMP1/
         /zxbq9S0vz53tcGSe4f85eKda2xhe12B3CoSszrbsyU0PACquwFu1P70k/8TIbegukOP
         kfgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN+PVbgla6NIqDdX5X9ItksqJlLcnrvBmajk5ZjhTDyGNsHxPIUt23agG3K/m4Op9/T6a5U0US0V2hlhHUvTwN@lists.infradead.org
X-Gm-Message-State: AOJu0YygPwdUDEFb0oBVJBLEVq9T/C2UqtihiDJVWMzxr+S1K/nSVFaT
	c3tLyIhp9d3V6awNrSaFiVx6NDARewRt171zXRL9yh2vw6n2zkh+P9EBbpivxj7dLUish3TI/ZT
	mRcawtXm7ss5MnpC6L4MhUCl1GyE=
X-Gm-Gg: ASbGncvNhj/NM7fuuZMIhuq4Lx/7NvL5seUwC7nK9tpsAp4K7ufNZHntH0LHpN0SgAi
	oaR8ownhbdWpkgdzT4875TFCztMybGpcO2PAGOQonMNEM6ZYSIoF2G2EM7gY+t2GTu2NwMa12uX
	AuSh5BxuXCGpUolDjstcgD8gMoiaegw5Q/424FwQ==
X-Google-Smtp-Source: AGHT+IFSFb+27H971KbXVzz4EA/pQ4KZ6RM/00kknTpi6QdSo41B8akPVUKL+TDvHdXUVTdc2mjINkgXv5Uk3yDpFHE=
X-Received: by 2002:a17:90b:350f:b0:2fc:ec7c:d371 with SMTP id
 98e67ed59e1d1-306a60e4acbmr19761690a91.3.1744109425696; Tue, 08 Apr 2025
 03:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250408063126.38904-1-eagle.alexander923@gmail.com> <3871892.kQq0lBPeGt@diego>
In-Reply-To: <3871892.kQq0lBPeGt@diego>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 8 Apr 2025 13:50:12 +0300
X-Gm-Features: ATxdqUFHAHiaqii7LVTJPA3SVoeUA4jgiLCR4gVUptoIYcrxzRz4O4py-gVNqIc
Message-ID: <CAP1tNvQtNY2GZ3HKUtaqKeMY-g7ie2CejDhbTZNYuipgXwif8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: clk-pll: Fix CRU_xx_CON2 register usage
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_035026_670947_83AB0729 
X-CRM114-Status: GOOD (  21.66  )
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

Hello.

Yes, everything works as expected:

# mw 0xfd7c01a8 0x00001234
# md 0xfd7c01a8+4
fd7c01a8: 00001234
# mw 0xfd7c01a8 0x00005678
# md 0xfd7c01a8+4
fd7c01a8: 00005678

=D0=B2=D1=82, 8 =D0=B0=D0=BF=D1=80. 2025=E2=80=AF=D0=B3. =D0=B2 10:31, Heik=
o St=C3=BCbner <heiko@sntech.de>:
>
> Hi Alexander,
>
> Am Dienstag, 8. April 2025, 08:31:25 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Alexander Shiyan:
> > According to RK3588 TRM, CRU_(CPLL/GPLL/etc)_CON2 register
> > (rate-k value) does not use highword write enable mask.
> > Lets fix this.
> >
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
>
> The commit message doesn't say, but did you check this on actual
> hardware too?
>
> Sometimes there is a disconnect between the TRM and actual hardware,
> so the actual real-life situation should be checked.
>
>
> As for a test-case, any write without write-mask to a register that
> would require a write-mask would not come through.
> So with your patch applied, does the register value change after
> the write below when reading it back again?
>
>
> Thanks
> Heiko
>
>
> > ---
> >  drivers/clk/rockchip/clk-pll.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-=
pll.c
> > index 2c2abb3b4210..77ba4d6e7b5f 100644
> > --- a/drivers/clk/rockchip/clk-pll.c
> > +++ b/drivers/clk/rockchip/clk-pll.c
> > @@ -959,7 +959,7 @@ static int rockchip_rk3588_pll_set_params(struct ro=
ckchip_clk_pll *pll,
> >                      HIWORD_UPDATE(rate->s, RK3588_PLLCON1_S_MASK, RK35=
88_PLLCON1_S_SHIFT),
> >                      pll->reg_base + RK3399_PLLCON(1));
> >
> > -     writel_relaxed(HIWORD_UPDATE(rate->k, RK3588_PLLCON2_K_MASK, RK35=
88_PLLCON2_K_SHIFT),
> > +     writel_relaxed((rate->k & RK3588_PLLCON2_K_MASK) << RK3588_PLLCON=
2_K_SHIFT,
> >                      pll->reg_base + RK3399_PLLCON(2));
> >
> >       /* set pll power up */
> >
>
>
>
>

