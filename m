Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C0BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MT1Qd4GfkNXwqWLqiWPdrTymaf6z71RpZBpS8qzx2Bk=; b=aQoMF7/9x2k0wUoKHCaVGM2egr
	4I4my2ok0rKzreb0IC7rR9Ok/KiLcS2JWgAZkdIU32ysOaMNwJT7IyhU/YHCD11WjlkqjTxsqbnRo
	BJ45sPk/6Dh2XTVLxb2yPGL+DXLfJknkuj+D3/y4Vs++WsZ2Uf2T2YWzRi4Fdeu5eLGIshp1wnPFA
	clWtfVk1L7l6Az3/xtW5EU3IOE5Rsm9vsA/go8M/HJC2yOm69NbG+irPfEaTUHU9a7w9IrZuOJ9pp
	PNXqF1fXdpQ4oB0D9OGxPoeIHSX6sHFaHPcIaY5HjFVHcepIpfaT63hPN/tSPMajcUP2KWUSXn9SL
	rTS/e2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taasD-0000000AIOG-0LqG;
	Wed, 22 Jan 2025 13:34:25 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taaoj-0000000AHba-3l26
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:30:51 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-304d760f118so57326121fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 05:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737552648; x=1738157448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT1Qd4GfkNXwqWLqiWPdrTymaf6z71RpZBpS8qzx2Bk=;
        b=iv45AssgwtebvEKEwBPLFTB6xqqD/LAVRHzsWclaENlfAd3bk5GleuUb7RtnH+I55D
         k5IfpDxHJaeVSHs8nHDdnjDshrv8x8uQh1tc/ZWdAoRHl71e5WexTVld8NJaHIesFEUl
         RbZfyjBwV2XOsjDdopyVxpMAVE4c6IqcS9AP9VfCeQTXLyoYYc5CiqQP1vjbibPVTWQI
         +c8NyNNsGS8T071E4gcD+5ywZrXp7XspFYMC8oQDke6vZk8RLsEolKQucq94NHIPrR7k
         1aO/CWbeCJRSexVcdtZU30g5Sy243zhXdRfgIA+bX5tIaKLycV7KZ8RWOoWI96o+eD1y
         38bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737552648; x=1738157448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MT1Qd4GfkNXwqWLqiWPdrTymaf6z71RpZBpS8qzx2Bk=;
        b=oVj9b1JdE5hcBAC1HnwTzhVtD0W2FzOV7pRXj1ZdKKWAil5MprOsI2nkPPRzCqmIMc
         mk/SEDr1vq9g/6fXea+HpOYdASCjndFdHQfcBTshvKMfb6CqcklQF+2HENvGiBdcpIyp
         inttSDI1hifmSmGnsYJqoy4fuVXZ1wLvcAKVvAuFEmAvDVKLcxIc6k3PnDMtrK768PBy
         I9tFCgQeFKTis7ZSV60UtXTPOZBKoosVCZuz4MazQpxY/qAEbd8HjYs+bRQJMrGzANO0
         d2ak7NH4lBbcGtYL6adMAUTopTNKTQIdKKHwHlqFyD1BSmA0RpxpioJ7oWDYTA/wO+c6
         ivvw==
X-Forwarded-Encrypted: i=1; AJvYcCX2AY4xWp9ICl63DjCPLw9bQ7GwfbTS7xSfi3/behdQ2JsTuu3FFZIrigsyx/LcjqD7DXLN49S20dHKVo8OlXzB@lists.infradead.org
X-Gm-Message-State: AOJu0YxHa52bsf6HKiXDCiYbCGAaFbRs58lJwo6MbD3eq2rcqmYTU0cb
	9NejDayjQd3rBgbessPNoJRkev0r0mKD6c+coTsdO9KPkvaud3+KTf0R0Kz/uwHTrZ16fRcwZIk
	jR3ZfNy08gKMls45frMMT8wB4O3SIlIOBjF4+SQ==
X-Gm-Gg: ASbGncvItYvllhoSXuuwTGvv2Kp7Th+dTWHnQrIOxtAioIPJaR3jV9Wp3Y2rBjSu0eA
	86cNlGhDFPmF5wEK1Bsnj2KbFsMqdfseAH81uTCqr1774C/uTdQ==
X-Google-Smtp-Source: AGHT+IGs/n7Ljor2d3ADarC6NG+9NmWSbVqt5BnALy/+iVRtZ9CeuWAGeuayEWCsA+u7d2kSrA4qXict3/8+PKzO1MM=
X-Received: by 2002:a05:6512:ad5:b0:542:8d45:cb3e with SMTP id
 2adb3069b0e04-5439c241016mr8306080e87.18.1737552647836; Wed, 22 Jan 2025
 05:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-4-szemzo.andras@gmail.com> <20250114141954.2785879a@donnerap.manchester.arm.com>
 <CACRpkda0nx3SQtdjmXdCEbVJSWM10TM=p-6JbDjbiYcOSF5PxQ@mail.gmail.com>
 <20250115152635.1b89e7f4@donnerap.manchester.arm.com> <CACRpkdYVTedEon0X-izvaDTGF6yRhD2s=Z6NEM=zBf4vD-T0Pg@mail.gmail.com>
 <20250117145228.2fc8a64e@donnerap.manchester.arm.com>
In-Reply-To: <20250117145228.2fc8a64e@donnerap.manchester.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Jan 2025 14:30:36 +0100
X-Gm-Features: AbW1kvbmavQU6KJ-WzCpG2eI69ENGFRQZ6H5c_O0ajyC4q6k3ZeKpvUjD-d9bk8
Message-ID: <CACRpkdZ29=mCqLku4Obq+E5j6kS4NZchwCtrTeCt0qUctn6Czg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250122_053049_937650_07DCEBAC 
X-CRM114-Status: GOOD (  15.99  )
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

On Fri, Jan 17, 2025 at 3:52=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:

> That is actually a good argument: At the moment I am happy with my
> proposal (the allwinner,pinmux =3D <number>; property), but that seems li=
ke
> standard #15 then.
> So would biting the bullet and adopting the Apple/STM32 way then be more
> sustainable?

I suppose...

> On the other hand: the allwinner,pinmux solution has the advantage of bei=
ng
> already written and proven working, also it stays very close to the
> existing description/binding - so implementations like U-Boot could just
> keep on using the "function" string.
>
> I am a bit torn here... I don't think I will find the solitude to
> implement this "Apple" approach in the next few weeks.

I think whatever the Allwinner maintainers agree is the best should
be what you go for. It is a lot of hobbyist maintainers in this space
and for them the bar should be lower.

If you have buy-in from the other maintainers, then go for that
solution.

Yours,
Linus Walleij

