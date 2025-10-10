Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2B3CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 03:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmWw5+Dj1mFyUNTa6/5YxEtv7JkoN4Y3GT6P1fyCsMU=; b=kElVRvYudG5s7OZNeNkWocIyLT
	omD+BXGTgdiFujX6NJqiNb3Z25MMX5svVJrxAT+trAQcnv/GQ7kuXPD6K2i/qlgd2OOIzsESbS2ke
	YPhcchuBIKVwt4KcE67MUvmcfehPqiP3IcoJTwxG+YbjBI4NeBPlT1CB94I2ecCt8RX2vwJULq+nh
	YQDkWWdU9Pbt7Zf/AQxD8/n2SOQW6HHcPAVClFKeNEul3Zny9jEyW961Yzt2yugXKI3Kz3B5qbdj9
	hgzThchxO7E2MiOOYJ++UA2YpN1kp/VzPggJXW6+bTyup2XQGwvSL8knJe0GVWdV0GTyq9nBNYn+3
	Ua2trguQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73g7-00000007YRu-1ZWr;
	Fri, 10 Oct 2025 03:20:23 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73g5-00000007YQw-1IlB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 03:20:22 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ddf60466d4so18492511cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 20:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760066420; x=1760671220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmWw5+Dj1mFyUNTa6/5YxEtv7JkoN4Y3GT6P1fyCsMU=;
        b=PHe8qFyFQDl4RU7ILvRrkr+1TWkXL7VlM7w7CHYp1vwfHQHre0RHte/5T/O0OFi3FR
         nlKJ47/vyoA+DBYxKvFlwUC40xfIFkt2gDTZk8L/mMO+/krS6GvMQYbktYEw3ucnuZ7t
         N2WIVFwwc8Vu8DAVezCRzYAn/zFoxKP+D4E7viLI83Z05ib0keS/Lt9t1cFZ499VEHKq
         h02bGTom8+7THOJ7ScTB1g8b8C8nv0RpNysXXoDEwMs8DZ7t3p7QSsq4Z/Df97eUdAzd
         O9zu9Ft8/sE4k5fLjUZWpP+dVAPdK2liN8Yxzibq7Ql6uKZMQBrPLKo9X8tRCYOeFZK7
         2+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760066420; x=1760671220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmWw5+Dj1mFyUNTa6/5YxEtv7JkoN4Y3GT6P1fyCsMU=;
        b=wj776D/B7HYeqypNSKKFtpnGUgaTnIuNQ7fVtoy+X20207iQHSCRaYPckui42SGi4f
         DMmjHKTgMk50w6HC/pPRvIhLq1HPVX76gXzDMZDS8WnSP8xior8seQQtCiAtI1zUdblN
         H1pSRwIe+YJhQaVgcMcDysswLid4l/bd64c9DzAVboWchOsej317z3TH6UjY39zThQz3
         2R2SDxCF5sAfM4nC9XQt8nKk8up9IefenHi0ZYq/oPH8C1me+KfsmAaClDCqanc8rUwo
         X01HhqEwdPtSppgduB9dqoUWA0FMBX2bDXlTwpvrN0ebVzCWb0tdaD04CbYMhRnEW+m/
         Pp8w==
X-Forwarded-Encrypted: i=1; AJvYcCX68Hwh7MRdaJtcZ4AeCJzpGqQoTf6bmekA1iME6hlzfdcTw3y3zXJgeSk5sDQvDi8GcDmCMpyOvnlcySGonZdL@lists.infradead.org
X-Gm-Message-State: AOJu0YzA29NFFeUvW5tPjt8DwTQeYShd65RLS6NZCePpNkZz4t4qu3O3
	EEJEfPfEms+X394Gn8Jwy75ZLYaKWlx3Ai7b5/hiknzxPkSwBEtuW9IB1Sz0JZVgnrqFkwmo7pj
	qF0qQggrQku5GxCkXAc5Co/q1ssKh2AQ=
X-Gm-Gg: ASbGncuMJr7fs86V5+yXUN/8qJ/8cAaJ4Rqfilj49lGO4Sd5ggF8vjenbxqZ/WAkGeY
	jNA6qBARcZLO2jrWqyH93qYtruYIJteAp8UouZBoDzoXxORAr+f6BPyCkvTT8quk7JPok11RD+W
	MSCTj2G9aM7nqLSgnjD6HjhZbdsN+bnKWVTqgCx6zaGvC6frBkYzooASIkMj89DgqfXeulbKuO8
	02TwtWiUR8YR2vhZkuEZBvs4Z5nT5UZO+sgxA==
