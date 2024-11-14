Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48263D6A22D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWz5sCQ5z+GdY4O5saurQxhltkqAWeh87WpSHdVQSB0=; b=AzRC+Rzw0B+r+pDC+4dSoKQskM
	zeK52W5ylnYjne0d59yDda6T9HVziFMKo1EtPhxnA4x5ewqbogwrTAECMt62RcsxmDe8THkv2dMZD
	4hj8oaLgqDDiiheMljfK0szQqKQ+nPgp3djAYnAazpi/E22enrOLLJqeWfrj9Im0l7O3zBrdaDC3L
	juPrp0LNAOcN8xGOtFYBj2j+5zdrZK4OjUR/Texv0Aexet/chvyrVSXuCgAV7sDSR6B2U1rNo38X4
	z4zceW3/9vJHkDAT/str0Fmd2Cp/z6XoP5lL3DnDXq5Lz0Qxl41z4xTyu6r7Adg2vL0BFhsVr/H5E
	Iq0TIRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBg38-00000000h26-16si;
	Thu, 14 Nov 2024 20:02:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBg2C-00000000gjz-2UdJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Nov 2024 20:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VWz5sCQ5z+GdY4O5saurQxhltkqAWeh87WpSHdVQSB0=; b=BqrM3ALnRgIcMRhgaVawMIaxZG
	KSRaWrSbmXGw2ZG/IZuWMl/MqzS4FMNmrvEg3W6nBOM4iKJEsIVzt4f+vyGrXfkEBQHDxcUrbOXID
	2lOHauYklDbowUxWp6O29eKhgEnqrv+vpBqIJHc4ynlbpPhulGVCXfMt36tquiA6tIlQzTkKs9hMO
	ikP5XroQIpPDPB+9haUNoWZuqInzAOcBHRnyJMABOkWwM1M2Uk8MspGhc6XYxHMoYiJwFYjnC9XBC
	SijYQx3WhoEU53MX132sVY2Et4YgDDOnvPzLVNK0C5VneGmooacX8Ee2J2EWyyokamvQRVpYap4We
	CDnIbinw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBg27-00000000A1p-2SIG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 20:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A1C25C5FBF;
	Thu, 14 Nov 2024 20:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E10DC4CECD;
	Thu, 14 Nov 2024 20:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731614492;
	bh=VWz5sCQ5z+GdY4O5saurQxhltkqAWeh87WpSHdVQSB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I635dSjAnKKMVpTevwE3oP4UacKi1Yjjb2bBYkCes6s6ebjTGyqdcBF2BMyKn4BDh
	 RujBYwS6TiHSe2L+C+eqL1BFovRlIFtD5Qxai1Kt2P8RXHl8TLyuGB70dBHEiW4Iem
	 gGPDpWEg1F0rmNxojPbYL50vzvvDjmhNWWF5xSAEE530VKRLHVSIxSqhWMY4C8Ww71
	 ta9cKABHiUYmvMypAYfJbEm94wbUnd9p8fgvdhedLAVoIQ2f6Vo7uPb17YnrBjhxbo
	 oplQZQcY2KCbrxBwQevspMt84ivecQzWmJZD84hbtJK04HknEn+vWve1T+hM1RAgaX
	 5XXxd5davnOeQ==
Date: Thu, 14 Nov 2024 20:01:27 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Frank Li <Frank.Li@nxp.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Unify "fsl,liodn" type definitions
Message-ID: <20241114-obligate-thinness-204e7edbac77@spud>
References: <20241113225614.1782862-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LBgC8kDFmZGaqIfM"
Content-Disposition: inline
In-Reply-To: <20241113225614.1782862-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_200140_550019_EA7889BB 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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


--LBgC8kDFmZGaqIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 04:56:13PM -0600, Rob Herring (Arm) wrote:
> The type definition of "fsl,liodn" is defined as uint32 in
> crypto/fsl,sec-v4.0.yaml and uint32-array in soc/fsl/fsl,bman.yaml,
> soc/fsl/fsl,qman-portal.yaml, and soc/fsl/fsl,qman.yaml. Unify the type to
> be uint32-array and constraint the single entry cases.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--LBgC8kDFmZGaqIfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZXFwAKCRB4tDGHoIJi
0kYGAP9Wme55iNVWUdF0JCfZsdd/dSXawb3Xp/9hcFkAFPL+1wD+JyfKr1/0r859
g2MAxCrI6eo9mzcsXHJ6NGT7mvH0DQs=
=7ofP
-----END PGP SIGNATURE-----

--LBgC8kDFmZGaqIfM--

