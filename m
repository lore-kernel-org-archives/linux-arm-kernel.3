Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8D7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXXm7jXSyAHpmGAH3x9taDLedDu+p3wnULbeaYvIinw=; b=g32Mwt0jeSFiD45Iet5HylLuls
	5PL6OWd2PqnmPRzcR5VsZsypkSC+UfktssZUngy443KDJhb5R7yDyRkrNwIvgxjgCVtfaQO+DQBIl
	UkvtlbdOCjWv8zpx7HFjwOO9kWxahJl+4t/MIJH/Fsdm0FZ62+qD5yT0ymjuWQkH9ZGBhmn0pb4q7
	cQgmpQAJnL7AAbYi5SyjvWiocoN+b6QqLLEkHTVvpqNA0cAG91ZduM3JQx0vy8b4FouWag2CQ/d6a
	qNeBMpIDD/3xe62Dslq1ZG1VO0SkD2hBl0C7Bg276MXTc4c55Xl+GEiRGS0lVtTqKwZNoPl8w2Ygq
	Rb+GIxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdDY-00000007JsV-2v2A;
	Tue, 31 Dec 2024 14:27:32 +0000
Received: from mail-vs1-f43.google.com ([209.85.217.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdCP-00000007JoL-1ce9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 14:26:22 +0000
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afd56903b7so2446348137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 06:26:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735655179; x=1736259979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXXm7jXSyAHpmGAH3x9taDLedDu+p3wnULbeaYvIinw=;
        b=mjc6UpeCwhQklcI1RHOe3GBb+iz0nDtOcHTw2gWjwM1n6zQwSqFFnmqf5f5GZO2v0z
         MNXyULCwr+Dksf5UQ9JkpK+zFtwcZllU+kPNPqtsNVzZbSCCptBywMEo700BrxfoPf4o
         4vcsOgvv3k4P79dnNOq24s7lElqEGSpNmabH2Ey8HodM7GwCcjLWImjWd77wAnYJFtIt
         j9l+ql02wh8NbjdFnTkcTQ2/5JDYG7qW08MlkEeNjIDIV5+GFcH9SNl+eP1baSuDfa9S
         zPMAJDwvyhK5bOeO0tYIlOLbnFMGL6NaVBtTEjHKp+UiUA+qt49Llat0tw5zBRhsUTpi
         6UTg==
X-Forwarded-Encrypted: i=1; AJvYcCUjbStlx1aPDvEAisti4sDJyY3s93urBuehdVKIVOq7WHTm5Shz2aZ68r5M5iC4FC/8mmZqkz6XeFy7bC21uJxJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzpH4VDUao8eOgwwJA2g4SYnHLKPdDke/+DBv4K9QVoFRWFpwnC
	i2GnKS2GTmYKDUDmKonHWQgyAEaLjecpEMl31k9zBTdZ9/44rAZhq5rM0wAt
X-Gm-Gg: ASbGncsPX9OdGUQTZaO/+T6R4kgF70p7yWhT9lR8fvD3a4W3AVmHINOv0WF4wqCr/4r
	1OC4jeclQsQX4DVvR8CJ0PSk0Yi8AAnYhzdxvqyY0laeS4ARfKpVisv/cAmg9REG0XYsXshRQKs
	uY7aT+jwTMV0enXkdYJmC458RDIeO0nrN4vi5DrAVqsl9ifVtbk4wPvXftv7H1fiYcVto6neJOi
	hQssqj+h2CMduKH53OmtfcPeSu8W/5zroBq1zOq5WC3RDYsDOjTpaj/kcJzp/g+uoz4nITsINSo
	1NSc1o8GclvtPZ+BjRM=
X-Google-Smtp-Source: AGHT+IFvH8LzICNWVkVLG2rzCHRO/i2lomikTk1Kz4Ju5ghJ5YFzVEwkLeaKN2uOGXay+LeQrc2Zjw==
X-Received: by 2002:a05:6102:dd1:b0:4af:3973:6b22 with SMTP id ada2fe7eead31-4b2cc4684dcmr32242728137.22.1735655179540;
        Tue, 31 Dec 2024 06:26:19 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2fff0cf92sm2966271137.10.2024.12.31.06.26.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 06:26:19 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afeb79b52fso2743455137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 06:26:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXI2z0F/ud7GXwp1prDoB4YPwAXkNAMPW3bGDUWCkU9wTdUclfoh7pZJi/W234zzKzFqFMI9z1sqFib7eAEV7N+@lists.infradead.org
X-Received: by 2002:a05:6102:38ce:b0:4af:f6e5:2b46 with SMTP id
 ada2fe7eead31-4b2cc359cebmr27414041137.9.1735655179221; Tue, 31 Dec 2024
 06:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
 <20241226122023.3439559-2-rohit.visavalia@amd.com> <5227cdd506bcb0239657216bd36de12f.sboyd@kernel.org>
 <CH2PR12MB48751A8B003E9E30A9A4CDE8E50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB48751A8B003E9E30A9A4CDE8E50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Dec 2024 15:26:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX57SvuVsRhisF1RDtP+TgQsa2i+hBg334yQUxTMsqDPw@mail.gmail.com>
Message-ID: <CAMuHMdX57SvuVsRhisF1RDtP+TgQsa2i+hBg334yQUxTMsqDPw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
To: "Visavalia, Rohit" <rohit.visavalia@amd.com>
Cc: Stephen Boyd <sboyd@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "Sagar, Vishal" <vishal.sagar@amd.com>, 
	"javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_062621_425372_A9F2FEC1 
X-CRM114-Status: GOOD (  25.53  )
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

Hi Rohit,

On Tue, Dec 31, 2024 at 3:16=E2=80=AFPM Visavalia, Rohit
<rohit.visavalia@amd.com> wrote:
> >Subject: Re: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequenc=
e
> >Quoting Rohit Visavalia (2024-12-26 04:20:21)
> >> diff --git a/drivers/clk/xilinx/xlnx_vcu.c
> >> b/drivers/clk/xilinx/xlnx_vcu.c index 81501b48412e..f294a2398cb4
> >> 100644
> >> --- a/drivers/clk/xilinx/xlnx_vcu.c
> >> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> >> @@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *pde=
v)
> >>          * Bit 0 : Gasket isolation
> >>          * Bit 1 : put VCU out of reset
> >>          */
> >> +       xvcu->reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "rese=
t",
> >> +                                                  GPIOD_OUT_LOW);
> >> +       if (IS_ERR(xvcu->reset_gpio)) {
> >> +               ret =3D PTR_ERR(xvcu->reset_gpio);
> >> +               dev_err(&pdev->dev, "failed to get reset gpio for
> >> + vcu.\n");
> >
> >Use dev_err_probe() and friends.
> I will take care in v2 patch series.
>
> >
> >> +               goto error_get_gpio;
> >> +       }
> >> +
> >> +       if (xvcu->reset_gpio) {
> >> +               gpiod_set_value(xvcu->reset_gpio, 0);
> >> +               /* min 2 clock cycle of vcu pll_ref, slowest freq is 3=
3.33KHz */
> >> +               usleep_range(60, 120);
> >> +               gpiod_set_value(xvcu->reset_gpio, 1);
> >> +               usleep_range(60, 120);
> >> +       } else {
> >> +               dev_warn(&pdev->dev, "No reset gpio info from dts for
> >> + vcu. This may lead to incorrect functionality if VCU isolation is
> >> + removed post initialization.\n");
> >
> >Is it 'vcu' or 'VCU'? Pick one please. Also, this is going to be an unfi=
xable warning
> >message if the reset isn't there. Why have this warning at all?
> I will use 'VCU' in next(v2) patch series.
> Added warning just to inform user that if design has the reset gpio and i=
t is missing in dt node then it could lead to issue.

If it could lead to issues, shouldn't the reset GPIO be required instead of
optional?

Regardless, the reset GPIO should be documented in the DT bindings.
And perhaps marked required, so "make dtbs_check" will flag it when
it's missing?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

