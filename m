Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3877C9EC90
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQnT37UZBBv4j+bw5gvfT5ZfWm5AQfI3JrknLC8ZdPA=; b=k3JSF7WB0tip/ABEjY+ubKiiLC
	tBpafA8GZpEsqNLOpfwFe7RsLVTuZcC242ACP3Ur/TQG7+PhGD/5riKf/unQIzXvG5z4Y1Bb/g8bI
	+oGfjd/FvXWtQmJ9xaZ5FnGahnSI9k646fCcnf6j74P42G/uHSvLI1lgnP8aEtD/TFt2agN5si2EB
	GKI8kArDVRjjgDChaGzKN/NZmqTR27e3zGyq3yIj6Z5U/+pqNVru6FlMnCd1QtwNJsn5l88YmQwZY
	8eBL33rgOpW4S++NGqMgjPJ1vXgG/aVztXFdS2Co21gMgOCIDCZg6XehjuO7M3MNIdhoNjjQfDOXK
	p4F2Jfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIFk-00000005REX-2eN1;
	Mon, 12 Jan 2026 13:46:40 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIFh-00000005RDq-1mEZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 13:46:38 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8c30365ac43so608950085a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 05:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768225596; x=1768830396; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JQnT37UZBBv4j+bw5gvfT5ZfWm5AQfI3JrknLC8ZdPA=;
        b=RpBPbLJ5hUDON+NLP+3XdXsU1ii0WaIAxqgtF/bywV65A1DhCKsRvKm3VhySZHn0Wh
         OiwyS1ug/NsgHsXMFs5oThwqDHulEtXMp0NFjbM43c69nZWqTwRZYstLlFHynYaFE7mt
         XxCZFfCzfoIx3SSi6kgCghw8IZBAKawfpBpSmvJbxKuT6EmaJ9SD5A9y1G8mGHRwVTqv
         +HQYRmeiY05yEEO3vsB5yNLt/7Z1BKNg/86J6DDQSO6HWu8KtYe4UW6RKX4xl94aJEdH
         XtiVgOvubWty1kg6C8WeGlL5QRVrK3pQPMSnHODPhVM5f//J7foCZVI3INpFF8WRuDSH
         jEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225596; x=1768830396;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQnT37UZBBv4j+bw5gvfT5ZfWm5AQfI3JrknLC8ZdPA=;
        b=pmVzPTxidf0nQkyBjyvGm+nLWsvbDuOBwer/EyA1Yq4RXRILrvVtZBv4ykEB2LTgkC
         7Qg54o7j5R/kinZCau6bbKGJF4wnj11wOaFhJED4EgzAqCs2+cDmWssnvlCxhXGIsg7v
         suPWQoW0oxdur0zVRabshiOC7thC7R3HkQG3CapXZ98GsOJ2w+iRAAajTf5MaYwvp9ZJ
         ePoMziCadXJvZLV1MurpThwni3J8EaRWC31a0YTa/NNcCINmCv3PT/jBd3hAzaFlKSvk
         ryTfnyd5ewh8yfQvqJERr7Y9CjRf0hYIqi97tWSDlO5TWGeaj2jKvf+jGhNW+fvJmveq
         PMJg==
X-Forwarded-Encrypted: i=1; AJvYcCWKTF69Y9k7Msj5uKOxceUlsiNANwO29tKnl8RZj6+znT2ezUdshj1M4KY1O/ln6lt3OorI5k6HCAetfP+qTrGn@lists.infradead.org
X-Gm-Message-State: AOJu0YzgzrNHFck5ftlcCtZbz4TULUZenlPtazDgw6rDGNUD5j4GxrRA
	EUAy03JQI1UGsz+9bGZub6UPvc0Lk0XxSXGZSftiR9+JDjwYzbNASB5oAUa/lH1Uggs=
X-Gm-Gg: AY/fxX7zomPrZFNc1N3pFt8DOIZchgWkoCqfkZyTnWPhEYt57aXFw5C60m65YmoNqa/
	E7+BYn8aK46sXHok9jX5O2CzZ7WTZe8x99iUcMQEramKeQ9TqoaL7NHH9ae4ihoxxx7XBksdGbb
	YH0uUo8Ml6mv3EI4792ZSAJT7Pja9QNVGvFk9pFmS/C9Oni0WMPjSTO6cOnh3e7uurAizFfmAMd
	Km0uEfNhtvuM+bdY61I6IhyvpROPRTxHfBVlUBS2qherCnl2ynCcfVfm63vyq688YBw3KWfJKxl
	Hnv/YDIUYEVurhn0KARBNGfvKYRByFJSw0LMFa1LDly/Kqu4rCbK4bYfP5qlOBxh5daGcbvZO7Z
	lDEgV4lW7Dj9mfN5ZI7i+PsdFwJGodGQe+RAeP4Kl0BXX2wcDSihS3tNaGAqMlKWEtsh+5Q4mAX
	LE/E/8cpi1ly6rp5X7
