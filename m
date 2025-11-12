Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6265ECCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsuCzn99HhVaXWmVpBege6OrJ/pMPiZ2yYvkZ7pOFR0=; b=j76emAr5SwcclhiCiPb3wchfil
	GdFGQqduH7fOQhsL5IHPEXG8DZex6CWgdMQQTK/1EB0t0KJgrPYrkY0/CD1MC3fGGeXa2SkAOWcWN
	mwBAfaVhFnhoi4L0UNFF7Y5aY+juqNs7iTK87MXQyVdwKAN48zKWbB36svbpftPiiF7ivndXtRy3E
	q2jIP/7htsZ/BmP3LFfjNnIW83mx8Q2To8ScOi+z6C5FyHo/mF+sAjQZbKIO666EDyz01TsIsOcuo
	mMGG9cD76osO94QKScTxDepnuq6ix09Fhh6AQRAB4nHcYOA+l8e3GONdUp+jmbtuu4ILWgo0b9no6
	wXHRQQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ5s9-00000008JL1-0MJ9;
	Wed, 12 Nov 2025 08:06:33 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ5s5-00000008JKM-2SlJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:06:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-591c98ebe90so541231e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762934786; x=1763539586; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsuCzn99HhVaXWmVpBege6OrJ/pMPiZ2yYvkZ7pOFR0=;
        b=j1W1gy+uuu6SjzXpfXYrNYvCrENUGwzcIOtYv8gF4KS2+F4I9fKvofB0EP15N5YjMR
         /lKy6pEEOFgpArjMOFzgkNcVjmNm/pA2ppKV+85ciV7NCuJC9yuw2x5ZxRTSnPZi9OU1
         PcHc9XjfJwOFaQV7PRSBjSkB+q8w3SlJX8XSJOBwuui0/WOl4in476Qav/oVIBFaOOrB
         FtnbRGqmXb5Seym7kNTXvP3Kin09diJtqRidjhbwHOZjj7Yt2N4l+eWdpz/L02P7JlCD
         eM2OpRPKc7eM6LHS6UEQBnqGu8SK5HW8v6wJ9Ss8fsf60YmRnrCy0J9W9wV0iEQi3cdI
         A37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762934786; x=1763539586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CsuCzn99HhVaXWmVpBege6OrJ/pMPiZ2yYvkZ7pOFR0=;
        b=XpfyD5MKp1IfbB3EhKi91Q18oxDESAlf3yR5QBfnuRaU4mN8mgSFn0yrJCLJ2rd5Nb
         TyHGfv4no2i+ptBGUsrneDQsfqp9rMEiOAkj9jP5o6nnsdUqpsg2PcAQnC6+XgLLJyiy
         o6M2N6rkH9xCOekiP/YjbESlWn+LdSasDBo3v3W7z728MCarSY+SFTLbJEJtrYBMOIor
         PH5X2Feshil/AxN8Aev39tG6EHQskn81SBX0cAkYDsRaDRgZI8itQH/iCFW71qnoAivA
         iWiaPiT5QADgqUhud9VHOt2YrtOgh2lL4Kw+uNSMAaDOIkyHmAF194JYiXpP2UIl/7Sz
         LWXg==
X-Forwarded-Encrypted: i=1; AJvYcCXo1rXYknRq2DMn7yBlaTIRaJGLBax0qfUXTMDeCbjszk2/ao3zovbc+opjYwnx7XpqW6dFBdWM6A+OBqKJ6PU9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4eiYZqcPaig3Tr21bhG8jeP8hJ6gMC076dV0MszCAzar3o3Yj
	OhuZ/NGPqKtXIV3fIxg722xsOysTVrmvSqbu897aWhJ4wuQGDX/2IiWQDW5tbfz6u+yVJwo19Mz
	MCpiaS9A4nHDNMknY6ZU932tQZyIdZEIf8ylko/ng/Bd+XVl4EnwSGSo=
X-Gm-Gg: ASbGncuquFmGnhq8eiFWFZI3BqWjIH5ZzPg0UJ0WpKcXGfjTcpm4YVaig2Bpe6cEH/5
	e7jNZShp37cZI4zOzNCb8N0GgFGv2f13HXPRZWMS6qbnFay23WxfMtCsSXhvM5zbOqAcFlxTRT+
	2AE2oV4Xr3YJoUR7pn4bLSRjgVih91Ii8MidZn7q0hDwhOkRi2JWjOs0Xu9LAVH2WWnUitssdCp
	RUqneP9M+PaCUwJF3CAtxZTp8T/HTcwPsWlHIJj01WTfuDDo3qWfIMgPUgslSgEgA8tYXMoVxnQ
	GxhYgwdpJXGiyE8=
X-Google-Smtp-Source: AGHT+IFGOvlOzvk9piywId0UEm/LoEe92kaATxaPyyaUwvvWEVZS+cjBT7dXjw6jb/DtZt422ITz+COnEZi1kuHwxHY=
X-Received: by 2002:a05:6512:3e1a:b0:594:3039:2d16 with SMTP id
 2adb3069b0e04-59576e2ca55mr736184e87.32.1762934785669; Wed, 12 Nov 2025
 00:06:25 -0800 (PST)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org> <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
In-Reply-To: <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 09:06:13 +0100
X-Gm-Features: AWmQ_bnmO8YFH80sSD6rPVFUgANGxGc1BYRZ0qoygt-PZMj9Pyi0gMYkuFaH7pA
Message-ID: <CAMRc=McySdUtj4foEf5a2db8jUEa=CnPmVVms2nwHoO2UYChSg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_000629_899209_902104E3 
X-CRM114-Status: GOOD (  17.11  )
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

On Tue, Nov 11, 2025 at 11:44=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Oct 22, 2025 at 3:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Provide an interface allowing consumers to check if a GPIO descriptor
> > represents a GPIO that can potentially be shared by multiple consumers
> > at the same time. This is exposed to allow subsystems that already
> > work around the limitations of the current non-exclusive GPIO handling
> > in some ways, to gradually convert to relying on the new shared GPIO
> > feature of GPIOLIB.
> >
> > Extend the gpiolib-shared module to mark the GPIO shared proxy
> > descriptors with a flag checked by the new interface.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>

I think you wanted to leave this under v3?

Bart

