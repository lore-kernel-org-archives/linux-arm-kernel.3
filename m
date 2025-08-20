Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E67CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qaQ2lL7aABgw9VygBN6qFKcGkY8Xh36PBx/9DXWjeA=; b=UzB1+GueL5gTpjPHckB2Gy2xSk
	ILd8bCDEHXsgzVRleM8urIS3xLbwB91LdIHSH6zvSy2SzcduB+wdTRzHKO3ZsO//cYlTjq6mpvAec
	TQCsjJHfdkcrWcHghezZ4C6GhWTkvba62oB/TTCxraRolS0NyzV31ZinM2v4h55ojzbXwGt4wdLch
	yh0+nn9VrqbDrMvLLbqnl1btOoF6Ex6ufGu7l+GplzElRhrWmP/pJfywhm9rGJdwZkRJi7K/JlCZL
	3cHuT715PvNyFpiiUsXp5NQN1UI18DwzI8NfBPPvJKHBXh1Zlr2EgzvD4YFjrKzBcme1jnvND3w7s
	HnoIWvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopkV-0000000Ervx-0aeZ;
	Wed, 20 Aug 2025 20:49:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolBO-0000000EJtg-2EgJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:57:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84C81601E5;
	Wed, 20 Aug 2025 15:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BD2C4CEE7;
	Wed, 20 Aug 2025 15:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705413;
	bh=iJ6BWRhcfdGTj+t/9+L3Zt0RuVafSEkJxteervNs1lI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hGxGlvX3nlwc3ojc89fPW2vtB4s4kIpy3ua357hA3xZiE5QSH3XQnpl0F5Bmsvx2V
	 7jAzijmUcR6aR9J7Rv3NVdhqjvYMwQ27ZAgcOz7xAwiMG2Ypc+Hqjqgv63/d7n/99T
	 nKFgggQFP8Hsz0zCb959kTzz1rBTeCT9JWIFFhDQ/LnkiiYDFA498uO+FItjZLMmQS
	 Lo2SNiiReT0SAIau74q2hD+z8mRItbkp6JXalvNA3vvmcM017W2mSp5OLk96/ahaWF
	 iEK2UvaST9JX8WxMstmzd4BYcyLC1+Wnct1RX/x/EgSuu5ZcwjZGm7LFuy/8V33wn9
	 c4aq2sUOaJ2LQ==
Date: Wed, 20 Aug 2025 08:56:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>, Jose Abreu
 <Jose.Abreu@synopsys.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Set CIC bit only for TX
 queues with COE
Message-ID: <20250820085652.5e4aa8cf@kernel.org>
In-Reply-To: <20250820085446.61c50069@kernel.org>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
	<20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
	<20250819182207.5d7b2faa@kernel.org>
	<22947f6b-03f3-4ee5-974b-aa4912ea37a3@altera.com>
	<20250820085446.61c50069@kernel.org>
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

On Wed, 20 Aug 2025 08:54:46 -0700 Jakub Kicinski wrote:
> On Wed, 20 Aug 2025 12:44:18 +0530 G Thomas, Rohan wrote:
> > On 8/20/2025 6:52 AM, Jakub Kicinski wrote:  
> > > Hopefully the slight pointer chasing here doesn't impact performance?
> > > XDP itself doesn't support checksum so perhaps we could always pass
> > > false?    
> > 
> > I'm not certain whether some XDP applications might be benefiting from
> > checksum offloading currently  
> 
> Checksum offload is not supported in real XDP, AFAIK, and in AF_XDP 
> the driver must implement a checksum callback which stmmac does not do.
> IOW it's not possible to use Tx checksum offload in stmmac today from
> XDP.

To be clear -- this is just for context. I don't understand the details
of what the CIC bit controls, so the final decision is up to you.

