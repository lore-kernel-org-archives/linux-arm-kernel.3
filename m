Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F24ECA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUIWaC88q0Bw4l+W8HSB54nC9nI/6KV4K3UIv1ypbKY=; b=ywMKzxmYZmH4UC/Cixzb19qw0a
	cbgojil2IUXqQ0tPWkLV1pzAvibjM/wtDO7+nn6C2ZidwHMQ9dq9jtHvIjzW3ObSTeshbGZEJx5yD
	+xnVbRUJiuL0PFvdqujpEnCEVP4JqLo8IhiMmakC5IoLIZFpU16mvqLZ8/e4X+8XPEOBUEjbO9MXu
	zs1bBMMHjkzfvB9NOi9+knMDI+FzKQ/rYk1wTwIKV/+rab+npQh0f3Y3RhEITFH8gHDc+tIRmntyb
	2i5EmAh/YV3DiG9dPF48irFrMbvF9gk9ZGBFnmitdzzga4dqThpcFp5PRPjUD8JzGLBuM47u7zNDC
	XFE4Zv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSaz-0000000FEUs-3j3A;
	Sun, 04 Oct 2026 20:14:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSaw-0000000FEUm-0WIU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:14:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 92B2341903;
	Sun,  4 Oct 2026 20:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BFF1F000FF;
	Sun,  4 Oct 2026 20:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791144839;
	bh=kUIWaC88q0Bw4l+W8HSB54nC9nI/6KV4K3UIv1ypbKY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jg0JWCa/by34WL3CmzK/O05a1p/buJChGldkdMlaLCsm8gM+mvk8EduO9B2LJ2wtq
	 Nhhww3mCRVYJlNH44bI7XMPWzxrKl7gwtnj2kodSY1EvWPwbq8GUPedBdKlgfi6V/y
	 cEjC44FwvlIUwKZGiFdjTyetP6qpaGjMG0Hqt4UvFp/xnI4jhEDneI7YyL2qH1wQHx
	 pyiI9v9gedayEb9VZCNz6gGSMcFs4hBKR1wCIPqYy2EkRR4FDYFw9cDWFBW1N4JV1y
	 XlWhPyeWPsGugh+/sS8rNK8HZY7Bw6riahDO6a5z9T8T5jsUMkUUQDM/d6ZlIQamoZ
	 QnsfKV0GmlfmA==
Subject: Re: [PATCH net-next] net: stmmac: mask the MAC interrupt while resume
 resets the MAC
From: netdev-bot+sashiko@kernel.org
To: iav@iav.lv
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 20:13:58 +0000
Message-ID: <179114483834.434549.10718571008152168526@kernel.org>
In-Reply-To: <20260930-stmmac-irq-shut-v1-1-104d1a1dcb28@iav.lv>
References: <20260930-stmmac-irq-shut-v1-1-104d1a1dcb28@iav.lv>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The defect is specific to dwmac1000, but stmmac_resume() now
  calls disable_irq(ndev->irq) on every core for the whole resume.
- [Medium] stmmac_resume() now re-enables ndev->irq on every exit path,
  including error exits where GMAC_INT_MASK was never restored.
