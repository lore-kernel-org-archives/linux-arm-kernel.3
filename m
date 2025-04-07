Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4EBC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ERzJBk8IPAt2EVC29UOPORnzeO9/Agn8egECrfbp4E=; b=Gq/5Rqet02LLTpACezW6BeX7jA
	/iSTuTNH3UjQuHxOCf6NXcSUFolO77UVtADPJ97V9dFmghMTwu2qfuR8v22wL4ssA/yqEDRkMB0G9
	dwoDo38XKx88mFPZX7WeJQxQDH7DKOvoQm47KYE30MTLxoEbeCPaSg85/CFZpjCmAgLA16xFpfLbl
	HY4hCZ98JrHgpVHiNp0Bux+ZqIaX1iuf6F67banU2ZM/diQub4BzKG2W+ZoipssJZiGCN2Q7i8t6U
	DcFJSINXnq8ra3xu4A657tC1YrrMnZSgsrSJxBlE5Dj8XeLX9+As4vDmLFRMw3bIpbAJ1ZIzRJ6/M
	lXsEQ87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kgv-0000000Hawc-3Dzb;
	Mon, 07 Apr 2025 11:31:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kfA-0000000HaVD-2g0s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 11:29:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so21270995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 04:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744025351; x=1744630151; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ERzJBk8IPAt2EVC29UOPORnzeO9/Agn8egECrfbp4E=;
        b=qiaC5Pvds3lhDxW2P1xr+cm4RAqChVqhWcPtcLcDb1hYmlfeQ2JOSZXmVkncG8QyFq
         p6tRUG1luYBhDh5kBg16Xv1l7yYgbCq4Zf4uRhV+kSDKnzHe6qBA97dp76jA3EQa7Oqt
         mQ1tl8g02T2Gqe54S+wXAv+YCTsJ4u2YZhh40/UfF2mMeHBkD2wH1Ip3CawoUls66Lpf
         KFE/H8V4PCXw5EZd1bnwOvBQLGgmJdSjexPVSH2MdSDtW2ceVjI7pOiC2SMN+2gqfvPe
         B5+1ZO34vEkXAHI33y3G9haG3bpwSDIKKD6/K9XGGU8rPcarK3pVAUcL4QcQvP9nnncC
         0inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025351; x=1744630151;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ERzJBk8IPAt2EVC29UOPORnzeO9/Agn8egECrfbp4E=;
        b=dyiCP9KXmRD7oZ/CXfY6+n9WRhMEe1VPnMlb+LzJHubH9INMwh2YaI0T0a9TZ2O3Jr
         DsKNdqSfkd7DAPR8/UUcOA/mu11VCGR+sKNPggoDVT3jBNI7llzSzpajwjdMI4utV75P
         XxTl5CwXyyzdMET1i4NxZ/2c0a08Fu7eoouUbWMWhOVPkFATGcGnkBSLsyxLff0Usfb9
         FSccptngvB7nAOt8WjKBw838oPckn7KPy7yvJYB5V0dZjVRYNHiKVNzd0n+VLuQ27S+/
         sxekJiI3e1HH2DJg/R4aRT77GzwiVK+3S8CJ6yd4gqD/Dx8e8auMDLWhP5+xqhk1dp1a
         DihQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE59oL5+dAOb9E/j/6bGjA8jYfl86M6idTUIyJOpsuBpWt5bazPt4JxAJ/Epqb6dD8raG4m3bhb86LphZSJU1/@lists.infradead.org
X-Gm-Message-State: AOJu0YxnMDxNuKvWfE4hZIuj9KLrDFM/6He5AZPxaHKO4GEpha+vkSAH
	UTgiPR1UCb/ujEAITcSUJO3i2tI5w5I+b88j+COqkVvvH2UZDi/kGyV4hAPCOUE=
X-Gm-Gg: ASbGncvaULpLLLnP9dGQMslftQr8HL3jMdOgpo/luIGnrAg68/cxGzWge8J2pGalWNl
	2vxEjIFLLq3ZGWeehgAedupDEkVvxdcfVjV4GqsBlFe2nBaPtp+1ZfUSfUeo0O5OER+34EGMbC4
	KhYgNuFmEDZrZaIAfNDEfmWvkAZ2fRwWdeoUGOW7J4qx09iRSOY1FtC1hpFRgYtyirQv3F8fXq1
	dUXjlZY7ubeaKDmrF90pU601C1mHKlyNGxAawfCgM2HrW2Capk7bT18STelrlVRcQCGDFRDMaBv
	HjrPsx0zDYsKry3+Dv73eas+ES+OcVwLI0k6HixaVbve8sddCQ==
