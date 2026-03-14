Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76260105F7B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiwL16bjOziT5hiJB9OYiaVlhavbbKb1oaWep8hSRjk=; b=swDe6G0KZmnb/+AyVbniPxHdI3
	h1y+CjpZLKng3sioFcU93vBYpht1jJjl6zUyPpyCNd7v0Rr0JZJ/M+jiYXRJX8YDopiuTpZnNo5nr
	yUYRihF49Wo1lH92vcgFoIUwgzll2QaHUZ7nQ30Pq2jcw9+Jy00oLxoPk+ShkRu60qBU67fbHBdv9
	v9GStZygVsqNz1U8jwihm/LfvqYou9FnX6wOE8upus8OgKO3l86+xGiDzqp3QbBmMtU5FrUYff67F
	k0Cm7N4zy+7XCTRwH6zgGbLu/s9ojt/7gni69GZSJWGTsw7rTbiD3rkvqPu0xEq31Bb8i45i4ZZ9Q
	V4KlmZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1L2S-00000001eq3-0eRk;
	Sat, 14 Mar 2026 09:12:05 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1L2P-00000001epi-2cWm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:12:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso3083135f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 02:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773479519; x=1774084319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiwL16bjOziT5hiJB9OYiaVlhavbbKb1oaWep8hSRjk=;
        b=Ic7+KWG1cyhJP1frePrKDsUOUepPTToQ4XQ5pMdZHoneoxu0kkm38KNbTW/AHU+dPg
         oWAYNI18wEgXAJJvFucJHqqj8735xc3J29IxJNh7ffPwQIY+Jfuh1J1dx29s3OJ19Kpk
         1vZzEZaey5pwA3Ca8qQ9RDGbeIYMBPBF5+oFNVkQqh9HtaMA5mXFjU1GR93iYT90DA07
         ae00Df+V3rJw53kkXUXHjdKV8cXH4cHuxsYb5E8DckM0FjerMz08bH13WgCULbOMeOmu
         rP5xVjqb5FND0g4IjYBJzXT8TEBE8u6kaYVr60+pn/vy8laXEPB+qy4+iuKNr7iEuwo/
         H+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773479519; x=1774084319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QiwL16bjOziT5hiJB9OYiaVlhavbbKb1oaWep8hSRjk=;
        b=M9Ko3ENCXQeiGP2AQA5zi/qmUCZDFfo42YgrhKjjNYxTbdhu8ERzAG4O/a4W3g8k/a
         cNcdlJVI3OjYx4psQfB7npVZ/yTFX8O2E6Pf2FQer3+hcibIYLPY71mWdGXxQDOeFxZb
         0C3K7AdJdpBY2ElQrr0MH9c+XQ0q4oFC+jJFSrNzVwXKvOYDEe630mFQr/l8k8fUWhSO
         H4M6MTmz/7kVIJhgTp+fAwlG3fT+89KskeDY5UAefniIRQwGyWMtHYpnq0SKwGkyi7vC
         nks2tnr0tWie2xR5xjD/rbH4yiAEPFBTcBHIxDn7aFaENuVIy7Tbnte4D6xHHdesqKoI
         uqkg==
X-Forwarded-Encrypted: i=1; AJvYcCU/dxtpIHj+QcWIzL1iBjTg7xy6G8ATe/gFaAbcy6yc1Vf+1flMR9WKl8XOAsXYq/wg556nk/tl1SQvhFbHFJq0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Tal9nP9ska+4pL/0GlZnVqQfMZK0On2N3sGUyn4p53OJwDRf
	dhJ93If2zBiDXwTwakS9hZA5JtdH4KZusWLjkvVFywR6gJHBDRrxcKGB
