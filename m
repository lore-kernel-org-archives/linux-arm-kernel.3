Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F4FF94CDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 08:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHhSfVuYhrjw/BhaVzSyk6LT5DFSKZyqA2uUtt4y784=; b=rSWsaG0wCAKWdyiGA1kgOcGE4g
	wUVjd4lak9n2AMIY8TcGbs1Ll9uaaKn6C91UaB85mJoD+23gFlhiDUFazTzMir5Za0cKKY1gqPC+I
	xqH3Gif51rzpiJaoWgbsgrabfpvEd+inIGOGxczIfkuwDzFanJBpzz+/Eu27UZZpOqgkWqoo9P/ob
	b5Uo2b0gh/Gxzdv1XE5daGHpCCOGPjBqGnG2gTAh/5hMcwxN5rYKwcoKjP+VHGRSTKmTO0jmxoX8a
	QFOM+FwqEhg+CJZh823YDuqLsVxasUpTkPhAKNxnmGLcTtfR08qTTRAL1miyD3Qiv3YE4uLdyLiMN
	XkxLDI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFSgJ-00000009lIu-3ZPk;
	Wed, 22 Apr 2026 08:11:35 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFSgG-00000009lI7-3eQQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 08:11:34 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b9c9d03524cso712795166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 01:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776845490; cv=none;
        d=google.com; s=arc-20240605;
        b=RGkV79hplI557zra2yYnJWkRDU1AQ1b2DL+x6cEMlvUtc0U2Z6R/Tt+2RAC3yXF20I
         YOb8VaPIBJy1m/wJE7uyXXvieNgqFH0iKC2RglzWAhp0+RT23e/0Wr7i4OLtXglwhETK
         VhsjNMeetp6K7c1xaLbURkN4cFnckPArk8Gt+S9Jx6t8Gr6H0z4Q5K+uE9SXM7kQkH83
         u6ClqHOXMZitZf2qpk89hWWNmoK8zDzxLgi17SmvMRkY2wmgmXzzhzbvLJVH1ryxJmEB
         OWzsMvDNV9sMBJEHAuZDGyuRpfDxgYEt/sDWftEryw9M/ODcbik1ir8atkk+pqBQQ1gd
         b2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kHhSfVuYhrjw/BhaVzSyk6LT5DFSKZyqA2uUtt4y784=;
        fh=wIiyjZcCot4Tai4AQAvWLWDk93liPRDmj87PhlEFtCE=;
        b=BTLvKCFpaiAojnRXuxb6pFBoZB639ftmdxaR63kTzEk4lZFoDXQOWFXEDQ24cqKswR
         Kf9OETEBxTD45Ei0e3E0Gm5U5klMslSGkxK31Wq3VtI9aOP+68W2xE3mOiR5unXDGf5g
         ud91VoKGvYO0WOV/mq9p5cc7tmibXt3Ad40K/gFkJ5ZylSicWOG4u/sYXKjwoDAnLVCq
         hAPACwYn6+V7YsAIhZJIrQ+qS8n8gQ6stze52nNanvm3OYVIVEXgPBotCOmNa9+slWBu
         u/iY8+tyJ7fxqBVQpqM/VWds1W/GygXCVnx8LpWc6odWpbBAFDXTiw+/Tttg2Rbfxds/
         2Mpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776845490; x=1777450290; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHhSfVuYhrjw/BhaVzSyk6LT5DFSKZyqA2uUtt4y784=;
        b=rYeSPBp8+fNWniGUwwinNs42yJe67woRY3aN01wa456hWWOXBcSgI/TmK11WJ67QJL
         ETsxQpFCLtMGhEeIXNTtu/YBaoMxKDsGu4iEKE45VJV0slE6hDElLloZWneMrf92qulO
         NQa83mmldUSKSzpETvoDsTjtTJtaG969NyzJdld/RM7JdLHcGucXBSaQ0s5XX2PCEjUV
         JbkAE+sfTuXLZaoEzBNtFzzpWyd7E8+eykaXTZ4Fmpo2OdxRaESlsAWHjoXTQzyGqToT
         YSCGsCMtDbAmN6/FJx6CNVB3sGj+NXEsRhKXO/KAXFNibZgeL4+FpRbxYMtwWdfIZJph
         0VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845490; x=1777450290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kHhSfVuYhrjw/BhaVzSyk6LT5DFSKZyqA2uUtt4y784=;
        b=Z2GRrRZFMFNhkNWAqwTx9JRUAP0XuxzltbEH6I8INImWXybSIlmtax2hHl6dEI7ATK
         KqcEIZtaCPirLRZNE99NTLfV+/axXLDUBdtDMKx+f9mZV51SMVo3ArDOVx4nyHdjEqSy
         aB+krgDbuJLg49nII+1xor06aoANewrtNLQSluif1iEDu2BEhZUP1+aShlJEtq3ciRQ+
         pX9JbNod9EcvfMw8QxakujSrW5aQrueIy9mxuAXZY6Swpv6O3bnPNZZpR4fv9bJtk4yI
         gj8mVJbLzlXIKqscj6YbuJEgXqKQdHQFrv4idCDTwW5A55LHDQjnsuyZPe3utDk3KzQ/
         AReQ==
