Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A34C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 23:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C12D36/WD3pb5h1o9lavjgjpoqsz2gG/O656Q57Z2Ww=; b=Ih4LjPstBFQ6YyV5L4Ias1DMCq
	WK6bxaVCkuqIfFiR5pP5+q86XGPz/91kfKDFsPS4J7jtcgTHw1gtJLuhwCyjVu3q+5Io/QlpQQkxU
	amlUhYtjaGih/wJtoWmZKpjEnoLCer8caDF1coC6hhtUVR/9ZUU+tDkJaXA/JCbnv5/Shud1+02Jd
	8kF9TAWe4SDB5JWLZFvO4E2UX8riU5MdG4/Ehstk1nSkcijfW/032obm7zckecurLEWXW8yxZ8FtR
	fOaUe6jOJjqENG5PSflFvdTe1V+gO/ZIoVzCFNWnBJgG+hw5ppVbeFqfyahs/NBTUti5ANRZDiryZ
	jgE5T8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlx5i-000000084M9-1ysT;
	Mon, 20 Jul 2026 23:08:06 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlx5f-000000084LI-2QP4;
	Mon, 20 Jul 2026 23:08:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784588875; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VI1AFduFPNIsWZD0z8myCkVuBlKfD9s36f8+ZW4DNJcWeV/SIGNq20JzBiMg3xpBnZrtSAoxJWonzxwluMmjSChXsZYDBZpMLggqAV9EE5roV6XgA9rGKG1inABX8II7RbpRlAWOup1ejC+rzrb8LVpzGr5BcPjN7oFsqtC68DU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784588875; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=C12D36/WD3pb5h1o9lavjgjpoqsz2gG/O656Q57Z2Ww=; 
	b=QFE+8XQ9/aTksiB1FSkyt/LyHDIQvFJtYNnRL6plNrJyGH5aIpChV551z33oCXYKZ6rl7OHyn+VJkp4ZFoiHRAGegUBQhvjpibmmR99fLy2KjLEG5gaxzZ5r853umcJurvyhJKDWKbAHoubs7NNzpPhGM9A1Q/SDpz1e24b7Tvs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784588875;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=C12D36/WD3pb5h1o9lavjgjpoqsz2gG/O656Q57Z2Ww=;
	b=BYWVTQ1RCxcSbeRR4zCvpTTkhW4xWaikBxObO4FDYaIwQncUOJBI5gFO4TAFKGQN
	nxxK+Gtvb/AGTSI4DPZjwAQ4lYQNCm3jPB2XW/zl8PdJQsjnnhfwqGvf3Ok8fdgryv6
	5ZiS8QNzzwnotZt9BdWaAlEcCSO/N4ER6bfA2CQA=
Received: by mx.zohomail.com with SMTPS id 1784588872977906.2522298779634;
	Mon, 20 Jul 2026 16:07:52 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 080121804CE; Tue, 21 Jul 2026 01:07:49 +0200 (CEST)
Date: Tue, 21 Jul 2026 01:07:48 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: MidG971 <midgy971@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>, ulf.hansson@oss.qualcomm.com, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: rockchip: Add a regulator to the RK3568 NPU
 power domain
Message-ID: <al6obUumqnbkKhKb@venus>
References: <20260708234614.499613-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7jxahn4i4xvpig2q"
Content-Disposition: inline
In-Reply-To: <20260708234614.499613-1-midgy971@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.568.37
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_160803_650023_9F126B13 
X-CRM114-Status: GOOD (  25.99  )
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


--7jxahn4i4xvpig2q
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pmdomain: rockchip: Add a regulator to the RK3568 NPU
 power domain
MIME-Version: 1.0

Hi,

On Thu, Jul 09, 2026 at 01:46:14AM +0200, MidG971 wrote:
> From: Midgy BALON <midgy971@gmail.com>
>=20
> The RK3568 NPU rail (vdd_npu) needs to be enabled before the domain is
> powered on and disabled after it is powered off. Give DOMAIN_RK3568 a
> regulator parameter (like DOMAIN_RK3588 already has) so the NPU domain
> can set need_regulator, letting genpd manage the rail wired up as the
> domain's domain-supply instead of marking it always-on in DT.
>=20
> Suggested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Midgy BALON <midgy971@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Looking at the RK3568 DTs it seems they all mark vdd_gpu as
always-on. My guess is, that this could also be avoided by adding
the regulator reference to the GPU power domain.

Greetings,

-- Sebastian

> This patch was part of the RFC NPU series [1]; Ulf Hansson and Heiko
> St=FCbner reviewed it there and confirmed it can be applied independently=
 of
