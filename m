Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A471D6CFA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 19:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTPahbF3n4Y+k+onnDFwlQa1Xun5RdBFV/nFJ5gb74A=; b=ZhsIu2z1c12xON1JaJUdU8kV6I
	nWaRTioO/BwqK3+3Vo+PH3K5A0r0arUXWVdHyBG+Ru9pce8OmPVE3mQ9IwSxOpT42e8/noSVxug6R
	kbQVr9T/S7vrLg2MarYM1mdLEtA7YIw4rgODr8cTipCHL5CTIyCbW1JKecJG8idYs3a+A4TuI17IV
	Mi6QZEUFIXgy1TJQCaWE0xQPIWvqh3m7apk46wajF+KysxsJ/LIAtBzZX+c9/qUVfrORD0Fp5EoEx
	m0Yrh9lv8z8MlGtjxwBwLAmSMP8cb6VpOwmNvO1aWsa7ryvvjO8bfeyZQntWpcf47+B6+MCbKDpL2
	hjzyn47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizzl-00000007gGm-1vNV;
	Thu, 22 Jan 2026 19:05:29 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizzi-00000007gG6-3i5w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 19:05:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FF37108962;
	Thu, 22 Jan 2026 20:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769108724;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QTPahbF3n4Y+k+onnDFwlQa1Xun5RdBFV/nFJ5gb74A=;
	b=Pw7Hi2tzBlVT+5b50ixF9lBYzEztFHlPTGGXLuQ0S/yAljY4e1eazqu4LMEHr3kWIEULBO
	1oGF20gUuptDkDnV5uvDYajJNdwGzkXVWms1FAt+Tbz7xRKOFgyxQTI4YsWaN3wpMqRX1b
	GxVwllbWsyHJijWYHYYdwzVlWFRAGED9jtiLVCP1tLFsV7CrUt1syTz1HsXkOLkv30SN/X
	Uukb3kay6XdM+xU4WhYu3oMxzsV9S6BTr0oyyph7VVltvh5rmQnf+F4wbx4DTMWRUf5Nt4
	/xRFBGa6o/4q7OSLP4q8b94S6/WO0fYzj4MbesbrFQZyJtiTpvQTGK4i8pL1zg==
Date: Thu, 22 Jan 2026 20:05:14 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Turquette <mturquette@baylibre.com>, Abel Vesa
 <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <20260122200514.3cdb6fb6@wsk>
In-Reply-To: <4a593537-e848-4ed2-b6c9-fd2e6b165f73@lunn.ch>
References: <20260122130649.4150338-1-lukma@nabladev.com>
	<4a593537-e848-4ed2-b6c9-fd2e6b165f73@lunn.ch>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_110527_146676_EEA62B57 
X-CRM114-Status: GOOD (  16.55  )
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

Hi Andrew,

> On Thu, Jan 22, 2026 at 02:06:49PM +0100, Lukasz Majewski wrote:
> > The vf610 device has built in the MoreThanIP L2 switch. For proper
> > operation it is required to enable ESW and MAC table lookup
> > clocks.
> > 
> > The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> > to provide clocks for each AIPS1-"slot", which size is 0x1000
> > (hence four separate entries).
> > 
> > Those can be enabled via clock gating CCM_CCGR10 register
> > (0x4006_B068).  
> 
> Sorry, i lost track of the state of the switch driver.

New year, new MTIP L2 switch patches in preparation :-)

> Is there also a
> patch to add consumers of these clocks?

In short - this patch set is a preparatory one for vf610 SoC support of
the MTIP L2 switch.

Those changes describe more thoroughly the clock subsystem of this SoC.

> 
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>  
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew

-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

