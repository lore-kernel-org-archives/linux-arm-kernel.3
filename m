Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CDEC98324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kw7fCq2tAP6shzD4hEnIRaBnhicH7vAPWucV0s/ym6M=; b=BcdbhoOpyEfrQSl/4nAWRQt8X1
	YJCxHOeDEJ753O5HhZmpfQEiPpWrEqzU7t3cas9dqO/yZnfNljTEXA3uvqLDATVip56dqIMJae/Jy
	5g/9tk5mDz23RR6gKnkN1Pg+pW04Y8Cuey3BjoRlXHU4Mfzg7NLa/mD472Nb4VIh3ij/6DySYgrwC
	gKGxMB5Dikco6K1dC+Ek4qZo5QH59fjQBlGDtFh7htxnqW1uVAUY75n0IpueREW4MQ2VavMhmbs2P
	ijZF4kUMKK7T/PtWjbIhz4Q3d8TqWJQ6auQkMBgvWEmrNyCBQIpyeGVg9SgrXmyAluQCBnMSht6My
	Mcn7XDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Lo-0000000DUZ1-41j0;
	Fri, 25 Sep 2026 13:52:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Ll-0000000DUXO-2Kn3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:52:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05F18602C5;
	Fri, 25 Sep 2026 13:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9661F00893;
	Fri, 25 Sep 2026 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790344348;
	bh=Kw7fCq2tAP6shzD4hEnIRaBnhicH7vAPWucV0s/ym6M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NSNkHMwNACBGBo3GRBR6ungCcNwdsrdoR0QZxybVOVrGN/g/zJ6qIkIMaoIsF7/IY
	 abSbjNxXSrpOjNH/7aZq6yoL5edgwjbF20/MVxYEw8fRb3wdy9sOXdNy08mky7PH1C
	 H329G79bsi4Naj1hqZOR0iOU0ceJFUcVMjiFjuxUpsM1EdNcKtlYdETfkaoiVjDdgI
	 7rtiI0+aAEAPH3Qv0L5nQN/F/rypPHUw+U7Hkd+L1iDskM4psLcuI1CIx/Q8aexcEI
	 bnAqdO3ZzXVH2r3XiBb8whvg+Kzo2+VsCLT86zUNQ5cF7PXcA0kqWtY6feT2MN86GO
	 l+TGjZ3k3mhpQ==
Subject: Re: [PATCH net v2 4/4] net: axienet: reprogram the link settings
 after a DMA error reset
From: netdev-bot+sashiko@kernel.org
To: maimon.sagi@gmail.com
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 daniel@iogearbox.net, andybnac@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 25 Sep 2026 13:52:27 +0000
Message-ID: <179034434763.2160803.1935314662107834629@kernel.org>
In-Reply-To: <20260924135116.185161-5-maimon.sagi@gmail.com>
References: <20260924135116.185161-5-maimon.sagi@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In axienet_dma_err_handler()
  (drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2804-2811), the new…

--

net: axienet: reprogram the link settings after a DMA error reset

axienet_dma_err_handler() resets the AXI Ethernet core but never restores
the link speed in XAE_EMMC, and it leaves XAE_FCC with only FCRX set. This
patch calls phylink_mac_change(lp->phylink, false) at the end of the
handler, so phylink takes the link down and back up and reruns
axienet_mac_link_up(). The call uses the same condition as the queue wake.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index f16dbfc7dc933..d53f7dc7bd223 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2801,8 +2801,15 @@ static void axienet_dma_err_handler(struct work_struct *work)
>  	 * device was detached for suspend: axienet_stop() and axienet_open()
>  	 * own the queue state then.
>  	 */
> -	if (!READ_ONCE(lp->stopping) && netif_device_present(ndev))
> +	if (!READ_ONCE(lp->stopping) && netif_device_present(ndev)) {
> +		/* The reset also cleared the link speed and pause settings,
> +		 * which only axienet_mac_link_up() programs.  Have phylink take
> +		 * the link down and up again so that it is called.  This must
> +		 * follow the axienet_setoptions() above, which writes XAE_FCC.
> +		 */
> +		phylink_mac_change(lp->phylink, false);

[Severity: Medium]
Can the netif_device_present() check skip the relink during resume, even
though phylink is already running at that point?

The commit message says:

    Skip it under the same conditions as the queue wake:
    axienet_stop() stops phylink, and a resume restarts it.

In axienet_resume(), though, phylink is restarted before the device is
attached:

axienet_resume()
    rtnl_lock();
    axienet_open(ndev);
        axienet_device_reset(ndev);
        phylink_start(lp->phylink);
        axienet_init_legacy_dma(ndev);
            lp->stopping = false;
            request_irq(lp->tx_irq, ...);
            request_irq(lp->rx_irq, ...);
    rtnl_unlock();

    netif_device_attach(ndev);

Consider this sequence inside that window:

1. phylink resolves the link and calls axienet_mac_link_up(). With a
   fixed-link or in-band PCS this can happen quickly.
2. A TX or RX DMA error interrupt schedules dma_err_task.
3. axienet_dma_err_handler() resets the core through axienet_dma_stop(),
   which clears the XAE_EMMC speed. It also rewrites XAE_FCC to FCRX only.
4. The handler reaches the final check before netif_device_attach() has
   run. It sees lp->stopping == false but netif_device_present() == false,
   so it skips phylink_mac_change().

netif_device_attach() then wakes the TX queue, so the queue wake gets a
second chance. Nothing reruns axienet_mac_link_up(), so the MAC stays at
its reset-default speed and pause settings. That is the state this patch
is meant to fix.

phylink already ignores the notification while it is stopped:

phylink_run_resolve()
    if (!pl->phylink_disable_state)
        queue_work(system_power_efficient_wq, &pl->resolve);

axienet_stop() also sets lp->stopping and calls
flush_work(&lp->dma_err_task) before it calls phylink_stop().

Would it be enough to gate phylink_mac_change() on !lp->stopping alone,
and keep the netif_device_present() check only for netif_wake_queue()?

>  		netif_wake_queue(ndev);
> +	}
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924135116.185161-1-maimon.sagi%40gmail.com

