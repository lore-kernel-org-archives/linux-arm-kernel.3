Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7505CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4b8KCRe7pF1UqNMFpoJsf5H8zaBgkDgxOQMy+atvx7Q=; b=yI8CrKw6X9QBnzrx3dtvg7rx6y
	lw07q4V4A9IqoQM1+T7szQmLoNB1/Itq6dVTJHuISwvTEDsoNqaNA8brqUpdg9kgOG0bsHRpJhzE4
	iPX6nv21Tcbmran6FTfs2wbGOkQSky7Hq4hvEm7zmYuB5LdRb2XvzgIs6U5NkkULhIdKyQYQU1VEp
	6H7BBtMZfpaUwUxd1YxfR+xWp6oyw+HDHEVnqroN9hJs6eIISst44c7UJRufqUtq365Lac7g1hZrW
	EME50zSm18rq0YGHUDab9gBNdAselq5x6QOniTp7tfJcWIJcdsxg9AApnGckLfUFtURqLkeKRJHgy
	pWKUloWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdgn-00000004Obe-313T;
	Tue, 29 Sep 2026 19:40:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdgn-00000004ObN-0ATg;
	Tue, 29 Sep 2026 19:40:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A797D4149F;
	Tue, 29 Sep 2026 19:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B301F000FF;
	Tue, 29 Sep 2026 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710832;
	bh=4b8KCRe7pF1UqNMFpoJsf5H8zaBgkDgxOQMy+atvx7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bOuErwfrk7NMaqfjlf5HuaPdYFmDWfTHIAMMEzSnr5aJsUqWx5U+I4VwiUMbdj33w
	 BtxKfshZ9IR5H4w8fzb9tMfGLY1yEK9E9pQEslSdG7GrE+2gbUwzj86njTDypghKsh
	 7BWyfxMbPagDogjSokAHMmPq9nSVDUU2ZY7I7y7J4lGlVe1W+sfdP/Fy3kbYnYWVY+
	 7+N0vOMcPsSrifNvgVeVu2SOF8+aiUgE0xc909LIEloJ0i5AZfk/VrKduALcdhz+sr
	 C6TqEcv3V0HfMGkRnWamyRhGlk0r/l6LZRK0Xs5OMTKjpmRpcm5d6g5NGOP8LXlCke
	 PvSR8lBpXDofA==
Date: Tue, 29 Sep 2026 20:40:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/20] dt-bindings: i3c: dw: support up to two reset lines
Message-ID: <20260929-unnatural-zeppelin-3105dec85864@spud>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-5-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9lZEJPU9yWTSdoib"
Content-Disposition: inline
In-Reply-To: <20260929061417.20733-5-jszhang@kernel.org>
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

--9lZEJPU9yWTSdoib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 02:14:01PM +0800, Jisheng Zhang wrote:
> The Synopsys DesignWare I3C master controller can have multiple reset
> lines, such as core reset, apb reset, and dma reset.
>=20
> Update the DT binding documentation to increase maxItems for the resets
> property to 2.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Could you add a conditional section alongside this change to restrict
the altera device to one please?

pw-bot: changes-requested

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index dc7ee38001d6..dcc21a7ab4c4 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -39,7 +39,7 @@ properties:
>      maxItems: 1
> =20
>    resets:
> -    maxItems: 1
> +    maxItems: 2
> =20
>    power-domains:
>      maxItems: 1
> --=20
> 2.53.0
>=20

--9lZEJPU9yWTSdoib
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarwUKQAKCRB4tDGHoIJi
0jjwAQD9+7FuFrd+5qA4gMDQY8mXGlaQtYk8bd0Z/zH2KFeicgEApFzahkQU8FyW
bKYBxyIUcX60l+VoK9eLy/VuqFSj2Q8=
=gE/1
-----END PGP SIGNATURE-----

--9lZEJPU9yWTSdoib--

