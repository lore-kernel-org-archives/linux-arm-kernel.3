Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5DCC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUt65GKSqyj98NXe/npD3+O2Bp8K4k77GlLKHHo0EGc=; b=qM+N5jXJHqRFlglRNBHjfx5n72
	s2WPC5pZXbJehcQ4EWyWN4qEw0rC/jFfr36YxS+/g5zIeDoxPxRP7ZBaJzE5KTxdtS8sPky/c/1O5
	g28gqxVe3vUbz0+JhuDBwWvXwZGXE5gkVmA5OVGy6XMFqtbgq/dgaqk6MLAJ9IGVUNev111mqtwjA
	tigMiI+5mCuuTpY7kE9Wxxs3jDdNYITdWsRMI/uok6jc00gJEJ2LFEP+InC7iEJGvHZhL0jNFPIxa
	TlcnbNVY+rLrykk8jXGDnKT7lEDxlkh1m1P9mxpaBQRIfC5pUQSFBH9lgipZzXWdbvxSN1+B8sfo5
	5rYi7Maw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKzG-00000002muS-1yL3;
	Mon, 27 Jul 2026 13:03:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKzC-00000002mqG-0f9z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kUt65GKSqyj98NXe/npD3+O2Bp8K4k77GlLKHHo0EGc=; b=mUG1p50p0fu3TYQH0hC1vDPcj9
	GL7CM4La1Bx1Szg1lJVY/w1AX77NSpE7rCJ4ANAOmZQXR7BQeYbLLNKvP5WgVyeV+oxmIoq46UuVW
	zTwnIbdbxMsZFItRN0v5f9u8BIGMorVuicOB/u3w6TVa5WqRyNZHZ98zlLLZCgYHtmIQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1woKz3-00EQo8-5l; Mon, 27 Jul 2026 15:03:05 +0200
Date: Mon, 27 Jul 2026 15:03:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Abid Ali <dev.taqnialabs@gmail.com>
Cc: alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, pabeni@redhat.com
Subject: Re: [PATCH] net: stmmac: enable MAC rx/tx after DMA start
Message-ID: <a13d65de-75fc-413c-90e2-0f1805c6394f@lunn.ch>
References: <ee639271-60dd-49f7-9e77-0ae47841754d@lunn.ch>
 <20260727055715.4430-1-dev.taqnialabs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727055715.4430-1-dev.taqnialabs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_060314_202644_82E94A40 
X-CRM114-Status: GOOD (  17.10  )
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

On Mon, Jul 27, 2026 at 05:57:15AM +0000, Abid Ali wrote:
> On Sun, Jul 26, 2026 at 18:15:20 +0000, Andrew Lunn wrote:
> > There should be a function which is the opposite of stmmac_hw_setup(),
> > which tears it down. What order are things done there? tear down is
> > generally done in the opposite order to setup, so does the "Disable
> > the MAC Rx/Tx" also need to move?
> 
> I have not seen the FIFO stall in the teardown in my testing,
> but the MAC Rx/Tx should be disabled before the DMA engine is stopped.
> For the normal path (__stmmac_release), phylink_stop() is called first
> which triggers stmmac_mac_link_down() -> stmmac_mac_set(false), so the
> MAC is already disabled before stmmac_stop_all_dma(). The teardown
> order is already correct there.

Thanks for checking. Please add a comment to the commit message about
this.

> 
> > Same comment for the opposite of stmmac_xdp_open().
> 
> Currently, stmmac_xdp_release() does:
> 
>     stmmac_stop_all_dma(priv);
>     ...
>     stmmac_mac_set(priv, priv->ioaddr, false);
> 
> The ordering is not followed here,  I'll make it follow the similar
> ordering to (__stmmac_release) in v2.

Great.


    Andrew

---
pw-bot: cr
	

