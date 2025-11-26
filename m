Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F3BD0EE29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iagMIGIeHxyM0iFPX2ThJoiCFK8Ow6UALIrOqYnhTgg=; b=JAJ0QpG5U1G2MgsWmN94A4hJsB
	pnx5G/RNtmJBVNo+36i8hK+tOzMEr5SSqmAhHoD1LBzH75YBd0r1TYyY15tog8Andp6Yq3IfLD6o5
	xnY7t6Jvt0UgnBAm52YOz46C4B7ju98HvfpRE2tzgdly9AlII0dUFa6aGC49YuQjD22niHnDmS2p1
	eYyEw5QE2y2fGcWOVP0YRxSMlhDXKhp/xWnvWxx7v4MbST4tkAoJlVOp5diaYf4nJVSqxty4KjA6s
	XwtRB7RxnFmrsaofW89/N+2stkL5Lnb/XwrAR1JbCe1V93Kx6VxeMsHU3MoEB9ihhdkC8kWZYNbBB
	Ma6ogqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9GH-0000000ESIq-1zV9;
	Wed, 26 Nov 2025 06:44:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9GE-0000000ESIP-30w1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 06:44:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so3861893f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 22:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764139456; x=1764744256; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iagMIGIeHxyM0iFPX2ThJoiCFK8Ow6UALIrOqYnhTgg=;
        b=dLOeLuKBoWmCF+WHQ0+KxBOc/v3JbNAaSq9BgRXr/vr/zwkmOHvtgzn9NiIr9NVH8x
         nBtmNjUDyGJPRmG6KKLPlwSmWuU5rmtxoH4OjgZ+koOuHeEj9LIygUj9STKreJTw+gmB
         jvFAZmEtGRsjpw3wUIuL2N7PdB/6UXAx7YDys9D2S7Skb/OYibYot+PHfEfANtnEtL72
         gZ7/BkTi3xKA07Wg2499UkYL5nPM04FfzBmITIpx0kLqjHZ5fe9dxnaQKVeXmkSsjst2
         Kne6ZvJvX7eV0s8Xo/M18Oq2ZnR5v+vThYKtXa4XOR6WdBWkmIsISUA70f1AL0WzW4u1
         NkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764139456; x=1764744256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iagMIGIeHxyM0iFPX2ThJoiCFK8Ow6UALIrOqYnhTgg=;
        b=jN9qL1e4M9Lq/+BMFqngTqQjSfoasrOC0jVLyc53BHvFdj7lCc8vicb2U/oLq01XnR
         MvrQBUmMWzTXkSPXqfhMLEQ+9l2JdDB8rgwa2DIg/mY++U0ORxpBpwSoR6pfqs3Yf2Nu
         t2oFq92QuXO5pISdegwgS0mH7u7K9FiqzBHT6HvTRBUWoXKNNimGLEtQb2K9bc+EILr6
         tpiYGYysiPmJxn2iJ5x7pc0YhaSFFVwiZ6jt1aJ6tVIfCp38QM0ZHyUskSfyCm+E8OK2
         b1xYe4NSSLjSrzq9vqrpJ4/whejTn7sVtmGV81pY/m4/NRpmERcCjBf23FHST5StPmcO
         0I5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZfHPjHFaYOojONp24+DN9X8NNj0+Sv+HVjr9wMxlaNxW6WazOPrrsxr0WI9rx/xzb4qDre7J6g6Fk8Wm9nmU2@lists.infradead.org
X-Gm-Message-State: AOJu0YyEgDCSVi+TcZAa8Zfw3Q1gMcXw8Q4mMhK2rVb7zFZK9KU2rkPb
	A/G2ni4TQdCBlyG091GIH4UnaQotCXEmQ3sZ3dADebTpIvtcW9f4QUYG4zMJJE1kweU=
X-Gm-Gg: ASbGncuZ+/6QZugZOv8mpWA3oyKscXAD/HhDBoyOW9VAYlGbiMqrk/TkmR1Aia4eNnY
	nEDtxER5z3ood8ck+OuJ0SBM4cj3E+4Cpo2NfbY5NEe7yUGubf9jpS1ujhPkP7LHkUrFJw7WjdD
	g6crtWKrjURg9LlPPUOy+6hu17DahjcyKq+GYuKhoE/51XpFyo9AcsnINFurQlzQdGR2CJiaLaw
	c6CMmzHwSt38+jMQvrxZxQetYqRBdBw5dkboz5gZ1gB3Z4rVvwafjGPfQcFCAOugeUftNF2AxKM
	6xV7OHnIp39eJWLfaPg2HAtaGRwVvyGHEOOzJbgd/Cigc1yiIHJsbOZZ5lOxdoAMfnIxMwYpxLx
	7PBbeBlYnn8Kw3Fkqx9N3onLQajmDfy2qxhhMv+EClLFpRGdZQvNtN0jU+0c+QDjE60fGwJO9Pq
	/FgsNNt9T+EndyhV5u
