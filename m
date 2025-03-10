Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3833C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4ggpTqlf9R8ey14xSU2+Q/2M8xk/seEyYj0kku7tLg=; b=JeeHpmU7F79IayQufIEoYLfB/e
	J0mE5eS5RC8JWzX7wiDjkFKOIckdux9Pg64FLF8ejjblecloWau7Faln3UOIpIsmaFUQ6joltUOUM
	wgI2TLLFMl/bL9a/FFfGH+l+Dc6ToEPd06Ne28SwPxr9BE5AtYgSvBZB19jy5xJ47br0IecY62V4I
	0Z4CGtBvIH8F0UKHVC0QSCwtpQYk4/cBSoJHJRibCaaIqYiGmRzv6+9OpOXwHgmyrSQWOQcLiypw7
	QoZUv9SF5wVt7haPDriVVOJSvGHN0vm6uL+D3phBLI4Hx+93eT6sV9YQcwI3IVA8rwBIBNNvSszbC
	G878H3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgbb-00000003Rx3-2NwJ;
	Mon, 10 Mar 2025 17:07:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgJk-00000003OYV-07dS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07913A46087;
	Mon, 10 Mar 2025 16:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEF5C4CEE5;
	Mon, 10 Mar 2025 16:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741625366;
	bh=XUiWyHwI4Vxt1OJNKKDv1Etb8h9Z/vi/oeIFxbkHNkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4+/EqRWTbjykk1EFMzcNIRqB+I32bKyVBDmEQtowE1KL82pRRCezE8mg6mZ/feqi
	 fDiHjF0GVntnfRVHVy8dR53O3+FPfaHnfilD0JNcohxr0EKiSGtkm0NvkE4Y4cVqJU
	 FtULpUP4pLHxpLoARU4ol/cAR0bPQ2bYSP4Nw0A3VHQHEtf5QPJJzSxpDm9uoRUwTI
	 Ek00FHbXRQtUHY3CQfa83KODtzrj6QIRgYxye0jizw7rR7wx/b4D9rP5cKot0HGDQp
	 A0Tfu3bxkbHZVbUi0lsnARbLm5Zsn8dg7qYzLwULHrk72rmlx4HUL4S99LnMYDMY3z
	 +uORw6VRge1sg==
Date: Mon, 10 Mar 2025 16:49:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: fsl-mxs-dma: Add compatible string for
 i.MX8 chips
Message-ID: <20250310-either-ambulance-541738a32b2c@spud>
References: <20250307215100.3257649-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="larkxOhmSP7+JbNi"
Content-Disposition: inline
In-Reply-To: <20250307215100.3257649-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_094928_128171_CD63604F 
X-CRM114-Status: GOOD (  13.66  )
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


--larkxOhmSP7+JbNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 04:50:59PM -0500, Frank Li wrote:
> Add compatible string for all i.MX8 chips, which is backward compatible
> with i.MX28. Set it to fall back to "fsl,imx28-dma-apbh".
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml b/Doc=
umentation/devicetree/bindings/dma/fsl,mxs-dma.yaml
> index a17cf2360dd4a..75a7d9556699c 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml
> @@ -31,6 +31,12 @@ properties:
>                - fsl,imx6q-dma-apbh
>                - fsl,imx6sx-dma-apbh
>                - fsl,imx7d-dma-apbh
> +              - fsl,imx8dxl-dma-apbh
> +              - fsl,imx8mm-dma-apbh
> +              - fsl,imx8mn-dma-apbh
> +              - fsl,imx8mp-dma-apbh
> +              - fsl,imx8mq-dma-apbh
> +              - fsl,imx8qm-dma-apbh
>                - fsl,imx8qxp-dma-apbh
>            - const: fsl,imx28-dma-apbh
>        - enum:
> --=20
> 2.34.1
>=20

--larkxOhmSP7+JbNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ88YEQAKCRB4tDGHoIJi
0lKZAQDr225yfRoRFlt+qxcw8GhROf/Qi13nYKV/U8XrDdEYlwD+NChVWxFGNI/W
+sC4s9WDIuQNt0zbNBIMR+pWkiX3AA4=
=+r4I
-----END PGP SIGNATURE-----

--larkxOhmSP7+JbNi--

