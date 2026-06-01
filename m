Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AD5CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AA8Fj6bzRSMBMFNGM9dw0WJ6PAlf3cOl099jN99Op18=; b=eUlgA1SQ89hbVLS56EZBGlfX+4
	uRh0X5HgTAHulthjpOVbM+d2JHwozzPoi2FBajCRm9O6RZUCSmUK/VkkDg9hmoQWsmVUgltPHQZhZ
	B9arZeT/hmX/CEphNtlKcNaOYQcj6u/2GzGWd6PNwkRUM6cn+cEvvWJDJVY6SvJ158TKDE/D5XvoI
	dd+n69TAs/nRzNCOyal0M+fNHxKRz0fs+PtKLkHP/2+X5nXHczjtMG7wvhso66L//T2dmEmRvvRtq
	nlOTw13r1ybODzp+Hgegx7yl01lJmIWxkBmiZfzu3qUe+adpB7U41CHfDvmPhyS9dnz0gYzYAEw4d
	EzEB11Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB83-0000000BwVs-2egi;
	Mon, 01 Jun 2026 22:29:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB80-0000000BwUi-01x8;
	Mon, 01 Jun 2026 22:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1780352910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EBa4rEJKUjMggfBN4WqO10eaB0RHrw1pwY/4cwhx5FL71fNEv14JC2gJdfQ355mCrlrqeJMOSVvE9JrFzHfGrlN61suy4qugBsgosp/THYCohzhQ3lJNJu2B3ctczd6ee73XvUUVn6QXDBgxUPE/bszy+Tz6yjv1y/nMtRaYePg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780352910; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AA8Fj6bzRSMBMFNGM9dw0WJ6PAlf3cOl099jN99Op18=; 
	b=UO0En8fZvNc2TToDF3D0G2D/9C/Ph2vt0uXPp6mn8NId7P3eJMl82RF8MxEybWMlddWJZfde2asZToSwqDwC2xmSuMsdBgJoWvrOxb9WM6ZRAHeeJwwCNkfryoMjSQm4m9fEWWW7CgEK+5hlfHFNkIFct0v3aaiel674Y8rPIbU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780352910;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=AA8Fj6bzRSMBMFNGM9dw0WJ6PAlf3cOl099jN99Op18=;
	b=NBtOqyb5VpXucL5UuQ0l/70jSHr+zkS7X9GYFTlbraoEIAhFYUkSQ3EC0BbqBkSm
	6vDUrS+uaqab/+Bblze+nQljEKG6ZscoADEdMEktLSIDIgtow97CeYLRdyRyzEx88vU
	crY2C7XeRBgeYnXVpx4z6wrqa0wBVqXWdRQ+wi08=
Received: by mx.zohomail.com with SMTPS id 1780352907800763.4228970296604;
	Mon, 1 Jun 2026 15:28:27 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id EE616183854; Tue, 02 Jun 2026 00:28:20 +0200 (CEST)
Date: Tue, 2 Jun 2026 00:28:20 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-phy@lists.infradead.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH 3/5] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Message-ID: <ah4Ha3Y0I68i9j1z@venus>
References: <20260521032854.103-1-kernel@airkyi.com>
 <20260521032854.103-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qin6jzopmvvno7lx"
Content-Disposition: inline
In-Reply-To: <20260521032854.103-4-kernel@airkyi.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.1.0.1.4.3/280.325.56
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_152900_090423_E37FCAC6 
X-CRM114-Status: GOOD (  20.26  )
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


--qin6jzopmvvno7lx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
MIME-Version: 1.0

Hi,

