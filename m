Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A6EC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMndNBDrNRSXZklDAozkSv6Z/iRQ8qtJLkHPftqq8ss=; b=0qwEGlf2+7BFc1C2tyms7GNZBg
	VRg+X0unbngsHESZGg82d/JWaBLTV4pRq7Zlfh2EpNueHifekHN+pd7vWhkr25KhQhojD+iXqy6iK
	CF2Iq6d3OhQHkolZCNoVW3AsujbMOr/h6ZrvJAIxoq6r4XrnbDlc+wMer9f4OwL8jyyCOtF4QKUWV
	rD1s9eZU02y2L+K0h2AumyphAixQsB4Bt18SxCM4SenAYqtxOpVoVf+eMWtLwSnl4LUowQhiMWR30
	A/PBsb5OZBFU2aTFt/+IawhqpY8JB7hk62AxqrCldEi6csavvXfW81ihRCfujuwUNtdm2wudtQhpi
	JGVwdgmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoxA-0000000DlEX-0bPj;
	Thu, 23 Jul 2026 08:38:52 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmox6-0000000DlE2-38nf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 08:38:50 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-39ca300db70so2980691fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 01:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784795926; cv=none;
        d=google.com; s=arc-20260327;
        b=AkprxW7JqzBaI5OJbiLn/59MKQlwvmdXOPuTWYWL2yiG7at2nFX71KCOYWRWwzm1gL
         b8t+ZYY+bY/+rluDM3oUc1dK0MR4MGJxkkMQWwOKNS5xq68adBuUSdtMeHzTs/4ZeyT+
         2yDrJso/6BG6HiOFCoKWeDlN2bnpabGJKsLZNrYwWWdap9GUQG5raYoGRorQFna7KE/y
         9F94bSDMvs8I0aO5N85NgnA1E1Kv9YNoVDjkfJFK9n+ABKWdfkYJ06UxoC/cJE9bi2eQ
         0tH+GCPXkKOe/J/056ydXh9p+s4PWPMb4GlKTMa9hLAePCs2Mb1pgOPAyBuwwng+nz4f
         LwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JMndNBDrNRSXZklDAozkSv6Z/iRQ8qtJLkHPftqq8ss=;
        fh=mIeX7KFxhVf9RuT4HHnx8ty2olzEU4SJU0KGdNCzKGQ=;
        b=kwPiZSaDm4fgHlJAVjLyJkA+l77wDk2e/BKjEoyKQDdKlqOc08JAYXjXBrYvJ+tpTw
         LW2qCL8hT0VhpkC0qDH5woDoLZc/ivn+Y5tfTZyrcIA2yYhhJHwLzsrKAh52/hAyfDWp
         6G/nl7t/aNpf1IvGszSu2tJF+HLkGxQj0TwTtYrBzIpmIXQNoIrbDWRgqx+xFQaJ7wom
         MNBI3kFfR7BFTZy3U4kys83juS5xC+IOFZY2LjLYQH7zrErd/UVQ3alw7tSX+wdQ3h6S
         iZaEEh99SZMpI3K8kMOy4X29cvYK86HgidZz62UUZ6C9hHQwcqklwGAnEWroNV6s4ngp
         p3qQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784795926; x=1785400726; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMndNBDrNRSXZklDAozkSv6Z/iRQ8qtJLkHPftqq8ss=;
        b=Y1uMtOlCEP7QM+DYPlvEbyfrPVSu6sfc0xYHxDg2hTlMo9/9yvpfYXefVGoR2zoHBH
         3JHv/f5z0Y08XqQ0eMQVBhMumJ0AeQBe7xovK6AU6SxHHUXyDDR93NGY9hIuz5A6ZXGz
         F2SbUpxaYd8YuoZqeZw2yfKMwjRVvmgQGS2x4lL6uCwEg5vv2zdJc79KLhS0psLIt9gH
         +a+hRk5WF2Pc1iwF1MkZHoyiYqXcIVZYOjd8Uqr2bDOLN4Z/oguNI7IzLw3+P72Xn4FB
         KsZr1Zk0kmEq+DB8B9HDMDqpQi5brLPHZq1TZ9qUpdizfFO9wzB8/1LuxFKJ4cZxNgH0
         p2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784795926; x=1785400726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMndNBDrNRSXZklDAozkSv6Z/iRQ8qtJLkHPftqq8ss=;
        b=ppTcYcsOP0KMpDZtGL3rw7/SuBXUPe8mr4VBf6j5jSpE5WzwfFl1ST5kGeR+FQ7PWG
         G47LNmReCk1hc4D14a2qOM9XxHvbUyzVYSvsEVENzSvEiUCUvYeUVJWql561XhgN4rA+
         hHYK0aelvfNPONtREUWwVemfEfrm636tZTuWLETPBXUUsdoBTwbRX22cTtz10ES6G51z
         fOsHEuQ5YA0USFTP51oo4X8oQirVtLd4oTVZoJLKErPZ6dtdmpHJ0YR1rxU+GDtrHjjl
         qG0xrjYxcLZQsFb54Qp40hmokWLdZFa4E+LGAgFgbnt8AsswfeqR16jmy1pn5I6ZHRDV
         KA3A==
