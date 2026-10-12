Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B204CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lh0EeRUmPO/n2sz7aHLajpNlc62AqgBNQDWR/Mouc3w=; b=jc7CbH5eOgI5bTmcm+LHeR7cX0
	Mv9OpTTHZV0WcD3lnaAzBIJYKuMeNuYJA5c7BZDY+cmlyuoRWBYoImq1yV8ariUlbWBiwdr1nHJRj
	Mx99gV4TY2DFChD+5Vq502YExg6uV3eSV2t2iZ2EZDSGSOyVY3/3kvuEDbcVd/lmP3/2XZ3/nyBve
	+S8DMZefKrDFia9amAv7YcGkKmyu8TQxL2ZkJGObLCBiXFZbTgmwfNmaGjlg1VgL90pMKNmN8WCLs
	pnUGQl/V5hxsZ/y00aRJSX8cFTntXdKL8bCKmPzm2+xS24dcK3WrBFVT0TZVdHxCNWtMO1TcsNT83
	H2zIBu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLXn-0000000BNA4-1P2c;
	Mon, 12 Oct 2026 19:18:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLXm-0000000BN9n-2PVA;
	Mon, 12 Oct 2026 19:18:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A41736025F;
	Mon, 12 Oct 2026 19:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3B31F008A1;
	Mon, 12 Oct 2026 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832721;
	bh=Lh0EeRUmPO/n2sz7aHLajpNlc62AqgBNQDWR/Mouc3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i2ldyTvkySETYb0S2alZFc5d8JjDLNPi+DhBhyG6YldX02eACwPkuXssIqIMYugyN
	 ZZvT5P6OQ1N9Xadzg3OZhntvoRQ0kf+6PUxFkMDiltOdaaMNN95J5inV2wSlUtnxSH
	 4HU76tzVlXnPfFBTErIYAxTMK757kcnh0d7SErAJNvbEPoGIQPRTNeQ51HcNAC2mg4
	 RUd81Q1pZatSeQk7opR7zRlP3xKcvmXdK45GcZmcr0pMEEAMa86QL5jUVn5Hew9Id9
	 kthkILYOTIOMW089oC9iPcmkTGHR3GaM8IMALDRnowS8BYJzwCU6Fw2GphqcvG22EO
	 kRF1rYYfMR9/A==
Date: Mon, 12 Oct 2026 20:18:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
Message-ID: <20261012-suds-karaoke-efc4acf056af@spud>
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-9-tanure@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZyeABZ831vo0PBfB"
Content-Disposition: inline
In-Reply-To: <20261010105900.247342-9-tanure@linux.com>
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

--ZyeABZ831vo0PBfB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 11:59:00AM +0100, Lucas Tanure wrote:
> The informative section explains in prose how phy-mode, the delay
> properties in the MAC node and the mode handed to the PHY fit together,
> and says itself that developers often get this wrong. A reader has to
> work through several paragraphs before answering the one question they
> usually have: for this phy-mode and these properties, which part adds
> which delay.
>=20
> Add a table that answers it at a glance, with one row for every
> combination the properties allow.
>=20
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>

If the net guys think this is valuable,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

(although for something like this, us acking probably ain't needed,
ehh?)

> ---
>  .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.ya=
ml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 1bafd687dcb1..bba27a9feb61 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -339,6 +339,24 @@ additionalProperties: true
>  # has added. Failure to remove the delay will result in a
>  # non-functioning link.
>  #
> +# Put together, with the two properties in the MAC node, this is who
> +# adds each delay:
> +#
> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    =
RX delay
> +#   rgmii       -                     -                     PCB trace   =
PCB trace
> +#   rgmii-id    -                     -                     PHY         =
PHY
> +#   rgmii-id    present               -                     MAC         =
PHY
> +#   rgmii-id    -                     present               PHY         =
MAC
> +#   rgmii-id    present               present               MAC         =
MAC
> +#   rgmii-txid  -                     -                     PHY         =
PCB trace
> +#   rgmii-txid  present               -                     MAC         =
PCB trace
> +#   rgmii-rxid  -                     -                     PCB trace   =
PHY
> +#   rgmii-rxid  -                     present               PCB trace   =
MAC
> +#
> +# A property for a clock the PCB already delays is not in this table.
> +# It is either the fine tuning described next, or a mistake the MAC
> +# should report as a fatal error.
> +#
>  # Sometimes there is a need to fine tune the delays. Often the MAC or
>  # PHY can perform this fine tuning. In the MAC node, the Device Tree
>  # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
> --=20
> 2.56.0
>=20

--ZyeABZ831vo0PBfB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0yiwAKCRB4tDGHoIJi
0pqvAPsGoQ0dZuqznMzflFnrJJONMATY3If2+uw3QIz/GHgDxAEA6x8lm1tyHUeS
J/yJwvaHqlB8POud4yNTEmA/S8/ccQs=
=6vsf
-----END PGP SIGNATURE-----

--ZyeABZ831vo0PBfB--

