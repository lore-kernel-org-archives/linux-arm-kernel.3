Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3BAD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9B4YRl3TorPvS722yi6u0HbgMUIMrg45Xx3TtSQO0lM=; b=QsjDjodhvWYCzg+93VUrV3sTMn
	vQSHhFYRRys63U4GLGdbsSUKxC3thbDDSg2lkrBvAlFMUpkepI8bE+dxApd4S875y6Ko3QG8KPaqo
	Hrp0hzJXm1KL3k3uyhDxb3g8aBLqpDCGiok+On6spFcfg9dQ/dCSohe3DvEPxl16RD30bZwKiwyBo
	vC832QwCsHv50id4AiLZiAbUC83TlFUAe0RUnJn1fG5NvsNTngCtGTV8lzHObXFSm7/CFmCmV9n3S
	vktm06h4hYm0cehL48j99PR+qK9zDVyt+DArvUadj1UhVZYHEITYVBazCZNyT8rxRuFnnW3by9oik
	n3ERriAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ70k-00000004IyB-2NRM;
	Mon, 01 Dec 2025 16:44:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ70h-00000004Ixi-3sL7;
	Mon, 01 Dec 2025 16:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9B4YRl3TorPvS722yi6u0HbgMUIMrg45Xx3TtSQO0lM=; b=09ZvPPTd8oDr63PRmscNOob3iT
	5hwbjTsQ9/7JnoXjei2tyMUdZ1ZFoDesVnleQGCbrKGvbiG2NCGjNsnH2JqvFiZ9F8NlPbOrOtr40
	XFKt9zFsZImMCoCWcyRSgXKzTu4xY0fHupFWHBBuwU8UmqmK3e2elQzbj8mdRszxO43nXYRpdVxZS
	UPhO0UDYgZvFwpWIOfEM/tpMhbFIZBHSgg+n80tbiKDKVm66wIKcgi/q/R7yiK47uUa3xbqYbGdIU
	/7XottCXSw2ZtyMlU3MnNTwpXUmwDlVfk15E64vVkyCGhaRagqMtNf2oEXIQhogQwmYEd6TCSO6DG
	VusJjTsA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40600)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vQ70b-000000000qV-42rK;
	Mon, 01 Dec 2025 16:44:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vQ70Z-000000006ck-2heB;
	Mon, 01 Dec 2025 16:44:15 +0000
Date: Mon, 1 Dec 2025 16:44:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 00/15] net: stmmac: rk: cleanups galore
Message-ID: <aS3F36UAkeLfFeHx@shell.armlinux.org.uk>
References: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_084423_985024_A2092052 
X-CRM114-Status: GOOD (  25.92  )
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

On Mon, Dec 01, 2025 at 02:49:56PM +0000, Russell King (Oracle) wrote:
> This is work in progress, cleaning up the excessively large Rockchip
> glue driver somewhat. This series as it currently stands removes
> approximately 200 lines from this file, while adding slightly to its
> flexibility.
> 
> A brief overview of the changes:
> 
> - similar to previous commits, it seems the RGMII clock field follows
>   a common pattern irrespective of the SoC.
> - update rk3328 to use the ->id mechanism rather than guessing from
>   the PHY interface mode and whether the PHY is integrated.
> - switch to wm16 based masking, providing the lower-16 bits of the
>   mask to indicate appropriate fields, and use this to construct the
>   values to write to the registers.
> - convert px30 to these methods.
> - since many set_to_rmii() methods are now empty, add flags to indicate
>   whether RMII / RGMII are supported.
> - clear RGMII where the specific SoC's GMAC instance doesn't support
>   this.
> 
> I've spent quite a while mulling over how to deal with these "wm16"
> registers, none of the kernel bitfield macros (not even the
> hw_bitfield.h macros) allow for what I present here, because the
> masks are not constant.
> 
> One of the interesting things is that this appears to deal with RGMII
> delays at the MAC end of the link, but there's no way to tell phylib
> that's the case. I've not looked deeply into what is going on there,
> but it is surprising that the driver insists that the delays (in
> register values?) are provided, but then ignores them depending on the
> exact RGMII mode selected.
> 
> One outstanding issue with these patches: RK3528_GMAC0_CLK_RMII_DIV2
> remains, although I deleted its definition, so there's build errors
> in this series. Before I do anything about that, I would like to hear
> from the Rockchip guys whether it is necessary for rk3528_set_to_rmii()
> to set the clock rate, given that rk_set_clk_tx_rate() will do this
> when the link comes up. Does it matter whether it was set to 2.5MHz
> (/ 20) or 25MHz (/ 2) when we switch to RMII mode?

Another issue has come up while looking at this driver -
gmac_clk_enable() is buggy.

If clk_bulk_prepare_enable() succeeds, but then the following
clk_prepare_enable() fails, we simply return its error code, failing
gmac_clk_enable(, true), leaving the bulk clocks prepared and enabled.

Calling this with "false" to disable clocks won't - because we never
get as far as setting bsp_priv->clk_enabled, and even if we did, we'd
disable and unprepare clk_phy which failed to prepare/enable.

Again, I don't like this foo_enable() / foo_power_on() pattern with
a true/false argument - when false, the function is not enabling
nor "on"-ing, but disabling or "off"-ing. So, gmac_clk_enable() is
going to get split up and renamed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

