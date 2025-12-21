Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B5E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 19:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vo6ksOhalhjiSBBXqxns23kvqzKoakfn5G4J5zm8oM8=; b=DXnJgrI2Y1XMpONhRviaa6YJet
	N6MJeTB2yHdKY/FIv0dzP2MYqMuZsI80UuFT1TB4nW4Stp6nKZTynRYszpdZ/yhpJLXwyGpFNQe+Y
	kLdsb/8A0AFU7ZpAQ/1t64E6LX3MMC7ufKvBs81EGUsOYfKQDOpGUyETDLTAhtL9o+yjo08jMnVh4
	1v6sXt3gHr4CeNKqrKY4CrrHT3Dh9BVj13V5e7VuP0vLEZZkSsDYkNiKLfvO/cgfE08nGnsAiLU5g
	Id2H/kXD6NcCeHNmTwB/orrsQ1OqEp7Ifr1WvvgydfNkOoWZg3vFsI0m+bKAwY867vHJALUIbQJnz
	aVhHmQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXOqv-0000000Cfhi-07iZ;
	Sun, 21 Dec 2025 19:12:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXOqs-0000000CfhD-0prp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 19:12:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso28859155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 11:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766344340; x=1766949140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vo6ksOhalhjiSBBXqxns23kvqzKoakfn5G4J5zm8oM8=;
        b=MYFBhytb1K82EHAlLUNWHM8S6cwg0KY2Gbwv4eyr/tE7Is58yD2r5UbKyxPpbWZSQj
         LMLuenvihQzvqXcIxWhm2b+3n3S1nBU1BfIr+0rKurp+ChS+0as5EUiOpyZrfL/7hzgZ
         PQz7O7Nl9fmoSe/mlOu3ZHvFhi8XmaGMtmA8ktl3hTh4brw96StLBg2T1F/qScryy3g3
         BbMRN5do7fYaZc3fmhfAbyWGoq/O5Dz2ACArnbUpgW7Z3z23z9satvC5QCMTPm+0rNCU
         eE8nbrJFtDloONgWLK0Yhftt7uqRmItWt+LptYmjyur56GmU8upWl2vHU43/JwjMg2vt
         JQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766344340; x=1766949140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vo6ksOhalhjiSBBXqxns23kvqzKoakfn5G4J5zm8oM8=;
        b=wNqj/hj/yhkocOdmEs4Yacmrh4jbFXFxcNkCMJy7Y4i/sfef1W0zQS2z3zhVsFz6OQ
         fQzF0PeMwcMl6JkYApFykh6h80aIMHTDKyjKPJkokuO/ZhB9m9wXQjBUZCc6UQKWEOyo
         S8amo2+r2ijhirHogZgT3XtIW5LePLBmdaKU5791LYSS9+IrevZLZmP9a/M30WPUtpoB
         3S/rAqfuiV41mwJpeirQczJbkB9DGssaO7DuuFECoMURouRm7+3NSxy+cJg6H/d0Acn+
         dN3ck0C7jrnHddSQ0Abc5OYM5nMLQOaLESWCiw6gv6qSR3wjWAn1SD3346e27v37OVFj
         RUHA==
X-Forwarded-Encrypted: i=1; AJvYcCUBdk+NXKZypycap4UKze1N3m0sh8jBooV2yHzZqCqN+4EfPmQApdMBVu6vSTKRrMLzf6E7Tb40gEj9pCMijEDE@lists.infradead.org
X-Gm-Message-State: AOJu0YyK0JJFSFE5lpyfMAIxJ3789WJI93xU4UW2nMybULzfxUxOokLV
	u4V1uID4nUkU3XsrMU0Gf1hcDaqJdXrrKOWde3YFqpJLhi1PWz9mt85+
X-Gm-Gg: AY/fxX5y/llVmcUsIN+Iv8TxlLZ03bZzeHnf8LwZfJ/O8e8zunvoaEj+9UcWz9IxWrr
	FM/PMAUHavmc4ToBXTS5zuKbAtLHok9Faf9LMPUyBIfI9AcLx35+ehVdkNFEYUMM2/cbKMK63HH
	K9mi+nHWDR20Nq3HyLbxz4pDKKvEmG94hsPuOHC6iZvWr+Ua0QgbyFr72FntWu0sfC8HxzgXbKI
	uOox+fM5nm0TlpXcBTMOmKisLz6sJm4HexQed60BGydMFW9WaTx+NRdTmWebIoSFKyY1gsT3iK8
	4rUD30zsXnCiNI8RMbtn/H7UY1DfFGf9TW7t+nh33aeLAZ8hmXJSoL61WHEgFoIpR9+K+n4CvgS
	n5396fN0obyz3Zmj9qOOg538/Lgn0qGl8Et1WcasoKvlvUYC+eFo+GeZqgoZj2hUhGThhlvqGJs
	tiuz9YOBrTwuWfgNHBme0JGY86JmEq5xRvND8RWHB4SUQrqcq1NIc8YAINyYriTqfApVmsMZvwk
	f7g0qtUHYqVbXqk
