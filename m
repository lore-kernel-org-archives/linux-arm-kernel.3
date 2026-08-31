Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0640DC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZKWq0mMMGFiL2ra1uyi9+EXSoTSOjxTyuVR5F9+hBQ=; b=i0Sm4eNd2bN7bBg+xN69zMBSHz
	BpDq+Pu0ZFGgZv3fFXDAY87Zpp1QF4FAiIsEz1Jvhp5F8mbeR8UMr3iqAWIXibETb8BXtVq2e5Mfc
	MO/u622SeOj5sDRYzLqEEsDN9IZPPrO1eaL7tuYz3H2PXo1BBhLVjlbvntcy/UoYgf8KqSplVA9kT
	pu2dA05s7mlo7kvZUjnnyWi40LIFRk78G79mvKXJgLeWUachZvNovmEBiNMe/CsRki+aNyCLX/+rb
	6jH9fFz6VlsIYKnBgn9zm7PtAxyq/vG1eOO2jzSekqR4HDo+QUM6HnQaE/rsPQGeeeFjdB980Ara/
	F1YmQqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14jg-0000000A1cY-32dZ;
	Mon, 31 Aug 2026 16:19:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14jf-0000000A1bx-1o9Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:19:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F705601FD;
	Mon, 31 Aug 2026 16:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F961F00A3D;
	Mon, 31 Aug 2026 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193190;
	bh=vZKWq0mMMGFiL2ra1uyi9+EXSoTSOjxTyuVR5F9+hBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iZ60x8SCFc4ZXT6oYBS8PqfQ9ivIgeqYgqtDOKvsjCfc+r9Lhc9Rqrlkj0WAxOf3t
	 SkQzZmxmOukL2Kog/YOdtSL+rOVS8gLs7cPtBhLpVZURcqhopjf0l/4SetcvfKzBHs
	 5/jY2Hoeme9M4CBbXve+m+pfNwVAuSPPJGLwKxnxiUhH9w9ffevzfTRp05aJM+E4S7
	 RKxfBSYWdyGLqeH9UG5JlnYR0bwZO8dxuUSuJ89fyQO8vy3JvkDsO6VOnZa/n/6PwY
	 EE3q42Ff25AjUfb9ZOWcN3RIXTGUbqdTbbORwl6efU7Jk740X+BgeVyVkt/6PV2No4
	 oid6FK4dqZjgw==
Date: Mon, 31 Aug 2026 17:19:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
	Cosmo Chou <chou.cosmo@gmail.com>, Colin Huang <u8813345@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: add atmel,atecc608a
Message-ID: <20260831-irritably-bacteria-e3ddad58fd80@spud>
References: <20260830220151.21469-3-blum@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q3W50SDhGFq7JrQI"
Content-Disposition: inline
In-Reply-To: <20260830220151.21469-3-blum@kernel.org>
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

--q3W50SDhGFq7JrQI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--q3W50SDhGFq7JrQI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWpnwAKCRB4tDGHoIJi
0rEXAP9DZvI/dLIfzFA2O0skyTySC0B+tR9xSHtmn7eTU6WSLwD9G4Gk0SC09K3X
p09sVB7IFk91pO5QeKi3CUK3hik74wU=
=DzDP
-----END PGP SIGNATURE-----

--q3W50SDhGFq7JrQI--

