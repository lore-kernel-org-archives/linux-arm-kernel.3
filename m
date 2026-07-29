Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC92FC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/yZ2ryno5QQqoWFq7rssKxvGgdH+IdvJ1MYCeu+/uo=; b=wGiCjb1jr4LpB1WOHQFG5jnBB+
	HGBFxh8YyDKVN+xzLHLHonCDx/3E5YY31QltRzY6lm4cdEDqaV3LMgPS29IoXxQKm0id7XJVv1bLp
	To5B5rzUU2qekE2p7iSKFzvduui2quS3SksecxD5caLjKD2q5xuBf/YzZR6CyI1hv43ijmxaqU5ZR
	H217bbolZcHdNmBcoSiGKBbEnWD/zc6kwthaL/cX/2rN7uLBVLpSSXDAhnMYcg9J+7E5LF70JheIP
	u8+y8eYdzyE/3vJIdmcBABwSAeDw5FhxL1x0bHbhOMY+wRdsltk78eyGQfFbYdhXZQgjyM22PncV9
	FretSP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4v3-00000008CaI-3TcY;
	Wed, 29 Jul 2026 14:06:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4v0-00000008CZb-3Aka
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:06:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c15b1da6b82so102317566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785333956; cv=none;
        d=google.com; s=arc-20260327;
        b=VES0cycjZRBY/Utk6gt96CqYj8aNiBWLXEyNfGjc6u9cULjgp9lw7r4hqrB6+2UwDS
         l2WMHS9UVSADynQV4xqcOhCbhMz63S+9Hez9LgGL2vg5EcJ+MMMJIhzQnVbkS2EHdkaf
         TcXnZHdO3nsQsvMezP4gNPdOvvbXuo4KE1K/H9NXBg+cwgHVmFM6O5JepeHuzqkEIIr/
         bagyUucubRBBnDzkARS/spa8R6hvqCp8jjGB8gdzqTW7FA9xayBqG48nGkqc67XgZj/H
         ABaJsQ3CibrvDMT6WLP7iQWJtFXWIGWvQBhmEUAbxIHDlj8i30CjVT9SZKbmh9FUhunW
         fL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a/yZ2ryno5QQqoWFq7rssKxvGgdH+IdvJ1MYCeu+/uo=;
        fh=fR8w+9yATj5edmfc0HeLwc6Y8+3NSnWVXwG1reXcp38=;
        b=BIvzUIwSKWDqLtrwJk0yKE5Ntr+6cdIk2QcDf/D9cCAVsVUe2YgaPIwQY7hdto5VGe
         rZQCCKUpKskfxvMHAPGl0JR6CfHd16OWpLnefhEW3Pz7HLacWDZqS0/e1KlDNRrxSpMN
         cVLpj8K/bUzOosQSw0szuUvCkd/icq6/BFsx2HwJ0UB3xC1XyJxsTWlafHfELDILByh6
         U6CH6tRKX0VuvQCg8AhuSqt6kmZ0p3EWtOamqNJwCf7E/CCxmoqRjx4VXy5Qi/5o7bsn
         ZjSDMfshGrlhLRrc8JO017lKTqv9PCPTUF7kj35OPTUfprSCw/53vNg8XT9WHOqsPuTh
         ULeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785333956; x=1785938756; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a/yZ2ryno5QQqoWFq7rssKxvGgdH+IdvJ1MYCeu+/uo=;
        b=AUeoNlM125e2SeZFgo8XEjutpI8RY4poi6vRaTt4C9ucDP/oJxmBCs/iycrABiwz2O
         5GWUNGnJrJuaY9wIifgIXK4o6s2Myxv7kBJ8/V/VBbk9YZRYaibgiBvq5xavuzIHg+u2
         uOWI8cjeMj3tie3yw7eJFOh0iH7eVqC+traplsxZA0Fqbpny5a7PeF86nRnxWZBfRDFH
         dr/uBqplf3N9Lla2m9/IzJTJUyP7DoJXP1SUPl/i0Py2tzBCYxngEN4MSWqXUxF/9dxt
         1reGYk2dkuqAJ6zUETvFfrMrVhBg/G2G5Dm5lHJLfEZRAgA+3Dy3r9D+ySZZrPGeRLCj
         VFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785333956; x=1785938756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/yZ2ryno5QQqoWFq7rssKxvGgdH+IdvJ1MYCeu+/uo=;
        b=BV0+tLDXY39DbbJRl///PWp3k7+UqHfUY6Yl933XJsrmUGlkksrm/+czGOKXmkhaFW
         HNaEfonMfhAJTDkPGsUpZbvNmH6gq3UPdHXx/Ojk5sxGm1J81zM12mO8yi/CjTgcXWnN
         dffaCeMxNFbEw9/YmVnr2/1aFB3iw8cZ+uVxyMAqJoPma95Qzc12I8p393eXO92LcxYg
         cg3Ev3hGOSLo6ZGODAblWVpTVsAS+dvWOAY2YFTTd9TTIg1F8l1R5q8sHHYWptO0th9s
         mlU+qufK91MhQ0YaYagnve5gzE3LGakibxTqpCyZinr30Y2hX2em2sdAK1zAnBtPqgUz
         zM8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqG0RXfC0rIE2lZwPnH5YoLIEyol5aLHc71wnQc4LULVROYWrDrIAC3ubcN4w33R1yoY99B3Vygo8cDYLNc+g6q@lists.infradead.org
