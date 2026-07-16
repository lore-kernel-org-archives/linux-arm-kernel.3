Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD264C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 07:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXj3gJSlM+B534IUnfOGDSAJRJX4Q0dPMiY4K5ALPU0=; b=oB1hPGeKJJY3JGK+GsG1sCB++J
	hxVs8Hn+w3Us2UE0D7ai2IbGtWrIzXhChL0Ynoyqh6SYEZyp15fzxE9RHSVyny5DtcpvNiyGVhgKC
	6w+bGsXtuv5KaJLwi2RU5OvTqOOjeieJueD63ttuHs9voifUPBQ1hVbsOPb/8M0owk2b78P2o4gmI
	aE/9C9hZuQ9t23Fce+eiD7jFtWPGW6YmI95HHRd1cNmxcUTS02UnHMpUITWn5fZcY1fN1k1OZYGIq
	um6zQGcYCDx4LOBz/i+MYiKltSSdib/1bzLjELTFbOQ969jq9HeFtIBKZP8ckH4OnSbRF0/dzX3Pz
	NdWCKAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGJu-0000000Gd8c-1rQ8;
	Thu, 16 Jul 2026 07:15:46 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGJr-0000000Gd7F-2as1;
	Thu, 16 Jul 2026 07:15:44 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0BBAC282;
	Thu, 16 Jul 2026 09:15:30 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 09:15:29 +0200
Message-Id: <DJZT74OCHTA2.3LLOKE9Y2SBXO@kernel.org>
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Cc: <Michael.Hennerich@analog.com>, <afaerber@suse.com>, <andy@kernel.org>,
 <brgl@kernel.org>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
 <devicetree@vger.kernel.org>, <dlechner@baylibre.com>,
 <james.tai@realtek.com>, <jic23@kernel.org>, <krzk+dt@kernel.org>,
 <lars@metafoo.de>, <linus.walleij@linaro.org>, <linusw@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-realtek-soc@lists.infradead.org>,
 <mathieu.dubois-briand@bootlin.com>, <nuno.sa@analog.com>,
 <robh@kernel.org>, <stanley_chang@realtek.com>, <tychang@realtek.com>,
 <wbg@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
X-Mailer: aerc 0.20.0
References: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
 <20260716062614.1507243-1-eleanor.lin@realtek.com>
In-Reply-To: <20260716062614.1507243-1-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_001543_987360_92334660 
X-CRM114-Status: GOOD (  19.62  )
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

Hi,

On Thu Jul 16, 2026 at 8:26 AM CEST, Yu-Chun Lin wrote:
>>> > @@ -185,7 +218,7 @@ static int gpio_regmap_set_direction(struct
>>> gpio_chip *chip,
>>> >                                    unsigned int offset, bool output)
>>> > {
>>> >       struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
>>> > -     unsigned int base, val, reg, mask;
>>> > +     unsigned int base, val, reg, mask, wren_mask;
>>> >       int invert, ret;
>>> >
>>> >       if (gpio->reg_dir_out_base) {
>>> > @@ -198,7 +231,12 @@ static int gpio_regmap_set_direction(struct
>>> gpio_chip *chip,
>>> >               return -ENOTSUPP;
>>> >       }
>>> >
>>> > -     ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
>>> > +     ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_OP, base=
,
>>> offset, &reg, &mask);
>>> > +     if (ret)
>>> > +             return ret;
>>> > +
>>> > +     ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_WREN_OP,
>>> base, offset, &reg,
>>> > +                                &wren_mask);
>>>=20
>>> What constrains these two to provide the same value back for reg?
>>> To me it seems like the write enable might well be in a different regis=
ter.
>>>=20
>>> >       if (ret)
>>> >               return ret;
>>> >
>>> > @@ -207,7 +245,7 @@ static int gpio_regmap_set_direction(struct
>>> gpio_chip *chip,
>>> >       else
>>> >               val =3D output ? mask : 0;
>>> >
>>> > -     return regmap_update_bits(gpio->regmap, reg, mask, val);
>>> > +     return regmap_update_bits(gpio->regmap, reg, mask | wren_mask,
>>> > + val | wren_mask);
>>> >  }
>>> >
>>> >  static int gpio_regmap_direction_input(struct gpio_chip *chip,
>>
>> My initial design indeed assumed that the WREN mask and Data mask reside=
 in
>> the same register.
>> =20
>> Regarding WREN support, especially if WREN and Data use separate registe=
rs, I
>> came up with three ideas. Which direction do you prefer?
>> =20
>> Approach 1: Provide Custom Callbacks in config (Let consumer driver hand=
le it)
>> We can add '.set' and '.set_direction' function pointers in
>> 'struct gpio_regmap_config'. If a driver requires WREN, it can implement=
 these
>> callbacks itself.
>>=20
>> static void gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,=
 int val)
