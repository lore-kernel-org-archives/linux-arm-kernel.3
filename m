Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73685D29C28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCbuiYjGuVvlbB4vqWDSqvvIfZr+F+0/4EzDwihuPK4=; b=Ugyc7h26rgJCuOQ0TwrN9ycmj4
	jduOHGPzqZwKkEDZLZaOD3ONNlwt5MKay82pHivi6nsxoHVWQ+83Igv7B+EZoe79d6BXklJvetjDm
	wS7c65Il+vGxWNHoVjiDjTh8phRGAWOL/fBmrEqENuJEPLNQxx0rJ+FfBvMFGnBIYnhAvAGL8f1Ur
	J54hDyDoaN6EJzxh+p48phNLwdCLi0uuv3S1nu2Xlke3PHuknBOxSUmtTCq3bbZNeiZUDHVlemm/K
	PbYbg8i7ce3aBtutm1s4WLTQ+iudYV+7L7D+ZVA1BEXBDyhLm+GDe7PGcRgqLhg/bA3klsjhEmEHb
	T5ga41lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpHq-00000002ATD-0tVs;
	Mon, 19 Jan 2026 13:27:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpHp-00000002ASY-0KL7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 13:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eCbuiYjGuVvlbB4vqWDSqvvIfZr+F+0/4EzDwihuPK4=; b=FE6tlh5/xtV/1IDvquSYSKUwmU
	I7XIw5W2J+EZNIP7ynqWNuaiw5Mrv359VAt7i+mZVcfED4/vKwqRyvaLAVofad4gfyGBhLgp0gAc6
	R817kbY1ymA0PUJxxq20j5AqmTsaXNPtS9OaK8EBz4zWrbCT+irLhLOhOjLSaASNdxoy4whPqRL3P
	FSn4btwxeQ2MVxYIXze8COfqy9Xj2XjHVRV5plhXKPFYJlI8AUSCfDu+N9ZVE9Zq5XEFwCfZOq6Pj
	yv8OUH4AegsOkOZr3BmNGxm+QuuK6HKC4uCZ9ZkGs9RxsMTompe0EDRAPpeQ9j1Qt/YUj2c/x4uQ/
	dr5AjSig==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpHl-0000000CAO2-2v7H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 13:27:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso24176365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 05:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768829232; x=1769434032; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eCbuiYjGuVvlbB4vqWDSqvvIfZr+F+0/4EzDwihuPK4=;
        b=0hVy8FQ9QvjPHseY9OY1x/g9Sueefj09qf28tVdyKuMQSKp6UStK/ABdel/eKmn5gL
         R4O4KRgF7MwgUdjFzJCDPs+UvA0Kc07WGn2d+R8BMOgBof67/sJ6W77OUPNP6JqWp9P6
         e3yrFV5D+uAX1VhrJNZUjVdctu+Izja8mngxSAb0qTgJmQSxeeLuWOyH/KAaeYSGQik1
         RzsbmV6mwrgRX5sUNQ2BLTWFPT5Yw/QToBcCQJQzLOef74czs2mAgbE6WL9wLJ9CXJ2G
         tBL9l5cbeNxiPqEtC5awKLWP4L95G8DmTICbvYZI9vqqSgIQrwkspBwyd0C4x5xdeynb
         zrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768829232; x=1769434032;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eCbuiYjGuVvlbB4vqWDSqvvIfZr+F+0/4EzDwihuPK4=;
        b=dD7chj/fEvAiU8sUgkwLZfDPEdmOabDp2Bsn9K6iyUFI/V0Xet5S1mFMCmkdIXBSoU
         bdFsQrCxxB+ego9nr++hGJKn85Ck4dOR2wbVC8tD/iCamjZaGULE2p+75J8ZQybROdFm
         NJOi4jdYA2t2BRouEHOOjsMomEwDgY/dvMzxJiseW2i6D3/r+lsApIlDV2UTp/2yBm0E
         rly3PhzIkjL9yg4Ri3RaT1yFpu9MjLu54shWTsG0pOPFXmNmtuVzOChLKQRxNyugDsY5
         WO8FjwhemfS0zH1fvkqgwyNBRtD2OGH7m6R3poLyYQzALWM7EBRPQwtzHMOn2sOaG5/s
         fHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfRtvqiEC//ACKsMiv1mz9LyoZRXRdXwS5c+TpBm58Y0a0GC7MBoRa00RCeIVr/wprnCGZF8FbgyyB0s2veFMZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzQeBkQruf2JRKSZGIA24uxJDpPfAssgvyiR3UpMMVJyH1uzEs3
	VVietYuAQCGxgoJ2LdC6PbSeolkPkU7LB4ufMOOhrwgchY6/YlmJxVlIWiXt2rP0mHQ=
X-Gm-Gg: AY/fxX4QvjzLIIPOdLJ6GYnCgrqrwu7OVyf2jWycR00i4Qxsf8Kc/ajgxun7u+w/KHX
	YwJB9EER/CyQO4KceQXSodQdeKmBTjdwYkAo8gd/DSf1ofLKuh0i+yt2pu/uut9WpzhjXzKzD3a
	+f3YjjcRtCBNxKc6ycmoCOxhiA8pc4N40aIOZAN4ivl0In7f6eEZ9MecMCLPsDw+1BRUoA3f/fk
	ZAReminvnoVYFy5fmjGwPG4LHkI6rD0uZfY+nLX2BxuMAqVYTQiVT+aajhsAlmiQIsVm8jYGqzZ
	dWzycDwn44UFM+Fpynf8Bf9JJEOXY4+p26HAp0OjpL+vtvKZL5msL5zk56CzKTl+dqf/HNBnlHf
	5yAHse0hQNxoYTCRIQcwMvoQoWbRXl+oXttQAKkwyinrJknHTh3/ahkSW8wAIQj0ISMQ2a0VmTD
	g3GYWbairRMA==
