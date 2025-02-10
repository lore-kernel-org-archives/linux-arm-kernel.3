Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0081EC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJb8bkauCDhTBOcu8X/HjYqi4iRH5JJNhU2FKZwS+C4=; b=i/FA8z2kebX97FzESbmLxst8oL
	eAYetJFrjkN5Z3J/Pf8hMT1zBNGV8rZBOTBs/v9vwcuT6qDqK3z6mSijrr+KPyXRro9cVDXllbuAY
	z6yP4MwsSx/OAVC5iofJJTPmVyT9hkhUldFf3SajB7kgqsIKwh74eBD4QjPwBNXMVPLQlpGHLfrSm
	9irQEIvXyyMtcOpQp1pprmKH4PDcnNJZryYF7Bl2rUBphmzPLKNzEovQUxNuOphHPgAkfO2mCTAY3
	vIkRe122OMny14HgHly9ShI/nad/8SgA01KLOn1ZcmpB1FR8d0tLaEbrGvrG28h5GCrRD9BGl4j2u
	svXB/Nlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQm9-0000000GwpD-2VKg;
	Mon, 10 Feb 2025 10:12:25 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQev-0000000GvJx-1kUM;
	Mon, 10 Feb 2025 10:04:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81F17442A5;
	Mon, 10 Feb 2025 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739181892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJb8bkauCDhTBOcu8X/HjYqi4iRH5JJNhU2FKZwS+C4=;
	b=djT9CY5JnUvFf4Rd2gWUzxSrpbB9MCYbNvoDPDv3FKOuTwvv6X4g3AhUpMHjJGjPo+jlpT
	AFI4rCoyH7VDsFmSSLDgWxOvgrTa2MXWWNcxzHtFjeExYlOp6L2k+rBjgelQmnk/g0zQtD
	y0ICAmmzdAoNV28D6kuxTkA25Xcy9ZH/UsaVbVUDFwQO9cIgrcxLYnogyAsCzKhoJEXSLU
	vQZB2QqhFD/u3H3VrVOvEFisMee4/6do/wEPOBW8Tgc1aWrDkzNSBMedbrFWSSSLvzM9Sc
	5cKP5ReoDV39Zvz/uAhIBDkwUs8i3D7b9cslvpUazE6Cq1A+/fEweUAhsoDVJw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 2/3] net: stmmac: platform: Add snps,dwmac-5.30a IP
 compatible string
Date: Mon, 10 Feb 2025 11:04:40 +0100
Message-ID: <5868742.DvuYhMxLoT@fw-rgant>
In-Reply-To: <20250209013054.816580-3-inochiama@gmail.com>
References: <20250209013054.816580-1-inochiama@gmail.com>
 <20250209013054.816580-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6136790.lOV4Wx5bFT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieekkeffvdeugfekjeegfefhvdetuefhtdelieduheeileduledvteelgefgffffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhos
 ghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_020457_845902_17C414D9 
X-CRM114-Status: GOOD (  15.03  )
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

--nextPart6136790.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 10 Feb 2025 11:04:40 +0100
Message-ID: <5868742.DvuYhMxLoT@fw-rgant>
In-Reply-To: <20250209013054.816580-3-inochiama@gmail.com>
MIME-Version: 1.0

On dimanche 9 f=C3=A9vrier 2025 02:30:51 heure normale d=E2=80=99Europe cen=
trale Inochi=20
Amaoto wrote:
> Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
> to define some platform data in the glue layer.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../ethernet/stmicro/stmmac/stmmac_platform.c   | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c index
> d0e61aa1a495..8dc3bd6946c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -405,6 +405,17 @@ static int stmmac_of_get_mac_mode(struct device_node
> *np) return -ENODEV;
>  }
>=20
> +/* Compatible string array for all gmac4 devices */
> +static const char * const stmmac_gmac4_compats[] =3D {
> +	"snps,dwmac-4.00",
> +	"snps,dwmac-4.10a",
> +	"snps,dwmac-4.20a",
> +	"snps,dwmac-5.10a",
> +	"snps,dwmac-5.20",
> +	"snps,dwmac-5.30a",
> +	NULL
> +};
> +
>  /**
>   * stmmac_probe_config_dt - parse device-tree driver parameters
>   * @pdev: platform_device structure
> @@ -538,11 +549,7 @@ stmmac_probe_config_dt(struct platform_device *pdev,=
 u8
> *mac) plat->pmt =3D 1;
>  	}
>=20
> -	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
> -	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
> -	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
> -	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
> -	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
> +	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
>  		plat->has_gmac4 =3D 1;
>  		plat->has_gmac =3D 0;
>  		plat->pmt =3D 1;

LGTM

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>



--nextPart6136790.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmepzzgACgkQ3R9U/FLj
286J5g//fmDyVJafzX14tHwfj8aI+uwgNu7ZJxduC9DnxnYWy+EN+dby2S6/rlPN
T4ypshgRrmYqPoji5FJKurYu3LHwUE/V8N2z06jexZaWXA8/VW+aNUkHoIbyHHko
fYFD4Op0fKrWBGBHR+Hj8qJv2QbWFBc8vo4Swzk3PjbzLTx36g3gFWb/CUkP569I
12TrG1wPA0ZBtugewKlLSdXOFVtDqsh0mTfCpQ8dsRjTc4TrVrcFDaxIW1aENksw
0SIncY9LUMPnCW+IHHB7E8Ln6y84/ipUGsySMvtUOg/cnobji2ehcScRVh+QpuZQ
L/P1dWf83kE5M1Kll9HPhs0R1qtrK2bWAaBamcDl79AW6c+4MPdBPxk9gaQmMuov
/tiHVI0LagpoFV+Y/hXy7mMMRmqLAhlwwkmNiJuzYPnBJOReYcJ5kJ4QvCr+n0I9
YQ+zLGBWxvi0aQk8p+qh8a6VZ+8I1aGmjGDluy9M+7f1wl1Rj3RMOOL8G86M4ZxD
BnbNszU+FrI1fZObie8NsvvQwunu/bJcR1Mhn9RcyVcc/b6bIpAekcjcctz07P7B
KWTz8PjEv0dHTX7k40Lr9GhZjKIQeVR3YMCNjzqvANzcCeEcSnnIY/r+U/hpK5jp
ShGT0E6pno6LqL/YVkx+G1N/T736ljcC/BCLeQvGusrPc6Md3Aw=
=KCpu
-----END PGP SIGNATURE-----

--nextPart6136790.lOV4Wx5bFT--