X-Forwarded-Encrypted: i=1; AFNElJ+p1dge0FCcmxSV9/ZkOwFYU+crN53lIVY4ub9td3HwiFecoX+Hd2G79gllH/Tk37mqjzBVy+BEnCHB0ztwbvaj@lists.infradead.org
X-Gm-Message-State: AOJu0YycNr4GkROnY20IdufaGPz5gjZjudz7KxwFfJbf4kclb+mi2c8S
	PSk8Sq1HjOkYYaDaaiqr7ESLlynm3iYyFoDRbOIKRiJzQnZjKVLGBY7tAVpzPcrYPhzIolVKFnm
	UD0vHGstLhL4T+DG3xYuWUztH7hxUc21y5LWCEwYlIA==
X-Gm-Gg: AeBDieutxOdsB9MtEiwrNPachZ45zvvtfMPnPeOYDpF1tix/omkF5sg234iwfhhMvnk
	I7+OrbOGzjSA+THcfedKEEuqsWdRWDPjK5G6mN7gmfsHzaSyXj2ADwXqBfApd2G6rA2VjeIHz8m
	WMT5kBBdewgweXj8LNmJFvgU8qO7gfBTGDqkXwa+RTVrLbJ+YVdfrfzCyVpWcyl/M688TaUxYFA
	EMw+01h8+p3Eg0+rYes4Rz2zvnq8r30ZP4+3iie4yOkZoesIQeAemQSqhKQ7OpTiadx0CQl49qL
	akk2yGsPUajyYoLuZQ==
X-Received: by 2002:a17:907:cc01:b0:ba2:5226:95f8 with SMTP id
 a640c23a62f3a-ba41aa1611fmr746041966b.23.1776845490067; Wed, 22 Apr 2026
 01:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
 <aeKtNf8CCAWduI-f@venus> <aeZOMnZfBcBHzR8c@redhat.com> <20260421-quirky-tough-robin-817a1c@houat>
In-Reply-To: <20260421-quirky-tough-robin-817a1c@houat>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 22 Apr 2026 12:11:21 +0400
X-Gm-Features: AQROBzBMDLMpArAbO6yUVTJdEOlFOlX7S11D2R-MG4mKqqwVH-2tRc5cksKPqqI
Message-ID: <CAKTNdwHcN8w1_12Zd-2Xp90GEDLvwd8Q6XxTdS12QBbCZuUk5Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
To: Maxime Ripard <mripard@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Pavel Zhovner <pavel@flipper.net>, Andy Yan <andy.yan@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_011132_972271_E6022AF5 
X-CRM114-Status: GOOD (  57.20  )
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

Hi Sebastian, Brian, Maxime,

Thanks a lot for your inputs!

