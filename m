Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37769F8FA94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmvTqwfhLNaqLrREBI/zMcFBr9lbGTz9MNkHLNnngko=; b=d7DtzYcP9ANFNUg3RLe/3jvYXr
	ai9c2ZIq6kNFwE8omd3BovM80fAbvj6kyPzAH4d26rLjJQalJF2PTHjPnbrOuQippL+pMsng6uEiG
	Ej+vBOqId88sCv1Omwfuz+nRITOdLHo9xogIZgn7s6AW2CfPru1q7Oh5bsDYcyK7isL+Nk+0UXUh6
	N9Q8h8lrx/T+QUA8acPjeWWWWmGKYXgXLyS0JEezal/Nc5feYQHxTFFruacWnmPX8FqKDg5A+OGBX
	bkcuMnQUNM4tDlni5rY4CXykYksGQOXLrNLVDbuWUKnAyhMiFqZq1p3zcqff2gKL7d9zTTPkQdgGe
	Ku84kGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDgB-00000008tQM-15O0;
	Tue, 21 Apr 2026 16:10:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDg9-00000008tPt-268Z;
	Tue, 21 Apr 2026 16:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 979734035B;
	Tue, 21 Apr 2026 16:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD88C2BCB0;
	Tue, 21 Apr 2026 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776787824;
	bh=HKDAuR6VKMBI5hFge6Fz+4gVNv9QS/R3uQXYS+OYaB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NO9YBoWUrThw41H0jixZKjYFMGpdq0LvsSKtUL/bAd8mptRTY0KlLZGQFAIjmEA9i
	 /9gm6jPf++KrxS/53s77SMKaVm4Mji39umPXXtJCMHCzyjXv5TAlpjjAukpdOiWlJ0
	 Ut3TVQGMYKL9A/iooRixKjzmu9JWPB3R4eG8L7KLSY8CoET2P2SXFbBtEuiDvllaXK
	 JymuOsmqfbJLOW0VFN2CUvD0uL04cWkszbMZEx0xJS7DTSt0LT+jw+JhehVm1WQ6iI
	 tmB+JsLZNE4V6UVBjWpnkMQoocz+T2zPm+e/13IxU6sYMEWV460AhL3u5tUkpfnrKO
	 Ztj+3S2uIRy9w==
Date: Tue, 21 Apr 2026 18:10:21 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Alexey Charkov <alchark@flipper.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Pavel Zhovner <pavel@flipper.net>, 
	Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
Message-ID: <20260421-quirky-tough-robin-817a1c@houat>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
 <aeKtNf8CCAWduI-f@venus>
 <aeZOMnZfBcBHzR8c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ztvsum3prbyokpn3"
Content-Disposition: inline
In-Reply-To: <aeZOMnZfBcBHzR8c@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_091025_615035_FA0E983C 
X-CRM114-Status: GOOD (  42.59  )
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


--ztvsum3prbyokpn3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
MIME-Version: 1.0

Hi Brian, Alexey,

On Mon, Apr 20, 2026 at 12:02:58PM -0400, Brian Masney wrote:
> On Sat, Apr 18, 2026 at 12:24:57AM +0200, Sebastian Reichel wrote:
> > On Fri, Apr 17, 2026 at 07:11:43PM +0400, Alexey Charkov wrote:
> > > Dear all,
> > >=20
> > > Need the help of the collective wisdom of the community.
> > >=20
> > > The problem I'm trying to solve is reliably obtaining the exact pixel
> > > clock for arbitrary display modes supported by the RK3576 SoC.
> > >=20
> > > Rockchip RK3576 has three display output processors VP0~VP2, each
> > > supporting different ranges of display modes, roughly as follows:
> > > - VP0: 4K 120Hz
> > > - VP1: 2.5k 60Hz
> > > - VP2: 1080p 60Hz

Do any of those have an additional multiplier or divider after the PLL?

I'm asking because 4k@120Hz is 1188MHz, and 1080p@60Hz is 148.5 (so 1188
/ 8). 2.5k @ 60 might be a bit more problematic, but my point is that
for HDMI/DP, most resolutions all have a pixel clock that are multiples
of 148.5MHz.

