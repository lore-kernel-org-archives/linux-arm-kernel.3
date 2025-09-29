Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5551DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T67zK9Vz4Jc4fcP89icAwJtwafnVSm8SPy/tBpYc5v0=; b=x/WYpO2ggn7aylPnmeo07p9PWc
	HUdpHqKHZbA2YeCsYMRitfz4jr2+dS5WawEKD8xec61tAjBSkyjK06ZxfuSmIMzI2p8uud6ELWown
	f0ma03z/cayWPbi36wRZ4IOAjBQEgDksJCKTkmNbx9vx7VCi6HoIAXMgiPUSwkwkwsLOFn8u+okKI
	iVsd2l11f2E3MxkDiSSu90XWi3fasWImvOREu8MFqL2yJ5ZHXjijrIV4tpwoBORlATmxCPrprWxN+
	a8QDmH6eUzQ+zw6J2Fshomi0/JCUh865S9SCtimFNasGKFR6qvXRXhipyMzKK0Wc4/xZEGsN0KP50
	EY7h3aXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Hiy-000000038EK-3qy2;
	Mon, 29 Sep 2025 17:31:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Hiy-000000038E5-13kk;
	Mon, 29 Sep 2025 17:31:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79F4462656;
	Mon, 29 Sep 2025 17:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73DEC4CEF4;
	Mon, 29 Sep 2025 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759167102;
	bh=L5taQOZ5fy1HPwxCZ3NhYxZGxI2dRfW/9CQ4Tx0pvww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E2H/+TEkd8fEL8/p0gb75SpCX8X6iF6IxTCTi3qfbM2zU9bOFClp7xXuFFCOYQx32
	 ISexCizfVvTtpJlrJnLUj9FcyyMi1cZ+iLl5FMQWkLhjYkbLefB32LaJgI2aJWh3WQ
	 eyiv5rt6d1iELQ2nDhnJfWPB7dWasVAwYy2HSC2IP9f7LCq/RjzLsBJDdcRDOWyTDk
	 l958AiHye4QE5ChB8naMrouHvdgeGayukpBjRoZjt+1xvICR5d8CpeZZfQb6/vB+Fj
	 Af4+mAKLlgDZtD4Aygg7RYj2PiDr8JhDQqWEhiTXjU1/IrZ4Xy4pAYLulQRtTlJvOR
	 DZiiMip4bNMQA==
Date: Mon, 29 Sep 2025 18:31:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guangjie Song <guangjie.song@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>, kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: mediatek: Add clocks for MT8196
 mfgpll
Message-ID: <20250929-whoops-kennel-5f54fb6559a8@spud>
References: <20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com>
 <20250929-mtk-pll-rpm-v1-1-49541777878d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u4M+BrM+qE9Xid1p"
Content-Disposition: inline
In-Reply-To: <20250929-mtk-pll-rpm-v1-1-49541777878d@collabora.com>
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


--u4M+BrM+qE9Xid1p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 02:13:20PM +0200, Nicolas Frattaroli wrote:
> The clock controllers for mfgpll, mfgpll-sc0, and mfgpll-sc1 all need
> CLK_TOP_MFG_EB to be on if their clock control registers are touched in
> any way.
>=20
> This was not known at the time this binding was written, as this
> dependency only came to light when I started poking at the MFlexGraphics
> hardware, where this undocumented peculiarity made itself known through
> SErrors being thrown during register reads.
>=20
> Add a clocks property to the binding to describe this relationship, and
> mark it as required for the affected clocks.
>=20
> Fixes: dd240e95f1be ("dt-bindings: clock: mediatek: Describe MT8196 clock=
 controllers")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt8196-sys-clock.yaml  | 28 ++++++++++++++++=
++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-=
clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-cl=
ock.yaml
> index 660ab64f390d2e722b7d3e25cf057926da318bc0..41aacd8d5f69050eebdf8392f=
7b652427632f491 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.y=
aml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.y=
aml
> @@ -45,6 +45,9 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  clocks:
> +    maxItems: 1
> +
>    '#clock-cells':
>      const: 1
> =20
> @@ -90,6 +93,23 @@ required:
> =20
>  additionalProperties: false
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8196-mfgpll-pll-ctrl
> +              - mediatek,mt8196-mfgpll-sc0-pll-ctrl
> +              - mediatek,mt8196-mfgpll-sc1-pll-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: mfg_eb clock
> +      required:
> +        - clocks

Don't you want an else: properties: clocks: false here?

> +
>  examples:
>    - |
>      apmixedsys_clk: syscon@10000800 {
> @@ -104,4 +124,12 @@ examples:
>          mediatek,hardware-voter =3D <&scp_hwv>;
>          #clock-cells =3D <1>;
>      };
> +  - |
> +    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
> =20
> +    clock-controller@4b810000 {
> +        compatible =3D "mediatek,mt8196-mfgpll-pll-ctrl", "syscon";
> +        reg =3D <0x4b810000 0x400>;
> +        clocks =3D <&topckgen CLK_TOP_MFG_EB>;
> +        #clock-cells =3D <1>;
> +    };
>=20
> --=20
> 2.51.0
>=20

--u4M+BrM+qE9Xid1p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNrCeAAKCRB4tDGHoIJi
0iJxAP4mU6+C8Eh7IxIoYQL1Qb0tkSwfwCjYaPhrKJSDWD8nUwEAx0m/G5GfkzGq
vzTWSFTPy8nqiETYWXzWi/6gx3Yqpwo=
=JKYV
-----END PGP SIGNATURE-----

--u4M+BrM+qE9Xid1p--