On Tue, Apr 21, 2026 at 8:10=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi Brian, Alexey,
>
> On Mon, Apr 20, 2026 at 12:02:58PM -0400, Brian Masney wrote:
> > On Sat, Apr 18, 2026 at 12:24:57AM +0200, Sebastian Reichel wrote:
> > > On Fri, Apr 17, 2026 at 07:11:43PM +0400, Alexey Charkov wrote:
> > > > Dear all,
> > > >
> > > > Need the help of the collective wisdom of the community.
> > > >
> > > > The problem I'm trying to solve is reliably obtaining the exact pix=
el
> > > > clock for arbitrary display modes supported by the RK3576 SoC.
> > > >
> > > > Rockchip RK3576 has three display output processors VP0~VP2, each
> > > > supporting different ranges of display modes, roughly as follows:
> > > > - VP0: 4K 120Hz
> > > > - VP1: 2.5k 60Hz
> > > > - VP2: 1080p 60Hz
>
> Do any of those have an additional multiplier or divider after the PLL?
>
> I'm asking because 4k@120Hz is 1188MHz, and 1080p@60Hz is 148.5 (so 1188
> / 8). 2.5k @ 60 might be a bit more problematic, but my point is that
> for HDMI/DP, most resolutions all have a pixel clock that are multiples
> of 148.5MHz.
>
> If you manage to get the PLL to the highest you need (1188MHz), and then
> apply dividers, you don't need to change the PLL frequency anymore.

Yes, each of them has an (integer-only) divider between the PLL and
the respective mux. The problem though is that displays' EDIDs want
modes that are all over the place and don't seem to converge to any
common numbers generally (it looks like display manufacturers haven't
heard of VESA modes these days).

Following Heiko's nudge from the other sub-thread (thanks for the
pointers Heiko!), I derived the fractional PLL parameters for the
modes which couldn't be obtained cleanly from existing PLL values. It
ended up being 35(!) different rates for just the 7 displays my
colleagues and I could get our hands on, majority of which only
representable with the fractional delta-sigma component. That's after
consolidating the clocks which can be driven from the same
higher-frequency PLL configuration with small integer dividers. Seeing
all of that I couldn't help but think, "Surely those should be
possible to consolidate further by allowing for some error margin!" -
but had to guess again. Even a deviation as small as 0.2% of the
effective clock from the requested rate causes blank screens in my
sample - sometimes less than that.

This further leads me to believe that Brian's rate negotiation series
won't save me here, as the chances of two different displays at two
different weird modes magically agreeing on a PLL rate that is a
common multiple of their respective pixel clocks seem infinitesimal.
And their modes will most likely differ, as VP outputs are asymmetric.
Unless of course everything is 1920x1080@60 with a standard 148.5 MHz
pixel clock or its integer multiple - then the problem doesn't exist,
as this particular mode works even in the current configuration on all
VPs.

> > > > Each one obviously needs a pixel clock. The required frequencies fo=
r the
> > > > pixel clocks vary greatly depending on the display mode, and need t=
o be
> > > > matched within a tight tolerance, or else many displays will refuse=
 to
> > > > work. E.g. the preferred (maximum) display mode out of VP1 is parti=
cularly
> > > > awkward, because it requires a pixel clock of 248.88 MHz, which can=
not
> > > > be obtained using integer dividers from its default clock source (G=
PLL
> > > > at 1188 MHz), and the nearest approximation is 237.6 MHz, which is =
well
> > > > outside the tolerance of e.g. DP specification, resulting in a blan=
k
> > > > screen on most displays by default.
> > > >
> > > > The clock sources are of course configurable, in particular there a=
re muxes
> > > > connected to each VP for selecting the source of the pixel clock:
> > > > - Each VP can take the clock either from the (single!) HDMI PHY or =
from
> > > >   its dedicated dclk_vpX_src mux
> > > > - The dclk_vpX_src mux can select the clock from a number of system=
 PLLs
