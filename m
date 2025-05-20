Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B086C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=; b=FU4hJZc0FmYCJWEdeBAW3jfqP6
	nGisZOunKtLI0YBNZ7JHaE2DtYGkfIf8e3uxsDfULRE2nfPGxRIaXxrshXAX/ay+f1zZA7Qe/aH5K
	IG/ImxWNKbaVOSoFHWtXDZepNJ00KmJH7TrebYlKd/5a9e6KCYboaXn8atnjTecdRIq7xE41ncytm
	GkQnP33waffPSaIQhBlUTjbmalFRLrbm5G+LDqUo+LyfSFw4APtOFYPbTGuf4/7muHgGs75qWgnJ3
	QC3BOWAW85DqTWJSvmGQi069QPkIJc6x5GoLsbLDxUwKJT3SlS4nfS3nvKyCUoWeF2j3EG0J2Xz4O
	CD5wYB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHV09-0000000EEbQ-3RWe;
	Tue, 20 May 2025 21:59:57 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHUy1-0000000EEV1-1k93
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 21:57:46 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-329119a3a8eso31733171fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778263; x=1748383063; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
        b=n+J4DPuM+8ICIMWliwXKdVBO392gYximZ2gUbIt67F6EwU6Tgg+8YBl2eKHxhjKsml
         yg6xnE1oaiyJEoPrDy2hKyjRWIhYstAL9UBXjmMBf0H7mJr5d/v6Sd0nFGPH1AgfMObr
         aHie/jmwpTYwb+ZigFi0ll/fRbOvhY2R5+YCFmYrX2vV/JOLMiDcWhW8/rZVU7AvasXh
         OQHmSi7YFPAUSp61iDAKe2g3UtCiiHXlJwGSUCxGRX72aIqpKnnCuLT7rSXJluMgKrif
         GzLPxJLEpl32WVCpKGXuWea71eZlCAFaoBMjt0nGu6N553opdNWO8FeDTtd1gyaqiGk4
         nW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778263; x=1748383063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
        b=v897dfBk7YOdVdJXGozHF12DZ262oehCmtL3X/UpWTpyv9/Ljvc+OKbetviQl9upLi
         kDBaiZ9nuK5bn9ep/WPSwmKgBrUZ+QI1Diw0OJQRkeTyH5P7OjTjb1i7tpvRYNcreOrq
         VEaOhh/m+Fjh45kh/NFJICrcutesJ4ImjQguymUkX0W15hqD/OiKSojT6v5v/Up8U+IJ
         8zjx5AZMOngpPPNgiJo6CJs0qqlXeTsZKNQ+plTUu8yoK+6xgNje3g63pt4Qr244fdhJ
         ZH5VVHT/tlO04eRMheH0f0h+x7dRKx5WyF3gS4zmbKEB5qdhTIASNAjx9E/p08f7VlgS
         N0zg==
X-Forwarded-Encrypted: i=1; AJvYcCX/aXFrwdUwcPDXrrmiO2XLwXppl5JifmLXdMFvK3dcKAhQjC+zBlVV2EjdVGkL+kh9Y6gAOI08fqLeRxXSGFd3@lists.infradead.org
X-Gm-Message-State: AOJu0YzlclBx4cyXYp0mSm6tFn+xL3Be+KwNwN/39mtLYj3Ato5fN4HQ
	rc6Sy+R6Ufo/nCo7uFjkKUEV19P4w0fEbd4+zE3R4nUM4odvB/SjOwa9AfV8Uh/yd9frvjytUgt
	ulafs+JUK6g3f4kP0bYIGdPPTDdxrTATAEw9z6PJVTQ==
X-Gm-Gg: ASbGnctjviG3cfGOHLO3N0X1JsjEvy3xHNNtxv4jrgpxpZuL4CPc3qpNQlHWjl4Kl7I
	5MDL10FQtw54hMm1A7S8qMoQPxHfWXZFWZJO4lWP6y9N+/koF7icmzZZ257Of7UichF0M0huzeF
	GopPlknl4Wy+cuk9Px8NbXQIV0ZC2kde/6
X-Google-Smtp-Source: AGHT+IFzz0NXs8cF08Snmi4Ha7S7U5h0KKvjptJb+slPp5Gi4FWC7Nsw049EmovcMdDEvihhptYlSs6FgkwmCbzFvc0=
X-Received: by 2002:a05:651c:54b:b0:329:1550:1446 with SMTP id
 38308e7fff4ca-329155015ccmr33138651fa.0.1747778263381; Tue, 20 May 2025
 14:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
In-Reply-To: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:57:32 +0200
X-Gm-Features: AX0GCFvwSq-oMiFu75DMDv5s_mCNJqSxwG-LnpvLIXP8m8Y6ivyc6Hrx1bC20zQ
Message-ID: <CACRpkdb4OeD_yaUsGJ9Ugz3LZTCMdz1hbH-cX__ixEPr3Snd_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add 'ngpios' and 'gpio-reserved-ranges' for
 vf610-gpio driver
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_145745_477269_79DF929F 
X-CRM114-Status: GOOD (  11.92  )
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

On Mon, May 19, 2025 at 8:01=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:

> Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
> the number. This can save some memory when alloc bitmap for GPIO,
> besides GPIO tools like gpioinfo will show the correct information.
>
> Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
> IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

