Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F470C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXfDibi8w/bQXYZthWjmECTTFnVjCMNNWxtrx741Ed4=; b=eXWHl5NeM0GW1Hpm10n+6XSpNu
	wvZzfnbDFPyRvl6HRW4K47G1zfa4MvW6OhTveP8rj5x1HidVAVWVX46BlmWPTT624Vmc9Kd+Baa+l
	blNIfEUtShdzmvbvRTt3ReaO7ZtNJQgcT+zUcYSJNA5yfX0o+87Qx7s1/yxsj/4WQsoLY8YCVOTel
	pJeWjRFheUF9tUsx+aI+byI7YurvySrzjPLrRo89D20jc6+kUmsQlVh2GX3aJwHt6KTc6/DTBlNrA
	sykV1Np5e9NTk5fXM65FcfnC8AadhOSpD1+TOeB0Ryq+JEKV7eHr7y+CnrTpwccix0ZpS/4xxQ60b
	TvnLyhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaB5-0000000EoOz-0Fpe;
	Fri, 07 Mar 2025 16:03:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa5x-0000000En8k-2ixO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:58:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42CA9A458DA;
	Fri,  7 Mar 2025 15:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F21FC4CEEB;
	Fri,  7 Mar 2025 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741363120;
	bh=qIjEQRPaB18kefxL0AfkJKEKomtj3Ay/2qC0bYTJ9GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPyVWWfOwbo7R7OEgpGaAJMpK16OGzfnWJHsl0XwAQHcN/O9BR61XjSv2xvVEydn8
	 ntM7iXqKuNl8aVZVwGBLggTD+zczblQ4MVK9yL64kAwNZmusOl21kjI41FxMjuR1hN
	 wbCQ/W2/xrSajNoez1EgPJDRf/XAxaKf6yIfUuZgCX0wrT4kFkefJAicHqp/Uygcro
	 aurEoQ8+5p6RKccxdrWwfzlVuYRt+tIjdNbp0Emvn3kgPIDiuohZmjerf7PxD5BNR7
	 cfrFuzO1Z3Gcz2iM3TH8dRDZLFZ4Mg9LxEsgN5Z0i9LU8JblUfg9zsEr1BifqvaxSA
	 f967i5gFC0eSQ==
Date: Fri, 7 Mar 2025 15:58:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <linux-iio@vger.kernel.org>,
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: adc: Add i.MX94 and i.MX95 support
Message-ID: <20250307-county-dissuade-eed621016369@spud>
References: <20250306170825.239933-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KXsyaRMt3FIL14G8"
Content-Disposition: inline
In-Reply-To: <20250306170825.239933-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_075841_775686_5D2AC0B1 
X-CRM114-Status: GOOD (  14.45  )
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


--KXsyaRMt3FIL14G8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 12:08:25PM -0500, Frank Li wrote:
> Add compatible string "nxp,imx94-adc" and "nxp,imx95-adc", which is
> backward compatible with i.MX93. Set it to fall back to "nxp,imx93-adc".
>=20

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/iio/adc/nxp,imx93-adc.yaml       | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml=
 b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> index dfc3f512918f6..c2e5ff418920c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> @@ -19,7 +19,14 @@ description:
> =20
>  properties:
>    compatible:
> -    const: nxp,imx93-adc
> +    oneOf:
> +      - enum:
> +          - nxp,imx93-adc
> +      - items:
> +          - enum:
> +              - nxp,imx94-adc
> +              - nxp,imx95-adc
> +          - const: nxp,imx93-adc
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20

--KXsyaRMt3FIL14G8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sXqgAKCRB4tDGHoIJi
0sW1AQDC/Er748sapxFMd23satNd1nUEpiuLsDDeYVNHhH7FaAD+K4ncLXN2PlXH
N/Yu5AqvnRZT54ZbMVn+FGE+3SLsRA4=
=SPaL
-----END PGP SIGNATURE-----

--KXsyaRMt3FIL14G8--

