Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133BDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 18:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5g/nAbMYMm2p9UdFeUmdEJe1r0jnPaHHIl/UszfI4Xg=; b=SxNU69ecANyxy3s6DygQSXnpBV
	282DW2Fnf0g5BhKf37AQnSxyecospxRtilDQOqR3kS6l7CW6XenEAvN78Pspye30gfAjrMDE3Vfwu
	ON/SCD7hGyqTPWixuRwKBcw6wQrIKgW2hu7lDu5+c8H8BoWtIOqpdn7j0FN/ezqyEBWX1xB/ydWYf
	gKL19IpXv89zg8PANO2sQ6QprjzvvZqfXkqoKqy0rWNdbaKsFgYovk3Qg9mnhGVM9dNOP64SYwGvv
	1LOLpxmLVRfcwNTk4KhJekQvZLrk1MdwWjBpYxoP8b1xfjZuVHSzrP2FLRVfFpM3KrSNcyY9RX9kj
	i3qQEnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlWv-00000009Oq6-1Zhg;
	Tue, 14 Jan 2025 18:20:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlV6-00000009OJb-0mhn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 18:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5g/nAbMYMm2p9UdFeUmdEJe1r0jnPaHHIl/UszfI4Xg=; b=hirg1DZxzpPCRiGt1RND5VZsyg
	xw4InCKrmS8TrGMtc2gsuIq29AsQ6yb0vY/zi4HwxdPZMSPNKIRMaNW4FrvmNgIaBH56U5thxlWSy
	ooIVcvB1JkjqvoTTJIxtajWsOReAcaP7uIRZCrA/1jvftI0rI3uGbKG4eYUdiYRlADBTwpJnIdfrK
	nlXO/yR9GWonXrtVR6A8ID/TFhv/nzKqTOeaKcfrom18NOIW1NqJprg0UrEI4h+/YgN+zKtTVhK4U
	pyxgTObjyKuuAD6GWSJvvPxn074UkxegC9KmGtJeS2PMqbwRgWaZY76PFH/OPnW8fcCabRHTt3grB
	i0OvdezA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlV2-0000000AXNl-01vS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 18:18:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1C735C599A;
	Tue, 14 Jan 2025 18:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DCFC4CEE5;
	Tue, 14 Jan 2025 18:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736878724;
	bh=5g/nAbMYMm2p9UdFeUmdEJe1r0jnPaHHIl/UszfI4Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5qEB74nK4TX+OZ3IAzHA+hIuGqmcgZrVfnf0gDSRg4LCBlqUnFUAJWiVuD+VE2MG
	 Uo+pqf1xKMhzH/OwjvBqeF99EeQpZCHN8WHwQkfwVPucSN9Kc9gmzzFS1PjWTlk6lR
	 xNwiOBFnWGY7KXa8aHH/y7/4T0ufmy1YAA5IKef+dtC7n2fUAbkvFwNQtuxTMftyKQ
	 TBfjuZxCd28kC8yfSnorUB+4QdnP4Lv0aGjuf8+jw/38yf6vEJxfgOE2ktkAIB2y/I
	 Q07V3R35/9pOIn9cOV52anj9XzgcD3QihngfQHS6dL+L0RAWx4j+2zBTe+z/PrexZo
	 2LPz9GjJ7RRMQ==
Date: Tue, 14 Jan 2025 18:18:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
Message-ID: <20250114-imminent-spotted-f6775aa15df5@spud>
References: <20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com>
 <20250114-imx95_15x15-v2-1-2457483bc99d@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pbVmwMD48O6xlCqG"
Content-Disposition: inline
In-Reply-To: <20250114-imx95_15x15-v2-1-2457483bc99d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_181848_232826_15771C77 
X-CRM114-Status: UNSURE (   8.57  )
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


--pbVmwMD48O6xlCqG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:56:24PM -0500, Frank Li wrote:
> Add DT compatible string for NXP i.MX95 15x15 EVK board.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--pbVmwMD48O6xlCqG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4aqfwAKCRB4tDGHoIJi
0vDKAP4/yAJiBRrXaAjIEA6VGYcdE2/l5/vLI9j87t15CNSefgEA0UAdqPLPrB6b
vqycV/ej/KSaUuTkvsq8BvzMk6liMQo=
=5FUS
-----END PGP SIGNATURE-----

--pbVmwMD48O6xlCqG--

