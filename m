Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78DAC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0enBcGmOVjVsJnS5QwljRyEmuUYBgIN46ve7sxCU8E4=; b=glEYqNm9wiIFzCIPU/xJFUQDwU
	vzWNObqxER6vEA3gDzUBsuY9ULQCnSMOhdE8EuGnU/koHhb2j0l1POv9RrXYshLn3gxeIyFRVG00H
	AVU5LTnwR7LA1jaJUYCN+SJx4kUDRKOY1WXWQYEKX3HL5XMMM+HD1p9XPcQGFlW72D+tPONs0Gjbd
	g0lG62IrtG6r3E/HcE6gxsCku+iU9EWYUtBSpgsAD8TGtjYmJmg3Qqm+NLkOQIQEQHfjT3qLSWBXU
	7glRO9HMnWAyFN/PumGcx+lPdRYW574g+2oyMysE1okk8VFO3jm2DTJqnU4IvuCoEYQI3k/khFeTc
	+7Ncqd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjQv-0000000GijJ-3Q31;
	Tue, 29 Jul 2025 12:27:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjDy-0000000GhU6-0rQ5;
	Tue, 29 Jul 2025 12:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6124F43270;
	Tue, 29 Jul 2025 12:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FBFC4CEEF;
	Tue, 29 Jul 2025 12:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753791268;
	bh=BgaFoqVRetlFIdGlmgFlyEwE1NoxMQBs2gwHf2XrQ0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JY+yc2pXP08LnmnnmxYC52FWExBeXVu/8wtbgxuDB6CrXCYIuNmxhupesBh0I4XyL
	 OEAIOPjNXPxXfTYi9EkDJsjwFJW68YVydXOplSn2ytp0SUiRDdB9Gqi7jXqF5RTuKx
	 mTI6MUy0PcMkAFXAejs57hb+sUJdyjdAnKkbJ5FDjUseoSsOYpMnaT52fzaa8N5OxX
	 fNjiSUS7/8oiPLXaecVGexMjcs1qKDC+Mu5fg6ClailYNd8jaHnCkoriG9jDzLwgTU
	 KjH+6YpzqNSzySdSGDzlXuDXHVytmzcj5sD1IrTEOO657SIywrtqoDWbksxd/73uFI
	 dbqDZbnNxQkHw==
Date: Tue, 29 Jul 2025 14:14:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>, 
	Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
Message-ID: <20250729-whispering-accelerated-raptor-134e8a@houat>
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
 <20250729-tall-fluffy-grouse-f5deec@houat>
 <1bc23ad0-7273-4ddf-a0ef-4a80186f2581@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lreg5x3nkzb4mttn"
Content-Disposition: inline
In-Reply-To: <1bc23ad0-7273-4ddf-a0ef-4a80186f2581@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_051430_289706_E46F9E3C 
X-CRM114-Status: GOOD (  28.38  )
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


--lreg5x3nkzb4mttn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
MIME-Version: 1.0

On Tue, Jul 29, 2025 at 08:53:51AM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 29/07/25 04:27, Maxime Ripard wrote:
> > Hi Ma=EDra,
> >=20
> > On Mon, Jul 28, 2025 at 09:35:38AM -0300, Ma=EDra Canal wrote:
> > > Currently, when we prepare or unprepare RPi's clocks, we don't actual=
ly
> > > enable/disable the firmware clock. This means that
> > > `clk_disable_unprepare()` doesn't actually change the clock state at
> > > all, nor does it lowers the clock rate.
> > >=20
> > >  From the Mailbox Property Interface documentation [1], we can see th=
at
> > > we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> > > off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> > > prepare and an unprepare hook for RPi's firmware clock.
> > >=20
> > > As now the clocks are actually turned off, some of them are now marked
> > > with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
> > > early boot or are required during reboot.
> >=20
> > What difference is there between the CLK_IGNORE_UNUSED and
> > CLK_IS_CRITICAL clocks?
>=20
> From my understanding, CLK_IGNORE_UNUSED will prevent the clock to be
> gated during boot (on "clk: Disabling unused clocks"), but after it, the
> clock can be gated.
>=20
> With CLK_IS_CRITICAL, the clock will never be disabled.

Yeah, that's correct.

> For example, RPI_FIRMWARE_M2MC_CLK_ID is used by vc4. It needs to be
> enabled at boot (I tested; if not enabled, it won't boot). However,
> after vc4 is probed, we would like vc4 to have control of it and be able
> to unprepare it in `vc4_hdmi_runtime_suspend()`. If I set it as
> CLK_IS_CRITICAL, vc4 won't be able to unprepare it.

If the clock can be disabled by Linux, but it breaks some drivers if
it's not enabled during their probe, something is fishy somewhere, and
it's likely it would be just as broken if you compiled the driver as a
module.

Even then, some of the other clocks should probably never be disabled,
like the CPU clock.

> I only set RPI_FIRMWARE_PIXEL_BVB_CLK_ID as critical, as, otherwise, the
> RPi won't reboot.

Why?

Maxime

--lreg5x3nkzb4mttn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIi7HAAKCRAnX84Zoj2+
ds9aAYDbl6MronUKcv7fcDowoI1cKqjICPvChFLlj4l/6+TNRODFMDYikX0DAv9f
vPf8uZEBf0TfcPnG8iD/d1L+SRJdNwbm5wVBFkOhdNF09qs/KrmVOBpAighNYiFB
XpfasiJfkg==
=+OS0
-----END PGP SIGNATURE-----

--lreg5x3nkzb4mttn--

