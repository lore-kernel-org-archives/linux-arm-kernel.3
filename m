Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAC0C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdEgWSJxe9FJMYKcuUExk/aYWYfMksc/H/dM1vOfbdc=; b=YMckK6bXNcqziAi2Bz/P2/ZybM
	oBuLrhPFypsf6JwRu+bPEK6kFNNoiDsT46QBI5BwOdCdN6BTKs5cv1UzqphyMN2kxGUwavOdfFJEl
	fHMvYiiLHrkeNpPlfFmdDP2Ie2LwIifzzMPcr/KAYRrcIriKfaIBg5EpaZkGNi7U8/Fvn+em17Vwr
	uJoFewqP4xzkrrqPMK8ZMIx/Mw1ZKuYY9d+hXi00oZlRdDLjKkUxkwyvn+W/IWvzz7Qw5biEx63AK
	H+22OVilOzROnZs5XDleMNq+CrZOOaZAcDBabQKFOjEtJDlwiFuuQvVRnxIt3TsAVOP/GOscZphmf
	+kLXt0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjzs-0000000G1iR-0U4T;
	Wed, 21 May 2025 14:00:40 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjMX-0000000FuzQ-1f45
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:20:02 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-70de8897628so12658537b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747833600; x=1748438400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdEgWSJxe9FJMYKcuUExk/aYWYfMksc/H/dM1vOfbdc=;
        b=gbVCrtjA7f0chGws9UoY7EiwS14n902lz8X0NZlx5OEQoxhfzerbe8TEbxFRXmgNmB
         Zuv0xcMWE1I0Jq3FYxtG6SnRdcIHTxG8XidLsn3KJ6gTFMPGljQWWAwiP2aEbp+avDj2
         EHghX5VkbZVqpBPKe8WrP06LD9BLvdm7oHfys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833600; x=1748438400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdEgWSJxe9FJMYKcuUExk/aYWYfMksc/H/dM1vOfbdc=;
        b=Z8pxBKHH6Od/sSbBmpEmmbgudK2a8MMT6bEr8tzsvAM3/MZI6sJsQK0p80EjeqXNAs
         Ytgv9H/UjCKTpRDfI/GDZdasewguDH9d2COwmEeHcTq3sHafWbkSK4Xkwd/Pc30Ah5Uz
         9HFDcz8sU3QFegjQo1evHJQDrEBsVakuEJoJUU3E1oZpu6rBHkDxPuj9D0ixCvDaKQIX
         Tc9ZHZdb0GrMwPhzFL9/PqB3fVvQeGDmsrUivL0BCN71mFGKfEPHldGzSGF/AO1g0iMO
         ZvEIwWSdoh3JxxNFFNbJkmGdQyrOctkS4iaTBJOc7CN1fnKh1lwEU4/lJUq8DNxppidq
         HExA==
X-Forwarded-Encrypted: i=1; AJvYcCVosloOyxRuxhQwQJZ14JlSnjcf6RvtTdFGjZWUGhLWh9o3+sLwKPPQbPMh50XBIo0d9Qmw6tFJ7donC/BVLSwa@lists.infradead.org
X-Gm-Message-State: AOJu0YxTBNltVyn+Dia/apzss6uuN5pCH1TckGmDK0F9fbIJ6FHD+ZsV
	Ka4HiVNPJvklE+wC4/L1Q6boEPnpll+SiXj0mtDvnOxZZIg3XTUTD8L0RKr8Fw4P48g12sLm1Db
	repi0n0Y//HfSc8ICPgd+Noh/+kOCbXRUPMacLECYfg==
X-Gm-Gg: ASbGncuWVsl9z/IRfyqq+dXEYxN0L+BxzwZbztCE0p2MzTG212IA6iK686VLL82QE0D
	7cK4XPQlKba0py0Lcfzgl0NjAaOa8JqJMrSlOyTAoBTedsVtXk3aSKKLH3R1X+Pf1GvB/7+5kQ0
	Bieswj9VNETUub2omqVlV5tmH7h9+dBC0qQuoup2+ue6eN7TCEyp9o+pmIzSqlCPo7/g==
