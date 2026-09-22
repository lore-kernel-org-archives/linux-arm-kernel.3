Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720B3C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kiu2zTEU4eOPd6KYh9rbDUJ7UJD3txxYyQibAU4/O4U=; b=G7v9Mr5L77HcHx8okLpS4tOtam
	/4BlDHwt7arT876RnKpoQov2fT10I1rm2ESgZ2fCfgGWouxaZfLeZ9iiglbozNFAAm4MtjVJPrq91
	PiccVncdOuXEV7kCk7LVGXHU8HqjdCw6kG/94Ya26mq/g32ji1oSjyX7kyOBOecNO2ksOEeg6+Xo6
	NmGuvqORxzqVkeYDp1QfdGuWtxzwb5pHhJUdSK8vkv5Zp3O6JsVNCsPCQZaEz45PodzA6lQpTGuC0
	MY64lw1YhOX+QOHjdw/25JXQxXJadtv1W++rTCym45w+h54raQ0B7UeupbULjA9X4RoWTth5E6Waw
	jFzff37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ulR-00000004U8H-06PS;
	Tue, 22 Sep 2026 07:18:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ulQ-00000004U8A-2F3d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:18:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CFD74498B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A781F008BE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061482;
	bh=Kiu2zTEU4eOPd6KYh9rbDUJ7UJD3txxYyQibAU4/O4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TdgKWF2EpS1w3ADvij2BopLpxhHXGdHIunEVbiZcvtASTMdf/9sUcUsOCpknA/t97
	 OUDjR9pY9+X6TC0C7nH/sd0n5JKYjOW0JKYTuP8kSz9UyZwWuiPuD1OnzwLncY14m+
	 z1V4mE8i6JRQJ8xGQB6k1qtTQZeDJ4qv7cs7bLXpyPTP0U9wqBJH/nZLelCYQq7Oe/
	 oVPXn1WdL76/wYtlx9Psk9Oc9CxpkcIhZFCd2IyFMqmD6QUbOpcXGzpKktQRoSmHOm
	 ce6l5zgc+wWVOzGg3rCucrtknj4lDC33ancgZfwJYKmtGTfPVghJMT7Jko+pc3V0Te
	 Uou8jemMlGVvg==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso29855291fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 00:18:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvzTyEneJfN0APTfVh6Qf5C/EvxxdT0/i3pGCpwZrDvU/ySAG519DFZIlyWY5eGF8AYA6K+Eq61rrieXBS07jS@lists.infradead.org
X-Gm-Message-State: AFuF++llqYeuFGRQ2ovOp7w/GTUM9OFe7RaULYT5/mAn63My5WadJfRQ
	h0ltqYIkKoe009R1FJbDAyGoqO6AVDxhbjVCNfyOEiVvz49NoRRt4UIyY9Xm8AteD9dK2T41MkY
	UF6X4KG14r8O+F5HFSYEu6kA/siYdvZw=
X-Received: by 2002:ac2:51c3:0:b0:5b8:bc5e:b572 with SMTP id
 2adb3069b0e04-5b8c1845684mr4028396e87.42.1790061480637; Tue, 22 Sep 2026
 00:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-8-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-8-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:17:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLkSfPvuO=ZgqwYnbBBjxuu4ns1EDpHXQxKgWGqK9E130A@mail.gmail.com>
X-Gm-Features: AclHuK98tk4GqYStUdUYs2m51yzirRsfrNvcnULTogZGKv-tdFHo0QJgErcoW2U
Message-ID: <CAD++jLkSfPvuO=ZgqwYnbBBjxuu4ns1EDpHXQxKgWGqK9E130A@mail.gmail.com>
Subject: Re: [PATCH v8 08/18] gpiolib: regmap: add write_data_after_dir quirk
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Long,

this is starting to look good!

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Some controllers ignore data-register writes while a line is still an
> input. Optionally write the output value again after switching the
> direction, matching the existing PL061 behaviour.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
(...)

> +++ b/include/linux/gpio/regmap.h
> @@ -48,6 +48,13 @@ struct regmap;
>   *                     (Optional) Bitmap representing the fixed directio=
n of
>   *                     the GPIO lines. Useful when there are GPIO lines =
with a
>   *                     fixed direction mixed together in the same regist=
er.
> + * @write_data_after_dir:
> + *                     (Optional) Write the output value again after
> + *                     switching a line to output in ->direction_output(=
).
> + *                     Needed for hardware which ignores data register
> + *                     writes while the line is configured as an input.
> + *                     This is a legacy quirk (e.g. ARM PL061); new hard=
ware
> + *                     must not use it. Direction changes will glitch.
>   * @drvdata:           (Optional) Pointer to driver specific data which =
is
>   *                     not used by gpio-remap but is provided "as is" to=
 the
>   *                     driver callback(s).
> @@ -94,6 +101,7 @@ struct gpio_regmap_config {
>         unsigned int reg_dir_out_base;
>         int reg_stride;
>         int ngpio_per_reg;
> +       bool write_data_after_dir;
>         struct irq_domain *irq_domain;
>         unsigned long *fixed_direction_mask;
>         unsigned long *fixed_direction_output;

1. You have put the kerneldoc in a completely different place in the order
of thing than where you put the flag in the struct.

2. Put a comment above the behaviour flags because there will
invariably be more of them! Something like:
/* Regmap GPIO behaviour flags */

3. Put a newline before & after the flags so they end up in a separate
section of the struct, so people know where to add them.

I would put them:

        struct device *parent;
        struct regmap *regmap;
        struct fwnode_handle *fwnode;

        const char *label;
        int ngpio;
        const char *const *names;

HERE

        unsigned int reg_dat_base;
        unsigned int reg_set_base;

Yours,
Linus Walleij

