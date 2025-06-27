Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FB7C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 23:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzzFxvtsJDUS1GN+Rp5blvMdsxvFtXnK7MAb3nkjiUk=; b=iciJzeRBZkZ0Mg3vgAYOOswvW+
	Hg0wiegslEKBlIT06uGInLTw43pyF3UEjkxf0xSLIzuT7W5aZh7GnbGZuf7ALaSqFcqQp8YHl6ZPJ
	rd/XFId0n/xYeDqDhvXGA9uyhmCbu57unjIS/vt/yimd70b2VSVDOKDHMB+KVzak9dJx0B/YWQQaY
	dov9kbIdcdGlsLVmnZeAc7xJ4aKs64YuLHVYIOtoMfUaydtXbHx2+jBvoEyO1KrWIoe2wSGr4v6Tr
	FJGr9ifJJorrT4wgbNfh/Kmn8vIZzfz6+TEUUBMfhA3cDjduNal4w71HQn+t35cqApSUcrGPJj0jM
	MkGJKP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVIte-0000000G31q-2ihV;
	Fri, 27 Jun 2025 23:54:18 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVIrL-0000000G2tA-1j0M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 23:51:56 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6114114daddso211173eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 16:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1751068314; x=1751673114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzzFxvtsJDUS1GN+Rp5blvMdsxvFtXnK7MAb3nkjiUk=;
        b=ICiHKkNmpi81th5Jae+GWZKAxOwqh32EQaa8APY1nhsE5hlvV5EHzeAa1u/XO6yDZE
         X7LaR38CsSxQ2Uaar6aEwT/P4dnxgAfomd190V0d7arFHFLLz7/lsYIoMGUTCsPJsPUp
         ufuA3wXStTXyicjL4Gd+fMiQIVWJ24EE5eFqrzzSQ2GSFTmSCqvgsl1WWQa4IiGBBK2x
         BkHWZdDPq6bb2PGUoFkmNs/GmXuyPaL9wKx5oH/AcG53stkhtbOKuNm6rwBesRw2gate
         pCErx2R701RczJjCByQcl3e4EsHkXVr7yGTJgM8Pmk58Hy50iDfyuThuwAuKH17YMH2v
         tcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751068314; x=1751673114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzzFxvtsJDUS1GN+Rp5blvMdsxvFtXnK7MAb3nkjiUk=;
        b=HimPgO36qo3bAcT+IKS8hnqmFfhdGWLLj/83jb2Bby4Hkio3aVhlgg4q0w/h+mVSgn
         cymLf+dAN5g2BpMQDL0pfT0g5fhXAY88AoG78WJhS73lJwTzt/SOjzanJ0sjHaoxvOzo
         v3rOYn3E1RPHxP1/gpKotiaBdvftssVqGar2Hj8ATNw6xMzF4x5H7lbSee6G5BiJvUr8
         YE8AtHnS92B68mXWGFtXrc2KHQuwu/POHZHCHGTImDNfocNjX1lQnzPdLuUtt9oHY/1e
         Mz0BkH41yxietaQQsj9eyGiBRWQnee+/GwklidMUQP7OpTGXrF2qZl2KVqzmYDYM5S9W
         a6ag==
X-Gm-Message-State: AOJu0YzfH/0Dcbz96ASWPjt1fvc7XrT6UlhN3g+dK6zvqYG/Nu+zZB9o
	j66Eo6Slugz4icSSwKRtgziJ/6YrBg6Vwvxu/+fcIofVza8sIvtm7l9SBAeq+a6sHs9l71KMirv
	kqZU+nImExMHBy545Eai/nm/sTC+osVI2Yd1k/Sg1Ug==
X-Gm-Gg: ASbGncux4QvBz1UKbafyF9YbyUo1AN4qG2Ex42m16tp0gqKEcPaY/iGE4nwILuZL1+U
	D+NN9sU8+jJl37eD+iBeOmw8Ha9cpPa0DqaBk+6QMCh9dB1rH7sc0u7dRQ2XXA/uA13grzotCr5
	hckTNOlNkX5EVNki5t9mtAsVXehgaxGB+7QCh9f3UEr8o=
