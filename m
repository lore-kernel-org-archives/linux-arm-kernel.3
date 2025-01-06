Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B0CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVztrZbTuyhMG1+k+QfVhFy7XwvC5jeioCzcRqo9VYw=; b=W/gd3qmZlrEmBE0CDc50elela5
	Efj1VdcqImpG3TtN4kkO6mKZzTzptQme0uL63n4uFLn9U3y5GVbvGVQPbspJk66OutBLkszpGswxt
	OQ7LbdB2njCBdEondgHxaxDE94oYfLYKXxSyO8qO5NAsUu83wlVGKuPTPyt7HA8xak6C8Mqjj0Wo1
	rlxEPC0pKpDyqt1azIMpO+KnhgAv8uWIE7mynJIJ8Psl0dHWrPp5VKTt4co0nJ2NufrcQXrVL4T17
	LkXajs08JWvQTI/4HZG5YXaSdBz/YQUoIWxDg4BbvkCuQTksBDcMdkiUIKfnrJmfpTlkCb7rZBvp4
	PVWPLp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqch-000000024iU-3zjF;
	Mon, 06 Jan 2025 17:10:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqZG-000000024DL-3b0r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DVztrZbTuyhMG1+k+QfVhFy7XwvC5jeioCzcRqo9VYw=; b=zI8O9EZgn8eeFij/+UY2jYDOM5
	YkZQGXp1LCljcJ1jRnMMsv+oN2PUndPSGKt6pGEHLwoifFj7PyWXlVbn7/j19ziXTf4kKirOST7aY
	OuxEFuZMTPwsc4yzHe9db3YS/tuho8AC74cFoMDFRwKv/rX/sNH3uCjm4FWsWzFTrROs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqZ9-001wQR-7S; Mon, 06 Jan 2025 18:06:59 +0100
Date: Mon, 6 Jan 2025 18:06:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 15/17] net: stmmac: remove unnecessary EEE
 handling in stmmac_release()
Message-ID: <fbfb1179-7362-490f-80a0-e7fc7f43a39b@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmBE-007VY5-DJ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmBE-007VY5-DJ@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_090706_906424_EDA34344 
X-CRM114-Status: GOOD (  10.70  )
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

On Mon, Jan 06, 2025 at 12:26:00PM +0000, Russell King (Oracle) wrote:
> phylink_stop() will cause phylink to call the mac_link_down() operation
> before phylink_stop() returns. As mac_link_down() will call
> stmmac_eee_init(false), this will set both priv->eee_active and
> priv->eee_enabled to be false, deleting the eee_ctrl_timer if
> priv->eee_enabled was previously set.
> 
> As stmmac_release() calls phylink_stop() before checking whether
> priv->eee_enabled is true, this is a condition that can never be
> satisfied, and thus the code within this if() block will never be
> executed. Remove it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

