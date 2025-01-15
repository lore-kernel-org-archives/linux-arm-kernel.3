Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB41DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjuDDA/yi8Mfj7zbd5ybLmAd4yGE7SYSfzfs6+hwDoA=; b=3KwyHSDOm+3SyQ1w9n2Gst9Dlv
	0T3yWqdaV2HJvmSzjMlScaDq5k73XwCWVjX4KDdVYPBqaV2kslmrr6NHmZrRwECIQiZ0uSERXt7wG
	Z71RPCqJ7//umsGZJIMFL1hvVmaeTve0Ws7dKQ7LtFCEnjU7m9B6yD72nF2GtBQ34KKJdRCwde7KT
	Ld38FPV+8pcnilxtYbh+GogRPGw6ijdHeWGQ4El34GQKOem85nqJe+L8oOdifTcJnUMqyToE7UDKW
	ikDDLU36e7uExtXzUFqx8BDvv0AHUhy+SFuVMIdR5aj1ujzED4l0dcGjeiLtzJ7v6dFtjuPN/3Ko6
	F4wSkDMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0aP-0000000BTZF-3IH6;
	Wed, 15 Jan 2025 10:25:21 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0Z9-0000000BTFt-3d2Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:24:05 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30616d71bb0so35381251fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 02:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736936642; x=1737541442; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjuDDA/yi8Mfj7zbd5ybLmAd4yGE7SYSfzfs6+hwDoA=;
        b=V8CgCn+G6pTkbH8ptNVkZwYA8HXBI5sZ1pHvF/P7NX0hZClhuPnTckcEzjt88RpdGw
         VN4hje/txtX+LwjoEGNZ25ChpD4R4LLog+bDFf9Cm7g+ZBNKI2ci8QFuoLzmKl6XtYdp
         n6UAKsVDiaWrW8O6vPDYd6bBc0mJvOYahyk2ifNr8Lk5ZV8MLWBjBsQOQ+C/6XBZMAhG
         wdq3ckuazLdnN0EK8eGrn7yGUMj94CcKmDYkpgORE4Q2hv2csZELKINjteOwQhQFMCWL
         5i1pnkzvu5jU8QwRVMfbxqmoNI5UwZYHhJ1HfqWhZVGcKhqBdvdzhLt2Ptq9PvBl1pSx
         M7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736936642; x=1737541442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjuDDA/yi8Mfj7zbd5ybLmAd4yGE7SYSfzfs6+hwDoA=;
        b=w5PcCff/tZitpd99jhRms33OowE81xlL3SBkSucFb5WzFegPejIxT/LwggempJ8KfJ
         q9Hs5VN/benta0iQRSq/1QLpYzCkdh2c2Xbjv/HnTIsXhsZnuaeIn8DJC2NLbrls+tWv
         BzaV8Stfuss5rCNY49RuS/1UYhQAVhGmRL922EeLQKz+83FXDySj8at4yVt9BpAgZQ+T
         VKEC7bMSf28NMIn5OZP7ugQd2n0WAsMiOXkl1s5Yf1bmd/WikLMcp4WbBTAFRo90Mrpf
         JBBxomf03GH6/jySx9u3b7NAwYLSblLEqCTPsKzyERnOxByUXVZHAX+8lbwrwoNk3ism
         PNmA==
X-Forwarded-Encrypted: i=1; AJvYcCVQu5lq5KPHspz0h00Uigh/Fx0NDFdJOD0UbRS4LDSxT8np7RuRbhssn90wTw0bH+kpkDIAUvS/MXdN/k0va8MB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy47OUUBDqNnmiyHma3A1Y/A6Od7zJwDOLwyBqrUMkH8tCeb1va
	Kl0SuMXQXS5c0sjpxylZozyZodQ9FPg5Gc3OOBehahzi0tALDkW5gS0KhN7fjWVM60L25xeBDPd
	h/sFvy6KBfRvhxJ/nUv3u2TQvMI9pIAZC9yGXHw==
