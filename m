Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20534E69188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 18:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+FtLMtWNpKULLmd3K8NNsS/XMu6z2ERGdnDAQCM4cA=; b=AczYvAwtO+7yOisnDxCh3J5RDu
	I/Vtou4zPkZb8HrKB03/QDOgOgQd+RUO2qKrzXrXJWGwtCkYj1bNajJXinoDwmBhkfMLVUHlA6cxx
	BlhKVPZS01c04s5kVfgkO/oJFNOqm+yNWQzCr0ugnzvq2rC01BFEBABeiyDhAYxccm539TsA0oBxy
	n8I+hyOJx8nRc7iVEpaFo3Mx3A2TeSlDwf0oHVqdyvfYsKuDWT9YvcM7LNqcMH+r6wwUmufBAKQsn
	a247NDJ+k3SkyFiA66eAGfwDhV2cWWVtDOPW9P27eb4bObWcjYi42UIsdkKBrNW+yk7O10azEqiA+
	oNUDTEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYlC-000000039Rv-2Os2;
	Fri, 22 Nov 2024 18:52:06 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYkE-000000039Gg-3Aw2;
	Fri, 22 Nov 2024 18:51:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1732301455; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gInYdvLqG1o6ZdSbDYACNnLl1deipdaNI1bOigW4cNoq9DztwKU9D6lGf5ljEoKN/k6KH2+jyYN7/O/sb4AmkRSOi7TD2HF14ZqAX6JZnqQEELmNbcw/5F9yXbsvKAkgjKdMvG4dkGHm4vBpKmBj6CFH8pxhmrhgaU7GhXuh61U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732301455; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S+FtLMtWNpKULLmd3K8NNsS/XMu6z2ERGdnDAQCM4cA=; 
	b=YWpOMkjCSC3NC6o9mlOv0L5H6UKGjOj5Plwth6zBMSgNigCCCZVNqGLkmyJLwneQcFzgOh17yOefN8v7GHxtYf28CZFGp/5jH+4c7loTnXTBbgFrZqyIM2M7b+iJQyXYslAp+87KLDU7SByHVx0DcI9HqjSdivmgtvpBvg8JVOU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732301455;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=S+FtLMtWNpKULLmd3K8NNsS/XMu6z2ERGdnDAQCM4cA=;
	b=hoIXMCZjIC3/A6uPhIPVnz2hIwmPI8EHKezy2lDoJp563zJwnFbGT+/vp29I/CKc
	7Iyg/Na1WkChFoKtosaFO3wL8boU+5B6N8ul2wvSSHt7ge0MrupOVUF/2lKqDqfuzGl
	xY51sefp+tDCV3JDIwtimuF3XNM2bT9ckfK7kYyA=
Received: by mx.zohomail.com with SMTPS id 1732301451890468.4328585076563;
	Fri, 22 Nov 2024 10:50:51 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
	id 058D410604B0; Fri, 22 Nov 2024 19:50:47 +0100 (CET)
Date: Fri, 22 Nov 2024 19:50:47 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@theobroma-systems.com, hjc@rock-chips.com, 
	andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Heiko Stuebner <heiko.stuebner@cherry.de>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk
 verification
Message-ID: <hmdbq56pv3hzzeewh2vy7khe3zr5yz7loas62antivuq2yl4lm@oyojcydl2u42>
References: <20241115151131.416830-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2eeu7mhffudy7uue"
Content-Disposition: inline
In-Reply-To: <20241115151131.416830-1-heiko@sntech.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/232.275.92
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_105106_846100_3664AB3D 
X-CRM114-Status: GOOD (  21.56  )
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


--2eeu7mhffudy7uue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk
 verification
MIME-Version: 1.0

Hi,

