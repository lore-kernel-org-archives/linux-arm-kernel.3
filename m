Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD02E1088E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wl+hswGMyhOsfsrcMnneu3FC4Xs9Gx7WqKBlGOEGmO0=; b=vkh/jNhvsdV5Tnu/6asnUuW9CN
	APYTborG1R9jNe/9pwOnbMYfL7zVddZg5F5mM+xfkd3D658wVHjdgGHIHyxgmsAjfn+FGjzNiEJ1/
	XF3k48LffUGPzoE9mFP9T4M20isRIJ9rDL28kJMfsL/A9DlulA0I3aIlDEcENLdujtqpy5kE22Nd8
	11fciphK9HPLQPSIvM0z8fZCkC7rmu/N9hsC4iR6dwSFhad75l5RG+39RYIeYzcAcWMVK579WRWVp
	v+9UWdn7ULHJ0CxA7AuVpuDFp2iuwD19bkmt/y50kqN/hMCCxPcaYErKhF/RmRvciRh06OCC+BN64
	xXvtK9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W6W-0000000CTJc-0Tcf;
	Fri, 20 Mar 2026 09:25:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W6V-0000000CTJL-1PT5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 984B560127;
	Fri, 20 Mar 2026 09:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0EEC4CEF7;
	Fri, 20 Mar 2026 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773998714;
	bh=hytdCJvyRmCwOZPRrZqiCYUso9HSoG5TaaQC5t9D8f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icQhL9S/Q5ILqqXlrUeozeOHXjb/GuPv/wHRchDoxgIv25tlaovbaH2PdqeloTdb9
	 3i4JCMmJe9Ui0z/BtvEMISDKEQUmE5fa5bjrZ4E1a2zx8jYbChwzmDbjE8HBJjz5i5
	 THy7f206/poUIYlud6rfmz+zpiPgMMeKqcZyGd852o49RFhzCe6vS0+cltyGY5iOBj
	 zar98h6W6ZUcE6R1Q85cOiOZ+GqolTPmKAPiZYXu3yIDI1lIxv8T3TRTYsk5UfIV4c
	 1b09b/KZQfza6Tt4Y7D2ezW7qMr+juQ7pmYHv9Qz1nksN8MEuCrHwPTc6a/LPzIkTU
	 YmMtFdqil6vYA==
Date: Fri, 20 Mar 2026 10:25:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Marek Vasut <marex@nabladev.com>, 
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Stefan Agner <stefan@agner.ch>, Liu Ying <victor.liu@nxp.com>, 
	Simona Vetter <simona@ffwll.ch>, imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
Message-ID: <20260320-amiable-hairy-bullfinch-28bfda@houat>
References: <m3ms04caaj.fsf@t19.piap.pl>
 <32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
 <m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="kqtw7ezuuh3ww2w4"
Content-Disposition: inline
In-Reply-To: <m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
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


--kqtw7ezuuh3ww2w4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
MIME-Version: 1.0

On Fri, Mar 20, 2026 at 09:04:17AM +0100, Marco Felsch wrote:
> On 26-03-20, Marek Vasut wrote:
> > On 3/19/26 12:45 PM, Krzysztof Ha=C5=82asa wrote:
> > > Running (and terminating) Weston on i.MX8MP sometimes produced black
> > > or grey screens. The LCDIF3 INT_STATUS_D0 register showed a FIFO unde=
rrun:
> > >=20
> > > 32FC6024: 1000002
> > >=20
> > > The PANIC0_THRES register was set to:
> > >=20
> > > 32FC6238:  AA0154
> > >=20
> > > which apparently meant low =3D 2736 bytes (0xAA * 16 + 16), high =3D =
5456 bytes
> > > (0x154 * 16 + 16).
> > >=20
> > > With this patch (based on NXP's driver) the watermarks are only 16 by=
tes
> > > higher (register values increased by 1) and the underruns are gone.
> > >=20
> > > Tested on Solidrun Hummingboard Mate with a 1080p60 HDMI display.
> > >=20
> > > Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
> > >=20
> > > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > @@ -353,8 +353,8 @@ static void lcdif_enable_controller(struct lcdif_=
drm_private *lcdif)
> > >   	u32 reg;
> > >   	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> > > -	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_MAX / 3) |
> > > -	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_MAX / 3),
> > > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, DIV_ROUND_UP(1 * PANIC0_TH=
RES_MAX, 3)) |
> > > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, DIV_ROUND_UP(2 * PANIC0_T=
HRES_MAX, 3)),
> >=20
> > I am starting to wonder, whether this should be configurable in DT, bec=
ause
> > it seems there might be users that need to tweak the watermarks one way=
 or
> > the other for different video outputs ?
>=20
> +1 to provide a override mechanism via DT.

If this is related to the output resolution, the DT is the last place
you should deal with this.

Maxime

--kqtw7ezuuh3ww2w4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCab0SdgAKCRAnX84Zoj2+
dmj8AX0fLuO62vmJI+ySHByc+XZ8s3q4zviMe03MY5pK5cTsFHhJcFrOeMWaRAGv
9SSJUCgBfRDumumJyxKSS5n1QS/g5KofFiU8leZjI7jjZE73tL3qBmVQuuVtlQvX
A3w8KjXclw==
=0nyw
-----END PGP SIGNATURE-----

--kqtw7ezuuh3ww2w4--

