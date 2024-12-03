Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1907E64A80
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7MzIWIrLWAbVF89l+Uf6tn+k9bQS3/RiimZVSw8N/c=; b=OOTvxb8SFp8UV4Ad/mf8lFO6A6
	vLKp0HVB4TI/jCga8cNnPT21h7drPS1dfbLF4ZC1yvtfa1xa8H0/8YOLlL2g41NU5tKScFFN5dg1I
	OIhq4cXbxOSANWT/KOJ0e98ELXKQfJzTPnWV51OHHhtQkZCiMz3WX0WQWpwW+d1eGxgtoI/FGsBiD
	9k24zSe8agD1v1k8cDnmOg8EN5ZzeNlinv1bz1FLvzYvufXh52SuybieD4976fXZAIrhhh9mcEhE0
	rj9an6NB2ATZ1txI04Ba+rMyLMUpLQPobF2+jpC/XR4IqKh1neO3CXqYn5M6feJ5lIMz0NOuvQYrz
	FfeqfG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQrp-00000009E3F-01as;
	Tue, 03 Dec 2024 11:14:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQff-00000009BEw-3Vff
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 11:02:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3933955f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 03:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733223742; x=1733828542; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S7MzIWIrLWAbVF89l+Uf6tn+k9bQS3/RiimZVSw8N/c=;
        b=vYfEgNgV9SlmTYDox0DBGWDp+W85r3cvb2o4Cpm6iHajIX5jIXzbygRsvegpbfBuDQ
         yf30V/k4u5m2og/XfGyAyooKWXE7s+nQRVTnukGfTtP2IRm5UgnWfJbS2qgTfTx/hKss
         QN7QzvalwCdl4+GxD18vMEBAlTZz6p9FUroZ3ecEUI1Z8ipQc+HyDS4k47SEOopiHXWz
         dJMw/TZhgVAhBzbSB04XLz8ZmcZHK41STMCnpWEzInVWrqL4W1hQu5RlpFqBlyAp9nl0
         YqMz1ADCoEYOtzlU8uiafesn/bazj17DUsHBt3RjUTIr9nIRx+1EjcJWFwR7/NjqVLR0
         7/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733223742; x=1733828542;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7MzIWIrLWAbVF89l+Uf6tn+k9bQS3/RiimZVSw8N/c=;
        b=FYau4RZR6beSrT4lyGVQRHptxb9ouzjajf8Z8CiWfCcBg1+pCA5qKXRolZJq82tdMF
         jyYtVxr7G4B1BG0CLRAeiC9dC3IppBr0RNPaGqI2GQrjTJJgPfgcKyc1Y67hYOl/NQo6
         CbQECWJ74c20RZsBeseLnyNGXgRV4dSnve9KD73HcO+QiVUoe32A7qNIy/8bfJAibV0B
         kY08SxH9nAK1KduvKU9ZykjVLm8J6n45zIDVCH4Obq4nBCbd+lJ8EN89fUbW+B2ACzMw
         RaopCD0SOB9lpu5T4RkLtxTETCDCtDt3VMUPvqXiupRLjxS0Reoy7i6jkXVM2ikRPYfN
         KnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1sjPQLFsjbHRWYhzD9ZHt8WBGkXuRJtHinIY9NeA4QD+CnHcnpCmKhz/7ug+cin7/CJ5kww4pqiyToEaIvv+7@lists.infradead.org
X-Gm-Message-State: AOJu0YxvyVr0W63gRjsjOPt/QYKf1Xei/wT/pBT1EbQQMZqyRvKksFpO
	9rRW6PGl6USqrYfW4Uh1fTE3hLHPQkLbXS1PKqvcYkms259VEh94I95jQlEowGw=
X-Gm-Gg: ASbGncv61YZ7niNq8ZtEkls3VEIahTv1s5j/sw4feVV/gHBcb2gmRSwz5AwFS13aWOx
	NPPPOCAv7Rzk6ZsDk70khAkUK0uonOch6/fcaKxL8r/fAPfbGRAbpDxUU3mmNfZW1hfsMfl8cpv
	t9oUWjvNZJZoAKzjOjRr+QX3gz+aPkKbjM3LMC6l2kHBLy+BKe3GEp/UwjKKogGCSoFIHxQV5jl
	pBKnT5ns/An8a4A4C82vworOdDWW/w9oOYa1AcccNkLxDPaJakF0/g=
