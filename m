Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C90CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d75/m8OyEpl0fwQUB+HUMKmdvA/o/D0pvjuoB/XRU0Q=; b=bvpt4XetHsRiRNC0sVS6Lxn5yV
	vMdc9UdJJOHrwA/A4ZQDzuyqfp9A3wTou8notW9Uws/AZ9ZnLatg7W2DUXpUxrsI2iyJbfqOZ1jrO
	IwNpNHyItzEeBP5prMKVnDeliv9D+ECjGlr2CFS/FDzb8CI0xgIrXcU33RFoSC5VmtJ6CQm7sCHNn
	kBoAFH+gZlQI1PaOjFooSe6b12BZQdVUxnU+xbBvscCCVqo6lq0Nxv6hPFHFtpKzu3+n/fGBiLpRF
	eBoJhr4Mz4FWTgix5AX9p0OzX7o3K2CBooEVm5jVoh0KB3sacgUp5k3IABxwOPHOjO7uvvtSfYqF+
	Mt4lJ9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPyp-00000000CGK-3DHD;
	Fri, 07 Nov 2025 17:10:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPyl-00000000CE4-2GXt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 17:10:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so8497575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 09:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762535425; x=1763140225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d75/m8OyEpl0fwQUB+HUMKmdvA/o/D0pvjuoB/XRU0Q=;
        b=1lvGAYSixOV64cmZt9H6QgTmHobVoqVsu+5UrAw66H57BY67HYzUdoo/sEYMwqruVU
         701QQOwhQOZKOBKrQ771xsJCJAWbZcl6a1/SyWd48G7YTDsmywGCznygFivHEBHMlBHP
         GVYaMVCd/tM35V8af2TcaMeUVu6mz4iXDf5Tt+Lxzyg+1NMLQmK5V6dJfFayKDb0ASUs
         IP4+0z9zmNo5waMR9o6nZPYw9r6WIA8NkBKaxdCLhXouhT+UOT9iVaAeYJtjWFB6SW2O
         Fz2S6Rt+sjKFYGZJIxEfjuRAjOoS8LZutoLOAmLFKb76Ia/rMpZ/qXOi8IR6yXIqYfE0
         EV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762535425; x=1763140225;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d75/m8OyEpl0fwQUB+HUMKmdvA/o/D0pvjuoB/XRU0Q=;
        b=dCyFMaGG+GiiBXkI3WETK6Ij6GMfc1k/J0bs06cSn/wqrkhp68K4W7cZuvhHcNIjB5
         M9M7XRy/ZHjaQVsMFkyqbEmI1qcLyGBG2fBohh7pq8Ua5ofPcCIYSk96ru9XDL0kUjKq
         Tc6yOv1ETBPm7rqsDF4JOTibLkMKRg2asPT5gRo0lErdPDtdoc5jbP2YqtCtEG54L9kg
         jMlfutOdMhRRN4oZ2FAn87r6/ZabVQT6nJVBdAcOvUw5YBC5P3oE2cG0aRaP+9yF+kdJ
         kvUwNzb3hqBhdYdM0mm8AmlA/3nOWM2tN0yDjNzY9c6T9GIYV10yRiUWCvSWGVefu4ET
         kL+A==
X-Forwarded-Encrypted: i=1; AJvYcCXO++fx9w/DYF/30SqGAhybPlFAMes+JQ4mWBnEVcP//Iv5/odF+jCiaAh3n2g1lSdoPC9SI1aH3r3HO8f9Et0B@lists.infradead.org
X-Gm-Message-State: AOJu0YwZeKVOXZDFZDs7FOEIU27XELVqFg8Z854zmzYBkT/6kQoWGf5E
	qc/bYD5FXld1jAVX8cjLPCshEH65oQ+mVq7tL0VDPheeeAAzuIJwocWYfbE4F5rtZRE=
X-Gm-Gg: ASbGncv9HKry1cGDOnAutvFs2ierSyA2HTWCaKKYCBwCkxLbuy9PxFVwqhg4gU8OFbo
	f0dKymms/JJjRRb7xee5yf1v7xFwxEtKFMx3ld7YY1s+9TgjdJYis5WuDst/mao8yMxOtttyb+6
	0ajmissDd4l3qTGkG6ONX9VEUmOgeRsCJMrY7YLQvQn6k5mUHA5CVwgZojxm3OlH65241ik7uGO
	pf+d1q6LYHGLJnyCvGpdsFJZLXgSjqbiHFkD4bunAUnz6pWlhPtdf3lGTEa4WcWDRibro0l96zB
	z14O/qjDG6PhMzcpU9g3CH0+RlP9bAdd9BneMPGvw18fydLlNA0aJpz4NqI7TuMAeBp3svh5BA5
	fT5W5vheIurrq0YOsDZP7B0rLLOxrj3N5kvv3bYYLQfoasPvFFnrk0IvxJqqUECWve7NpT1K+ed
	FUsua8q54h