If you manage to get the PLL to the highest you need (1188MHz), and then
apply dividers, you don't need to change the PLL frequency anymore.

> > > Each one obviously needs a pixel clock. The required frequencies for =
the
> > > pixel clocks vary greatly depending on the display mode, and need to =
be
> > > matched within a tight tolerance, or else many displays will refuse to
> > > work. E.g. the preferred (maximum) display mode out of VP1 is particu=
larly
> > > awkward, because it requires a pixel clock of 248.88 MHz, which cannot
> > > be obtained using integer dividers from its default clock source (GPLL
> > > at 1188 MHz), and the nearest approximation is 237.6 MHz, which is we=
ll
> > > outside the tolerance of e.g. DP specification, resulting in a blank
> > > screen on most displays by default.
> > >=20
> > > The clock sources are of course configurable, in particular there are=
 muxes
> > > connected to each VP for selecting the source of the pixel clock:
> > > - Each VP can take the clock either from the (single!) HDMI PHY or fr=
om
> > >   its dedicated dclk_vpX_src mux
> > > - The dclk_vpX_src mux can select the clock from a number of system P=
LLs
> > >   (GPLL, CPLL, VPLL, BPLL, LPLL)
> > >=20
> > > While the system PLLs can be configured to output a wide range of
> > > frequencies, they are shared between many system components. E.g. on =
the
> > > current mainline kernel on one of my RK3576 boards I've got the follo=
wing:
> > > GPLL: 1188 MHz, enable count 20
> > > CPLL: 1000 MHz, enable count 17
> > > VPLL: 594 MHz, enable count 0 (yaay!)
> > > BPLL, LPLL: 816 MHz, enable count 0 (but these last ones don't have
> > >             predividers, so are less flexible)
> > >=20
> > > So ultimately there is exactly one free fractional PLL (VPLL) which c=
an be
> > > used to generate arbitrary pixel clocks, but we have up to three cons=
umers
> > > trying to drive different display modes from it (e.g. HDMI on VP0, DP=
 on
> > > VP1 and MIPI DSI on VP2). We also want to be able to adjust the PLL o=
utput
> > > frequency on the fly to satisfy the requirements of the selected disp=
lay
> > > mode.
> > >=20
> > > And this is where I'm stuck. Trying to satisfy the requirements of up=
 to
> > > three consumers while changing the PLL frequency on the fly sounds li=
ke
> > > a poorly tractable mathematical problem (is it 3-SAT?). We can take t=
he
> > > HDMI output out of the equation, because it can be driven from the HD=
MI
> > > PHY (which is capable of arbitrary rates) instead of the mux, but that
> > > makes the decision of which dclk source to use for a VP block depende=
nt on
> > > which downstream consumer is connected to it (HDMI vs. something else=
).
> >=20
> > It becomes more messy: The HDMI PHY cannot be used as clock source
> > for modes exceeding 4K@60Hz.
> >=20
> > > Even then we somehow need two devices to cooperate in picking a PLL
> > > frequency that satisfies the requirements of both of them, and change=
 to it
> > > without display corruption. I'm not even sure if the CCF has mechanis=
ms
> > > for that?..

It's not *just* the CCF though. You will disrupt the other, already
active display, which might affect the user because the screen will
blank, throw off the vblank timings and thus userspace, etc.

Brian's solution is great progress on that front already, but if you can
just save yourself the trouble, I'd advise you to do that instead :)

Maxime

--ztvsum3prbyokpn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaeehZgAKCRAnX84Zoj2+
drVDAYCpi1fbbCrj7/fukwguBw+orWqj+TZdDDch1wnLZurGU7hawtgbd28GdIza
YvEwTVEBgODCe1okmRECm4S0EQxaLei/ii/Opfn1eD7wHOutqGPIMgwTjOaw918u
mSbC0Y2DbA==
=HbxP
-----END PGP SIGNATURE-----

--ztvsum3prbyokpn3--