X-Google-Smtp-Source: AGHT+IG31NYG+AAMbXiciSTHwir8DbiWnqbFPpl0WS7rz5lNjd1hETy3FhMv6H1NKdch14tiCMTiMA==
X-Received: by 2002:a05:620a:bd3:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8c389400554mr2655171085a.68.1768225595576;
        Mon, 12 Jan 2026 05:46:35 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51d06fsm1477599385a.32.2026.01.12.05.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:46:35 -0800 (PST)
Message-ID: <2869d309358f27652289c40810ca36b2ec155d1d.camel@linaro.org>
Subject: Re: [PATCH v3 4/5] power: supply: max77759: add charger driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Lee Jones
 <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Badhri
 Jagan Sridharan	 <badhri@google.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>,  Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Mon, 12 Jan 2026 13:47:12 +0000
In-Reply-To: <255d7726-6758-43ed-b35f-db14726bcc9b@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
	 <20251227-max77759-charger-v3-4-54e664f5ca92@google.com>
	 <298ca35590d2180fdcf334f94964b6110e17c606.camel@linaro.org>
	 <50c29a62-1fdb-4de2-8887-0d551eee5ec0@google.com>
	 <255d7726-6758-43ed-b35f-db14726bcc9b@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_054637_493979_4720DD66 
X-CRM114-Status: GOOD (  23.72  )
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

On Tue, 2026-01-06 at 17:14 -0800, Amit Sunil Dhamne wrote:
>=20
> On 1/6/26 3:41 PM, Amit Sunil Dhamne wrote:
> > Hi Andre',
> >=20
> > On 1/5/26 9:32 AM, Andr=C3=A9 Draszik wrote:
> > > Hi Amit,
> > >=20
> > > I haven't done a full review, but a few things caught my eye.
> > >=20
> > > On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wro=
te:
> > > >=20
> > > > diff --git a/drivers/power/supply/Makefile=20
> > > > b/drivers/power/supply/Makefile
> > > > index 4b79d5abc49a..6af905875ad5 100644
> > > > --- a/drivers/power/supply/Makefile
> > > > +++ b/drivers/power/supply/Makefile
> > > > [...]
> > > > +
> > > > +static irqreturn_t irq_handler(int irq, void *data)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct max77759_charger *chg =3D data;
> > > > +=C2=A0=C2=A0=C2=A0 struct device *dev =3D chg->dev;
> > > > +=C2=A0=C2=A0=C2=A0 u32 chgint_ok;
> > > > +=C2=A0=C2=A0=C2=A0 int i;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 regmap_read(chg->regmap, MAX77759_CHGR_REG_CHG_=
INT_OK,=20
> > > > &chgint_ok);
> > > You might want to check the return value and return IRQ_NONE if it=
=20
> > > didn't
> > > work?
> > >=20
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(irqs); i++) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (irqs[i] =3D=3D irq)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 break;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 switch (i) {
> > > > +=C2=A0=C2=A0=C2=A0 case AICL:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "AICL mode=
: %s",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_AICL));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +=C2=A0=C2=A0=C2=A0 case CHGIN:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "CHGIN inp=
ut valid: %s",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHGIN));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +=C2=A0=C2=A0=C2=A0 case CHG:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "CHG statu=
s okay/off: %s",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHG));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +=C2=A0=C2=A0=C2=A0 case INLIM:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Current L=
imit reached: %s",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_INLIM));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +=C2=A0=C2=A0=C2=A0 case BAT_OILO:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Battery o=
ver-current threshold crossed");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_CC:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Charger r=
eached CC stage");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_CV:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Charger r=
eached CV stage");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_TO:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Charger r=
eached TO stage");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_DONE:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Charger r=
eached TO stage");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > Are the above debug messages really all needed?
>=20
> I forgot to respond to this comment in my previous email.
>=20
> I think we can keep AICL, BAT_OILO, INLIM. They're either special=20
> conditions (AICL) or faulty conditions (like BAT_OILO) and we can in=20
> fact keep them at dev_info level. Rest can be removed and a=20
> power_supply_changed() is sufficient.
>=20
> Let me know what you think?

I don't think dev_info() in an interrupt handler is appropriate. At
least it should be ratelimited.

If it's something special / unexpected that needs attention, having
a dev_dbg() message only will usually not be visible to anybody.

Also will the call to power_supply_changed() down below handle the
special conditions (e.g. convey to upper levels)? If not, can it be
made to do so?

Cheers,
Andre


