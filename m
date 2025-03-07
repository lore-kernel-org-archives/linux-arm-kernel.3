Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D69C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg8yf5kkPBOXFMqO4FsS5VHvhKyo3My9+YJjfzPZXh4=; b=uVY8PpQYk6ofMnNWB9p7hsyd59
	+GemJNznMfx/6s02JaK63x6c1l6LfZesjoLg/6EwOaFBmJbKo13lTIzwxjwGCCjWVaH/QTR4placr
	a8esemBuVTorBsli4IwSFHubmtIhpV2OqT7INZjt6Tm2Lnm5ukuJUh1EmGHrl1SQAaa9+G5Fm1g0/
	vTavFiiRELppa8Zcnc1RmQTEDf/EMNfBV7xkjjCZ0HAfcp7j7q5lmb3XG01FuxfPysvUAtYQUXSZ4
	tHmd+MSNDnnoWF1hj9yzudG/ZfYCKtLG13VRuMZ0Xou7hqA47EC3PFFhOMTtu4zCfy/ZCZ3DrE9n6
	xZBB3OVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqb7I-0000000EzqR-3x9C;
	Fri, 07 Mar 2025 17:04:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa5a-0000000En3A-2aGc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:58:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3B1E1A452AC;
	Fri,  7 Mar 2025 15:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5BDC4CED1;
	Fri,  7 Mar 2025 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741363097;
	bh=DbOJCP64/Zf1wfRed5mRMA7gHSuE9mWdYEEM8LkNjNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfm1QjW0+Yj40viKDxMa/eaI1kIybtAHMSB9BuuhaavCDsQS+lTcgvkY6LsfGIaM8
	 ycoYHNpzCe4tQgpyS93zEEpX2Ujp4Xc9G/udOdZmUMhBcqGYTdWuQ70Q33xRghPYIt
	 oB6U/ZoAW3oRVKmCSsey8mMo9Jy0ZEBBt560tzIIqLoQaQ4wPBQ8hSOKxp/FovR89E
	 1TAdPTWiB8WL5uXYfeO8EU26V5IdurFTlb/TQb5Cx7VcAMN/wAxD8xDeWowH4kUsIE
	 fa119vcwUufZu7wvBPeShILRoz29j2dhEDA+HId+rG/RzP1/wKVrgwYcq+Lzb4mHOd
	 Tzvje4zwr6hmw==
Date: Fri, 7 Mar 2025 15:58:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: pwm: imx: Add i.MX93, i.MX94 and i.MX95
 support
Message-ID: <20250307-scion-comprised-03e8ea95abed@spud>
References: <20250306170845.240555-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lEFFTIemAybPsts5"
Content-Disposition: inline
In-Reply-To: <20250306170845.240555-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_075818_743685_AB7EC732 
X-CRM114-Status: GOOD (  14.00  )
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


--lEFFTIemAybPsts5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 12:08:45PM -0500, Frank Li wrote:
> Add compatible string "fsl,imx93-pwm", "fsl,imx94-pwm" and "fsl,imx95-pwm=
",
> which is backward compatible with i.MX7ULP. Set it to fall back to
> "fsl,imx7ulp-pwm".

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/pwm/imx-tpm-pwm.yaml          | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml b/Doc=
umentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
> index ac0a35bf8648c..d5a9340ff9209 100644
> --- a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
> @@ -23,8 +23,15 @@ properties:
>      const: 3
> =20
>    compatible:
> -    enum:
> -      - fsl,imx7ulp-pwm
> +    oneOf:
> +      - enum:
> +          - fsl,imx7ulp-pwm
> +      - items:
> +          - enum:
> +              - fsl,imx93-pwm
> +              - fsl,imx94-pwm
> +              - fsl,imx95-pwm
> +          - const: fsl,imx7ulp-pwm
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20

--lEFFTIemAybPsts5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sXlAAKCRB4tDGHoIJi
0vOkAQDWqdqeelxxD0R357bSU/Q1uJv1tmCMs6Lf/ewtxmAb2AD9HplVxYRL9SjA
/DlA2PnHJvXCFTiqK98yaz/Qb8OR3wo=
=lBWI
-----END PGP SIGNATURE-----

--lEFFTIemAybPsts5--

