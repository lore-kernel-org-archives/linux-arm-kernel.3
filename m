Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F013F99C6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 22:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHtVHx2nhBSquGSPYryXKtY4F20htfrr0aJ1VzWLVGE=; b=SRuq1ghHik3nWKl+AZlxX+2kUa
	DiW2bJc5l/KvgwrlDrzkMUMCGBBI+YAXuZ+qPpk/0NRUDy2rP8dtUUKeCfVLJm9NbmtVwY1NYpYHX
	iBcIC49cRAaBiXbmCrRvXLDeYX7Bu1m9uXWC96JHbpjtkx81Beh8/SfZcALHWQXukRuSuz0/m2wai
	OqtX7/8Nz+h6bJlCBfcNiqS8gKIqKQaHI8jB1sfBn49heciHyUIs5g/JpkQlMHSBvKAC0Sl9kAWVc
	dcBPGSZYMIZeTBSrHUOkRYqgdPgYJfhjjLMPUmRME6NlkMWuKlhhNBiZRxJxu2cB7DnAJlPCIyw4g
	RXvXWwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDsAD-00000004XnT-3MEq;
	Fri, 17 Apr 2026 22:59:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDsAB-00000004Xn3-1xHj;
	Fri, 17 Apr 2026 22:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GHtVHx2nhBSquGSPYryXKtY4F20htfrr0aJ1VzWLVGE=; b=1d4HoLrRxJTUT549vCErRSXE70
	0tfVdMU83O5FAnRlau6P8+hP7nQ3Knk6e87RPoVtssg0Un1B3CiDi66pWPsnCY+Mr7DdQ4/rRw+hm
	VSTXWGL+G8J9BBN5jllkygiIzB++sl/LItzoLrRoJ4LkiT0jh96TDceoME1ZKseMxraK6eRl1fbDt
	4uBpjV07uxv5I5PGP8fggQII+EXNs58iIA1TF/Byrw2786NDjng+bQBBsdFQLXwO5qFNWVpsnCvPt
	xrpTaFrCnGV+Ee9MK4NEngorGHIW66HU+PDk21STzHn40EReIP0Odvn9hoGTO434b6PsFjZLMp2Mp
	RfLZXSsQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Alexey Charkov <alchark@flipper.net>
Cc: Pavel Zhovner <pavel@flipper.net>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alexey Charkov <alchark@flipper.net>
Subject: Re: [PATCH RFC 2/4] clk: rockchip: pll: use round-nearest in determine_rate
Date: Sat, 18 Apr 2026 00:59:40 +0200
Message-ID: <39479281.XM6RcZxFsP@phil>
In-Reply-To: <20260417-rk3576-dclk-v1-2-26a9d0dcb2de@flipper.net>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
 <20260417-rk3576-dclk-v1-2-26a9d0dcb2de@flipper.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_155951_660005_D6EB8776 
X-CRM114-Status: GOOD (  12.97  )
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

Hi Alexey,

Am Freitag, 17. April 2026, 17:11:45 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Alexey Charkov:
> rockchip_pll_determine_rate() walks the rate table in descending order
> and picks the first entry <=3D the requested rate. This floor-rounding
> interacts poorly with consumers that use CLK_SET_RATE_PARENT: a divider
> iterating candidates asks the PLL for rate*div, and a tiny undershoot
> causes the PLL to snap to a much lower entry.
>=20
> For example, requesting 1991.04 MHz (248.88 MHz * 8) causes the PLL to
> return 1968 MHz instead of 1992 MHz =E2=80=94 a 24 MHz table gap that pro=
duces
> a 1.2% pixel clock error when divided back down.
>=20
> Change to round-to-nearest: for each table entry compute the absolute
> distance from the request, and pick the entry with the smallest delta.
> The CCF's divider and composite logic handle over/undershoot preferences
> via their own ROUND_CLOSEST flags.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

as Sebastian said, this could cause overclocking in a number of areas.
The rate you get should always be lower or equal to the requested rate.

Additionally, such a core behaviour change, would affect 13 years of
SoCs with unknown side-effects.

If you're missing specific clock rates, you can always add them to the
list :-) . The vendor-kernel does have code that can calculate the
rate params itself, so this could give you a hint where to start.

=3D=3D=3D=3D=3D=3D=3D just to explain =3D=3D=3D=3D=3D=3D=3D

Though I still don't think that code should be in the mainline-kernel,
as a curated PLL rates allows more control, where that algorithm
creates parameters that are programmatically correct, but essentially
untested.

On the two Chromebook projects, they actually measured things like
clock jitter, which got us more specific params for some rates.


Heiko




