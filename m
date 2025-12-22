Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B85E674B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDtdE0Cxu7Gss8LSXL9OkFlTQfXFyy8lzvBUAY3ZMaw=; b=Qg8EN/8yBjmdpr0cttRouVPUDb
	X9AJ0oNGTMwHHbvTLjAY+7oJonsTub1395xQyd2cueyuo8Iqod8Ya9Bv8iZk2wotIMUsoUp7KSCSF
	OYwP3njQvcE27pxK7QTI9/mGx6hZ8wPBDA6L0EBnaiEo/Asd6EE2rzSFvN/l1y4PZKVTFpZGKWCIh
	mcEBfqeLNnsGgg3NQeNvxdD0zrsZowMdo3iTmLeLpdZ+DJZ8uW5G2CiHBJCVYbaaGzh1ItPfYifGZ
	tFI4kDs/RY8QUv/zxegyoeR8I4SoO10SKa23pZgeFdnkpxhIpmUu0tBzwNauomlZgLES1vKMJuXhi
	CWOBB13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXh4I-0000000DsRa-42Q5;
	Mon, 22 Dec 2025 14:39:27 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXh4F-0000000DsRD-46EW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 14:39:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0834769f0so39632115ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766414362; x=1767019162; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RDtdE0Cxu7Gss8LSXL9OkFlTQfXFyy8lzvBUAY3ZMaw=;
        b=rGTdTBRjIPxTXX/uk79Uris9ElUZ6SyQDQy0lxbS5OsG/hgNhHSwJwkvHbV7vE/dOY
         k1LLVcWNV2izFWW8siHg8tCzapY8g10HPqswcNJAYURkMLHmG38kfJ3akpkIacIZfFO+
         6m/BfxltjGyEeJgKih/9R1/ZRSLCxpGF8iARAVvVOiYJ07yVVXm9HEf66o2/8ndoXrGX
         a8IeynknjdUlz6BHXrIOASHm8VQ6fQWowxFsF9CffFIAdQg1boVaLo5l1/kpSyjz/FOL
         JymfBjOMaQad7zK6XlW3NT/m9pKKyjTRiX9E1E3kgePDq+EXc+dSE+gkygV6t0W/l7tM
         bWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766414362; x=1767019162;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDtdE0Cxu7Gss8LSXL9OkFlTQfXFyy8lzvBUAY3ZMaw=;
        b=QQbBwoH7ZjnwR58X/JphAP5I5h3TBcnxO78G2SiHsdQxp/klv0zL7nOtBVDRpUl1u4
         hu/kPLRHiTP+UEH/JTcqc9iPjwmPerKLpBnXpiplAUbUXShj9Z1whLBkpICo4LLM1q2e
         3iUcXI0x2ANNFFJd52kHWpqpa5OzJozqmt8CaQYFZfJD7Wb68cEoWnmLHqeruSWShqcY
         kvICEQ2j4/F7yPXEMG1jGP/dKylFjeuB5duPtRl1Uj4gN04lv48Xzwu8AfXcr6Mvuqpx
         mSPT3ZdeSDMsaOunNCq3jK361VCNMNhc90ARlJznTHs0h1m53+bw94ze4i7n/p6NIxKR
         ekoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlVodgv0dK/O4rjD6EjJsvaJMMgfiIqDZ9WvvQAFBALPvUbZcipq/butYabzgoGuYrHb8n1vNDhrgHRqVYBFw6@lists.infradead.org
X-Gm-Message-State: AOJu0YzUoijzZwlUnTQhcTCwSn+XQsppKDXOEsH0Bkir+hPsjTFuvdk3
	2ARJLzdco3kUeU0perQHZvr/khTER6QgALq5xKRyGRVHKLkw3BFiD+GHmlIm4ju2ZwE=
