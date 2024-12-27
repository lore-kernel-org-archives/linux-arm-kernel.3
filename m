Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7621BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfE1uA9z/wnOoCflN1CWK91/mj7Glf8TAJeO4IAX/hg=; b=vdwIrahBnEhoi5FHzjVop9zdFX
	QVq85DtjcuhIMO5OZjmLan7Ix1xacm2uXTzJ6R1tAjP9st0qhuIwzodj0k/5UEau7OGiKFNX+ZK2t
	AjcuXgarjbiS9rMaIlg6UbDScQ8hAIu0p1sI4xu8IxEtH2H4+i5KABbH3fs3hk6w7MLHidYnJKSML
	mbwnx2smV4eH5v4esKmNHBDR17NKgObIqzOtd8zyQBFupGQVmeg6+gyZENlb8TOfXoXMTZhi4Pq1I
	aTynyuhKYO/+6kxCZLy4V8UdC9bikMEgyGQmtN5tq8j9eZo0uIWT3OOcPsjoENbvzIjjhc+xx4ESG
	lVOdVATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRE99-00000000iwh-0Zze;
	Fri, 27 Dec 2024 17:29:11 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDzc-00000000hj0-31V4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 17:19:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54025432becso8039760e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 09:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735319958; x=1735924758; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfE1uA9z/wnOoCflN1CWK91/mj7Glf8TAJeO4IAX/hg=;
        b=DzZKboGiSl+4FUq1ztL0Eey0oxWQlc9kswBy5BPkg8JMtwndEZa+8Ek11egMNFPFx0
         ZEJtxu3wKkB7YBSX1156lEhRwri7HW/lL5A0rcu0uyd5bER1vMB/GWzqIV8RSuhkxUTi
         zPmv07EPUqTyO3vwFn53GBBFt2wFKETIqEWBffHllRkCzO8uCV8V06joL8KOVszSxDo6
         mNjKyzVEoX3LngH6oFgjjIbi+NgFqvU/50nS9K/L8JJ02nL1B7a8g6h4b1lGyeXJGfjA
         xlaZ0ycZ7C3wcTK4zAFlj+glb3590QTDP+L/eFYSGPdlLWplhZeWLat4tH6n/D6YIb/9
         rtxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735319958; x=1735924758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfE1uA9z/wnOoCflN1CWK91/mj7Glf8TAJeO4IAX/hg=;
        b=QbBwDCluAMqc/o9rlK1KN7qsxne1zZxvZsxFqHYhIczSlprwTbN+iVfhmYqg+xd66g
         BhcZjFzd5rz3LPXRGJgtT9Qt9420VDWh0vBnEw7X1pGYsxbYeS4xhO0DpaIBYp/z3QSx
         5cfXY6MHpbXwBVvpWYd6ykci0G7rubh3Lj84JbQHOMRlBah58dJ+IoN4oZyAqW6yLGuJ
         2mVm2CEfQcSpzmeS3f7zddtG/izY1WsOwmq7BFPn+RyhVeD9ERH7SNrsZkM3pZYg7i+8
         EpiWYKYdMGooxF1sBRYUIuwOfboxQN4u0v+u3LBh1py/MoEtOd1fA1BDQO4s/HjMnzoi
         RP2g==
X-Forwarded-Encrypted: i=1; AJvYcCU2qwcI3tE60LiQ358+uuinZDce/Jy5zxUyp7/n/EvfPN3zIn5YZd+vKz9PX2QEOATvNrT1lWhqJL9QF6lsUHmo@lists.infradead.org
X-Gm-Message-State: AOJu0YxbcjZIqxFU4tJpCB7bI6aXb7SD7RzqEyNf8kZ87wfKSx6W37QR
	XvSGLi9hF2Ro85zV1H8oqMK2DgnCqvBSyJSfBRkr3Rwmwa0V9qntKAgj7ti2oPDTsDEzUzYT3kl
	GBlN0COSJd5YZYKq+nvO8vrtcyhyiVtVL29dgJg==
X-Gm-Gg: ASbGncsp5kxAhW9cpgmToGKAadLUQ97nTzOfYE5Ekh0p9izW1FMSIRlc42xpC/8qSYJ
	rmSKjGsZjeOna5gd0nLVEzB1oG48Jar1qz7N6
X-Google-Smtp-Source: AGHT+IFzNcSWitAgqLSjOZTRtHRUbR1A89jwQ+VY2x1PRVkphXKNjTxz5Znr8iriDFxh86d6rMupXkeYXSvCWzdEP2Q=
X-Received: by 2002:a05:6512:1246:b0:542:28a9:dcb1 with SMTP id
 2adb3069b0e04-5422954b10fmr7658536e87.26.1735319958460; Fri, 27 Dec 2024
 09:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com> <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com> <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
In-Reply-To: <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 18:19:07 +0100
Message-ID: <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Huqiang Qin <huqiang.qin@amlogic.com>, 
	Qianggui Song <qianggui.song@amlogic.com>, Hyeonki Hong <hhk7734@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Carlo Caione <carlo@endlessm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_091920_760233_DC80A2C1 
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

Newcomers, latest patch set:
https://lore.kernel.org/linux-gpio/20241226-amlogic-pinctrl-v2-0-cdae42a67b=
76@amlogic.com/

I included some of the prior meson authors on the to line to see if
their mail addresses still work and if they have some feedback on this.

On Sun, Dec 22, 2024 at 10:08=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:

> > > - Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
> > >    so we keep this sorted by actual vendor, sunxi is apparently
> > >    yours (AMlogic:s) isn't it?
> >
> > It isn't. Sunxi is Allwinner SoCs.
>
> My apologies. I mixed it up completely. :(

But wait a minute. I see there is meson. And in the "meson" subdirectory
there is stuff named "amlogic" ...

$ ls -1 drivers/pinctrl/meson/
Kconfig
Makefile
pinctrl-amlogic-c3.c
pinctrl-amlogic-t7.c
pinctrl-meson8b.c
pinctrl-meson8.c
pinctrl-meson8-pmx.c
pinctrl-meson8-pmx.h
pinctrl-meson-a1.c
pinctrl-meson-axg.c
pinctrl-meson-axg-pmx.c
pinctrl-meson-axg-pmx.h
pinctrl-meson.c
pinctrl-meson-g12a.c
pinctrl-meson-gxbb.c
pinctrl-meson-gxl.c
pinctrl-meson.h
pinctrl-meson-s4.c

> What do you think of the idea of a separate drivers/pinctrl/amlogic direc=
tory
> though? I think there are already quite a few amlogic SoCs that need
> to be supported and more will come.

So what about renaming the existing subdir "meson" to "amlogic"
and put the driver there.

Also I want to know if this driver and hardware shares anything with
the existing drivers in that directory. It sometimes happen that
developers start something from scratch despite the existence of
prior art simply because of organizational issues, and we don't want
that kind of situation to leak over to the kernel.

Yours,
Linus Walleij

