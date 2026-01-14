Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD27D38FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZVEm8Xn3I90+wHI7MytQ6KmTu4Lb6cFPmUPZvnv6MY=; b=xrNy1T7OTtnNLHDp9OwARmORaP
	IYH+iHdrFfObuYOxn22nwZz+3p4J2y8b1l3P3hdioVmK6hsq/mZyfPTH6MFfdPwTI/dS9flMUuUxU
	QtN3Gq0dqj/5EcvcnU4P/x1hEyOFzJ7W2ThCY84tUCbDeK0z0/xGe+AALnUC5O0G3gSOpwDtC2q18
	H+62FufmIug0VVctGEXwsLYpStMiHMSZV6+bt4YjZ8Iy/Nr/TNFxQ4j+y+/ef2uQmk4r9LF3yAmgu
	B4fULxMzLPhQQZi864i8WMBe1dAsqlWM2gJ6VPsv4CU8qblyvUQqHjEX/qBneVbplRoar+o5ld+Gu
	jHAdfuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Ps-0000000A4tt-11a0;
	Wed, 14 Jan 2026 17:12:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Pp-0000000A4sL-2c4m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iZVEm8Xn3I90+wHI7MytQ6KmTu4Lb6cFPmUPZvnv6MY=; b=kdg/Cn41mHPFQ8LySJEeTOi3sd
	6pj/btnlABLSKHAEQhrB13uUlT7KZ42ZGVrCXODgKyWMx4fJn1e/jZ9oV+URphGYFTeU1Y1IMCnEB
	SBqFqyclFwzt9RHJu8Quo9LsRlzaChS0sBgQtYJgO+ZQZUXVqD0KQb0NK7QE2jzPkmXiw8qJYCgXO
	i0HLsCsOA45wvQEzgxz6X5SlAt+ovgccgc/W71TkVp0m6GLkwTu1pSt7kVxS0j4nP+j6cyrXFvta2
	VvDovruK0y4jBTP5v2uFq8vIhwbYmmYkPoubYf76zgZgcG52ySx5dE0nk5fqVGaGB0moQZChhdnhD
	cFE9o8xg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39000)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vg4Pc-000000000QS-3uZj;
	Wed, 14 Jan 2026 17:12:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vg4PZ-000000001p7-3qmo;
	Wed, 14 Jan 2026 17:12:02 +0000
Date: Wed, 14 Jan 2026 17:12:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek Vasut <marex@nabladev.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,PATCH] net: stmmac: stm32: Do not suspend downed
 interface
Message-ID: <aWfOYf_YmJFUakvP@shell.armlinux.org.uk>
References: <20260114081809.12758-1-marex@nabladev.com>
 <aWfEXX1iMHy3V5sK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWfEXX1iMHy3V5sK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_091217_665662_02D3F273 
X-CRM114-Status: GOOD (  23.65  )
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

On Wed, Jan 14, 2026 at 04:29:17PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 14, 2026 at 09:17:54AM +0100, Marek Vasut wrote:
> > If an interface is down, the ETHnSTP clock are not running. Suspending
> > such an interface will attempt to stop already stopped ETHnSTP clock,
> > and produce a warning in the kernel log about this.
> > 
> > STM32MP25xx that is booted from NFS root via its first ethernet MAC
> > (also the consumer of ck_ker_eth1stp) and with its second ethernet
> > MAC downed produces the following warnings during suspend resume
> > cycle. This can be provoked even using pm_test:
> > 
> > "
> > $ echo devices > /sys/power/pm_test
> > $ echo mem > /sys/power/state
> > ...
> > ck_ker_eth2stp already disabled
> > ...
> > ck_ker_eth2stp already unprepared
> > ...
> > "
> > 
> > Fix this by not manipulating with the clock during suspend resume
> > of interfaces which are downed.
> 
> I don't think this is the correct fix. Looking back at my commits:
> b51f34bc85e3 net: stmmac: platform: legacy hooks for suspend()/resume() methods
> 07bbbfe7addf net: stmmac: add suspend()/resume() platform ops
> 
> I think I changed the behaviour of the suspend/resume callbacks
> unintentionally. Sorry, I don't have time to complete this email
> (meeting.)

I think I'm going to start over, trying to figure out what happened.

c7308b2f3d0d net: stmmac: stm32: convert to suspend()/resume() methods

Did the conversion, and it always called stm32_dwmac_clk_disable() and
where it exists, dwmac->ops->suspend() on suspend, provided
stmmac_suspend() returns zero (which it will do, even if the interface
is down. On resume, it always calls dwmac->ops->resume() and
stm32_dwmac_init() before calling stmmac_resume().

The conversion added hooks into ny new ->suspend() and ->resume()
methods to handle the stm32_dwmac_clk_disable(), dwmac->ops->suspend(),
dwmac->ops->resume() and stm32_dwmac_init() steps.

However, in 07bbbfe7addf I failed to realise that, in order to keep
things compatible with how stuff works, we need to call
priv->plat->suspend() even if the interface is down. This is where
the bug is, not in your glue driver.

Please try this:

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a8a78fe7d01f..2acbb0107cd3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8066,7 +8066,7 @@ int stmmac_suspend(struct device *dev)
 	u32 chan;
 
 	if (!ndev || !netif_running(ndev))
-		return 0;
+		goto suspend_bsp;
 
 	mutex_lock(&priv->lock);
 
@@ -8106,6 +8106,7 @@ int stmmac_suspend(struct device *dev)
 	if (stmmac_fpe_supported(priv))
 		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
 
+suspend_bsp:
 	if (priv->plat->suspend)
 		return priv->plat->suspend(dev, priv->plat->bsp_priv);
 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

