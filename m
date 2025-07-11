Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272BBC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nv3w+fmUK+KORgHTnerP5clwh8BNPjGSYNzQTi6VZkU=; b=j7cq488RTPjLf4oGKvWeTAksX1
	gsV4pEPKNLnJ0H69HNd4g6qrG2e1l7+INg+mHr9VKrBUiKoFyx/lA2iIClcdp9IQDiaZtSGe2C4Qe
	D7uYyIZ7MeLQkHo8RxY5sOAJjM1jfaNhgwGBFRAe+sAYxM3rx0VivOSi+GP9Cq0uem0IJdJbGv033
	KXu+LDUuIbasH3zIR8ius0harwUf50YkiBcZINstwJZU/BNeEPETbuKScFsFFE+EowEGBl6Or+ZXT
	EfKuz71D99SblXldT4v+8ivgfs4Exwqnk5yPYakrEa5YRgsQszaaHrjQJ3yNuppFPylDauVmfOQ6y
	0rHyNoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaICp-0000000FTDb-48d4;
	Fri, 11 Jul 2025 18:10:43 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaI9Q-0000000FSn1-1YUl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:07:14 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-32b553e33e6so18432131fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 11:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752257230; x=1752862030; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nv3w+fmUK+KORgHTnerP5clwh8BNPjGSYNzQTi6VZkU=;
        b=Tl2LAZVEES+EpfheTxaCJLcKZsnJ2Z61auaVsY5UqijbgAkM+1shUJe1MzMyoMwKKJ
         Xd1tobkUlIXRBnAHEAK405qfcGaWKqJwqAusS28K1w9AL46Zxp0lnAKAtjk6kYlSI/Ga
         mW6REjspsDUkxqaW4XNQXewvMRSesGTQNx635fPthzo6lPA5JIdGkoq5e3EcCPCgq59e
         sOOJkqXgoSIKgbztDgkCb38cVKrqVJRv1GvcOCObZ5CZDdT9ECJzI4EyTBNEFMgqynCE
         qBvx+sMTYmTJ0w0e1dycqV4D4ZaJuBDIJvsh9Da8d/lnyviazKob8NLjwvKsjLiawIe6
         BFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257230; x=1752862030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nv3w+fmUK+KORgHTnerP5clwh8BNPjGSYNzQTi6VZkU=;
        b=wIHfp5hVHMs1TiDDl+3E1vk1gNs+EFWFfZKZprGOcMBIj5t58oxTgaujPQea+uIgEp
         zGEVSNxnDFYneLiQyMa40jxs2Mr/D6zcEYMF/xe3p+w9COLA5dDWSSFSZoDbjCC75Zms
         gI1HWMI9G6s7ptQm/hKQ1+NxJBjrQ8UNIZgUY1PvHYf01AfFX4P/yyS5muheWh3ll8wt
         LBUY9NljVzk9Hto1dJK0JrUgHuNAE6IhSuzBZujRDnWQG6bdggannVfyuvyAvp4f4jiO
         4Sg2tMQvZJ9PXZZDKGXyngAWTvnGbQZnUAbsy1Z3ydd1MrTJtyXsTurmvU6skSOXKEga
         LzHw==
X-Forwarded-Encrypted: i=1; AJvYcCXqx07gPUxSY+379QfiwKk6LjiYTc542KOzO7jepC8GcOT311xKRqIpLuIpqwUOL8ZnURnqxybrmQ+UfbEMXsdn@lists.infradead.org
X-Gm-Message-State: AOJu0YzqyCAFgypAF8TKL0tZVLA5bWbL8+8boNmwNOPlLmWlFjTcRwBk
	9A/fR4uQxPmNUNgQezYsgeUWrXw2HteeYfzWk97P6qqgGKsSltn+Tub3j+uGC0w6Cij6hHE1FTG
	oT7zooVPlD5Q/WAFXULhlMhUfTDTQXfE5jG8NvrxBgQ==
X-Gm-Gg: ASbGnctO7qnYoejokv+WEAh43ZIgqZBwVz8UfT8MYv5QufEbJ9/CelA1qJKUqg+OVkT
	r48B/TlQwU4bFe31gWq+YQBGYJZwLJpnQNPg92PH0airqVlD2OOIC0LAd1fx39v9QYlj6SzkiPV
	+xBO7lB4C7XhzLct7cFW3k6yNIQJ6x+E9HxZPoO0M1VcvrwiOw1fxBfMSfzthTGcMZL2VpBR2VE
	YmDPUY=
X-Google-Smtp-Source: AGHT+IGIM1KxPQRBzMcvjUyIFovix8JCnhDiSC9t8kuenx33aIRcaw671XqV4qF75MRVLZo1ysDiT3HOSqWRKHB0f9E=
X-Received: by 2002:a2e:a592:0:b0:32a:5fe2:81bf with SMTP id
 38308e7fff4ca-33053411628mr14813671fa.24.1752257230460; Fri, 11 Jul 2025
 11:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com> <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
 <CACRpkdYDTXA7+YN2zRCsQxu2AKEAwbDVq8-m27ah5XTw9iRNPw@mail.gmail.com> <55e7aeb5-565f-4452-bc11-55968dcc0a9e@lunn.ch>
In-Reply-To: <55e7aeb5-565f-4452-bc11-55968dcc0a9e@lunn.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:06:59 +0200
X-Gm-Features: Ac12FXzkmFH9ARMnDahmUtA_lkqp-uVRKNUJ3trz8WzNmuV5X5nO7f8132IvtH4
Message-ID: <CACRpkda+=A5R4vZZQZKmF3LnGd6xMYbNomahgTW+j9aX9swBFA@mail.gmail.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_110712_452851_62BCAF5E 
X-CRM114-Status: GOOD (  22.74  )
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

On Fri, Jul 11, 2025 at 7:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> On Fri, Jul 11, 2025 at 07:43:13PM +0200, Linus Walleij wrote:
> > On Wed, Jul 9, 2025 at 5:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> >
> > > This is not my area, so i will deffer to the GPIO
> > > Maintainers. However, it is not clear to me what get_direction()
> > > should return.
> >
> > This callback should return the current direction as set up
> > in the hardware.
> >
> > A major usecase is that this is called when the gpiochip is
> > registered to read out all the current directions of the GPIO
> > lines, so the kernel has a clear idea of the state of the
> > hardware.
> >
> > Calling this should ideally result in a read of the status from
> > a hardware register.
>
> O.K, so completely different to what is proposed in this patch.
>
> Maybe you can suggest a better name.

If the hardware only supports one direction, then .get_direction()
should return that direction.

What the patch does is to
read the direction from the hardware and use that in the
set_direction() callback, as if all regmapped hardware in the
world had fixed direction, that's wrong.

I'd just add something custom in gpio-regmap if this is
something reoccuring in regmapped GPIO drivers.

bool is_fixed_direction(struct gpio_regmap *gpio, unsigned int offset)

or so?

Then the core can use is_fixed_direction() together
with gpio_get_direction() to check if it can do
a certain set_direction().

Pseudocode:

mydir =3D get_direction(line)
if (is_fixed_direction(line) && (mydir !=3D requested_dir)
  return -ERROR;

Yours,
Linus Walleij