X-Google-Smtp-Source: AGHT+IGgc47EYY0K8HdBdfElHz/fGDss2oWTxTnf5NF11fTfAkKrJuQZMypuhZquvGUVIV3cfJTO7ety3y21wfQ3YXo=
X-Received: by 2002:a4a:ec42:0:b0:611:befc:38e5 with SMTP id
 006d021491bc7-611befc396emr2467182eaf.4.1751068314368; Fri, 27 Jun 2025
 16:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com> <CAJ+vNU0caeeC6in5dO_jkkbYNAnTL7drBZcmNBsstbrPWqUkHw@mail.gmail.com>
 <CAHCN7x++XGXu6DsPaOc2EpAbxzy+RZbDq5A5-j5a4roGDhv4fQ@mail.gmail.com>
In-Reply-To: <CAHCN7x++XGXu6DsPaOc2EpAbxzy+RZbDq5A5-j5a4roGDhv4fQ@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 27 Jun 2025 16:51:43 -0700
X-Gm-Features: Ac12FXwXGulBL0jbVqQnJxN_WDCz81yMYRpGFHs9RhAW_Av5urg3MXFIWan08mk
Message-ID: <CAJ+vNU2iY4V3yp_58NTSht2XbS_YiWU+T5jn7fcbrkBMGygzJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_165155_452200_61E6F726 
X-CRM114-Status: GOOD (  33.82  )
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

On Fri, Jun 27, 2025 at 11:40=E2=80=AFAM Adam Ford <aford173@gmail.com> wro=
te:
>
> On Fri, Jun 27, 2025 at 12:56=E2=80=AFPM Tim Harvey <tharvey@gateworks.co=
m> wrote:
> >
> > On Fri, Jun 20, 2025 at 2:52=E2=80=AFPM Adam Ford <aford173@gmail.com> =
wrote:
> > >
> > > The reference manual for the i.MX8MM states the clock rate in
> > > MMC mode is 1/2 of the input clock, therefore to properly run
> > > at HS400 rates, the input clock must be 400MHz to operate at
> > > 200MHz.  Currently the clock is set to 200MHz which is half the
> > > rate it should be, so the throughput is half of what it should be
> > > for HS400 operation.
> > >
> > > Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini develop=
ment kit")
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/a=
rch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > > index 21bcd82fd092..8287a7f66ed3 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > > @@ -294,6 +294,8 @@ &usdhc3 {
> > >         pinctrl-0 =3D <&pinctrl_usdhc3>;
> > >         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> > >         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> > > +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> > > +       assigned-clock-rates =3D <400000000>;
> > >         bus-width =3D <8>;
> > >         non-removable;
> > >         status =3D "okay";
> > > --
> > > 2.48.1
> > >
> > >
> >
> > Hi Adam,
> >
> > This caught my interest. Where in the IMX8MMRM do you see this and
> > would it also apply to the IMX8MP? (You've patched your IMX8MM and
> > IMX8MN boards).
>
> My 8MP board already appears to be running at 400MHz, but I did check.
> The reference I found was in the 8MM TRM, under 10.3.3.5 Clock
> generator, there is a note:
>
> CLK is different for the SDR and DDR modes.
> - In the SDR mode, CLK is equal to the internal working clock (card_clk).
> - In the DDR mode, CLK is equal to card_clk/2.
>
> >
> > Have you encountered any issues when running eMMC at HS400 due to this
> > or is it just something you noticed in the RM more recently like with
>
> One of my colleagues reported that the eMMC was running slower than he
> expected, and I looked at the reference clock and noticed the 200MHz.
> He asked if it needed to run 2x that since HS400 clocks on both edges.
> I looked it up and found the note from above.  When I increased the
> rate to 400MHz from 200MHz, the throughput doubled. I also noticed
> some other boards, including the reference from NXP had the clock rate
> set to 400MHz, so I don't think anything unreasonable.
>

Hi Adam,

The verbiage in the 'clock generator' section is not really easy to
understand but you're right, setting it to 400MHz also bumped the
performance on my boards. It looks like there are a lot of imx8m
boards that could likely benefit from this that are not already doing
so.

Check your imx8mp again, in my case (imx8mp-venice) sdhc3 was not
running at 400Mhz without the appropriate change - maybe yours is
running higher due to some other clock configuration you have.

I'll be patching my boards with this as well - thanks!

Best Regards,

Tim

