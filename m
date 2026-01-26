Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A498CC88E6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXaEAcCkiPb4MDjwGnEFROsVx88PiTYnyWcEst6Ub6s=; b=E4m5KJQHm+FT3c/GCweGsYGI4T
	oDFwcnRUNNeBUHbVT+xYmLFCTQxg+EOlHRvWtVqxgeu5nlxBmfW5zqDsmNmpdUkBOHLEfjqc4IV2K
	I0itV6NOv26b/k5j5icZC21BqkUk+y7cFu6rlAXUHSUoxkL2CJQCCyBsyBp7ooSoqQ1Jh4ITYn6Nm
	iOjTKbA1Ad5ViLcs8uFU7EejT1cgPUFuuNuL5LaY+aiamR+i9JTKabjpwPa6zBqpdtWauMlUH8mDT
	31EjtE2lk4W03qrHkmBSDLKOcgf3aJNi44qnmmMaVCL8zYpet77GraKQ5LpxOm+Qz5nH1wYCOZGSS
	RY+m18Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHbH-0000000C4pC-16qq;
	Mon, 26 Jan 2026 08:05:31 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHbE-0000000C4oJ-1rn8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:05:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0C8110F2A1;
	Mon, 26 Jan 2026 09:05:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769414718;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oXaEAcCkiPb4MDjwGnEFROsVx88PiTYnyWcEst6Ub6s=;
	b=CnpvMD8IsO4oG+/L62lHKeeaE6t+PF3Ng8TrBowOn7q7NytPlfUp2u9rfTQLTY6oP/4BPM
	bNSqbQuUwSC8A11hh2MKOdLycoMN9W+DBgP4oqChXcS6Ey81nxBqKtRpiyfhjjtslijZ5/
	atgsrtx8/3XGlVm7NrkqZn11KiwaZrPhl52Pl+ntlEgRqt+/blJeuOzF5yq6YmFjQZggql
	azFLEoALWGjEXpXGOhL30AU3zmfifgN2dCbnDGl7jxZcRBYw9QSQnSBS+zOyzPO3XIVGme
	kqgV17a0EaQzOhTZOF0xywo3V2Pt7iQpnnTU0i0YTWou1xe2sP5BYX7T2uLsiA==
Date: Mon, 26 Jan 2026 09:05:12 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Abel Vesa
 <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <20260126090512.49b48ed0@wsk>
In-Reply-To: <PAXPR04MB8459D29C90848DB101F726DE8893A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260122130649.4150338-1-lukma@nabladev.com>
	<PAXPR04MB8459D29C90848DB101F726DE8893A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_000528_703310_216E3E3B 
X-CRM114-Status: GOOD (  20.78  )
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

Hi Peng,

> Hi Lukasz,
> 
> > Subject: [PATCH] clk: vf610: Add support for the Ethernet switch
> > clocks
> > 
> > The vf610 device has built in the MoreThanIP L2 switch. For proper
> > operation it is required to enable ESW and MAC table lookup clocks.
> > 
> > The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> > to provide clocks for each AIPS1-"slot", which size is 0x1000 (hence
> > four separate entries).
> > 
> > Those can be enabled via clock gating CCM_CCGR10 register
> > (0x4006_B068).
> > 
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> >  drivers/clk/imx/clk-vf610.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/clk/imx/clk-vf610.c
> > b/drivers/clk/imx/clk-vf610.c index 9e11f1c7c397..88c9b656f244
> > 100644 --- a/drivers/clk/imx/clk-vf610.c
> > +++ b/drivers/clk/imx/clk-vf610.c
> > @@ -309,6 +309,11 @@ static void __init vf610_clocks_init(struct
> > device_node *ccm_node)
> >         clk[VF610_CLK_ENET_TS] = imx_clk_gate("enet_ts",
> > "enet_ts_sel", CCM_CSCDR1, 23);
> >         clk[VF610_CLK_ENET0] = imx_clk_gate2("enet0", "ipg_bus",
> > CCM_CCGR9, CCM_CCGRx_CGn(0));
> >         clk[VF610_CLK_ENET1] = imx_clk_gate2("enet1", "ipg_bus",
> > CCM_CCGR9, CCM_CCGRx_CGn(1));
> > +       clk[VF610_CLK_ESW] = imx_clk_gate2("esw", "ipg_bus",
> > CCM_CCGR10, CCM_CCGRx_CGn(8));
> > +       clk[VF610_CLK_ESW_MAC_TAB0] = imx_clk_gate2("esw_tab0",
> > "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(12));
> > +       clk[VF610_CLK_ESW_MAC_TAB1] = imx_clk_gate2("esw_tab1",
> > "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(13));
> > +       clk[VF610_CLK_ESW_MAC_TAB2] = imx_clk_gate2("esw_tab2",
> > "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(14));
> > +       clk[VF610_CLK_ESW_MAC_TAB3] = imx_clk_gate2("esw_tab3",
> > + "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(15));  
> 
> Seems you post dt-binding in a separate patch. It is better to
> put in one patchset.

Ok. No problem - I will add them together :)

> 
> Regards
> Peng
> 
> > 
> >         clk[VF610_CLK_PIT] = imx_clk_gate2("pit", "ipg_bus",
> > CCM_CCGR1, CCM_CCGRx_CGn(7));
> > 
> > --
> > 2.39.5  
> 



-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