> the rest of the (still-RFC) rocket driver and DT patches, so it is repost=
ed
> standalone. The NPU domain's domain-supply DT wiring follows in a separate
> patch, so this change alone is a no-op at runtime.
>=20
> Changes since the RFC posting:
> - Move DOMAIN_M_R below the other DOMAIN_M_* macros so they stay
>   alphabetically sorted (Heiko St=FCbner).
>=20
> [1] https://lore.kernel.org/linux-rockchip/20260613070116.438906-1-midgy9=
71@gmail.com/
>=20
>  drivers/pmdomain/rockchip/pm-domains.c | 36 ++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 490bbb1d1d8e8..ba66ae7194289 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -204,6 +204,20 @@ struct rockchip_pmu {
>  	.active_wakeup =3D wakeup,			\
>  }
> =20
> +#define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator=
)	\
> +{							\
> +	.name =3D _name,				\
> +	.pwr_w_mask =3D (pwr) << 16,			\
> +	.pwr_mask =3D (pwr),				\
> +	.status_mask =3D (status),			\
> +	.req_w_mask =3D (req) << 16,			\
> +	.req_mask =3D (req),				\
> +	.idle_mask =3D (idle),				\
> +	.ack_mask =3D (ack),				\
> +	.active_wakeup =3D wakeup,			\
> +	.need_regulator =3D regulator,			\
> +}
> +
>  #define DOMAIN_RK3036(_name, req, ack, idle, wakeup)		\
>  {							\
>  	.name =3D _name,				\
> @@ -241,8 +255,8 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)		\
>  	DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
> =20
> -#define DOMAIN_RK3568(name, pwr, req, wakeup)		\
> -	DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
> +#define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)		\
> +	DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
> =20
>  #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)	\
>  	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_of=
fset, req, idle, idle, g_mask, wakeup)
> @@ -1274,15 +1288,15 @@ static const struct rockchip_domain_info rk3562_p=
m_domains[] =3D {
>  };
> =20
>  static const struct rockchip_domain_info rk3568_pm_domains[] =3D {
> -	[RK3568_PD_NPU]		=3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false),
> -	[RK3568_PD_GPU]		=3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false),
> -	[RK3568_PD_VI]		=3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),  false),
> -	[RK3568_PD_VO]		=3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),  false),
> -	[RK3568_PD_RGA]		=3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),  false),
> -	[RK3568_PD_VPU]		=3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false),
> -	[RK3568_PD_RKVDEC]	=3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false),
> -	[RK3568_PD_RKVENC]	=3D DOMAIN_RK3568("venc", BIT(3), BIT(7),  false),
> -	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), false),
> +	[RK3568_PD_NPU]		=3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false, true=
),
> +	[RK3568_PD_GPU]		=3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false, fals=
e),
> +	[RK3568_PD_VI]		=3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),  false, false=
),
> +	[RK3568_PD_VO]		=3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),  false, false=
),
> +	[RK3568_PD_RGA]		=3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),  false, fals=
e),
> +	[RK3568_PD_VPU]		=3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false, fals=
e),
> +	[RK3568_PD_RKVDEC]	=3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false, fa=
lse),
> +	[RK3568_PD_RKVENC]	=3D DOMAIN_RK3568("venc", BIT(3), BIT(7),  false, fa=
lse),
> +	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, fals=
e),
>  };
> =20
>  static const struct rockchip_domain_info rk3576_pm_domains[] =3D {
> --=20
> 2.39.5
>=20
>=20

--7jxahn4i4xvpig2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpeqj4ACgkQ2O7X88g7
+pqKEBAAmPiK/V9Jlp7U0lNPz+jniaDOLY5OJqm4iU2zeo7Ajx93+QQ6NAx40Z22
jrSdZw1HU/GHiE5zbc8tNFqSAS66/aSMj+tkPkpxm/TRDeuz7SnaVR8PgvNN981j
B7Aof/gVdh0vUwwU9TUGQbZFBhsLnmt3cuYueFauimRuBaXr2XqjQg5yDAVXiXsE
xaLfrBKEKRHTrdoHO2iyRrlwPlWEfgHW5Tk3SSZCSQ1y9ARIF8W11d5g8FTVwuEb
+1a6v6GG7uYg6EQHfOlgWNhHwEzkyI/v2AgRRbVMKT1xAH54QEGm5ebwMeTJzGgC
RketCkhN+P2kgqZd3tl945tmzCnIIkoKSlEOxRkiEaLZmewRI4xqdspRQJwpmKHp
xnktk9b1EBvAlgi1HCbZbmWQpb0JOMZ+GY707KRdDsVRLIV20SLDN+mR25QkC3Zi
7HPdnQrzjnUQFXpUoDeFmoUFVmhExWQaplfvPOTB72FDvCR5BNiMNHkZVOspcpOD
T/WHzQHAgbJcZNhmxi8d2AvRW4ciEycnxUOQ4I2Mh60R7JExNVTBUOTDxwWEf1uj
ZXUZNjEM/KmlwJadgJLe3EuiGUw85VcsyIOGyCGt/5gc26FI7bHKfJvPB18k0mqh
ZJlnQt1YIHuaeoNjG7oD7849rofA6NNQPN43YwiozR8IWGEoKUM=
=5JJg
-----END PGP SIGNATURE-----

--7jxahn4i4xvpig2q--

