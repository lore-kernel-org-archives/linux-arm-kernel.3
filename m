Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8099FCFD31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 06:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REZ04im9FdK76DRTIwu+Cc/Q2WxCSUPnF2cnra53O5Y=; b=SAnfzHMUvFpXIPoaYMqaclt3Sq
	iFLG1fhLB405YnlWz338J4vy/oegJvB5CtgmfVRx+ujYYeSly8G1jhicLTBC34QYSQOAaB2/eUlZh
	eJZ2tIvSNKHGUMc1RC2BRjBOu7HFJL5e65rqy9pnlqJjgu/IJYaj/FLkG+vVy2soU+ejhaL3IJZYG
	I99Q52RdDMP4h6fpvXb/oFk0Htoo3JBpVTWb6zi6lnX7rzOZ9j61fbeY/motzu4PgR9ifpFPS+Y31
	ibV4VKSxKqv5uIJ+BkuenquzJufdS6rOJV872BkKqKkTpLEEzdisSmugCphwVlhqDCB8tcZz3xCS8
	CrUovTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNPwU-0000000B8sF-2sQk;
	Mon, 24 Nov 2025 06:20:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNPwR-0000000B8rq-2dIh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 06:20:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4779a637712so23076285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 22:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763965249; x=1764570049; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=REZ04im9FdK76DRTIwu+Cc/Q2WxCSUPnF2cnra53O5Y=;
        b=haDiSUQTieBXr0Iw98SDFJcrG4RlwBwZyoOdR3ODjK7TnzVe2f5mtmlPOgXVKpD3FS
         CGd3NmKlUkPAQ6rqhuiYnMCslqa3ES548oJZmPWeIq8hM7drmjlpYMv4ucvuazUuQxV0
         tBkXJ+HZykmuZzKw+qGdujGcNKmrEzcSewIjMegbLnC6SSbqFLK5lBSKEhQwsso/vQOz
         dmJEE05WyEe7R/t6Hl9N6JsYpC6vo72QT8pneogdwqbZPRXwPLc6l9Jk+jC+C+Glo0Ib
         ww62dD7+EQBm8+WNkBUHtmZFRz1rbOASGLC/ngVfOg+JdbuzEktRIDQdVUbwAbsEEnXo
         785w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763965249; x=1764570049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REZ04im9FdK76DRTIwu+Cc/Q2WxCSUPnF2cnra53O5Y=;
        b=a6+/nTV7jhIqN9qd2AG/EKfkDbLf4LfoTj48Pa1Ewg7tsWou1DxjSJYGT5WnGaG76u
         SPvvWVUcP08iq6tLcA9y5LRu20Wm7T0b8KfsU0tAPaUCAy3S9ZxZsi895cklZp6zYp/B
         vOXjjqBX9nY62mzPUx3SKDLSgQaHzS0yZ2CD+iCRgHjsxS5hX0+R3MC/W6EyzDkP6Uxc
         VBAr2yX5i611jme/EXcrxfje/DpzCgWC+NkLFadSJ0wot/7iqsew94fsilwFYcUh7hUG
         ps0Z8A5sPypP5f1zl6UiQsoApnfxQaYnSyWhG0CDJ+YChC/afo6YJ9shNedschyfpW41
         raBg==
X-Forwarded-Encrypted: i=1; AJvYcCVXuzDt17MfUrfawI71mhx8/fDlCPj4WGOA+Z8qrsktyWGA1nWNjwvWmdleI9OaoeJDVLVI0Aumk1vBW/iqyIW8@lists.infradead.org
X-Gm-Message-State: AOJu0YwN2onzlAiQVeeaVemhGlKyOc3NcIxNdtsmDph4+kBiP2fxWLcF
	WGHb4kLEBG7ph3T/coXj4WOcnYrtTRP7xf54W5MnwOJniMbX83tp5kwkuqNP8Z3Vxcg=
X-Gm-Gg: ASbGncvZY7UtTzIoZz3w79sg3wNcMDDtbmybZq3S7PVA0JqIwkLsY7Z+f9ZUlkEYUGy
	caLZlBpMJ9bV5RpDZgYzjrwlG/YSBBgb0TdP5pv8ZqbGxl8Ws/uM+4IgOwXknvffAvCOlN4oY7s
	aQGJTctgyvpUysCXPHOWXRErpMAZfQOsJjmdwaNUkwJ5sGKumk/70QxXaJCcDaNOci9lWNqkk2n
	GaoRZJf8l/z2uwgColJPsK3MiNtRtI74RFwlzuUyv2cofvOqmWZ27VUTEZJq/wBOcWncQmKj0mF
	HOoamtKO5/utRvLx9uDfKLFJyIqhpddoAUu8LRA10UPMvlfHyH4F5KbH6us5nH+SAON+belxIfi
	jVF+T8C83njByHylcTy5ICeSGdXM5Iv37u0+wMB9I4Cer8mhTMhk7aJuYmgJEBjMx1nYki30Nhu
	JaY6E5/n2YtXuU4bBRYxJm+vm0kRNr
X-Google-Smtp-Source: AGHT+IEkAHuQrVSean0CMnJmgdroQFGEXS2JnDMuJL0ECBf4DUqCtzz0alMdPUQuLJolnNwjmMRrhw==
X-Received: by 2002:a05:600c:3110:b0:477:632c:5b91 with SMTP id 5b1f17b1804b1-477c01b4b2amr122845505e9.16.1763965249310;
        Sun, 23 Nov 2025 22:20:49 -0800 (PST)
