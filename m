Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A659BC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 00:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hK3/YoAMvoXAZDEfIf/TYO2O6uZpBKymxwJqiOWbu9Y=; b=pJzM1lyAcX1eybNonfxJrPgG23
	dj1r307FZSToMCYMtCeW4tyqqRmP2nTP5G2hkmeZO2GFJHDtR721AkEVpVEjPEULvZFiTs1ouFYvA
	BcFLbpU+9kKvQx5f4g0RCU052Hn/QEqdhcBlXfJ1BBZi0Fuih6xYonNT1Yr3tVd6uLkB5N0WyWbwx
	yseIHf1SFe+JUJB+XNtf1QLDFVaT5Y1RcaRK+fonxIpQth/pEuSCs5harve9G9u+UyxrnBIIhNL7z
	5ogbEwrBTGYOAGVx/bzO3d0r4dUrcPm5L42CxQJkve4tpUVoqbLtoi0vuC2SPfu80nsQdmvMQJD1R
	Qpte5yog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vT0-0000000BLap-3tob;
	Wed, 30 Apr 2025 00:38:26 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vR5-0000000BLDF-0PJw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 00:36:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745973383; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H3JJHypUQOVgdDfIyINlDO+T3T8pgcKK4rpLa8zV/zuMRnzlz+mSSIEp+mTjXQ9rBJ3zTxXGFA5MsqF3hWZ5uleu0tS95dmawJSgCp5YhpP0VSruKGyjqYRVwQi0svLfo8lIcPUbBGAYl6LoTimtU5KhukZgW2T/5WQkCmXp/00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745973383; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hK3/YoAMvoXAZDEfIf/TYO2O6uZpBKymxwJqiOWbu9Y=; 
	b=c6WQSZFQxMr4+YitII0dvr/8bwvE9itPaUSrjJpDv5ck7f/xH7i43Hjgov0KLJ8HT8A66sbX/oLYS8jBjkf1+JojXuG5eS4E7TNTcLsCg5pQs/eTO/Aw4gVA1Lj390miRa0Hg7l7mvt3ni0DelH+MnlYkagNRYH/OSq/s2s6NVY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745973383;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=hK3/YoAMvoXAZDEfIf/TYO2O6uZpBKymxwJqiOWbu9Y=;
	b=kHidoBV9B3JKdv7XaNbJE7fEcDHVLTtNG6bqiBqrAKcuwwMRGdZexM6QVTD7oHYo
	OzU63VKrPxu7BVT+TPZYO7f/OFbKCDu/JcjymeHrvGYuUw2v1AmcEuUIDKEnOBHIejo
	RjTKk9W3MsARgRXc59zFCFzXxp6tlAfmiIrir3QM=
Received: by mx.zohomail.com with SMTPS id 1745973381320911.9802408377296;
	Tue, 29 Apr 2025 17:36:21 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 476D9180E71; Wed, 30 Apr 2025 02:36:16 +0200 (CEST)
Date: Wed, 30 Apr 2025 02:36:16 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: t.antoine@uclouvain.be
Cc: Rob Herring <robh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 2/5] power: supply: add support for max77759 fuel gauge
Message-ID: <ieh6g5m4oectmje2gowa6rl2blzjuovjpyd3cmbvoql4qn2c7m@2osiwclwxi43>
References: <20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be>
 <20250421-b4-gs101_max77759_fg-v3-2-50cd8caf9017@uclouvain.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtpgzvtcmnguzlm6"
Content-Disposition: inline
In-Reply-To: <20250421-b4-gs101_max77759_fg-v3-2-50cd8caf9017@uclouvain.be>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/245.962.17
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_173627_218345_C85BB73C 
X-CRM114-Status: GOOD (  23.87  )
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


--rtpgzvtcmnguzlm6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/5] power: supply: add support for max77759 fuel gauge
MIME-Version: 1.0

Hi,