X-Google-Smtp-Source: AGHT+IHs0fGLj1pX9D20cd+qxJYOXVpz1DkRCoiP+yxFDAzBqmLvwRgTWCnCmwGVOrewtrpdAZ4qhA==
X-Received: by 2002:a05:600c:4ed4:b0:471:786:94d3 with SMTP id 5b1f17b1804b1-4776bcd52bamr34376015e9.22.1762535424637;
        Fri, 07 Nov 2025 09:10:24 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d88d:7650:f1de:19c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4776bcfd021sm78745585e9.11.2025.11.07.09.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 09:10:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 5/5] clk: meson: t7: add t7 clock peripherals
 controller driver
In-Reply-To: <236a568d-c809-4dc7-be2f-e813d0d85368@amlogic.com> (Jian Hu's
	message of "Sat, 8 Nov 2025 00:20:33 +0800")
References: <20251030094345.2571222-1-jian.hu@amlogic.com>
	<20251030094345.2571222-6-jian.hu@amlogic.com>
	<1jbjlnxuug.fsf@starbuckisacylon.baylibre.com>
	<3b9a5978-aa02-486b-85f5-6443dc607dd5@amlogic.com>
	<1j1pmew1cu.fsf@starbuckisacylon.baylibre.com>
	<236a568d-c809-4dc7-be2f-e813d0d85368@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 07 Nov 2025 18:10:23 +0100
Message-ID: <1jv7jlvke8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_091027_608873_27993706 
X-CRM114-Status: GOOD (  22.29  )
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

On Sat 08 Nov 2025 at 00:20, Jian Hu <jian.hu@amlogic.com> wrote:

