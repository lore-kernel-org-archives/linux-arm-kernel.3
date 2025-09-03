Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EF7CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 04:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADtwGUks5/GGWfb4oIFPF0C8f7SmDwE61v3oi+KH4+E=; b=suginJW50805Sw
	l8rB4Lww2Rmdudyhmdf+DXeJevrWMIZH+55NMtJdnIIQ5SvksObrt3W0mBzlDoEpanA6nRJtY0WG4
	vIrJ1TavHSz4DjfudVNwPCynRBKd4olnKGkFNZzaU818pFUk8CFkJjxuHV/1CsDfMj5KMt7H4g2eh
	1KyZGQMUYC1YbYTq8HprdqAG1qwnVo5AVh5bWGHiuT4KC3J7EBZcikXRBS2wxgYe9KM6GJ7++rD5N
	E3NNE2VFfGdFGXicOO68Bn2BTQRGlK4rxcUJ3fnR3XKZuEq64KKCWPFhaRLqoIS3VJOgf9uJSOQG+
	Vf1c14/7dPpUbLiMnCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utf2Q-00000003pOU-0Et9;
	Wed, 03 Sep 2025 04:24:02 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utezg-00000003ocU-0etS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 04:21:13 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f76277413so3633396e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 21:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756873270; x=1757478070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADtwGUks5/GGWfb4oIFPF0C8f7SmDwE61v3oi+KH4+E=;
        b=tXzps1CjETzXziSNo4ZeLNHNoaBJ3ouOO25Ent1dnNi9OecSSbbWjP5oaA1D1XRaSs
         VNiYUuO4XMzazHKKfcEPS8f3qKsiLa2BucSZXGZOIng9JMGw/n71zIgkmjJGizXgVFTg
         9yo5IAJ31YgUz4HFCs7GRv2PfUID2EhCymZVS1qVJL3CzOcXm0hEqwybUrk81YHrpiRk
         Z6EnXhOpxHUqsuGXjLjsEpfUSV5xihxyj5zeeBu4lQfJabLl8F7yzsfPMIP/pQ9qD9xD
         Ovsfnqquppp2mVDznXkMwCIOLA21eHwHqZscI6vxbALkyx2m8MyfIQg9GdohwTwrg6si
         5TIA==
X-Forwarded-Encrypted: i=1; AJvYcCUgZce/g3wRHTVSjEZD+9nF7I1xcdhxm7DqGi429B6q4SgYEjzrCKPsli0W1ze7EHqQ+OsBrq3FqbtUhEkBzy6E@lists.infradead.org
X-Gm-Message-State: AOJu0YwsHueziJM+ikLVSkAKYonQIJHjJp+zytl/OSc2DGc0ppzIBltf
	qqIS1EAy/sBy9WhU2zZjouQmzUTv0bJNl3Xn8yMb5mET6/wxyylwox45gP7fBpOe
X-Gm-Gg: ASbGncsOxsPmmKD8qW/vY03UEr8SaQrwEvr9Gcaf7mCBy8OePz6fr4ci/XWzO4xbooE
	8FDmgKUK0Lh4kTZ6Afxz0EBEweBgZPSf5ZECMFWpGVa+Ns9UHU0U2O4rfiQuFEloCnRBPUzgJMN
	f8/g70/pI0qfp4QpmFw7R3hHKWrZBF5vQsaa29Sy1B8fqs4+ijW1TUp/teRqmXrLRl3GiVAK4N2
	91uo1n37gBeaD8Syzq5JeexgnhmFZVHdG/ydgsP+en40Cif6XoVKXHF6Th/xml1L8sddHkYSD7h
	AdA91CWeWJj4+2Bb+5QUrMZGFj8aq5QaGM6pQ0K0EDbJ/b5oNUqw4a3S4yH8XDeGw0610Xohhk+
	ZeP2MKyPNRa9uWu7v4TZxHGdHzh8GmjhKfkzcbzdeVJbkufbR+RtkzT5Lgqp5kQ==
X-Google-Smtp-Source: AGHT+IHfJ2fGbWvlyWD6fcHHfH6N41oj/KOZ/TIm/qfPj+z+E4MDWbcQ5PlCM7ynbCkMBjidkdh/QA==
X-Received: by 2002:a05:6512:6812:b0:55c:c9f3:6ed9 with SMTP id 2adb3069b0e04-55f708ece9amr3140025e87.35.1756873269519;
        Tue, 02 Sep 2025 21:21:09 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abc1798sm248396e87.57.2025.09.02.21.21.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 21:21:08 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so4513178e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 21:21:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7PEyR4SPhV11ma4Dy4Dh9ZhLG4qfrRTw4Zqo0ZvpsuailJ6JnLMrTYGnSi5ZJ9qArBvywUZESWcK/GKQMFhHt@lists.infradead.org
X-Received: by 2002:a05:651c:551:b0:336:e102:9611 with SMTP id
 38308e7fff4ca-336e1029af0mr33033101fa.36.1756873267878; Tue, 02 Sep 2025
 21:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-4-andre.przywara@arm.com>
In-Reply-To: <20250903000910.4860-4-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 3 Sep 2025 12:20:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com>
X-Gm-Features: Ac12FXwDJPiA6-F7YvlIel1VqSOtkOlXCU1uqZBll3biFaGOGyU1Aw_g7q5-Q7Y
Message-ID: <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: sunxi-ng: mp: support clocks with just a shift register
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_212112_197228_8BCD4E3A 
X-CRM114-Status: GOOD (  20.96  )
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

On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> The "mp" clock models a mod clock with divider and a shift field. At
> least one clock in the Allwinner A523 features just a power-of-2 divider
> field, so support an initialisation of the clock without providing an
> actual divider field.
>
> Add a check whether the "width" field is 0, and skip the divider
> handling in this case, as the GENMASK macro will not work with a zero
> length.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

In my series I have a patch that adds this to the divider clocks,
thus adding a P-clock type to the M-clock bits.

Maybe use that instead? I prefer we use actual matching types instead
of disabling one part of a complex clock type.

ChenYu

>  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.=
c
> index 354c981943b6f..a03dac294d048 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsign=
ed long rate,
>         spin_lock_irqsave(cmp->common.lock, flags);
>
>         reg =3D readl(cmp->common.base + cmp->common.reg);
> -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
> +       if (cmp->m.width)
> +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m=
.shift);
>         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> +       if (cmp->m.width)
> +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
>         if (shift)
>                 reg |=3D ilog2(p) << cmp->p.shift;
>         else
> --
> 2.46.3
>

