Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBD5C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CQrISOl0BCVcY0P30M6vyCI4+NKDoGPEn3wN8pRNP8=; b=D6LR5URPQmrPWxxTk3zsDUyEMk
	vMCveOgdw9YZY1UzEWumW+k3obUPEt/PiSh/TqaliJQ+SCICQP8H2s2eGIntsbGd57lHX1DemILfo
	upPcFT2VanXOCUs+iMg5VzjvlOhg9wWuplZ6B1q5it6bioRjiJfKGFg4APGbo00nE2ASH1Dhh+a9p
	6HQfpEWO9dtAkgFrX0U/cUw9pkawn6ER5nj6zrQeuRYTqZhTfkHJCgjp/HlBMwf3T77Q9+JzkBbFu
	IDArl2SVwNAySugE20NFSnkX9m9hbYrfAcFhddrohI0Ou5+EL6p2NyyzWKdNphB18+C4TXMOuQdKg
	l8ZT7N3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkNH-00000006KWm-0NeW;
	Mon, 20 Jul 2026 09:33:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkND-00000006KVB-1q13
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:33:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06AC04E40E79;
	Mon, 20 Jul 2026 09:33:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C46B060360;
	Mon, 20 Jul 2026 09:33:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC54A11BD3CCE;
	Mon, 20 Jul 2026 11:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784539992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4CQrISOl0BCVcY0P30M6vyCI4+NKDoGPEn3wN8pRNP8=;
	b=lqgTOb7hGCPz4Bhuasua5vOcMC3VV8568buK9tnmi9N04rblfX1BC83fjsC2wruPtlCOTJ
	OFsQKlwuR6/+LzFaEqf9hgGVWTJyiEVn7vcK0GNxUOb80IQvo8dlKHZlzZrZcPcWdreXoW
	ugqvko4Eq09Xwz8U5ibOUx58cE71sdrye8OFMeAZISkMb/6Kvp6WGhEh8CbaTZEGgbd5HR
	3f8W31rYeVcPvtf+ULh22yd0wS9mbiqgtKNwB8VwsXssU02wy06hBCdZOrnp0QjsoCMiek
	EcvypwsBMERZx9HNElvb1p+941OtF65re8Qcg2/xLDhzkC5IkX7XPQ33UwuUZA==
Message-ID: <5cc0d788-c78d-40f2-998f-235d40f567f2@bootlin.com>
Date: Mon, 20 Jul 2026 11:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: dwmac4: mask interrupts before stopping DMA
 in suspend
To: Luis Lang <luis.la@mail.de>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <7941d239-e5f5-43b5-ae0f-20398221e027@mail.de>
 <20260718152802.83553-1-luis.la@mail.de>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260718152802.83553-1-luis.la@mail.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_023319_645780_1F5D2F9F 
X-CRM114-Status: GOOD (  10.65  )
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

Hi Luis,

On 7/18/26 17:27, Luis Lang wrote:
> Since commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU
> interrupts"), suspending causes an interrupt storm from the RPS
> interrupt.
> Fix this by adding a deinit_chan() op to stmmac_dma_ops, which
> masks all default dma channel interrupts. This is called from
> stmmac_stop_all_dma(), so interrupts don't trigger while suspending.
> 
> Fixes: 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Luis Lang <luis.la@mail.de>

This is almost perfect for a new submission, only 2 things to improve :

 - you're missing the tree name in the patch subject. As this is a fix, it should be :

   [PATCH net] net: stmmac: dwmac4: mask interrupts before stopping DMA in suspend

   you can find instructions for this in the doc Andrew linked :

   https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

 - When submitting a patch, do so in a dedicated thread, and not in reply to
   other threads.

You should send a V2 addressing the tree name in the patch subject.

Sashiko noted something on the patch :

  https://sashiko.dev/#/patchset/20260718152802.83553-1-luis.la%40mail.de

It looks to me that sashiko is just wrong there though, I can't make sense
of what it is saying.

Maxime