>> {
>>         struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
>> =20
>>         /* If the driver provides a custom set (to handle WREN), delegat=
e to it */
>>         if (gpio->set) {
>>                 gpio->set(chip, offset, val);
>>                 return;
>>         }
>>         /* ... existing generic regmap logic ... */
>> }
>>
>> Pros: Clean core, no need to touch existing drivers' xlate signature. Th=
e consumer
>> driver handles its own locking for different registers.
>> Cons: It feels a bit strange and inconsistent to expose only '.set' and
>> '.set_direction' overrides while keeping other operations entirely abstr=
acted.
>> =20
>> Approach 2: Handle separate WREN register in the core (with locking conc=
erns)
>> We keep the 'XX_WREN_OP' in 'xlate'. If someone needs WREN and 'wren_reg=
 !=3D reg',
>> we write to both.
>> =20
>> static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
>>                            int val)
>> {
>>         /* skip */
>>         ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base=
, offset, &wren_reg,
>>                                    &wren_mask);
>>         if (ret =3D=3D -ENOTSUPP)
>>                 has_wren =3D false;
>>         else if (ret)
>>                 return ret;
>>=20
>>        ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offs=
et, &reg, &mask);
>>=20
>>        if (has_wren && reg =3D=3D wren_reg) {
>>                mask |=3D wren_mask;
>>                mask_val |=3D wren_mask;
>>                has_wren =3D false;
>>        }
>>=20
>>        if (has_wren)
>>                ret =3D regmap_set_bits(gpio->regmap, wren_reg, wren_mask=
);=20
>>=20
>>         /* ignore input values which shadow the old output value */
>>         if (gpio->reg_dat_base =3D=3D gpio->reg_set_base)
>>                 ret =3D regmap_write_bits(gpio->regmap, reg, mask, mask_=
val);
>>         else
>>                 ret =3D regmap_update_bits(gpio->regmap, reg, mask, mask=
_val);
>> =20
>>         return ret;
>> }
>> =20
>> Pros: Keeps all WREN logic unified inside the core framework.
>> Cons: Introduces a locking issue. writing to 'wren_reg' and then 'reg' r=
equires an
>> external lock to be atomic, which seems to defeat the purpose of relying=
 on regmap's
>> internal lock.=20
>>=20
>> Approach 3: Assume WREN and Data always share the same register
>>=20
>> static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset, =
int val)
>> {
>>         /* ... */
>>         ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base=
, offset, &reg, &wren_mask);
>>         if (ret =3D=3D -ENOTSUPP)
>>                 wren_mask =3D 0;
>>         else if (ret)
>>                 return ret;
>> =20
>>         ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, off=
set, &reg, &mask);
>> =20
>>         ret =3D regmap_update_bits(gpio->regmap, reg, mask | wren_mask, =
mask_val | wren_mask);
>>         return ret;
>> }
>> =20
>> Regarding this approach, I would like to ask from your experience: Is it
>> actually common for hardware designs to place WREN and Data bits in comp=
letely
>> different registers for GPIO operations?

I'd say that such a write enable bit by itself is pretty uncommon
for a gpio controller, regardless if it's in the same register or in
a different one.

>> If they practically always share the same register, this simpler approac=
h might
>> suffice.

It seems, that your hardware has it in one register. Why do you need
a separate mask anyway? Why can't the xlate callback just set the
bit in addition to the gpio bit? It looks like in the end you're
doing a "mask |  wren_mask" anyway. What am I missing here?

-michael

