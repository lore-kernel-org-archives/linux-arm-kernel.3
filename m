Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA26C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C51iiAHVT3vDNfkeqXUJtAutZGCOhAHahDQm3Gape3k=; b=MwXgO/tr1DwcC0dVUby7ZbfxVM
	r63tys/h1B6G7LlF64H0bA57xggOByGXO17MLWcDQAsjj750nIMBBki1AjqafIY1lGfImTmxuDzYJ
	8ODBocIAZ3Xds7QcRVrQJG1XmcltygHyPwtvj6ch5D2YkSxTNvbYpBMMuePCGBlWBaL4IFD2Pus/L
	s0KtOsmEyveUiwqJkWlNbAVisfFzsYfj5Uso2nhmv240Z/NHNY4MfxXxnp7MdEFw6lOaH1OTUKbfX
	rxzeGZtkIhLtauY6yaxTo/gCnrQZ7AqJOcEGheXClG/liqjX6uNxqjdw2Ly15f50eel/tBjl9VvHM
	whfETfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ticHH-0000000Bp5R-17Q9;
	Thu, 13 Feb 2025 16:41:27 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibrt-0000000BiWJ-0yWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=C51i
	iAHVT3vDNfkeqXUJtAutZGCOhAHahDQm3Gape3k=; b=bmOGSEgvInf30Ab23XEB
	ZSvM8t2hj+wuVYy+0VNcnl2Oqzij9O9BDcizEid1xrPe7k69gHAyEm2scxbZqtY5
	iHCIgL/rNquBKNnhD92Qp+/pw6Hzbme+/ha9sgDBuO/vfR0cE3ZhdidUjsSzzGBi
	HH/AYcXyAlBSg5R1KHj0DnwdeyUYE6LChTeciXONrf/E9LCdoh8E8WN3p5ywLVf3
	MaQsIqeSFs0UoYq8E3Kgjh25qSBKuBMmO29zVpKBOFlauXvSZAv76qAIjRYbM4Rb
	z4cdCofFbykqrJ9wRQmS+zEJwB5kRX6VxkbmGtX3F7C0gwESETI4YGk8Vq0hoQq3
	AA==
Received: (qmail 1940101 invoked from network); 13 Feb 2025 17:15:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2025 17:15:09 +0100
X-UD-Smtp-Session: l3s3148p1@TtimXAguZMtehh99
Date: Thu, 13 Feb 2025 17:15:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 06/10] i2c: kempld: Use i2c_10bit_addr_*_from_msg()
 helpers
Message-ID: <Z64ajR7CSIDNmIKz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <20250213141045.2716943-7-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lJSRca1oCsfvYLnD"
Content-Disposition: inline
In-Reply-To: <20250213141045.2716943-7-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_081513_552824_648DB8DD 
X-CRM114-Status: GOOD (  10.22  )
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


--lJSRca1oCsfvYLnD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> @@ -132,10 +130,12 @@ static int kempld_i2c_process(struct kempld_i2c_dat=
a *i2c)
> =20
>  	/* Second part of 10 bit addressing */
>  	if (i2c->state =3D=3D STATE_ADDR10) {
> -		kempld_write8(pld, KEMPLD_I2C_DATA, i2c->msg->addr & 0xff);
> +		addr =3D i2c_10bit_addr_lo_from_msg(msg);
> +		i2c->state =3D STATE_START;

Any reason you moved this?

> +
> +		kempld_write8(pld, KEMPLD_I2C_DATA, addr);

Maybe we could skip using 'addr' here?

>  		kempld_write8(pld, KEMPLD_I2C_CMD, I2C_CMD_WRITE);
> =20
> -		i2c->state =3D STATE_START;
>  		return 0;
>  	}

--lJSRca1oCsfvYLnD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeuGokACgkQFA3kzBSg
KbZulg/+J22rNnR6Yu2i8QVlWFeEaAZKIv1ksHQrj0QpkW1k7ZiMG1gPZad043ax
Dn4VnOCgTDfMGM0tRO+RslfP8QwFNhi7vj6SNHq1b5AAzArl0EJMQJbxOku03Uw6
Rs6FZyjJd/9mdS64pjXBGpIrEqA032jxL0CgmMNZN8WXB4iJo4cUDkRnNHv8gY9Y
W0EPAKWpLDbDIHge/zTd+x547y7qQUsp8pV5+h2z6Nfgbd5/k27rE87/yxcTG443
nx0BtBAfODwujcrAhNXHyl/Q7eX4sImUOpz7wetHHAtIEioH3OOG4/D1Ggk1rtJT
eL3nlGxlIPJH0P1yZtvj++PTL5HYwXbCD7oTD6JEdy3+Lt9MXEpsKpTX6X9NNB3S
Fqz3Puo+Hd/2nPmJEIGuX30fKup7UO1a0b2e/AUoedNZGT1PpX8v/JIoqOvNU6I5
htn1IeaHh16BvSSZZQ57wbAXbv2Z52xRVH/bjO+HWT3TJ5yCIMeY1SWdfw1tZ6ri
palSy7QZgrvN7M2K+iymB+rhHrkDdHGh+NlgaEkW/kN2gDo/izjmQVFoXnH2vpMM
bADn9rxmbM6u3vVfJESnbE6sik3kSbykAj1E6JqWq9huA+vnGXmvbJL+jxTQNP8G
2G+F4nPACxsxrkJQIXA3m/1QZ6yZxp9KuKIcgGswsZpOLOlK5gs=
=eGZz
-----END PGP SIGNATURE-----

--lJSRca1oCsfvYLnD--

