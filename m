Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB4606A339
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lngJXT8R;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UJbN3uNg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xf3Loy4nSJ6nnacTtEx28Qg2Cgh08dxFhAwH21XrXA0=; b=lngJXT8R4wf8NbSTe4EU00kPQb
	4NsKk6e0PcmgPY/KkD1opY0CGlDCKA0ewLf2F8m8bNvxXFtFIPbPHq8xLd7So40B7adZ2ctzEmE/m
	NOL0Yo1luhalFI559ZQGnNrWSgDruz3uGBCvu4ZpjnR5E1gkDyHpsdZiX1KTGxTnuJMb+IwJZ+bzi
	v+jpQVbZgp9WEU+W/rx7uRGi3KUomeYbumTbU3LEMkP5ndY6JPMTQGOXLhcHVBBbHRQFjHpRGp4ak
	PB3J/dr4FZt7c79OVeDDndJRd23aC1NdujLAo8P33S38GpHtBO5dYY/aS81G+vFaqTRVwIp/oDp6w
	YfmWu/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNR3P-0000000E1Wz-1OGG;
	Sun, 01 Nov 2026 08:36:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNR3M-0000000E1VW-0sqV;
	Sun, 01 Nov 2026 08:36:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F21FC43DB6;
	Sun,  1 Nov 2026 08:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D9E1F00919;
	Sun,  1 Nov 2026 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793522195;
	bh=xf3Loy4nSJ6nnacTtEx28Qg2Cgh08dxFhAwH21XrXA0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UJbN3uNg34jhUaqo46GU1/W6QcMdU+Aklhuk2gXDQ9MbyN6c5gPPVKKtsYqaKR5Hk
	 Ewc22Cm4GL7ErPiG55BCzLBRPV1MLQIYMnz3m1IC0wC83AKSWyfdvc21ts35n1QGVB
	 nr4vtFtSbLOoE0uj5g4wj9C+mDzPt+UfXXW5+tk5A4ArV59+KO547Z2A5OokPDdLQq
	 Hc7t7jwLTnpl3Lu8Gn038ojLVCmX0iMXa6jmjrct0iJ+L8mnd0FKHTFc+rq93e048G
	 jsfrjPZow7mmMvjeyR15RMC2sPUel+m5mBB7YlHBbDBEEJEeFEewelrZP1/XYZYzYq
	 jNQfwL1EHzyDw==
Subject: Re: [PATCH net v4 3/5] net: phy: balance a postponed PHY interrupt
 when the interrupt is freed
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
Date: Sun, 01 Nov 2026 08:36:34 +0000
Message-ID: <179352219428.3131.13487367987610996169@kernel.org>
In-Reply-To: <20261031-b4-phylib-mac-pm-irq-v3-v4-3-5ba23b3ff9a4@iav.lv>
References: <20261031-b4-phylib-mac-pm-irq-v3-v4-3-5ba23b3ff9a4@iav.lv>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 (1) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: phy: SCHED_FIFO IRQ thread livelock in phy_free_interrupt()
- [Medium] phy_free_interrupt() (drivers/net/phy/phy.c) now calls
  enable_irq() before free_irq() whenever a postponed interrupt left the…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but
  mdio_bus_phy_suspend() (drivers/net/phy/phy_device.c) sets…

--

net: phy: balance a postponed PHY interrupt when the interrupt is freed

This patch makes phy_free_interrupt() preset irq_rerun. If a postponed
interrupt has already left the line disabled, phy_free_interrupt() now
re-enables it before free_irq(). A new irq_pm_lock serializes this against
the rerun after resume, and the suspend/resume IRQ handling moves into the
helpers mdio_bus_phy_suspend_irq() and mdio_bus_phy_resume_irq().

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index b47f0d3d99e55..49098b4813884 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c

[ ... ]