X-Gm-Gg: AY/fxX5ZBnj3yWZ6CXkxIyIf7QYvnMBuDj8OkmhELbpL31664s3MFDESfemmZpQbXYa
	SfCk4CSYfzVWZrhhbLEdkgmEZtPOxWQIkkREP1oWK0uLFtCqcQJhGKpnxJU0DsME1qMLmHy6pKf
	27v+Ym9T1ToRmKXDI24Dq9ZBHV4ZetlN1j144hil07sAp5FbUikj2JuCnAl+FWkLclIaskOwEx4
	4RAGAGhRynKWLVNCHFhyx0xcTGmj3cnVaZLSu7ZY1XnLCk2eJs/cEDvDCesheabrRvEZyryBuR6
	Pf5hSI5V3xqYMwOsi3vv0DYp99PLizNBAB8m3LaxD991qQyx6S1v8v0QK9RYPGBWSmIvUbaUoXl
	A0nK6GuAUJ9qnlovuFxrFi6zDdnjYlSDNI0+9b4TJbrqESoCaSXMauQ/27GGOAUJ0sTxqh+a9qo
	Pe3kCCueMtHnIDTV9YKA==
X-Google-Smtp-Source: AGHT+IFT0I8sDRtDf0BsCDJnVlRiRHCTAs1BEHb9zVVMfBwunpVujshPU39ZkSJmVXwxlUzcoBFaJg==
X-Received: by 2002:a17:903:1105:b0:2a0:f83d:c321 with SMTP id d9443c01a7336-2a2f23289cemr104685085ad.23.1766414362089;
        Mon, 22 Dec 2025 06:39:22 -0800 (PST)
Received: from draszik.lan ([212.129.78.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d77566sm101023635ad.97.2025.12.22.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 06:39:21 -0800 (PST)
Message-ID: <a7af16e25ad6403e867a32d9d0f26931ac40199d.camel@linaro.org>
Subject: Re: [PATCH v3 5/6] soc: samsung: exynos-chipid: add
 google,gs101-otp support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Mon, 22 Dec 2025 14:39:20 +0000
In-Reply-To: <e9a39590-39ce-43ae-8f44-1edd137d4ade@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
	 <20251120-gs101-chipid-v3-5-1aeaa8b7fe35@linaro.org>
	 <653202f78f060b7e001b78604dd26d0f18ab76f9.camel@linaro.org>
	 <e9a39590-39ce-43ae-8f44-1edd137d4ade@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_063924_024391_20A7728D 
X-CRM114-Status: GOOD (  19.33  )
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

Hi Tudor,

On Mon, 2025-12-22 at 16:12 +0200, Tudor Ambarus wrote:
> Hi!
>=20
> On 12/19/25 5:10 PM, Andr=C3=A9 Draszik wrote:
>=20
> cut
>=20
> > > =C2=A0static const char *exynos_product_id_to_name(unsigned int produ=
ct_id)
> > > @@ -93,19 +99,53 @@ static int exynos_chipid_get_chipid_info(struct d=
evice *dev,
> > > =C2=A0		return dev_err_probe(dev, ret, "failed to read Product ID\n")=
;
> > > =C2=A0	soc_info->product_id =3D val & EXYNOS_MASK;
> > > =C2=A0
> > > -	if (data->rev_reg !=3D EXYNOS_CHIPID_REG_PRO_ID) {
> > > -		ret =3D regmap_read(regmap, data->rev_reg, &val);
> > > +	if (data->sub_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID) {
> > > +		/* exynos4210 case */
> > > +		main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> > > +		sub_rev =3D (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> > > +	} else {
> > > +		unsigned int val2;
> > > +
> > > +		ret =3D regmap_read(regmap, data->sub_rev_reg, &val2);
> > > =C2=A0		if (ret < 0)
> > > =C2=A0			return dev_err_probe(dev, ret,
> > > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to read revision\n");
> > > +
> > > +		if (data->main_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID)
> > > +			/* gs101 case */
> > > +			main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK=
;
> > > +		else
> > > +			/* exynos850 case */
> > > +			main_rev =3D (val2 >> data->main_rev_shift) & EXYNOS_REV_PART_MAS=
K;
> > > +
> > > +		sub_rev =3D (val2 >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> >=20
> > The above looks a little fragile, comparing register offsets between di=
fferent
> > hardware platforms and macros, but I guess it works for now and isn't r=
eally
> > much different to before.
>=20
> Right, I thought we'll get this in faster if I keep the old style.
>=20
> I can introduce a drv_data->get_chipid_info() method and add methods for =
exynos4210
> and exynos850 before adding the g101 support. It duplicated a bit the cod=
e when I
> tried it, and I chose to keep it as it is now. Happy to switch to a drv d=
ata method
> if you prefer, just say.

The above was simply an observation, and as mentioned it's not really worse=
 than
before, therefore OK to leave from my pov.


Cheers,
A.

