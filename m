Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D231112241
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCTz2Ysh2ni8i/wHxDdjdc+WOFUVE1jvRrwe+xHpF0w=; b=NNN3KmbzsQRpL4lXtP3Axt6i4J
	53eunxHzKuzMAacvccAgIssFJzIAdr5lWTpMn1O5ayE5SJ6Jv/YMpSqGeg3IXQUe2vMVwg8XV6f2P
	jGylKuAhybvd1pXafAw4ssHnYvHQGjEQeqUrX3OcdllgjDBKFWwBzPoS6cu5Cac5pNpkdCLvS6ASn
	4iDRzaCbfDQ1zh6dny6+8oeAB1KVF6ctLAe1Vfg67Pa7FF1lTAPkLaIfvkEacROkVQyELMyYwPhIJ
	lssZqMXoGM/P9HKKiR8p3f0XLfm+0zMWZodpP25V84afyYksDC7HI2XK33P2BEuHi/B0F4u07P+xq
	g5DF3FcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84oT-0000000GR08-0dOd;
	Wed, 01 Apr 2026 23:17:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84oS-0000000GR00-0N5O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 23:17:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B625F600CB;
	Wed,  1 Apr 2026 23:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C86C4CEF7;
	Wed,  1 Apr 2026 23:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775085446;
	bh=AFBPE2tUaFJUYmw4MizZgV1dE/vXi61t6qjVrFPh5xE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0QG4vF8nC3zXT9W+JK932apg0tWqn55m2OYznKPKTIG1F2rW0Zi4G2CWZtkpEptc
	 SgD8rWW0ds4j2wf6M5YMxHTqL0+n736WQjPIVjAyz8fcq0Zd8e9OQKJY+d78QNGbAg
	 1fyM5CN4aAQUBWHBqkyd6VRfFGHqP+YjSk1V8zF9GQ6eZimvAebuu9IGXGQCCnl11e
	 yDSlf+pP12JtGbDNs7X2eAGL7pMOqiIElGErcJqWuegSqH5zUNn29xTE/vo5ZL81A1
	 arE44FBGR+GsiAxXkb504QUVFGUhGVxs6eBpHHeVMfkmJnjSdMCaTyI79ZOjnpmQaE
	 fFjLZN4//09Wg==
Received: by venus (Postfix, from userid 1000)
	id 9A506181F5A; Thu, 02 Apr 2026 01:17:24 +0200 (CEST)
Date: Thu, 2 Apr 2026 01:17:24 +0200
From: Sebastian Reichel <sre@kernel.org>
To: amitsd@google.com
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jagan Sridharan <badhri@google.com>, 
	Mark Brown <broonie@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v10 5/6] power: supply: max77759: add charger driver
Message-ID: <ac2jYUA2F5oQsA2g@venus>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-5-76f59233c369@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jtllgmysjjqf46tb"
Content-Disposition: inline
In-Reply-To: <20260331-max77759-charger-v10-5-76f59233c369@google.com>
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


--jtllgmysjjqf46tb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 5/6] power: supply: max77759: add charger driver
MIME-Version: 1.0

Hi,

On Tue, Mar 31, 2026 at 11:22:20PM +0000, Amit Sunil Dhamne via B4 Relay wr=
ote:
> +/* Charge Termination Voltage Limits (in mV) */
> +static const struct linear_range chg_cv_prm_ranges[] =3D {
> +	LINEAR_RANGE(3800, 0x38, 0x39, 100),
> +	LINEAR_RANGE(4000, 0x0, 0x32, 10),
> +};

Let me quote from include/linux/power_supply.h:

 * All voltages, currents, charges, energies, time and temperatures in uV,
 * =B5A, =B5Ah, =B5Wh, seconds and tenths of degree Celsius unless otherwise
 * stated. It's driver's job to convert its raw values to units in which
 * this class operates.

What makes you think that CONSTANT_CHARGE_VOLTAGE_MAX is
special?

[...]

> +static int max77759_charger_get_property(struct power_supply *psy,
> +					 enum power_supply_property psp,
> +					 union power_supply_propval *pval)
> +{
> +	struct max77759_charger *chg =3D power_supply_get_drvdata(psy);
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_ONLINE:
> +		ret =3D get_online(chg);
> +		break;
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		ret =3D charger_input_valid(chg);
> +		break;
> +	case POWER_SUPPLY_PROP_STATUS:
> +		ret =3D get_status(chg);
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_TYPE:
> +		ret =3D get_charge_type(chg);
> +		break;
> +	case POWER_SUPPLY_PROP_HEALTH:
> +		ret =3D get_health(chg);
> +		break;
> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
> +		ret =3D get_fast_charge_current(chg);
> +		break;
> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX:
> +		ret =3D get_float_voltage(chg);
> +		break;
> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +		ret =3D get_input_current_limit(chg);
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +	}
> +
> +	pval->intval =3D ret;
> +	return ret < 0 ? ret : 0;

As people like to use existing drivers as reference this definitely
needs a comment, that none of the properties used by this driver
support negative values. This is not a general thing as e.g. the
CHARGE current may be negative depending on the battery being
charged or discharged (OTG mode).

Greetings,

-- Sebastian

--jtllgmysjjqf46tb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmnNp4EACgkQ2O7X88g7
+pqRTQ/9GJQNOBRCUPdxAgEbXxqn4fVYD6kqeogAdgEa+OWX6WMXbEcqexLYkDIg
6TYG1jIZfgUiHU9L1IbHaWR7DMESCYrDE1LE82FkTE9eHrm44pVkuF+YZRh6mkci
EPIZRZYUrwO/PkbfmlXDZE1lyYnoKrwYSAFF+MKprcNwHSj5Fsk7627Mbejr14B8
g2iMAMLfIxvP1DH9mfmMrsj4drTfK6Jdi7o6l9jiib2szbCQcufiaazJQmybj/Jb
AXXODllyBB+WxwP9AEppVGx2/wayzl3SuGVJ57U0lvc+sJQex4KBSDNulrDXqtBN
9egXzVUO8MdF+kmI4koQiPhVenWiG45Aq8cN4vqqLLmf67ti5jssM+uyxSEmo/C/
kbZMt9BEsq6b/mS6tjxNDYS2U7inRoEILK7O1ZpfMfoU2Z+L9UGM5rIridEYA6RC
TVIIElfjOS0tpgIGu2oB7PL3xb3wBfRdhwWI5xSmP8FcPwTngBVAj0IwkuLEKYPc
dOXTpfIofc07gdNdRvdkkCAwoPE83exInZ0P+YxxhUaJ1MZULK1W/fUZOinH5TLY
c+VASpW+OUXyOYPQO8t5LBoc9hCVutONRXqnMM2RxyUPf35BFF2emJ6/9Kjr270H
PE6r1tb+UF+kuI2fBUG7zunqfLzmrKU3ZkPLCbdlUWBsvWKWrVo=
=sRb6
-----END PGP SIGNATURE-----

--jtllgmysjjqf46tb--

