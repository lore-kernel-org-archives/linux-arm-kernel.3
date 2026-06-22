Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5672CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGkyB08LSwfG3jOi5aBUi+D7lklfNHZo+RPl42buynE=; b=bmQChQvQoLmifjLN9vR5PJ7ZHU
	BKhzeNlBCmyf4dz92cpUYymvllYG9Tm6o1Ohcb8hnX8q7JnV8HhE8xsSy+e4p0wZM9oXQCwaPlLqr
	gfuKfUavXU9uylf81314fjaRNWNtzokRvjEv5ktfgnz3S4hmK1EXOVG0SZtJxPzI/jqztCFZb53qy
	879wBBgueQZLuhiwjdsijMlGJGtJbOX4WeLIoOqZx6XoaP9xdDzrZkUQ1apFp6RkG5D5ZC0GBH8X5
	RrBSK9XJNGQkKM+6MeGPgilnCHCeEXmbIHsP0LA46YIpZfOIiCV24sDHieSLTXyyV2aF13Rwk5DIe
	erhNmjmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbiGx-00000005Fey-1e3H;
	Mon, 22 Jun 2026 17:17:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbiGw-00000005Fer-2MMq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 17:17:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C01D0601F8;
	Mon, 22 Jun 2026 17:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204171F000E9;
	Mon, 22 Jun 2026 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782148641;
	bh=YGkyB08LSwfG3jOi5aBUi+D7lklfNHZo+RPl42buynE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZTlltqDvqyJYG3a03TZfHyc2f2P+tyf/JRiGuG4Eyfc7c/c0Dzw8NRSq0hGFoemVg
	 WjiZuXiLGZ0waoPpYAgvA5ao/Fj2Mwn7Exj2OcpMXlrumETsnsaTWK7lPkRNWpM/1D
	 dxd9KfBplpaR1w7KCjE9jLsuHt1JUV4H1dgHnTPcDMGKdsFNkhDS4AahTbcrP04OoK
	 IV3ZXBhPT0epaX2jfgMSE9hG9CNJKqxGOy3G2+0vIKvPVja+ip/moFMbCXeNGpqrWG
	 ULccuLsK33waAlSJVkGacIL5dPc/5bH0OaOb8Zv20m24n+guDjNw0lgfuGT6wP6aL+
	 VOWETkloHTafQ==
Date: Mon, 22 Jun 2026 18:17:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH 10/11] regulator: db8500: Add power domain regulators
Message-ID: <68c010de-8716-45c7-9d2c-71bd7dcb2410@sirena.org.uk>
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-10-eb5e50b1a588@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b4s6q5sc4PEIczEO"
Content-Disposition: inline
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-10-eb5e50b1a588@kernel.org>
X-Cookie: Now I am depressed ...
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


--b4s6q5sc4PEIczEO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2026 at 07:00:56AM +0200, Linus Walleij wrote:

> +static int db8500_regulator_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct db8500_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	if (!info->desc.fixed_uV)
> +		return -EINVAL;
> +
> +	return info->desc.fixed_uV;
> +}

The core supports single fixed voltages, set desc->fixed_uV.

--b4s6q5sc4PEIczEO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5bhoACgkQJNaLcl1U
h9CpRQf/dOhQq9/GU7zTV3JsdHIbbJMAd7F3IoT2PBCjFzrNdXng1yds9DFZYkyO
DK8dDx608Y0kOUwZ2q0tKuuKniQ9hzyVJqvdJ93s9XvP18H08nbcVULBETg2EtBj
HnznimPSnu2TYLd1PffHpG3qzK3VZV8U2tO5ui2iu8H76IpkadTxARyvBPDFTW7B
4zzPy6zZxBCPrJz0kXzRtDEUDxVeMmgxMjgkfpYeFVrZI5Hl2G024Hww/oMODKb5
rbQZcNj5U4lKmTNdtWuozV35pk6SeARJgJhy0zyGTVU2slW/ByHUO6opXL51m/rL
1XVzYaLz8lpJkfkMjZu/YQBQKrRQ4w==
=CpDw
-----END PGP SIGNATURE-----

--b4s6q5sc4PEIczEO--

