Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6506ACD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lraFz6oBhP7MmXTOPo6oBPAEVJFopwF4+HMSlIJwUjg=; b=g+jUKzcmsIgGw+MFy/0nun3JxZ
	PaWrtIHdZkCaMZKX4seJzaOyq/nBqdt0Lc/++ge9ylZQTk0k8nAbRKIgjE9f8k9BN7xPAVLh7t3rx
	D8afm/KG2i9jO5wdsZAZy57MdguJ58iMneoUK8/U8eGbJGQNfLDyoCIPpNVijYxEadq7nZzz6tQDl
	KZbNikVfa5bcQliediZa+5aeHDn6KOI1KqjqQxao/V1YTadgj0Lo5WlRUD+27rLbRy2cXBSxVEeMa
	MtZLfG/L7Gu6/CZgUkW0dEsxBolRq1tmptKktIbryegoLc07ckByzGy+VUPmEwafEq9VXNm9iqO6d
	kvOmwJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFoM-0000000GL8E-29Vp;
	Tue, 05 May 2026 13:27:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFoJ-0000000GL7F-0NI3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:27:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso2339841f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777987656; x=1778592456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lraFz6oBhP7MmXTOPo6oBPAEVJFopwF4+HMSlIJwUjg=;
        b=bjeLfe2+fjCUH0dVWJYt7fdREXGkIyBLlBVQPVSHF3MoQT19VT0tEMwNOiExev0qXE
         2JIop2SvZjX0b5oeogJlR+PUkapMDv/94Fb+z5y+Afle+j9EMMJPkrfvU2XgE7ldnF1T
         qX/uVbR/KUAtZgFkDGV+Ycse40irepLQ4a7GafryO9T3sCVAHz18XlRgg52Ev2vgIuS5
         qhCnSbGvbSW5w4CvC6rZnZDjTuxQPjqlFvYZ28WPUdZ0nQTwnu2hCBIeQgeVy1XSSIth
         qsgPneU+8ubfWp3XwyFfGQIzOx+zPvG9408hCWe6hHf0guZyg4pI2rG16h2qovd6HtZy
         EQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987656; x=1778592456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lraFz6oBhP7MmXTOPo6oBPAEVJFopwF4+HMSlIJwUjg=;
        b=Atfdwg80UZHBeqRN+ScdrWf1lFaarMy7wAgAu4+Wsm+rNWuKD4Azte01RadVpTJjr8
         90y41389pYXCVzTYgyRD8K/03E+SsZ8TX9iYZ22pPiHk29IZ0VNk5UiWpnSi3mUL9Ut8
         +oXEDBUFXAFcLOe/cyX/ORJU7qptEj+t25EBBP7xm2+tBzo+vMZDVNhGUFgyVpqbBh1D
         zEuEZe6dK6qiedMwfbTWlEeDxfMFVi0a+XSO8kTIRwVqfX7XJ2H6m1XJTXCFeehMsruB
         uDDKnfZ50JzSt5mbSc3VwFZhKUXAq9qEJkwHuQUHaVFes1a3vadkS1XMsfx/r2NTp1n1
         cKTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w9fYgE3BTAinsOmf9nlg1YPdcF6x6+o0vcaA/Q9bFoOFnmNTxU7LsZVpzWUe+n/IkIq5TW13x0V+WytThklkI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0/UGWCd7rjE4hEoiLjHZAwGXBTuAvreq5eg3dDayIk9lIhNst
	kgYC+hoUbgMtypWtt8Xx6DaG9pKQ0/YceVkUSVe4ry5C849gjN19VvxFlF59R+dlFLs=
