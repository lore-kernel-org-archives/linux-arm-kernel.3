Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1E9F531CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDWd9CWfVX7r0PSKz0p1Zs83559R0aSuznlzpK3asKw=; b=suwtdTPMK02K3tXEIlrxZb2AhK
	iORzDc0vHO473SxnWLByBPyk7VoBo1slv6xhMBLDARLOAS2ychG78HYadmLX7PO0HicyL0tyFTKtg
	xMMisvvYrS78m5qxPsMj/ElMCOM6OQK42uzPSLvQH9Ceck822sQa4Q2Fn48r6tx8zHSdGL4l/7Vim
	+HYsqNTHOpCTUzDiX0aAIoKhDY1Od8NRu8KlPotzkF0mSmfLK3ikh3JGt2YWwKo1oU7jj//MiFewP
	i+7DG3QwfnSbiMqvi9ubABwt39DSUil1fOQ52UYdrRBshYrvF945BYLAhJGiFthKvlnJMUGI1h+ez
	0bOXEcSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCOEg-0000000GN1s-2N9j;
	Mon, 13 Apr 2026 20:50:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCOEf-0000000GN1l-1Mhl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 20:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6295061339;
	Mon, 13 Apr 2026 20:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95926C2BCAF;
	Mon, 13 Apr 2026 20:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776113420;
	bh=z5ggFBTCYXZ4iQPoi4R7C2G+I1mDqrCkwTxUWC2hdKc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ESXWXt2DCvlxBlS7DZFuJv6w9UMrL4eE5LY548srRAAVL4+tOUroVEm7DEP0ExrgZ
	 acDFtv/Xo/9kU1VNXyqRF4YSya1rtvAnYin/psxase9mwTnDBn/GlmFhYlpRqOGtEr
	 +QLv+mUlypfngz6t+344btCEjXgGEV2JjqtVJyq5aOQaW2qxC3zU6dxcUxUX3Ouib0
	 rST9qZKgnReNi1aCQIUK2sLSj2i6je8te6XykaDgjpMnTWM0+zw/w9j5HOhjZiYa6y
	 dQS/AUAm2WL3Ab/jvMMXvzUPHJUTzVX5MQ2LmHMrc7QmsEuJsWFNCk8MX96Utz8ofa
	 EWSduCx8bT47A==
Date: Mon, 13 Apr 2026 13:50:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>, Sam Edwards <cfsworks@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
Message-ID: <20260413135018.59fbd3a1@kernel.org>
In-Reply-To: <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
	<20260413110222.49fc3759@kernel.org>
	<ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 13 Apr 2026 19:49:46 +0100 Russell King (Oracle) wrote:
> > Firing interrupts when Rx fill ring runs dry (which IIUC this patches
> > dies?) is not a good idea.  
> 
> Well, I'm thinking that at least on some platforms, such as the Jetson
> Xavier NX, unless a different solution can be found, we need the RBU
> interrupt to fire off a reset of the stmmac IP when this happens to
> reduce the PAUSE frame flood on the network.
> 
> If we can't do that, then I think stmmac on these platforms needs to be
> marked with CONFIG_BROKEN because right now there doesn't seem to be any
> other viable solution.
> 
> My intention with this patch is merely to start collecting the already
> existing statistics so other users can start seeing whether they are
> hitting the same or similar problem. If we're not prepared to do that,
> then we should delete the useless statistics from ethtool -S, but I
> suspect they're now part of the UAPI, even though without this patch
> they will remain stedfastly stuck at zero.

Understood, thanks for the extra context. And the statistic we are
talking about is rx_buf_unav_irq ?

