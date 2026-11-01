Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456D9606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4LY66Y7Q;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J/uAysWm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q8dXQ9ryUVTDCQ5xMUQGfCQz0vSmgN8XPPGnta6liS8=; b=4LY66Y7QAF9UUD6EWzQBgtd4DH
	XBtFY6vZfP7v/B/VZSa99s7GLmhHFSGMO93bKv+2CJArTbGmMjoLqqPkmgdcMHs4fm3Qvq9qUW17c
	QX+AmBX8sU8++EtNBNx2bf/g/8LRrmm2WsfDwh3/sBoSlq/w2KLYV/k9OU8htGBpMqYA0mfW/plRd
	evx0QlYw8FjAJ7NRrDEAfkR4np6tVM0uj/XXY3rAaW/se6fyeb6NnntE037Z06pYJ5gdWHZ5tpyGt
	+NaYRJ9t1WPFXF3hxkPFVlM2uJ5KKqi4Q+r7Z4SDYoCHKq9baQUKOlWMDaUQWNRY5x+O0U+WAIDA0
	72ogK0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNR3N-0000000E1Vh-0cqS;
	Sun, 01 Nov 2026 08:36:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNR3K-0000000E1VL-41DV;
	Sun, 01 Nov 2026 08:36:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 397FA423DD;
	Sun,  1 Nov 2026 08:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC021F000C1;
	Sun,  1 Nov 2026 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793522194;
	bh=Q8dXQ9ryUVTDCQ5xMUQGfCQz0vSmgN8XPPGnta6liS8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=J/uAysWm9ZhHLp+YN/QuxKhdNxuGmk50BVnad1guZOwNgSOEZ35cnq83H+5S0dEq2
	 oGuYALwj+BcaBnIwQ5Y965jZUm7w9LwWoEjgB6sn/nzPR4+mxBm3xpZwvmY1KTgb83
	 HcmKXWjijcDkHX78emx7Fac3wt7Oker6QtSlpDyMvgyv0ysugytq861MDrNWsPx5zw
	 yzOtiqbKpSg5DqKCdPjELPqWjdRLTciqQMEL7qhy5ntZ2KbYfPfigrex7PTqxwvUPr
	 s2oIZkdHvUxMFvWG2ByEpnUluGSkabMhVMxCP8IFviNV98swWhwtTrNgId2+B1kY6s
	 HD/4C8CVqIR2w==
Subject: Re: [PATCH net v4 2/5] net: phy: disable the line of a postponed PHY
 interrupt only once
From: netdev-bot+sashiko@kernel.org
To: iav@iav.lv
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, lukas@wunner.de, rafael.j.wysocki@intel.com,
 wei.fang@nxp.com, niklas.soderlund@ragnatech.se, paul@pbarker.dev,
 florian.fainelli@broadcom.com, opendmb@gmail.com, Thangaraj.S@microchip.com,
 shenwei.wang@nxp.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sun, 01 Nov 2026 08:36:32 +0000
Message-ID: <179352219260.3131.3775758268420642181@kernel.org>
In-Reply-To: <20261031-b4-phylib-mac-pm-irq-v3-v4-2-5ba23b3ff9a4@iav.lv>
References: <20261031-b4-phylib-mac-pm-irq-v3-v4-2-5ba23b3ff9a4@iav.lv>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This commit introduces the problem, and a later commit in the
  series fixes it.

Pre-existing issues:
- [Medium] Not fixed by this commit, and the series fixes it later.

--

net: phy: disable the line of a postponed PHY interrupt only once

This commit changes phydev->irq_rerun to an atomic_t. Only the postponed
phy_interrupt() run that sets it now calls disable_irq_nosync(), which
avoids a double disable when an edge reruns the thread during a sleep
transition. The irq_suspended accesses also get READ_ONCE() and
WRITE_ONCE() annotations.

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index 9af303d60bd6b..b47f0d3d99e55 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c

[ ... ]

> @@ -1430,8 +1430,9 @@ static irqreturn_t phy_interrupt(int irq, void *phy_dat)
>  				pm_wakeup_dev_event(parent, 0, true);
>  		}
>  
> -		phydev->irq_rerun = true;
> -		disable_irq_nosync(irq);
> +		/* Disable the line only once: an edge can rerun the thread. */
> +		if (!atomic_xchg(&phydev->irq_rerun, 1))
> +			disable_irq_nosync(irq);
>  		return IRQ_HANDLED;
>  	}