> On 11/4/2025 6:14 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 04 Nov 2025 at 17:17, Jian Hu <jian.hu@amlogic.com> wrote:
>>
>>>>> +
>>>>> +static struct clk_regmap t7_dspa =3D {
>>>>> +     .data =3D &(struct clk_regmap_mux_data){
>>>>> +             .offset =3D DSPA_CLK_CTRL0,
>>>>> +             .mask =3D 0x1,
>>>>> +             .shift =3D 15,
>>>>> +     },
>>>>> +     .hw.init =3D &(struct clk_init_data){
>>>>> +             .name =3D "dspa",
>>>>> +             .ops =3D &clk_regmap_mux_ops,
>>>>> +             .parent_hws =3D (const struct clk_hw *[]) {
>>>>> +                     &t7_dspa_a.hw,
>>>>> +                     &t7_dspa_b.hw,
>>>>> +             },
>>>>> +             .num_parents =3D 2,
>>>>> +             .flags =3D CLK_SET_RATE_PARENT,
>>>>> +     },
>>>>> +};
>>>>> +
>>>>> ......
>>>>> +
>>>>> +static struct clk_regmap t7_anakin_0 =3D {
>>>> Nitpick: for the DSP it was a/b, here it is 0/1
>>>> Could you pick one way or the other and stick to it ?
>>>
>>> ok , I will use 0/1 for DSP.
>> I think I prefer a/b if you don't mind. see below for why ...
>
>
> Mali is named as mali_0, mali_1 in this driver.=C2=A0 =C2=A0And G12A/S4/G=
XBB series
> do the same.

... A1 use dspa_a dspa_b (etc ...)=20

>
> If they are named as anakin_a and anakin_b here, there will be two naming
> methods.
>

Already have that unfortunately

> Shall we keep consistent ?
>

Please try yes

>
> If use 0/1 to name them.
>
> dsp clocks are:
>
> =C2=A0 =C2=A0 dspa_0_sel
>
> =C2=A0 =C2=A0 dspa_0_div
>
> =C2=A0 =C2=A0 dspa_0
>
> =C2=A0 =C2=A0 dspa_1_sel
>
> =C2=A0 =C2=A0 dspa_1_div
>
> =C2=A0 =C2=A0 dspa_1
>
> =C2=A0 =C2=A0 dspb_0_sel
>
> =C2=A0 =C2=A0 dspb_0_div
>
> =C2=A0 =C2=A0 dspb_0
>
> =C2=A0 =C2=A0 dspb_1_sel
>
> =C2=A0 =C2=A0 dspb_1_div
>
> =C2=A0 =C2=A0 dspb_1
>
>
> anakin clocks are:
>
> =C2=A0 =C2=A0 anakin_0_sel
>
> =C2=A0 =C2=A0 anakin_0_div
>
> =C2=A0 =C2=A0 anakin_0
>
> =C2=A0 =C2=A0 anakin_1_sel
>
> =C2=A0 =C2=A0 anakin_1_div
>
> =C2=A0 =C2=A0 anakin_1
>
> =C2=A0 =C2=A0 anakin_01_sel
>
> =C2=A0 =C2=A0 anakin
>
>
> If use a/b to name them.
>
> dsp clocks are:
>
> =C2=A0 =C2=A0 dspa_a_sel
>
> =C2=A0 =C2=A0 dspa_a_div
>
> =C2=A0 =C2=A0 dspa_a
>
> =C2=A0 =C2=A0 dspa_b_sel
>
> =C2=A0 =C2=A0 dspa_b_div
>
> =C2=A0 =C2=A0 dspa_b
>
> =C2=A0 =C2=A0 dspb_a_sel
>
> =C2=A0 =C2=A0 dspb_a_div
>
> =C2=A0 =C2=A0 dspb_a
>
> =C2=A0 =C2=A0 dspb_b_sel
>
> =C2=A0 =C2=A0 dspb_b_div
>
> =C2=A0 =C2=A0 dspb_b
>
>
> anakin clocks are:
>
> =C2=A0 =C2=A0 anakin_a_sel
>
> =C2=A0 =C2=A0 anakin_a_div
>
> =C2=A0 =C2=A0 anakin_a
>
> =C2=A0 =C2=A0 anakin_b_sel
>
> =C2=A0 =C2=A0 anakin_b_div
>
> =C2=A0 =C2=A0 anakin_b
>
> =C2=A0 =C2=A0 anakin_ab_sel
>
> =C2=A0 =C2=A0 anakin
>
>
> Which one is better?

a/b or 0/1, we already have both

Pick which ever scheme you prefer, just stick to it from now on.

>
>>>>> +     .data =3D &(struct clk_regmap_gate_data){
>>>>> +             .offset =3D ANAKIN_CLK_CTRL,
>>>>> +             .bit_idx =3D 8,
>>>>> +     },
>>>>> +     .hw.init =3D &(struct clk_init_data) {
>>>>> +             .name =3D "anakin_0",
>>>>> +             .ops =3D &clk_regmap_gate_ops,
>>>>> +             .parent_hws =3D (const struct clk_hw *[]) { &t7_anakin_=
0_div.hw },
>>>>> +             .num_parents =3D 1,
>>>>> +             .flags =3D CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
>>>>> +     },
>>>>> +};
>> [...]
>>
>>>>> +
>>>>> +static struct clk_regmap t7_anakin_clk =3D {
>>>>> +     .data =3D &(struct clk_regmap_gate_data){
>>>>> +             .offset =3D ANAKIN_CLK_CTRL,
>>>>> +             .bit_idx =3D 30,
>>>>> +     },
>>>>> +     .hw.init =3D &(struct clk_init_data) {
>>>>> +             .name =3D "anakin_clk",
>>>> Again, not a great name, especially considering the one above.
>>>> Is this really really how the doc refers to these 2 clocks ?
>>>
>>> bit30 gate clock is after bit31 mux clock,  and the gate clock is the f=
inal
>>> output clock, it is used to gate anakin clock.
>>>
>>> I will rename bit31 as anakin_pre, rename bit30 as anakin.
>> Ok for the last element
>>
>> ... but I don't  like "_pre" for a mux selecting one the 2 glitch free
>> path. It does not help understanding the tree.
>>
>> For such mux, when it is not the last element, I would suggest
>> "_ab_sel" ... at least it is clear what it does so, "anakin_ab_sel" ?
>>
>
> ok, anakin_ab_sel and anakin for these two clocks.
>
>
> Maybe anakin_01_sel and anakin for these two clocks, if you agree to 0/1
> naming convention.
>
>>>>> +             .ops =3D &clk_regmap_gate_ops,
>>>>> +             .parent_hws =3D (const struct clk_hw *[]) {
>>>>> +                     &t7_anakin.hw
>>>>> +             },
>>>>> +             .num_parents =3D 1,
>>>>> +             .flags =3D CLK_SET_RATE_PARENT
>>>>> +     },
>>>>> +};
>>>>> +

--=20
Jerome

