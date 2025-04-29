Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8257C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnjcBtyGIDTiKHQk3dUD9TDEJJzI09MCxpNuZkCGi9U=; b=EggefMjbc+VySmPlmv4lbDKoPr
	fCTBtC805pxAc9v0LXhY4MmMMN8tAqHxRNUyYRbAwXUhMb4yM6AkaVQjENOr8Rk2dDVsAQRGNeoJ9
	ws/aS8GFiHRu24TJi8zwpgSe1jUOspD6RvswqebjOyMtk5nPJQaCahkrVdYt9u75BBNArzy74HPZ/
	I0AW1+Zu0cO4E0qeiWGgIdjVkiaaDYWNnsLKMHBir6AI/AVnJ5bkCRiTGRmLJsJ6jyz+wzRrOl6Ef
	K7NdEVRRBSX33rVunQknIc6hpLf5Apc3GuRLsc1a9xn1D3uzCwTsjeMgKSZNaj7riWzWAvzdNab9q
	o9aIRNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9muy-0000000A8QG-46cf;
	Tue, 29 Apr 2025 15:30:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mbJ-0000000A4Kj-29St;
	Tue, 29 Apr 2025 15:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CnjcBtyGIDTiKHQk3dUD9TDEJJzI09MCxpNuZkCGi9U=; b=CFlLCNXMwE7VorssBCcpH3p8gS
	j7jf6dalGfTvYs2j/kkKJ8Z2fHHRRPhrdhWHYnCsoNfdZZ6jl9tPwafUWBIKDc6YBtLSBY4y7SbhH
	pU8YtmQMD+Evt1PXvVA7oyWu4BmrG+aEer/6+HozDSVzKRKACckcIXfjvoToQKnaFRgQRa/5r8V28
	G713w0yowrzYP9NpWRpF+BaHFw11ELas3OpLWUc4+oonfxJ33mAfKmvSBowwRNHSzTPwwXciWj72h
	CkX8DrRcaCGj6KiCorfmarlYyEqW2/Pup5QrEKj7lqHNxoPRI/Z4dvVJEZEmeChBvJNeiYm93OcAM
	rvXOCU2w==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9mbF-0000000DQhX-43zQ;
	Tue, 29 Apr 2025 15:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4926A4B73E;
	Tue, 29 Apr 2025 15:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BA3C4CEE3;
	Tue, 29 Apr 2025 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745939418;
	bh=tH/b0H08UXNUu6dgbm5YvkwLd90cHvKfu0wgbJrpW2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hy6OqaRBXW2VArQAk0HkFGDWr69g/SzJsfJZ8IPR1Da5ckDhHLpiiUjgvvbO+3d+z
	 x6OyY3irDdVMdsLz93UdVfUuXLXt9ZAbakYx2C+aZr4c4Ht9M7eKlJE18cZ4+e8PfM
	 GI/Msv6SpjxgBS/1192R8lJEg7LYJPB9EVTCaBdSJsWFgdI+zpB/1LQK/WjxeVTvQz
	 SySUAwMTrdZQPKibhIOSLjq/dlrplor/hJGnfSBtKUcau3TUy64Nah2sllXE3kGObb
	 IWFx+2ZIX4B3VrYYkYCvDyMsMz7FhOd7svLyuOj755afscDhWwYdztPQR0zDf6d9i4
	 uWJG6YYSthiuA==
Date: Tue, 29 Apr 2025 16:10:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: imx8mq-usb: improve some tuning
 properties
Message-ID: <20250429-charbroil-easing-04f579c68a2d@spud>
References: <20250429033009.2388291-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6fwPel+VdaSrAtp/"
Content-Disposition: inline
In-Reply-To: <20250429033009.2388291-1-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_161022_292317_0CD095F8 
X-CRM114-Status: GOOD (  24.91  )
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


