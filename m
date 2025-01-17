Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0B1C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 10:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdd9FskK2DzWXXfImvVIL79pWZVrNZLfYKely27sceU=; b=wno6P7iTIkfTFvdOleiqNMEi7/
	6H8jGPqeyh7Pai9STGC6D2qYcVpYkBC7wsnagUvVBSu//Om46jcAwmq+TSLk/xRf/TMQrwLLfYiJ9
	XNzC9W4L7pHI69sl0LRCjr0tfWG8ctLgpvlSxTLcmyKGevoV28ZS6CXRy/DD9YhcahIUOCaNOPlZh
	2uNwYDzulKEcZtkjb8NcSwfRd/dQzTtTF+l85L6OJ9b3149jvCYnhJ3cLcrkRqTNymBSNJ9t4hdmy
	1Wdv1deERE6pbk/+Y/rqkCLi488MnINanYYyfZ27vLyqHH7brVX+E09oCDqRkeRxhNEXkoPiHJzTs
	rCNH+AVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjXB-000000000uG-3hXr;
	Fri, 17 Jan 2025 10:25:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjVu-000000000kc-3ORY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 10:23:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0F2BAA41F5F;
	Fri, 17 Jan 2025 10:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D95DC4CEDF;
	Fri, 17 Jan 2025 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737109421;
	bh=jSwb2wZFFYhuuFvDBoxLHK554RSrZreFZDxgoQ2J7R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ujh/o19S6Vqu1kuMTO8hRnxKfWHi4+Xct04NzVhA2lyP8EBYpayiCnvepWWIIzt5N
	 XqBYEop5QaigJC4ZfkfwgIuvUi4i7JrUR7AY+1ZwHpXJeiypf0o1vHCr/4G3Vu+m3m
	 08q8EY6HSrsuqj5hZjGHsLZHfVHOY4b43+04aliZldi2eyjB+vnhNMaumEd8B/0cZO
	 Fu739I247+6CnJMcp8fjXJs9DlZ5HEEt08tgKqBJ0amk1Zqq4aslWWIkAumO7NaM1R
	 htvBgb3IgzW7E0P2ebA3gk9MZv85IzCElOoKc27DR4+uFybMQQJvc9IVwXdP+nyijO
	 dyij3wJUF0/qw==
Date: Fri, 17 Jan 2025 11:23:38 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <20250117-bright-passionate-ibis-804a8a@houat>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <CAMT+MTT+_ER+mFP1yUY+L-47-sZfNmtHUp09rqpPG174OKMJKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zxxlu2wrbjxf7qrg"
Content-Disposition: inline
In-Reply-To: <CAMT+MTT+_ER+mFP1yUY+L-47-sZfNmtHUp09rqpPG174OKMJKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_022342_984138_F7DFE9E2 
X-CRM114-Status: GOOD (  20.24  )
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


--zxxlu2wrbjxf7qrg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

Hi,

On Thu, Jan 16, 2025 at 07:52:30PM +0100, Sasha Finkelstein wrote:
> On Wed, 15 Jan 2025 at 11:21, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > > +     ret =3D drm_simple_encoder_init(drm, &adp->encoder, DRM_MODE_EN=
CODER_DSI);
> >
> > This is being deprecated, please use drm_encoder_init() /
> > drmm_encoder_init() instead.
>=20
> I seem to be unable to find any documentation or a mailing list post
> to this effect. If you are referring to this patchset:
> https://patchwork.kernel.org/project/linux-samsung-soc/patch/202003132017=
44.19773-3-sam@ravnborg.org/
> according to my understanding, it has not been applied.
> In this case, the simple encoder api provides all functionality i need,
> and a replacement would just be a simple encoder, except copied and pasted
> into this driver.

a drmm_encoder_(alloc|init)'d encoder with a NULL funcs pointer is
strictly equivalent and doesn't require any extra infrastructure or work
on your side compared to what you have here.

> > > +static void adp_remove(struct platform_device *pdev)
> > > +{
> > > +     struct device *dev =3D &pdev->dev;
> > > +     struct drm_device *drm =3D dev_get_drvdata(dev);
> > > +     struct adp_drv_private *adp =3D to_adp(drm);
> > > +
> > > +     adp_disable_vblank(adp);
> >
> > Isn't it being helped by the DRM itself? Anyway, I'd suggest moving it
> > after DRM device unregistration and shutdown.
>=20
> Not sure i follow, as this call disables generation of vblank interrupts,
> shouldn't it be done before all drm structures are torn down, to prevent
> the interrupt handler from potentially operating on objects that are in
> an invalid state?

Your adp_crtc_atomic_disable() function calls drm_crtc_vblank_off()
already. drm_atomic_helper_shutdown() will call the CRTC disable hook if
relevant, so you're effectively disabling vblank twice here.

Maxime

--zxxlu2wrbjxf7qrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4ovpgAKCRAnX84Zoj2+
dl/PAYCi6eiO7nJHixv6cIn7PybRAsm1pSznLtuB/wQE6J2GK7apdsfDdL8u9qWw
Mda3RRsBgIBwNFvsUc+ukeNozHhxEQcjinnckbPigAQcK0ltVOYGaD+kpoiteW0y
yiwJc/mqQg==
=Uyb0
-----END PGP SIGNATURE-----

--zxxlu2wrbjxf7qrg--