On Mon, Apr 21, 2025 at 08:13:33PM +0200, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> The interface of the Maxim MAX77759 fuel gauge has a lot of common with t=
he
> Maxim MAX1720x. A major difference is the lack of non-volatile memory
> slave address. No slave is available at address 0xb of the i2c bus, which
> is coherent with the following driver from google: line 5836 disables
> non-volatile memory for m5 gauge.
>=20
> Link: https://android.googlesource.com/kernel/google-modules/bms/+/1a68c3=
6bef474573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
>=20
> Other differences include the lack of V_BATT register to read the battery
> level. The voltage must instead be read from V_CELL, the lowest voltage of
> all cells. The mask to identify the chip is different. The computation of
> the charge must also be changed to take into account TASKPERIOD, which
> can add a factor 2 to the result.
>=20
> Add support for the MAX77759 by taking into account all of those
> differences based on chip type.
>=20
> Do not advertise temp probes using the non-volatile memory as those are
> not available.
>=20
> The regmap was proposed by Andr=E9 Draszik in
>=20
> Link: https://lore.kernel.org/all/d1bade77b5281c1de6b2ddcb4dbbd033e455a11=
6.camel@linaro.org/
>=20
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---

[...] (I actually skipped reviewing big parts here for now)

>
> +		ret =3D of_property_read_u32(dev->of_node,
> +					   "shunt-resistor-micro-ohms", &val);

device_property_read_u32(dev, ...)

> [...]
> +	ret =3D of_property_read_u32(dev->of_node,
> +				   "charge-full-design-microamp-hours", &info->charge_full_design);
> +	if (ret)
> +		info->charge_full_design =3D 0;

This is not in the DT binding and thus not allowed. Also I will NAK
adding it to the DT binding, since the following should be used:

Documentation/devicetree/bindings/power/supply/battery.yaml

followed by using power_supply_get_battery_info() in this driver.

Adding this support is probably a good idea, since it allows
providing all kind of static information from DT and you are
missing the non-volatile memory part from the existing chip.

Note that the power-supply core will pick up and expose any
of these properties automatically.

> +	ret =3D max1720x_get_rsense(dev, info, data);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to probe nvmem\n");
> +		return dev_err_probe(dev, ret, "Failed to get RSense\n");

You can either drop this error print, or the ones in
max1720x_get_rsense(). No need to print two errors.

Greetings,

-- Sebastian

--rtpgzvtcmnguzlm6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmgRcHUACgkQ2O7X88g7
+pr38RAAli3tEyqc3Bn8PtcS0cq4gr4uF1+C324fGggdQXPZ90bAI8CWsbLw8C1b
0mO8/EYAUUBUXjdX4QT9KdqKm1egLwCS4bj3yujtI7aZtyjWdryxMpwroqfyFqa+
tdxOlbJdsiQ12m0OFQvM8kUCD7L1JPeXe3HQGrXCu5ZdwnuPTMGog/1QToMIQ6Ga
c6T8lC7umvxS+HCzBkt7NqEVnRUytsX9z8E8dsF3d1lStyYHNs/7hIdM9naVBjtH
GThQMIeBhK+VBfh77Qh5HoD4yt9UMw0o05P8ktDg523eWT64y617vPun1fRwkhct
Zi2nnbiHMO1oEQCVV63DAvyut8qwtBxr9X5Hqfa5AWdea5z8HQmN83SJJq7K7H4G
dHPdDMSfrHd/djdlOqcWbT3Iddrxh8qcK0z6ED0h7JhS0jseGjSkyUWs9kgAV6QL
KMTDWiM6qfw62Azq4Wo/koblAhpNXvvWQFYob2QNalIgRTpBImbxO5z0nXcr35Dv
2xIOsE6kLVYG4CmfrP6+G8lz5PLsiNsH19hBqVFZ7WLxRjpbCv3d8jhDMzSTmItg
5kPSQnFL9eQBjHFOfOa0Y0Ln9j5ZcVMJdVZNPOATS14o6cxmhCWdTImjoxJc7yHa
W4MRbTEvhpWVR/w8WlV9zqlhjwTr/xHnJVOrqq3ds5eRjPaUTJ8=
=aGOF
-----END PGP SIGNATURE-----

--rtpgzvtcmnguzlm6--