- [Low] The commit message names commit 2e2c878a3141 ("net: stmmac:
  remove SGMII/RGMII/SMII interrupt handling") as the point after which…
- [Low] The new comment in the generic stmmac_resume() says 'Resume
  resets the MAC, leaving every core interrupt unmasked until the mask…

--

net: stmmac: mask the MAC interrupt while resume resets the MAC

This patch disables ndev->irq for the whole of stmmac_resume() when the
interface is running, and enables it again on every exit path. The aim is
to stop an RGMII interrupt storm on dwmac1000. There, the MAC reset in
stmmac_hw_setup() clears GMAC_INT_MASK, and it stays clear until
dwmac1000_core_init() writes it again.

> stmmac_resume() resets the MAC in stmmac_hw_setup(). On dwmac1000 the
> reset clears the interrupt mask, and all core interrupts stay unmasked
> until dwmac1000_core_init() writes it again. A link change in that
> window raises an RGMII interrupt, and no handler clears it since
> commit 2e2c878a3141 ("net: stmmac: remove SGMII/RGMII/SMII interrupt handling").
> The line storms:

[ ... ]

> The message repeats every few milliseconds and the network stays down
> until a power cycle or a watchdog reset.

[Severity: Low]
Should this carry a Fixes: tag for the commit it names?

Fixes: 2e2c878a3141 ("net: stmmac: remove SGMII/RGMII/SMII interrupt handling")

That commit removed dwmac1000_rgsmii() and its call from
dwmac1000_irq_status(). That call read GMAC_RGSMIIIS to ack the interrupt:

-	if (intr_status & PCS_RGSMIIIS_IRQ)
-		dwmac1000_rgsmii(ioaddr, x);

It also moved GMAC_INT_DISABLE_RGMII into GMAC_INT_DEFAULT_MASK. Since
then, the mask written by dwmac1000_core_init() is the only protection.

The only trailers are Assisted-by and Signed-off-by, and the note after
them says the patch was ported to net-next. Both 7.2 and 7.3-rc5 were
tested as affected. Would net, with a Fixes: tag and possibly Cc: stable,
be the better target?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3ad9252bf6aea..6e0415538327b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8356,16 +8356,26 @@ int stmmac_resume(struct device *dev)
>  {
>  	struct net_device *ndev = dev_get_drvdata(dev);
>  	struct stmmac_priv *priv = netdev_priv(ndev);
> +	bool irq_off;
>  	int ret;
>  
> +	/* Resume resets the MAC, leaving every core interrupt unmasked until
> +	 * the mask is written again: a link change in that window would storm.
> +	 */

[Severity: Low]
Does this comment hold for every core that uses stmmac_resume()?

Only dwmac1000 writes a mask register, where 0 means everything is
unmasked:

drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:dwmac1000_core_init() {
    ...
	writel(GMAC_INT_DEFAULT_MASK, ioaddr + GMAC_INT_MASK);
    ...
}

dwmac4 and xgmac write enable registers instead. On those cores a reset
leaves the core interrupts disabled, not unmasked:

drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:dwmac4_core_init() {
    ...
	writel(GMAC_INT_DEFAULT_ENABLE, ioaddr + GMAC_INT_EN);
    ...
}

drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:dwxgmac2_core_init() {
    ...
	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
    ...
}

Could the comment say that this is a workaround specific to dwmac1000?

> +	irq_off = netif_running(ndev);
> +	if (irq_off)
> +		disable_irq(ndev->irq);

[Severity: Medium]
What happens to other devices on this line while resume runs? In single
IRQ mode the line is requested as shared:

stmmac_request_irq_single() {
    ...
	ret = request_irq(dev->irq, stmmac_interrupt,
			  IRQF_SHARED, dev->name, dev);
    ...
}

disable_irq() masks the line for every handler on it. The line then stays
masked through all of these:

  plat->resume()
  stmmac_mdio_reset()
  SerDes power-up
  rtnl_lock()
  mutex_lock(&priv->lock)
  stmmac_hw_setup(), including the DMA soft reset poll of up to 200ms
  in dwmac_dma_reset()
  PTP init
  phylink_resume()

No other device on the line gets interrupts during that time. Suppose one
of them waits for its own interrupt while holding RTNL, or another lock
that stmmac_resume() needs. Can that stall until a timeout, or forever if
the wait has no timeout? Lockdep would not see this dependency.

The commit message mentions IRQF_SHARED only as the reason to leave the
line enabled during suspend.

The problem is specific to dwmac1000. Could the fix avoid the shared line
altogether? Some options:

  rewrite GMAC_INT_MASK right after the reset
  restore the read-to-clear of GMAC_RGSMIIIS in dwmac1000
  disable the line only between the reset and core_init

[ ... ]

> @@ -8451,6 +8462,9 @@ int stmmac_resume(struct device *dev)
>  	stmmac_legacy_serdes_power_down(priv);
>  	mutex_unlock(&priv->lock);
>  	rtnl_unlock();
> +out:
> +	if (irq_off)
> +		enable_irq(ndev->irq);

[Severity: Medium]
Can this enable the line again while GMAC_INT_MASK is still clear?

If stmmac_init_dma_engine() fails, stmmac_hw_setup() returns before
stmmac_core_init(). That is the only place where dwmac1000_core_init()
restores the mask:

stmmac_hw_setup() {
    ...
	ret = stmmac_init_dma_engine(priv);
	if (ret < 0) {
		phylink_rx_clk_stop_unblock(priv->phylink);
		...
		return ret;
	}
    ...
	stmmac_core_init(priv, priv->hw, dev);
    ...
}

The failure can come from stmmac_prereset_configure(), or from
stmmac_reset() timing out ("Failed to reset the dma"). The timeout is a
known case when clk_rx_i from the PHY is not running yet.

dwmac_dma_reset() returns -ETIMEDOUT and leaves SFT_RESET set:

dwmac_dma_reset() {
    ...
	return readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
				 !(value & DMA_BUS_MODE_SFT_RESET),
				 10000, 200000);
}

So the hardware finishes the reset once the RX clock starts. That usually
happens when the PHY link comes up, which phylink_prepare_resume() has
already started. The reset clears the mask just as the RGMII link change
event arrives.

The error then takes this path:

stmmac_resume()
  stmmac_hw_setup() fails
  goto error_unlock
  out:
    enable_irq(ndev->irq)

stmmac_interrupt() never acks the RGMII source and always returns
IRQ_HANDLED:

stmmac_interrupt() {
    ...
	stmmac_common_interrupt(priv);
	stmmac_dma_interrupt(priv);
	return IRQ_HANDLED;
}

Because of that, the spurious IRQ detector will not disable the line
either. Does the storm this patch fixes come back on these exits, with no
later core_init to close the window?

The commit message says the line is enabled again "on every exit path".
On these exits, though, it is enabled inside the window the patch is
meant to close.

>  
>  	return ret;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260930-stmmac-irq-shut-v1-1-104d1a1dcb28%40iav.lv