X-Google-Smtp-Source: AGHT+IG/f2JLTSStGduS6XZjeZ+es0r1EhO6WUkmy1NWRrK48A440J2He6YHChg8tiyLaptae0m7b+ub/wDnL1a78ak=
X-Received: by 2002:a05:6214:19cc:b0:795:67ac:ca5d with SMTP id
 6a1803df08f44-87b2109283cmr151808406d6.30.1760066420103; Thu, 09 Oct 2025
 20:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251009084416.45542-1-jjm2473@gmail.com> <20251009084416.45542-4-jjm2473@gmail.com>
 <aOe_0EufouURu7R2@shell.armlinux.org.uk>
In-Reply-To: <aOe_0EufouURu7R2@shell.armlinux.org.uk>
From: Liangbin Lian <jjm2473@gmail.com>
Date: Fri, 10 Oct 2025 11:20:08 +0800
X-Gm-Features: AS18NWCmhVw11nXPu-jU8ygXHImQqmaDaGRECyqzHvDtAZ_V_270USq7PdCB0EY
Message-ID: <CAP_9mL4MfzagxiMD1VdOu=jBuN_XsOrvPQT=XTVgu2+G=+nD9A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	quentin.schulz@cherry.de, kever.yang@rock-chips.com, naoki@radxa.com, 
	honyuenkwun@gmail.com, inindev@gmail.com, ivan8215145640@gmail.com, 
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org, 
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org, 
	jbx6244@gmail.com, andrew@lunn.ch, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_202021_378067_2533D1AF 
X-CRM114-Status: GOOD (  27.87  )
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

Russell King (Oracle) <linux@armlinux.org.uk> =E4=BA=8E2025=E5=B9=B410=E6=
=9C=889=E6=97=A5=E5=91=A8=E5=9B=9B 21:59=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Oct 09, 2025 at 04:44:16PM +0800, Liangbin Lian wrote:
> > +&gmac0 {
> > +     phy-mode =3D "rgmii-id";
> > +     clock_in_out =3D "input";
> ...
> > +&gmac1 {
> > +     phy-mode =3D "rgmii-id";
> > +     clock_in_out =3D "input";
>
> I am fine with what is being proposed here, but I think this
> clock_in_out property needs fixing. The description for it is thus:
>
>   clock_in_out:
>     description:
>       For RGMII, it must be "input", means main clock(125MHz)
>       is not sourced from SoC's PLL, but input from PHY.
>       For RMII, "input" means PHY provides the reference clock(50MHz),
>       "output" means GMAC provides the reference clock.
>     $ref: /schemas/types.yaml#/definitions/string
>     enum: [input, output]
>     default: input
>
> The problems that I have here are:
>
> 1) the description states that the only possible value for this when in
>    RGMII mode is "input" which is reasonable, because it's due to the
>    RGMII specification. The driver code is perfectly able to determine
>    whether RGMII has been specified, and set bsp_priv->clock_input
>    itself, relieving DT of this need.
>
> 2) bsp_priv->clock_input is only used in gmac_clk_enable() when calling
>    the SoC specific set_clock_selection() method. Only RK3528, RK3576,
>    and RK3588 populate this method. Every other SoC supported by this
>    driver still requires the property:
>
>         ret =3D of_property_read_string(dev->of_node, "clock_in_out", &st=
rings);
>         if (ret) {
>                 dev_err(dev, "Can not read property: clock_in_out.\n");
>                 bsp_priv->clock_input =3D true;
>         } ...
>
>   If one doesn't provide it, one gets an error print, which is not nice
>   I note that the DT binding doesn't list this property as required, so
>   the code is at odds with the binding.
>
>   (I note that your Rockchip SoC is RK3568, which doesn't implement this
>   method.)
>
> So, taking both these points together, the code should not be printing
> an error if "clock_in_out" is missing when either:
>
> a) RGMII is being used (or maybe only when RMII is being used?)
> b) the set_clock_selection() method is not present for the SoC variant.
>
> With the driver fixed as indicated above, I then think clock_in_out in
> your descriptions becomes unnecessary, and should be removed.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


>   clock_in_out:
>     description:
>       For RGMII, it must be "input"

This description does not match the actual situation,
there are many dts using 'output':
https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockchip/=
rk3568-bpi-r2-pro.dts#L235
https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockchip/=
rk3568-evb1-v10.dts#L241
https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockchip/=
rk3568-fastrhino-r68s.dts#L33
https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockchip/=
rk3568-nanopi-r5s.dts#L78