X-Google-Smtp-Source: AGHT+IFJuZAiihHxJLr6M/kE3uYbWzRfUS/uPkbXXA+1qG7+nEsPeLqVDoAYPRojiT4pNkEEDqIrXTdm4/tlPfieZDg=
X-Received: by 2002:a05:690c:750e:b0:70c:b90a:5c88 with SMTP id
 00721157ae682-70cb90a5f24mr213677417b3.31.1747833600229; Wed, 21 May 2025
 06:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
 <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com> <CAOMZO5D-d7bmBfXKe936W5QjmsukRRX3y0ge+xtizqFx0HPE8A@mail.gmail.com>
In-Reply-To: <CAOMZO5D-d7bmBfXKe936W5QjmsukRRX3y0ge+xtizqFx0HPE8A@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 21 May 2025 15:19:48 +0200
X-Gm-Features: AX0GCFtbBN2xKHFMu-Zp69Kj64qn-x6_0NKQbUd_en3T7Wa4I2aai6e9qO1zzuQ
Message-ID: <CABGWkvpPMry26DP4Wo8WEGhokdkf5GdLd=+O5SqRdh-8JBqt_w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_062001_461781_F686B039 
X-CRM114-Status: GOOD (  20.42  )
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

Hi Fabio,

On Wed, May 21, 2025 at 1:40=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Dario,
>
> On Wed, May 21, 2025 at 6:28=E2=80=AFAM Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
> >
> > The board includes the following resources:
> >  - 256 Mbytes NAND Flash
> >  - 256 Mbytes SRAM
>
> SRAM or DDR?

Sorry, DRAM DDR2

>
> >  - LCD-TFT controller
>
> The LCD support is not described in the dts.

Yes, you're right.
The board has been in use for a long time with a 4.19 kernel. We recently b=
umped
it to the LTS version 6.6.69. However, for now we've had to revert commit
f225f1393f034 ("video: fbdev: mxsfb: Remove driver") along with other
custom changes
to reproduce the correct display behavior in the field. That's why we
haven't described
the LCD panel yet.
We'd like to add it only after we get it working without needing to
apply non-mainline patches.

The same goes for the sound, which is neither mentioned in the commit
description nor in the DTS.

So if you're okay with it, I will remove all references to the LCD
display =E2=80=94 both from the commit
message and from the DTS, such as the reset pin, for example.

>
> > +/ {
> > +       model =3D "Amarula i.MX28 rmm";
> > +       compatible =3D "amarula,imx28-rmm", "fsl,imx28";
> > +
> > +       memory@40000000 {
> > +               device_type =3D "memory";
> > +               reg =3D <0x40000000 0x08000000>;
>
> In the commit log, you say 256 MB, but here we have 128 MB.

We have two models, one with 128MB and one with 256MB of RAM.
What's the recommended way to handle both cases?
Should I define a new DTS file named imx28-amarula-rmm-256mb.dts
that includes imx28-amarula-rmm.dts and override the reg property of
the memory node?

>
> > +&i2c0 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c0_pins_a>;
> > +       status =3D "okay";
> > +
> > +       polytouch: edt-ft5x06@38 {
>
> Node names should be generic: touchscreen@38

Ok

>
> > +
> > +&pinctrl {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&hog_pins_a>;
> > +
> > +       hog_pins_a: hog-0 {
> > +               reg =3D <0>;
> > +               fsl,pinmux-ids =3D <
> > +                       MX28_PAD_LCD_RESET__GPIO_3_30 /* LCD reset */
> > +                       MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power=
 */
>
> Proper panel bindings should better describe these pins than hog pins.

I will drop the LCD reset pin.

Thanks and regards,
Dario

>
> Do you plan to add display support?



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

