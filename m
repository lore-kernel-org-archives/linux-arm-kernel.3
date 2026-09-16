Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57856C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0joaZXkFzvHsMPXxvnQrk/bZSSnjHuyjzDW4e7lSU7g=; b=4pX2mas4ShmL7E6rjEhkNH56Lu
	EGr5BGciOH3j9oXO4G09c1BMzmTNCnXPC8RaZ86Igb2qheylLti1xIG7RQzkfeIfSDF5r6QKN+Dgj
	Swxm+w4f1g5JLvbo/32QA7aNZDWPdWsoftbZPXKaaJ6rl6eaT09sp8cFSEv4sizuLzzlw+ekEpKT/
	a5VaRpHp2tKlhyoi5gt1VbUJP4CeJLiMzNN9k1KKpJ6UDvErK/kxRsYLqiPa/pnxBraRAir6K0KsC
	/FwKFck/lMLAowi/GD7PVrc7glqwvoLxTQJrN6yGXP5BsYSNfK7XTblnAHublryP+cp6IcOfttYP3
	Fu0JUq/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kMA-00000008ccs-3OPJ;
	Wed, 16 Sep 2026 07:47:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kMA-00000008ccm-1Lum
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:47:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 685B66020C;
	Wed, 16 Sep 2026 07:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAF61F000FF;
	Wed, 16 Sep 2026 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789544821;
	bh=0joaZXkFzvHsMPXxvnQrk/bZSSnjHuyjzDW4e7lSU7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nc+M2tZwVJsixOM56NLEFYEzQkaMNDIiByci6H3lph5WSy/sEnP/SvbP6NTlniikG
	 Ewmocn8mbkhzZl9xv2kVMDBr9tzV6fTxVdxlVlUs7jGzcaKO2mFJVVhpduKi44oong
	 sHtZYmooyLnIcMDIU55vEXNcmGKmkaxT2821zwOmgb3Efs5H3NrjmHxgoHWATRdia5
	 KNsXvB16dSqeGTjIGJunLyXRJRAL3W18yGfPBId94h5QLA//ndBGRfh3HO0XR5ZLsF
	 ZZfrrn52BOrmvfzleaLFXxmfmxJIZnjEVpiunf5J+VIySiejvQLBNbUK5GOMjqX3Eh
	 +6UMsYsqAvK1w==
Date: Wed, 16 Sep 2026 09:46:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Marian Cichy <m.cichy@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
Message-ID: <aqpJKSSKunElnQ3o@houat>
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com>
 <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3s4tplx46ij6zcs2"
Content-Disposition: inline
In-Reply-To: <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
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


--3s4tplx46ij6zcs2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0

On Wed, Sep 16, 2026 at 08:50:21AM +0200, Thomas Zimmermann wrote:
> > +static const struct drm_plane_funcs imx_lcdc_plane_funcs = {
> > +	.update_plane		= drm_atomic_helper_update_plane,
> > +	.disable_plane		= drm_atomic_helper_disable_plane,
> > +	.destroy		= drm_plane_cleanup,
> > +	.reset			= drm_atomic_helper_plane_reset,

Also, this needs to be drm_atomic_helper_plane_create_state

> > +static const struct drm_crtc_funcs imx_lcdc_crtc_funcs = {
> > +	.reset			= drm_atomic_helper_crtc_reset,

 and drm_atomic_helper_crtc_create_state

Maxime

--3s4tplx46ij6zcs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaqpJcAAKCRAnX84Zoj2+
doCwAXoC9/rqP3SJq9eA3TmbsgUL1dNQBlXU005d6LFRuERn952eYKYsEdnw0oH7
sS3Ms8EBfiZnSTC8Whf1zsDguMj/m/bcSyfEzHV6wM8Ix8qPXjNRdKfvP1twZo2V
tHED8pYuFg==
=LKtN
-----END PGP SIGNATURE-----

--3s4tplx46ij6zcs2--

