Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347D2EE6B60
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 20:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHdXm9WWMmVE1P+5Cg1ses+ffyZGwlkBff9NrQgHMSg=; b=rc+1tw//NSmo0x9Nhk5EkTIohV
	Mtv52EoDmaZ0OqT3rS+bgTYekPyVCGRzouVyn3GcuC3bB0UP+EKuGwMSH3L+++5U/8bDxt46GJDa7
	J72fQWm99WJ1i8jVnRCcdHEWQbxFAhqeChbjut8VchcMYcXmas7NRUiTKhlZkVKeVmtHk7hNvRdmW
	39n1NK2OxT6XhM536z7BsikRjWIOP0CGEH62cMh7JQuO3DgU0CF+qAOLMkldE2U/wZvqlh2vgDLWN
	cauubqb7HZSoDOKqv9rT7ZdLRa/o7S91fk6LucDw6CkEoPfL7DxwSEKkDi/MVh+Ug8xRf84siV6n8
	y1+8H1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSvf-0000000BpPQ-46LA;
	Fri, 06 Feb 2026 20:59:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSvd-0000000BpOr-0SFR;
	Fri, 06 Feb 2026 20:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770411585;
	bh=jXqEJEGiXPhD7zWPLuNoLbQ/40GXnh/bGuHL6XDHfek=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=TdpfGr1olNIIlB9hGxiPuShvtxZDAHT7HAWgwZoTmZai4SeKIGTo7dtrysq9o7ktp
	 e0ALbI/bUt62nKdexqz3rUhKjTT+YE+vjtYx5RDiqtUPIlZMqc+d2OPDLJNPXCjEvD
	 D3EWlm9fSeyhNhjs+ABoWFsatKPpAbRHiA/DZ837Y66j7Sy5MtCMzU9QrmdsKFHsAU
	 YnHHKFDXKWUFLfhb6iUqIqWwzH92K0TzoCXCr2cMWXKasQ1dBtB7Px7zntmzrd84Wu
	 2K8GWgbzDr94dTxQ7BTy68PUTQ0vHO6ukpHC2IpBb+O7O/tBC0U4aRhGZ0ykvXExpU
	 ncrLNdfHPsrIA==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 00CFA17E1013;
	Fri,  6 Feb 2026 21:59:43 +0100 (CET)
Message-ID: <600cc65678331b0c419d0b517d6c9003481223b8.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Improve handling missing short/long term
 RPS
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, Christian
 Hewitt	 <christianshewitt@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Date: Fri, 06 Feb 2026 15:59:42 -0500
In-Reply-To: <20260123192244.1441637-1-detlev.casanova@collabora.com>
References: <20260123192244.1441637-1-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-897AqV6kq3AaBnl4pheR"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_125949_326235_CFCD7E25 
X-CRM114-Status: GOOD (  16.12  )
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


--=-897AqV6kq3AaBnl4pheR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 23 janvier 2026 =C3=A0 14:22 -0500, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> The values of ext_sps_st_rps and ext_sps_lt_rps in struct rkvdec_hevc_run
> are not initialized when the respective controls are not set by userspace=
.
>=20
> When this is the case, set them to NULL so the rkvdec_hevc_run_preamble
> function that parses controls does not access garbage data which leads to
> a panic on unaccessible memory.
>=20
> Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 var=
iant")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Suggested-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

I'll pick this in fixes, so we don't release 6.20 (or 7) with that bug.

cheers,
Nicolas

> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 4 +++=
+
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> index 28267ee30190..3119f3bc9f98 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -500,11 +500,15 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ct=
x,
> =C2=A0		ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_EXT_SPS_=
ST_RPS);
> =C2=A0		run->ext_sps_st_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> +	} else {
> +		run->ext_sps_st_rps =3D NULL;
> =C2=A0	}
> =C2=A0	if (ctx->has_sps_lt_rps) {
> =C2=A0		ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_EXT_SPS_=
LT_RPS);
> =C2=A0		run->ext_sps_lt_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> +	} else {
> +		run->ext_sps_lt_rps =3D NULL;
> =C2=A0	}
> =C2=A0
> =C2=A0	rkvdec_run_preamble(ctx, &run->base);

--=-897AqV6kq3AaBnl4pheR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYZWPgAKCRDZQZRRKWBy
9JwhAP9UIkCMcg8W8+RHSrgDTGNgUiIycn2gGMavIcmqgcq98gEA3XieiwUqwRbW
pkGqVq8rFrMMs18duyTlZ6hmGqQ4iw0=
=cb/E
-----END PGP SIGNATURE-----

--=-897AqV6kq3AaBnl4pheR--

