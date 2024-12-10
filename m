Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77922E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBCKmYeQtQXtJD2nS/OX7EenTXHyXCtFX8tV6++9Flc=; b=ZTa8neQmwT1Z0gH06KW2Lj4QM/
	W0AIqhbir6W11xDBU5PXJ150bwxIjQF/fA4xNDu4/Gpy8Ws6lJSr7V8LsPAvDsvQo5vZY1jsCZied
	MhnaWSjCZY10lRfLTwlUStt4jjx7vW+ph4vOVsJat4hLaHcnpCbpfe4AUjjdCnJJW+eJQS2yVg2dA
	4pu3p4AvO+4nD3KB2A7FCizxd49doyJ5v3KmnDa2ViELuf67OzJpDMbPiEOWxOWqQ/nZGZxlgN3qW
	qS9pNFSki1npZsu1tyOJs0sby7KQa5oPLi7iKeeHgZY6sM3w75lZ13j4/IRwRks+A53Vg6fGEGN9J
	5pFL4I8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0IN-0000000BaEF-2FOj;
	Tue, 10 Dec 2024 13:28:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0Gq-0000000BZo4-3F1v;
	Tue, 10 Dec 2024 13:27:26 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so4311579a12.3;
        Tue, 10 Dec 2024 05:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733837243; x=1734442043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBCKmYeQtQXtJD2nS/OX7EenTXHyXCtFX8tV6++9Flc=;
        b=KrOcK7Hp+8iu+N9lQqQ3zSKAEJeuvJiV1jTgTFUxxvVukQY+pPzLcvyg3RNCiBN1XF
         qd2DO3p7HMfyrI0RaNUJMSGk7zjBrdW0ymH/KeKQaBTq+dqOCGbyQf4+lhwSRyPWLht3
         ZMuvpC3JfAMvOKCZ8tYzt6+6si4E2GAW54wFWklBntYNL5jDpVFDYQa0U9WLgN9KZUeL
         ikrO8wjP286tGHpjhScZ/WkK+nlNryXD61GlfDwONpnogT18DgOLUjQ2JZHcqu/yiOH4
         EGyQ0/r137+6U5tQ5xDr6U5KPHyUnh7hUTy/puFVq+F83MWNTBfScY1UI/MuXFzwYKrZ
         0cRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733837243; x=1734442043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBCKmYeQtQXtJD2nS/OX7EenTXHyXCtFX8tV6++9Flc=;
        b=Gxuy02Gi2s6UtK4uPPUGl12Wci3Xkq025VVCLt0kbsBwZxqSrsptZT0TkprniQ4MWK
         jfmpSRVj2edc3JyZxSoiMD9PodQ9BagnGH5hlmHHJiRZLVLxFLD89XAkZfDl8jOHQVox
         YInEaAJFyiPffhtSn7lpRgvJMr9FwAErhtJR/QpmZL8+QyA7eYEZf/5RKOZym7RLn+Jj
         fpsC89XYTP1TcV+wz8ZkugBUtORlqt9LlyMqZruwMxy37WIPQ6l4tzgqrDVaNAHHX1c/
         h9iEWcGRU7X4XLf6/KAUBwpzhFylz6ZpenkedO0pfLT4fVFP6rM1YdI6ghUbJXTqQI3J
         ZPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Rl9nNRLP0V3pDhgyB29wGubvBGJvDbwStsuL8+BHovWTc7mWQojdKlRTj/3ojham0SCPvbOi/rnoN2kJnY4=@lists.infradead.org, AJvYcCWij2kgWxDPRj1rOT/JnYCa7gCZjItbS/sLrBopgsT89BV8NuwixSWLdXWV/YcaWMcwkEV+sgv/ZvpdRybyB2CW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6D6qPRH6RTdJkj5La5i6MulsX3jFSEk/aOJ4XPNVkRHTFEfdS
	dbTrcBOEDijLOAdbhDq6A5YYJdxJ0go0t8WHTrolhyqCCQmQgoOmRfPTMYxcTIN/nGk+Q3CvGXw
	3BD3Qi2dFqhpUAW6pdNYS1hWC8xtk5WOG+E0=
