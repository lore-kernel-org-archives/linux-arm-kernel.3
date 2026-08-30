Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEACFC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 14:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Cfz+1UkqRDYEv0PlJFOZYosCDiCp7c2SrUMBJNre10=; b=XTPnLqGk6OekxpTQvXPjds6mLW
	G/KH4c/1P71RHOzMeqdJRPdwDKI4CLILID20Cl0ieJhA1bovayzHZHsjPNnRRwA6OoIFFj2KbxyWl
	LPHYvSpUTa3ngGHbqahe4yn4Wx8LCbbhB9KYWDTQmTQhI3OEsiQT7MOuE80hG0bKcrdxpComS66Rv
	dagbY43/74ceLGdQEnspbTYLbQqx3PamgVVeQPO09w+e9zF4Hpek+WeQFxkQDRKU59e7fpdAlYsD5
	izQeS+CGipD3MIP3wBkIgUVQMwaeU3+rhqHE3hvDgJCEsT4XooOV2BIS669pER/utg2oj1HsYNc1P
	T0Bg/KEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gBL-00000007m8T-2DlB;
	Sun, 30 Aug 2026 14:06:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gBJ-00000007m7v-0mDB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 14:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1Cfz+1UkqRDYEv0PlJFOZYosCDiCp7c2SrUMBJNre10=; b=nJLiEjjv8xBWCk/ZKFt3H8roOr
	aVESBEaLF85CGrAkarjFO1+vSq6tis5whSrXxe0+yuYs8S7i2fwvMbB2Qw7oQHx/sgcFgoezQECxD
	z6fiDtLEgXK3Dp1AH67FdrKGhD47xfW5G2iXVZH6VA8eJaXSH9a/Ro0a2htwJl0qEEHI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x0gAq-0022VI-Jj; Sun, 30 Aug 2026 16:06:16 +0200
Date: Sun, 30 Aug 2026 16:06:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ding Hui <dinghui1111@163.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, dinghui@lixiang.com,
	xiasanbo@lixiang.com, yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: Re: [PATCH] net: stmmac: fix NULL pointer dereference in tx/rx
 resource cleanup
Message-ID: <3fd3506f-f254-4bff-a7ee-1063bf413919@lunn.ch>
References: <20260830040610.1156008-1-dinghui1111@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830040610.1156008-1-dinghui1111@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_070645_231030_231C12C6 
X-CRM114-Status: GOOD (  11.89  )
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

On Sun, Aug 30, 2026 at 12:06:08PM +0800, Ding Hui wrote:
> From: Ding Hui <dinghui@lixiang.com>
> 
> The DMA descriptor ring allocation in __init_dma_rx_desc_rings() and
> __alloc_dma_tx_desc_resources() is split into multiple steps, each of
> which may fail and return early while the per-queue cleanup paths still
> call the free helpers for the partially-initialized queue.

"and return early", is the real problem here. When a function returns
an error, it should first undo what it has done, up to the point of
the error.

Rather than add extra NULL checks, please work on
__init_dma_rx_desc_rings() and __alloc_dma_tx_desc_resources() and
make them cleanup on error.

I would say the problem you are trying to fix does not bother anybody,
so is not for stable. So i aim the patches for net-next.

	 Andrew

