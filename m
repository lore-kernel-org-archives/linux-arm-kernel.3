Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0815E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZCd0ACy/nJ3aPlOXvjiIfdMWMqaxSbSsMDhebyaBS4=; b=fYoSGEC0o2uiTji3QJvZwan/sH
	omejkEEuH0RVr9e+QsYHMHNn2mppk5hhK08pIB3zHd9wAnra+VLc8papEmiyJLgN7OABYUeIWeJAk
	oE0WZbNGufFrMP4YZhRk+xhRyYds19GRfZteo6YILBjXQC7Y5BPeYsDH7r9R/B4xf5+AHnFTFqaEm
	y3a1j0xoIlQhMastyL/NLpGoQcXxyMy3eLoJa+sc8pRlldijtdGS9gHdNMK4pafzoNT2VjfuubX5M
	miW9vYnmskyfhS+Rk/Hp11i3PW/1z4tfjbD9Jw089JI6NXtYDTjIH4qNU0yyIdmNf8954rmYc62G1
	xITNNhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tREOg-00000000kKl-3qup;
	Fri, 27 Dec 2024 17:45:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRENW-00000000kE8-1kR3;
	Fri, 27 Dec 2024 17:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48F655C337C;
	Fri, 27 Dec 2024 17:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0A1C4CED0;
	Fri, 27 Dec 2024 17:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735321441;
	bh=rVom9/ZZasClWq+RMKE/v1dwwP+Hq6n5W8W09rP7IWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/lIsLKIkBgXKQ34U15BY9lLur9y54xTZbPqCUrcmmK2ht5tdH6XqQTBo2iLHC8IT
	 bUk77LLzfY/XK+BTYPxUmSv5IV+d7yhtyEWHZzthhrcE3Lzx08Sn/D+rQOaQFgfPkW
	 IjCrvyFqLKyEDWzHv6y8jY4XcXEroGzvmNf7RSsK01wrFBESprsDn/GIcLt4RlEQEY
	 UcT9GOtN6QD3rN/PaaiouEAqbPdDRkZaJbyPnaL/4/y6mDB2BpUrsrEnWz9946MTv/
	 87rxQqBFe+U+WLGNikhg91j7MahXyIEO0XrFvFDYH7xGIEM5DZNLq0SRRg0dci09NS
	 4z+1VI1TDGtNg==
Date: Fri, 27 Dec 2024 17:43:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 03/22] dt-bindings: clock: sun8i de2 clock: Add
 PLL com clock
Message-ID: <20241227-swept-seduce-d21e6537ddfc@spud>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-3-abad35b3579c@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0jjBOv89hldoMdhb"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-3-abad35b3579c@linumiz.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_094402_556971_C150C9AA 
X-CRM114-Status: GOOD (  15.97  )
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


--0jjBOv89hldoMdhb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 06:30:52PM +0530, Parthiban Nallathambi wrote:
> Some platforms like A100/A133 also uses pll-com clock as additional
> clock source for the display clock. This is not documents both in
> user manual and DE 2.0 specification. These changes are mainly from
> vendor BSP.
>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>

Ditto here, the new clocks are only in the new IP you're adding so this
patch needs to get merged. When you merge them, make 2 clocks all that's
allowed for the existing devices and 3 clocks for your new one only
please.

> ---
>  .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml         =
| 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t=
-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83=
t-de2-clk.yaml
> index 70369bd633e4..3e00905b66ca 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-cl=
k.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-cl=
k.yaml
> @@ -39,11 +39,13 @@ properties:
>      items:
>        - description: Bus Clock
>        - description: Module Clock
> +      - description: PLL common clock
> =20
>    clock-names:
>      items:
>        - const: bus
>        - const: mod
> +      - const: pll-com
> =20
>    resets:
>      maxItems: 1
>=20
> --=20
> 2.39.5
>=20

--0jjBOv89hldoMdhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ27nWgAKCRB4tDGHoIJi
0laCAQC3f8JN+f/M1J2eeAFVurWF99YyrOoc11b9kgfjtf1thQEAtw4OLJJ4yje4
qC320wF5zcGFYDEFFJjXa4TfgosTGww=
=cfWT
-----END PGP SIGNATURE-----

--0jjBOv89hldoMdhb--

