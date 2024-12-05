Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AC6E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDTpwgkDlbRc1zIFut/KEqYGHdEqAg2rBPP//jqqsak=; b=VylhbpF5ObyJhvyhEbO8EHJWVz
	uaE5vbJo/GU2kmm7ok2BCulUFMa7W7+6637vfvsoeikIJt7GPqmE9LIUnPOYZ2h1wUhUlK9ItonVJ
	+KrE9eHgAi6Bus6uuEIQaDUQZE/pBGSckNQYrZFDU+gBBlpiEEGm6d7+3/q9CCbl74SVYXmJ6k7C3
	AD+nda/lP5WqcpmFByiT8osVkfdvOV0Di+0YOSkcNznt1uai4xzaZJdi+XTEHB/HhGjgdcbM1Gby5
	o9XPAg5teT851U4EhRM4iOSs3DMAiO5SOw0Q4DVMLBVyYxz+xmqerF3VMtVM54yhEziPd0ueB5FuE
	OUGgWsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJB56-0000000Fybp-2TBS;
	Thu, 05 Dec 2024 12:35:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAza-0000000FxXV-095E;
	Thu, 05 Dec 2024 12:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FDTpwgkDlbRc1zIFut/KEqYGHdEqAg2rBPP//jqqsak=; b=2rGECUB6il0LywPas6Kn3dUIhN
	NPlpm80YqXB+YXBd7D8OOzYK54IFSl4WsdFh3hpmP4jMzqHn3Beh/ld2frmibcVbI29x2GNe4Fw5L
	ggHGa0ciIkz3oBa954gOM/XEUFaXGUyAxlDcgsKd2xmYHn9wvEucak/oqGjI27IBDTjKP/XQFM4Js
	WtruVkYZq5VmVn/jHFOxX2Vk1lANiYz0QovoCeVk5IeZRWyhkKo2OAyRbG59oD+bj90ho63zwE+qh
	OPQgWTPkrmmrhZJeGecAbvh9TBgCtA0FUx/PFILTdrOzxY9DWDafE+XyXFK5MDoxXrJcCW8dsiaB7
	tfV/BC6Q==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tJAzU-00048V-2e; Thu, 05 Dec 2024 13:29:56 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Val Packett <val@packett.cool>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: add clock ID for CIF0/1 on RK3066
Date: Thu, 05 Dec 2024 13:29:55 +0100
Message-ID: <1944322.g5d078U9FE@diego>
In-Reply-To: <5kesytgbhfununu5li4ychaw4newkctx4wuhlshks2ertfkd2t@jauqcntehv2z>
References: <20241205055122.11613-1-val@packett.cool>
 <5kesytgbhfununu5li4ychaw4newkctx4wuhlshks2ertfkd2t@jauqcntehv2z>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_043002_088831_3D939DD2 
X-CRM114-Status: GOOD (  20.25  )
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

Hi Krzysztof,

Am Donnerstag, 5. Dezember 2024, 11:25:28 CET schrieb Krzysztof Kozlowski:
> On Thu, Dec 05, 2024 at 02:50:46AM -0300, Val Packett wrote:
> > RK3066 does have two "CIF" video capture interface blocks, add their
> > corresponding clock IDs so that they could be used.
> > 
> > Signed-off-by: Val Packett <val@packett.cool>
> > ---
> >  drivers/clk/rockchip/clk-rk3188.c             | 4 ++--
> >  include/dt-bindings/clock/rk3188-cru-common.h | 2 ++
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.

I guess you're taking a shot of the indentation?

Though that is an intentional deviation, for the long lists of
clock-declarations, that is more a spreadsheet than actual code.

To give this some context, an excerpt from the rk3188 clock driver:

        COMPOSITE(0, "aclk_lcdc1_pre", mux_pll_src_cpll_gpll_p, 0,
                        RK2928_CLKSEL_CON(31), 15, 1, MFLAGS, 8, 5, DFLAGS,
                        RK2928_CLKGATE_CON(1), 4, GFLAGS),
        GATE(ACLK_PERI, "aclk_peri", "aclk_peri_pre", 0,
                        RK2928_CLKGATE_CON(2), 1, GFLAGS),
        COMPOSITE_NOMUX(HCLK_PERI, "hclk_peri", "aclk_peri_pre", 0,
                        RK2928_CLKSEL_CON(10), 8, 2, DFLAGS | CLK_DIVIDER_POWER_OF_TWO,
                        RK2928_CLKGATE_CON(2), 2, GFLAGS),
        MUX(0, "cif_src", mux_pll_src_cpll_gpll_p, 0,
                        RK2928_CLKSEL_CON(29), 0, 1, MFLAGS),

Rockchip clocks most of the time consist of a mux+divider in one register
and a gate-bit in another. Most clocks are of the COMPOSITE-type above.
Surprisingly this is true since before 2013 - and even today :-) .

So the notation is
      TYPE(id, name, parent-name(s), main-clk-flags,
	MUXDIV-reg, muxoffset, muxwidth, muxflags, divoffset, divwidth, divflags,
	GATE-reg, gatebit, gateflags)

Having all these elements keep their relative position makes it way easier
on the eyes, compared to if they followed that opening parenthesis of each
individual line or maybe reflowing of the elements.

The only real change the clock definitions will see are fixes to wrong
register numbers or wrong bits (or missing clock-ids), so being able to
see check those easily is just nice to have.


Heiko



