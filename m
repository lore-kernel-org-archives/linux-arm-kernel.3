Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C794CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMdIpYV9sY3lwrEiDRBN2/4tJkpR6wJ/JxpON8KGBwM=; b=hiDvDevEBbwa527Iv3DDuCBD7O
	r7/bS9J8dCUpnJHuWVaXPVMpkzKtRykFghJMgYBd3DcRJ5kQas3Z2Sj8wT7lYwEFSnj3g3jD8F7D3
	PLHlsEO47QkE7hfe/1HGgRk2faN1A+P9uhfQ1nURQBAZHxtkjnrMJdHBFKn5N2usm0DznfnZ3OSwN
	0rWUz7bGogBMD1zrZKYnhwmT2kaWqLQy1G2B2blwpRmsRog0/nTXH7Ytx9H7FNf5DDZFibamzkcEN
	ZnQgC6IsJGqpkbJpaNi+vBrYkQfL6QuvFqf7baWepz/C9gTSXksl5CC33A+CFCyMzkg3b/WI/MXe1
	uN3DBz1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdEv-00000005xs4-2VsW;
	Thu, 28 May 2026 16:05:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdEt-00000005xqe-07om
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:05:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so68657785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 09:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779984340; x=1780589140; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMdIpYV9sY3lwrEiDRBN2/4tJkpR6wJ/JxpON8KGBwM=;
        b=FDGopxvX4J1C5uKy+tOAcq0w6uegP4QmaaQDY9T9a+zclqhWEehgslVTTOvoOeDR17
         KdCtsFobS23x9pNucekSSZ2UhKE2Nk8w/oBwJavZGMm11VmfJ2dUB3O/qEEEGs10sHrn
         njlumaCXaa91a7vrkEbk/fwnCqBPm0l5UZW9QwBW3lrcDI0iSXYhqjksly1VXUcXxpzk
         9XW+eSzOGRvw7iQ3aWB6NYWyKg2dwB2NWoc01dZj2LDB45AUCQ3xDJ8ca8vVJUMIokRA
         I2biY5mD5EB5pzlYAOQ4KnzUnBcPBUwd7EqbV/n3s6bFnllJLGmMgCu62fbxK0vul9NM
         59qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984340; x=1780589140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMdIpYV9sY3lwrEiDRBN2/4tJkpR6wJ/JxpON8KGBwM=;
        b=mvW6byNKLrW/jOKxNu6EoZkWX5UJlMtqNsCSM2vcmL3lL22zIWW+h8kLjB/mn/Z95S
         in2va8WrCHRa3wpmKr2WazaBNsIoAPW4TaKKcXO4UP4YF0Bs5Nj0nCFGzhFACGCZ3ekL
         7lLuF0J/37+OF64dLpZRx3qsB+LvSupLdRsC4/pBYeA3nx/0whWncRJn0s3OTjvTK1+C
         0qAUe1eikaXqKCFLSFNpyVqHp0oJM07GqvY460frGG8qVbfi3IlLpLasxftbcM7+s4IX
         80IOvY1zgomBSjPvvFb/WA0Lybmha7CDtKPgoSLTDv0q7xOtfzchQE/tsw1Xey+deGAm
         1tUA==
X-Forwarded-Encrypted: i=1; AFNElJ8HJBZPl04q4QHcJq2WRvwm7Coh3WS1jiM7Ea8skk7YleavT6soeK3etvy5LTXsr2G1EquG/rPF1Ou1x3q0J3Id@lists.infradead.org
X-Gm-Message-State: AOJu0YzSSHXK2fAvCZlQWarKy11PlqCChI+BOxo3RxZN4MWrN56qI+6+
	TsMuwBeMR98f/n27CXZ4lbnnOOaKJwpDBTTL+2Nu0U07LDlQrugQLSg8yxSjCWCVuV0=
X-Gm-Gg: Acq92OGWs62PaXXo1Rcbg7PnkRQgT4FWhvXrqHFaMw7dITEugLLYYE/D4d0ojAkyqQA
	BYX8JNLCV1WCQyldnxAaQFh6u6/Kps7wGR/4gmb/TKiBMakLQ9MaqTIhW9bB9XadulCQurHFfLM
	LaKkH9vxCD5KjZFD7iWhZUBhj0tTiV72AU+GB89te8JqRCvv+vwPr8wHdOuFBV0LB76ZjzWndhc
	uZdT4jVXwcRe7HT3CDTwLZRGeLVY/15WxYOqaoQ8e0Q8sScRSHFB3bDDsleKpBm0XkQ2YI3X4W0
	X1FWPXmVLoThRuQCBSU5X5J3SxjDoo+vogenes0ffrmP6RdzkMwek+1HQVWGzCWvtIPdZUzlUPi
	B4gysm//BPEd1lc5pxc1Y4idMk9Aloyd3BfzMtD0sFRA47UzfrMkCO3IsHA8ynYwilRU2Tjfii9
	pTsxbuO1qk8e7rN9rI3RreFkDkuUdFcvuqsA==
