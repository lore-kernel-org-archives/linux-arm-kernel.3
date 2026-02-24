Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7848AF4BB6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InI+bzv+ZgQ1ocvViYHGmCE3g91swjsvKBNHq5KMgdQ=; b=jCM6PkgQZpocBlHO1gAwUYnpCL
	lSNNLaeu0Gp1H4gcP4ugNhNzUoaxySu88VRA2+f68kqGlCNZNbs7gJJOTCap09qbswmrwPqjE5v7C
	MPJr3q2Y1Ud4cp5MPFoYRoIFsrrA6Mb9oB42K4GPNrtafesOWckbCHgo4nhf/8UKBtcQdm2cli+0F
	DkQ1VDLJV/DFFPbDpmCLUnI6svjxLUmtXFmT6HHaKaJYvhsz33+Olxq1/5n+XRuK3L1ubR0Yl64M4
	7sainQLTZo4I5EKn4s6l94M5/H+dAMQl1tXIe5hsDNFsb0D5h6MQqyvdP5/S3xFlBgM63CKe3pPCU
	DnfcTpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfD-00000002WQL-49l4;
	Tue, 24 Feb 2026 17:57:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfC-00000002WPj-1ZSo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 731896012A;
	Tue, 24 Feb 2026 17:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3EBC19422;
	Tue, 24 Feb 2026 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771955857;
	bh=TzQ9hiwv1duoPQIf+icd1+Um2qUulW1YjH1zN1xDt68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOR0QEC/BXqWwiRsLqCDj+hKFXDeCpDJKGEBro8VkPqauUXM1s+JWB2o4c6F+fk4W
	 pElZ2VQ29xEmb9FWjB0b3LoPJHPJT7gCTXCuvBkewtpLheh1CrihMi0Axw/xyjzzLt
	 iEDejc+3ttX5TEk0i+anE2bq3noshZ7hNuItGZC3JCy7HEyrhHRqo2UZvvZJx4UW1p
	 DZlOr+fBCJaHYFFzxxcUe6WcrPBCd9raWOYCTUm/qgIqCjJ5r+qYId8XYEgUaGZgjz
	 o6Gpx403ixbT90VYRmvTzGE9fzqDRhM9mmUt4HoY5UMqw1roWqliz+rw5w+cTMIgD5
	 /YHioJIPzBjDA==
Date: Tue, 24 Feb 2026 17:57:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: fsl,irqsteer: add
 S32N79 support
Message-ID: <20260224-tracing-undesired-e53512135f11@spud>
References: <20260224111533.3194883-1-ciprianmarian.costea@oss.nxp.com>
 <20260224111533.3194883-2-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="45NNQJw36F4ACibh"
Content-Disposition: inline
In-Reply-To: <20260224111533.3194883-2-ciprianmarian.costea@oss.nxp.com>
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


--45NNQJw36F4ACibh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 12:15:30PM +0100, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>=20
> Add compatible string for the interrupt steering controller used in NXP
> S32N79 SoC.
>=20
> The S32N79 SoC differs from the i.MX version by not implementing the
> CHANCTRL register, but otherwise maintains the same programming model and
> register layout.
>=20
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,i=
rqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,i=
rqsteer.yaml
> index 5c768c1e159c..caf3e4a1f26f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer=
=2Eyaml
> @@ -22,6 +22,7 @@ properties:
>                - fsl,imx94-irqsteer
>                - fsl,imx95-irqsteer
>            - const: fsl,imx-irqsteer
> +      - const: nxp,s32n79-irqsteer

Should there not be a corresponding driver change for this?

> =20
>    reg:
>      maxItems: 1
> --=20
> 2.43.0
>=20

--45NNQJw36F4ACibh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ3migAKCRB4tDGHoIJi
0jNPAQCrg61L2aRaTJVqK4vMTJxNN++kcY0aHCaUJ0mKDHXIBgD/UW7X0XXe9khO
FPIZw9m2B8CKjCi0+VBVQj2I3rhcJgg=
=9tI4
-----END PGP SIGNATURE-----

--45NNQJw36F4ACibh--

