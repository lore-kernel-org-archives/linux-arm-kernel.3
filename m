Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7BAD3ABCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 23:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwibdMHEaNPEnhXJ4z2p7lSAdzhETkfVe/42moEJ5Hc=; b=RnE2/4LVHecEIBpajgcz+5RoAj
	e4KJb+NNPkXVtD73lhEWbmxdiEl+hsZ8WyPgEx+MP4ClzQ+e1ePWz9QqP8iIdknvasRIqngNQ8ydy
	1MCKEOvY+WCmEgtwGuG9+uVkZjBMxxgKwsbDZA6sg9SRySRfxqdx+7KKJg8PElOGL1N7fSKqvZKM/
	pHEBQi/qOlWTuwD50AQfncKj6cmfjWn33ou4uqQrdjtfdJ8SI/g4jT5AKFZEI36q1YNN0BnEa7u5r
	fShjE3DnVc/nKba94/j/LdAyF0w/St6ieh1+pz/H5htAI9oxqKE4eqDbHxwrjAT7rVqRKGKF+0bDK
	RNLEM+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdRD-00000001aDh-0WMe;
	Mon, 11 Nov 2024 23:03:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdPQ-00000001a14-2Nl9;
	Mon, 11 Nov 2024 23:01:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1731366080; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FoCgNcyuie1bzKhq7HI08WkTvX+EiHUPFOghDIE5AnXJp3JV1LBOvNnO+vEhNtww3FsCogamHJn5bMuX1LlLTgemD05CFrtm7WSfYwMttQB+DV2ueVrpj4/dTKHdeNNg0gGAjpBfKLHm3qppNmfPocnL5xFY7rhKZxOvy5CIfd0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731366080; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XwibdMHEaNPEnhXJ4z2p7lSAdzhETkfVe/42moEJ5Hc=; 
	b=dKpV5Ou0+aMaUSquqQBNqIc3JTGKU8YdGb7HHoW+RjsfUs0oQNQlQpP+dWkKNJY3cdi3hKfHrhyoFhvyZQu9w/OBQ279o35asnLIKV5w6ez9sC3nPrKpUV5V8wA5qdj9nTbE8aM709g5A+M6D3s8LjFKTvl1uie347C8RgxqBdc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731366080;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=XwibdMHEaNPEnhXJ4z2p7lSAdzhETkfVe/42moEJ5Hc=;
	b=iUPSH4naSUPDk0PAiDoyoRDURAU/Gl1HA2oRs0aICdyXH/0Kn0qqiXaCyN34+2k9
	Xng0A3Zk6NrTY8NcBue2wjDzJxu52igUPGnEp7taqsj4aJezwdjutT8vrEqswF9qLtf
	eqPB3g8BPsL2LPgdX+vn/bBryVWf2ym/6y+7Ie1w=
Received: by mx.zohomail.com with SMTPS id 1731366079198393.3828409779717;
	Mon, 11 Nov 2024 15:01:19 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
	id 5A51F1060457; Tue, 12 Nov 2024 00:01:14 +0100 (CET)
Date: Tue, 12 Nov 2024 00:01:14 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, finley.xiao@rock-chips.com, 
	tim.chen@rock-chips.com, elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 2/4] gpio: rockchip: change the GPIO version judgment
 logic
Message-ID: <grnpbrchvmhpl2uaoayrjcuit3ijk6pe4we3efmqltvzert7c4@mbmfgewf54zs>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-3-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yspvtplvzxeba3gh"
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-3-ye.zhang@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/231.261.35
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_150124_683371_CA12484A 
X-CRM114-Status: GOOD (  22.13  )
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


--yspvtplvzxeba3gh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] gpio: rockchip: change the GPIO version judgment
 logic
MIME-Version: 1.0

Hi,

