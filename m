Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6746C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vetZnB8Rm8VfVwLOdkXrGlsQLcsEwAP0m2e4xXUlcBk=; b=WrMiYbB/PZOKmqfYoEKh1c9VGK
	lsXLweWy6RwsCyDLvWd3cHZUpTs82Pp/YmSQfTfyDuCk5HhqLe/tHyozBHm5nxHF/5ccriQ7YeiPS
	vithXQvdFHj3D+DfPNsbSyMc4NP5YPIZBDrjRfORXFz0D9qhYPW1hlQwbJHk0gX0JCNApouulmXJT
	EuVbz58jqfly3R4vLN0FvwZNmb2m+CzB05/CDqpQokZo2PpcYMsMXTgaU4AX6GSPx/koeWP5A88qe
	1gKLJecRR3z8Bi9o+t/O1Gr6jdEJWqzFagsESMxbmTyqoeKXDPmeu60C6YD0CCBqOD0W5o3TvSFaI
	mHjAKQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZre-000000098dd-2nuA;
	Mon, 26 May 2025 15:35:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZpV-000000098Tw-3gNt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 15:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EA105C40C2;
	Mon, 26 May 2025 15:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F724C4CEE7;
	Mon, 26 May 2025 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748273613;
	bh=bTIiweD03lr1R1e1Y1cpiVQxuDlSy72r7CfXuZpCyb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpgzDHq8IAUfoS6wq7qPPTet5n4dB+fg6N5zLp0bkDtKEbqKiCKvQmdUge6ThtwS4
	 g+C5MVkQ+pGzfoPXP0o/Tkn6rBSAOWOoA2UWKgq6Dki7MlIoOxqno7gU81qtidKQsV
	 Lu0eNkLAYn1V+4WYuZn/XdbMRUONGgzhXJetBx6RAXmjfjMik14xR/A4VdqqXxLiZv
	 IULYHBNxYnMoXQv+BLfk96/Sc0DmNGpIaQOtYQksJDLUiV7j1aViQS3np3cpBZ70za
	 Nsb1bW5Fn4uvMFahzAwGKyJO/go310X6uYZ/fxNxj8Fe18s8P/ibtg6AYuCjvW55Zp
	 Va4NqQE45lWzA==
Date: Mon, 26 May 2025 16:33:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: soc: Add fsl,imx23-digctl.yaml for
 i.MX23 and i.MX28
Message-ID: <20250526-corset-villain-8b72aefeba75@spud>
References: <20250523204524.573028-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0HV2Ae0Z+B5ulyZ6"
Content-Disposition: inline
In-Reply-To: <20250523204524.573028-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_083334_201473_CE9CAA2B 
X-CRM114-Status: GOOD (  18.93  )
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


--0HV2Ae0Z+B5ulyZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 04:45:23PM -0400, Frank Li wrote:
> Add fsl,imx23-digctl.yaml for i.MX23 and i.MX28 to fix below CHECK_DTB
> warning:
>=20
> arch/arm/boot/dts/nxp/mxs/imx23-sansa.dtb: /apb@80000000/apbh-bus@8000000=
0/digctl@8001c000:
>     failed to match any schema with compatible: ['fsl,imx23-digctl']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/soc/fsl/fsl,imx23-digctl.yaml    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,imx23-d=
igctl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.y=
aml b/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
> new file mode 100644
> index 0000000000000..47f92f763bfa3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas//soc/fsl/fsl,imx23-digctl.yaml#
                                     ^^ I assume it makes no difference,
but you got a double / here.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale mxs digctrl for i.MX23/i.MX28

I have no idea reading this what a "digctrl" is. I think you should add
a description briefly mentioning what it does.

> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx28-digctl
> +          - const: fsl,imx23-digctl
> +      - const: fsl,imx23-digctl
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    digctl@8001c000 {
> +        compatible =3D "fsl,imx28-digctl", "fsl,imx23-digctl";
> +        reg =3D <0x8001c000 0x2000>;
> +        interrupts =3D <89>;
> +    };
> +
> --=20
> 2.34.1
>=20

--0HV2Ae0Z+B5ulyZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSJxwAKCRB4tDGHoIJi
0gCyAP9LAdE1TGf4om1fs4XgX2jkfTuBjGIU5v+EiwczA9egZwD+L6HUreQw17x+
C0TNwI+EWaCw4LyMxszPbEdFd9lA1g4=
=cgID
-----END PGP SIGNATURE-----

--0HV2Ae0Z+B5ulyZ6--

