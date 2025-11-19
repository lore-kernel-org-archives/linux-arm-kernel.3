Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBE4CF58C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+20Uj7V/wB53t3E3ACYXIU/QyzVL9+KYCOlwfL2P6s=; b=n4CCu39Ch+sw6SCDhFKyWWJ3EI
	fgdx2f9Ep5kKsUse5c2CQzvEneCMdxTVBPXhgz9oljB8E6Sad8vFAMHCRYEdleZxcN+jaozPy5Rlu
	w9xf4yrOKUjBdj0MRjaIUZqH6RG2mDBUg1p/oBxE6IBdnxCDnNsbzkloZxa/uysjRpr0Uv3ZOY09c
	+FAUN4VOzhtyrs6bj4EdABL6weqV9JxE5vLuADfclRuLbiTG8UvOK7ecaGGbaxXU4+QEQVH7l5yz4
	dVIkP8jRP53+ch7Bqlt/EIZ7nhniI5kqix4RPTH3RV+pGak3WiqFsBf1VSAQY4wL7NCIXfp1yJF6s
	EQJAQUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLn8i-00000004hPF-06gy;
	Wed, 19 Nov 2025 18:42:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLn8f-00000004hNu-2oHU;
	Wed, 19 Nov 2025 18:42:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D0254360A;
	Wed, 19 Nov 2025 18:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23360C4CEF5;
	Wed, 19 Nov 2025 18:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763577764;
	bh=d+20Uj7V/wB53t3E3ACYXIU/QyzVL9+KYCOlwfL2P6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdRjYlhhDT9zjqscZl9dlk/VT2v65GFWB3iqHMzaQ4z8NdllYI0b1kSjnUUz5X5As
	 UgF/WhAJt0vsYmMaV6bLjCxpKGQwamYcp2JNPSeQSbN2UxLWnLS6JJqLX2faMrUGzf
	 oYwOaEAMmod6faMCkejLzbEJ2C75HCLHat1HLOPlRK3zKoxUEfNwB/rTVIEkgKBF/c
	 +4Jyd7+usTtI1J7mKfFdwJu9l8vG3vosYdvG2btZbhB3rL5twxTFCkDnirM71iUsP4
	 NOFrrtdQbgWHEnu3hJpo/LU7j1I+c0+3ylyPLfB3tF1pNfrH5xcRU4RgwtxWMHVVPt
	 BRNWVIKBrXAvQ==
Date: Wed, 19 Nov 2025 18:42:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: Re: [PATCH v4 06/11] dt-bindings: net: mediatek,net: Correct
 bindings for MT7981
Message-ID: <20251119-snowless-thrower-0c4743a2820c@spud>
References: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
 <20251115-openwrt-one-network-v4-6-48cbda2969ac@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OWZxw9N+U4ItickZ"
Content-Disposition: inline
In-Reply-To: <20251115-openwrt-one-network-v4-6-48cbda2969ac@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_104245_731111_A6FB264C 
X-CRM114-Status: GOOD (  10.25  )
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


--OWZxw9N+U4ItickZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 09:58:09PM +0100, Sjoerd Simons wrote:
> Different SoCs have different numbers of Wireless Ethernet
> Dispatch (WED) units:
> - MT7981: Has 1 WED unit
> - MT7986: Has 2 WED units
> - MT7988: Has 2 WED units
>=20
> Update the binding to reflect these hardware differences. The MT7981
> also uses infracfg for PHY switching, so allow that property.
>=20
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--OWZxw9N+U4ItickZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR4PnAAKCRB4tDGHoIJi
0qysAP4slbkJvvcDz+LiScI3HC4oFNoFUawshCKoNhDhEg0RZQD+JPTtXG5xiV2r
lqSBXMrX7H73koX9k2vleiv2AUW+EAI=
=X2CE
-----END PGP SIGNATURE-----

--OWZxw9N+U4ItickZ--

