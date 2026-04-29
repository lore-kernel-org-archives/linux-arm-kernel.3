Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03C9FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=; b=hbWeYfVfr4QtvE0hqMb9C9R6YS
	H/kP7EpRb+epdnM0vOJY8niHeWP1wylTdMEa6G5KO+uST0LWBVDq/KE7Z4IHk482ZIvjWMK3w5zR5
	jxe3d1CgJdO0leD4HEXDkugwAWQvVwRFzelNwVSrns3ttytoBvuphIM/Np1s3T7Z711rOAgiRr3A/
	4Tsi0LKquJKEM7SkqFpWaNcN6yuzP3ZmYiu0ZjbAxFsKLgepzzFj0YtPL0IA3GAH8+Ja3YQGv+Ybj
	xwcQi7WM/BgSQJJG7K2eyvIAbb7Pa33whqz6Gw391LLgbBaYzQ1x5M60/5gvXv090gpN39CoR/hGX
	ClLx+a9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0q6-00000003Hch-1Dfe;
	Wed, 29 Apr 2026 09:04:16 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0q4-00000003Hak-0RKK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:04:13 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so18845087e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777453450; cv=none;
        d=google.com; s=arc-20240605;
        b=PanET+F5j3V0ghg+6o0845UXrbdAhVdOiRqBq8HvcpOUt7es7c00k3EACxs1TbVdgn
         KAdnayPuA65/vwY9gfyn7IcGqGFkrnfPBxSwLzj4f2/GdDpd2Vvx+zq4PTxPohPICYyq
         FTyBerG1r8S7foZryG9wOsLYfuKC+d0seU7kpKF9IZQR4hSEPPyfq3HsEY5dxy3d+kY8
         AS5CSJMN6vY2TUvRnnsO7G0TNJTLrPKHO3UeOASZVSKcd7QHXAEQ2hkeVbaLjkbsW4GA
         yCCipUU2xicVRdTm/kxTv5GjvL+K/9S5V+bUAx+jX0Mo8ZtyHneZpAMfNv+GL4H5b41K
         nMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=;
        fh=WaAqm/y4dgnpf9+IPTnqA3TR+v1pEti+GVCW5P+1Xss=;
        b=QttA3vgzjnzt4GDMAX9DwDyC/JVMMyHO0SRcjfXbvBK9xOhbk9kbVCXesNchBQjJ8I
         YnYpf8GVKwJsJ8ekWX3vMZoFZuVa7w3CDFrb7m6snFI8zDDyp0tEa2jVsoBzWitPSd16
         M3x5v2rKKyhQqicIzLdr7438SbavHjfMZ3a0fU5UP6p5qIAfMpp1UourJ5SlTZQG40jC
         Jds0g/I2pThMZljUmCtBAZXAdhrZyyRRZxPMw3+rnqv5fusz0mvDijt+0S0SDGRTDt81
         YlmO7PR2AqNoXAF9WMmIb5/z5BP46E6P0Li2R1d9P3AAM/rq368qwmhhwkrYdp7AX9Re
         oEaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777453450; x=1778058250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=;
        b=es05zT1sCrCGmHGooXZjW2bpRm3r0vN53Ys59CDvN8UnKKEIX1ohxlOos3HwH4s3pq
         S83MEvuHdD5wRvZfuWBea22Zy62tCQvyHcBAqP7uIYbYRe9sYNaXlvfjKkV0iU/dj3Kd
         eH3ydD/OUTJrwgqbKH+Do1DeNi1QPXsH1E32g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453450; x=1778058250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=;
        b=CU30Nk6Cpig5urLNDyAeD2IM5GKSALhHN3zODxEAYlIvJ8oEsY91KQs+lgsEmlCeZy
         BMibHEW93asoU/9ZRu15NsO0F25tBbljv8f6hpJygMNgIEvclsyTQDhRae12hukIZXJ9
         Z6LlYkmS1BfM0u3JbOg00joVG6s7HvKCKlLcExXvOYbEYH+wMNN1zINk0d3odmyTx10x
         V/IoUbpgKxmbP27R/JO5tXj+4rh6cu2og7ttUaCK9gm4YuL1zhK9qxgAnSuGmtunW3D3
         RlO+Ed+hlMt+rPC60gXJDBRwYp9i6FLgSnwWc74FKTQoyW+HAbmuJRV/gPZsIu9AVhds
         MJYA==
