Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF81606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=49uCf9tT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5klA8w8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAHTPseBysoQyjFWdWhxEUoIlAFSx4P0uFPxuTZC58E=; b=49uCf9tTzzi7UzvLUeyaBgYaaS
	gBOgI5YgIw1g9SZIpMAu7CZ2aiswEm0kOcKzqactG/v495KK1Hf32a179ZZ5Cf6E8Ehm/LT1+KmLW
	3/QwPma9P6CXcBJmngInBtvmAW4mPF3r2LZfnTuBw+eDsGviExLwezZ3ehQKM+OBwv9xyzoyxUV1T
	eJVE3bxfr4mPnWhy80CUd/kg5KKluMQMLHazIdCvQPvvlmXtEhn2C2E91V2b8sJglwJrt1WFZPhsQ
	VJ0gOiNnUN0fwNO0t49jo6nIj9Nnt2OfOIBZaFUJyR28a3IfWZV0WPrO3Z/bdr8VKUCrWdFIBNbyO
	S7JqABAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDw2-0000000ANhJ-4AAP;
	Tue, 20 Oct 2026 17:47:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDw1-0000000ANh6-2530;
	Tue, 20 Oct 2026 17:47:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0270143834;
	Tue, 20 Oct 2026 17:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C7C1F000C9;
	Tue, 20 Oct 2026 17:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792518456;
	bh=HAHTPseBysoQyjFWdWhxEUoIlAFSx4P0uFPxuTZC58E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T5klA8w8ldhaGXex5p2C1vk2XmCWEI5ePLrDsiyhXLVFchdZEn+v5/j//jHND7keT
	 Meqe1HYRaPtXccMkRp824RMlBY/ggOISFpPO91xfQXQlxRa2BEF/hHxRG/jK8L1CgQ
	 9muVPdNXFcV74oJ2Dgz4HaRViQo1tQbIdaPr+01vyY4wLmybDhkP+Vl1I+bioV+Ygq
	 uCkDYDCq983KX1BvcP2HAwIVds8N7k+Rqtsxjca0Ovu269GytYQIsu/QGvdh3m3Bcg
	 UwXzztQF8VoJ3nyz6bU2aIRxqOIpInSrUm2TtfG3URLEtNoUiddkCE0GL6sKdGKVFJ
	 c6nOo9rgiy+pg==
Date: Tue, 20 Oct 2026 18:47:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/20] dt-bindings: i3c: dw: support up to two reset lines
Message-ID: <20261020-endocrine-crown-c6d3c83cf436@spud>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-5-jszhang@kernel.org>
 <80b084d130b7dc7406ae23e54a77706a4f42b606.camel@pengutronix.de>
 <ata--JFFUzSoMock@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PF0S8SXN4APeQtUF"
Content-Disposition: inline
In-Reply-To: <ata--JFFUzSoMock@xhacker>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--PF0S8SXN4APeQtUF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 09:08:08AM +0800, Jisheng Zhang wrote:
> On Mon, Oct 19, 2026 at 02:55:14PM +0200, Philipp Zabel wrote:
> > On Di, 2026-09-29 at 14:14 +0800, Jisheng Zhang wrote:
> > > The Synopsys DesignWare I3C master controller can have multiple reset
> > > lines, such as core reset, apb reset, and dma reset.
> > >=20
> > > Update the DT binding documentation to increase maxItems for the rese=
ts
> > > property to 2.
> >=20
> > The last sentence just listed three reset lines. Why increase to 2?
>=20
> Per the doc, the last one is dma reset, currently dw I3C driver doesn't s=
upport dma.
> And increasing it to 3 is still dt compatible. Maybe I misunderstood
> something. what's more, I don't have platforms with all 3 resets to test =
and verify.
>=20
> If dt maintainers prefer 3 in one step, I will sent out a follow-up patch.

I think you can increase it to 3 globally, then restrict to 1 for the
altera device and 2 for your new one.

--PF0S8SXN4APeQtUF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatepLgAKCRB4tDGHoIJi
0nTbAP41tIofP+UpvSN0IwKJvT76VMbRwSrA7SIYBjKeyCaPgwEA7iCZGXK59MXH
F8eKb5c+ngwawXhmX7aqW4NflYqjyAY=
=Yxu4
-----END PGP SIGNATURE-----

--PF0S8SXN4APeQtUF--

