Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132C9D3409C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/TzB0VhGYo46sJBSZh0FdpVMhNnR/ZBkA+XCLRNDVs=; b=ATtkbZLwU7eZXsJMOdyr1o7qys
	VvC6SuN7JknHE8VGRslX3QS06pibg8KgPC+96FR71stAGCZpsFIMydRGlxkOCwE3QQ0wN7zjarJQD
	B+meAtAka9emCSKODAbi7E/+Bf5hIM1LQhHFGE8yrRg6oJsZJC8nRzT+s4uaIFV7Gk2xSAmCsBiKL
	tSDpooeyZhVmiRMWDCVo0ePphzzcmCzSoPmO3zbM4BlQnCtFwV6F0kw5qCR+k79vLjJB0eZYt+yKg
	nrxllPyIixOHFgEEoB5RuHSYFpOKOCzEqd5ERvEDgNVlVTKozhLHi9HwwsBmvRZOHiF5Wyd5AnnIC
	LZ/s0F0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkllY-0000000EdlO-1pWe;
	Tue, 27 Jan 2026 16:18:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkllX-0000000EdlF-1LCS;
	Tue, 27 Jan 2026 16:18:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77FA560132;
	Tue, 27 Jan 2026 16:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987AEC116C6;
	Tue, 27 Jan 2026 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769530686;
	bh=ZcNWtYJLIeryb15EqaIHjsT/CHKImJVZ9MYEChHRjRI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i1fRsSxV9eVplljd+MJ6yUFvekmXAaHasq2TxJPzMmEmHW6XOVTGJPY5H5/PpjoPt
	 5lV896kGw0/406DS2MElUeHkkQc68yLkwtDyND7plvjq1EQuZtwr+8jDvS4H2WrF+i
	 VqmNtJdv05LND6Fzfa0CMHrQ4Qgs5nq7GgTqblB7w+ySjgOS3pPrtLWtdSxt4mSByF
	 2kF9Lia/W5vBPtEWCvXn84V4mPNmRLpTRZ+T6hwR/kArs10I4s000LpEsISzBjRxaL
	 O3Wwc1tumTy48rBSBsxvOC97A/BRRS2BwPC9GfsAW/JYW08WtyAUaR9BBsWxXrGYnF
	 eL92+wnW9rJ4w==
Date: Tue, 27 Jan 2026 08:18:04 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 pabeni@redhat.com, linux-rockchip@lists.infradead.org, heiko@sntech.de,
 alexandre.torgue@foss.st.com, andrew@lunn.ch, davem@davemloft.net,
 edumazet@google.com
Subject: Re: [net-next,v2,06/22] net: stmmac: rk: add SoC specific ->init()
 method
Message-ID: <20260127081804.64841f65@kernel.org>
In-Reply-To: <aXidBha0FahIS6Du@shell.armlinux.org.uk>
References: <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
	<20260127004020.3785641-1-kuba@kernel.org>
	<aXgMIYPiL9JK-c_K@shell.armlinux.org.uk>
	<aXidBha0FahIS6Du@shell.armlinux.org.uk>
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

On Tue, 27 Jan 2026 11:09:58 +0000 Russell King (Oracle) wrote:
> > > If ops->init() fails here, does bsp_priv->phy_reset need to be released?
> > > 
> > > Earlier in rk_gmac_setup(), at line 1610, the code calls:
> > > 
> > >     bsp_priv->phy_reset = of_reset_control_get(plat->phy_node, NULL);
> > > 
> > > of_reset_control_get() is not a devm-managed function, so the reset control
> > > would need to be explicitly released with reset_control_put() on error paths.
> > > 
> > > This new error return happens after phy_reset could have been acquired (when
> > > the device has an integrated PHY), but before the function successfully
> > > returns. If this path is taken, it appears the reset control would be leaked.
> > > 
> > > Currently no SoC sets ops->init so this path cannot trigger, but when a
> > > future SoC implements this callback, the leak would occur on init failure
> > > for devices with integrated PHYs.  
> > 
> > However, the driver does not release this resource when cleaning up, so
> > that's already a bug as the driver currently stands. I think this could
> > be converted to devm_reset_control_get(), which would resolve both
> > leakages, but not sure.  
> 
> Note that fixing this is going to add yet another patch to the series,
> because this is a pre-existing bug in the driver. It can't be replaced
> with devm_reset_control_get(), because this driver is getting resources
> for a foreign device (we don't have the struct device pointer.)
> 
> So, it isn't going to be a simple patch to fix this.

Would it work to make that plus patches 1-4,6 a separate series?

