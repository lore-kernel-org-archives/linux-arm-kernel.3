Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1170CCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=; b=V7gna3LQadlnuxFqvVPW4LBklH
	6hdZaJbEafh7bZ6J3sfB1Ucz9F8wuE8X2oFAMOiB0lDXJ/U23xSvZV7SVXXswRYS4IuWjs0m7hPI+
	ARB61tQ+p9P5LfwOt4SMS1O8gHJpH7enIB7BKv2cxUkNwo4SaR1najX4r3DgoHs+nFgM7lZCv94XA
	JQWZ/zfpIZlDE/cVkhhKvrtb+q7OWYDRFb4M+fnQTftVXbiOzJlB3pTlgw2qYOwbROPikFBY+gUh1
	z4zqrGwsYEIxxQum1tuYN79aURueIHIY6qGaJ+nZabmIO5STlgmg96phdfE0HMvfRAISss7yzRy1O
	tEu3uikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wm-00000008p5D-0qds;
	Tue, 09 Sep 2025 17:16:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwd7-00000006mOs-0kD0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=; b=laTKQcnGMuOgeQYxOlxfPgZRz2
	0Vl6E4379a305dCq3OV1v2k8CVPAdys4dpv4YXffFcNRgZo+uYP9361kzZ1zZfKRDcQRYGNNWlBXw
	SLFTwYmfDxj+7gzAJyk179HiiTr5ktrzK4jFZDbRduDEnmtXpzC5XhO4fyKCNqBGgWuK/p4l1v3BR
	O1U/pLwthHiGHIsDWNHtvggwJBJiF7fPp9hbkYt+fMo/Ba3IhU6ty2XXAxTfqIG4AWr431SUdc9Vc
	GIVi8LTKqsuZaQR1RricZsMHb/6gzgMZ0U+mAqJQ2thGRDE3PCSpjS8ed6Ne20KBpNMdf9/svs4MZ
	cAmPkseg==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwd4-00000005K1p-0wWw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:35:20 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55f76277413so6292963e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757417716; x=1758022516; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=;
        b=irm4VK2loLiDOIXxKob0Yf5+2D9iGpC2tV2v8j5KJev1yQqnO9UfPuFUJvcULUNx9i
         sk/XmpX8ew8Uu0Vq8nD5Es5D6kZWwnhnwbBLJaaJQwVjZTbJezZ3SXKglVLSfaiaqnlm
         hQkB2dAd9EhYdwuekI01bNW21VSR7T83MVn8b9Bz77gpyQbKzTfRAx6yCe/6MN3GG0if
         55lL1mZlnKBufRLDK9gGleDU6Dm+bA38u9LGO3VPBmtWRkyXElLTuvfOvEQap67TKvWB
         PI4HOep1I1K1X61PbGD1AVewOiDKbwkzlNSgYM4QQsj3PQd11SdqHkINBRWbtJs6J4M6
         ii1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417716; x=1758022516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=;
        b=lzsAPqEA3GkuVQq0wv+e7AE1P9Kz0JiQPH8hXhEL4V+NFNVRfFQmDfAcagTEEOY5Ig
         EPu0Vsz35ImN76x7LssuUnX6qpJz+nZzd8IHvzXgP4bxcsz4kH28F8am4BGwz6mxTUpb
         v14dbwc8XEb+Xr0ogow5p6DsLtAoX4UwJR326CEgeOoBK4D4iGvEDlp1yPTXUEMvld8T
         PXrLTx+zimp1G0uaK4/ovSwSkd5lDtnK4leAFbsXKgKDtlSQaETg7ee14sSkhhmNk5nL
         gLXmwRjEHEbbCU5KfYNRRRLo26rxJZbUCmXdYZKY/WQuAUmOTvdSs+YA+d5vQS2dgTjp
         G2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk/Y7fKIrzCBgKDa77KYa5T7lAGn1rr/OA6upB56Fjv00hNrVY4hqhLTWVxIMog1/x72Xd45eSKODSER4V1Rfr@lists.infradead.org
X-Gm-Message-State: AOJu0YyyiSw07KXjXWIPiJ2txiEG1dbtjwAnBk+lf4NsRjlSRd3+V662
	0tfZbV4K2hTJqUMoALeXC02XlhBrZbVebSTXZt1ldZtAsjlp7wxBlMRiZ0wxDdYcte0SjiMXsx7
	nrJ3dD8YNaBG3MaWlVzMRQGczGJxowF25xv7NHFD+Tw==
X-Gm-Gg: ASbGncu7t/MVwBB7wtvHcoNR/6xOVkdF0u1Abz5h2SHOlzT7BWlYYrQ0nwUo2DJOBE1
	etf5C0PB27z+sSz3Wr1FC44F3PjZoqgP+Ma4wVF46R0DtS/VtgXnjyIRmv7/I7T4tUPLi90J9v+
	YO0JtqDLSQFG4j/74B5rDKMHi7zVp7BMSOfuCWRQuOFfuXJpXOB9N75jrHjtoakKNoVUtQB476a
	b8pDQmTqmJWi3x4xRanmt/rVn8HL1izrMXiCgBwpD1HwN3/6Q==
X-Google-Smtp-Source: AGHT+IHWd+/2o3jpP5pFKotnmfcWTA0FpdlTJ7xwTNOp9WJ3bLpmlAirprq1zjBteK7SqJBfI4YYAjx9R2Xs8MJv8vM=
X-Received: by 2002:a05:6512:639a:10b0:568:4ae7:8371 with SMTP id
 2adb3069b0e04-5684ae7fda5mr659891e87.4.1757417715746; Tue, 09 Sep 2025
 04:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org> <aMAP9hAWars0T83r@smile.fi.intel.com>
In-Reply-To: <aMAP9hAWars0T83r@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 13:35:04 +0200
X-Gm-Features: Ac12FXwO2LcDkWGWZohqu8ChVnTISfR-cQj8e5EdoM33wEcP1qEQLJ7mzcbrqVk
Message-ID: <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_123518_464834_7F8E3F44 
X-CRM114-Status: GOOD (  14.58  )
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

On Tue, Sep 9, 2025 at 1:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
>
> ...
>
> > +     config =3D (typeof(config)){
>
> This looks unusual. Why can't properly formed compound literal be used as=
 in
> many other places in the kernel?
>

It is correct C and checkpatch doesn't raise any warnings. It's the
same kind of argument as between kmalloc(sizeof(struct foo)) vs
kmalloc(sizeof(f)).

I guess it's personal taste but I like this version better.

Bartosz

> > +             .dev =3D &pdev->dev,
> > +             .sz =3D 4,
> > +             .dat =3D sd->gpio_pub_base + GPINR,
> > +             .set =3D sd->gpio_pub_base + GPOUTR,
> > +             .dirout =3D sd->gpio_pub_base + GPOER,
> > +     };

