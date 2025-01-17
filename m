Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A79C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qu6U0hIvqC1jRLeAcOT78n28ZEhhzlSY2dmguCgx9hc=; b=zefkQUxsCMVCMPUulBjmvDJBYM
	wJ/eve4jl2IyW+NzOEXcQ09Npz5XqI0wPgHnoZWhHOQiDTw/dAMBYJU4HuzUjgmbnVj9C09FlvPlq
	jBPS485jLN0Nbgz4w9RDsvJId2sx7iR5kQS2nevXNSuFLqny+ug7wm3XujpnBG3AUWjvTRO15fFEK
	5ir/4D/4yh9HkI6w56EXc+6+ewu7TVOj/NtN3IWRnfP94nS3yyGPLxaQ+SP/UjsE7Hw4WLpl0C6Ma
	FQUdwDN0+eRAOrspSwWzLOcOKWzs0s8ldcrSAXlltE+PXeVk4X+SRzGiH2U18jcnUSIhDFzlYrWKK
	UDkGYINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjYQ-0000000015H-2AoM;
	Fri, 17 Jan 2025 10:26:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjWD-000000000o0-1Ltu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 10:24:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A01C5A42B7D;
	Fri, 17 Jan 2025 10:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FC5C4CEDD;
	Fri, 17 Jan 2025 10:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737109440;
	bh=qzAn1c/k3kESKkXWElYSoijsx7SCYZrltfmSf6A/EVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDjUHGhhhcftUMtpezf3hANBIPaphR7bvOodUfMNOQC3CJvXfvE6GD6bxwbkuMCLG
	 Wes4Ua1XkqLVQMPJwwSs7eruwdSp4QjWHRm2AqWeWiy25ulPhrtg0j2N9cy6sdy7Z1
	 Wkq68kBM8c4815iOQVTeQGND6oftcloYIHHcWBnhCqAPotfhQA4chEkydW637taHgr
	 gIdN5oyxoYp7KOcOVkKXwGxCvU1xuaZqe4P6L3A0dejnb58pkzHf9xQXggiXoxdmuJ
	 DjLsfJmcYRaICdnPOek/a70S+y6avH1c00b7lYidwwZbRkoNjUJPxTu4tfv+Zsh7fH
	 issgUmelDZaag==
Date: Fri, 17 Jan 2025 11:23:57 +0100
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
Message-ID: <20250117-neon-unicorn-of-plenty-bbe639@houat>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
 <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vrjre4lk5dsy5ds3"
Content-Disposition: inline
In-Reply-To: <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_022401_484838_CC459EE5 
X-CRM114-Status: GOOD (  21.84  )
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


--vrjre4lk5dsy5ds3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

On Fri, Jan 17, 2025 at 05:43:57AM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 16, 2025 at 05:01:03PM +0100, Maxime Ripard wrote:
> > Hi Dmitry,
> >=20
> > On Wed, Jan 15, 2025 at 12:21:39PM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Jan 14, 2025 at 10:38:53PM +0100, Sasha Finkelstein via B4 Re=
lay wrote:
> > > > +static int adp_dsi_host_attach(struct mipi_dsi_host *host,
> > > > +			       struct mipi_dsi_device *dev)
> > > > +{
> > > > +	struct adp_mipi_drv_private *adp =3D mipi_to_adp(host);
> > > > +	struct drm_bridge *next;
> > > > +
> > > > +	next =3D devm_drm_of_get_bridge(adp->dsi.dev, adp->dsi.dev->of_no=
de, 1, 0);
> > >=20
> > > select DRM_PANEL_BRIDGE for this API to be available.
> > > Also there is an issue of lifetimes. The bridge will be destroyed only
> > > when MIPI driver is unbound, however the panel can be attached and
> > > detached several times.
> >=20
> > Can you expand on that one a bit more? AFAIK, it's always been unsafe
> > and we don't have a good mitigation at the moment, so it's unclear to me
> > what change you want here.
>=20
> I was thinking about using drmm_ here, as the DRM device is also created
> and destroyed each time. But I might be mistaken here.

Ah, right, it makes sense then, thanks!
Maxime

--vrjre4lk5dsy5ds3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4ovvAAKCRAnX84Zoj2+
drc7AX4lqVMGAHarEVIA1Pcn9ke3TjmZj9h/0P1cE1+WwL9tu59subgCIKYEEgjn
Aw9JlO0BgJrqHXIvHGhiKj6/R5jZ/CPGL5hq7c6TtHTEuGuvElaI8g5bkBCei1SG
lE8HfloWLQ==
=lUDV
-----END PGP SIGNATURE-----

--vrjre4lk5dsy5ds3--

