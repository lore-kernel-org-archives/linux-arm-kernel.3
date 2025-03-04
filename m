Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165C3C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTAodclUAdCBU382l20ItnjkDcvqqEPMOb0qAu5ypcA=; b=qzuuiSQlXMBxYAYb0DU5LiGW5J
	Ww1Pu/jseHOrxwbqQQTqCO0MtSes4p+b48EzQo2jUpogrGaC7wBPNAvQbe9uVR5iYBV0lQyo48QbP
	5ACvAp6ra1AKsFmmgWkEh7NyPmwJn8u/7v05rx1Ly5qQeu2opM1LEDfkT/L0fCjJOAVKIVfMl40At
	xZGrFku6ZcDIBgXyKf1MNy6bqknKKAOZYyP+vavAK9jwDgsHqkcZ7v+fQx2K9iM001etEYxxuqyxT
	8pR2DOyXzKfpS4q1RTPC5SalxrCSLFiCbOmXKiOcG0digxBRLghW4NDNU2Ndb4FqbGHvK/v5V1Ecl
	fNlsM59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTKp-000000050Tc-0c48;
	Tue, 04 Mar 2025 14:33:27 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTJF-000000050Ez-1bwJ;
	Tue, 04 Mar 2025 14:31:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741098703; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mAce3bRInugDhWPhCQM6C2uCziq19ilL7/e+dDW2/FGcV1jAnkWk4bEkVhEqALuAwIKUQaz283m1L6+GjNg7wGKM/uLr6E+GmAow3mmPtDa0ZgSRfN9ymqKS30YZ8AGCmJr2RuWWgd8wjvsHdhmBFyY0T91/QvIe3g8dYbJP4AQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741098703; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tTAodclUAdCBU382l20ItnjkDcvqqEPMOb0qAu5ypcA=; 
	b=Ihw5XlebV4G1xS/82TskIdALZ4f96MvsX6Qv1UmpB9tv/KyoKguhA+XkF/1QMufniyDdE93wgk/eIuvDnjR6D1YtiiCnJ42kddUTNNAhMHmMaLA94SRyyGqz/S2hLW6XmBsdXKQqLxDW9PmgC5xtmKV/QlfvUFVP7YaqrubOHcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741098703;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=tTAodclUAdCBU382l20ItnjkDcvqqEPMOb0qAu5ypcA=;
	b=ULFskclwdgD84orDTDoYs2GbQMrFcN9IYWZlXv6GhiNxCMwrTweCDIby6f9Pw5PJ
	Sc7NsYDgv8wk0GOQRn40+TOKILmhGITxhPaBgTLDybhMyj2+NFPkeXOVi1rUcGnUNB0
	sF1qb5Z03fHMYAxI+Ugu1YrvPgvCd/7yX4yiFB0U=
Received: by mx.zohomail.com with SMTPS id 1741098701479811.0457773113028;
	Tue, 4 Mar 2025 06:31:41 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id EB4EE180C9F; Tue, 04 Mar 2025 15:31:37 +0100 (CET)
Date: Tue, 4 Mar 2025 15:31:37 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: rockchip: add regulator dependency
Message-ID: <2g5p6ucwp55zuisupqx6dglikmbm5rqy3yl34mqobs3giucfqe@um6uhmglxhex>
References: <20250304142803.689201-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ftr5rqzgjozmvlj"
Content-Disposition: inline
In-Reply-To: <20250304142803.689201-1-arnd@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/241.78.79
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_063149_489607_EFF4A485 
X-CRM114-Status: GOOD (  17.95  )
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


--6ftr5rqzgjozmvlj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pmdomain: rockchip: add regulator dependency
MIME-Version: 1.0

Hi,

On Tue, Mar 04, 2025 at 03:27:59PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> When CONFIG_REGULATOR is disabled, this pmdomain driver fails to build:
>=20
> drivers/pmdomain/rockchip/pm-domains.c:653:30: error: implicit declaratio=
n of function 'devm_of_regulator_get'; did you mean 'devm_regulator_get'? [=
-Wimplicit-function-declaration]
>   653 |                 pd->supply =3D devm_of_regulator_get(pmu->dev, pd=
->node, "domain");
>       |                              ^~~~~~~~~~~~~~~~~~~~~
>       |                              devm_regulator_get
> drivers/pmdomain/rockchip/pm-domains.c:653:28: error: assignment to 'stru=
ct regulator *' from 'int' makes pointer from integer without a cast [-Wint=
-conversion]
>   653 |                 pd->supply =3D devm_of_regulator_get(pmu->dev, pd=
->node, "domain");
>       |                            ^
>=20
> Add a Kconfig dependency.
>=20
> Fixes: db6df2e3fc16 ("pmdomain: rockchip: add regulator support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/pmdomain/rockchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pmdomain/rockchip/Kconfig b/drivers/pmdomain/rockchi=
p/Kconfig
> index 7e4f9b628f0b..218d43186e5b 100644
> --- a/drivers/pmdomain/rockchip/Kconfig
> +++ b/drivers/pmdomain/rockchip/Kconfig
> @@ -5,6 +5,7 @@ config ROCKCHIP_PM_DOMAINS
>  	bool "Rockchip generic power domain"
>  	depends on PM
>  	depends on HAVE_ARM_SMCCC_DISCOVERY
> +	depends on REGULATOR
>  	select PM_GENERIC_DOMAINS
>  	help
>  	  Say y here to enable power domain support.
> --=20
> 2.39.5
>=20

--6ftr5rqzgjozmvlj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfHDsEACgkQ2O7X88g7
+pp00g//aFcPbqAlUT+9ssFVmS1DZnzPVKvIpP2qpRgf3ZLhdIUUE/9ljAKaBhsB
ibrwuSsht4nUebBiL/Ge9191zcdE/kG+oBIaOeUpRfUI1fVI5V501LzHoJAX9QJM
nezzvh8SUWeoerVK2faqPrap0HJ/u/vkhoOpiUBoSBOOaD438GhSPbgAGV7SBH5L
8dtv0H9PbRg0bjMWaSrUptVZKH1aOgew/ik30jvwDzXRJYGx/86Zzh4h8ryCh4LO
lfwPZ72cq5QbpagWvO2rCznJrntpdWITqzCJ0Tg+OEjRhhcpDfSpI16krVIfFK37
lFDhuK9/4VnA8PRmt92pDU2AfNMpUa8O1narQGFGsFTvG8ad9/h5xwxLVq9DMB5F
r5D8Ild2hkvI1mkm1zj5Ur0aSN9p8kX91gbN5+cblCFw3GQPSRVBCe9iYQMWKOYI
fJm46Nw4D6pbfMGAl4N4gxBwZsCUbFzVU60cqnUSDyVYVET+5sennBGpX9k/AKfk
DBoG2efxxd0x34sq6orYAjL0+E0FLw+T/bfgcVwF6XOv6jJfYPPB7YVWREGR7EzQ
t2ybqCXnUQIpyHe/cYSjJzcgYmfn4I5VlWhjsK5Zw4F6hSPAaDPiskS8PMqTDBGx
GwR5n9e77eX49YHCd6frUZTZycygRe8J+vB77/bkFd1LcUNlcZI=
=86c8
-----END PGP SIGNATURE-----

--6ftr5rqzgjozmvlj--