X-Google-Smtp-Source: AGHT+IGY6wpQR5oGHT//GHTCibu+r9RkZemJQTbELxXxGfU09J5aQ0TWFaLsehta2pjsoi8ZOGTqhA==
X-Received: by 2002:a05:6000:2891:b0:429:9323:2bec with SMTP id ffacd0b85a97d-42e0f356945mr5897156f8f.40.1764139456149;
        Tue, 25 Nov 2025 22:44:16 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm38406428f8f.2.2025.11.25.22.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 22:44:15 -0800 (PST)
Message-ID: <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
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
Date: Wed, 26 Nov 2025 06:44:30 +0000
In-Reply-To: <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
	 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
	 <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_224418_814124_74F4D662 
X-CRM114-Status: GOOD (  32.78  )
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

On Tue, 2025-11-25 at 17:10 -0800, Amit Sunil Dhamne wrote:
> Hi Andr=C3=A9,
>=20
> On 11/23/25 10:21 PM, Andr=C3=A9 Draszik wrote:
> > Hi Amit,
> >=20
> > Thanks for your patches to enable the charger!
>=20
> Ack!
>=20
>=20
> > > From: Amit Sunil Dhamne <amitsd@google.com>
> > >=20
> > > Define specific bit-level masks for charger's registers and modify th=
e
> > > irq mask for charger irq_chip. Also, configure the max77759 interrupt
> > > lines as active low to all interrupt registrations to ensure the
> > > interrupt controllers are configured with the correct trigger type.
> > >=20
> > > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > > ---
> > > =C2=A0=C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 24 +++++++++++++++++-------
> > > =C2=A0=C2=A0include/linux/mfd/max77759.h |=C2=A0 9 +++++++++
> > > =C2=A0=C2=A02 files changed, 26 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> > > index 6cf6306c4a3b..5fe22884f362 100644
> > > --- a/drivers/mfd/max77759.c
> > > +++ b/drivers/mfd/max77759.c
> > > @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys_i=
rqs[] =3D {
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > =C2=A0=C2=A0static const struct regmap_irq max77759_chgr_irqs[] =3D {
> > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
> > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
> > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_AIC=
L |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_CHG=
IN |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_CHG=
 |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_INL=
IM),
> > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_BA=
T_OILO |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_CC |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_CV |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_TO |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_CH=
G_STA_DONE),
> > > =C2=A0=C2=A0};

You should also add the remaining bits in each register here, so that the
regulator-irq can mask them when no user exists. It will only touch the
bits it knows about, so the state of the mask register is non-
deterministic with this change as-is (depends on how the bootloader
configured it).

[...]

> >=20
> >=20
> > > diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max7775=
9.h
> > > index c6face34e385..0ef29a48deec 100644
> > > --- a/include/linux/mfd/max77759.h
> > > +++ b/include/linux/mfd/max77759.h
> > > @@ -62,7 +62,16 @@
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb0
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT2=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb1
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT_MASK=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb2
> > > +#define MAX77759_CHGR_REG_CHG_INT_AICL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(7)
> > > +#define MAX77759_CHGR_REG_CHG_INT_CHGIN=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(6)
> > > +#define MAX77759_CHGR_REG_CHG_INT_CHG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
> > > +#define MAX77759_CHGR_REG_CHG_INT_INLIM=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(2)
> > > =C2=A0=C2=A0#define MAX77759_CHGR_REG_CHG_INT2_MASK=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb3
> > > +#define MAX77759_CHGR_REG_CHG_INT2_BAT_OILO=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(4)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC=C2=A0=C2=A0 BIT(3)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV=C2=A0=C2=A0 BIT(2)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO=C2=A0=C2=A0 BIT(1)
> > > +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE BIT(0)
> > Even if wireless out of scope, it'd still be nice to add macros for
> > the remaining bits to make this complete and avoid having to update
> > these again in case wireless support gets added in the future.
>=20
> I would prefer to only define the macros I am currently using to keep=20
> the review focused, unless you consider this a strict requirement.

It makes sense to add them now, as per above.



> > Also, would be nice to keep existing style and indent the bits from
> > the registers (see existing bit definitions in this file a few lines
> > further up).
> > Finally, can you add the bits below the respective register (0xb0 / 0xb=
1)
> > please, to keep suffix meaningful, and to follow existing style for cas=
es
> > like this (see MAX77759_MAXQ_REG_UIC_INT1).
>=20
> I will fix the indentation and ordering in the next revision.
>=20
> Regarding bit definitions: In [PATCH 5/6], the max77759_charger.c driver=
=20
> defines bits for the register addresses defined in this file. Currently,=
=20
> those macros are only used locally by the max77759 charger driver. Would=
=20
> you prefer I move those definitions to this header file as well?

Yes, would be nice to have them all in one place (in this file). That said,
CHG_INT, CHG_INT_MASK, and CHG_INT_OK all have the same layout and share
the same bits, so I personally would probably reuse the ones you added for
INT for all three of them - MASK (as you did already), and also for the OK
register. But up to you.

Cheers,
Andre'