X-Received: by 2002:a05:600c:8b67:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-4801e342091mr114088625e9.23.1768829231748;
        Mon, 19 Jan 2026 05:27:11 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4154:6ad6:c781:df9c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4801e8c0499sm197706815e9.9.2026.01.19.05.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:27:11 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/8] clk: amlogic: Add A5 clock peripherals
 controller driver
In-Reply-To: <ea7e209d-cd30-4d93-9deb-104aaf7c92eb@amlogic.com> (Chuan Liu's
	message of "Mon, 19 Jan 2026 20:16:19 +0800")
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
	<20260108-a5-clk-v5-5-9a69fc1ef00a@amlogic.com>
	<1jecnsr1eg.fsf@starbuckisacylon.baylibre.com>
	<ea7e209d-cd30-4d93-9deb-104aaf7c92eb@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 19 Jan 2026 14:27:09 +0100
Message-ID: <1jbjipviky.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_132714_135390_1336B9DD 
X-CRM114-Status: GOOD (  22.11  )
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

On lun. 19 janv. 2026 at 20:16, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome,
>
> On 1/14/2026 5:25 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On jeu. 08 janv. 2026 at 14:08, Chuan Liu via B4 Relay
>> <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>> 
>>> +static struct clk_regmap a5_rtc_clk = {
>>> +     .data = &(struct clk_regmap_mux_data) {
>>> +             .offset = RTC_CTRL,
>>> +             .mask = 0x3,
>>> +             .shift = 0,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "rtc_clk",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_data = a5_rtc_clk_parents,
>>> +             .num_parents = ARRAY_SIZE(a5_rtc_clk_parents),
>>> +             .flags = CLK_SET_RATE_NO_REPARENT,
>>> +     },
>>> +};
>>> +
>>> +#define A5_PCLK(_name, _reg, _bit, _pdata, _flags)                   \
>>> +struct clk_regmap a5_##_name = {                                     \
>>> +     .data = &(struct clk_regmap_gate_data) {                        \
>>> +             .offset = (_reg),                                       \
>>> +             .bit_idx = (_bit),                                      \
>>> +     },                                                              \
>>> +     .hw.init = &(struct clk_init_data) {                            \
>>> +             .name = #_name,                                         \
>>> +             .ops = &clk_regmap_gate_ops,                            \
>>> +             .parent_data = (_pdata),                                \
>>> +             .num_parents = 1,                                       \
>>> +             .flags = (_flags),                                      \
>>> +     },                                                              \
>>> +}
>> I wonder why I bothered reviewing v4 ...
>
> Regarding the comment you made on V4, my understanding is that you were
> just teasing ...

You are redefining the PCLK here, the *exact* type of pointless differences
we've worked last year to remove. This is something you can't have
missed since you've complained about it taking too long.

And now, you've thought I was "just teasing" about it ?

I'm bored with your botched submissions Chuan.

> In the next revision, I will change this part to use a
> unified macro.

Yes please.

>
> We may also consider adjusting the "MESON_PCLK" macro later by removing the
> SoC prefix from the clock name,

No

> so that it is consistent with the naming
> style used by "MESON_COMP_SEL" / "MESON_COMP_DIV".
>

Just do the same as c3 and t7.

>> 
>>> +
>>> +static const struct clk_parent_data a5_sys_pclk_parents = { .fw_name = "sysclk" };
>>> +
>>> +#define A5_SYS_PCLK(_name, _reg, _bit, _flags) \
>>> +     A5_PCLK(_name, _reg, _bit, &a5_sys_pclk_parents, _flags)
>>> +
>>> +static A5_SYS_PCLK(sys_reset_ctrl,   SYS_CLK_EN0_REG0, 1, 0);
>>> +static A5_SYS_PCLK(sys_pwr_ctrl,     SYS_CLK_EN0_REG0, 3, 0);
>>> +static A5_SYS_PCLK(sys_pad_ctrl,     SYS_CLK_EN0_REG0, 4, 0);
>>> +static A5_SYS_PCLK(sys_ctrl,         SYS_CLK_EN0_REG0, 5, 0);
>>> +static A5_SYS_PCLK(sys_ts_pll,               SYS_CLK_EN0_REG0, 6, 0);
>>> +
>>>
>> [...]
>> 
>>> +
>>> +static struct clk_regmap a5_gen = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = GEN_CLK_CTRL,
>>> +             .bit_idx = 11,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "gen",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &a5_gen_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +#define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
>>> +     MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
>>> +
>>> +#define A5_COMP_DIV(_name, _reg, _shift, _width) \
>>> +     MESON_COMP_DIV(a5_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>>> +
>>> +#define A5_COMP_GATE(_name, _reg, _bit, _iflags) \
>>> +     MESON_COMP_GATE(a5_, _name, _reg, _bit, CLK_SET_RATE_PARENT | (_iflags))
>>> +
>> At the top. like C3 and T7
>
> Except for A5_COMP_SEL, which differs slightly from T7 due to the
> additional "_table" parameter, the other macros are consistent with T7.
>
> I also asked for your feedback on this in V4 and received your
> confirmation. Is there anything here that still needs to be updated?

Reviewing these long patches takes time. I tend to stop reviewing when I
noticed some feedback was ignored, especially when it is recurrent
problem. I've told you that already. It is up to you to make sure you are
not missing anything before re-submitting if you don't want to waste time.

>
> [...]

-- 
Jerome