> @@ -1508,7 +1510,19 @@ EXPORT_SYMBOL(phy_request_interrupt);
>  void phy_free_interrupt(struct phy_device *phydev)
>  {
>  	phy_disable_interrupts(phydev);
> +
> +	/* Re-enable a line left disabled by a postponed interrupt while it
> +	 * is still ours, and keep later postponed interrupts from disabling it.
> +	 */
> +	mutex_lock(&phydev->irq_pm_lock);
> +	if (atomic_xchg(&phydev->irq_rerun, 1)) {
> +		/* Wait for the handler that set irq_rerun to disable the line */
> +		synchronize_irq(phydev->irq);
> +		enable_irq(phydev->irq);
> +	}
>  	free_irq(phydev->irq, phydev);

[Severity: High]
Can the re-enable here livelock the PHY's own irq thread before
free_irq() is reached?

phy_request_interrupt() requests the line with a NULL primary handler
and IRQF_ONESHOT | IRQF_SHARED, so phy_interrupt() runs in an irq
thread that irq_thread() switches to SCHED_FIFO. The callers named in
the commit message run as SCHED_NORMAL tasks: dev_close() from the
ravb and cpsw suspend callbacks, and stmmac_reset_subtask().

Suppose irq_suspended is still true here, and the level source was not
cleared by phy_disable_interrupts(). The commit message allows for
that. It can happen if the MDIO write fails, since the return value is
ignored here. It can also happen if config_intr() masks without acking
the latched status, or if another sharer asserts the line. Then:

phy_free_interrupt()
  atomic_xchg(&phydev->irq_rerun, 1)   <- returns 1, line disabled
  synchronize_irq(phydev->irq)
  enable_irq(phydev->irq)              <- line unmasked, fires
    phy_interrupt()                    <- irq thread, SCHED_FIFO
      irq_suspended is true: postponed path
      atomic_xchg() returns 1, no disable_irq_nosync()
      pm_system_wakeup() / pm_wakeup_dev_event()
      return IRQ_HANDLED
    irq_finalize_oneshot()             <- line unmasked again
    line fires, IRQTF_RUNTHREAD set before the thread can sleep
    irq_wait_for_interrupt() returns at once, loop repeats
  free_irq(phydev->irq, phydev)        <- starved

phy_interrupt() keeps returning IRQ_HANDLED, so threads_handled keeps
advancing and note_interrupt() never treats the storm as spurious.

The irq thread and the caller can share a CPU, for example on a
uniprocessor system or with overlapping affinity. In that case the
SCHED_FIFO thread preempts phy_free_interrupt(), and free_irq() only
runs in whatever time RT throttling or the fair server hands back, if
any. That hangs or badly stalls the close in the MAC suspend callback
or in the reset worker. Each pass through the postponed path also
raises a wakeup event, which aborts the sleep transition in progress.

The commit message says the interrupt then fires until free_irq(), in
the same call, removes the handler. That assumes the caller keeps
running. With irq_rerun preset to 1, the handler has no way left to
take the line down again by itself.

How is the source expected to be quiet by the time enable_irq() runs?
Should phy_free_interrupt() skip the re-enable when
phy_disable_interrupts() fails? Or should it make sure the latched
status is acked first? Or is there a different way to hand the depth
back without unmasking the line under a handler that cannot quiet it?

[Severity: Medium]
Can this enable_irq() leave a still-asserted level interrupt unmasked for
the other users of a shared line?

phy_request_interrupt() always requests the line with IRQF_ONESHOT |
IRQF_SHARED. The postponed branch of phy_interrupt() returns IRQ_HANDLED
without calling drv->handle_interrupt(), so nothing reads or acks the
latched PHY status.

phy_free_interrupt() ignores the return value of phy_disable_interrupts().
That call is the only step here that deasserts the PHY's INT output. For
example, marvell_config_intr() returns right after a failed IMASK write,
before it acks the event register:

drivers/net/phy/marvell.c:marvell_config_intr() {
    ...
	} else {
		err = phy_write(phydev, MII_M1011_IMASK,
				MII_M1011_IMASK_CLEAR);
		if (err)
			return err;

		err = marvell_ack_interrupt(phydev);
	}
    ...
}

In that case the sequence would be:

phy_free_interrupt()
  phy_disable_interrupts()       <- fails, INT stays asserted
  enable_irq(phydev->irq)        <- line unmasked
  free_irq(phydev->irq, phydev)  <- removes only the PHY's action

If other sharers remain, free_irq() leaves the line enabled, and their
handlers return IRQ_NONE. Could the spurious IRQ detector then disable the
line for every sharer ("irq N: nobody cared")?

__setup_irq() only clears IRQS_SPURIOUS_DISABLED when another shared
handler is requested. Resume would not end that outage.

Before this patch, a disabled shared line stayed masked until
mdio_bus_phy_resume(). On the suspended_by_mdio_bus path, phy_init_hw()
quiets the source over MDIO before that enable_irq() runs.

The commit message says:

  On a level-triggered line whose source phy_disable_interrupts() did not
  clear, the interrupt then fires until free_irq(), in the same call,
  removes the handler.

Does that hold only when the PHY is the only user of the line? The
free_irq() kerneldoc also says that for shared lines "the caller must
ensure the interrupt is disabled on the card it drives".

> +	atomic_set(&phydev->irq_rerun, 0);
> +	mutex_unlock(&phydev->irq_pm_lock);
>  }
>  EXPORT_SYMBOL(phy_free_interrupt);
>  
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index d5d0efc104187..ef5e1cd3a8319 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -339,14 +370,7 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
>  	if (phydev->mac_managed_pm)
>  		return 0;
>  
> -	/* Wakeup interrupts may occur during the system sleep transition when
> -	 * the PHY is inaccessible. Set flag to postpone handling until the PHY
> -	 * has resumed. Wait for concurrent interrupt handler to complete.
> -	 */
> -	if (phy_interrupt_is_valid(phydev)) {
> -		WRITE_ONCE(phydev->irq_suspended, true);
> -		synchronize_irq(phydev->irq);
> -	}
> +	mdio_bus_phy_suspend_irq(phydev);

[Severity: Medium]
This isn't a bug introduced by this patch, but what happens to
irq_suspended if phy_suspend() fails at the end of mdio_bus_phy_suspend()?

drivers/net/phy/phy_device.c:mdio_bus_phy_suspend() {
    ...
	if (!mdio_bus_phy_may_suspend(phydev))
		return 0;

	phydev->suspended_by_mdio_bus = 1;

	return phy_suspend(phydev);
}

phy_suspend() can fail with -EBUSY when phydev->wol_enabled is set and the
driver lacks PHY_ALWAYS_CALL_SUSPEND. It can also return an error from the
driver's ->suspend(). In either case the PM core skips the resume callback
for this device, so nothing calls mdio_bus_phy_resume_irq() or
phy_start_machine().

Would every later PHY interrupt then take the postponed path in
phy_interrupt(), with the line disabled once and irq_rerun left at 1? And
would link handling stay stopped until a later suspend/resume cycle
succeeds?

This behaviour dates back to 1758bde2e4aa. A later patch in this series,
"net: phy: stop postponing PHY interrupts when a PHY PM callback fails",
adds the unwind. On a phy_suspend() failure it calls
mdio_bus_phy_resume_irq() and phy_start_machine(), and it sets
suspended_by_mdio_bus only on success.

>  
>  	/* We must stop the state machine manually, otherwise it stops out of
>  	 * control, possibly with the phydev->lock held. Upon resume, netdev

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261031-b4-phylib-mac-pm-irq-v3-v4-0-5ba23b3ff9a4%40iav.lv

