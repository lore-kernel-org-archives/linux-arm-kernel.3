Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8B6C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1ILQYWLTxemqDdJBTmUiuNZzTXAykwPUMAreV9P7yQ=; b=0IWR8qIk/AgY6AHPI3zxCSE/fp
	M+kuJWM3BXA+YOP8i5di0p5iFqvYposj5NCzIM4v4JpKx7HHpEDhl0eIKl5CkGnxfog1P5uUpj/8L
	6l5+isDGEJxePcexpi5R7DmkFnp+cKrmcZbXu+UJW+NFzUKfbI2+SWz80dmtARy7HxWSVbUdO45mN
	iJEqQh5Tgl/FZcZ7nhThwkHY60ljmheQuZGqcTIHlu5IEiFFVarcFAcORsDlmsYHDfBO/0FQw30gO
	g86jMKyoWS6vrwqVlAJhdjN6QVv1GHYH+MBvygm7uju4dkPOSzT3XMxHEsUJSSxvYRsWXDW9bpxct
	hPNQQgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e7Y-0000000BLk7-2aQu;
	Wed, 23 Apr 2025 17:42:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7btJ-0000000Awk2-2q9F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9CB144852
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 15:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499F4C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 15:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421601;
	bh=tPOHjT1NkHow4VD7/8Appu7QUK/ZbjYVgaBPZCT9gmc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JHzR0ks9mywL/Gjel+WVjGNaUfXggO7iK4HEKa99gt2Id+opEtlpyAb8UWdlIbd6p
	 U2Tj8WVai1ielF1aDhyeSWaQTWsM3rDfzJguAsYZPeLwkaTv9t6RDw2IEHtfOc7od1
	 k5WdJjh5bAw6PrOqF9uQdGwZ0j0VLleW1tYLSRKvzGD/c1EL5c9cyuMfXflKyibaVU
	 bvGMikvu5P5gagV9/JpBvAWdIRz4+TCJChp7gJiEpAs8GBySeD54viEHq2SwBqq+9Z
	 0+iZ6r9t0+CFj1T2UVjw5jTghN4cyVgjVZfBhmelLA6RHbPMnhMyxoa0UXWSvrdURa
	 uvIaPSzaOF6Kw==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so8840450a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 08:20:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUC2nYF/BRkrtdq0eyeEbmzjOnBkt5ZE0UFA7xJoxbIaXAA218IP4MFGiw6SIi1+HMXfjCEg/m07tZsl3KnEDsv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0SF4allK2hvk7aK7kw6pkzlGLBN+o+EUppLt4lLnbDwFwxg1T
	w/Cqctt2LEFMKHEoiODBLr6+HRgdb709iIH+4Qxu2IC/a5WGcGc2m4FqDqjdpPi78e/UB5oCQxT
	Nt6wv2OSvrVLX2prRVxVszyzsMw==
X-Google-Smtp-Source: AGHT+IEV1CEtPoGDqGEwEZJrzR2YkV4IU/BYo041fFmlJGhMA6AFx/r6j4OVu1OhC2Y/tApvvElXwS4Rby6hFC65/iU=
X-Received: by 2002:a05:6402:4408:b0:5f3:4197:9538 with SMTP id
 4fb4d7f45d1cf-5f628525695mr18336301a12.13.1745421599923; Wed, 23 Apr 2025
 08:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com> <20250422133619.GA1095169-robh@kernel.org>
 <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com> <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com>
In-Reply-To: <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Apr 2025 10:19:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKwASbUtpO=wU-16v=y8S_wLyBxnFUmQqsE8GkzCz0hDg@mail.gmail.com>
X-Gm-Features: ATxdqUFuWyHPWdbMp12KUQQV-d0rnw0lx2tasAZItdh99IKgPe_s_qddlmQl6uk
Message-ID: <CAL_JsqKwASbUtpO=wU-16v=y8S_wLyBxnFUmQqsE8GkzCz0hDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Nick Chan <towinchenmi@gmail.com>
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@svenpeter.dev>, 
	Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_082001_761919_2C8F1E2A 
X-CRM114-Status: GOOD (  32.77  )
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

On Tue, Apr 22, 2025 at 11:59=E2=80=AFPM Nick Chan <towinchenmi@gmail.com> =
wrote:
>
>
> Sasha Finkelstein =E6=96=BC 2025/4/22 =E5=A4=9C=E6=99=9A9:44 =E5=AF=AB=E9=
=81=93:
> > On Tue, 22 Apr 2025 at 15:36, Rob Herring <robh@kernel.org> wrote:
> >>> +title: Generic SPMI NVMEM
> >> What makes this generic?
> >>
> >> A generic driver is great, but "generic" or "simple" bindings are
> >> generally a mistake.
> > There is nothing apple-specific in that driver, just re-exporting
> > several registers as cells. If you think that it is a mistake, I can
> > rename it to apple-pmic, or something similar.

Like I said, a generic *driver* is great! I'm all for them. We should
have more of them! Generic bindings on the other hand are generally a
mistake. The problem is whether a generic driver works for you or not
can evolve in either direction. You add more things like described
below and then a generic driver doesn't work.

> >>> +      - const: spmi-nvmem
> >> What happens when there's some other feature of the PMIC exposed that'=
s
> >> not nvmem?
> > If you have a PMIC that needs more features exposed, then you'd have to
> > use a different driver. Or am i not understanding the question correctl=
y?
> I think the problem is what happens if more functionalities needed to be =
exposed from the M1 SoC's
> PMIC. (right now I do not believe anything else is needed from it)

Yes, and you can add to the binding then, but you are stuck with what
you define now.

> It would be multiple drivers. A simple-mfd-spmi driver (like drivers/mfd/=
simple-mfd-i2c.c
> but SPMI) that exports a regmap and a generic driver that reexports regma=
p (any regmap,
> not necessarily SPMI) as nvmem cells, plus extra drivers that uses the re=
gmap exposed by
> the mfd driver for extra functionalities.
>
> To make this submission more generic and extensible, what would be submit=
ted should be a
> simple-mfd-spmi driver and a generic regmap nvmem driver. For specific ex=
amples, see below:

It is not an MFD currently, so you don't need an MFD driver. As I
said, that can evolve.

Drivers are bus specific, so you can't have a generic regmap driver.
There's only 4 nvmem drivers using regmap anyways. qcom-spmi-sdam is
one of them, and maybe one driver could handle that and Apple.

> The PMICs from dialog semiconductor on older Apple SoCs definitely needs =
such functionalities.
>
> On Apple A11 SoC there is a RTC clock device on the PMIC and the SMC on t=
here does not have
> RTC functionalities. To make the RTC clock work there a driver would read=
 a counter that could
> count a maximum of 194 days from the SPMI PMIC, and then access the PMIC =
nvmem cells that
> held the rest of the time. In this case these drivers are needed:
>
> (1) simple-mfd-spmi (2) rtc driver (3) generic regmap nvmem driver.
>
> On Apple A7-A10X SoC a similar PMIC also exist, but is over I2C instead o=
f SPMI, those devices do not
> have a SMC. To make the rtc clock work there three drivers are needed:
>
> (1) simple-mfd-i2c (already exists) (2) rtc driver (same one as above) (3=
) generic regmap nvmem driver

It all sounds a bit different from what's there on the M series, so
perhaps better not to mix the 2 just because it is all apple. The A
series stuff might have more in common with existing Dialog PMICs.

Rob