--6fwPel+VdaSrAtp/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 11:30:07AM +0800, Xu Yang wrote:
> Commit b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning
> properties") add many tuning properties, but some parameter value doesn't
> match the register description. It made some changes based on the original
> value: add offset to a negative number so turn it to a non-negative numbe=
r.
> However, it's not easy to find an exact tuning value from register field
> with such conversion.
>=20
> Because device-tree supports negative parameter number, this will improve
> some propertie's parameter.
>=20
> Mainly include below properties:
>  - fsl,phy-tx-vref-tune-percent
>  - fsl,phy-tx-rise-tune-percent
>  - fsl,phy-comp-dis-tune-percent
>=20
> The parameter value of above 3 properties are USB PHY specific. i.MX8MP
> and i.MX95 USB PHY has different meanings. So this add restrictions for
> them.

It's hard for me to understand from this if you're actually changing the
meaning of the property. Will the current/old values continue to
function as they have been?

>=20
>  - fsl,phy-tx-vboost-level-microvolt
>=20
> For this property, the parameter value is wrong in register description.
> This will correct it according to true value.
>=20
> For detailed info, please refer to i.MX8MP and i.MX95 latest reference
> manual.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> ---
> Changes in v2:
>  - keep widest constraints
>  - use multipleOf for some properties
> ---
>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 60 +++++++++++++++----
>  1 file changed, 49 insertions(+), 11 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yam=
l b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> index daee0c0fc915..71e5940ef4b8 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> @@ -42,16 +42,17 @@ properties:
> =20
>    fsl,phy-tx-vref-tune-percent:
>      description:
> -      Tunes the HS DC level relative to the nominal level
> -    minimum: 94
> -    maximum: 124
> +      Tunes the HS DC level relative to the nominal level. It varies
> +      between different PHY versions
> +    minimum: -1000
> +    maximum: 875
> =20
>    fsl,phy-tx-rise-tune-percent:
>      description:
>        Adjusts the rise/fall time duration of the HS waveform relative to
> -      its nominal value
> -    minimum: 97
> -    maximum: 103
> +      its nominal value. It varies between different PHY versions
> +    minimum: -10
> +    maximum: 20
> =20
>    fsl,phy-tx-preemp-amp-tune-microamp:
>      description:
> @@ -63,15 +64,14 @@ properties:
>    fsl,phy-tx-vboost-level-microvolt:
>      description:
>        Adjust the boosted transmit launch pk-pk differential amplitude
> -    minimum: 880
> -    maximum: 1120
> +    enum: [844, 1008, 1156]
> =20
>    fsl,phy-comp-dis-tune-percent:
>      description:
>        Adjust the voltage level used to detect a disconnect event at the =
host
> -      relative to the nominal value
> -    minimum: 91
> -    maximum: 115
> +      relative to the nominal value. It varies between different PHY ver=
sions
> +    minimum: -60
> +    maximum: 45
> =20
>    fsl,phy-pcs-tx-deemph-3p5db-attenuation-db:
>      description:
> @@ -112,6 +112,44 @@ allOf:
>          reg:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - fsl,imx8mq-usb-phy
> +            - fsl,imx8mp-usb-phy
> +    then:
> +      properties:
> +        fsl,phy-tx-vref-tune-percent:
> +          minimum: -6
> +          maximum: 24
> +          multipleOf: 2
> +        fsl,phy-tx-rise-tune-percent:
> +          enum: [-3, -1, 0, 3]
> +        fsl,phy-comp-dis-tune-percent:
> +          enum: [-9, -6, -3, 0, 4, 7, 11, 15]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-usb-phy
> +    then:
> +      properties:
> +        fsl,phy-tx-vref-tune-percent:
> +          description: 100x the original
> +          minimum: -1000
> +          maximum: 875
> +          multipleOf: 125
> +        fsl,phy-tx-rise-tune-percent:
> +          enum: [-10, 0, 15, 20]
> +        fsl,phy-comp-dis-tune-percent:
> +          description: 10x the original
> +          minimum: -60
> +          maximum: 45
> +          multipleOf: 15
> +
>    - if:
>        required:
>          - orientation-switch
> --=20
> 2.34.1
>=20

--6fwPel+VdaSrAtp/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBDr1AAKCRB4tDGHoIJi
0ih9AQDT8xFlp6KhPojdSp42RYiUGcj8PdnHv9paubx+sFlINgEAwKSNVrFiQ6Z0
NamP3TPzHWAbYTYUyslHKxgpO109Kg0=
=5BX7
-----END PGP SIGNATURE-----

--6fwPel+VdaSrAtp/--

