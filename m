Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297E5CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3fxFMnHvhHYZxkU89prvgFn6OmHBSMeJm9YGzPYMJU=; b=x8FohZtmSbvasm3E4JAo+LTMGB
	b67kMYmWsdfGW+rekX/V5vIknX5L+Ua35XOWtSiBP0oiTfPVdCtbG9yi/SWTP0LWCW4Fk7ZJnDVGu
	6dvYBd7e5bErWWQItn98bAmHIbssZ946PDJIv4gg7lHQ53otOURwkt9msAlljW5dwS5CblcuZM6t7
	4biR1o1j4Au6raW5QMP3fWQMe1bBPujV2xQt+hufzCsllsg+PxP4FK52YxTGr4j5naUJcexy2X761
	PeKFC8uBawNPc7kysBVzzBGmQlddjoe6V2MDY3qW4esIv615C+1/znM1zW7BheVHfFX7SsxwXBBHa
	XbhEqx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JCp-0000000DJQl-1Lva;
	Mon, 13 Oct 2025 14:07:19 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JCm-0000000DJPN-100i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 14:07:17 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-85a4ceb4c3dso518494685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760364435; x=1760969235; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3fxFMnHvhHYZxkU89prvgFn6OmHBSMeJm9YGzPYMJU=;
        b=IRpERlXeN4wCouQlBIn+th7qvjqEOezOw+wDu0bj7qvULXwBS1Gr3Qvx1IhzE3z6mP
         2qaE4ytIDY+QD9qnJzSwaadTuTMns/jvTPeXAdVF702POsJ03N5B87yfOBvJ6fLUC0/9
         DqUUOwDDhGodOY6kklnXlW6ptwJGRF0Uw3QJ+NunD52z5g3n+4xGWX2sedtTaIFUU8ag
         MT+u9ekgRfcBDCo2uq6mwPN7fHwv7/WK3gSM9HkQLCAtMd3d0N8h7upgdHT0Oj23u099
         LVfxq4nZQqurJWuGxXtgz/VvJOeeHxapy7gJHnCEFH2rkRWEvtsxbW8bseJmU42835BY
         Y06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364435; x=1760969235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3fxFMnHvhHYZxkU89prvgFn6OmHBSMeJm9YGzPYMJU=;
        b=AO4Kk6bZtu/tOaAun/KxrWdEy3QGS396WeONgY0kLa3ymk+957hdwict3hlkXJX17J
         C1rJW8ClXlTj6T84H1h3uOi4jlGkn5M+eGxWB8Vh2bFny+9+Hcp5/cqXHjfjYeIh60fv
         /a8d2UUV+73ftO7wce0KruBmkOGle9+po0xBFUifHKhodu4Oj7ORF+RbPdrKVH9mrAyh
         bhOwHuOsHDZleJeGuYvl5hP/TX2Zu57bvRcT2YC5RMoI+1rKYoiBh4r94iNnSI51I46h
         kzgPxnfUQmrH57HmfFk4/rD0284/u6doN12If1iUeCmUKv55CncTTb2h8zvSiy3xC1fU
         cWgg==
X-Forwarded-Encrypted: i=1; AJvYcCUbxNw1406UMFPaWq4l5kpElgmarSSCsOnv6yP7Mth92bkzhFVHyDr+m8qYlFxXJGD3HWQ9htEMxzIrqT7qTzBC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1TkpOFc1LF7c+Nvzx8t0iNM796OyKFFv0FvnV3fs0K/AvBqpL
	PtN9uAMpDtxs137nsmMkIKkYQZV7Jag3tN+c77tQ12DsBMMUGNlC+G3mn0U6PtRfUsXWivz57Wy
	Nl10mS2SjTzj2mLYcoXXUuFcUz/7x0XQ=
X-Gm-Gg: ASbGnctgKmAb6GuxoC0+WrVXJK/vBANZDNspR86BKAGllEYcYIG7hLYloUBg1G0oY+E
	GIHpjccs7JHezrbzomlSohqvScCHx7jEHO34j6Oe+r27IPrDGvdZQ4YZfnxvscFrcBe/gyJTt/S
	WIfK+o3qFtQGiWGFvqsYWy2W1ohkqQbEXoGln9YMr1kYb+IG8sDOu2xilZjcjm7dNqv1D6gsIXA
	nCShgQCN3QT/poYK/lSiMRevwuHCJt5g7BJeg==
X-Google-Smtp-Source: AGHT+IFJyxN0Hv1Y4GUd/peF3juYf0BASxuDUqSk2KfDDUExhxmcAVmPSatg4At2Xmntps9WxQl2SPNothq8SpuZzXY=
X-Received: by 2002:a05:622a:4c6:b0:4b5:eb7b:2789 with SMTP id
 d75a77b69052e-4e6ead4825emr307845311cf.49.1760364434713; Mon, 13 Oct 2025
 07:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251009084416.45542-1-jjm2473@gmail.com> <20251009084416.45542-4-jjm2473@gmail.com>
 <aOe_0EufouURu7R2@shell.armlinux.org.uk> <CAP_9mL4MfzagxiMD1VdOu=jBuN_XsOrvPQT=XTVgu2+G=+nD9A@mail.gmail.com>
 <aOz1SzpzGLDQjiYQ@shell.armlinux.org.uk>