X-Google-Smtp-Source: AGHT+IE4z37Or9yADOv+O39FGI70uwdrH1eoqOGhO/GGECRsdGCnHKNhwdQTcxVdHXzjgp6xkbp4Tg==
X-Received: by 2002:a05:6000:23c2:b0:385:e1e8:40db with SMTP id ffacd0b85a97d-385fd3e9195mr1279542f8f.24.1733223741934;
        Tue, 03 Dec 2024 03:02:21 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e49cd788sm9516997f8f.6.2024.12.03.03.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:02:21 -0800 (PST)
Message-ID: <16f9b5f8aed79e9313b4638512896743fa5a8d6d.camel@linaro.org>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thomas Antoine <t.antoine@uclouvain.be>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Dimitri Fedrau
 <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 11:02:20 +0000
In-Reply-To: <bce22ca8-aed2-41ae-b2ef-fdc71266709a@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
	 <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
	 <9387c0cf-d291-485a-8cd1-1aced7eba14e@uclouvain.be>
	 <2883fb0dd22312d5da9039d4fef869276a0bd430.camel@linaro.org>
	 <bce22ca8-aed2-41ae-b2ef-fdc71266709a@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_030223_872074_74537E41 
X-CRM114-Status: GOOD (  27.70  )
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

On Tue, 2024-12-03 at 11:11 +0100, Thomas Antoine wrote:
> On 12/3/24 10:31, Andr=C3=A9 Draszik wrote:
> > On Tue, 2024-12-03 at 10:08 +0100, Thomas Antoine wrote:
> > > On 12/3/24 07:47, Andr=C3=A9 Draszik wrote:
> > > > > From: Thomas Antoine <t.antoine@uclouvain.be>
> > > > >=20
[...]

> > > > > =C2=A0/*
> > > > > =C2=A0 * Model Gauge M5 Algorithm output register
> > > > > =C2=A0 * Volatile data (must not be cached)
> > > > > @@ -369,6 +387,8 @@ static int max1720x_battery_get_property(stru=
ct
> > > > > power_supply *psy,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval=
 =3D max17201_model;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX17205)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval=
 =3D max17205_model;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX77759)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval =3D m=
ax77759_model;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else
> > > >=20
> > > > This is a 16 bit register, and while yes, MAX172XX_DEV_NAME_TYPE_MA=
SK only
> > > > cares about the bottom 4 bits, the register is described as 'Firmwa=
re
> > > > Version Information'.
> > > >=20
> > > > But maybe it's ok to do it like that, at least for now.
> > >=20
> > > I thought this method would be ok as long as there is no collision on
> > > values. I hesitated to change the model evaluation method based on ch=
ip
> > > model, where the max77759 would thus have an hard-coded value and the
> > > max1720x would still evaluate the register value. I did not do it bec=
ause
> > > it led to a lot more changes for no difference.
> >=20
> > Downstream uses the upper bits for max77759:
> > https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads=
/android-gs-raviole-mainline/max_m5.h#135
> >=20
> > I don't know what the original max17201/5 report in this register
> > for those bits, though. Given for max77759 this register returns
> > the firmware version, I assume the lower bits can change.
>=20
> Based on this datasheet of the max1720x, the upper bits are the revision
> and the four lower bits are device. So it could change.
> https://www.analog.com/media/en/technical-documentation/data-sheets/MAX17=
201-MAX17215.pdf#MAX17201%20DS.indd%3A.213504%3A15892
>=20
> If the four lower bits are not always 0 for the max77759 then I guess it
> is necessary to change this as it wouldn't work with all max77759.

Maybe the best way forward is to go by the compatible (from DT), and
if max77759 to then print a warning if the upper bits are !=3D 0x62 and
!=3D 0x63. And maybe even refuse to load in that case.

Cheers,
Andre'