X-Gm-Gg: ATEYQzz8S0wpa4BoUf5NO5hO+cTvwA3JcucyO271LB9XYq2Cwajxd0CIJrqEr2YgMOd
	7pl8oRfTc9yDURhvB5ppaWVmuKxfqc4m/evofQGiU+60f8/DeHYXsKP9HNnXSy/cOgblmqE1YhY
	KBBQxcSGRINkfbIFBM66kX75+1PB3bj14o+Ggy1yBmyIgAzBaNM3saxGDqpo15w4ZjQdZ/UIaJ9
	tMr7vlhICgjQu12SUg2Umcqqxg8Cy71/eocexXd42T7CThuOPgEkWxPrynXQUOHjb9qP1icoUQZ
	aWP2t7yW1aIpShAkBMUjf50hNJTcy+EjGt6V3T7q4Y+zS5Vvn2o/eM5CCt1zxsi7Fk4Q4RKOqBX
	tFjFFf45wxIJzHhzCTz4P5eji8gcWd0CF4ef0+Bd+QDM/0dg6jRVeqLbM9A9ZEw/iibGwk2drmX
	Ru94FUoRflqYYn+FAeSVaTjYgjmZZcvLBN0epMUukdxBbB3klqu9mH2kfdU+JEUkr2QYRlHO3tx
	p3I4yzFNCg/Yl0=
X-Received: by 2002:a05:6000:2f83:b0:439:b940:8bfb with SMTP id ffacd0b85a97d-43a04d87714mr11537033f8f.15.1773479519281;
        Sat, 14 Mar 2026 02:11:59 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273e8sm25569590f8f.33.2026.03.14.02.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:11:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>, wens@kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linusw@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
Date: Sat, 14 Mar 2026 10:11:57 +0100
Message-ID: <1948361.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <CAGb2v65RD3ksSnEC0RjYYQ1J-NoP9gGfeTR1UCfLgKCJEFBSTQ@mail.gmail.com>
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
 <CAGb2v65RD3ksSnEC0RjYYQ1J-NoP9gGfeTR1UCfLgKCJEFBSTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_021201_737897_21CEF0B6 
X-CRM114-Status: GOOD (  20.75  )
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

Dne sobota, 14. marec 2026 ob 09:38:11 Srednjeevropski standardni =C4=8Das =
je Chen-Yu Tsai napisal(a):
> On Sat, Mar 14, 2026 at 1:14=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wr=
ote:
> >
> > =E5=9C=A8 2026-03-13=E4=BA=94=E7=9A=84 01:06 +0100=EF=BC=8CAndre Przywa=
ra=E5=86=99=E9=81=93=EF=BC=9A
> > > Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
> > > register frame. So far we were instantiating one GPIO chip per
> > > pinctrl
> > > device, which covers multiple banks of up to 32 GPIO pins per bank.
> > > The
> > > GPIO numbers were set to match the absolute pin numbers, even across
> > > the
> > > typically two instances of the pinctrl device.
> > >
> > > Convert the GPIO part of the sunxi pinctrl over to use the
> > > gpio_generic
> > > framework. This alone allows to remove some sunxi specific code,
> > > which
> > > is replaced with the existing generic code. This will become even
> > > more
> > > useful with the upcoming A733 support, which adds set and clear
> > > registers for the output.
> > > As a side effect this also changes the GPIO device and number
> > > allocation: Each bank is now represented by its own gpio_chip, with
> > > only
> > > as many pins as there are actually implemented. The numbering is left
> > > up
> >
> > Ah, is this a userspace API break?
>=20
> Unfortunately, yes. This means the easily computable numbers that one can
> use with the (deprecated) sysfs interface is gone, and also the pins are
> now split amongst multiple gpiochip instances.

I don't mind this at all for new SoCs, e.g. A733, but not really for already
supported SoCs.

>=20
> However if someone wanted the old "one gpiochip for one PIO instance with
> evenly spaced banks" scheme, I suppose we could put together something
> with the GPIO aggregator driver? It won't have same base pin number thoug=
h.

IIUC, this can be instantiated only via sysfs or configfs?

Best regards,
Jernej





