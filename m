Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293BFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucLPcKFYkfTMW6TI6FDk1el+8ZisRr6NHHUoTP4Cyk4=; b=PUQWGqgCfiEUVXnB8x+BoxeAJL
	GEZYC+zZSTaFkc6MzhHV6QGSmt4A8CUP6wrwQABwqDmmxhGsZqEw7fdQ+XwM9jRuz6BLnhbZ6DVIF
	ERCs+TB6V9mEEIfXh9i2MNqx9fhpSwwsVXsr2dzgK19K2QBgSbuYUIYFQdtC4rRbiMbBqpoBBcCag
	ies62xn/pq4aAXOjnasFlu6Art3ffmbkdHXdAH4derwVGK5X8WBOb9ITy9yC6Ss9cjOinT1YddW0q
	gL1sD2WZ8gZrYu0NheWMc5lkJIjFnwKwGjIYefPL2R9YuLAa82MNX84zRDysLmNIHMrGZb2dc+lyb
	on6lQFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tie5w-0000000CGjL-3Hi9;
	Thu, 13 Feb 2025 18:37:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidUd-0000000C6x7-29sx;
	Thu, 13 Feb 2025 17:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CED05C58EA;
	Thu, 13 Feb 2025 17:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537F5C4CEE5;
	Thu, 13 Feb 2025 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739469558;
	bh=Pgn2vbpHZGhCOn5YhZz8fN0a5lPUgj2hH+tawYr3GvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R52iamQnStdvdjPzrUWP5m3f6dlxeAVUJqqh2Zat/hZmMmlZ3FHIP25gpThz11R/D
	 vg96qHC/2qAMYIMR6wmNuF/4329RLihz4GzMSQUEt68g3bpYzwf1dJzrZl3Rg7/t1p
	 jvOBSQiBorqQZPb3p1svf5VOM8/TFStUBnvqPVCIw4pO27r3Z6Qnyi3pk4mD0z74yO
	 B66OYoxbo/tqlkGISaWYvy3fvp2dC5W/XgM4ye3k/MUixPd3wsUdolVYLoaiZk9TAl
	 7no88D98e6379shrdeW11gVSPGGHH/QAm4ezRmpsgWS00PbSjF8oG67spsPDlwYQfa
	 cFQyhc2+LYypQ==
Date: Thu, 13 Feb 2025 17:59:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation
 helper
Message-ID: <20250213-crown-clustered-81c6434c892b@spud>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hayvwxyUW11W/dJv"
Content-Disposition: inline
In-Reply-To: <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_095919_640183_964D3576 
X-CRM114-Status: GOOD (  19.42  )
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


--hayvwxyUW11W/dJv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 06:27:59PM +0100, Jerome Brunet wrote:
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>=20
> Use it and remove some boilerplate code.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/reset-mpfs.c | 52 +++-------------------------------------=
------
>  1 file changed, 3 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..bbea64862181877eb7ae51fda=
a9e50ffac17c908 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device=
 *adev,
>  	return devm_reset_controller_register(dev, rcdev);
>  }
> =20
> -static void mpfs_reset_unregister_adev(void *_adev)
> -{
> -	struct auxiliary_device *adev =3D _adev;
> -
> -	auxiliary_device_delete(adev);
> -	auxiliary_device_uninit(adev);
> -}
> -
> -static void mpfs_reset_adev_release(struct device *dev)
> -{
> -	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> -
> -	kfree(adev);
> -}
> -
> -static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk=
_dev)
> -{
> -	struct auxiliary_device *adev;
> -	int ret;
> -
> -	adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> -	if (!adev)
> -		return ERR_PTR(-ENOMEM);
> -
> -	adev->name =3D "reset-mpfs";
> -	adev->dev.parent =3D clk_dev;
> -	adev->dev.release =3D mpfs_reset_adev_release;
> -	adev->id =3D 666u;
> -
> -	ret =3D auxiliary_device_init(adev);
> -	if (ret) {
> -		kfree(adev);
> -		return ERR_PTR(ret);
> -	}
> -
> -	return adev;
> -}
> -
>  int mpfs_reset_controller_register(struct device *clk_dev, void __iomem =
*base)
>  {
>  	struct auxiliary_device *adev;
> -	int ret;
> =20
> -	adev =3D mpfs_reset_adev_alloc(clk_dev);
> +	adev =3D devm_auxiliary_device_create(clk_dev, "reset-mpfs",
> +					    (__force void *)base, 666u);

Moving the boilerplate into a helper makes sense:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

One think that's always felt a bit meh to me is this id number stuff,
I just threw in 666 for meme value. The whole thing seems super
arbitrary, do any of the users of this helper actually put meaningful
values into the id parameter?

>  	if (IS_ERR(adev))
>  		return PTR_ERR(adev);
> =20
> -	ret =3D auxiliary_device_add(adev);
> -	if (ret) {
> -		auxiliary_device_uninit(adev);
> -		return ret;
> -	}
> -
> -	adev->dev.platform_data =3D (__force void *)base;
> -
> -	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, ad=
ev);
> +	return 0;
>  }
>  EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
> =20
>=20
> --=20
> 2.45.2
>=20

--hayvwxyUW11W/dJv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ64y1gAKCRB4tDGHoIJi
0tpDAQDNGTJm0hUvHu9/lgcEwur44fxS2Qlcl7n70eboDVTC6gD/VBr9uDAEKvks
C7yxajoK6tXd6NFsVd0104wfqGk41QU=
=kI4Q
-----END PGP SIGNATURE-----

--hayvwxyUW11W/dJv--

