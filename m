Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF74CA0EE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaIi5bX3+gV/h6Vj8GBZ99kNlqtAraP/osub2NBrW20=; b=uChCDKymWALeyuPYHTNYd00kyY
	pJWtbyEt13j3rrwE6jirufYXmFxpNgpA+BagW+9cInLm9kc8kHbSyv7K21tXQhgpgsH7EdsrAQUGP
	UrhQ6qB6y4J9iVGmVGjGCsgUDpiZfOTtOSrFi/fMWVVFM/qQxW8T30tDLXHXUb2+ZeVmXaVSU9m36
	lwy+LTu1PSiZVbftWZ4rAgsSyHXAC8WdSf0fBndmYhSZdWZy373+DLqOgzoonQ0geySlrha98cqbC
	F+1G28dSJ+anpnM0J4aDP+Bh5uT414ClNNSNm1D2rNEXpTbQP2yvr/JAYewgG91DL9Ryl3hTK2LZJ
	pMDC4Gdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTXN-0000000GHhh-0MWO;
	Thu, 14 Aug 2025 08:42:17 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTUn-0000000GHF2-12tB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 08:39:38 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-333f8d387d6so5048521fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 01:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755160775; x=1755765575; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaIi5bX3+gV/h6Vj8GBZ99kNlqtAraP/osub2NBrW20=;
        b=vo/RuJ0w6k+KOtj2/LwHB74kknU4XGSYgIge/t1GQLlEBBYTNXiaP5tSMnLBh3aSAD
         wjFyIqMS8v6Hmf81CnABvFSNpioTbGOvAydaFYC263nW60lu5/hBlVk1ChT93/w5I5GY
         dAXrbwYhDJls6GWGQoIYHleRvmtYPxc++q+nDdwUyhUEl5mssEWg90OsIN6QAZTSSXaI
         AUr0qYQdYJTxUDzs3wIAfJI7U92zOTejoOyxbH5ewl+kTNLJ1gBzoGcZDgNSUQuxUW0u
         zBqigQqfjHbPOWg5MYCbdK0owMZ0oerqfoffTCJTySMzeeatkAx3T3lolCSuZopmfDwI
         KNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160775; x=1755765575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaIi5bX3+gV/h6Vj8GBZ99kNlqtAraP/osub2NBrW20=;
        b=U+wxrksIrVEMY4t4NRO9SCReZrsxzWUSIO8056fhVoTC31tc/8L7j76atmUbG2tU8b
         YBbsDe+MpFWzbXniEevA8ZCAPxqdBjnzNNEo0R++sunx9Frf2O33qCqRHcSk0Ri73smC
         lhvvT3KJFJ7yD4IIT7+tSjQoPNO2SICcMRK5lYTVF5xtdEzDLLxJrsU4Yzkgg+BxPAoE
         RYg0SGu2SrlXp4b0/YHOIzOrPxkVKi+CBhTnBEjg86RwYdDWsFsusrxSmHljJtXJ1Q8o
         yzRH/fyLhMNPV56Lo+YYmJrM9ALQL87gsEZVOSqMKK5Kdw5nRvAfYcHs+ucVMqYIbnQP
         LFbw==
X-Forwarded-Encrypted: i=1; AJvYcCWpHM5g4XPfcBDJQeBirFyBP4u6J7N2Exj9kb7cP426fHwrPTsvbBy6gvtCWigfnap2PwIetjT4UpenHAZfcDWs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2lorPHx145Rbm5Z5XGZJwUfX/yc8YSQ47mdgaWmBX9K24Cu8x
	XWJf8wLBjyu9e7vl+o3DEhBoMJ+0rBIAnRR7palX5ymzBMY04qOPrHaiYFlA9pdoFHO7ut9iSMS
	AhMKflEj4shJHoEwoebVJVvY5yK5fdYCWMMCOxyorxg==
X-Gm-Gg: ASbGncul4gTnHRf9YzIO3VzHsAb8HqUo60BctePmI/GTPD0Jk7/OQgBsh9qzxrxmsre
	QQL0YZUc9P/NRm7dZY9NINg5fKOuFcgT/Tgxid0jtYRZtPYEWn3wWQjyVr9PoyZ/KrI6ZpusrBt
	yoBmFcqvAoPCkbRWPfTKVooIHO6bKOfOMJvAdFgErVB24N9fPfVokI2QuhVSqik9Hq2mwwl9K8L
	ZmNDlt59dzE
X-Google-Smtp-Source: AGHT+IEBhgHbbiuLlz456cSljy5BJ+Mt69eE8JMNI0QgJdOyYP4gFOCniqZb+9CBD26zplBj4FpduJQuORsTYyUK37w=
X-Received: by 2002:a05:651c:1542:b0:332:1de5:c52b with SMTP id
 38308e7fff4ca-333fa65a0f9mr6370551fa.1.1755160774977; Thu, 14 Aug 2025
 01:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org> <bd79aa90-73f7-4d7b-a340-539b52a73bcf@sabinyo.mountain>
In-Reply-To: <bd79aa90-73f7-4d7b-a340-539b52a73bcf@sabinyo.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Aug 2025 10:39:23 +0200
X-Gm-Features: Ac12FXzM5-H17AD1HKx2WqB-_-1tjL_aML9ljBHUJqj9lzjEPqqSERcfoDBeevw
Message-ID: <CACRpkdZOnjW-mjQbTOUybNod8PyT+p66v8h2c4ejAfV7wo-8Tg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 6/7] pinctrl-scmi: Add GPIO support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_013937_303485_A7284258 
X-CRM114-Status: GOOD (  31.56  )
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