Received: from draszik.lan ([212.129.72.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm26304551f8f.2.2025.11.23.22.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:20:48 -0800 (PST)
Message-ID: <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Mon, 24 Nov 2025 06:21:00 +0000
In-Reply-To: <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_222051_714364_FFC81B2F 
X-CRM114-Status: GOOD (  23.65  )
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

Hi Amit,

Thanks for your patches to enable the charger!

> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Define specific bit-level masks for charger's registers and modify the
> irq mask for charger irq_chip. Also, configure the max77759 interrupt
> lines as active low to all interrupt registrations to ensure the
> interrupt controllers are configured with the correct trigger type.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 +++=
++++++++++++++-------
> =C2=A0include/linux/mfd/max77759.h |=C2=A0 9 +++++++++
> =C2=A02 files changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> index 6cf6306c4a3b..5fe22884f362 100644
> --- a/drivers/mfd/max77759.c
> +++ b/drivers/mfd/max77759.c
> @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys_irqs[=
] =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct regmap_irq max77759_chgr_irqs[] =3D {
> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
> +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_AICL |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_CHGIN |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_CHG |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_INLIM),
> +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_BAT_OI=
LO |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CHG_ST=
A_CC |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CHG_ST=
A_CV |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CHG_ST=
A_TO |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CHG_ST=
A_DONE),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct regmap_irq_chip max77759_pmic_irq_chip =3D {
> @@ -486,8 +495,8 @@ static int max77759_add_chained_irq_chip(struct devic=
e *dev,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get parent vIRQ(%d) for chi=
p %s\n",
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 pirq, chip->name);
> =C2=A0
> -	ret =3D devm_regmap_add_irq_chip(dev, regmap, irq,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_ONESHOT | IRQF_SHARED, 0, =
chip,
> +	ret =3D devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT |
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_SHARED | IRQF_TRIGGER_LOW,=
 0, chip,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data);

Please correct me if I'm wrong, but I don't think this makes sense for a
chained IRQ in this case. What problem does this change fix?

> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(dev, ret, "failed to add %s IRQ chip\n",
> @@ -519,8 +528,9 @@ static int max77759_add_chained_maxq(struct i2c_clien=
t *client,
> =C2=A0
> =C2=A0	ret =3D devm_request_threaded_irq(&client->dev, apcmdres_irq,
> =C2=A0					NULL, apcmdres_irq_handler,
> -					IRQF_ONESHOT | IRQF_SHARED,
> -					dev_name(&client->dev), max77759);
> +					IRQF_ONESHOT | IRQF_SHARED |
> +					IRQF_TRIGGER_LOW, dev_name(&client->dev),
> +					max77759);

dito.

> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(&client->dev, ret,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "MAX77759_MAXQ_INT_APCMDRESI failed\n"=
);
> @@ -633,7 +643,7 @@ static int max77759_probe(struct i2c_client *client)
> =C2=A0		return dev_err_probe(&client->dev, -EINVAL,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "invalid IRQ: %d\n", client->irq);
> =C2=A0
> -	irq_flags =3D IRQF_ONESHOT | IRQF_SHARED;
> +	irq_flags =3D IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW;

I don't believe IRQF_TRIGGER_LOW should be added here, as this is board-spe=
cific.
The polarity is meant to be set via DT (and the only current user of this d=
river
does so).

> =C2=A0	irq_flags |=3D irqd_get_trigger_type(irq_data);

That's what gets us the config from DT.

> =C2=A0
> =C2=A0	ret =3D devm_regmap_add_irq_chip(&client->dev, max77759->regmap_to=
p,
> diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
> index c6face34e385..0ef29a48deec 100644
> --- a/include/linux/mfd/max77759.h
> +++ b/include/linux/mfd/max77759.h
> @@ -62,7 +62,16 @@
> =C2=A0#define MAX77759_CHGR_REG_CHG_INT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb0
> =C2=A0#define MAX77759_CHGR_REG_CHG_INT2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb1
> =C2=A0#define MAX77759_CHGR_REG_CHG_INT_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb2
> +#define MAX77759_CHGR_REG_CHG_INT_AICL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(7)
> +#define MAX77759_CHGR_REG_CHG_INT_CHGIN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(6)
> +#define MAX77759_CHGR_REG_CHG_INT_CHG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
> +#define MAX77759_CHGR_REG_CHG_INT_INLIM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(2)
> =C2=A0#define MAX77759_CHGR_REG_CHG_INT2_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0xb3
> +#define MAX77759_CHGR_REG_CHG_INT2_BAT_OILO=C2=A0=C2=A0=C2=A0=C2=A0 BIT(=
4)
> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC=C2=A0=C2=A0 BIT(3)
> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV=C2=A0=C2=A0 BIT(2)
> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO=C2=A0=C2=A0 BIT(1)
> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE BIT(0)

Even if wireless out of scope, it'd still be nice to add macros for
the remaining bits to make this complete and avoid having to update
these again in case wireless support gets added in the future.

Also, would be nice to keep existing style and indent the bits from
the registers (see existing bit definitions in this file a few lines
further up).

Finally, can you add the bits below the respective register (0xb0 / 0xb1)
please, to keep suffix meaningful, and to follow existing style for cases
like this (see MAX77759_MAXQ_REG_UIC_INT1).


Cheers,
Andre'

