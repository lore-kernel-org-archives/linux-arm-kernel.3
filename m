Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34769CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzTHhy3GAbklolyt8qy1XMnUZAQnKYr+cBkCn68R7OE=; b=OV2HrvLK6YFFmYFsSFpqxQS0qR
	x6pBYhxsOfH+j0VOFqZLhlgHVfz9AqwRqTOr8lVn06HnPu5kCfnTfYfJ9erWoqQvdqTKvP0xjzuEC
	EkDXHDtpTCHD09Op3NFfDepEXxT/GCLzFPxysQjnzy8hQTs9cz3jate5OmAZvK5hg7JCpuOAiVJi9
	6LfWRM4auIda83hqjCcV0PUkjsdGSQO5d/w2l/HNy1hqIMDUrZZFBSJnWrySensKjaeU5m3QiycMd
	U3bmEOa9VmYXNMlN232waAZgUrMm+VqSU4e//1eeEsgvyhtEE91alZB9LrYL6mkksuBPSDXTxzGO/
	6UiM2+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGE49-0000000Bb78-0A7P;
	Tue, 04 Nov 2025 10:15:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGE45-0000000Bb5y-04JQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 10:15:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47728f914a4so27334085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 02:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762251298; x=1762856098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzTHhy3GAbklolyt8qy1XMnUZAQnKYr+cBkCn68R7OE=;
        b=vEoInxTz4mti2Fm1cx03WIY8jbXFxlkbO7dktPy5sJdD6l2h8mA8BxH3jFk+udmziS
         gW/n8P2q3KyCTLbgFGvWr/6sxbTfH3vuqLtl9NYhB3q5HXf7uZll0njNufO4wqTQUzy7
         1L3NFKT9u4n2g6WFKyffZrsolOGUDxnJSI+BhC2sBfWJhGI8wI/8IbjYSREB3HHyhzPd
         8owxwI+MGNIY+yXQJtm39ooUF9sObtPq+rzzdgozKMWQSHyYtmxlwH7VSihcKq7f5ITK
         2NLlPz1gC4/raS5k4JZo1fcWsuOwc+v5MZLdbxuwuFS7mga7i0dDl+p3ucpJl0elUMkW
         eJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251298; x=1762856098;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VzTHhy3GAbklolyt8qy1XMnUZAQnKYr+cBkCn68R7OE=;
        b=COnGTtMy6IjFk4gwgR5cVy1gv/7dqy7UNggmVnWAU08xu/HOb+KXpgHrblhwaKFkev
         perM50UVE+AEDQ6kYNsFQzcp0XkHP9IwoOVXuRvw3MW1OgLryCJ/WoFlR1OEGQGzZ4RS
         bF5XNkkPpVFEpxT10BWv39ak7wDnwsPzHtz72u2bJ0JierZHKtIuxdLRXozaLoCgfQSg
         UnCAQU1O9LUy6CxprKEAgynBToVFNJZ7MZiiS2MJGOwp2wU9Wzf6ksCCYnEmW9qIogI8
         55IXDvWDJCSYJK+Xg1V7TVbZM07KSg73vkyzpfy/xtw0wE1XMQkWQK4nCMxWLilDhQc3
         1vew==
X-Forwarded-Encrypted: i=1; AJvYcCXq366Eq7j3ItawWfGwJalwkMbziomB5zClxgVOUggeFA0xLq3AfH2JVgKeHc5TVNGbaRH3sPsInFmUxuTQyGEd@lists.infradead.org
X-Gm-Message-State: AOJu0Yydb+/Ay6GU9aGuxMb5ZJxdCGIcKvfmHWzDQH12VqMiORBey0Z6
	B3cLVxN0S6UOXDBxWMY4tXc32d9c0eqN4cDs8vkDiFLWr4ZGV23b1nf9wz2f08TsAMw=
X-Gm-Gg: ASbGnctC8IWgKZWH6ZI0UmDd1o7vjuUyldfmH+uIuhjcCZfoyvC/XcIIQbnG/2sOMRF
	Hp61cUmXEh5sfnKGHv1t/RQ65QNMOsPC1KlpQN5S58COQnQEUxeOvgzR6DijzEP6iEHsBhAbWGx
	vWaNh3XRadVYsg/rmqZ5WMJ3tapgNQd7PRku7l4EqSPeI1PpqgoRYnsU4o5tDKLd+np2BepovB3
	ILfwiko5NCxhQhU33MeLegHz+zNfrGvwsVyFOE/kBfn6ngREYoIRCONY1M6lybjGRt46BHqdaUO
	yz4ZaK6G3zB+R5oNPfzFiSM4G9q9EqOObveZs/PSJ1JuKgj8lP1ysEPjMVwD15jW4Y7NLaKXnW/
	ZToEINEOTGjVYVdjiza1GQ+fg9vyITO7sLEtUfG4vt66aZLR8N0tXKnWB56IXpqagUeiCj2bJmL
	auzjLMsiEfBw==
