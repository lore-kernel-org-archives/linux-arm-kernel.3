Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CB0F9EDEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAw8tyNJBxWNgS7UqAJQX56Xpl94xLqowGoi9Ktsjqg=; b=JdL/0JkPsqS+81DLhOo8s8b9z2
	BiI9MbJeO0sbMmZPLS9UtgV9tdlafLlH1phpYjifxx9hrGtwOONwm6Lyp7BIEjDx/bLcTSMJyRPvh
	kmqTatvUBj+1+mllHFI5UWRy47lJ3jkmwKkmDRQRxjFVHMpVpsrXBKEGKiDJVza9vv1FL9nsLsJJR
	kCZ+aHJ5Iraa92362jhtLHc0GFgXBH6Krlag+2mt92WTNtAFwXRnAmXXtc5CP6tcaBMYGpnjR3Arx
	3D9IRK284tesXLcVJE7xHPYfwcMXu3GcKCDGjMgSn5iofdCARf2Y0Y9T4dGBP6IR4RGcT175WOOhV
	b6EAuTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZFd-0000000APfM-0z10;
	Wed, 22 Apr 2026 15:12:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZFV-0000000APeW-0wf5;
	Wed, 22 Apr 2026 15:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F88243C2F;
	Wed, 22 Apr 2026 15:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA4EC2BCB2;
	Wed, 22 Apr 2026 15:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776870740;
	bh=+mxPr67dmi6eGFQEyDC3BhSbmybQ9ZfOoBp7zRL6wIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XdzwLERFkYdJ669m1kPKbBDvvaSbC2lPrz2VXhRFzFnBHNGLDlDZ2ffYtquR6W9G/
	 d5Yp4X98uyHhA9SpdwxWdCC/Q8pFrdAi4alhKteYf4zdf1hQ3zZVt06nL41RppUK3r
	 kwKnazcflpTTjePKX6CZusiw4DJ1HFUOeV4KrTDtYSnXm9WGvuhEg3hJw0Og7r+JHN
	 Aq16VxCuwdW+ILHs3vqgVlD+HhXt8l1J/xglzb6vlFHcm0fp4A6KhI2eQZBT5d3Qrd
	 BoUL694meGKIoHoV5K6SwsZLVCroGOp4OM1G6R2iJ2tDKN1IntC9HQpRDtn0mMzfcl
	 uGtJ1njG+jZ1w==
Date: Wed, 22 Apr 2026 16:12:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
	Iago Toral Quiroga <itoral@igalia.com>,
	Chema Casanova <jmcasanova@igalia.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	kernel-dev@igalia.com
Subject: Re: [PATCH v7 1/5] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
Message-ID: <18719902-4b4f-4766-ba92-658f3576f68b@sirena.org.uk>
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com>
 <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
 <5f0bec08-f458-4fba-8bf3-06817a100c4c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LHYlK3DZlkasQWhb"
Content-Disposition: inline
In-Reply-To: <5f0bec08-f458-4fba-8bf3-06817a100c4c@sirena.org.uk>
X-Cookie: I don't get no respect.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_081221_307293_12D92CF9 
X-CRM114-Status: GOOD (  14.90  )
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


--LHYlK3DZlkasQWhb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 01:49:24PM +0100, Mark Brown wrote:
> On Thu, Mar 12, 2026 at 06:34:23PM -0300, Ma=EDra Canal wrote:

> > On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> > actually power off the clock. To achieve meaningful power savings, the
> > clock rate must be set to the minimum before disabling. This might be
> > fixed in future firmware releases.
>=20
> I'm seeing boot regressions in -next with NFS root on Raspberry Pi 3B+
> which bisect to this commit.  We get a likely unrelated oops from the
> firmware interface and the boot grinds to a halt some time later since
> the ethernet never comes up:

This boot regression, which was originally reported against -next
several weeks ago, is now present in mainline.  Ma=EDra quickly provided a
fix:

  https://lore.kernel.org/r/20260401111416.562279-2-mcanal@igalia.com

which I have confirmed works but I've not seen any other response to
either that fix or the original thread.

--LHYlK3DZlkasQWhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmno5UwACgkQJNaLcl1U
h9C8uAf/ZO4wI21Uzl5bCxYBY8Jno+VC7J4vtbL64QxVmWsUJS8BkYFC8/7ag7Xb
3aX+wZAeWYuf+4kqIxij9+BdG+DUMiB2na+K9l42GGjTzNOxGlrrGZbswySitPsr
h1ZXondy/6andS/ka69t4b+iHh0V6QJC/j2vVgrYGU3rg6M+jc39EZ88pwbCKej2
ZCJc/vbmmaR9d/rqkcUFelHQcdTaIdDe7bT9WWbXplaBNKYvvPVyOsNfUtjDr8An
mpRjI+38T2F+ILIjrqcY0PgvIQLKLqOpjYLl3UOsKp6WcuQirHNc0KT1t2GW43FM
4MpOkPYfCgX7zx85X1PKJ1M63CuknA==
=kuy8
-----END PGP SIGNATURE-----

--LHYlK3DZlkasQWhb--