X-Forwarded-Encrypted: i=1; AHgh+RpHKHeu1UdinlsJXqR5wMaSIXuCPVjNOAhmMYelEBvRUuR6gKUezKzxMCQYOJRmkj9SQ4638h0CH/rOGKXwXBBC@lists.infradead.org
X-Gm-Message-State: AOJu0YxLUrP3Radp/qgGNxJN1VjjQn3jUrmDjxIluK1dMNSVZPqwNaFT
	z7EUWE0dcUoUMjgwVjy/dcERPX8IKoegPmgkbvJvhfkK/jqwwJaISjCXfTIBvjBnJNROuX9S0Vl
	6XQUGGlIsIE4U3c4z37zfbW0cCZt+Ug8=
X-Gm-Gg: AR+sD12ikoWRhcp6tELMIu5WLtpUalBZvdB3ZF7kXYngEGXQCiIISf724h6v6z/hUI8
	M0CY2NOAbiLsizAMnEN25YRZjT5EvTbFZYOA0Es98lQ8SD2rB4SuIx0L+MKO++c7QjqZ5jXooRZ
	rDIvQ0ncejqjbGRgmoGcKhkRV92vTrYjfGgeeWIx9VJEpxl7PpJ/WamPR3YrPOHCaLKgHkOHEVl
	eWrRrN9CKOCTtgBJuw/aVGiF6XD1GE/wtElvPco5eQ0MrcegP8xbev2ocM0OOc=
X-Received: by 2002:a05:6512:3f4:b0:5b0:7766:54d1 with SMTP id
 2adb3069b0e04-5b2b2f54040mr266927e87.27.1784795925744; Thu, 23 Jul 2026
 01:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
 <20260615-ventura2_initial_dts-v8-2-c89f92c80447@gmail.com> <de6f82c5601a4481e418270171e803340368bd2a.camel@codeconstruct.com.au>
In-Reply-To: <de6f82c5601a4481e418270171e803340368bd2a.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 23 Jul 2026 16:40:32 +0800
X-Gm-Features: AUfX_mzgVslcyDePfLi1-LkdPZo905qgCpAOduekKppC45gZMvMEvUh9-ZO5AuY
Message-ID: <CAF7HswMG1HWxELQxTSaEWVeWi2Mjk8HpuM18AAVLCV5j_r467Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_013848_824609_653644A2 
X-CRM114-Status: GOOD (  23.62  )
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

Hi Andrew,

Thanks for taking the time to review this.
On Wed, Jul 22, 2026 at 7:46=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2026-06-15 at 10:46 +0800, Kyle Hsieh wrote:
> > Ventura2 is a Rack Management Controller. It is a modular
> > device designed to manage liquid cooling systems and monitor hardware
> > states within an IT rack. The system uses an AST2600 BMC for management=
.
> >
> > RMCv2 serves several critical roles:
> > - Detects liquid leakage at both tray and rack levels.
> > - Communicates with and controls liquid cooling equipment.
> > - Manages leakage events and executes system recovery protocols.
> >
> > Key hardware features include:
> > - An extensive I2C and IO expander topology to support comprehensive
> >   sensor monitoring and backward compatibility with legacy trays.
> > - MCTP over I2C support for asynchronous device communications.
> > - A dual-flash design for BMC firmware redundancy.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
> >  .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2903 ++++++++++++=
++++++++
> >  2 files changed, 2904 insertions(+)
>
> We now have scripts/dtc/dt-check-style. Running it over the dts with '-
> -mode relaxed' yields 49 instances of 'mixed-indent-chars' - these must
> be fixed. Further, can you please look at the output with '--mode
> strict', address all the warnings that are reasonable, and then discuss
> what's left?
I have fixed all 49 instances of the 'mixed-indent-chars' formatting issues=
.
I also ran it with '--mode strict' and addressed the formatting
warnings accordingly.
>
> Otherwise, there are still some concerns reported against the bindings:
>
>    $ make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-ventura2.dtb W=3D1
>    ...
>      DTC [C] arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb
>    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/lp=
c@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast=
2600-lhc']
>    /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/=
boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: fan-controller@20 (maxim,=
max31790): 'channel@2', 'channel@5' do not match any of the regexes: '^fan@=
[0-9]+$', '^pinctrl-[0-9]+$'
>            from schema $id: http://devicetree.org/schemas/hwmon/maxim,max=
31790.yaml
>    /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/=
boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: i2c@400 (aspeed,ast2600-i=
2c-bus): Unevaluated properties are not allowed ('aspeed,hw-timeout-ms' was=
 unexpected)
>            from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.=
yaml
>    /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/=
boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@48 (ti,ads1015): '#ad=
dress-cells' is a required property
>            from schema $id: http://devicetree.org/schemas/iio/adc/ti,ads1=
015.yaml
>    /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/=
boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@48 (ti,ads1015): '#si=
ze-cells' is a required property
>            from schema $id: http://devicetree.org/schemas/iio/adc/ti,ads1=
015.yaml
>    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bu=
s@1e78a000/i2c@580/power-monitor@69: failed to match any schema with compat=
ible: ['pmbus']
>    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bu=
s@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,a=
st2600-i3c-global', 'syscon']
>
> Can you please tidy these up?
The board-specific bindings have been fixed:
- Removed the invalid `channel@X` subnodes from the `maxim,max31790`
fan controller.
- Dropped the deprecated `aspeed,hw-timeout-ms` property from the I2C bus.
- Removed the incomplete `ti,ads1015` ADC and generic `pmbus` power
monitor nodes to fully comply with upstream schemas.

However, the warnings for `aspeed,ast2600-lhc` and
`aspeed,ast2600-i3c-global` still remain.
Since these nodes are inherited directly from the SoC level
(`aspeed-g6.dtsi`), it seems their YAML bindings are not yet merged
upstream.

>
> Thanks,
>
> Andrew

Thanks,
Kyle