On Fri, Nov 15, 2024 at 04:11:31PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> The clock is in Hz while the value checked against is in kHz, so
> actual frequencies will never be able to be below to max value.
> Fix this by specifying the max-value in Hz too.
>=20
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Acked-by: Andy Yan<andyshrk@163.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> changes in v2:
> - drop the separate vp3-config patch, as vp3 will always get the leftover
>   resources, so _should_ be fine (Andy)
> - fix error output to also report Hz for the value in Hz (Quentin)
> - add received Reviews+Acks
>=20
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 9ad025aa9ab0..0c8ec7220fbe 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1864,9 +1864,9 @@ static unsigned long rk3588_calc_cru_cfg(struct vop=
2_video_port *vp, int id,
>  		else
>  			dclk_out_rate =3D v_pixclk >> 2;
> =20
> -		dclk_rate =3D rk3588_calc_dclk(dclk_out_rate, 600000);
> +		dclk_rate =3D rk3588_calc_dclk(dclk_out_rate, 600000000);
>  		if (!dclk_rate) {
> -			drm_err(vop2->drm, "DP dclk_out_rate out of range, dclk_out_rate: %ld=
 KHZ\n",
> +			drm_err(vop2->drm, "DP dclk_out_rate out of range, dclk_out_rate: %ld=
 Hz\n",
>  				dclk_out_rate);
>  			return 0;
>  		}
> @@ -1881,9 +1881,9 @@ static unsigned long rk3588_calc_cru_cfg(struct vop=
2_video_port *vp, int id,
>  		 * dclk_rate =3D N * dclk_core_rate N =3D (1,2,4 ),
>  		 * we get a little factor here
>  		 */
> -		dclk_rate =3D rk3588_calc_dclk(dclk_out_rate, 600000);
> +		dclk_rate =3D rk3588_calc_dclk(dclk_out_rate, 600000000);
>  		if (!dclk_rate) {
> -			drm_err(vop2->drm, "MIPI dclk out of range, dclk_out_rate: %ld KHZ\n",
> +			drm_err(vop2->drm, "MIPI dclk out of range, dclk_out_rate: %ld Hz\n",
>  				dclk_out_rate);
>  			return 0;
>  		}
> --=20
> 2.45.2
>=20

--2eeu7mhffudy7uue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmdA0ocACgkQ2O7X88g7
+pq+OA//auA09X+F19vqyltYszS4rFqnQHuB4VhXl2Tt3aPbMHzg0JHlYHZqdl8o
hXEBxgTCOMULUc0+yK/mfTdeOYtFwrDjXrfTxNvkrKuUvkW59rlZK5+eFrINVoYB
+1B4/kAckcEBbuNuHEYm1IjDNZtQQ5cmidoX0X4BAcXpXU181JjVusfXbmZeryJW
sTY/Dj3Uva0JGhUz1vghwpHxgOy8ZVGdNXcfu86ICF04/3bnTAmoZrDFNiX6qz57
i5jLi9HtAs9gzgW4KNzX8TzRzlWGKZMxiTAc71AfZXrS0oReotkGFKr1MRQga16V
94jQa1VrK2xUPXKl7XOjJN+29+N8pUFDqd8fVUW7+X6xaS9oD5axFADpEaLltfBT
8bInVEuXx4g0/DWoA8/eLXwEo4p5XbZC0ZGCnE5GJ4eAGZnorSJPcC//I52DJzOt
XPobbijNgdexFdPV9q+GEaDQ235fQosoCNeJ6YQbVZY7AgVZ8/QTUWNgEzI6Akrl
084Lyf++bIYLk1Bxtp8J7AVs2t0HQ2LpZoB6TdbANkG7wbGKJxPXXBahk3KQchNq
QkUczep6xS/gvZc57g8+4QEa0bHWN48dmBFXV8y9p8/oFpAbjOL9W+xogVoT20RL
QKinHDk7Ucho/J9lyems96suStxkV70OhpF0vJ4jE4ey2eMDzwI=
=oZX3
-----END PGP SIGNATURE-----

--2eeu7mhffudy7uue--

