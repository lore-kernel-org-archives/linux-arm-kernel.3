Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5582CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ud188JUBlrzBdAeOUSOy9xh1TaWuv3Hu+RD3VybOso=; b=Jk7MnUqtxu2EG0bu1CzZbtXhnN
	UNa74T2TxQLpK9ILzrrrBRlSas7bQQOG+o2tYrmWyPfYyraFUz1oFuIfaAnNBhSzW8QbR778zumJ/
	SFcbb5eb6kcDcsPu70p0arVYi8jQ2MQKyCrEAWPOsSZB00wE6/vXneP75jP+uxaTm1jyF2raN0qWi
	qLEekHA2qalEesF3oV26ZlBCGOrspIs6ckeyUSd/6WLx2xo/Xvqtf2qWzw6ALP2Ybmlb2ZtvxkROw
	98paTdf4PgVCHjHt4mGH8ZU7+LAtxJJstLdlv9dRBV+Lvk1f8K0tTqJxHz4ePkUnzQmgG54CrXwbb
	UlFJyyhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RFT-00000005U8P-3suz;
	Thu, 16 Oct 2025 16:54:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RFS-00000005U7x-0nvl;
	Thu, 16 Oct 2025 16:54:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 805BA60441;
	Thu, 16 Oct 2025 16:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83354C4CEF1;
	Thu, 16 Oct 2025 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760633681;
	bh=P6z6MpZ3GyLdgUiuk5OCeZbUo2ga95ouA7nUg4Q6aj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozI6wj+mVED3BwR6VvJe1HkiU6QMx0LrkGAcqVEuP/lkCLmnLHzzm54D+zom70e/0
	 TAZk/V46RlVvu+cGZ9PLP97lhv0DGYjBtFV6t/2FHKGlvvavoHAbHs5RTEdNcD3nhp
	 53ZGGshZZlevE3Y0ZRQAJcy5RmqT4jjV5nNgb1Kh6QocmEeueWbSvyPd4h71JHlSxD
	 w3YsGIJjuIlU5O8byeeGpEvT0qwbBav6vL6ECWuZyRukZXaJlfJIp+WLaWlI1fRcle
	 +WnsqyzZ6JATGqkq9Nn7uMqraI5qgHYPSX/hpaHQyw3vZdsIglDXIQD9v0DGCRqA/U
	 zt9C6TqsMbuLQ==
Date: Thu, 16 Oct 2025 17:54:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: ufs: mediatek,ufs: Add mt8196-ufshci
 variant
Message-ID: <20251016-spookily-finisher-07e0240a11f2@spud>
References: <20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com>
 <20251014-mt8196-ufs-v1-1-195dceb83bc8@collabora.com>
 <20251016-kettle-clobber-2558d9c709de@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LGvrffN0k+9EYx8j"
Content-Disposition: inline
In-Reply-To: <20251016-kettle-clobber-2558d9c709de@spud>
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


--LGvrffN0k+9EYx8j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 05:53:01PM +0100, Conor Dooley wrote:
> On Tue, Oct 14, 2025 at 05:10:05PM +0200, Nicolas Frattaroli wrote:

> > @@ -30,7 +42,15 @@ properties:
> >    reg:
> >      maxItems: 1
> > =20
> > +  resets:
> > +    maxItems: 3
> > +
> > +  reset-names:
> > +    maxItems: 3
>=20
> You cannot use reset-names if you don't define what the names are.
> Please provide a items list with descriptions in resets and some
> names in reset-names.

I missed that the names were provided in the if/then/else. Please just
define them here, since there's currently only one possible set and use
the if/then/else to block their use on !8195

--LGvrffN0k+9EYx8j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEjSgAKCRB4tDGHoIJi
0hRAAPi8N6sPfeV1Bi3I///Ot3yTtonRd3989x6drtQm36IVAQD69kpquARZkUPk
oMdifIXnmA5UyWpnpgSGOKCPH2daAg==
=AjY2
-----END PGP SIGNATURE-----

--LGvrffN0k+9EYx8j--

