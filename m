Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A897FCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 03:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfBVY1jC5OL4Yfzob3d0houbqInXLSFHJbfki1TjZA8=; b=dKaSj7VkFRx1hsFX+6d6AIaoiZ
	ZCHuVbfiIFDfRyD42i0Sww2W2vyHFzDMwG1L6e1ZYBLKUI7VzVRveT1d96PIV/fzLtSPhbPt8AAL9
	VVnlxW2vA4Gd1whLhftwZSIQfAKsJg0ZHb46MNILgOV6YVr8vJHHCXl5Y/V2GmHteXIXeccVeAcDT
	h4upkb7PRzkbxeNk2JJIZS0EzywJy5aYJk5DUp8cO6fcmKar+03+Hd6/9GuFxdptNBCjJg0ihzRDl
	8p6407z77nwCwvI0cRrcPOVIrN7Z25flPrHy8wZmAck4M7590gdKFI0/er2wG/SU/dAJqONrbf8Zj
	o1SUDVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73WX-00000007Xk1-2AKJ;
	Fri, 10 Oct 2025 03:10:29 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73WU-00000007Xiw-3Pni
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 03:10:28 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4dffec0f15aso16500301cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 20:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760065825; x=1760670625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfBVY1jC5OL4Yfzob3d0houbqInXLSFHJbfki1TjZA8=;
        b=MkDiE1fiDBOe4X4TifpvYkHOrrWdMZlVWMQ27pB6WQRP2OUL1YqNhWH5QKZ/5K6+hn
         2t+gzqIByNyctmvHBNlEGKKiEDGzzaxIsxxtcrgVC1sIaF4RZHQqfMq/GX9av+RyBwr2
         ZEgkdbpovYAHQL8TLJ2ke9ZxyYJSflEWXgu6U4pZFyX2Mio316OhwPbkjJ3GEiNs9L2b
         tB1n4pMaRS37WDaXXgdoS9EcCxTeXvJr+kFSU7yU1PVlXwRPW83BdtN9FUpbpS+ktWdT
         JMCRbxYX2LZEOna/ROIIAmuhN4Z5XPP97HCrxG2ogQkKDOYKn5+Rk1zYJ2VQSXy4oNS3
         lmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760065825; x=1760670625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfBVY1jC5OL4Yfzob3d0houbqInXLSFHJbfki1TjZA8=;
        b=q/Dj2cE3J/M+zqP75D56gTHccwQZOjEGL5OPlgnzhRsk3btkBgGKuzHsDmjINK54E5
         33m+plyFciysiyDWJkJ1BCnqNA61FipH9kU9DaMImSfgZi9qyTAtJiN/Vc1eeQUjXn7s
         TO3gt5ofZduRjqGnUh/1nrQoOoxwUWqZ5LMeW844nF8dG2FcOCfhckF3iienC4zyg3vh
         ETHYHaTHVWt69axeQX522xpSBGUIOII5AeG5mkdapMu/KLlsGLHv6XPRZTFHMPE1HccC
         ooS32+GhwqvMjx6C0eRPMtYwgKCSlBAbGhFoBS9+noxBdgTkOU+Vtc6buySRMPPESQIH
         dPkw==
X-Forwarded-Encrypted: i=1; AJvYcCX4JJ4Msjsbenhg0gw8G7GRs39Ij+2E/LCDYNXrmbatZu/OrUrI7wQ/AzKXfNn5rYUJMPcZlFZ/JIJbp+P7+Tuq@lists.infradead.org
X-Gm-Message-State: AOJu0YzrcbExZdGDbD/KC4yLUihJ3rsIYFh69YgykZPGEt/kpPNNWlAW
	P2Z6Vx9mg+5jYvYhagEwotRaZRC52hsiqJFexeEDAkW/Fin2yciOqKYIE3fuIGGDv+rldNQqw2M
	OhCumGH8F9rkNh/o3LC6HNZWiGV4iWj8=
X-Gm-Gg: ASbGncvre74ilcxQYvK3HabNC4mwasI6JHjQLDCVtwTpcFeASWU7CfFJniCw2czJJbK
	VsK0hZm89+N6hpg8uU2sHH85f6ttWDa083aKhE6CPUZ5wHBPOznT6R+AsywsYPp2rmQkJLdJoSN
	tfp6P1aNosR6BWLUkOGvksU019klAA2/PmdofkLjOUlj8LGFbI/cMKtdbhbDo3pQM0mgDBkiUrc
	/WqX/B5tb04tl9NgiqHER9pVTA=
X-Google-Smtp-Source: AGHT+IFluk1MSNac3TCPhPVi9qi50zuTrK2jUh6H0rLnaJa6VffG1JzsGBd2YJ7unkitxA1fB1mu0nrqMsKlTJNit7Y=
X-Received: by 2002:a05:622a:4291:b0:4b7:9171:7b10 with SMTP id
 d75a77b69052e-4e6ead65002mr133384621cf.64.1760065825344; Thu, 09 Oct 2025
 20:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251009084416.45542-1-jjm2473@gmail.com> <20251009084416.45542-4-jjm2473@gmail.com>
 <aOe_0EufouURu7R2@shell.armlinux.org.uk>
In-Reply-To: <aOe_0EufouURu7R2@shell.armlinux.org.uk>
From: Liangbin Lian <jjm2473@gmail.com>
Date: Fri, 10 Oct 2025 11:10:14 +0800
X-Gm-Features: AS18NWDTnRTIksFcQ9CLnbgJn8_5OiC5-7_R77k4csy5P5t4wcfC3lX9jt0dZps
Message-ID: <CAP_9mL4PRcYr1o7Vand+wws34GxGBzaVvY2p29Lyrzc13kKvMQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251009_201026_901941_C71DDA62 
X-CRM114-Status: GOOD (  28.51  )
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

In fact, deleting {tx|rx}_delay also prints errors,
but it does not affect the function.
I agree that these prints on the driver should be fixed.