X-Google-Smtp-Source: AGHT+IHtEoJKmUalkAqnYfLWQZZGYmoLGxJQg28JsvyBQ+EeaUcWAKIPYLpm04Je/UzWyzE9mqSY3Q==
X-Received: by 2002:a05:600c:4e8f:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-43ecf81be20mr130447345e9.3.1744025350842;
        Mon, 07 Apr 2025 04:29:10 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a79bfsm12098345f8f.36.2025.04.07.04.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:29:10 -0700 (PDT)
Message-ID: <9264729152cb70ec910b391ab4ced82dc62f953c.camel@linaro.org>
Subject: Re: [PATCH v2 1/4] power: supply: add support for max77759 fuel
 gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	t.antoine@uclouvain.be
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau
 <dima.fedrau@gmail.com>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, 	linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-samsung-soc@vger.kernel.org
Date: Mon, 07 Apr 2025 12:29:09 +0100
In-Reply-To: <ocx5n42h25ztwo5twlir5zoajavpcxce2ra5jjyl6ae4qg6c3e@akhc3dylsprm>
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
	 <20250102-b4-gs101_max77759_fg-v2-1-87959abeb7ff@uclouvain.be>
	 <ocx5n42h25ztwo5twlir5zoajavpcxce2ra5jjyl6ae4qg6c3e@akhc3dylsprm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_042912_693759_2B294E1F 
X-CRM114-Status: GOOD (  25.36  )
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

Hi Sebastian,

On Wed, 2025-01-15 at 22:30 +0100, Sebastian Reichel wrote:
> Hi,
>=20
> On Thu, Jan 02, 2025 at 12:15:03PM +0100, Thomas Antoine via B4 Relay wro=
te:
> > From: Thomas Antoine <t.antoine@uclouvain.be>
> >=20
> > The interface of the Maxim max77759 fuel gauge has a lot of common with=
 the
> > Maxim max1720x. The major difference is the lack of non-volatile memory
> > slave address. No slave is available at address 0xb of the i2c bus, whi=
ch
> > is coherent with the following driver from google: line 5836 disables
> > non-volatile memory for m5 gauge.
> >=20
> > Link: https://android.googlesource.com/kernel/google-modules/bms/+/1a68=
c36bef474573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
> >=20
> > Other differences include the lack of V_BATT register to read the batte=
ry
> > level and a difference in the way to identify the chip (the same regist=
er
> > is used but not the same mask).
> >=20
> > Add support for the max77759 by allowing to use the non-volatile
> > memory or not based on the chip. Also add the V_CELL regsister as a
> > fallback to read voltage value in the case where read of V_BATT fails.
> >=20
> > The cast is necessary to avoid an overflow when the value of the regist=
er
> > is above 54975 (equivalent to a voltage around 4.29 V).
> >=20
> > The regmap of the max77759 will lead the read to fail for V_BATT and to
> > correctly use V_CELL instead. This regmap was proposed by Andr=C3=A9 Dr=
aszik in
> >=20
> > Link: https://lore.kernel.org/all/d1bade77b5281c1de6b2ddcb4dbbd033e455a=
116.camel@linaro.org/
> >=20
> > Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> > ---
>=20
> Please add output from to the cover letter to allow easily verifying
> that all values are correctly scaled.
>=20
> ./tools/testing/selftests/power_supply/test_power_supply_properties.sh
>=20
> > +static const struct regmap_access_table max77759_write_table =3D {
> > +	.yes_ranges =3D max77759_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_registers),
> > +	.no_ranges =3D max77759_ro_registers,
> > +	.n_no_ranges =3D ARRAY_SIZE(max77759_ro_registers),
> > +};
>=20
> Drop the yes_range from the write table. It is wrong and confusing.

Can you please clarify why having yes_ranges is wrong? Without yes_ranges,
all registers not in no_ranges are allowed to be written to.

Here, max77759_registers already specifies all the registers that exist
(and is also used in the max77759_read_table), and for write-access this is
further limited by the read-only registers in no_ranges.

As an example, register 0x50 doesn't exist, and without yes_ranges this
would allow write access to it.

If yes_ranges was dropped, all the information about non-existing registers
would have to be duplicated into no_ranges by inversing max77759_registers.
We already know the non-existing registers, and inversing that list just to
add to no_ranges seems non-ideal, error-prone, and just duplicated informat=
ion.


Cheers,
Andre'


