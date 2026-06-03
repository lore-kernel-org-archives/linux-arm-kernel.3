Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E65CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwQAgj5+iT5nXjtC4meACtY9EVtZ0m/GsoPdDY/zB1E=; b=b5uVmImvf4VgHWE+BmC252faJ+
	YnTzT+MxdAh4gIz5l/A/rqS3NU+L4og6k3bpm6MW8V7DFT4Au077rFOnV+f/8sJx5EdVDYWvuC4ZB
	vopVCU2yjw6miNJ3lGOsIdDMOw3ty8SUFG6g/Ef8zLd/4uatyag7u+Sr+QEZm811yps7kuVo5igco
	rsM0gig1hLPGgNqg7slTHVCAl1XCqtnj8QHJNAephbdThYU7L00hH5q32fIGCrM+YOClZQGY/mXBo
	R5qXVD9QAMfVFxIeUG6STKPbVSowBtbLvDyjAJS5TSHYsxEUsggDprS5GSCdq6bxjfxFAjTpUqt+8
	IQZcsNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoFE-0000000FV5H-2WaL;
	Wed, 03 Jun 2026 16:15:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoFC-0000000FV52-3l5U;
	Wed, 03 Jun 2026 16:15:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE7B4601D8;
	Wed,  3 Jun 2026 16:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D574D1F00898;
	Wed,  3 Jun 2026 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503301;
	bh=dwQAgj5+iT5nXjtC4meACtY9EVtZ0m/GsoPdDY/zB1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ULuDGwSSLIRN0w9IuEJ5JU6MC9AQGP/tI3k6TfNL25n5+MhzzAvJyNgp786DYy4qd
	 SU+2ZsMvjSEWLR06CcWK9d4SpnJ8j+YSbw+9huywRO+70nf1qBP8vzVdp0xu3wgA8r
	 R/Sd5Hl8C1MSFYa2Vs7SDPXHG5A3/nlyhk7eIewmDh+WRIfXivRE8AyEiA8ifvB3L6
	 MlQFwcIw3MftF1zdN13bQZDXQP0KzZBuxMZ+w65qe8Fd6UwM70TLAwr/jSK4kopAFx
	 AgyniZEqiZSJXMXe16mZawh39Ow3S15EGMEE4lAUd8excYWx/V3u54sxyTsvx5xo63
	 gNmSCy/Mk1NCg==
Date: Wed, 3 Jun 2026 17:14:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Fei Shao <fshao@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Irui Wang <irui.wang@mediatek.com>, Fan Wu <fanwu01@zju.edu.cn>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v5 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Message-ID: <20260603-pentagram-unleveled-8729d0003aa7@spud>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
 <20260603084045.17488-12-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t67lQ/zxp5PMEWTK"
Content-Disposition: inline
In-Reply-To: <20260603084045.17488-12-kyrie.wu@mediatek.com>
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


--t67lQ/zxp5PMEWTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 04:40:41PM +0800, Kyrie Wu wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
>=20
> The MT8196 decoder differs from previous generations in several
> key aspects, most notably in its use of VCP instead of SCP.
> Additionally, the MT8196 enhances codec capabilities by supporting
> HEVC Main10 profile decoding. To accommodate these hardware changes,
> the binding constraints specify a total of 12 clock inputs,
> consisting of 9 decoder clocks and 3 VCP interface clocks,
> along with 2 power domains covering both the decoder and VCP
> subsystems.

I'm pretty pretty confused by this statement about constraints, since
there's none added?
The vcodec-dec node doesn't even seem to permit clocks at all?

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index bf8082d87ac0..74e1d88d3056 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec
> =20
>    reg:
>      minItems: 1
> --=20
> 2.45.2
>=20

--t67lQ/zxp5PMEWTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBS/QAKCRB4tDGHoIJi
0oufAP9lJNwOAT7VUSW+zV4U2z3qVv4MRzJDqgtx5EAGueP/8QD/cTypdP6H/JNn
OwufpOGYDIsoQ8ZXAYdX5gTK/xBsNwI=
=W/Ot
-----END PGP SIGNATURE-----

--t67lQ/zxp5PMEWTK--

