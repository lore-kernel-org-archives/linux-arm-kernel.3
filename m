Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB09FC36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoUbEfEojKpbNb9OTSz678XRKXNdE6eHUfk0iKNiJys=; b=i/W8Ghsd/SAFy6Ozn+KXsSDxXk
	uOS4w6z13Kgc+FyWc0N0xGBnrU0rHratueviG8izVcKkhTMUZEtZkthOYMLXLLH5Oa3N3JAsbC9L9
	7musgUugSwPltNQaut+LmhNfry25WRI5NNTOT47P9h7wjT0WACazgUQ7ARGpPZxkKDvHre69rRCpc
	dN1VcZ7/1xsVceKs3eq+eLGXGXizScGsQ+LZtOXQ+qY1Ov5WMM7d9gAfz25/IFwFQfn0ntA1ymDSW
	KoTGVeNPWnChBsM1GSwU0fkk+gxsUfhn8dz3zMotFPbLfuyMgN0X0jEo+CzvciGzVjvlZoIS/SiGH
	T+KC2TLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1a-00000001VPa-02cY;
	Mon, 07 Apr 2025 18:16:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1p3E-000000016I5-2Af0;
	Mon, 07 Apr 2025 16:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 946625C1ECA;
	Mon,  7 Apr 2025 16:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA86C4CEDD;
	Mon,  7 Apr 2025 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744042219;
	bh=T/icUZNKagvrKD/XyMsdV5kUXZvHz0F432ZQ6gD6/bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCSADcswQIgmHv9oHsLj9h4sGt3gtocSsO3jdUKpd+jKaOH8nQfKzmfm4woAno6NN
	 ymVchZUBmmnbhQhN7zMQl1h1dAo44xBd6sGtcOBjGNqkkSKdNVPB38ZJAqNU4AjjGL
	 MbKC5udI1PomP+E/ZbVSHRCt4sPTm4UWgGMqkZ6St3oRwyOBthcc6DRtqbvfMRSpKt
	 d+wbjuc13tikm6zQvxnVYfiI7CqHsk0+CYdXDIMqzFLrOXjkH2UEUT0RJ6rjFSMdNi
	 gdf1JrW62iBFzpwTZX8WG/lapMNvFFii1nDV6XANfrjE94Umjn5ZUHwYgI9gIfuhxC
	 RGy9BJ5DsapnA==
Date: Mon, 7 Apr 2025 17:10:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Bincai Liu <bincai.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: mediatek: add mipi yaml for MT8196
Message-ID: <20250407-cramp-fidelity-b3a6db245938@spud>
References: <20250407133138.22449-1-bincai.liu@mediatek.com>
 <20250407133138.22449-2-bincai.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8xUyRlIlJRn2Mb1P"
Content-Disposition: inline
In-Reply-To: <20250407133138.22449-2-bincai.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_091020_614852_258E162C 
X-CRM114-Status: GOOD (  14.83  )
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


--8xUyRlIlJRn2Mb1P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 09:31:22PM +0800, Bincai Liu wrote:
> Add compatible string to support mipi for MT8196.

You need to point out in your commit message here and in the mipi
binding patch, why a fallback compatible is not suitable.

Cheers,
Conor.

>=20
> Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml =
b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index f6e494d0d89b..ed99e959bf4b 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -37,6 +37,7 @@ properties:
>        - const: mediatek,mt2701-mipi-tx
>        - const: mediatek,mt8173-mipi-tx
>        - const: mediatek,mt8183-mipi-tx
> +      - const: mediatek,mt8196-mipi-tx
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.45.2
>=20

--8xUyRlIlJRn2Mb1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/P45QAKCRB4tDGHoIJi
0uZ2AQCmQRddIAahlK8Ed+uZbLQZVr9L4zCTUWXg3FZUCLVczwD+KTSQUSVEAcAA
ytubYwzhw6MZqL5MEKTRb+4e+b1dCA0=
=3pKV
-----END PGP SIGNATURE-----

--8xUyRlIlJRn2Mb1P--

