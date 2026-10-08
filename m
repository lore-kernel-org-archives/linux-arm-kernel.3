Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593D6CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 00:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA3OD8YP8kA43uRwiqGHMLv9THIO8ScV9l4ifw2Ty88=; b=z6rxBEDi5P0PjAbPV0860q5qYN
	k0V8BJ8OS2MjXGCi/OcUo5STNxqz6/DzKHYKt6aOGEaFm5AZ10TKVHG2nEWt1vDka5r8YYg9Lut1G
	jAAMo03Jbml1qJ1HN/8r4gggVs0u86Pp2kGKWch7t/ObbwemqyN+AIGslVxeLAP5xVEvHO3y8xCFY
	vr9syiaz7An58rP0ayP/bSBQG43arHUu/S7hS87N4ic2gT6Nm1FmsDYTBQrG9tKzZsIEjJ+kcKKkD
	IBsHFIY3HXDk2WFXfadVY4MBrAsLasxG7yrg6mHyYSOdWLGmUbqhoHl9HRLw7bGZRrzsLBQtrTHSR
	M/6pDh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEc92-00000003KwQ-3waq;
	Thu, 08 Oct 2026 00:38:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEc91-00000003KwH-48ty
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 00:38:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CCCE41325;
	Thu,  8 Oct 2026 00:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08161F000FF;
	Thu,  8 Oct 2026 00:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791419879;
	bh=GA3OD8YP8kA43uRwiqGHMLv9THIO8ScV9l4ifw2Ty88=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DcuEBSXsTJX+9zy1cEQLUMpet8lqaNcY/S8RCIL5hsKXGOQDrK7kwdwv+GVaLuXAo
	 NGN6f7q8/a+JjXUC0dgQ+QU6q4lu0oTJlezJ+mYOAgOjj9emrOMTa7xalxtWVJGeWv
	 xmbls43Ayd8TOU6jFEZTC2u88MB6DpPbLvia7SG/OLg0T69qOkku/dLCKvEsTA5/sn
	 aLVXUjrOv3YXBsH/MDdi9ckdsEYT9N67OKr1BdCdoaDl9MINnWYUWiTJIr3eoWXjCi
	 y1yy9tUtr8Uon5xmsCicyq8fGN3hSAVvM/p13AYnCBCtP93MhV2y0H2D0ivh9f5qGZ
	 scxb1a0hkfJJw==
Date: Wed, 7 Oct 2026 17:37:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Christian Marangi <ansuelsmth@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: leave the datapath running for
 normal-size MTU changes
Message-ID: <20261007173758.4e8687de@kernel.org>
In-Reply-To: <20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com>
References: <20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com>
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

On Wed, 30 Sep 2026 22:39:22 -0600 James Hilliard wrote:
> When both MTUs are at most ETH_DATA_LEN, the receive buffer size and MAC
> receive limit do not change. Update the MTU without restarting the
> datapath.
> 
> This also avoids rebinding a live AF_XDP pool to a temporary RXQ. XDP
> rejects jumbo MTUs, so all supported XDP MTU changes take this path.
> Jumbo transitions remain on the reopen path until the rollback change.
> 
> Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")

Someone marked this as Changes Requested in patchwork, no idea who.

Change seems good, but it's an optimization for net-next, no fixes tag