On Thu, May 21, 2026 at 11:28:52AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
> device.
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/phy/rockchip/Kconfig              |  2 ++
>  drivers/phy/rockchip/phy-rockchip-typec.c | 13 +++++++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
> index 14698571b607..9173d3b4fef4 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -119,6 +119,8 @@ config PHY_ROCKCHIP_SNPS_PCIE3
>  config PHY_ROCKCHIP_TYPEC
>  	tristate "Rockchip TYPEC PHY Driver"
>  	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
> +	depends on DRM || DRM=3Dn
> +	select DRM_AUX_BRIDGE if DRM_BRIDGE
>  	select EXTCON
>  	select GENERIC_PHY
>  	select RESET_CONTROLLER
> diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rock=
chip/phy-rockchip-typec.c
> index d9701b6106d5..48070b50416e 100644
> --- a/drivers/phy/rockchip/phy-rockchip-typec.c
> +++ b/drivers/phy/rockchip/phy-rockchip-typec.c
> @@ -54,6 +54,7 @@
> =20
>  #include <linux/mfd/syscon.h>
>  #include <linux/phy/phy.h>
> +#include <drm/bridge/aux-bridge.h>
> =20
>  #define CMN_SSM_BANDGAP			(0x21 << 2)
>  #define CMN_SSM_BIAS			(0x22 << 2)
> @@ -1162,16 +1163,24 @@ static int rockchip_typec_phy_probe(struct platfo=
rm_device *pdev)
> =20
>  	for_each_available_child_of_node(np, child_np) {
>  		struct phy *phy;
> +		ret =3D 0;
> =20
> -		if (of_node_name_eq(child_np, "dp-port"))
> +		if (of_node_name_eq(child_np, "dp-port")) {
>  			phy =3D devm_phy_create(dev, child_np,
>  					      &rockchip_dp_phy_ops);
> -		else if (of_node_name_eq(child_np, "usb3-port"))
> +			ret =3D drm_aux_bridge_register_from_node(dev, child_np);
> +		} else if (of_node_name_eq(child_np, "usb3-port"))
>  			phy =3D devm_phy_create(dev, child_np,
>  					      &rockchip_usb3_phy_ops);
>  		else
>  			continue;
> =20
> +		if (ret) {
> +			pm_runtime_disable(dev);
> +			of_node_put(child_np);
> +			return ret;
> +		}
> +
>  		if (IS_ERR(phy)) {
>  			dev_err(dev, "failed to create phy: %pOFn\n",
>  				child_np);
> --=20
> 2.53.0
>=20
>=20

--qin6jzopmvvno7lx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmoeB4QACgkQ2O7X88g7
+potHhAApMK7BcNqtAuBen0JlY4pfpPJBWMvliktBqgcJxbfXjGgj2cte05nfKJf
gBMxX3L2PrBd8tVopdyzwIpaJtjeUbgg8Mb93TLik1jQql3akhKGqZpaYwE3gsG+
5ArTDJeEQFI/N4hvE+LoUYPKHyB32ZGPs3fTd/MdAkyesmwWKQeE1VN1fFFC+OuF
j6w0kevJhqBV41pCi9Z9k7nL/ZxTzQSiMZiOF5X+R7I549oYLfQqTRgZkf0PXNTY
fGwoBisvAcNyBNZqVVH9SbXVq2wlpKw8DxkSV9FBSH/gz11C84SSfMTi+ElktePk
sLTFE2A0N0ZjIpI31rGR+F7rHZ+3MYdgiVGMC0rbqoNkiN6z6IVHftjufw2zE4XA
tcddzIiqc4TrPb20Ly3btLfOqebn7a9Hen7PSzpQ0UcoczaoUlFK+6MN454bK+Yb
TZXtfsGTmVBxdWr3TH7gA40c40rYDBW3HuVneSptz2ui2DA1XjK52ZJuBLkdYdNA
nDZsL+NQx91+TV47ibIFuMQa/2bVyjDAHBFNZ+HmTWhOencln1UYvCzS6GBK/Nw8
xxzTcvWS78OffbXeoB8BfqukpEne1YFMNl6PLa9wj61VnT7IZ6JkLAk5SOVP+ekl
yxKnc5imF4fXw3bmBLwsAKOvMeOGEqYRzubNR/BzMtZXKOQCMyw=
=tOw3
-----END PGP SIGNATURE-----

--qin6jzopmvvno7lx--

