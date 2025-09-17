Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271FACAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 20:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSGpqx9RKB4TVTBh62WncTVOvgvXMxPnqIRQg9UM9PU=; b=DPT79VXIrOvYs8YMSgJZMBFh+J
	+biYNc4LNEyqMCJ14BEgJ3T0Sabw8dA2UeT9V5z56e7Zbbc4H20s70G9Ss567wRlzBm2UD7ODvZFo
	jEf0daeZyBF1j+eZEHYIAgodUpzZo7iVBNc971ed9xMdi4zwGhTOyMWpN/ekE1vz+gLyrNn5T8wyj
	Y5vkvxois0V8ZpzR12ucQjTbPqsFOlcJ3tQ2MwPQ6UhX20bd8mCiP6AH9zYwEVZxYO+CXe4tZvSd/
	9wNt+GOASK6Xhvgv+K2LVYhg0E4RPCyHVfTGatdZ1ZLxF4doDNus/hSSI3vmQ7dfkOYB13GzdAPK5
	gBb+QSfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyz2n-0000000EfOM-0XAW;
	Wed, 17 Sep 2025 20:46:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyz2m-0000000EfOC-05Dh;
	Wed, 17 Sep 2025 20:46:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA85D60055;
	Wed, 17 Sep 2025 20:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD8CC4CEE7;
	Wed, 17 Sep 2025 20:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758141981;
	bh=Q7tEg7j6RoeNTPDbkPDwYQZ4S4HAyyfHpt8dOtQ51LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fAI/VxToUrsecvVHKVmqk9VbhbcxWqYiBnlN2OtEyK8rG+sf/HpexHmcMevAnavzW
	 bOhKM+dSfNmxXNNrzqi95s1GO5vs0U0soS6PDR+/gFoiosXTTZpt5W0/ebQNHvzuCv
	 +dh+HXKJyB3ADR6IW1ONBsIL/0PM2IyFsUz1u2vQ1Mbk27nVOvksvXRbzIlW1ObpOx
	 9xEs9JUnMfwZI4NjujxGuxxMdeGipn8RdHCkcx5ire3+Rfug/1WWWaDVEwLaonXJXw
	 tEpK3I+ButqFA2LNfe3shW80zhphJHKrUtBYuz9lpGouIKIrbwlcpJJT5ZPDTowq/8
	 IA8hGzyCMY41w==
Date: Wed, 17 Sep 2025 21:46:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 05/25] dt-bindings: rtc: Add RDA Micro RDA8810PL RTC
Message-ID: <20250917-contort-sassy-df07fd7515a0@spud>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
 <20250917-rda8810pl-drivers-v1-5-74866def1fe3@mainlining.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O1or/w1/nkDw62h6"
Content-Disposition: inline
In-Reply-To: <20250917-rda8810pl-drivers-v1-5-74866def1fe3@mainlining.org>
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


--O1or/w1/nkDw62h6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 03:07:22AM +0700, Dang Huynh wrote:
> Add documentation describing the RTC found in RDA8810PL SoC.
>=20
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
>  .../devicetree/bindings/rtc/rda,8810pl-rtc.yaml    | 30 ++++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml b/=
Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3ceae294921cc3211cd775d9b=
3890393196faf82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/rda,8810pl-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RDA Micro RDA8810PL Real Time Clock
> +
> +maintainers:
> +  - Dang Huynh <dang.huynh@mainlining.org>
> +
> +properties:
> +  compatible:
> +    const: rda,8810pl-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg

Your driver implements functions that turn on an alarm irq, but there is
none mentioned here. What's going on there?

Additionally, there's no clocks property? For an onboard RTC I'd have
expected there to be a clock sourced outside of the block.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rtc@1a06000 {
> +      compatible =3D "rda,8810pl-rtc";
> +      reg =3D <0x1a06000 0x1000>;
> +    };
>=20
> --=20
> 2.51.0

--O1or/w1/nkDw62h6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMseFgAKCRB4tDGHoIJi
0sWyAP9Pj+b7KS94r+iyIUxvze3+ElD0xbnurxdnvk1gDdsMmAEAv1EDMSlyOted
5VPH3fsR8ktajxFUxMY4tUTjDq9tcQM=
=h7MI
-----END PGP SIGNATURE-----

--O1or/w1/nkDw62h6--