X-Gm-Gg: ASbGnctylIUdypiTqJLT/6Rq7bMl5q3ihIxlDn4R/ravp3nh4aWfBglSjBlA1Jxu+fa
	gKar+eqwxT8W/BPnKklh56ovlQK6wKwjNe0/wGNofSTkYZY8NhAqcVlZ+LPQ=
X-Google-Smtp-Source: AGHT+IH4cq4eJMBBv9InVUxlo+TzZnHjLwzmvamweU5oP6kP+jJlPr/U3U9rCW2HNtHUYQxnPZCF1RFlpv5NCQEhnhU=
X-Received: by 2002:a05:6402:5190:b0:5d0:feec:e15d with SMTP id
 4fb4d7f45d1cf-5d3be6d650cmr14520588a12.8.1733837242523; Tue, 10 Dec 2024
 05:27:22 -0800 (PST)
MIME-Version: 1.0
References: <20241210013010.81257-1-pgwipeout@gmail.com> <20241210013010.81257-3-pgwipeout@gmail.com>
 <0d11705121f29ccfb7cfa342505a6e35@manjaro.org>
In-Reply-To: <0d11705121f29ccfb7cfa342505a6e35@manjaro.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 Dec 2024 08:27:13 -0500
Message-ID: <CAMdYzYqJLK6oJHCUVztth6mtJsYrRQSPzNYpR-ZmR7rNprZXfg@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
To: Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang <zhangqing@rock-chips.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_052724_807026_3E023421 
X-CRM114-Status: GOOD (  24.96  )
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

On Tue, Dec 10, 2024 at 4:44=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Peter,
>
> On 2024-12-10 02:30, Peter Geis wrote:
> > Correct the clk_ref_usb3otg parent to fix clock control for the usb3
> > controller on rk3328. Verified against the rk3328 trm and usb3 clock
> > tree
> > documentation.
> >
> > Fixes: fe3511ad8a1c ("clk: rockchip: add clock controller for rk3328")
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >
> >  drivers/clk/rockchip/clk-rk3328.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/rockchip/clk-rk3328.c
> > b/drivers/clk/rockchip/clk-rk3328.c
> > index 3bb87b27b662..cf60fcf2fa5c 100644
> > --- a/drivers/clk/rockchip/clk-rk3328.c
> > +++ b/drivers/clk/rockchip/clk-rk3328.c
> > @@ -201,7 +201,7 @@ PNAME(mux_aclk_peri_pre_p)        =3D { "cpll_peri"=
,
> >                                   "gpll_peri",
> >                                   "hdmiphy_peri" };
> >  PNAME(mux_ref_usb3otg_src_p) =3D { "xin24m",
> > -                                 "clk_usb3otg_ref" };
> > +                                 "clk_ref_usb3otg_src" };
> >  PNAME(mux_xin24m_32k_p)              =3D { "xin24m",
> >                                   "clk_rtc32k" };
> >  PNAME(mux_mac2io_src_p)              =3D { "clk_mac2io_src",
>
> Sorry, but I was unable to verify this in the part 1 of the
> RK3328 TRM, in both versions 1.1 and 1.2, which is all I have
> when it comes to the RK3328 TRM.  Is that maybe described in
> the part 2, which I've been unable to locate for years?
>
> Moreover, the downstream kernel source from Rockchip does it
> the way [1] it's currently done in the mainline kernel, which
> makes me confused a bit?  Could you, please, provide more
> details about the two references you mentioned in the patch
> description, or maybe even you could provide the links to
> those two references?
>
> [1]
> https://raw.githubusercontent.com/rockchip-linux/kernel/refs/heads/develo=
p-4.4/drivers/clk/rockchip/clk-rk3328.c

It is unfortunate the TRM doesn't include the clock maps, because they
are extremely helpful when one can acquire them. It also doesn't help
that the TRM register definition only referred to this as "pll". I was
sent specifically the usb3 phy clock map for my work on the driver,
which had the location of each switch and divider along with the
register and bit that controlled it. That combined with the TRM
register map allowed me to find this error.

Thanks!
Peter

