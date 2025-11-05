Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0004CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 01:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpI087FtIxYg7DySMe2xZlGjptQaVJmuv7g4F0pvfNs=; b=HzMaZ7W3A/DycoEVl/fXEJOlWo
	3G0ViVHu9az/1JicbVp4BLGITiZQdsLhHWZMyfULgqhpsoTDrbSlPzCYaIDFsQ8aCDIqgc9ZUnHSw
	+INQfw7tomKKFX2EnEzXOLXQv3zDinWwEIKOQOuZzoKAgS668awXEsy3tiyhADwPFBdQ9uS1Z6apU
	wCqBubADr2Mk2lo2E/CMrtlNlOzS1kwk6Ou+KDF2MXM92nj3mZKplssYUvxARGoR5SoI+NRBDxJBJ
	SKJkkIM8oH3HP/QMIH9lo3GeZ+OKXD8XCTvzPk0lOad0Q+vgyIg/YBnRrqATYyzqP73GS+lIp+mib
	RZkdZJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSO7-0000000Cqhj-2xnf;
	Wed, 05 Nov 2025 01:32:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSO4-0000000CqhG-2VhI;
	Wed, 05 Nov 2025 01:32:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1762306343; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M8QTzl9KNZlXmjR3YMDovKOYchplT1lIc6GV8squykdhQsXUNyo1r8JwfRWbianIrcvoX6B+KJJrw4I85rD9Nl1Af7geebnPhiUdMqbdY7ORCKVo0+ui45EsCQrEStvRd2UTG9FuAAcHXmMrVKlAgyLFQgg3CbBNfuUN5XdLYE4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762306343; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KpI087FtIxYg7DySMe2xZlGjptQaVJmuv7g4F0pvfNs=; 
	b=VAxI/o3zqc8z7ATovB9IoJZVyXGZYxodLmPO6Y3lp6gVEtRWxca0oD8/DI1jNYaI8njExT9ssdE05MHPOl9GwCIf3OdhioFDm9XpwuDAGRUs7wbRste+WvMcZ9w0X0lzz4/qeE2F2Vl9B+TWhv4SdqaF4+mEGLLW0JO6VN2lOTA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762306343;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=KpI087FtIxYg7DySMe2xZlGjptQaVJmuv7g4F0pvfNs=;
	b=JDt5jey8SvN8si02kdmL+oa14yTKsRgWMZ3GH3W2MxskumPE21Z/FucNUD4qsQ2Q
	zRQ8/0y+mBgEPrQXbqFynkKqaz8s4p9MkPuy9BRxaOKXwCR4LL8nrSU8qb6X2z5kkVi
	UyiuLrzM3fxMhzsZdFpYvIk2wm+ssq4MCqycQkHk=
Received: by mx.zohomail.com with SMTPS id 176230634046419.149111498046977;
	Tue, 4 Nov 2025 17:32:20 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 51B7C182F6F; Wed, 05 Nov 2025 02:32:07 +0100 (CET)
Date: Wed, 5 Nov 2025 02:32:07 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	michael.riesch@collabora.com
Subject: Re: [PATCH 1/2] clk: rockchip: rk3568: Drop CLK_NR_CLKS usage
Message-ID: <x7xja6v2ssq3mesj3bnuzsz522tew4lobbn5ftcgfrusdnabjm@rd47kgjdnoz4>
References: <20251103234032.413563-1-heiko@sntech.de>
 <20251103234032.413563-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6bmfeioxjbjj4jf2"
Content-Disposition: inline
In-Reply-To: <20251103234032.413563-2-heiko@sntech.de>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/262.252.53
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_173236_720881_F8388831 
X-CRM114-Status: GOOD (  19.38  )
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


--6bmfeioxjbjj4jf2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] clk: rockchip: rk3568: Drop CLK_NR_CLKS usage
MIME-Version: 1.0

Hi,

On Tue, Nov 04, 2025 at 12:40:31AM +0100, Heiko Stuebner wrote:
> In order to get rid of CLK_NR_CLKS and be able to drop it from the
> bindings, use rockchip_clk_find_max_clk_id helper to find the highest
> clock id.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/clk/rockchip/clk-rk3568.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk=
-rk3568.c
> index 97d279399ae8..74eabf9b2ae2 100644
> --- a/drivers/clk/rockchip/clk-rk3568.c
> +++ b/drivers/clk/rockchip/clk-rk3568.c
> @@ -1652,6 +1652,7 @@ CLK_OF_DECLARE(rk3568_cru_pmu, "rockchip,rk3568-pmu=
cru", rk3568_pmu_clk_init);
>  static void __init rk3568_clk_init(struct device_node *np)
>  {
>  	struct rockchip_clk_provider *ctx;
> +	unsigned long clk_nr_clks;
>  	void __iomem *reg_base;
> =20
>  	reg_base =3D of_iomap(np, 0);
> @@ -1660,7 +1661,9 @@ static void __init rk3568_clk_init(struct device_no=
de *np)
>  		return;
>  	}
> =20
> -	ctx =3D rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
> +	clk_nr_clks =3D rockchip_clk_find_max_clk_id(rk3568_clk_branches,
> +						   ARRAY_SIZE(rk3568_clk_branches)) + 1;
> +	ctx =3D rockchip_clk_init(np, reg_base, clk_nr_clks);
>  	if (IS_ERR(ctx)) {
>  		pr_err("%s: rockchip clk init failed\n", __func__);
>  		iounmap(reg_base);
> --=20
> 2.47.2
>=20
>=20

--6bmfeioxjbjj4jf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmkKqRMACgkQ2O7X88g7
+ppKnA/4pNi7YhTXOsHnSmYUks9GbObvEULNO2W/tb0LY0/gy2kOMYLUBAYOykI5
hlWa8M4urf04qDi+xrtaaTGj6YggGQiEMh2vbUsLv00rbD6WYSdf2gLuqYfLw/Rd
5L0OBKzsOFYWVc0nGZtwmSfjtq0cSf7GBVXaLCPsOoI2d9K67ocVGKCxBYBKbQzu
J0SK/4DCS6ee8N/k1ERLNZHdSvSlYCwRPuhDxIj0FP61I+t7k+zd3u8wJBDKlVvy
lzy+qIXLvrPXDyErQgRDsbjKESLfp2U3WZLlYn1o779PWDty+x1wuiUePPmDSI3C
TLdDj23gOBicQzKtRJ/229yLe5eo8H4xs5Dgei8JDrmKZm0ochU7z4NVFozePUma
+rNXmqrURdm7p8PDaP4PLRNfjfqDV7mucxgy8FrlsMDPinJCKhZ8b9eMU8UG1GJI
Jn6zGDvcidwWuz+/QHqWdhRhZbqTHwjDyJ4NhHBO5uk40GJwu6u00hE3JOsWeAiv
KJV7tCV8NkzzF4EaW8OgJiKqWqV+uOfkLhnA+GZu7ggs7F8YS64nvRKAfOW0mxqB
UlPbb2DABRMxUx76MHHPaDriUjvk6W0lm43H6UaltohYCXrjhZbiUyzAxP5HCkx5
mm5Hkv4qY/FQjUbHVTlM+Ug22PRuN82sCHXh5aD3xvHQoav5AQ==
=C3fB
-----END PGP SIGNATURE-----

--6bmfeioxjbjj4jf2--

