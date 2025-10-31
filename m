Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B09CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FYiplkhGPSxfPuGJjmOk/UCz0pFhx3eF0x4n/O9xT8=; b=mY866NUl6tzcjzwrp1/Ouw1zFc
	vbk9zzshcw5g6qoB9ZG55sqrTSuKNQzIBUM5dBaU9BXNCpPT7w5OGz1E9k0vIxlVWU1WDKWyJXxER
	DfPIqvYegJPSIc1x3b+Nbv6aQSsaT/yMMME7ADP4sclKXTrEeyINWDT40tmgoILxWr48nS1+elevD
	v7sw1yT8ZCNrnxgRRB38k0EmGHnb7jgf9fzhSB3TOBoUwejj9pUkLxKrO74Oy/mrOPxEQoxV7fizL
	mp7yqm9NgGuCs3izwkiDV1fon0OkzuA+4TVGxQePK/nMJoyDqPVpDtMZxoc4MgiF/bk2sv2y0Mauj
	gIPu+TfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoKy-000000065AF-0706;
	Fri, 31 Oct 2025 12:34:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoKx-000000065A9-0AYP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25B0A61FC1;
	Fri, 31 Oct 2025 12:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDBDC4CEE7;
	Fri, 31 Oct 2025 12:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761914073;
	bh=qp7p4OjV21T3iXDqxMAdoFN7yqHseFTIlvJMnmtuDn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V58qOvdC6F7V+ERFpyhfPUuchLohiQmLQ++GETumq2j0dREsdUTaG3ESPLfDlAAy3
	 +skw6I7tUWOdrzpymhOgLg6T4C1FuZ+yCBteN9WSU5Uyz9Se1eWUeB0lDwcbBZidjM
	 ay5QUiSS+KD5FWYSLCV9WPq+z6p2gxZ+c+6o6qOPjp+0pL7s9AhYpP+DuBgHkJzW1x
	 B4E7CpGLBTZk6AqE5tdxxB90GTcz2tix475c43rYjtOuaxJvXCrqhq75vE7pd7EsUo
	 hUVMEcybP6s6VeVE41+bxFxxg8D5vzVPrgaZ2O9Kk6VCLU+Hw7OW9fnt5y/BwTFdTn
	 hn7O+5nyjF5Cg==
Date: Fri, 31 Oct 2025 12:34:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	kernel-dev@igalia.com, kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
Message-ID: <ded1d5ac-fed9-4f5d-a85a-b6edebcad274@sirena.org.uk>
References: <a5e1e279-7e20-458d-a75f-787e0adbc9fe@gmx.net>
 <ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
 <a016e7e1-09f7-4056-a855-6cfaa8d51962@gmx.net>
 <10a4ef77-0e70-4ef2-b1df-535b476d256d@sirena.org.uk>
 <ecd75fd5-3131-4d10-ae3d-b6f608d9622a@gmx.net>
 <25e500c2-3dc1-476c-b6c1-ac4098a0501d@sirena.org.uk>
 <d6b14388-e0ab-44f0-b4d9-78adf74c2a7f@gmx.net>
 <CGME20251030125919eucas1p17450881a921187fd804abf531ccfe1e2@eucas1p1.samsung.com>
 <d88f6420-5013-4856-99d6-da28f79bd7a5@sirena.org.uk>
 <a3ff2ac0-573c-44c6-b8b4-8b6d11548a16@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VRijyemmI/KEl1PB"
Content-Disposition: inline
In-Reply-To: <a3ff2ac0-573c-44c6-b8b4-8b6d11548a16@samsung.com>
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


--VRijyemmI/KEl1PB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 08:09:47PM +0100, Marek Szyprowski wrote:
> On 30.10.2025 13:59, Mark Brown wrote:

> > That seems buggy on the part of the core, particularly since userspace
> > isn't there yet so we might be missing some filesystems - I would have
> > expected the device to probe once the supply becomes available.  But I
> > do agree with your analysis, it doesn't look like an issue with this
> > driver.

> Well, I see this partially as a configuration issue. Probably in case of=
=20
> NFS root and modules distributed there it would be good to add=20
> deferred_probe_timeout=3D60 or something like that. I'm not sure if there=
=20
> can be any generic solution for this kind of issues.

I disagree, I just don't think we should ever stop trying to probe a
device that's in deferral.  It's sensible to carry on with system wide
actions after a timeout, but stopping trying to probe the device isn't
helpful.

--VRijyemmI/KEl1PB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkErNIACgkQJNaLcl1U
h9B8wwf+Kdw9rjhA/XKpcWjn2DNfVY+bqk1r0+SetYZ/Kc+QDexKRkXbkkgoj0CK
qX+zQQnObxfdjO2+NOkv10uHLEWaAnIzzPrsi/VXW4JsrgLQAItBso0rb8OCa9bC
smdA6hKJXkdKdNkQjvldMgJOwFxseQh9Ut2ijjbt1xll6IDWepzLSCM9oF+8Sj7K
njHjIiJNuwCkS0aEKPTfNAW4snykYekdxtzRfg73tZChzXcPzyC6/rFu6KhvQYr2
S0b9Ndq4iL0dKG/+8gyNOMKSvfmTUoAOe8j24m1JTnIku5nWInL42TTJbSzsna6/
rFciDDQCKid8EcYlAHxFtvBJoGKiYA==
=sGXh
-----END PGP SIGNATURE-----

--VRijyemmI/KEl1PB--