On Mon, Nov 11, 2024 at 10:34:10AM +0800, Ye Zhang wrote:
> Have a list of valid IDs and default to -ENODEV.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  drivers/gpio/gpio-rockchip.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 71672d654491..f05b92e0e977 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -667,8 +667,13 @@ static int rockchip_get_bank_data(struct rockchip_pi=
n_bank *bank)
>  	clk_prepare_enable(bank->clk);
>  	id =3D readl(bank->reg_base + gpio_regs_v2.version_id);
> =20
> -	/* If not gpio v2, that is default to v1. */
> -	if (id =3D=3D GPIO_TYPE_V2 || id =3D=3D GPIO_TYPE_V2_1) {
> +	switch (id) {
> +	case GPIO_TYPE_V1:
> +		bank->gpio_regs =3D &gpio_regs_v1;
> +		bank->gpio_type =3D GPIO_TYPE_V1;
> +		break;
> +	case GPIO_TYPE_V2:
> +	case GPIO_TYPE_V2_1:
>  		bank->gpio_regs =3D &gpio_regs_v2;
>  		bank->gpio_type =3D GPIO_TYPE_V2;
>  		bank->db_clk =3D of_clk_get(bank->of_node, 1);
> @@ -677,9 +682,10 @@ static int rockchip_get_bank_data(struct rockchip_pi=
n_bank *bank)
>  			clk_disable_unprepare(bank->clk);
>  			return -EINVAL;
>  		}
> -	} else {
> -		bank->gpio_regs =3D &gpio_regs_v1;
> -		bank->gpio_type =3D GPIO_TYPE_V1;
> +		break;
> +	default:
> +		dev_err(bank->dev, "cannot get the version ID\n");

I think this would be a better error message:

		dev_err(bank->dev, "unsupported version ID: 0x%08x\n", id);

But it can be improved later on. Just like the next patch I think
this should go into the 6.13 kernel as soon as possible to fix
handling of the Rockchip RK3576, which currently initializes its
GPIO controller using the v1 register layer instead of the v2
register layout.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> +		return -ENODEV;
>  	}
> =20
>  	return 0;
> --=20
> 2.34.1
>=20
>=20

--yspvtplvzxeba3gh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmcyjLcACgkQ2O7X88g7
+poVgA//bSvSuFLyAeqVfBQ2DfrVLZRaHXz9rjxJrwc5a0INYbb2+1ddDULXHeha
CwkpcQ7rnUlne3VyIKeYF6hL01Oj1Ozai1eHa3jSjc3y2QejYMWIY5uuQGi7iMIz
Gb1XnT7x6DV+3bg9RdJAjIaOnKvi6HYkfz1UVOj2KGQxpT/zqVMJ3xDkmqj/iULb
uJKncHSMYOB9WHBPLtIMTX8OC1MiioilboRixGAgNtNxKVHCcCog8hu9mTPHc8Y9
01VRxxKDLvC/ly/nfalwN3KGMGfP3tvLe9T8PFxKZbisD1oXWSlz6VHFXPIYCq9w
g5xjnoaF9YCUDbFzLgtO+yLA1fdq+OXT6+0h2FxECuZi3opU+2xLGDU40SV3XrMH
hinV4x4OCtdOTurhmyTiao1uM6mpw9iIlZZMfSlLjaZxoAHYfer18E0+rgTxiB3u
xIp7OPmqLR3zidMnZFiYVc4TuJKxi+4+lFCMJ4Q/GDwlDNM0e4Pviv6uh854lmyQ
45oUYy6QqxWB8y9pWx/itzYDlXIpg2g+Z8Rfyl41/Qcw4aUc5u/eYA84u843+T4V
wQV7TtlQXU7UTXbaZhAFDwTc8FZDLaDV/c9qOpXhR0jMbW7ZWJtioh2JzsHts55W
iVEWjmT9YQHLAuTIlDxnqQG5ToniCen6od7L9UAlo81MMG4ujAc=
=bN7n
-----END PGP SIGNATURE-----

--yspvtplvzxeba3gh--