On Sun, Jul 20, 2025 at 9:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> This adds GPIO support to the SCMI pin controller driver.  It's an RFC
> patch because I'm not really sure how these are used and so I don't
> know how they should be configured via devicetree.  I've labeled the
> places where I think devicetree configuration would go with a FIXME.
>
> This driver was based on work from Takahiro AKASHI.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

(...)

> @@ -955,19 +954,16 @@ int pinctrl_gpio_get_config(struct gpio_chip *gc, u=
nsigned int offset, unsigned
>         if (ret)
>                 return ret;
>
> -       ops =3D pctldev->desc->confops;
> -       if (!ops || !ops->pin_config_get)
> -               return -EINVAL;
> -
>         mutex_lock(&pctldev->mutex);
>         pin =3D gpio_to_pin(range, gc, offset);
> -       ret =3D ops->pin_config_get(pctldev, pin, config);
> +       ret =3D pin_config_get_for_pin(pctldev, pin, config);
>         mutex_unlock(&pctldev->mutex);
>
>         if (ret)
>                 return ret;
>
>         *config =3D pinconf_to_config_argument(*config);
> +
>         return 0;
>  }

Looks reasonable.

> @@ -42,6 +46,7 @@ struct scmi_pinctrl {
>         unsigned int nr_functions;
>         struct pinctrl_pin_desc *pins;
>         unsigned int nr_pins;
> +       struct gpio_chip *gc;

This being a pointer is slightly confusing. And looking below I see why:

> +       gpio =3D fwnode_get_named_child_node(dev->fwnode, "gpio");
> +       if (!gpio)
> +               return 0;
> +
> +       pmx->gc =3D devm_kcalloc(dev, pmx->nr_functions, sizeof(*pmx->gc)=
, GFP_KERNEL);
> +       if (!pmx->gc)
> +               return -ENOMEM;

So this needs a comment to what is actually going on here.

To me it looks like the code is instantiating a struct gpio_chip for
each function on the pin mux.

That feels wrong: instead we should probably instantiate *one* gpio_chip fo=
r
the whole pinmux and then create individual gpio lines for each
pin that can work as a GPIO.

> +       for (i =3D 0; i < pmx->nr_functions; i++) {
> +               const char *fn_name;
> +
> +               ret =3D pinctrl_ops->is_gpio(pmx->ph, i, FUNCTION_TYPE);
> +               if (ret < 0)
> +                       return ret;

So we are only looking for functions that are of GPIO type.

> +               if (ret =3D=3D false)
> +                       continue;
> +
> +               ret =3D pinctrl_ops->name_get(pmx->ph, i, FUNCTION_TYPE, =
&fn_name);
> +               if (ret)
> +                       return ret;
> +
> +               pmx->gc[i].label =3D devm_kasprintf(dev, GFP_KERNEL, "%s"=
, fn_name);
> +               if (!pmx->gc[i].label)
> +                       return -ENOMEM;
> +
> +               pmx->gc[i].owner =3D THIS_MODULE;
> +               pmx->gc[i].get =3D pinctrl_gpio_get;
> +               pmx->gc[i].set =3D pinctrl_gpio_set;
> +               pmx->gc[i].get_direction =3D pinctrl_gpio_get_direction;
> +               pmx->gc[i].direction_input =3D pinctrl_gpio_direction_inp=
ut;
> +               pmx->gc[i].direction_output =3D pinctrl_gpio_direction_ou=
tput_wrapper;
> +               pmx->gc[i].add_pin_ranges =3D gpio_add_pin_ranges;
> +
> +               // FIXME: verify that this is correct
> +               pmx->gc[i].can_sleep =3D true;
> +
> +               ret =3D get_nr_pins_in_function(pmx, i);
> +               if (ret < 0)
> +                       return ret;
> +               pmx->gc[i].ngpio =3D ret;

Please put a print here and see how many pins there are usually in the
function here. In my mind it should always be 1 and if it is not 1 then
something is wrong.

We cannot instantiate n gpio_chips for a pin controller where n is the
number of functions for GPIO, intead we need to instantiate one gpio_chip
for the whole pin controller with ngpio set to the number of pins
that exist on the pin controller and mask of any lines that cannot be
used as GPIO from the chip using the gc->init_valid_mask() callback.

I think you want to look at Bartosz series that introduce a GPIO
function category and use this as a basis for your work, because
I plan to merge this for v6.18:
https://lore.kernel.org/linux-gpio/20250812-pinctrl-gpio-pinfuncs-v4-0-bb39=
06c55e64@linaro.org/T/#t

If you can first patch the SCMI pin control driver to use
pinmux_generic_add_pinfunction() based on Bartosz patch set
and get to this:

+ .get_functions_count =3D pinmux_generic_get_function_count,
+ .get_function_name =3D pinmux_generic_get_function_name,
+ .get_function_groups =3D pinmux_generic_get_function_groups,

Then it is also easier to figure out if a line is GPIO or not (the
core will help you).

I hope the conversion to Bartosz generics could be
straightforward... It looks straightforward but there may
be devil in the details :)

After this you can use pinmux_generic_function_is_gpio()
to check if a certain function is used for GPIO or not, I think
in the SCMI case this is done with a simple strcmp().

Then you can use this to instantiate a gpio_chip for SCMI
that will dynamically allow pins to be remuxed into GPIO and
made available on the chip as we go.

I'm sure Bartosz can help out a bit with some details!

Yours,
Linus Walleij

