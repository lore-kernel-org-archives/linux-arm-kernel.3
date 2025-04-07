Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7CFC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyzXLIZQz5jByjQJS2N0CsVIfLCOdR71gsbEiiRIwmo=; b=eiPQA0yecagb4Q/74QWR51Pe3e
	VZE2Ot0wJNHW2VQWJzmStBzI88KOewhjJ42klPMExPn2lSamAwkG2yvJypqT8rfulEh8SmFzanT1H
	G9CuED3P9N+g1631YsecYs3aFG/03RxDpIjGqZwH3P9Qe6h+R8PM+zv0OocP0PoCihveqz5cp7cMP
	dYUP7VATOsMO2WtHFzyZXo5cExNCTZFxbqm32GVy/ABE1HAgoIlGkhOdCn+qvra54AJb6u4Ra/8ei
	s8LA7KLrDSBvt2OyNFcoqaXqk0t27Y3ZpTxgmF0tff29P0IQfL0hSgJ2GXn7q9H1w1XydUkzwKK7a
	8B0uhQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lhi-00000000H1E-2Qzf;
	Mon, 07 Apr 2025 12:35:54 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lEA-000000009fr-2TZw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:05:23 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54954fa61c9so1884286e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744027521; x=1744632321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyzXLIZQz5jByjQJS2N0CsVIfLCOdR71gsbEiiRIwmo=;
        b=v+BYIbTHIm815EEPp3Tq9hMkQ8vsj607usY2LgEHYiVcb0rxRlH7ccL09elVxNKkUB
         SBINrkVh1Fjk7aNxnvVei5oAYqlsersQdnLK5kvT2r4+uX7l/mnzV1AMEerohSC+SbWg
         WbmzXLStxxSl2v+Wx4+ah6XUzfTzHUIb61BrVP3otUUnoJK8vBzY4zSnIIPpoJ45oQyE
         9GV3/mdpTnJ/2BMiVU9elpQecz4nyyEsq1zg7tYskuUuAbsb/SoDqcMJQhAyN+9TFiOh
         9+6kFYlj1biCJlaQjk3qhthm52y8AhKy9tEjTT7N+tC8ty5UWGowcHXH3Aavmpkd0ZfZ
         AZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027521; x=1744632321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyzXLIZQz5jByjQJS2N0CsVIfLCOdR71gsbEiiRIwmo=;
        b=iZCvTIfll69AyLY1U2/ULQBIC3CFRWmIK2tSrGySYthEyHuQNzp+UcU7J1jjticlyA
         MbbuiHU1vsZDQrO5RaoKz2K/zn8VJksyU/+ajdL6UT7/nbqy4eXnFqLgrgSr9eXsJ+mQ
         sqBXdHOQmcX4PvWm5+XlnsB/7dtiOe81Q2HrB1HmSjtokiosXtGGJ1CB44vJPCDsFKH+
         6wSC4ezZSIKuwRwfKp1tYt57eJnucx8Tg5CuAdaWogckXW2yGaKYV20/4IQcNmKC4xfk
         V3hG77NC8r182bF3y9K6QzpIXNykBBQc5mQ9pSvxuCxbTHFUGq+WRJMwSGsmCfWIeB49
         2j9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHnShInMbTXsPvc+RZXa2NieQmAcLiLxaJrH6xE49IDsWmgMCkzUlMY75MjJT2HKZnRXsE9L7E3IjtUrnbutGi@lists.infradead.org
X-Gm-Message-State: AOJu0YwJEEFApzIGTavHOoKIvCh2wWLv0L6gOkFHu1ZJ/tFPB+gHNttA
	MxoLoeHfQzJdTYfIFUHwhBCfiiBS+2L7HzAGnH0xG4vF70oLoPUKyooox433n9GE1KgY9dhEyod
	d0E96jf6Oyxjn7SMYr3s+r1J2xntxYb+YHcphnK6MfGP5gao7
X-Gm-Gg: ASbGnctCgwONsY4jX1UzjtiIYOcUqgrY2ULugqs7GHdM0WT6nhEUUUgvILf4rKE8GFg
	O/kThQRSxzBlaYr4xMTWbzyC8/iMKEnO/I6/FQsbWeO7zS5Ai4OAarH4E/+6F+bKcnD+bcuB3zl
	5xNdqMlBKAnCbgX9QCNdtZSDBh8oyQjnV0hULBcBfiUzJj5zm4Qt2lE311+w==
X-Google-Smtp-Source: AGHT+IEHw9355ezApneCF4SUVAzLY4ETP4OFd5PKxXyTOOvjdLrpav+qCe3u7bCH6diRQ2nujvbYSwfCNWcbhNX6Dk8=
X-Received: by 2002:a05:6512:3984:b0:54a:f7fb:ff82 with SMTP id
 2adb3069b0e04-54c2278b893mr3000965e87.26.1744027520594; Mon, 07 Apr 2025
 05:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
 <20250327-kernel-upstreaming-add_gpio_support-v2-1-bbe51f8d66da@blaize.com> <6b8583c9-3755-4b33-a454-261854e6cf2f@blaize.com>
In-Reply-To: <6b8583c9-3755-4b33-a454-261854e6cf2f@blaize.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 14:05:08 +0200
X-Gm-Features: ATxdqUEsVQaphQBZzJswprLa4CXDw66XJ1bSTvKJk9OJJy8QVGv0t5yn3iIm7lM
Message-ID: <CAMRc=MetyZqOgtdPgtSVQ2BHDCOAqoE3K70eCehkOscL8kmbMw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Document Blaize BLZP1600 GPIO driver
To: Neil Jones <neil.jones@blaize.com>
Cc: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matthew.redfearn@blaize.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_050522_628931_A422492D 
X-CRM114-Status: GOOD (  19.18  )
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

On Fri, Mar 28, 2025 at 11:02=E2=80=AFAM Neil Jones <neil.jones@blaize.com>=
 wrote:
>
> On 27/03/2025 11:27, Nikolaos Pasaloukos wrote:
>
> > This is a custom silicon GPIO driver provided by VeriSilicon
> > Microelectronics. It has 32 input/output ports which can be
> > configured as edge or level triggered interrupts. It also provides
> > a de-bounce feature.
> > This controller is used on the Blaize BLZP1600 SoC.
> >
> > Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> > ---
> >   .../bindings/gpio/blaize,blzp1600-gpio.yaml        | 77 +++++++++++++=
+++++++++
> >   1 file changed, 77 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpi=
o.yaml b/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..8b7842331a22b7b9fbfa42b=
9c711da99227de2e4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/blaize,blzp1600-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Blaize BLZP1600 GPIO controller
> > +
> > +description:
> > +  Blaize BLZP1600 GPIO controller is a design of VeriSilicon APB GPIO =
v0.2
> > +  IP block. It has 32 ports each of which are intended to be represent=
ed
> > +  as child noeds with the generic GPIO-controller properties as descri=
bed
>
> Typo here I assume, should be nodes ?
>
> Also maybe better worded as:
>
> Blaize BLZP1600 GPIO controller is an _implementation_ of the VeriSilicon=
 APB GPIO v0.2 IP block
>

I fixed these in tree, thanks.

Bart