X-Gm-Gg: AeBDieull1BNa0keFO1Hqw1fuvXQaSoJpr1Ep+d+TAk6sIsd6Zo5WnRWxG2auexnx+2
	YuXmAs316NdhGj2L90tB81e6X/e3ONLTIY2/hhQSFjDOluFYZhK2S3JshLfodvSRTg2C9Tg2CGP
	P8Y0ThWGMNiXdWf9qwUBzwIuIRYN7wngYVwJkO9tgrL1cHD/QWTM7GdQejk6Ar+jc/RTjVnuReI
	3MgLWdXc61S27emXuaa1x4RnX7lFWPWhl+u3lUj61l9XvlmCaByz4lUpF3eeJDOWn1yYfd9TmP+
	7dI+TD2wGMUZ7RPPjxHAWdj49z8be2zS9k5zi2bCz3B82Ebs4pMH01oPy0r874EatJ1XGo4Pk9a
	cjq0GG7qGFELkYoHT8aqgnlQuQT+9fW8dX0aDBEVjwZ6TivGvDrVZDwMDi9GxEx3oSCmkCxOHgz
	WXL+BaGw+D1lS4KuNo282h/DdqiWi5awnxKQcstJh4MR1w0a/V7h1iliHIypVue9jM1CMgRPvXb
	mFi4aI9HbUG0XilsQ==
X-Received: by 2002:a05:6000:18a5:b0:449:c5e2:a8b7 with SMTP id ffacd0b85a97d-450060571bemr5745163f8f.30.1777987656056;
        Tue, 05 May 2026 06:27:36 -0700 (PDT)