[Severity: Medium]
What happens here if irq_rerun is still 1 from an earlier cycle and the
line has since been re-requested?

At this commit, only the successful no_resume path of
mdio_bus_phy_resume() clears irq_rerun. phy_free_interrupt() does not
reset it:

drivers/net/phy/phy.c:phy_free_interrupt() {
	phy_disable_interrupts(phydev);
	free_irq(phydev->irq, phydev);
}

When the PHY is the only user of the line, free_irq() shuts it down. The
next request_threaded_irq() in phy_request_interrupt() goes through
irq_startup(), which sets desc->depth = 0. So the line is enabled while
irq_rerun is still 1.

There seem to be two ways to reach that state:

  a) mdio_bus_phy_resume() returns early on a phy_init_hw() or
     phy_resume() failure. That leaves irq_suspended == true and
     irq_rerun == 1. Later the interface is cycled through
     phy_disconnect()/phy_connect().

  b) A MAC driver without mac_managed_pm frees and re-requests the PHY
     IRQ in its own PM callbacks. The parent MAC resumes before the PHY,
     so the re-request runs while irq_suspended is still true.

In both cases, the next PHY interrupt takes the postponed branch and sees
irq_rerun == 1. It skips disable_irq_nosync() and returns IRQ_HANDLED
without calling drv->handle_interrupt().

The PHY interrupt status is never cleared. On a level-triggered
IRQF_ONESHOT line, the IRQ core unmasks after the thread returns and the
interrupt fires again right away.

Could this become an IRQ storm, with no end in case a) and lasting until
PHY resume in case b)?

In case b), mdio_bus_phy_resume() then runs:

		if (atomic_xchg(&phydev->irq_rerun, 0)) {
			enable_irq(phydev->irq);

on a line at depth 0. Would that trigger the "Unbalanced enable for IRQ"
warning? Before this patch, every postponed run disabled the line, so
the later enable_irq() stayed balanced.

Two later patches in this series appear to resolve this: "net: phy:
balance a postponed PHY interrupt when the interrupt is freed" and "net:
phy: stop postponing PHY interrupts when a PHY PM callback fails". The
first resets irq_rerun in phy_free_interrupt(). The second routes the
resume error paths through mdio_bus_phy_resume_irq().

Since this commit has a Fixes: tag, would a stable backport of it
without those follow-ups bring in this regression?

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 79dba43d703a2..d5d0efc104187 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -344,7 +344,7 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
>  	 * has resumed. Wait for concurrent interrupt handler to complete.
>  	 */
>  	if (phy_interrupt_is_valid(phydev)) {
> -		phydev->irq_suspended = true;
> +		WRITE_ONCE(phydev->irq_suspended, true);
>  		synchronize_irq(phydev->irq);
>  	}

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch. What
clears irq_suspended if phy_suspend() fails?

mdio_bus_phy_suspend() sets the flag here and then ends with:

	phydev->suspended_by_mdio_bus = 1;

	return phy_suspend(phydev);

If phy_suspend() returns an error, the PM core skips this device's
resume callback in device_resume(), so irq_suspended stays true.

Every later phy_interrupt() run then takes the postponed branch. The
first one disables the line, and nothing re-enables it until another
full suspend/resume cycle.

mdio_bus_phy_resume() seems to end up the same way on its error paths:

	ret = phy_init_hw(phydev);
	if (ret < 0)
		return ret;

	ret = phy_resume(phydev);
	if (ret < 0)
		return ret;
no_resume:

Both returns skip the block that clears irq_suspended, consumes
irq_rerun and calls enable_irq().

Would the PHY link interrupt then stay disabled, so link changes are
lost?

The later patch in this series, "net: phy: stop postponing PHY
interrupts when a PHY PM callback fails", appears to fix both paths by
calling mdio_bus_phy_resume_irq() on these failures.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261031-b4-phylib-mac-pm-irq-v3-v4-0-5ba23b3ff9a4%40iav.lv

