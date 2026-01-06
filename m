Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBA2CEFD01
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 20:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8pW4V3E/xkCy1IV+t45Sv4m8qVNjfXs4He412ZSu50=; b=esZG28P0qO5NuDpdXEkoi0GrRk
	mq3Ao9CsqtYWIFC0Zp9o7ejuG4Jr7j0NRXyBgn5+OtLZyWzaqIxQDcG1ofNNn1RCS6/iH2r4t7aBS
	G6v7agUYpdiVmF2bvRXEJdpMYZyOh9xp8B8oaPt/qWLuNPq2ZFWtdWdlrmyjN+owOojVDPlTqfTiU
	lMtWJGPUT4lCzhP+VHleKx485hWKiNnN9PekhBH0GB38Occ3lfrSiESI54W0xwUa5GEarZMzOl3S6
	mj+SRX68tZewvKBW5Fq8l6gaGPLQz4HgeHH9tm8VSMMU7f/DEw9Xk0b/zJiUB14rxgQbzZvxm+21q
	Jen9HkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDKz-0000000Dnmb-0bsr;
	Tue, 06 Jan 2026 20:07:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDKu-0000000DnmB-2cTx;
	Tue, 06 Jan 2026 20:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767730040;
	bh=6vCvCpWevWY66jWQqRM/QOQ6GVMd9id6Itqb4gvVzdk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BaPnK1NxjtdpF/Dn8oFg1gj90KZdYCLea3LJNrpuGZCgmLRknjkeOjF/QJTfGFURT
	 3GmViWfd7J6vyutO1xSqDHXjV7iPuxKsfkBNRVcKsSgS4hsOKPZZ/vLSv4PFs094g2
	 9jFf3FJyU2TbcTvs8pB2aGoLSFFJDJM/EaH9oDb8sHvUd6Hh76xPcxpJdNPQERW6st
	 HfWDvgzJcViZ8DpFyg+IIyI9tq8bmgsHfpIFu1vAJiEQuDPLplkA5vP4SAeOUDsCkO
	 c0YvGwUmZKMcxNavo6S7071ui01HsryQ1U2slYKErDImJXwpsP9P9mN5pg3EjTMQZs
	 rAQF284RmGF6w==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C17C17E0CB0;
	Tue,  6 Jan 2026 21:07:18 +0100 (CET)
Message-ID: <70d2b73a4ec06bef75d7f4ad415ad654cf80ecf6.camel@collabora.com>
Subject: Re: [PATCH v10 5/7] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 	conor+dt@kernel.org, heiko@sntech.de, p.zabel@pengutronix.de,
 mchehab@kernel.org
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Date: Tue, 06 Jan 2026 15:07:15 -0500
In-Reply-To: <20251215085349.10155-6-benjamin.gaignard@collabora.com>
References: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
	 <20251215085349.10155-6-benjamin.gaignard@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-NsLgZPrOWbKHfJXnykTm"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_120724_898141_3A601BDA 
X-CRM114-Status: GOOD (  18.66  )
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


--=-NsLgZPrOWbKHfJXnykTm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 15 d=C3=A9cembre 2025 =C3=A0 09:53 +0100, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> AV1 is a stateless decoder which means multiple AV1 bitstreams could be
> decoded at the same time using the same hardware block. Before decoding
> a frame it is needed to restore the iommu tables to avoid mixing decode
> contexts.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

With the config fix you mentioned earlier, you can add my Rb in the next
revision please.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> changes in version 10:
> - Fix build as module issue when Verisilicon video decoder is built-in.
>=20
> =C2=A0drivers/media/platform/verisilicon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../verisilicon/rockchip_vpu981_hw_av1_dec.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 15 +++++++++++++++
> =C2=A02 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/Kconfig b/drivers/media/p=
latform/verisilicon/Kconfig
> index 3272a24db71d..e64bc8b55235 100644
> --- a/drivers/media/platform/verisilicon/Kconfig
> +++ b/drivers/media/platform/verisilicon/Kconfig
> @@ -49,6 +49,7 @@ config VIDEO_HANTRO_ROCKCHIP
> =C2=A0	bool "Hantro VPU Rockchip support"
> =C2=A0	depends on VIDEO_HANTRO
> =C2=A0	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	select VSI_IOMMU
> =C2=A0	default y
> =C2=A0	help
> =C2=A0	=C2=A0 Enable support for RK3288, RK3328, and RK3399 SoCs.
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4703bb6be7c..d9e68e0ded68 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -5,6 +5,9 @@
> =C2=A0 * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> =C2=A0 */
> =C2=A0
> +#include <linux/iommu.h>
> +#include <linux/vsi-iommu.h>
> +
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include "hantro.h"
> =C2=A0#include "hantro_v4l2.h"
> @@ -2095,12 +2098,24 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct =
hantro_ctx *ctx)
> =C2=A0	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);
> =C2=A0}
> =C2=A0
> +static void rockchip_vpu981_av1_restore_iommu(struct hantro_ctx *ctx)
> +{
> +	struct iommu_domain *domain;
> +
> +	/* Before decoding any frame iommu context need to be restored */
> +	domain =3D iommu_get_domain_for_dev(ctx->dev->v4l2_dev.dev);
> +	if (domain)
> +		vsi_iommu_restore_ctx(domain);
> +}
> +
> =C2=A0int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
> =C2=A0{
> =C2=A0	struct hantro_dev *vpu =3D ctx->dev;
> =C2=A0	struct vb2_v4l2_buffer *vb2_src;
> =C2=A0	int ret;
> =C2=A0
> +	rockchip_vpu981_av1_restore_iommu(ctx);
> +
> =C2=A0	hantro_start_prepare_run(ctx);
> =C2=A0
> =C2=A0	ret =3D rockchip_vpu981_av1_dec_prepare_run(ctx);

--=-NsLgZPrOWbKHfJXnykTm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV1rcwAKCRDZQZRRKWBy
9D3iAP4vmq6NU5wkVXjJbhK2nVtJnaeTvw32c9vlufHhZ1L3FQD/YCmEiCWo2Nbq
RsSiwxIPnq6ptHDWPcgpHrAsxpfPuw0=
=mryd
-----END PGP SIGNATURE-----

--=-NsLgZPrOWbKHfJXnykTm--

