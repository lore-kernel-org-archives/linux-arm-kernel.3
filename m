Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33652D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/sml+u6a8CEZsJFpF3d5AMtMazVBG0Mrdny6cktA2Q=; b=Euset0qIJeCOnRH5ktFYbRKMRN
	ENf75/mLpeJPdKONNrDX9CMLADrt7kxyXojUZHO6aFYu+KovWGe0h4SDZpzR7Q+54nGR68qMNkbtA
	tq7h7jhImnbY44So2pHSf+w+RxBdsjezFMIEVvG2lvXAb7MnjwpLsf/dps+y3ppBUFsIElO1s6t8i
	KBWI5sTEhJT/sDy6XfyYy09p9PQYFJ0DQtpJiBCH10mnsX4uErc7rvITaiZTOVyHs2qaUYP0oEYxM
	n43aIZtCB+f19l3iZghLzWj7IKJd5DjkIAeq3MYVb5HuwbSrOl2qNgdHNYnoAMHZuFWLS7dMhmkRu
	0FD0Wtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSba8-0000000D90o-3pyo;
	Mon, 08 Dec 2025 13:47:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSba5-0000000D90L-3T69
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 13:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=A/sml+u6a8CEZsJFpF3d5AMtMazVBG0Mrdny6cktA2Q=; b=ko9nLS11fjpRJtP5ZP4Kif3Ed7
	pWgzCrQ8dYO8fzp2in8a69Z7yuhGG0c7SMlpivS1hnC3oWaXuUR/tuVW5V3Ikbmu9SPJazlbMl4jb
	Wt7nNgjpMPpM/7L8Irnqv8ubW3bdbxVwoIjVU0392LbCuhcWZFpq/OIxA0K00Tu8WG9o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vSbZf-00GNYB-T0; Mon, 08 Dec 2025 14:46:47 +0100
Date: Mon, 8 Dec 2025 14:46:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Potin Lai <potin.lai@quantatw.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: mdio: aspeed: add dummy read to avoid
 read-after-write issue
Message-ID: <57860c7c-2294-4ea6-a998-8bc92dda2ed2@lunn.ch>
References: <20251208-aspeed_mdio_add_dummy_read-v1-1-0a1861ad2161@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-aspeed_mdio_add_dummy_read-v1-1-0a1861ad2161@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_054713_888921_10439016 
X-CRM114-Status: GOOD (  15.19  )
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

On Mon, Dec 08, 2025 at 02:49:56PM +0800, Jacky Chou wrote:
> The Aspeed MDIO controller may return incorrect data when a read operation
> follows immediately after a write. Due to a controller bug, the subsequent
> read can latch stale data, causing the polling logic to terminate earlier
> than expected.
> 
> To work around this hardware issue, insert a dummy read after each write
> operation. This ensures that the next actual read returns the correct
> data and prevents premature polling exit.
> 
> This workaround has been verified to stabilize MDIO transactions on
> affected Aspeed platforms.
> 
> Fixes: 737ca352569e ("net: mdio: aspeed: move reg accessing part into separate functions")

That seems like an odd Fixes: tag. That is just moving code around,
but the write followed by a read existed before that. Why not:

commit f160e99462c68ab5b9e2b9097a4867459730b49a
Author: Andrew Jeffery <andrew@aj.id.au>
Date:   Wed Jul 31 15:09:57 2019 +0930

    net: phy: Add mdio-aspeed
    
    The AST2600 design separates the MDIO controllers from the MAC, which is
    where they were placed in the AST2400 and AST2500. Further, the register
    interface is reworked again, so now we have three possible different
    interface implementations, however this driver only supports the
    interface provided by the AST2600. The AST2400 and AST2500 will continue
    to be supported by the MDIO support embedded in the FTGMAC100 driver.
    
    The hardware supports both C22 and C45 mode, but for the moment only C22
    support is implemented.
    
    Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
    Reviewed-by: Andrew Lunn <andrew@lunn.ch>
    Signed-off-by: David S. Miller <davem@davemloft.net>


    Andrew

---
pw-bot: cr

