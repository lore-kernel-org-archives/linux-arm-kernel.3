Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66035CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/fOCYr89rjpFF0YHfilwdeTnNExJ5rFE4DuxmsIniE=; b=ugyJ1pMyTh6OOdfwGoZTFGG/fQ
	UCiio9vujzQOjZrtWP+rYFMs4iIUMzwOjq3OVVlsjk8x/SKQyfRJ2QgGx1RGhvkHW/VjNQQuWZtoJ
	BF9X5Tx/SSDgLve8tJpl0IaWtHb4h8/pesCBL1CH5Bl+1BznI1CSuTYY16uU0BSbxtxlM97GoswqB
	0yHP/1G97MVuJrYD1FEa+Wp5BO2bsPGMF+yiYhEVuIuNv4QGjj/ixoxiGzQQNd/zHoxnFagh9X2i9
	08pUGzjM4ujuGUpgRIttE93C4R0H9FvV2Bf/uCTAxaDosdwrlxu811dRfuiSdDy3KUA2v/fpR8juo
	IF4gzReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBY5-0000000EhDp-0zJn;
	Mon, 15 Jun 2026 17:56:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBY1-0000000EhD9-3jBc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:56:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45eee266c6cso3264887f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781546192; x=1782150992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/fOCYr89rjpFF0YHfilwdeTnNExJ5rFE4DuxmsIniE=;
        b=P+MrdOy8GbqPO+OWuvqDHyQEmoNQkQaNPNDg+BYDgPUNsNZOZHsuKN8LhrUxiNo4OA
         RJPto3/jigUBDipagRibEimnoJS7CSi9IED/SeoxMkAmaSyQFjSb85BP1+TkRupoI++u
         5L54H2v9LOx1G4sdHVX7CKQ6VxpzlPhktRQZtG4M8dBEJhrnED6fdBKDyCSpt3xWzWtL
         TP+HLeL+PoyKFG+IokXNic8BrSpDgLJQjsXH8s9XoDljml8290NjzXHihbpp3yMXAune
         C2JWt0W3nzJZvgn6ef1pI4rEdBFXALb5W40QM/h5sHvsZjq94uKOmE+heKaKdXWnsZqy
         SIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546192; x=1782150992;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/fOCYr89rjpFF0YHfilwdeTnNExJ5rFE4DuxmsIniE=;
        b=QVH8t+/OvzzMXJHII/H2m3emIFrKXBOEWuVJjnFu2rGSePco4LjX6nb6dUuoL28dAH
         xexVPbn9BKH4pvQ1II/Cyx0tiIETwotMN7HUaNiENYnGx6ugc6F6oGlik8Rgb7kONihs
         /4eIAdMIZ7L8LmprSpG1cxs5jhK6Wp6V5GrDpYpvk1JxtM7QwhBwKruszd2TWCiYTbqd
         i7V/+DKQwz4AJNq5QtQdxgK7MFpNtmz5HXYMGzSIvP5GCsvDxBgL/ZzFeZj2L4HhV0cn
         Q8TyY+pR0v9IHEqyutJeID9hz73c0plrbCguI2OXcV4Ba146ePBa9BAFAIVzaJoAKxkz
         jBpw==
X-Forwarded-Encrypted: i=1; AFNElJ8zXCKJfiVLbriWirzkjbXJoyPqGeoWvfQhe0XtZK+ewWjw22emXOyR42PjBSQUN6XFT9imqyRJ6o1XFjsdtAo4@lists.infradead.org
X-Gm-Message-State: AOJu0YxtkTxnLYv65SklICtLlFJ17TrgOayXHcT3H8fW1o38eZ+Buld1
	zHzMjV0lpRiuRAiSbRtXcUr/0Zvlz58vq4ZP9Sq9/5vOIE57bNq1cA00wO9TmwARB/E=
X-Gm-Gg: Acq92OGnG0/qqA3nAT4OHpyiwHRrG4NF2g481EaiYovPxOotrm6EROiwfWU1TuCWoFN
	i3XKe+/MaIkojdvvqyEtqp9GOZCjgilF9BX1//DEI8hjdFJMsqT/xBnutWkhkHt1vC8HZ+TjDwC
	MetiWt/MEkfWQbVItDqddQPiGbSa+K3aiWm0As54JUQA94pDoxkCkwxQZM6+Nq1SqbMTI1dlckt
	u8gm644Or+U9Pb+ds4y1v51gODVaWcMVzNk/vTOjNHPpNyzlD+8fZCwKXtX/YBXbM4NSPjkGV/i
	AHX8UnCOCzkynsor3HC73kLCFX4EVVajmqYrY4cVb3T52tfB/CXcA7mECx96UmZ2KFGdjhaeQd6
	rwWx/fCBYJoKxjq19OHJtFFbH39lSvuNKXcKc6AVgxuReBRJCjX/RUbLNk6amKyNBFPSLOgrikU
	X1IICn20iPmSp/xLN+KSe2pA==
