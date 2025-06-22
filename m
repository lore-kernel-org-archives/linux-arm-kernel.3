Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A605C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 21:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6QYFg9MZSJaPba+bOOJAjvKweuKxu9aNrA+7HlGnWA=; b=hRGdvb5G/xLiBfzjaJcUvswUhM
	aFxuhgSYFLKR78enR74RoNkNuoWm1gezBY2Ij6T1dNQulrfKAc/aaY7p+EBR2zJ042pTVVnU+nnzU
	dEIi3fifY/0h6g8fwiAkbYeFbX3TK6zEOXWOTrVtSAe3DuAHj53OIZZA2vH/6GOv95rJQ2+8ctnRh
	HbCt1Th+esFXUyT5o0BY1/WechB7mauQuKfiO2brjb6wDLspqzCU5HIHjU1jy1EfD/PhM1TSDtTbT
	LONdwTe7D/ZOWU0oowCjHvE6BIeATlBm7ELQvQN0OJg11ZwBBQsZrCloTjDi6erV41TtVOSfVBSMF
	F7rrRpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTSEu-00000001EYu-0S9M;
	Sun, 22 Jun 2025 21:28:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTSCb-00000001EU1-05KC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 21:26:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750627568; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J8awfYP+dAADLyOGNe0XrnTwqwf4Fx9cDswv9VC3aciGetXBJ8qEnVtJV2qmW9DwjZSoJ7k0iZB2pBGPyBf2sviR/qsUm0TxjHwzn5N3NywEe7pVie9wi4kNFzki9S9Y88paZklzmSSOj219tdkR0f5lxbTxQy0j8IAramk4jKM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750627568; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x6QYFg9MZSJaPba+bOOJAjvKweuKxu9aNrA+7HlGnWA=; 
	b=SiYwLc1Po94YTarK/yMFSGCtwjgNLvYbgblPhBC1Pxgh+7j6BCXP+n+fJUI0aCliv0BUuFUJXQcQCj4lxLnvvcpgubzbI6QU2EXj+sQz07nUrIj6QvoEaWroT09/xRB0HKro1ypb+uOATmhpc3Z/gZp3inDQjMmL8XMMWp1cpvM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750627568;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=x6QYFg9MZSJaPba+bOOJAjvKweuKxu9aNrA+7HlGnWA=;
	b=iJUViihHNXpXsTjxi70EDTSmnFYmOpdjGnH6to6ZLrituZOKCJNEFAhO0NmXp2ea
	o0Uysj9wgCxUPkvuuuGUae6SRxupTMaTVgDtcYeNZcW66+lAdxzEuckzBFEmsfm1nKL
	GlNdkIsLmJ+jD6gCvqK5a80JVpZ9Cvc51Qh7A7W8=
Received: by mx.zohomail.com with SMTPS id 1750627566650272.8188357692733;
	Sun, 22 Jun 2025 14:26:06 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 8B069180957; Sun, 22 Jun 2025 23:26:01 +0200 (CEST)
Date: Sun, 22 Jun 2025 23:26:01 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: t.antoine@uclouvain.be
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/5] power: supply: add support for max77759 fuel gauge
Message-ID: <4cahu6dog7ly4ww6xyjmjigjfxs4m55mrnym2bjmzskscfvk34@guazy6wxbzfh>
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
 <20250523-b4-gs101_max77759_fg-v4-2-b49904e35a34@uclouvain.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oe6ecr6a3aggzpmd"
Content-Disposition: inline
In-Reply-To: <20250523-b4-gs101_max77759_fg-v4-2-b49904e35a34@uclouvain.be>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/250.624.82
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_142613_137220_B945A4BF 
X-CRM114-Status: GOOD (  24.21  )
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


--oe6ecr6a3aggzpmd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] power: supply: add support for max77759 fuel gauge
MIME-Version: 1.0

Hi,

On Fri, May 23, 2025 at 02:51:45PM +0200, Thomas Antoine via B4 Relay wrote:
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
>  drivers/power/supply/max1720x_battery.c | 265 ++++++++++++++++++++++++++=
++----
>  1 file changed, 238 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/power/supply/max1720x_battery.c b/drivers/power/supp=
ly/max1720x_battery.c
> index 68b5314ecf3a234f906ec8fe400e586855b69cd9..c9ad452ada9d0a2a51f37d04f=
d8c3260be522405 100644
> --- a/drivers/power/supply/max1720x_battery.c
> +++ b/drivers/power/supply/max1720x_battery.c
> @@ -37,6 +37,7 @@
>  #define MAX172XX_REPCAP			0x05	/* Average capacity */
>  #define MAX172XX_REPSOC			0x06	/* Percentage of charge */
>  #define MAX172XX_TEMP			0x08	/* Temperature */
> +#define MAX172XX_VCELL			0x09	/* Lowest cell voltage */
[...]
>  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
[...]
> +			ret =3D regmap_read(info->regmap, MAX172XX_VCELL, &reg_val);
> +			val->intval =3D max172xx_cell_voltage_to_ps(reg_val);

I haven't reviewed this fully due to all the feedback you already
got from Peter Griffin and the DT binding being broken, but something
that catched my eye:

POWER_SUPPLY_PROP_VOLTAGE_NOW provides the voltage of the whole
battery and not of a single cell. E.g. a typical Li-Ion battery
with two serial cells has a nominal voltage of roughly 7.4V while
each cell has just 3.7V.

Greetings,

-- Sebastian

--oe6ecr6a3aggzpmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmhYdOIACgkQ2O7X88g7
+pqIpQ//aah0Ve9/wmkexuWeuXsLJcLZfrr/02nM1RWHE9+xqx9amUZmJmRHiw4E
43m7GZdks18Da8+Uqc7YI9ukBpOoabCt31kevyHGN3h5QqJjK9MuN8UQKnAkxYra
k2Unu1pmXMnfrQOACQxlkjqal4vmFvQBjNsbmM3D+ucTVyUhYZrikzclRCHgpl+L
f1mDGGPKbl5vxBp3Ij/b8uVJ0zZqrnZ0uirhxtqAZxVW0TY5uLv6BtS48eXkCcoI
9Ia1XkzJTM/ym7isTN76/fYFpSaJpou8iGF01+X+Jij4A4JY3Frqw1gOsFCfPk1o
XT6b2Vzh0fq8o0RVyw8IMgXZJsS5RWuY+HIyRAY60EJZ1uO1VSUCCZnEB9HMnxin
SfO/qmJ5uRQGzlowAiIJLaiPxAPPVc6MFBMC+NV3R1xstdZS7+DVGHroEz0Bhyqi
oOBrVfEW0d0lkaj4qZz/KQMICEniCN6qKfRboh2bRzP85j/dkGbGDbzjNC+7T9UN
A0DJdpawEUyTv3FXkkm0ehoFWkRc9EKwkEh1cug0zbhflXONXsfyjol/Gy9ecgsZ
b9wyJu1CHEahpyPq9dOa4WGZH4D2etuBeuLEPq93FAk/WJBtk2eFQgmaKXJDIDcD
esMPKU0zXu5ZKjhsNJbDag5vwLtfUDrL+1/KcHgnKhZfjA3xevs=
=sQmb
-----END PGP SIGNATURE-----

--oe6ecr6a3aggzpmd--

