Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEAAC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 11:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRAr7yzdmwp7OEQvvfQlXLYyZUtkqTw/BHpfvMWUXGE=; b=EsXEExdzMnQgipYkiuKtn2cMhk
	Gp6wrZtnSLYKGfy9siRvEsXpbFPa2xPS2mv1xRXlL8mSztd8IL8pFL4xgE4DENTMtbpwFpo3TmLF+
	/tEXvjKWCPFEzUAC8ucGoBJsY86gnw2ofR3G8oB2rDrCehwN1NyI0hEVqNH3MNsma3lHSC+8x+z+V
	KV2KisGmUbEfLCdldFACK0tdbvlYboDC2tl+Vh37LTYHAUz5fOLbwfQqNxIpLoBueOOC+Lx7Z5FXl
	AOkrkjLYrh5UhnO4mPF8d1gCIVjPINPgSOBniKmr4+F3UXhqcFes2fmIyk9za1cI3faRjnNxf9bH5
	7+DF6RJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlm6n-00000006b9u-0fC2;
	Mon, 20 Jul 2026 11:24:29 +0000
Received: from shout01.mail.de ([2001:868:100:600::216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlm6k-00000006b9P-0dcp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 11:24:28 +0000
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
	by shout01.mail.de (Postfix) with ESMTP id 203C02407D7;
	Mon, 20 Jul 2026 13:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
	s=mailde202009; t=1784546664;
	bh=7W8Be4Q+aMUMH8sP5FmymS0/HjtVRdtikJu+5xOVoqs=;
	h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
	b=qBQyp9dOT81x/mh7BONt6JyJMtF3kl/BzkEoN+sUFYIUN06rCN0mHwcKSy4mNb/sy
	 xbqpSZfr1SvSFD7RKjdQXnMzCn6VsXy1qRe1i6H07t/SZ5iVTCqlPYH9GvEYUFCgI/
	 110tolbNIfLQV0tOluTUNb44z1KlTTRGNPtJnRPAY7z4dJJkvxWzgcdd2jHLB6xusn
	 LG148hRs6X8vFVvOW8uUphYXQjYFH/VHXk+ZU8Byu6GK65dZbPGN8lXamfeSUOXUgX
	 p4RTWHsenuahnT8Td/cyKDaaWOMxORjIZMht/fZNlaCXhQWPdfr+0onxThkSq7UGbG
	 XyLH4DchkSUpA==
Received: from smtp01.mail.de (smtp03.bt.mail.de [10.0.121.213])
	by postfix01.mail.de (Postfix) with ESMTP id ED54F2400B7;
	Mon, 20 Jul 2026 13:24:23 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp01.mail.de (Postfix) with ESMTPSA id C49C6240A4A;
	Mon, 20 Jul 2026 13:24:22 +0200 (CEST)
Message-ID: <f141897b-6570-4a80-95bf-a8efd9d25785@mail.de>
Date: Mon, 20 Jul 2026 13:24:21 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: dwmac4: mask interrupts before stopping DMA
 in suspend
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org
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
 <5cc0d788-c78d-40f2-998f-235d40f567f2@bootlin.com>
Content-Language: en-US
From: "luis.la@mail.de" <luis.la@mail.de>
In-Reply-To: <5cc0d788-c78d-40f2-998f-235d40f567f2@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1194
X-purgate-ID: 154282::1784546663-A86FBC36-B0B68247/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_042426_334878_3C6388CA 
X-CRM114-Status: GOOD (  15.99  )
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

Hi Maxime,
> This is almost perfect for a new submission, only 2 things to improve :
> 
>  - you're missing the tree name in the patch subject. As this is a fix, it should be :
> 
>    [PATCH net] net: stmmac: dwmac4: mask interrupts before stopping DMA in suspend
> 
>    you can find instructions for this in the doc Andrew linked :
> 
>    https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
> 
>  - When submitting a patch, do so in a dedicated thread, and not in reply to
>    other threads.
> 
> You should send a V2 addressing the tree name in the patch subject.

Thanks for the feedback, I addressed these changes and sent a v2 patch.

> Sashiko noted something on the patch :
> 
>   https://sashiko.dev/#/patchset/20260718152802.83553-1-luis.la%40mail.de
> 
> It looks to me that sashiko is just wrong there though, I can't make sense
> of what it is saying.

This seems to be because strictly speaking the title of the commit was wrong,
the interrupts don't get deactivated before stopping dma.
I changed it, but only read after that it is discouraged to change the Subject, sorry...
I hope the patch now meets the requirements,
Luis


