Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F03C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrx4aRxpWMNpz3kBZx0QvAIs12jvmJX0PVdxD7GtL1U=; b=dojrXXr/BWce/sfL/xWwUx7pb0
	4nYvTf1m6AOKA7CP3PzUMeowzv/P8VmV0aLIfFqT2c8LjcJSzNOvO6/P5esoXPr/83S+IG/UWmcJ2
	3PFAjt2wjuniCpnuyN5DacMJX3lyMx1DzrItIIHmY+aLzzi+/pYmO/jXUe31mlQmzmXf4pWyOyGBg
	A8rynF9gs0/B32bg71FrC7qh07t2lORk1Snz+8QDnXVhdTFCc/ptHJd6ZfiyrA7wVv/qCihwC7szb
	X+CGg1ndFtwDHzhDMzpx/a0fEqRvzVbeg+bLa1fwqJvLL+2u9O9lTi/Pa8GrQl3UqjgmWepbmdD2X
	gXWf5D3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgsj-0000000FWJ5-1k5E;
	Wed, 21 May 2025 10:41:05 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgkQ-0000000FVWI-3TPj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 10:32:32 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-70a57a8ffc3so62571307b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747823550; x=1748428350; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrx4aRxpWMNpz3kBZx0QvAIs12jvmJX0PVdxD7GtL1U=;
        b=LRcdqGF4Gz1mfjElmZ9PsNGPoZJ7v/66DDW8getCd8Kq6Guk91v6suX0gzUARV+cUg
         /BLj9F6pRacOnQNCrOr1XreRJuFXdS/st/G+JovIAq3HaMvW60TCINZAjMCzM0+fMCBs
         IGXwx+2sJHOtoXq4QaivbtLjIVNXSCCVj2LY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747823550; x=1748428350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrx4aRxpWMNpz3kBZx0QvAIs12jvmJX0PVdxD7GtL1U=;
        b=hPOCGawBirsnoEtWDM3iJSn17+HH6H6799MfiSwPQt4tV/yGOh6CqaBCwQW01YVf6O
         SG4gyR+VF7FhgLHx4PqGKtqXJKwrddsL4HtZ1v5nTKp9JIOg4/iPfTt19tPHxz6b4RMH
         grZeAaumCgKLeSYaEYBWDaOPTFl2ya4F6zOjUIF+eJRgT3SFvPOMWesiTAg7P8uRhssH
         bLI88plxDqzec7WwTd68t2NJb0gibmy3lr8R8KwlsaPriuet9MdKsGRysMkm4A1k25x6
         8zUJGqLgwiG4piu1aHd/icAfGI4ysG49yfHOB/jPbBu1PEqE5zGTE/0FFiPNsa+pkJrI
         MLsw==
X-Forwarded-Encrypted: i=1; AJvYcCWLbZeJmuMif8pcvJf4JlYVW8CKIHPdvugY1wcu39IKYJfJy5Fzzd1gnPBGTjVbSJKVlk636Js82RHNsbPX+Nlv@lists.infradead.org
X-Gm-Message-State: AOJu0YwsZWImt7EnVSkRuOgvTNAX4v7zfZR8p33MUFWTm4f9jQlAB3e7
	3cR9Lq4m9NWXx7Sq/DR3N2VycJEgVDH+xkx+zyakdQvniIqWgCgx5vyLJ6v0PuRxdOw0P2XhdyZ
	5WjhsTusqaTe34pWNlw0KMNc5lMZFZgtvZ2NW7Xfn0lPldEutPBuoWPU=
X-Gm-Gg: ASbGncvz15LqwVapb1/GYqZIJRc6JBkZvwMlRrLbTbjwZiP6oGFHDglbIh7fdkrVwJG
	tWvs2kOQd/N+9aRsArCt/2q5zOQJ4qJvq55K1tQtlc4YMNCVc6mzGlk1TD5L4Kjmnmoik5SAgR9
	8mOJtQ7pBTqytstgQzWqRChhVEWko/dbaWXFWsGhLVr/H1ZhXPBsBrsn/C5CzU1mRsUQ==
X-Google-Smtp-Source: AGHT+IFFal7PqjGJ+LGmx5bNYrc9004KFk4ruAZ0EqygehsuQ0KzsT99Pyli2tqxvHiA6hWSh10r4+jSoSJ6zf3teYw=
X-Received: by 2002:a05:690c:ed4:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-70caaf78e03mr301107987b3.15.1747823549692; Wed, 21 May 2025
 03:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
 <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com> <20250521-quizzical-tidy-worm-1fe67d-mkl@pengutronix.de>
In-Reply-To: <20250521-quizzical-tidy-worm-1fe67d-mkl@pengutronix.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 21 May 2025 12:32:19 +0200
X-Gm-Features: AX0GCFtZ6hwSbA_J2rTqW8QnXowGlyqASP2_EDudgcpET604dgwM5KYsyW3Eszo
Message-ID: <CABGWkvrmuhaF4iHqHRkrNrrHb2gUNDBJKCT-jZ8ZuwZGRvm7Lw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-amarula@amarulasolutions.com, Sascha Hauer <s.hauer@pengutronix.de>, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_033230_878299_A01E780A 
X-CRM114-Status: GOOD (  16.22  )
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

Hello Marc,

On Wed, May 21, 2025 at 11:35=E2=80=AFAM Marc Kleine-Budde <mkl@pengutronix=
.de> wrote:
>
> On 21.05.2025 11:28:22, Dario Binacchi wrote:
> > The board includes the following resources:
> >  - 256 Mbytes NAND Flash
> >  - 256 Mbytes SRAM
> >  - LCD-TFT controller
> >  - CAN
>
> [...]
>
> > +&can0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&can0_pins_a>;
> > +     xceiver-supply =3D <&reg_3v3>;
>
> Since v6.15-rc1 (d80bfde3c57a ("can: flexcan: add transceiver
> capabilities")), the flexcan driver supports CAN transceivers via the
> phy framework, see drivers/phy/phy-can-transceiver.c. Can you make use
> of it?

The board uses the SN65HVD233 transceiver, which is not listed among those
supported by drivers/phy/phy-can-transceiver.c. So I can't use the PHY
framework.
Do you agree?
Or am I missing something?

Thanks and regards,
Dario

>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |



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

