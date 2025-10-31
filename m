Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0814FCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUW2HwuVCCP1E1hde9M1EoWIauwT+OPTiC2Rn/96ljA=; b=K0gRWPVWTPUZf/CmZRTFVyp+Ch
	s7Cv08lw5ENLFIaCh7YYyjCL01fqbhBaXENM8DGTRFWFsgQ0j5F92Duv93tdS0ggKUujm95J6HZfJ
	1uT/CMTZxCQm+cyFp6BYUJVBGU9q25V8TyTCr1LGDvKvoSIm5O1VUZnX5s2k44kn5uYgrR/lVtA/K
	wUvBCP9dJs6cAw2OFIEvLGGSZuKQ77QVXbv8s6mmLghWxByy6RwOQ+FIB0WErQuzsfzdUXmffWTZG
	c4klrAuNo3FDskX+G6lvabEa7XeDZqDdjC5U3nShR+433jNRFEj+aEUc3oOdw+2kQhJ0pLCHEnlkW
	qOWNJRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoPW-000000065Ru-3rf2;
	Fri, 31 Oct 2025 12:39:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoPV-000000065Rk-28Ay
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:39:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E13D661178;
	Fri, 31 Oct 2025 12:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD88C4CEE7;
	Fri, 31 Oct 2025 12:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761914356;
	bh=DUW2HwuVCCP1E1hde9M1EoWIauwT+OPTiC2Rn/96ljA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ruyJKIOOtOEEQ+8XOeehhB5S+GDMrNwlnu3aI44VE33hSi1Ioy465llBSJBU4/Luk
	 4UMoUVh+knOSVCJYWdKaevlOpecb7oKclQv9LDsu6ABuFBIWa/p4RMfL+oHST+6hc5
	 17lzxbGXPL0L5qJku0v0hThdiu+M2XSGC3GvEj1dfzNx55zGQ6oOtdmXsI6JwYqSNd
	 szK0Bzgq0m07IQ6Fnad3pRhvoG+nkh8KCzIxurTJCQVpp+aLJS4cmNHfonZHo5VMB/
	 +ZaW1crRWodnO0gcx+OIVf81QtXMoyeFyXhrpQ3SJUMdCkQZzu7TiT1fW1yJocJr23
	 rDPdM210bQ7IA==
Date: Fri, 31 Oct 2025 12:39:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	kernel-dev@igalia.com, kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	"open list:GENERIC PM DOMAINS" <linux-pm@vger.kernel.org>
Subject: Re: RPi 4 deferred probe timeout of V3D PM domain
Message-ID: <3c171b6b-f8f5-4192-a3a3-da453a900316@sirena.org.uk>
References: <ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
 <a016e7e1-09f7-4056-a855-6cfaa8d51962@gmx.net>
 <10a4ef77-0e70-4ef2-b1df-535b476d256d@sirena.org.uk>
 <ecd75fd5-3131-4d10-ae3d-b6f608d9622a@gmx.net>
 <25e500c2-3dc1-476c-b6c1-ac4098a0501d@sirena.org.uk>
 <d6b14388-e0ab-44f0-b4d9-78adf74c2a7f@gmx.net>
 <d88f6420-5013-4856-99d6-da28f79bd7a5@sirena.org.uk>
 <CGME20251030191426eucas1p29ce063b538b60e4a998bcd32f925267c@eucas1p2.samsung.com>
 <043f1702-52fc-4a83-82f7-683a26851623@gmx.net>
 <b02c8890-4568-4afe-8628-10b77e79bf44@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o3fwRCeo9dva3t0m"
Content-Disposition: inline
In-Reply-To: <b02c8890-4568-4afe-8628-10b77e79bf44@samsung.com>
X-Cookie: Byte your tongue.
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


--o3fwRCeo9dva3t0m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 09:12:57PM +0100, Marek Szyprowski wrote:
> On 30.10.2025 20:13, Stefan Wahren wrote:

> > Any ideas how to solve this?

> As I mentioned in the other thread, this is imho a configuration issue.=
=20
> If core modules are distributed on NFS rootfs, then one should increase=
=20
> deferred probe timeout by adding deferred_probe_timeout=3D60 to cmdline.=
=20

Like I say I just don't think we should apply timeouts that take things
out of commision entirely.

> On the other hand drivers built into the kernel should not depend on the=
=20
> resources provided by the drivers built as modules, so maybe it would=20
> make sense to change CONFIG_CLK_RASPBERRYPI from 'm' to 'y' in=20
> arch/arm64/configs/defconfig.

Or the GPU driver should be moved to a module to match the clock.

--o3fwRCeo9dva3t0m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkErewACgkQJNaLcl1U
h9CwoAf/TasMrYudnRIfHbZsVEJFG+6aRlxnjE4Ih5HjcUqIsa72WZFNuGACxeR9
lPgBRD2CZ8qVpdjik03ktb1PP/EnkwGxy/3elXC/YxgpWgyE4SGmiX668YojrLsw
ZAzcmwOckrGshx2O2N34zF58asnUSdPRbBVKLMNQ02koZ7brVqtQ1fLJdK9kL9qr
hu2AUeBcAOUuSGvmQKdg6cRf8owTOEv/hUd/lclvZVnZzK2CV5vs/vZG616sF8Mf
wo7+WQktr1bs38NGV4NYNtHOpCK5XrrmZUF6kRxN8P+3X3DYWEj3a++itNGUJjz5
rjOllqjvNXZrwXbKl34E5pNJNpNk8A==
=MfxU
-----END PGP SIGNATURE-----

--o3fwRCeo9dva3t0m--