X-Google-Smtp-Source: AGHT+IFW39f8luyhpSRptudm6R2xZGEcdodo7MnF7yu9NJ2j+0Jo9qKayBjVFzg4CRgrhQRxcMSJYw==
X-Received: by 2002:a05:600c:3489:b0:477:cb6:805e with SMTP id 5b1f17b1804b1-477307e0513mr122942125e9.18.1762251298482;
        Tue, 04 Nov 2025 02:14:58 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:8c13:6331:568f:92f3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429dc18ef89sm3810253f8f.6.2025.11.04.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:14:57 -0800 (PST)
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
In-Reply-To: <3b9a5978-aa02-486b-85f5-6443dc607dd5@amlogic.com> (Jian Hu's
	message of "Tue, 4 Nov 2025 17:17:50 +0800")
References: <20251030094345.2571222-1-jian.hu@amlogic.com>
	<20251030094345.2571222-6-jian.hu@amlogic.com>
	<1jbjlnxuug.fsf@starbuckisacylon.baylibre.com>
	<3b9a5978-aa02-486b-85f5-6443dc607dd5@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 04 Nov 2025 11:14:57 +0100
Message-ID: <1j1pmew1cu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_021501_175760_2DC503D7 
X-CRM114-Status: GOOD (  15.13  )
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

On Tue 04 Nov 2025 at 17:17, Jian Hu <jian.hu@amlogic.com> wrote:

>>> +
>>> +static struct clk_regmap t7_dspa =3D {
>>> +     .data =3D &(struct clk_regmap_mux_data){
>>> +             .offset =3D DSPA_CLK_CTRL0,
>>> +             .mask =3D 0x1,
>>> +             .shift =3D 15,
>>> +     },
>>> +     .hw.init =3D &(struct clk_init_data){
>>> +             .name =3D "dspa",
>>> +             .ops =3D &clk_regmap_mux_ops,
>>> +             .parent_hws =3D (const struct clk_hw *[]) {
>>> +                     &t7_dspa_a.hw,
>>> +                     &t7_dspa_b.hw,
>>> +             },
>>> +             .num_parents =3D 2,
>>> +             .flags =3D CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> ......
>>> +
>>> +static struct clk_regmap t7_anakin_0 =3D {
>> Nitpick: for the DSP it was a/b, here it is 0/1
>> Could you pick one way or the other and stick to it ?
>
>
> ok , I will use 0/1 for DSP.

I think I prefer a/b if you don't mind. see below for why ...

>
>>> +     .data =3D &(struct clk_regmap_gate_data){
>>> +             .offset =3D ANAKIN_CLK_CTRL,
>>> +             .bit_idx =3D 8,
>>> +     },
>>> +     .hw.init =3D &(struct clk_init_data) {
>>> +             .name =3D "anakin_0",
>>> +             .ops =3D &clk_regmap_gate_ops,
>>> +             .parent_hws =3D (const struct clk_hw *[]) { &t7_anakin_0_=
div.hw },
>>> +             .num_parents =3D 1,
>>> +             .flags =3D CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
>>> +     },
>>> +};

[...]

>>> +
>>> +static struct clk_regmap t7_anakin_clk =3D {
>>> +     .data =3D &(struct clk_regmap_gate_data){
>>> +             .offset =3D ANAKIN_CLK_CTRL,
>>> +             .bit_idx =3D 30,
>>> +     },
>>> +     .hw.init =3D &(struct clk_init_data) {
>>> +             .name =3D "anakin_clk",
>> Again, not a great name, especially considering the one above.
>> Is this really really how the doc refers to these 2 clocks ?
>
>
> bit30 gate clock is after bit31 mux clock,=C2=A0 and the gate clock is th=
e final
> output clock, it is used to gate anakin clock.
>
> I will rename bit31 as anakin_pre, rename bit30 as anakin.

Ok for the last element

... but I don't  like "_pre" for a mux selecting one the 2 glitch free
path. It does not help understanding the tree.

For such mux, when it is not the last element, I would suggest
"_ab_sel" ... at least it is clear what it does so, "anakin_ab_sel" ?


>
>>> +             .ops =3D &clk_regmap_gate_ops,
>>> +             .parent_hws =3D (const struct clk_hw *[]) {
>>> +                     &t7_anakin.hw
>>> +             },
>>> +             .num_parents =3D 1,
>>> +             .flags =3D CLK_SET_RATE_PARENT
>>> +     },
>>> +};
>>> +

