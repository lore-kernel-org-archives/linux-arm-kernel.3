Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2119EB28F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MinFAbbVOdoR83Ltkm3t2nF+VJzZlX8cRHfFjmhcvVA=; b=nlGRxInfRfES8sxagpUxnb/BGe
	fM5WU8qhw5aRsGpyckFq1oOWQDKG+D6crKKAjrYtiBPTVq5MCzkgFP8FZZQpIUmwF/tMYtnrp02T1
	7mx/mZWMK4UtskBbd58K/wKL0KUHy/Uwo5w4qY0neVNen7ariLh11SZ4u6CVxu53gvt0rCyCaHx/J
	bRk2JUN/c368NGMR/Z7BoCy5qxvNzTOpk/+Z3COmadRHnsFXSYtTaoe28jiuRA13icvbLKj1msvux
	N4LGd4Pxo8t4cQ73IX7W6tQOmztpPhzhea1DHbDB/pDmSNToeV9oUfMervkEIlEjqBhgqAJZqIwr5
	bLtfaZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHYu-0000000B3eR-2oi4;
	Fri, 06 Feb 2026 08:51:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHYs-0000000B3e3-0RuV;
	Fri, 06 Feb 2026 08:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770367889;
	bh=8cWuy2S8DaSwgYrlkHnpzPAslnN9oEH1hvc3lC/AbEU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S8AZlDAuT2tMkIVDxejZ2ylBzw8HiUymsCvenm5Y7mbTxdH5oxHoRQjgfmPw5BXjM
	 1emUHLByh6Ddnga8GY3MhAcLgsc+xfwjYAGWmz9K5nu8mijtlAa9bKirn25Pw6OQdC
	 qljipE0581+rnnuWrJQLqgf40AWdy7WaUKOvidLL5t8dlI9qyTL0jXgMrsnftiUJlR
	 P0AW6I6LVmqVslOT3T8tPTI9eRIjUGSwOKV3+Avnzq353IeJBCOlpPax5OGl53OThj
	 T7g6Yjc5mxaFSNl0LaF7RFWyiL7mPRdHMp3yUEVrZCd00/TtzsqArmzZaNe2jsgJCm
	 OofRdD7pvKQpg==
Received: from eldfell (unknown [194.136.85.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pq)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C71117E001E;
	Fri,  6 Feb 2026 09:51:29 +0100 (CET)
Date: Fri, 6 Feb 2026 10:51:02 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, daniels@collabora.com,
 ariel.dalessandro@collabora.com, kernel@collabora.com
Subject: Re: [PATCH 07/11] drm/colorop: Introduce HLG EOTF
Message-ID: <20260206105102.1208fff9@eldfell>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-7-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	<20251223-mtk-ovl-pre-blend-colorops-v1-7-0cb99bd0ab33@collabora.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z3McZGD/cduzL_hjq1GrAml";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_005134_326958_8B07A59A 
X-CRM114-Status: GOOD (  18.12  )
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

--Sig_/Z3McZGD/cduzL_hjq1GrAml
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Dec 2025 16:44:48 -0300
N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> wrote:

> Introduce definition of a hybrid log-gamma electro-optical transfer
> function for 1D Curve colorops.
>=20
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/drm_colorop.c |  1 +
>  include/drm/drm_colorop.h     | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index fafe45b93ff8..a19e03fb9c7c 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -79,6 +79,7 @@ static const char * const colorop_curve_1d_type_names[]=
 =3D {
>  	[DRM_COLOROP_1D_CURVE_BT2020_OETF] =3D "BT.2020 OETF",
>  	[DRM_COLOROP_1D_CURVE_GAMMA22] =3D "Gamma 2.2",
>  	[DRM_COLOROP_1D_CURVE_GAMMA22_INV] =3D "Gamma 2.2 Inverse",
> +	[DRM_COLOROP_1D_CURVE_HLG_EOTF] =3D "HLG",
>  };
> =20
>  static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_l=
ist[] =3D {
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index ee6454b08b2d..8ec98521607d 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -126,6 +126,16 @@ enum drm_colorop_curve_1d_type {
>  	 * The inverse of &DRM_COLOROP_1D_CURVE_GAMMA22
>  	 */
>  	DRM_COLOROP_1D_CURVE_GAMMA22_INV,
> +
> +	/**
> +	 * @DRM_COLOROP_1D_CURVE_HLG_EOTF:
> +	 *
> +	 * enum string "HLG"
> +	 *
> +	 * Hybrid log-gamma transfer function.
> +	 */
> +	DRM_COLOROP_1D_CURVE_HLG_EOTF,
> +

Hi,

if you read ITU-R BT.2100[1], you will see that the HLG EOTF has three
parameters: the system gamma, the display nominal peak luminance, and
the display black luminance. You cannot define a HLG EOTF or its
inverse without these parameters. One might assume to derive the system
gamma from the peak luminance, but I would like to leave that as a free
parameter if possible, because I'm not convinced the formulas for it are
universally applicable.

The HLG OETF on the other hand is a fixed function. Did you mean that
instead?


[1]: https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/specs.=
md#itu-r-bt2100


Thanks,
pq

--Sig_/Z3McZGD/cduzL_hjq1GrAml
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmmFq3YACgkQI1/ltBGq
qqfkthAAl9JVF0BXYzyrmP1Q4T70bzj+epbVNcVjVbZlOwqrh+7gVLz7rrchimpN
Sngz1zHLFa91+4ZkuzzGGPqxeCDOVhr0eraz6lrraMo0cWzQdtgfTkKLexw8t4ds
67U5dv/QBYdDTfQRlxlMGM9hXtG044wNJk0QCzeQQvXSSY3sNNzCVf47JvW4VqW/
/P3VfzkIP/VyPQqfeX+OFqthjrnMv0wZLR1e5JxzYtk+bXxV7b+KR249uLy61ddN
4OGn3X2iufMMXyzY9WEq3nOMhhtWG4pzux2KE4OabdbwPRI+fsUadSnVMFQjs7eo
nSD2mFTXG5DW4UNWnnrWeZKdZee74i+G2G8ojWS0zHqFZ9cRjr7WsAi50xbfl1du
tLZKuHwOuX1kPgzEmMaNwrzlT/J1ROuSq/tRd3EXdXu6jqK4Abive/XDu1Nkltwt
MwWkOqnuQ3gnVoGcsEw6Gk71EBl96JlQf1JFBE23FnaarllJXwYYZZVmDtwH1hMx
LWb9YcDcFeKa+qcEsvvVrWZmP9umpN5h4BkJpLypuAKsq5+o6OnnUapHpc0EyLxD
vqsVV/NZJyPXlMhyLcO/DUSefJHZKFZvShxZRXi+DRu7K3utFMvq8Qg9mZaJyByG
CN7kNQAdDQM0ELz7I3pIEleHpeyC3HI80/AA94FgWoh1tdLgTQU=
=jHqA
-----END PGP SIGNATURE-----

--Sig_/Z3McZGD/cduzL_hjq1GrAml--

