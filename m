Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E8AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B98HNvGyi50G7oVdpBEgYyIf/5Ft94M5X5IoSLvSxA=; b=QpPSN2Vh+G1vhHrHzfYe1/eCW6
	NGy//zION1hOwvXa7zFFgHdWmwBcpNI3RCUyvrSLLjqOlEoLrOiM1D2ILxxru7YKGymvxtBf9avU4
	mbX+GLapQPs5PElJIFWVep6chUbiIsK9GHyhqvFLT04edIV1eFfSf+0w2/kI+lyeLhApqpx+cyw1Y
	L1gGuW/9CGKAplJlwRH08yYOiw35rWSxjtmwKabU2dZgBxd5Jc1t9b+dFb2M/sO8b4TmzTrraYTyw
	WJC4NA2bjzfv7W905/d3zcXz1+ITUQGZDd2H0TYpPyg2MGZtwa3uCRp6hzFgr6KUQpmuIxYP3INDe
	dtj8i+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcGc-0000000EX47-1ZwA;
	Tue, 17 Dec 2024 18:25:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcFU-0000000EWmk-2uEl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 18:24:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C579A40FA3;
	Tue, 17 Dec 2024 18:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A90C4CED3;
	Tue, 17 Dec 2024 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459887;
	bh=WmVhbvyITgDCUN/Q9QgBlJc5BHM0NXp2JvRUV7TbNx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlQT8h2Gba0qDyGj0NxRkEsTbuCxVEUeTs9AR2Zg/fj4qjjAgZfxdNs8hk2E2P/5h
	 TyjVTn5z+6DwPfYTjhhTiGOP3le/rTpuCeX4rIru5835orQ3MLq4cmsqiI6nXTRxMG
	 QYbirz1BpNceUoIDBYa5GZonOsOD0DRbVPCyRA3qSukm6Cp7V53kEDBNDlal18jojY
	 FJOc7loci9KKJPtMEFZVGMp7IJJjF4pAMp3ihHDdNAVr/HlICmvD8+TTssKvdy8E80
	 RZqZBVZzR5spmQJE9wZcVbjF88m+5hcI6Ctq2lQSoX277tBS4mbef77dV/mIQDWZRN
	 Qbgge9+ybbO/w==
Date: Tue, 17 Dec 2024 18:24:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: media: clarify stm32 csi & simplify
 example
Message-ID: <20241217-crawfish-tiring-792c535301d0@spud>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xXE3zBG6hEnuSLIF"
Content-Disposition: inline
In-Reply-To: <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_102448_860336_D4FC998A 
X-CRM114-Status: GOOD (  16.36  )
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


--xXE3zBG6hEnuSLIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> Clarify the description of the stm32 csi by mentioning CSI-2 and
> D-PHY.

> Remove the bus-type property from the example.

Why? What's there to gain from the example being (seemingly?) less
comprehensive?

>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yam=
l b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> index 33bedfe41924..e9fa3cfea5d2 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> @@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: STMicroelectronics STM32 CSI controller
> =20
>  description:
> -  The STM32 CSI controller allows connecting a CSI based
> -  camera to the DCMIPP camera pipeline.
> +  The STM32 CSI controller, coupled with a D-PHY allows connecting a CSI=
-2
> +  based camera to the DCMIPP camera pipeline.
> =20
>  maintainers:
>    - Alain Volmat <alain.volmat@foss.st.com>
> @@ -109,7 +109,6 @@ examples:
>                  endpoint {
>                      remote-endpoint =3D <&imx335_ep>;
>                      data-lanes =3D <1 2>;
> -                    bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
>                  };
>              };
> =20
>=20
> --=20
> 2.34.1
>=20

--xXE3zBG6hEnuSLIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HB6gAKCRB4tDGHoIJi
0igKAPoDrf1wD6vhulE5XAy6M4DSbGrhREGhL8rIC2ao7oWAHwD/TCNKL8PFi+YB
35xu7mty1a7YqzisPAib+kIEA3XxSAw=
=g7v+
-----END PGP SIGNATURE-----

--xXE3zBG6hEnuSLIF--