In-Reply-To: <aOz1SzpzGLDQjiYQ@shell.armlinux.org.uk>
From: Liangbin Lian <jjm2473@gmail.com>
Date: Mon, 13 Oct 2025 22:07:02 +0800
X-Gm-Features: AS18NWC2KWpOjrIZRCNJ-njN7lopgvdR9BZGhK7C99VWUiJOF3JdegyR1Tmc-SU
Message-ID: <CAP_9mL6x=p169y026nNycZsHK6UMHqJ+o-M_k0MqnvpB2fPzJg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251013_070716_313998_5C249256 
X-CRM114-Status: GOOD (  34.97  )
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
=9C=8813=E6=97=A5=E5=91=A8=E4=B8=80 20:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Oct 10, 2025 at 11:20:08AM +0800, Liangbin Lian wrote:
> > Russell King (Oracle) <linux@armlinux.org.uk> =E4=BA=8E2025=E5=B9=B410=
=E6=9C=889=E6=97=A5=E5=91=A8=E5=9B=9B 21:59=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Oct 09, 2025 at 04:44:16PM +0800, Liangbin Lian wrote:
> > > > +&gmac0 {
> > > > +     phy-mode =3D "rgmii-id";
> > > > +     clock_in_out =3D "input";
> > > ...
> > > > +&gmac1 {
> > > > +     phy-mode =3D "rgmii-id";
> > > > +     clock_in_out =3D "input";
> > >
> > > I am fine with what is being proposed here, but I think this
> > > clock_in_out property needs fixing. The description for it is thus:
> > >
> > >   clock_in_out:
> > >     description:
> > >       For RGMII, it must be "input", means main clock(125MHz)
> > >       is not sourced from SoC's PLL, but input from PHY.
> > >       For RMII, "input" means PHY provides the reference clock(50MHz)=
,
> > >       "output" means GMAC provides the reference clock.
> > >     $ref: /schemas/types.yaml#/definitions/string
> > >     enum: [input, output]
> > >     default: input
> > >
> > > The problems that I have here are:
> > >
> > > 1) the description states that the only possible value for this when =
in
> > >    RGMII mode is "input" which is reasonable, because it's due to the
> > >    RGMII specification. The driver code is perfectly able to determin=
e
> > >    whether RGMII has been specified, and set bsp_priv->clock_input
> > >    itself, relieving DT of this need.
> > >
> > > 2) bsp_priv->clock_input is only used in gmac_clk_enable() when calli=
ng
> > >    the SoC specific set_clock_selection() method. Only RK3528, RK3576=
,
> > >    and RK3588 populate this method. Every other SoC supported by this
> > >    driver still requires the property:
> ...
> > >   clock_in_out:
> > >     description:
> > >       For RGMII, it must be "input"
> >
> > This description does not match the actual situation,
> > there are many dts using 'output':
> > https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockc=
hip/rk3568-bpi-r2-pro.dts#L235
> > https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockc=
hip/rk3568-evb1-v10.dts#L241
> > https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockc=
hip/rk3568-fastrhino-r68s.dts#L33
> > https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/rockc=
hip/rk3568-nanopi-r5s.dts#L78
>
> For all of the above, whether it is "input" or "output" has no effect
> as these are all rk3568, and rk3568 does not implement the
> set_clock_selection() method.
>
> static const struct rk_gmac_ops rk3568_ops =3D {
>         .set_phy_intf_sel =3D rk3568_set_phy_intf_sel,
>         .set_to_rgmii =3D rk3568_set_to_rgmii,
>         .set_to_rmii =3D rk3568_set_to_rmii,
>         .set_speed =3D rk_set_clk_mac_speed,
>         .regs_valid =3D true,
>         .regs =3D {
>                 0xfe2a0000, /* gmac0 */
>                 0xfe010000, /* gmac1 */
>                 0x0, /* sentinel */
>         },
> };
>
> I'm going to propose:
>
> 1) that the driver should only print an error if "clock_in_out" is
> missing _and_ the SoC implements the required function.
>
> 2) that the driver should print a non-fatal error if this property is
> specified in DT _and_ the SoC does not implement the function to
> discourage its use.
>
> 3) [tr]x_delay should not print an error for non-RGMII phy interface
> modes.
>
> I consider it a bug that a driver prints errors for properties that
> have not been specified that it does not actually require. By doing
> so, it encourages people to add useless properties to their DT
> description that will never ever be used (e.g. because they are not
> relevant for hardware the operating mode that the board is setup
> for.)
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

I will remove clock_in_out, its default value is 'input'.
After removing it, there will only be an error log, which will not
affect the function.

