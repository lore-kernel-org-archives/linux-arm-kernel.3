Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB78C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNrtHxvAARLKVPFpYujSB14zlhbXQAvcOq3ksde84Gc=; b=4XMAzFBehVaH3BpGhS0RmHenyE
	SLbwCjUaGC60HlBgZPRNSsoEhGWu5vJ84EN52XgDL9anv8NOas7qJQ4wNu8k2hxBtj943pU6RVtgf
	q0+hIxKTGNiiiZ0pqFEjFn2cj2VkaepeeeG+Nis/dqlv0hx0Fxe2LSBdc4sToZm0gy9M1nKX/LVN8
	N4z9LNGDXdEgCWbEMbOadvYGbApQREZITOyMVylZif4ee6AUJG84+OBw9rHVG1qOLc5O/Y8wW/l5U
	nISXs4NW5ia2xtDB4Kw/bB/Xb519W4qDiSuzUTHXnXqqQHzumfU+ntR+DglU0C36nP0u51dKAR8jV
	MVu2aemg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7Md-00000007oK5-2T2v;
	Mon, 02 Jun 2025 15:46:15 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7Cg-00000007mQp-3Vgi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:35:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7426c44e014so3612299b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748878557; x=1749483357; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNrtHxvAARLKVPFpYujSB14zlhbXQAvcOq3ksde84Gc=;
        b=CacQLsKOW7i4yihp0PO/DD1ppLC0Jl9ELIRjPbj+EDDQ7kjVn9qS6ncDERs8sVHz7h
         7snd5PN3xgjxx3thScT+Pjfnulmqab9ahl36+qUniclok/zPsVf8lzkkpoR5D1NZ6t1g
         RlqD9I6Kkm2xB02rVmndNUsN0pR4V9NuVoaBdj+58gqD0KOzqMcLZzEV2m6lNxIXKN9Q
         G+2bPIU79Y2rgYLhsEgT7m7M6Y2ajHnnkJDykjm+c+4cNPArOXR23ud129niV+4Djm0V
         vuNbvf9+aFvCcL8Me/mdUYNrts9xxIfNpSxkyILMWhdLh3QrqtWHvmzoGxGP/i41J4B2
         Ap3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878557; x=1749483357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNrtHxvAARLKVPFpYujSB14zlhbXQAvcOq3ksde84Gc=;
        b=C1eJQQxuaiknqx/9FmMYdsS1/wF84Et7BqPZka8d0/cHt+f/QDve7BXmMdzkzcn8R8
         kc3tP0EiRhrib21TFAZ6UWjjc3/1YAE+ttht9rNXiSIhNySjX3H1azvNVZ4JBXbPIFk9
         Y+Qm7lLLvaXrdI5dGaqZSA9/hWrKpZMKWKhT6hSeUj1jKCsP+Z/oJHG7G2gxAlEwLLGC
         1WVISkay5mKe7ozL6KKy/44iihtJ5O4w0TVatTQHjzjEe7q1eY36CztnVZJ5ojky0HLf
         OoNfVXm5q0loHGUZMPaJQFZC4ETtBQrjWhkce0WmrGT1ve5ns7030LFcKPw+A7ikqRf1
         5pOw==
X-Gm-Message-State: AOJu0YwVLvoo/s1KPLlZUdfJOLyY5j7VUg08VufA6s6kASo8CA0piPHt
	kSOH+1IS6VbEZVVP7hjx3SXmrZK+eQVly9ruJ93vNNrw1j8MqtVkLAF5MR3oETERdsPf+n7ArtZ
	UyX6vgYicWb0+qyfbUxHR9wzTvfDpvO8=
X-Gm-Gg: ASbGnctHyycFnoBYUxRwyD3lsaTCm9AGFA1RTH+B2ojm4Fm6jPsAva5eqMenwhoT+wb
	OgE7jGZbbhNc0JDXJhLu0JgcutzBT69eLMpGrCzdQ3rXYeUNhMFnVv8X0BEu8Ar4Mh1wLw5G8bX
	BuQFuAxgN25kssrgZrzz/+i6vRJyVoXHBOJRmpsr9aVU4=
X-Google-Smtp-Source: AGHT+IE8dA1Pco98GdRrtQc3CXC3zKuqxixGckqlX0jZC5qF1ahyeT/uWicDjaPk55wZT7A9YkfMRqlC7hap1CDu8es=
X-Received: by 2002:a05:6a00:88e:b0:73e:2d76:9eb1 with SMTP id
 d2e1a72fcca58-747bd96bb7bmr16842852b3a.10.1748878557404; Mon, 02 Jun 2025
 08:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250530221713.54804-1-aford173@gmail.com> <20250530221713.54804-5-aford173@gmail.com>
 <20250601183620.npuicmipv6kv54z6@pengutronix.de>
In-Reply-To: <20250601183620.npuicmipv6kv54z6@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 2 Jun 2025 10:35:46 -0500
X-Gm-Features: AX0GCFv__4JuP0qoSXHoB0hrfnXBe2PzvmOKWGMVmTMtI6s693tpZjD_UaOkNuc
Message-ID: <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_083558_873973_41EDFBA2 
X-CRM114-Status: GOOD (  24.52  )
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

On Sun, Jun 1, 2025 at 1:36=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> Hi Adam,
>
> thanks for the patch.
>
> On 25-05-30, Adam Ford wrote:
> > The defaults for this SoC are configured for overdrive mode, but
> > the VPU clocks are currently configured for nominal mode.
> > Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> > Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> > Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> >
> > This requires adjusting the clock parents. Since there is already
> > 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> > This frees up the VPU_PLL to be configured at 700MHz to run
> > the G2 clock at 700MHz.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 909555a5da4b..848b25c9b752 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
> >                       interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> >                       clocks =3D <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G1>;
> > -                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL_O=
UT>;
> > -                     assigned-clock-rates =3D <600000000>;
> > +                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_=
800M>;
> > +                     assigned-clock-rates =3D <800000000>;
> >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK=
_PD_G1>;
> >               };
> >
> > @@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
> >                       interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> >                       clocks =3D <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G2>;
> > -                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_=
1000M>;
> > -                     assigned-clock-rates =3D <500000000>;
> > +                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL_O=
UT>;
> > +                     assigned-clock-rates =3D <700000000>;
> >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK=
_PD_G2>;
> >               };
> >
> > @@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> >                                <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> >                       clock-names =3D "g1", "g2", "vc8000e";
> >                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&clk =
IMX8MP_CLK_VPU_BUS>;
> > -                     assigned-clock-parents =3D <0>, <&clk IMX8MP_VPU_=
PLL_OUT>;
> > -                     assigned-clock-rates =3D <600000000>, <600000000>=
;
> > +                     assigned-clock-parents =3D <0>, <&clk IMX8MP_SYS_=
PLL1_800M>;
> > +                     assigned-clock-rates =3D <700000000>, <800000000>=
;
>
> I think we can drop the "assigned-clocks =3D <&clk IMX8MP_VPU_PLL>" part
> completely.
>
> Before your patch the IMX8MP_VPU_PLL_OUT was used as clock-parent for
> the IMX8MP_CLK_VPU_BUS. With yout patch IMX8MP_SYS_PLL1_800M is used.

I think you're right.  I'll fix that up and do a V2.  I forgot to add
my own s-o-b tag, so I'll fix that too.  I'll try to do it this week.

adam
>
> Regards,
>   Marco