X-Google-Smtp-Source: AGHT+IGanVGOppu4xZNimZa5u6ycQ+U+0KT1IHmbaejU3vQuyODZEc9RAHzK2FkTud+87U5PHJUskQ==
X-Received: by 2002:a05:600c:858e:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-47d1c629902mr68687605e9.4.1766344340080;
        Sun, 21 Dec 2025 11:12:20 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm205928155e9.14.2025.12.21.11.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 11:12:19 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH v2 0/4] Introduce Allwinner H616 PWM controller
Date: Sun, 21 Dec 2025 20:12:18 +0100
Message-ID: <6113404.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20251217082504.80226-1-richard.genoud@bootlin.com>
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_111222_292414_A3E599B6 
X-CRM114-Status: GOOD (  20.77  )
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

Dne sreda, 17. december 2025 ob 09:25:00 Srednjeevropski standardni =C4=8Da=
s je Richard Genoud napisal(a):
> Allwinner H616 PWM controller is quite different from the A10 one.
>=20
> It can drive 6 PWM channels, and like for the A10, each channel has a
> bypass that permits to output a clock, bypassing the PWM logic, when
> enabled.
>=20
> But, the channels are paired 2 by 2, sharing a first set of
> MUX/prescaler/gate.
> Then, for each channel, there's another prescaler (that will be bypassed
> if the bypass is enabled for this channel).
>=20
> It looks like that:
>             _____      ______      ________
> OSC24M --->|     |    |      |    |        |
> APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
>            |_____|    |______|    |________|
>                           ________
>                          |        |
>                       +->| /div_k |---> PWM_clock_x
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_x
>                       |   |______|
> PWM_clock_src_xy -----+   ________
>                       |  |        |
>                       +->| /div_k |---> PWM_clock_y
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_y
>                           |______|
>=20
> Where xy can be 0/1, 2/3, 4/5
>=20
> PWM_clock_x/y serve for the PWM purpose.
> PWM_bypass_clock_x/y serve for the clock-provider purpose.
> The common clock framework has been used to manage those clocks.
>=20
> This PWM driver serves as a clock-provider for PWM_bypass_clocks.
> This is needed for example by the embedded AC300 PHY which clock comes
> from PMW5 pin (PB12).

No. Drop all clocks related code and make this pure PWM driver, like pwm-su=
n4i
is. For AC300, AC200 or whatever other device may need clock produced by PW=
M,
pwm-clock can be used like this:

ac300_pwm_clk: ac300-clk {
	compatible =3D "pwm-clock";
	#clock-cells =3D <0>;
	clock-frequency =3D <24000000>;
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&pwm1_pin>;
	pwms =3D <&pwm 1 42 0>;
};

ac300 {
	...
	clocks =3D <&ac300_pwm_clk>;
	...
};

Best regards,
Jernej

>=20
> This series is based onto v6.19-rc1
>=20
> Changes since v1:
> - rebase onto v6.19-rc1
> - add missing headers
> - remove MODULE_ALIAS (suggested by Krzysztof)
> - use sun4i-pwm binding instead of creating a new one (suggested by Krzys=
ztof)
> - retrieve the parent clocks from the devicetree
> - switch num_parents to unsigned int
>=20
> Richard Genoud (4):
>   dt-bindings: pwm: allwinner: add h616 pwm compatible
>   pwm: sun50i: Add H616 PWM support
>   arm64: dts: allwinner: h616: add PWM controller
>   MAINTAINERS: Add entry on Allwinner H616 PWM driver
>=20
>  .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml |  19 +-
>  MAINTAINERS                                   |   5 +
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  47 +
>  drivers/pwm/Kconfig                           |  12 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun50i-h616.c                 | 892 ++++++++++++++++++
>  6 files changed, 975 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pwm/pwm-sun50i-h616.c
>=20
>=20
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
>=20





