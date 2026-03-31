Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC756109B46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ua09WmBLY6KGcbum/vvb0a1QtvfmmzFzVBV577v3kNg=; b=wsTaWgSYVz5mZZdQ6RcF0OYRKP
	bs2k67xGkpVUTXnLBmXVixJl7XCrYLE5qpgDzJRd/IxPRxkZ4+n19GjZEFxNu0k9XAT2wC4S1Pu4U
	nOLCbrS0ZGpRsjEWI+xGraePj00FLh+RlKyJBQYfEqWRK7JqxORE3G15jm8hC4dFyyygKyRB2QUcN
	uD+XOUkA7AgL12VilAl6cB7OxLxxmpaSwZATtqRpg7v+v1rcFqt855I6o8q2CagKNLrSOiaZWU8iq
	HEZdH7M8WTleVTR2b+7nHlZTKZES0LgwIgt/HDnfhvq5AjbMfG+IPa6Zc3/Dns30P8dPx27a6b+9J
	z+yPQc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aKe-0000000D7ax-3ksm;
	Tue, 31 Mar 2026 14:44:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aKd-0000000D7ag-2iH3;
	Tue, 31 Mar 2026 14:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F4566024D;
	Tue, 31 Mar 2026 14:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D34BC19423;
	Tue, 31 Mar 2026 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774968278;
	bh=3Jhe3TYvRFJkGv7Zr9SSw2NSWBUOqC4UfBtpEzkNAq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rj6yay0F8xnQmb2P+v/FnkDjrmuTOcOJYfOxuiibrcXSN9gjxUZ4lLxVRJbEbUYcS
	 JN7r1VaXkvKla+H4EMfP13kjj5KfmKUrTosQUkMKLfJkQYOVXJwf1rs9/Qh5DQQJry
	 ymJfWPTgj8DhkiErhAymB7y3E3e5qJLlgB66V/NM86KxvwDSkxvRgERA4O2T8AFwOU
	 RDyfZ4Rs4dxSJOF36eVqZyClMR5Z1okIXEgkQ4hAts6VxccPH8hoCBK2CcfORUMbem
	 q97xkpxD0/oWeQnKHq+ajwsKw9BWSA0PVbpuTEzR0lhadJ75DkuojegAu/+PCiYayh
	 5u3BksmTnqH8g==
Date: Tue, 31 Mar 2026 15:44:32 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <8a3c104f-9259-46a9-a6d2-a907d699e49c@sirena.org.uk>
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com>
 <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
 <5f0bec08-f458-4fba-8bf3-06817a100c4c@sirena.org.uk>
 <d251c380-f2f5-4daf-9661-bbb6dc6c959e@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mw1gwsm7ZbtolsXc"
Content-Disposition: inline
In-Reply-To: <d251c380-f2f5-4daf-9661-bbb6dc6c959e@igalia.com>
X-Cookie: I just had a NOSE JOB!!
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


--mw1gwsm7ZbtolsXc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 11:32:07AM -0300, Ma=EDra Canal wrote:
> On 31/03/26 09:49, Mark Brown wrote:
> > On Thu, Mar 12, 2026 at 06:34:23PM -0300, Ma=EDra Canal wrote:

> > > Rather than pushing rate management to clock consumers, handle it
> > > directly in the clock framework's prepare/unprepare callbacks. In
> > > unprepare, set the rate to the minimum before disabling the clock.
> > > In prepare, for clocks marked with `maximize` (currently v3d),
> > > restore the rate to the maximum after enabling.

> > I'm seeing boot regressions in -next with NFS root on Raspberry Pi 3B+
> > which bisect to this commit.  We get a likely unrelated oops from the
> > firmware interface and the boot grinds to a halt some time later since
> > the ethernet never comes up:

> I've managed to address this issue locally with the following diff:

> diff --git a/drivers/clk/bcm/clk-raspberrypi.c
> b/drivers/clk/bcm/clk-raspberrypi.c
> index df2d246eb6ef..ef5ae3b4adca 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -160,6 +160,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =3D=
 {
>         [RPI_FIRMWARE_VEC_CLK_ID] =3D {
>                 .export =3D true,
>                 .minimize =3D true,
> +               .flags =3D CLK_IGNORE_UNUSED,
>         },
>         [RPI_FIRMWARE_DISP_CLK_ID] =3D {
>                 .export =3D true,

> It looks like the VEC_CLK can't be disabled at boot time. Otherwise, a
> bus lookup will happen (similar what happens to other RPi firmware
> clocks).

> Is it possible for me to test this change in LAVA CI before sending it
> to the list? Just to double check that this patch indeed fixes the
> issue on your side as well.

I can give you access to submit jobs easily enough, if you're already
familiar with LAVA and have somewhere to host the binaries that'd work.
It might be more straightforward for me to just test it.

--mw1gwsm7ZbtolsXc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnL3c8ACgkQJNaLcl1U
h9DMywf/c7JBjgSLiPt0az2ROBbBsrilMJsPqSNTsDXA7X5NknfUFp72tFaotahG
8vusN+z69oaPzUBfSXNsdkuURtbFw+lfZvxE4POlhNUeCVHgMtV2d3ZMkOp08tXW
gsRgIsUPBRLUmJ1tbBJ2gLJefotLzW2GMgl9p2jn/fX9K7JGzb3WEE0mlGz+cEi5
hhbYGyU5uEgI4inXmDrG5zb68H+yhuYSAFcmKVhGjPs+8C0UNLX8cD8sOYo64KR0
6dYyMlGKUGrQyleLJ9kvD/k+enQTS043Vz81Iu0dGsn+RUM9J114a4jOg0R+0V4I
JdWePwdWTSYwrYz1SOACpRqaYrMVEQ==
=AW0Y
-----END PGP SIGNATURE-----

--mw1gwsm7ZbtolsXc--