X-Received: by 2002:a05:6000:288f:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-46077f2a62dmr16205392f8f.26.1781546192039;
        Mon, 15 Jun 2026 10:56:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5176:ebe3:853b:8fb0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4606f2e6a8fsm36837329f8f.37.2026.06.15.10.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:56:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-rtc@vger.kernel.org,  devicetree@vger.kernel.org,  =?utf-8?Q?Andr?=
 =?utf-8?Q?=C3=A9?= Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH 7/7] clk: sunxi-ng: Add Allwinner A733 RTC CCU support
In-Reply-To: <CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 28 Mar 2026 22:41:20 +0800")
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
	<20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech>
	<CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Jun 2026 19:56:29 +0200
Message-ID: <1jv7bjd6wi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_105633_952262_37E07610 
X-CRM114-Status: GOOD (  29.33  )
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

On sam. 28 mars 2026 at 22:41, Chen-Yu Tsai <wens@kernel.org> wrote:

> On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> Add support for the internal CCU found in the RTC module of the Allwinner
>> A733 SoC. While the basic 16MHz (IOSC) and 32kHz logic remains compatible
>> with older SoCs like the sun6i, the A733 introduces several new features.
>>
>> The A733 RTC CCU supports choosing one of three external crystal
>> frequencies: 19.2MHz, 24MHz, and 26MHz. It features hardware detection
>> logic to automatically identify the frequency used on the board and
>> exports this DCXO signal as the "hosc" clock.
>>
>> Furthermore, the driver implements logic to derive a 32kHz reference
>> from the HOSC. This is achieved through a muxed clock path using fixed
>> pre-dividers to normalize the different crystal frequencies to ~32kHz.
>
> Have you tested whether the actually normalizes the frequency, i.e.
> selects a different divider based on the DCXO frequency? Otherwise
> we're just lying about the frequency.
>
>> This path reuses the same hardware mux registers as the HOSC clock.
>>
>> Additionally, this CCU provides several gate clocks for specific
>> peripherals, including SerDes, HDMI, and UFS. The driver is implemented
>> as an auxiliary driver to be bound to the sun6i-rtc driver.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---

[...]

>> +};
>> +
>> +static const struct clk_parent_data hosc_parents[] =3D {
>> +       { .fw_name =3D "osc24M" },
>> +       { .fw_name =3D "osc19M" },
>> +       { .fw_name =3D "osc26M" },
>> +       { .fw_name =3D "osc24M" },
>> +};
>
> As mentioned in my reply to the binding, this is wrong. There is only
> one input.
>
> The most you can do is check the rate of the parent clock against the
> detected one, and _scream_ that the DT is wrong. And maybe override
> the reported frequency.
>
> If you want to do the latter, you could add a new fixed rate gated
> clock type to our library. You would fill in the rate before the
> clocks get registered. I probably wouldn't go that far. We want people
> to have correct hardware descriptions.
>
> Funnily enough Allwinner's BSP actually implements a fixed rate gate
> for the next 24M-to-32k divider clock.

What about implementing the register bellow as a read-only (and
non-cached) divider using the factors provided by Junhui ? That would be
an accurate description of the HW I think.

The oscillator gets set in DT and if the output reported past the
divider is not 32728Hz, you know you've got a problem (bad DT or HW gone
bad)

With a fixed-rate gate, you may actually end up lying about what
actually happen, if the HW does not behave as expected.

Do you prefer a fixed-rate gate still or should I try the RO divider
approach ?

>
>> +
>> +struct ccu_mux hosc_clk =3D {
>> +       .enable =3D DCXO_CTRL_DCXO_EN,
>> +       .mux    =3D _SUNXI_CCU_MUX(14, 2),
>> +       .common =3D {
>> +               .reg            =3D DCXO_CTRL_REG,
>> +               .hw.init        =3D CLK_HW_INIT_PARENTS_DATA("hosc",
>> +                                                          hosc_parents,
>> +                                                          &ccu_mux_ro_o=
ps,
>> +                                                          0),
>> +       },
>> +};
>
> So this is wrong.
>
>> +
>> +static const struct ccu_mux_fixed_prediv hosc_32k_predivs[] =3D {
>> +       { .index =3D 0, .div =3D 732 },
>
> Why is it 732 instead of 750?
>
>> +       { .index =3D 1, .div =3D 586 },
>> +       { .index =3D 2, .div =3D 793 },
>> +       { .index =3D 3, .div =3D 732 },
>> +};
>> +
>> +static struct ccu_mux hosc_32k_mux_clk =3D {
>> +       .enable         =3D DCXO_CTRL_DCXO_EN,
>