X-Gm-Message-State: AOJu0Ywok+w7qeDsONcWfY1yk0fxWR3cj57/T6Vir5b1r1ibMeQwOsa4
	Bqj1MyReX0opNuv6k3VQytNz6HYtt8ngjjKGbbdxrAaPp5u2ODcKPsj3hTxosm0FGbOX1VyxrRH
	Kad0zftuVwrsCnqDQ74hV4J1erkA+XeU=
X-Gm-Gg: AR+sD13lfEN+DuDBvNr1syL3YCL2itf1Mx3F+QGutjmJwHDpJznxmPXxcm1rU+4zr50
	ok7NeADG3Zn8xSBfFgF2sCdsuygcU3pZQrJ6icVdbrqQ9GOROT/ASMB1bdM7HSRdR8HbF4V6cz3
	blAIPb+eS3k4F4sJTj3FVWx7cF4qMbcdd3e174OH8ImLMXMYDKqjQaM43AudQd4tqC/S6egfTEa
	2mVQD3ZC1rjWKwk3N7lvfHqhF14eArjW4J0Q0tPazCMXU48Xd3yqetk65dIt3RMqvgcotTh8lGw
	1bYR9gmKolNXE0cZB61KWqpqVqpBJFWDz1EM/nraQaq628rDu2xyCyHvc8P8yihazZqijmyUIsu
	qG25HuR+m917Jix2mT8JjgK1z3sAblGTxDfbDGEJU6ZkfZl0bTQK126QHfH+TsGA=
X-Received: by 2002:a17:907:d22:b0:c19:5a94:411e with SMTP id
 a640c23a62f3a-c1f721a2a2fmr377952666b.15.1785333955992; Wed, 29 Jul 2026
 07:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
 <7ee50408-aa33-4d16-b8ff-f5e2dc59104b@ti.com> <02b159ad-42d3-4d1b-a73e-13612d9f2845@baylibre.com>
In-Reply-To: <02b159ad-42d3-4d1b-a73e-13612d9f2845@baylibre.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 29 Jul 2026 09:05:23 -0500
X-Gm-Features: AUfX_mwf3aCSm6GuLX1EzXgq-pTWbpjV5yXZsWLP91DhUY8upOQJyH4jnPqt5GY
Message-ID: <CAOCHtYiBRAfqc2dKve8UQa0QEd4GyBQXoYkhSEtYgXwAdWzy2Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: ti: k3-am67a-beagley-ai: GPIO improvements
To: David Lechner <dlechner@baylibre.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_070558_813261_B8627B2C 
X-CRM114-Status: GOOD (  15.18  )
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

On Wed, Jul 29, 2026 at 8:57=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 7/29/26 4:57 AM, Vignesh Raghavendra wrote:
> > Hi David,
> >
> > On 29/07/26 01:14, David Lechner (TI) wrote:
> >> This is picking up a few downstream changes from [1] to make GPIOs
> >> easier to use that I missed when using the BeagleY-AI with a mainline
> >> kernel.
> >>
> >> [1]: https://openbeagle.org/beagleboard/linux/-/blob/v6.6.58-ti-arm64-=
r35/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-pinmux.dtsi?ref_type=3Dheads
> >>
> > Above had to be reverted due to reasons mentioned here:
> > https://lore.kernel.org/all/20250221091447.595199-2-mwalle@kernel.org/
> Thanks. I was starting to suspect something like that.
>
> Is PATCH 2/2 still acceptable?

Yep, 2/2 is still good..

I really wish we could use the instial state of the pinmux from 1/2
but that broke too much..

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