X-Received: by 2002:a05:600c:1d0e:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-4909479e30emr27991125e9.5.1779984340104;
        Thu, 28 May 2026 09:05:40 -0700 (PDT)
Received: from localhost ([194.183.24.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a2c87sm14475474f8f.17.2026.05.28.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:05:39 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 28 May 2026 18:08:59 +0200
To: Lukasz Raczylo <lukasz@raczylo.com>
Cc: netdev@vger.kernel.org, Theo Lebrun <theo.lebrun@bootlin.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 3/3] net: macb: add TX stall watchdog to
 recover from lost TCOMP interrupts
Message-ID: <ahhom_0PJtqnXsv5@apocalypse>
References: <cover.1777064117.git.lukasz@raczylo.com>
 <20260514215459.36109-1-lukasz@raczylo.com>
 <20260514215459.36109-4-lukasz@raczylo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514215459.36109-4-lukasz@raczylo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_090543_109217_A780106F 
X-CRM114-Status: GOOD (  41.68  )
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

Hi Lukasz,

On 22:54 Thu 14 May     , Lukasz Raczylo wrote:
> On PCIe-attached macb instances (BCM2712 + RP1 PCIe south bridge
> on Raspberry Pi 5 is the case I have in front of me), a TCOMP
> interrupt can be lost: the TSTART doorbell can be lost in the
> posted-write fabric (addressed by an earlier patch), or the
> descriptor TX_USED DMA write can be observed late by the driver
> (also addressed earlier).  When that happens the TX ring stalls
> silently until something else kicks TSTART.
> 
> Add a per-queue delayed_work that runs once per second.  It
> detects forward progress on the TX completion path via a per-queue
> bool tx_stall_tail_moved that macb_tx_complete() sets when tx_tail
> advances and the watchdog clears on each tick.  If the ring is
> non-empty (queue->tx_head != queue->tx_tail) and the flag is
> unset when the tick runs, the watchdog calls the existing
> macb_tx_restart() to re-assert TSTART.
> 
> The bool form (rather than a tx_tail snapshot) sidesteps any
> concern about ring-index aliasing between ticks and is the form
> suggested by Phil Elwell when reviewing the same series anchored
> against rpi-6.18.y at raspberrypi/linux#7340 (merged 2026-05-08).
> 
> No new recovery logic is introduced.  macb_tx_restart() already
> exists in this file, is correctly locked (tx_ptr_lock, bp->lock),
> and verifies that the hardware's TBQP is behind the driver's head
> index before re-asserting TSTART.  On a healthy ring it is a
> no-op at the hardware level.
> 
> Cost on a healthy queue: one spin_lock_irqsave / spin_unlock and
> two field assignments per tick.  The delayed_work is only
> scheduled between macb_open() and macb_close() and is cancelled
> synchronously on close.
> 
> A netif_carrier_ok() gate at the top of the tick skips the stall
> check when there is no carrier (no completion is possible without
> a link), eliminating a boot-time false positive where queue->tx_head
> can advance from kernel-queued packets between macb_open() and link
> autoneg completion, while tx_tail stays unchanged because no TCOMPs
> have arrived yet.
> 
> netdev_warn_ratelimited() is used rather than netdev_warn_once() so
> operators can count occurrences across the lifetime of the netdev.
> 
> Link: https://github.com/cilium/cilium/issues/43198
> Link: https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2133877
> Link: https://github.com/raspberrypi/linux/pull/7340
> Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
> ---
>  drivers/net/ethernet/cadence/macb.h      | 10 ++++
>  drivers/net/ethernet/cadence/macb_main.c | 72 ++++++++++++++++++++++++
>  2 files changed, 82 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index ce9037f9e..75df0f75b 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -1282,6 +1282,16 @@ struct macb_queue {
>  	dma_addr_t		tx_ring_dma;
>  	struct work_struct	tx_error_task;
>  	bool			txubr_pending;
> +
> +	/* TX stall watchdog -- see macb_tx_stall_watchdog() in macb_main.c.
> +	 * tx_stall_tail_moved is set by macb_tx_complete() when tx_tail
> +	 * advances and cleared by the watchdog tick on each pass (both
> +	 * under tx_ptr_lock).  Using a bool sidesteps any ring-index
> +	 * aliasing concern between ticks.
> +	 */
> +	struct delayed_work	tx_stall_watchdog_work;
> +	bool			tx_stall_tail_moved;
> +
>  	struct napi_struct	napi_tx;
>  
>  	dma_addr_t		rx_ring_dma;
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index f7fa9e7ad..8245c69e1 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -1473,6 +1473,8 @@ static int macb_tx_complete(struct macb_queue *queue, int budget)
>  				  packets, bytes);
>  
>  	queue->tx_tail = tail;
> +	if (packets)
> +		queue->tx_stall_tail_moved = true;
>  	if (__netif_subqueue_stopped(bp->dev, queue_index) &&
>  	    CIRC_CNT(queue->tx_head, queue->tx_tail,
>  		     bp->tx_ring_size) <= MACB_TX_WAKEUP_THRESH(bp))
> @@ -2003,6 +2005,70 @@ static int macb_tx_poll(struct napi_struct *napi, int budget)
>  	return work_done;
>  }
>  
> +#define MACB_TX_STALL_INTERVAL_MS	1000
> +
> +/*
> + * TX stall watchdog.
> + *
> + * Recovers from lost TCOMP interrupts on PCIe-attached macb
> + * instances.  macb already has a recovery chain
> + * (txubr_pending -> macb_tx_restart()) that fires on TCOMP; if
> + * TCOMP itself is lost the TX ring stalls silently until something
> + * else kicks TSTART.  This watchdog runs once per second per queue
> + * and calls macb_tx_restart() if the ring is non-empty and
> + * tx_tail has not advanced since the previous tick.
> + *
> + * Movement is tracked via the tx_stall_tail_moved boolean rather
> + * than a tx_tail snapshot, sidestepping any ring-index aliasing
> + * concern.  The bool is set by macb_tx_complete() when tx_tail
> + * advances and cleared here on each tick; both writes are under
> + * tx_ptr_lock so no atomic is required.
> + *
> + * macb_tx_restart() already checks the hardware's TBQP against
> + * the driver's head index before re-asserting TSTART, so on a
> + * healthy ring this is a no-op at the hardware level.  The
> + * watchdog only supplies the missing trigger.
> + */
> +static void macb_tx_stall_watchdog(struct work_struct *work)
> +{
> +	struct macb_queue *queue = container_of(to_delayed_work(work),
> +						struct macb_queue,
> +						tx_stall_watchdog_work);
> +	struct macb *bp = queue->bp;
> +	unsigned int cur_tail, cur_head;
> +	bool stalled = false;
> +	unsigned long flags;
> +
> +	if (!netif_running(bp->dev))
> +		return;
> +
> +	/* No carrier => no completion is possible.  Skip the check
> +	 * but keep the watchdog ticking for when carrier comes up.
> +	 */
> +	if (!netif_carrier_ok(bp->dev))
> +		goto reschedule;
> +
> +	spin_lock_irqsave(&queue->tx_ptr_lock, flags);
> +	cur_tail = queue->tx_tail;
> +	cur_head = queue->tx_head;
> +	if (cur_head != cur_tail && !queue->tx_stall_tail_moved)
> +		stalled = true;
> +	queue->tx_stall_tail_moved = false;
> +	spin_unlock_irqrestore(&queue->tx_ptr_lock, flags);
> +
> +	if (stalled) {
> +		netdev_warn_ratelimited(bp->dev,
> +					"TX stall detected on queue %u (tail=%u head=%u); re-kicking TSTART\n",
> +					(unsigned int)(queue - bp->queues),
> +					cur_tail, cur_head);
> +		macb_tx_restart(queue);
> +	}
> +
> +reschedule:
> +	schedule_delayed_work(&queue->tx_stall_watchdog_work,
> +			      msecs_to_jiffies(MACB_TX_STALL_INTERVAL_MS));
> +}
> +
>  static void macb_hresp_error_task(struct work_struct *work)
>  {
>  	struct macb *bp = from_work(bp, work, hresp_err_bh_work);
> @@ -3192,6 +3258,9 @@ static int macb_open(struct net_device *dev)
>  	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
>  		napi_enable(&queue->napi_rx);
>  		napi_enable(&queue->napi_tx);
> +		queue->tx_stall_tail_moved = true;
> +		schedule_delayed_work(&queue->tx_stall_watchdog_work,
> +				      msecs_to_jiffies(MACB_TX_STALL_INTERVAL_MS));
>  	}
>  
>  	macb_init_hw(bp);
> @@ -3242,6 +3311,7 @@ static int macb_close(struct net_device *dev)
>  	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
>  		napi_disable(&queue->napi_rx);
>  		napi_disable(&queue->napi_tx);
> +		cancel_delayed_work_sync(&queue->tx_stall_watchdog_work);
>  		netdev_tx_reset_queue(netdev_get_tx_queue(dev, q));
>  	}
>  
> @@ -4804,6 +4874,8 @@ static int macb_init_dflt(struct platform_device *pdev)
>  		}
>  
>  		INIT_WORK(&queue->tx_error_task, macb_tx_error_task);
> +		INIT_DELAYED_WORK(&queue->tx_stall_watchdog_work,
> +				  macb_tx_stall_watchdog);
>  		q++;
>  	}
>  
> -- 
> 2.54.0
>

Has this patch seen a V3 version? I guess the only thing it's needed
is something like this:

static void macb_tx_timeout(struct net_device *dev, unsigned int txqueue)
{
        struct macb *bp = netdev_priv(dev);
        macb_tx_restart(&bp->queues[txqueue]);
}

and then setting .ndo_tx_timeout = macb_tx_timeout in macb_netdev_ops.

Many thanks,
Andrea

