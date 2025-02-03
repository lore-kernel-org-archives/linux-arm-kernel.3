Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCF3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7v8B5fuLOyvPnE4F8xYonpHQmsOiXgCq2SRnIU+w8s=; b=yDAKouSrg6MnlmQ+yjmgvu8jSZ
	0YArAMihNpYyBttpBiNx99GYIqAIReXDmIYvgZZPjOAE4iEU3vfF09/pgflmbsITd5rYxc61rYu8a
	kPuS1qWgeE4v97GVbVoUas3PSRNIdWJsMsXxKVMmrjhwJ3+UlwpaHd7OzkUXqiTDqtXm7iroaeQ5d
	zz4EG2Fk0j1/ErSYPUFrzcj6e3jZ4PA/e/nebbSYgAHm0mo7uov4c/AkfrKpXiq5xemJmAP2eAe5u
	ddnzD2I7K3jjcDetRgWJJGzbdq9M1ZyLyMKQ36Xqi6BJ+IMRJml+1wBacoKM5w47P+4BZDCTyJjQK
	oqgHIBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuA6-0000000FB4l-0O8P;
	Mon, 03 Feb 2025 10:58:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetqW-0000000F8hc-3BRH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j7v8B5fuLOyvPnE4F8xYonpHQmsOiXgCq2SRnIU+w8s=; b=nCpBsD3EHXJbS6gCHh0n8jBA+V
	bVSEjDPTWHFg73BKqz+RvYvf+t2x9qjPE6p6EKUZFYgCQRGAFBViMN4eN8btr5AcYZbB9hcdEqgtT
	T0vmFCauZEeXs2NPccXqd7q0JGLDj3PScZlXKOUSJFhS+WZn8XgaKh+fb/sXuRDKi+tC1sDRNTlZ8
	hiauULcVJ9BtyaIlBfdrW9kYBY1v2goRLxjIVksrxiOEWdqAmUfF/IbF3H+fF4JXCN1Kn3T9vUQnq
	lDqHKadfnhJ1oqX1QwCFm7s11WAofC8USnw00wQZWnHCmt6ifAkCo5oe3RlhWxHehqWKN/ugV+Kts
	pNIYkEvg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33290)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tetqI-0008Fh-2Y;
	Mon, 03 Feb 2025 10:38:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tetqC-0000IW-15;
	Mon, 03 Feb 2025 10:38:08 +0000
Date: Mon, 3 Feb 2025 10:38:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Steven Price <steven.price@arm.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Furong Xu <0x1207@gmail.com>, Petr Tesarik <petr@tesarici.cz>,
	Serge Semin <fancer.lancer@gmail.com>,
	Yanteng Si <si.yanteng@linux.dev>, Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH] net: stmmac: Allow zero for [tr]x_fifo_size
Message-ID: <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
References: <20250203093419.25804-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203093419.25804-1-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_023828_799223_B129B83C 
X-CRM114-Status: GOOD (  21.06  )
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

On Mon, Feb 03, 2025 at 09:34:18AM +0000, Steven Price wrote:
> Commit 8865d22656b4 ("net: stmmac: Specify hardware capability value
> when FIFO size isn't specified") modified the behaviour to bail out if
> both the FIFO size and the hardware capability were both set to zero.
> However devices where has_gmac4 and has_xgmac are both false don't use
> the fifo size and that commit breaks platforms for which these values
> were zero.
> 
> Only warn and error out when (has_gmac4 || has_xgmac) where the values
> are used and zero would cause problems, otherwise continue with the zero
> values.
> 
> Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when FIFO size isn't specified")
> Tested-by: Xi Ruoyao <xry111@xry111.site>
> Signed-off-by: Steven Price <steven.price@arm.com>

I'm still of the opinion that the original patch set was wrong, and
I was thinking at the time that it should _not_ have been submitted
for the "net" tree (it wasn't fixing a bug afaics, and was a risky
change.)

Yes, we had multiple places where we have code like:

        int rxfifosz = priv->plat->rx_fifo_size;
        int txfifosz = priv->plat->tx_fifo_size;

        if (rxfifosz == 0)
                rxfifosz = priv->dma_cap.rx_fifo_size;
        if (txfifosz == 0)
                txfifosz = priv->dma_cap.tx_fifo_size;

        /* Split up the shared Tx/Rx FIFO memory on DW QoS Eth and DW XGMAC */
        if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
                rxfifosz /= rx_channels_count;
                txfifosz /= tx_channels_count;
        }

and this is passed to stmmac_dma_rx_mode() and stmmac_dma_tx_mode().

We also have it in the stmmac_change_mtu() path for the transmit side,
which ensures that the MTU value is not larger than the transmit FIFO
size (which is going to fail as it's always done before or after the
original patch set, and whether or not your patch is applied.)

Now, as for the stmmac_dma_[tr]x_mode(), these are method functions
calling into the DMA code. dwmac4, dwmac1000, dwxgmac2, dwmac100 and
sun8i implement methods for this.

Of these, dwmac4, dwxgmac2 makes use of the value passed into
stmmac_dma_[tr]x_mode() - both of which initialise dma.[tr]x_fifo_size.
dwmac1000, dwmac100 and sun8i do not make use of it.

So, going back to the original patch series, I still question the value
of the changes there - and with your patch, it makes their value even
less because the justification seemed to be to ensure that
priv->plat->[tr]x_fifo_size contained a sensible value. With your patch
we're going back to a situation where we allow these to effectively be
"unset" or zero.

I'll ask the question straight out - with your patch applied, what is
the value of the original four patch series that caused the breakage?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

