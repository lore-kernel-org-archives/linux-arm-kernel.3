Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD52CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrRTMDRoKEij/qgsmjlkkItncpY8TQi3dW/HAP1V1O4=; b=qEq4XwI6FQczFptRlugu2BBD5h
	0B5eJlncNi/eSCoMr/I9rgdcCznybQAKBuJopYCVCbQdy6tW9zU3k44aSQ2M4eoG6mBJXcCFIpCUL
	KEospAFED15HQgN9foQ+FTpfQgzPXVg2f3dNef9EChPF3WS73rTRONbXKiV3N01iIVz580F5i62sA
	lZIHM76qxhBS9CxRzAO0Q8onHAFzQF49fhgo2aDXffcEhWZotGNtu/0S0oF1EuWdwWpdNL6bNFmHS
	QZlTNS1In5XZuXxlLXxnSrgkupJGR4A5tYnJUxPTDKiORjQIIUvhG1RLae4JmltmNP5qACMRTEDEf
	XjJq8Ezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsIX-0000000EEIL-01lL;
	Mon, 20 Oct 2025 15:59:49 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsIU-0000000EEHD-49u1;
	Mon, 20 Oct 2025 15:59:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760975979; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wy0NOCnKfBjwkN1+ttbmqreAXMxrEFfBhHLur1okXEVB8hGchpzFBxF24zQq262j2EPG6VZfHZSmP4USowJRFr+Z6lioLlMEvaHijQE+Nn5HTVQZbHRs1wdx4xFPJS644ufSUkEswDomYYIXFqVSKbv4dRaPFk4ZA5dMMUpw7n8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760975979; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zrRTMDRoKEij/qgsmjlkkItncpY8TQi3dW/HAP1V1O4=; 
	b=DUWu+26nuvDQigb7XaIUdxyQGTczedqCMJO/SY5kloFvFuWPLZkInxx29MAZTg7WDeNaQMXfUZacUqlFBBEd3LbPIxS/mGT5uLhT5WLsLgT0/xQ0n7U7abTOQ18VZ+tdcIR2eABIbiDeekEdJq7QDRftFcvyNgzS1G6l9Fes9p8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760975978;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=zrRTMDRoKEij/qgsmjlkkItncpY8TQi3dW/HAP1V1O4=;
	b=CIqNZUYNWpVGH2I7WLmeDPFtveMCn0pQ2wDLLwd58MBwsleeFPHnqkWJ4YKq/OoL
	I7cbgvwlgvfSblNpOu4m4Xs6KGbAV7WI4vx/8TC4ADXbrDa6iWeHSjUppx4QcNRSGsw
	VQyNbCMfk+C1PqkHa+15qNQ4KC6mvNv6pkY8c464=
Received: by mx.zohomail.com with SMTPS id 1760975975377620.3381568170347;
	Mon, 20 Oct 2025 08:59:35 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 4BE16180B11; Mon, 20 Oct 2025 17:59:29 +0200 (CEST)
Date: Mon, 20 Oct 2025 17:59:29 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, mturquette@baylibre.com, 
	sboyd@kernel.org, zhangqing@rock-chips.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: Don't change PLL rates when
 setting dclk_vop2_src
Message-ID: <j6ondk5xnwbm36isdoni5vtdq5mf5ak4kp63ratqlnpwsgrqj2@paw5lzwqa2ze>
References: <20251008133135.3745785-1-heiko@sntech.de>
 <2749454.BddDVKsqQX@diego>
 <eumxn7lvp34si2gik33hcavcrsstqqoxixiznjbertxars7zcx@xsycorjhj3id>
 <4856104.usQuhbGJ8B@phil>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d64jzfl74qyxt42h"
Content-Disposition: inline
In-Reply-To: <4856104.usQuhbGJ8B@phil>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/260.922.11
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_085947_082469_815774FC 
X-CRM114-Status: GOOD (  33.33  )
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


--d64jzfl74qyxt42h
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: rockchip: rk3588: Don't change PLL rates when
 setting dclk_vop2_src
MIME-Version: 1.0

Hi,

