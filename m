Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B6EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Smu+NZsSUUh5JBEqK60Ifh8ONkVk0DeJhJql6Ihi3cU=; b=i97Mk/BagOWwDRhTBzXP9NZk37
	fRArSjxZE/ov7oGeyW554eqS4Irpe11WKlFESY9s9wRj7nRD1FpjBNSKmyY2Uubj5vMVMy5J9zU7l
	KtvOW65AvdDE4u+ltuebnKFrIQuKH4hvnlP+LuSR02XkuJKfV/j93LhvNH+dER5qiz78Sh2te3HlP
	j1UnzDLUsTxx0eZ1VBLxgTSKQ4+VUIfRU4smQkRFhnB041RjusAqrUlGkuAkrvgUzspnD0JDndDaM
	lfS711ovFD/p7t7SsaFM5SWktuFH9CF7ymLEZjGj6tLIq5t0Ix24urwo4d0kb1v7AdGupxLeu35WK
	MwkVkrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSPK-0000000FT5K-2Hz6;
	Thu, 16 Jan 2025 16:07:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSIu-0000000FR2C-12aV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 16:01:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A16D75C58C3;
	Thu, 16 Jan 2025 16:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948C1C4CEE1;
	Thu, 16 Jan 2025 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043267;
	bh=K+O30vGF8jNEYQFXsYQnn3DPQMXPqVS7VsD/r8QKN1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lo485IKbw+eOWH9CJfq3RxyLfSDwWzOIGOafK7LwYcIRglHUpSCfZvcnHDLvL+bQU
	 Ctt7NMCC3MWl1glyldYnSoiMv4t2A5+v1ywa1rij0TAywGP9TW6PGyt6PFXQ1KjYov
	 030Uiod4Z38mycvYsM+gwH9khJD3uis5jLoe2JBuYQc3vEyVuJHAGThUCZ5bKW/o24
	 5IJfg2Ut+8i75uH4exc7cWhkyoLhA93mTkgg4eALg62ezEVdEFEowc8/nSq4zC6Q6p
	 c1cnO0D58K2bcWaGGQc3Cwi7NzW1e6+c2NvnQRKad0cWfR0HCQYYR9cyzCXBY3J77k
	 ceWOp3UOMzPjQ==
Date: Thu, 16 Jan 2025 17:01:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rgvkyocpvfnurspd"
Content-Disposition: inline
In-Reply-To: <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_080108_327046_F60D8FAA 
X-CRM114-Status: GOOD (  16.02  )
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


--rgvkyocpvfnurspd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

Hi Dmitry,

On Wed, Jan 15, 2025 at 12:21:39PM +0200, Dmitry Baryshkov wrote:
> On Tue, Jan 14, 2025 at 10:38:53PM +0100, Sasha Finkelstein via B4 Relay =
wrote:
> > +static int adp_dsi_host_attach(struct mipi_dsi_host *host,
> > +			       struct mipi_dsi_device *dev)
> > +{
> > +	struct adp_mipi_drv_private *adp =3D mipi_to_adp(host);
> > +	struct drm_bridge *next;
> > +
> > +	next =3D devm_drm_of_get_bridge(adp->dsi.dev, adp->dsi.dev->of_node, =
1, 0);
>=20
> select DRM_PANEL_BRIDGE for this API to be available.
> Also there is an issue of lifetimes. The bridge will be destroyed only
> when MIPI driver is unbound, however the panel can be attached and
> detached several times.

Can you expand on that one a bit more? AFAIK, it's always been unsafe
and we don't have a good mitigation at the moment, so it's unclear to me
what change you want here.

Maxime

--rgvkyocpvfnurspd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4ktOAAKCRAnX84Zoj2+
diYEAX9X9nkT02sFf01ulFeGvCcG9S4zbIOBRhh3YUXpaH4JAbu+6x4S7Ioq+nx1
cybYy0ABf2QLNDKRv+5B3Kyk0nHtU/Qae+ucdanC6Nw7Qqf6R/77ktfolomf8Oc4
t/GdZdJufA==
=siI1
-----END PGP SIGNATURE-----

--rgvkyocpvfnurspd--