X-Forwarded-Encrypted: i=1; AFNElJ+tKY3sR15bte7FCQJZzMw1YMoxOZyReRCm2XHCDIyvw2qjUrS0MZxnhCHD2c65rwlvdXIbl9u1TvmM0Z5RaBCO@lists.infradead.org
X-Gm-Message-State: AOJu0YzA2XeHbHlQRwIR4UDGEF5lhDxd0PXnQzeg5oVm5nCDVMC1jWEl
	lTkUUZHweV1CI9PrWtv+M5FMeQ7ZZ6wkBFziu7P2eKFuBnbSqh4hbrVsj9sK6msrSgO7zM/X/qn
	8FNOvsdP6bSu6cwrVr5FdcmalHWbSfTtQR1LZy4+3
X-Gm-Gg: AeBDievwfBoqHAAAezSNT99EZsZ/h0ForGNDNqMomLaUOPHZGrXnmxUNIeX5SB+hp+B
	kPOiYOjZ13kzme3F2tYnbkmEHjHUU+E+MhR2GNMhXwbIkP84Yt6XR7BtvlcCKRNY2vEeyAocAk3
	tfo0nSZnb8pWKTI1jy6BcHPWFMAZMl029RVTO4tZrB4pv8KWPvbVzYEuMxUi8iPtvnkqlgcUB86
	FTC06ib/QiSUOQLfWy2PT6fsZ7stdNPJrzVxtPt2NW5XHBfbQFguHJh6OV/UHh/EQlxI6qW4Vbc
	sg6SskqlYi6ioTAL9A==
X-Received: by 2002:a05:6512:3e20:b0:5a2:b802:8ccb with SMTP id
 2adb3069b0e04-5a746408066mr2496679e87.9.1777453449817; Wed, 29 Apr 2026
 02:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260427021021.2049015-1-wenst@chromium.org> <CAD++jLnP9HvWPQg8WqoFkgRoFCWjkOUsRAgtnks4mEhHwYRt+g@mail.gmail.com>
In-Reply-To: <CAD++jLnP9HvWPQg8WqoFkgRoFCWjkOUsRAgtnks4mEhHwYRt+g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 18:03:58 +0900
X-Gm-Features: AVHnY4Ixa_LZNIgCLfsb9GbOKAlcF0QKkeNUnPhDAMaXwaGqxThuDX0TJXAaFJ4
Message-ID: <CAGXv+5Fwc3a-pedzydrE6OiCDS=a+6Mkqm2=3JX2NmoBg0nc-w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: paris: Directly modify registers to
 set GPIO direction
To: Linus Walleij <linusw@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_020412_214793_7AC3A3F8 
X-CRM114-Status: GOOD (  22.54  )
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

On Tue, Apr 28, 2026 at 7:44=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Mon, Apr 27, 2026 at 4:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
>
> > pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> > the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> > Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> > the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to chec=
k
> > whether it can use a spinlock or needs a mutex. In this case, it ends
> > up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> > takes a mutex. This causes a huge warning.
> >
> > While this class of Mediatek hardware does not have separate clear/set
> > registers, the pinctrl context has a spinlock that is taken whenever
> > a register read-modify-write is done.
> >
> > Switch to directly setting the GPIO direction register bits to avoid
> > the mutex.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> You are essentially decoupling the pin control back-end from
> the GPIO front-end, can you try to do this a more friendly way
> that doesn't wrangle registers out of the pin controller like this?

This is essentially following

    commit 8df89a7cbc63 ("pinctrl-sunxi: don't call pinctrl_gpio_direction(=
)")

And in MediaTek's hardware, the GPIO direction is even further removed
from pinctrl. GPIO is a function that gets muxed, but after that the
direction and data bits are in separate registers that are grouped
separately from the pinmux registers. The pin controller doesn't have
to be involved.

> If you insist on doing this, you also need to DELETE the pin
> control back-end function
> mtk_pinmux_gpio_set_direction(), which is what gets called.

You mean delete the .gpio_set_direction field from pinmux_ops?
Sure I can do that.


Thanks
ChenYu

