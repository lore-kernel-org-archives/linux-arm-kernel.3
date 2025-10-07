Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAE9CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5Gn50jfOxZiiSgXxR/gre/tjvhockNBFkRAG2DI30U=; b=dnsLafnVOe8Eb7M3cIdKt825pu
	O7WVJdotPRrTY7+X++GHevegO3AwG48r1Y4iMk0HiBgTWq0MP8ulDjcobEoAl7azV70BS1v8T4+7C
	I5f3Wpqz319veNP8OIMergoffTazOYIauBHZGTbtSh4vReJD3gd+a+5FE1xtGtxoXoO3SsjYd+hjc
	A3HQ2rDAIpsiwHar6fQ9Fv81IQO/y0Jn2mKCFK43MjgCczKQr8NCE/+dtmzo/MGjVE7RK/whltnQp
	Bf4Alc5cya0IOOPioTA1XK8msassTstB4JzM8ZrUQL7BnO9QtnE/+M/JS35/DKIuTweRfmF5X5JWU
	L1pg2nUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63hb-00000001fq9-0sNY;
	Tue, 07 Oct 2025 09:09:47 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63hY-00000001fp9-2lbh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 09:09:46 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7a4a993dea6so1911953a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 02:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759828183; x=1760432983; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k5Gn50jfOxZiiSgXxR/gre/tjvhockNBFkRAG2DI30U=;
        b=Ahbn+AC9A7qC6Jb+7SqDTXMs17YRFJHPw5+1C5Vo5YhAOvOGeYwvfQFiYq+RHiln+u
         mea3ZcVI9VaF6OGV2A+mGw30IAGgdFHQ/mR0LAnRGSDChjqNMxQYhNIy8IzYzCwqy6Zi
         88ykp/FtEvBFGg6gANvHwlKkKORZBkqqJNAnit9Y6of+9cfPQwb06ApcbiJEIAwGjNc8
         xA+/FbdKaD7ofGSoeGLdNBDyLm9Mb0hw0lcxwZP+ffCjmpwAqBvpvadFNQ9OA4KGW0xj
         yvYHHr+7VQT2nEmzNpQtqPduvPHGoyncn4Sv85Y6P4YTRC1iwyLihUQa/Ro2YUGS/+tQ
         mBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828183; x=1760432983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5Gn50jfOxZiiSgXxR/gre/tjvhockNBFkRAG2DI30U=;
        b=Xg/TAyUX/MXSS+v4Iqv1WME9EUSPQsQ2iNyHMTEDM6EN74OmeSwhhw5KskWADIvbgR
         UaLrSa9oXFOIuYAw65ax2GHbhIZ1yIWV+4YHTrkvWEIIbIj1G8xp9ZWYSKLIT00UHuUI
         bx4qaxUJ+XSsTMudTP7dCh+a4zNog3NNpad6nicdyiSBq7rraVpw4nO9IUkr8lRMji20
         Tr8uZnFsRrg1Z6Zu66wVUnlB6lCRVrqfrWBita0iVVpFsI5q8VUDKwOwvDCYnPobirKU
         3daq9xX/CGOV2Vvdlva2AK0UEY2hXIF9E46bnab5EaLT8bpMHza229eUFjfDX0tFyJMZ
         66Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUUX4ZL1xO6+z3Woq7E0dwvYm1WG3xtTRKxdzbm4+Y1VzcdSJ5A2egtnA1229+dEb41IPRGg8O93ICQUoQxd3mf@lists.infradead.org
X-Gm-Message-State: AOJu0YwD3XOgbX+qQuRZhTy+TITMPSpYMVKNwMjCRimEA4gGcjJwhA75
	rCe0N2MNlpV0GboblS1a7isQNzCVAcf3wZzaXh+KsSrP4Pul6QQmR2atnq7VZWt4wtBA1/BLomW
	MNBcEXYU0XwdqnpCGK7seGkJYwl17mhIm77jAQ/E8Gw==
X-Gm-Gg: ASbGncuroUP8n/xZiHtJHBjnzF7HRuMnVh/ad+q+694PRrXcGPbjrqYLalKh7m13O7h
	h8p+cS6umzVL0nF5rK3hczX871cQLt5kzVP4hG+T364LGyYmP+5h3Z92BKyIbmKj/U0zdigh7bL
	n8aMb7pQd85f8NgH1+thvganaduCX44Gk0TAsm6baagl+38xxSJRdQNFSILKi1KRLbgmMKN16Wh
	qIaXuQ9t04UPRFntmbxtT3eE84IhfOHwtEd3w==
X-Google-Smtp-Source: AGHT+IFtOrLlwJK0/TEgM+f2IS4t9o4gV7fAIVv15sfMLe5yqLK9nGKna5+x4B1VTMirLjZ+oFvqM3iKI6ns6JfL4hs=
X-Received: by 2002:a05:6808:3096:b0:438:2907:2ead with SMTP id
 5614622812f47-43fc18a2091mr6585032b6e.50.1759828182026; Tue, 07 Oct 2025
 02:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <20251006232125.1833979-3-royluo@google.com>
 <8ca61364-df47-41f2-b0d1-f2a8a74ec728@kernel.org>
In-Reply-To: <8ca61364-df47-41f2-b0d1-f2a8a74ec728@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 10:09:31 +0100
X-Gm-Features: AS18NWD7ktu7qt-H0DxecJcoZK61ZH3ap7EbdS2ccz0Z-j7ffn7elGuijfKqbpQ
Message-ID: <CADrjBPr7Jp_ZyGv2Krv6iLG0avgFWpcWJEO-Z=cEkhwEY-+z5Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: usb: dwc3: Add Google SoC DWC3 USB
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_020944_867355_3C34203E 
X-CRM114-Status: GOOD (  26.06  )
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

Hi Krzysztof & Roy,

Firstly thanks Roy for your patches, it's great to see more Tensor
support being posted upstream!

On Tue, 7 Oct 2025 at 01:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 07/10/2025 08:21, Roy Luo wrote:
> > Document the DWC3 USB bindings for Google Tensor SoCs.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/usb/google,snps-dwc3.yaml        | 144 ++++++++++++++++++
> >  1 file changed, 144 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
> > new file mode 100644
> > index 000000000000..3e8bcc0c2cef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
> > @@ -0,0 +1,144 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/google,snps-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description:
> > +  Describes the Google DWC3 USB block, based on Synopsys DWC3 IP.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - google,lga-dwc3
> > +      - const: google,snps-dwc3
>
>
> There is no such soc as snps, so you grossly misuse other company name
> as name of SoC. Neither lga. Otherwise please point me to the top-level
> bindings describing that SoC.
>
> You need to better describe the hardware here - why this is something
> completely different than GS which. Or switch to existing bindings and
> existing drivers. Did you align this with Peter Griffin?

I think (from what I've seen at least) this is the first submission
for drivers in the Tensor G5 SoC used in Pixel 10 devices (which as I
understand it isn't based on any Samsung IP). Hence the new drivers,
bindings etc.

However the issue is that none of the other base SoC drivers on which
this driver depends currently exist upstream (like clocks, reset
driver, power domains, pinctrl etc). So it's very hard to reason about
the correctness or otherwise of this submission. It is also likely
that when those drivers are upstreamed things could change in the
review process, to how it looks today in the downstream kernel.

So in summary I think to progress with this we need to get the base
Tensor G5 SoC drivers merged first (e.g. boot to console with pinctrl,
basic clock support, reset driver etc). Then we can start adding in
some of the other peripherals like i2c/spi/usb etc and build up the
mainline support from there.

Thanks,

Peter.