> > > >   (GPLL, CPLL, VPLL, BPLL, LPLL)
> > > >
> > > > While the system PLLs can be configured to output a wide range of
> > > > frequencies, they are shared between many system components. E.g. o=
n the
> > > > current mainline kernel on one of my RK3576 boards I've got the fol=
lowing:
> > > > GPLL: 1188 MHz, enable count 20
> > > > CPLL: 1000 MHz, enable count 17
> > > > VPLL: 594 MHz, enable count 0 (yaay!)
> > > > BPLL, LPLL: 816 MHz, enable count 0 (but these last ones don't have
> > > >             predividers, so are less flexible)
> > > >
> > > > So ultimately there is exactly one free fractional PLL (VPLL) which=
 can be
> > > > used to generate arbitrary pixel clocks, but we have up to three co=
nsumers
> > > > trying to drive different display modes from it (e.g. HDMI on VP0, =
DP on
> > > > VP1 and MIPI DSI on VP2). We also want to be able to adjust the PLL=
 output
> > > > frequency on the fly to satisfy the requirements of the selected di=
splay
> > > > mode.
> > > >
> > > > And this is where I'm stuck. Trying to satisfy the requirements of =
up to
> > > > three consumers while changing the PLL frequency on the fly sounds =
like
> > > > a poorly tractable mathematical problem (is it 3-SAT?). We can take=
 the
> > > > HDMI output out of the equation, because it can be driven from the =
HDMI
> > > > PHY (which is capable of arbitrary rates) instead of the mux, but t=
hat
> > > > makes the decision of which dclk source to use for a VP block depen=
dent on
> > > > which downstream consumer is connected to it (HDMI vs. something el=
se).
> > >
> > > It becomes more messy: The HDMI PHY cannot be used as clock source
> > > for modes exceeding 4K@60Hz.

Thanks for the pointer! I've checked, and indeed it automatically
switches to the PHY clock for anything below 600 MHz.

This is in fact a notable improvement, because then only a handful of
higher-rate modes out of my modest sample need a dedicated PLL for the
VP0+HDMI setup: specifically, 3840x2160@160 (1478740 kHz),
3840x2160@144 (1275830 kHz), 3840x2160@119.88 (1186813 kHz - this one
might work with 1188000 if CCF allows returning higher-than-requested
effective rates) and 2560x1440@165.08 (645000 kHz).

3840x2160@120 can be driven from the current GPLL, as it's exactly 1188 MHz=
.

The configuration / policy to enable that transparently for the user
seems non-trivial though:
- If the output is HDMI and the display clock is <=3D600 MHz, always
source it from HDMI PHY (easy)
- Otherwise, if the display clock is 1188 MHz or its integer quotient,
always source it from GPLL, and disallow parent rate changes
- Otherwise, reparent to any active PLL whose current rate is an
integer multiple of the required display clock, and disallow parent
rate changes
- Otherwise, see if VPLL is free. If it is, reparent to it and request
its rate change to the required display clock (or its integer
multiple)
- Otherwise, tell the user the mode set failed (and let them retry
with a different mode, or own the pieces)

I'd love to learn if the above (or anything close) is representable in
the kernel, although I suspect it's not:
- Allowing or disallowing parent rate changes depends on the selected
parent here, while in the current clock implementation it's an
attribute of the child
- All PLLs are equal, but one (VPLL) is more equal than the others by
the virtue of being free more often, and also having the required
delta-sigma component
- Reparenting to an already running PLL if its rate permits should be
preferred to monopolizing the VPLL

> > > > Even then we somehow need two devices to cooperate in picking a PLL
> > > > frequency that satisfies the requirements of both of them, and chan=
ge to it
> > > > without display corruption. I'm not even sure if the CCF has mechan=
isms
> > > > for that?..
>
> It's not *just* the CCF though. You will disrupt the other, already
> active display, which might affect the user because the screen will
> blank, throw off the vblank timings and thus userspace, etc.

Indeed. Changing the rate of a PLL while it's in use sounds scary,
even if a solution for the rate exists and can be found in reasonable
time.

> Brian's solution is great progress on that front already, but if you can
> just save yourself the trouble, I'd advise you to do that instead :)

I'd love to, but it seems that displays won't let me :-D

It might be helpful to pre-filter the allowed display modes to only
offer those which can be derived from the currently available PLL
frequencies. The problem is that it makes an extremely limited subset
on real-world displays.

Best regards,
Alexey

