Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BECEC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuIDDV8XizcdY0WvVB2Kx3sOucvN0o/9tPcHbGKOfP8=; b=N4yIqDIDOvBsW5AD4kBidRHpKQ
	SYHtNqF+P3BfAeVUan9mZAHLMm/dqLDGctzUMIzEh5pRBK/egH1FKuAARLp6HuJQJkBDMft9BWnG2
	GrHRGQvzea969zmTy96F3XZ6trNoGZkIpFxCFyVjSI08zeWhhJwAvH/YVdqoOb5UGU2FUN97Gm1Mf
	BeN9ZKMiYD/P/JLzmaNEp6t4or+Um5c7lDqdI+oiEPnI08mw5kMu+1YuMIdvC6rq1ZfLamJU/ySdJ
	nAZ8Ob+KcFyHPj9E38V/mIzpGqGNN9nN9qR3CpdnTf2MN7LPbKXTO2tt4l+CcbMFxpeoxZCKLtvyY
	2yT2wiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkl75-0000000DIfz-0JOT;
	Wed, 19 Feb 2025 14:31:47 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkl5Z-0000000DIK8-3c6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 14:30:15 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30613802a04so71865031fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 06:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739975412; x=1740580212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuIDDV8XizcdY0WvVB2Kx3sOucvN0o/9tPcHbGKOfP8=;
        b=daJRlGilrS/XUHSS1Y2XNie06Kxyz1DrIsWJQnkDSGiWbSTiH6BG1sAug/BwddIn9b
         PXZYYZnZdM6gwWpyjOjMioLKSiD+xP61Y9IS/0vJJuEsdo9py7IPDk/dGepNb5mAt995
         TnpD9I0Ibp3VXNkcmRar3Z1vOoAw3LG9GgaYlqA7HAsltuuHXY5XL1/VVcYPaWKtd6nh
         pO5dCfF8/Qi3SJKawX0t5qb2kFv8phczd24g2rlxAT87e6tgsYPqn0bYCSBrhyOoV3oE
         Dh3549fSZg7aZq9AIcRVNzRSGAY8T4sDEMO2/7W4s/lxtQa4hMK/q+GAjjPmyTQapfNz
         QWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739975412; x=1740580212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuIDDV8XizcdY0WvVB2Kx3sOucvN0o/9tPcHbGKOfP8=;
        b=tq2d/7Ui4ndSYPVg6qk/KUyHYFC0w9+jv/FHOv5mvEGl1keHxpkE0igVc2GulBArfo
         NRIJnXNiqZoHx9gIHvIGfYBV51N9FLUptuRliOsqK5Snvn2YCWr/LFpWlwbSThHYPTw/
         JFJuor2JR8650AUqwHDXbxAJb2fQqFhYDofj6xN7GEGdWrlqU7hCpehF7KaYUbtDJpfx
         ewqDB/nF2/ol8txb0sUucF6noorr8adzOupcLXeEexdRMkZ0QCk3Ro19FA5nOvTExNtw
         6r29aUfP5tdYpnZFSLTh72whHo9wzYS/Akw5snJq5Y4+SHNUhNJj4OFS4jT+6AOxjCQW
         AD8A==
X-Forwarded-Encrypted: i=1; AJvYcCWKZkrYwXujAl79DgE/R73JAN9jSCVRZiy9go3nX7Uszjz83rFRUsSdqf8ZLSy6Yy5/QAGuiBwvGdfStTSsIhd1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/2tg8a69ijL9u6A7/xt1NFrIBQkHBgVr9ooIMcEJJ1YL+ASSe
	ykIrCWde7qQH5dK2/SgNIlEeLF4o68DOE3Jh+ynoc9rbkvqR8izOoyBRaOY+x5TCwkB20IQvln5
	5zLbKgMJhOLDTn6KvnBBI9bLdbZojqCGN4cfNfw==
X-Gm-Gg: ASbGncuQpHrUPfT8iBgKoS12kZpoznuy7WDJG4YNM3+O2zW7TBpXl3CU7VAdh5gzTyy
	lOzce7HL7Wg5c/NfBIrO8b4uUcgD/UFQ/QjhESs9K0MDO8rkqCNzL5EKYU4KzSN1+AZej4hnbF0
	ldz0Cl+THP9RBRqf9OUMvRyO6DUf8=
X-Google-Smtp-Source: AGHT+IHOMtfBh/a511ZAJ8gik3yig8Gf8tft31WvSnZ/9U8LQBfynkf9Rv5xxIK5889YeSWOE/kZLOcF9FoI8gDV8D0=
X-Received: by 2002:a05:651c:a:b0:2ff:8e69:77d7 with SMTP id
 38308e7fff4ca-30927a64cacmr52017231fa.20.1739975411736; Wed, 19 Feb 2025
 06:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20250219102750.38519-1-brgl@bgdev.pl> <Z7XqSVfhPGI5J63B@finisterre.sirena.org.uk>
In-Reply-To: <Z7XqSVfhPGI5J63B@finisterre.sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Feb 2025 15:29:59 +0100
X-Gm-Features: AWEUYZk4HNm_SmluZtNRXIOXfJN4_JOCBah2ClXW_YT2EcZ78XVjnV_7fdlN460
Message-ID: <CAMRc=MdEcjFUp2OEutcnDqSHbbait3f25NEWbdp7mARyKZLvBw@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Liao Chen <liaochen4@huawei.com>, Chen-Yu Tsai <wens@csie.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_063014_155794_5898D23F 
X-CRM114-Status: GOOD (  20.38  )
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

On Wed, Feb 19, 2025 at 3:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Feb 19, 2025 at 11:27:50AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Since commit 9d846b1aebbe ("gpiolib: check the return value of
> > gpio_chip::get_direction()") we check the return value of the
> > get_direction() callback as per its API contract. This driver returns
> > -EINVAL if the pin in question is set to one of the alternative
> > (non-GPIO) functions. This isn't really an error that should be
> > communicated to GPIOLIB so default to returning the "safe" value of
> > INPUT in this case. The GPIO subsystem does not have the notion of
> > "unknown" direction.
>
> I see this was already tested for these specific boards.  I've also
> found that Avenger96 is failing with bisect pointing to the same commit
> this is fixing:
>
>     https://lava.sirena.org.uk/scheduler/job/1126314
>
> as is the Libretech Potato:
>
>     https://lava.sirena.org.uk/scheduler/job/1126285
>
> neither of which produce any output before dying, they'll not be fixed
> by this change.  Seems like an audit of the drivers might be in order?

Right. I don't know if they return EINVAL or some other error so let
me prepare a change that will not bail-out but simply warn on
get_direction() errors in gpiochip_add_data() instead.

This patch can still go upstream IMO.

Bart

