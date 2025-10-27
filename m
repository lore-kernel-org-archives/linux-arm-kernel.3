Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D67CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYFp8pOparVgS+yFRxSpLQ3uEVQ1DEZGHP+EhGTepQ4=; b=WtaUwV71QcWoau8vXMc1gef2cQ
	dOibdGnMYvYnp5s5akeUjVhmHrI83l31XrlsDWIALb2BbSRMpG0YSDpQawyOhbCIxPWf08YEx0P0x
	dq0wAL4zXy3OL2hPja17zrvht9JCfKFrQuQkcZ52iDL2gMSsIapqhgGcn1BRb2bl6Ra/Lb7LvQETH
	H0gy6TiTZNbTTHRDMYdoORCiHhA/EYC81MoL10JpjqMkG51lXZy8Ws/veNeauCYyEtzRHHNhtExho
	uvP+Zkgs/GY83XaEzYWHaD/tDP/MYuVY+4g6Tjz50ZacHiGwjpSzmH3B7g0zsmHZv5+ec113N8R4L
	Dw30xPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQRl-0000000ENGN-26o4;
	Mon, 27 Oct 2025 16:51:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQRk-0000000ENG1-0hYx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 16:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KYFp8pOparVgS+yFRxSpLQ3uEVQ1DEZGHP+EhGTepQ4=; b=NzrDp2VJvUN/0z46PSdc/e2vQB
	TmTs73AM18BuZ4YENiWkLjXlOsTyjfqq4G2YVyGBM/dDUAz0r0OOWi/g1dH57+A4AZQ061DbReqBc
	PDxiYOvbv8lsUM50/u/Vr+VJm2Azekv45AmLSPR/7/a632IFlN8jAjTlXcwP2kxssOBJCQbZZ3LG1
	yAepsvDd19SH/fwW4Ik9dUbr30T/Osk2PIzfgYeVNUcB/KRug2kSPHc/rtcYTOlgtTQUtza5jw8Ha
	JmlLSDgNobm0VLCe5XGMMsUC2LjNeVcLGTpqk4gJwr07vqOdtwMVf/JQe9H01fewTcADLj42e4jQs
	15pkzz0g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPZx-00000002c07-1e0j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:56:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E85E64573A;
	Mon, 27 Oct 2025 16:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566DEC116B1;
	Mon, 27 Oct 2025 16:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583905;
	bh=bu/lKpmMPWH4T4b2scw9A8ku2NQlDdZsGjrmXtEeFCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0N7dVIxW3H5gN2pyjSsDsfNPiXgjx766SAXrI8ledXe2VJ2lMPjUqpgcy0z5cRGS
	 kgIHo6F7APQLaYfucRkbBvvJLgAeWGhXoiYIVQLLLWanw7xjwioYvtYL43YusmRm1h
	 z99ObIGGqefScff7FnhiMfa+OPm5N/VUaOqjeL9npaJryV/h4LrV6PaArOi222Jmxp
	 PfEv12M4KiHnEBB+iGTKTDyDQ3zP+S8wyN72sxPggZ9WE7it1dANyVI36xAc8AVThQ
	 NDL2CdmvMXAZw8tOhaD30rhkmeFXUgnXPg00pdEm3sKrmIbv9FNuI+KOxVN562mvW/
	 Latd97tc90Sgg==
Date: Mon, 27 Oct 2025 16:51:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Jun Guo <jun.guo@cixtech.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
	linux-spi@vger.kernel.org, michal.simek@amd.com,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: spi: spi-cadence: update DT binding
 docs to support cix sky1 SoC
Message-ID: <20251027-strangely-reverence-6f47d87efca5@spud>
References: <20251027084239.2610141-1-jun.guo@cixtech.com>
 <20251027084239.2610141-3-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qZ7N/F0wEws9F2Jt"
Content-Disposition: inline
In-Reply-To: <20251027084239.2610141-3-jun.guo@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_155617_635496_64356280 
X-CRM114-Status: GOOD (  16.28  )
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


--qZ7N/F0wEws9F2Jt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 04:42:38PM +0800, Jun Guo wrote:
> - Add new compatible strings to the DT binding documents to support
>  cix sky1 SoC;
> - Adjust the configuration of the compatible property to support both
>  single-item and two-items cases.=E2=80=8B=E2=80=8B
>=20
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> ---
>  .../devicetree/bindings/spi/spi-cadence.yaml          | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/spi-cadence.yaml b/Doc=
umentation/devicetree/bindings/spi/spi-cadence.yaml
> index 8de96abe9da1..e75b142a1368 100644
> --- a/Documentation/devicetree/bindings/spi/spi-cadence.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
> @@ -14,9 +14,14 @@ allOf:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - cdns,spi-r1p6
> -      - xlnx,zynq-spi-r1p6
> +    oneOf:
> +      - enum:
> +          - cdns,spi-r1p6
> +          - xlnx,zynq-spi-r1p6
> +      - items:
> +          - enum:
> +              - cix,sky1-spi-r1p6
> +          - const: cdns,spi-r1p6

This doesn't apply, probably needs a rebase on spi/for-next?
Approach is correct though, but it'll be a more minimal patch when
rebased.
pw-bot: changes-requested

> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20

--qZ7N/F0wEws9F2Jt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaP+jHAAKCRB4tDGHoIJi
0lwvAP9dIvvZKdNHcniRy6tvBX0PUWhJlaEexqHWrbXPKt0FTAEAkY8vPORYUHc7
VeoJdBGzXyTRjF7Wkm5YpF+RkT5zZwY=
=HLOL
-----END PGP SIGNATURE-----

--qZ7N/F0wEws9F2Jt--