On Mon, Oct 20, 2025 at 02:49:10PM +0200, Heiko Stuebner wrote:
> Am Donnerstag, 16. Oktober 2025, 00:57:15 Mitteleurop=E4ische Sommerzeit =
schrieb Sebastian Reichel:
> > On Wed, Oct 15, 2025 at 03:27:12PM +0200, Heiko St=FCbner wrote:
> > > Am Mittwoch, 15. Oktober 2025, 14:58:46 Mitteleurop=E4ische Sommerzei=
t schrieb Quentin Schulz:
> > > > On 10/8/25 3:31 PM, Heiko Stuebner wrote:
> > > > > dclk_vop2_src currently has CLK_SET_RATE_PARENT | CLK_SET_RATE_NO=
_REPARENT
> > > > > flags set, which is vastly different than dclk_vop0_src or dclk_v=
op1_src,
> > > > > which have none of those.
> > > > >=20
> > > > > With these flags in dclk_vop2_src, actually setting the clock the=
n results
> > > > > in a lot of other peripherals breaking, because setting the rate =
results
> > > > > in the PLL source getting changed:
> > > > >=20
> > > > > [   14.898718] clk_core_set_rate_nolock: setting rate for dclk_vo=
p2 to 152840000
> > > > > [   15.155017] clk_change_rate: setting rate for pll_gpll to 1680=
000000
> > > > > [ clk adjusting every gpll user ]
> > > > >=20
> > > > > This includes possibly the other vops, i2s, spdif and even the ua=
rts.
> > > > > Among other possible things, this breaks the uart console on a bo=
ard
> > > > > I use. Sometimes it recovers later on, but there will be a big bl=
ock
> > > >=20
> > > > I can reproduce on the same board as yours and this fixes the issue=
=20
> > > > indeed (note I can only reproduce for now when display the modetest=
=20
> > > > pattern, otherwise after boot the console seems fine to me).
> > >=20
> > > I boot into a Debian rootfs with fbcon on my system, and the serial
> > > console produces garbled output when the vop adjusts the clock
> > >=20
> > > Sometimes it recovers after a bit, but other times it doesn't
> > >=20
> > > > Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> > > > Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger=
 w/DP carrierboard
> >=20
> > I'm pretty sure I've seen this while playing with USB-C DP AltMode
> > on Rock 5B. So far I had no time to investigate further.
> >=20
> > What I'm missing in the commit message is the impact on VOP. Also
> > it might be a good idea to have Andy in Cc, so I've added him.
>=20
> Hmm, it brings VP2 in line with the other two VPs, only VP2 had this
> special setting - even right from the start, so it could very well
> have been left there accidentially during submission.

I did the initial upstream submission based on downstream (the TRM
is quite bad regading describing the clock trees, so not much
validation has been done by me). The old vendor kernel tree had it
like this, but that also changed a bit over time afterwards and no
longer has any special handling for VP2. OTOH it does set
CLK_SET_RATE_NO_REPARENT for all dclk_vop<number>_src, which you
are now removing for VP2.

FWIW these are the two flags:

#define CLK_SET_RATE_PARENT     BIT(2) /* propagate rate change up one leve=
l */
#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */

So by removing CLK_SET_RATE_NO_REPARENT you are allowing dclk_vop2_src
to be switched to a different PLL when a different rate is being
requested. That change is completley unrelated to the bug you are
seeing right now?

> So in the end VP2 will have to deal with this, because when the VP
> causes a rate change in the GPLL, this changes so many clocks of
> other possibly running devices. Not only the uart, but also emmc
> and many more. And all those devices do not like if their clock gets
> changed under them I think.

It's certainly weird, that VP2 was (and still is in upstream) handled
special. Note that GPLL being changed is not really necessary.
dclk_vop2_src parent can be GPLL, CPLL, V0PLL or AUPLL. Effects on
other hardware IP very much depends on the parent setup. What I try
to understand is if there is also a bug in the rockchipdrm driver
and/or if removing CLK_SET_RATE_NO_REPARENT is a good idea. That's
why I hoped Andy could chime in and provide some background :)

Greetings,

-- Sebastian

--d64jzfl74qyxt42h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmj2XF0ACgkQ2O7X88g7
+poMyxAAkrvmSp4lAynpMvLbEurz1nIp5X6KpJxALZHkLQhTbIMdkzYvjh504H9x
f9m8anU4Vz0uzwNWNNWMeYKieOC8hcdj6SWEPkgfk0lWNwZfbu1lu1z4wesNh5Ey
6y796JBjOKUUfFxuH9Z7ejA0w0ZEFrsjjr8cjzCB1/ZC3XDyA+t309e4w/28k9mx
n+CobUeYsehMLyV2bT3ykWRaLkFwx9Wt1/+k4fPCL0hiEmZYcDRXZpjq6i1L1T3x
DmT5wY8Yxfa2IMypKI7y08EXJHqGqgoW1gNJUuCpom2sQXCnEyVAdoGlW1J9wHNy
+lY0ucMa/fMPMReP4FtVxDCavxziANOutp4ZSM1ubU71ZsnyN0BRbPt+l3Mw6wUf
J2PF91DmuWlYVyDSP2PCL8ziIp6ManlPZtdJ9ZbqwN8huG8nhCIYx0SRoeAxnKRT
Zd8f0nXzFH8oLxVT48R1pmhalavydtAHBq3+PAAMf0RhQ0eGOQ9S+0zwU9lvPnvR
nvduTJMnGvVYQBzvzyV4BgCJ8Gpt1bHGauhzraHOmOdFLQn9vFtTXw2hCcPU5/1I
PG3wapsmCaramEwbIC2TPnw2FGEf3QuTfvOBAb/QLL8r+mFTMdUdLJzRzgnNX/r2
lcvCOEN8REWVCxqvdaHUNlX0eX0yG/LBd6Dj9YslosfRI3/Mp8o=
=J09E
-----END PGP SIGNATURE-----

--d64jzfl74qyxt42h--