X-Gm-Gg: ASbGnctpqWS79dZHEmfqT3SZSxJvT5TzA7wtvnsZOHS+0goeNzJKyZKjTEOxSxOajcG
	ZQuC/ms8krdhQr/8LfE4nSM5CjGJW2b1tXFuIFA==
X-Google-Smtp-Source: AGHT+IFa4MDYjg2TaeSyPhVd+uFI72e9/zbKAp/MLgh6iKYqJ4fsconYWJROEaljs/Hlt1y7e8hWcLbxXAs4QRl/Z8o=
X-Received: by 2002:a05:651c:546:b0:300:3a15:8f22 with SMTP id
 38308e7fff4ca-305f45a1d53mr103210261fa.21.1736936641947; Wed, 15 Jan 2025
 02:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-4-szemzo.andras@gmail.com> <20250114141954.2785879a@donnerap.manchester.arm.com>
In-Reply-To: <20250114141954.2785879a@donnerap.manchester.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 11:23:50 +0100
X-Gm-Features: AbW1kvY9UIu_hIL2n2uWJ6IEfQySNpBxaxTILzVXzQ1Bv8Ht8eyLtJ6PcP46pwQ
Message-ID: <CACRpkda0nx3SQtdjmXdCEbVJSWM10TM=p-6JbDjbiYcOSF5PxQ@mail.gmail.com>
Subject: Re: [PATCH 03/12] pinctrl: sunxi: add driver for Allwinner V853.
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andras Szemzo <szemzo.andras@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_022403_907638_230F1C78 
X-CRM114-Status: GOOD (  23.90  )
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

On Tue, Jan 14, 2025 at 3:20=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
> Andras Szemzo <szemzo.andras@gmail.com> wrote:

> > The V853 family has multiple package variants, from BGA to QFN88.
> > The latter has co-packaged DRAM and fewer pins, and less features (pin =
muxes).
> > All family members can be supported by a single driver, as the availabl=
e pins
> > with allowed muxes is the same across the devices.
>
> It depends a bit on the outcome of the discussion on the A523 pinctrl
> driver [1], but I think we should use the same approach here (and for
> every "new" Allwinner SoC coming up, really): put the pinmux value in the
> DT, and get rid of this entire table altogether:
> [1]
>
> The SoC specific pinctrl driver would then be very small ([2]), so this
> pinctrl support patch here would actually become much smaller.
>
> Just feel a bit sorry for you having created this table, in a tedious and
> eye-straining exercise - been there, done that ;-)

It's pretty stressful for the pin control maintainer as well.

From the subsystems point of view, groups matches to functions by
strings is the best. ("fun1") + ("group1", "group2"):

pio: pinctrl@1c20800 {
                        compatible =3D "allwinner,sun8i-r40-pinctrl";
(...)
                        i2c0_pins: i2c0-pins {
                                pins =3D "PB0", "PB1";
                                function =3D "i2c0";
                        };

abstract, strings, nice. The driver handles the particulars.

That is like so because we are designing for users which are
let's say customization engineers. If these engineers jump from
project to project matching function strings to group strings will
be a common way to set up pins, and easy to understand and
grasp, and it makes the DTS very readable.

Then there are the engineers creating the pin control drivers,
and they want everything to be convinient for *them*, and they
think an opaque hex digit in the DTS is perfect at times, thus
pinmux =3D <0xdeadbeef>;

Mediatek and STM32 made a compromise by using pinmux
and adding some macros to define them so it looks more
pleasant:

      i2c0_pins_a: i2c0-default {
                pins-i2c0 {
                        pinmux =3D <MT7623_PIN_75_SDA0_FUNC_SDA0>,
                                 <MT7623_PIN_76_SCL0_FUNC_SCL0>;
                        bias-disable;
                };
        };

At least the bias control is using strings, this is nice.

So I'm mostly fine with that as well, but it can be pretty
heavy on people coming from the outside, asking us questions
like "on MT7689 how do you mux pin nnnn to function yyy"???
Well I don't know? Some MT7689_PIN* macro I guess?

If it was just strings I would know what the
expected behaviour and looks would be at least, then the driver
could be buggy or missing things but that's clearly cut. That's
why I prefer the strings.

Yours,
Linus Walleij