Received: from localhost (host-79-47-155-212.retail.telecomitalia.it. [79.47.155.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm4650340f8f.26.2026.05.05.06.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:27:35 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 5 May 2026 15:30:51 +0200
To: Lukasz Raczylo <lukasz@raczylo.com>
Cc: netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [RFC PATCH net-next 3/3] net: macb: add TX stall watchdog as
 defence-in-depth safety net
Message-ID: <afnxC-Lk5LELsm42@apocalypse>
References: <cover.1777064117.git.lukasz@raczylo.com>
 <c0469642f42ada85d91a8a685eb7c0e04cb99131.1777064117.git.lukasz@raczylo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0469642f42ada85d91a8a685eb7c0e04cb99131.1777064117.git.lukasz@raczylo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_062739_161753_E3F79F01 
X-CRM114-Status: GOOD (  39.34  )
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

On 23:38 Fri 24 Apr     , Lukasz Raczylo wrote:
> Patches 1/3 and 2/3 address two candidate races that could lead
> to a TCOMP completion being missed on PCIe-attached macb
> instances.  This patch adds a defence-in-depth safety net, in
> case a further race remains that we have not identified.
> 
> The watchdog is a per-queue delayed_work that runs once per
> second.  It snapshots queue->tx_tail; if the ring is non-empty
> (queue->tx_head != queue->tx_tail) and tx_tail has not advanced
> since the previous tick, it calls macb_tx_restart().
> 
> No new recovery logic is introduced.  macb_tx_restart() already
> exists in this file, is correctly locked (tx_ptr_lock, bp->lock),
> and verifies that the hardware's TBQP is behind the driver's
> head index before re-asserting TSTART.  On a healthy ring it is
> a no-op at the hardware level; the watchdog only supplies the
> missing trigger.
> 
> On a healthy queue the per-tick cost is one spin_lock_irqsave()
> / spin_unlock_irqrestore() and one branch.  The delayed_work is
> only scheduled between macb_open() and macb_close(), and is
> cancelled synchronously on close.
> 
> Context for submission: on our 24-node Raspberry Pi 5 fleet,
> before this series, an out-of-band user-space watchdog
> (monitoring tx_packets from /sys/class/net/.../statistics and
> toggling the link down/up when it froze) was required to keep
> nodes usable.  We include this kernel-side watchdog as a cleaner
> in-kernel equivalent for any residual stall that patches 1 and
> 2 do not cover.  We are willing to drop this patch if the view
> is that 1 and 2 should stand alone.
> 
> Link: https://github.com/cilium/cilium/issues/43198
> Link: https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2133877
> Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
> ---
>  drivers/net/ethernet/cadence/macb.h      |  5 ++
>  drivers/net/ethernet/cadence/macb_main.c | 59 ++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index 2de56017e..9115f2b47 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -1278,6 +1278,11 @@ struct macb_queue {
>  	dma_addr_t		tx_ring_dma;
>  	struct work_struct	tx_error_task;
>  	bool			txubr_pending;
> +
> +	/* TX stall watchdog -- see macb_tx_stall_watchdog() in macb_main.c */
> +	struct delayed_work	tx_stall_watchdog_work;
> +	unsigned int		tx_stall_last_tail;
> +
>  	struct napi_struct	napi_tx;
>  
>  	dma_addr_t		rx_ring_dma;
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index ea231b1c5..ea2306ef7 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -2002,6 +2002,59 @@ static int macb_tx_poll(struct napi_struct *napi, int budget)
>  	return work_done;
>  }
>  
> +#define MACB_TX_STALL_INTERVAL_MS	1000
> +
> +/*
> + * TX stall watchdog.
> + *
> + * Defence-in-depth against lost TCOMP interrupts.  macb already has a
> + * recovery chain (tx_pending -> txubr_pending -> macb_tx_restart())
> + * that fires on TCOMP; if TCOMP itself is lost the TX ring stalls
> + * silently until something else kicks TSTART.  This watchdog runs
> + * once per second per queue, snapshots tx_tail, and calls
> + * macb_tx_restart() if the ring is non-empty and tx_tail has not
> + * advanced since the previous tick.
> + *
> + * macb_tx_restart() already checks the hardware's TBQP against the
> + * driver's head index before re-asserting TSTART, so on a healthy
> + * ring this is a no-op at the hardware level.  The watchdog only
> + * adds the missing trigger.
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
> +	spin_lock_irqsave(&queue->tx_ptr_lock, flags);
> +	cur_tail = queue->tx_tail;
> +	cur_head = queue->tx_head;
> +	if (cur_head != cur_tail &&
> +	    cur_tail == queue->tx_stall_last_tail)
> +		stalled = true;
> +	else
> +		queue->tx_stall_last_tail = cur_tail;
> +	spin_unlock_irqrestore(&queue->tx_ptr_lock, flags);
> +
> +	if (stalled) {
> +		netdev_warn_once(bp->dev,
> +				 "TX stall detected on queue %u (tail=%u head=%u); re-kicking TSTART\n",
> +				 (unsigned int)(queue - bp->queues),
> +				 cur_tail, cur_head);
> +		macb_tx_restart(queue);
> +	}
> +
> +	schedule_delayed_work(&queue->tx_stall_watchdog_work,
> +			      msecs_to_jiffies(MACB_TX_STALL_INTERVAL_MS));
> +}
> +
>  static void macb_hresp_error_task(struct work_struct *work)
>  {
>  	struct macb *bp = from_work(bp, work, hresp_err_bh_work);
> @@ -3190,6 +3243,9 @@ static int macb_open(struct net_device *dev)
>  	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
>  		napi_enable(&queue->napi_rx);
>  		napi_enable(&queue->napi_tx);
> +		queue->tx_stall_last_tail = queue->tx_tail;
> +		schedule_delayed_work(&queue->tx_stall_watchdog_work,
> +				      msecs_to_jiffies(MACB_TX_STALL_INTERVAL_MS));
>  	}
>  
>  	macb_init_hw(bp);
> @@ -3240,6 +3296,7 @@ static int macb_close(struct net_device *dev)
>  	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
>  		napi_disable(&queue->napi_rx);
>  		napi_disable(&queue->napi_tx);
> +		cancel_delayed_work_sync(&queue->tx_stall_watchdog_work);
>  		netdev_tx_reset_queue(netdev_get_tx_queue(dev, q));
>  	}
>  
> @@ -4802,6 +4859,8 @@ static int macb_init_dflt(struct platform_device *pdev)
>  		}
>  
>  		INIT_WORK(&queue->tx_error_task, macb_tx_error_task);
> +		INIT_DELAYED_WORK(&queue->tx_stall_watchdog_work,
> +				  macb_tx_stall_watchdog);
>  		q++;
>  	}
>  
> -- 
> 2.53.0
>

I've applied all three patches to v6.19.10 changing netdev_warn_once() from this one to
netdev_warn() and it the "TX stall" warning appears several time. So it seems that there
could be another cause escaping the filtering in the first two patches.

Interestingly enough, running the same tests after substituing the entire macb driver with
the downstream version works ok.

Not sure how to interpret these results since they seem to be the opposite of yours.
More investigation is ongoing from my side.

Thanks,
Andrea

