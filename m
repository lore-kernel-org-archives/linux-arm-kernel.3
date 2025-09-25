Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5EDCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz0ntQxtbSScgBceqf0xmJ6yCeJzqYsD5xVK+HpSWkw=; b=w664O8yD3Em1JbwVMjwKRBtUFj
	HXsGwgEd0J4qAp9jgQUKz/I8cA1KV1MzHsNi/nxLOcTUPV3RtZwkYVMWa/ovgfCqhZ4aUCKn/lh1A
	ENEoCkDCnyPrUha/lagMhagZYJTNJWowh6kGgumv3iFgKl1n4PiNHTJSCWywGl+hKlQ8a5AKMOCy1
	NJ0zyjeFb/3asytC2u/1grF/msMXuFeOseAdDiCuu44AnHnJLMhQds6eiBQn+OBL+bdAQaLkACsEt
	hpJyos8OoP4nHGHQOiEpPHib7NGkhNWUwYgrtSBWCVV3ct3DsobI1JFQREJroixclslWdMi5AQ5YQ
	JVrzqsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kNf-00000008chB-3sHM;
	Thu, 25 Sep 2025 11:43:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kNe-00000008cgE-2F61
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 11:43:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EEEBB6051E;
	Thu, 25 Sep 2025 11:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFE7C4CEF0;
	Thu, 25 Sep 2025 11:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758800601;
	bh=a5xPdx3jXMIi7dIC3fqaFYnfIes+xJu61vL48T1pH/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FwLyz8IlT5sZGXEfJ/5PvIGhwv/edRsDGhxjaHVApRZYgaus6H+zHMQu05x5KWImR
	 0fkYan4uSt5mgDwUeMS+KjzAaT3zrI4h/PHpa+ymSo78E0yTLStROaDkN5yje9aWnz
	 PjmTYha7XF8hy8lXZcZDTWYVMSfrrAM5jOxAp/fag9bvV7GLdHr7IGMrKnKqnDO5SU
	 igACWAO0G57a07/JC55DmJcPNv6rS3Z9/wOTQ6wrSBO5naJgml7Y/cklDOtd2qx7f4
	 iJmb4bK44skn+5uduXQRbXvUydi+xCWm8e0uPGZBz6N5xNjyRhVYhHdOnPhRL7ADFs
	 fPRk3RcBf8Xaw==
Date: Thu, 25 Sep 2025 13:43:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Randolph Sapp <rs@ti.com>
Cc: Kevin Hilman <khilman@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andrew Davis <afd@ti.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
Message-ID: <20250925-elephant-of-absolute-prowess-a97fcd@penduick>
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org>
 <7hv7lhp0e8.fsf@baylibre.com>
 <DD1IXJDTBQ72.2XIEIIN0YA713@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xje5644bvvj2aacm"
Content-Disposition: inline
In-Reply-To: <DD1IXJDTBQ72.2XIEIIN0YA713@ti.com>
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


--xje5644bvvj2aacm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
MIME-Version: 1.0

On Wed, Sep 24, 2025 at 09:26:17PM -0500, Randolph Sapp wrote:
> On Wed Sep 17, 2025 at 10:24 AM CDT, Kevin Hilman wrote:
> > Michael Walle <mwalle@kernel.org> writes:
> >
> >> The TISCI firmware will return 0 if the clock or consumer is not
> >> enabled although there is a stored value in the firmware. IOW a call to
> >> set rate will work but at get rate will always return 0 if the clock is
> >> disabled.
> >> The clk framework will try to cache the clock rate when it's requested
> >> by a consumer. If the clock or consumer is not enabled at that point,
> >> the cached value is 0, which is wrong.
> >
> > Hmm, it also seems wrong to me that the clock framework would cache a
> > clock rate when it's disabled.  On platforms with clocks that may have
> > shared management (eg. TISCI or other platforms using SCMI) it's
> > entirely possible that when Linux has disabled a clock, some other
> > entity may have changed it.
> >
> > Could another solution here be to have the clk framework only cache when
> > clocks are enabled?
>=20
> So I looked into that. There are still about 34 clock operations that are
> functionally uncached, but it does seem more logical than treating everyt=
hing as
> uncached.
>=20
> Side note, why would someone even want to read the rate of an unprepared =
clock?
> I dumped some debug info for all the clocks tripping this new uncached pa=
th.
> Seems weird that it's even happening this often. Even weirder that it's
> apparently happening 3 times to cpu0's core clock on the board I'm curren=
tly
> testing.

The short, unsatisfying, answer is that the API explicitly allowed it so fa=
r.

It's also somewhat natural when you have a functional rate to set it up
before enabling it and the logic driven by it so that you would avoid a
rate change, or something like a cycle where you would enable, shut
down, reparent, enable the clock again.

In such a case, we would either need the cache, or to read the rate, to
know if we have to change the clock rate in the first place.

Maxime

--xje5644bvvj2aacm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNUq1QAKCRAnX84Zoj2+
dlS+AYDYcgVjmnkP3YmpKQblVoojlCq6+KQGaNg5XQixrO1I2MsBBcvKjFbkL9Fx
/JpQrIYBgJTaiR/ihBAVpD80IqL5X6pNQAla0FGkzvuPA23E+shl4FQ7aGaa1SQf
KklmoGMEWw==
=HGWr
-----END PGP SIGNATURE-----

--xje5644bvvj2aacm--

