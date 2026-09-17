Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA11C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYijwURBgre4NraXqG8mIJdmB3HdAUmRokXImKMdIY4=; b=rq5GejWPX9HUj7KoOy/wgUt31R
	v6d0EdENyhDJSGsJDO9DwpaZWZxQBLoU/EsBxSrIE6wCLJ5aQstMwtutcXn1YDNNpkhu6CS8vfZAB
	FYJM9+wabZumPMDzTOm+FO2RIfH6O+iHlX98aiP730nCN6QeNxruNKhaylnsJJoUce4IKxEi5TKfM
	Xekw/YTUF1PLjVeQZuI85yP52/Kbda8iKTic/0USojxoDlt42XPDveWkespUIuWxnU+LZmd7ghsO3
	WJOMfF0borMjm2xMXdMjuKgRFA62jtvzfIf/UIhyMkUFfR6uZMNX+6mvdF5WMEkkNqzz4IdcBdk+B
	yeTsFx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B6p-0000000BGxz-1CTe;
	Thu, 17 Sep 2026 12:20:59 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B6j-0000000BGv0-0fGx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:20:57 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso937442e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789647651; cv=none;
        d=google.com; s=arc-20260327;
        b=RuSSxjN0ZL0w56zMY6a7k2qaxTxHANVnREBMu2SeQhuNcqXiWLLB7E0JK+d2OtLPrI
         HTogsopX4BNk59+burjPt7nDlZ10rNIWaJLulgXHCxuPp95F4oT5vD03H6bb31aybPCt
         uY+e4y45LcHM6cPLVKGO6bQq8DyqqCPAZIqgizJqyMedS7zeOhSGPiG+M912xd6uDKcO
         Rjqf7xEeOpPcuAHSDB+WtbOCXWDLnLcEF79AtWbpPxVAVKdOBDONxD55Ju0M+vArvwnS
         /cdfOEu/eYdHiEHdn9X3LOdeSpQ/3OgOUGJbmZCPsl6fZos76kAsSMxncbO7T+qFzg1F
         GS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tYijwURBgre4NraXqG8mIJdmB3HdAUmRokXImKMdIY4=;
        fh=xIIdZhOIDIbNg8ViiMJxyajCVZcnF6FuzdCOC25qBdQ=;
        b=OuFlKwvT58uC2s/ZwLDtlPbh2E+7nzHNYd/zXYO5qwyHEv23IIhmErGlE+xDO8FX7u
         Xdd42vIbnR065N4Kc9h+zO7zHJV2+VDWnb95oSGkBXMui4aD1CxQHwRAnnr9Mh1pNcor
         PzHdKJssMVcFE8ykopbiYXIvyamaYQGmxEeCbe75Q8u1D6dSDqPzes8OJdP6QxOwhuXW
         YUmJFupPt9oryRiYwSXyFob8YfISDgiYeW8uYx7pkQAMZ6A504740xE+Zwjsr29iAKLt
         MK8X8ia53pRW0SSuzICOsbxYQSfIRTkSbbmP+zXZF1fyJl1Q2Grl4SWoQmRnOogMj6ZI
         hyWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647651; x=1790252451; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tYijwURBgre4NraXqG8mIJdmB3HdAUmRokXImKMdIY4=;
        b=jPZVxIrmKd5XTmGUdivZ4vy/NjaCt9ZiNiHOp4CE4SQjb9Pg04e5bk+B6GwTUlu1DS
         juGNcjM4t5LEznp3HYofNOkaREBXxJI/dR7krxfTFzwk1sD2NlJnS+YItLrDkoPbjIbJ
         r8KnHnZtKkG8UUcnnEYP/HqtLv8MxI/OYRcO1i2IY6WD4o7f18MD/p9W9m6NfX0uXA3/
         RgK/VX8plZKZRdyq5W/yHNIdZWcsJmqIt0UcxumeTcMUn7KyFxTE6uqIKXdCilot44mN
         bLLH9WuSUgvgVOEe39Ls57r9351aO5oMoQ/kc0gQeRCgQyuKZ0UXs9M5gmLzXcCYe11M
         PTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647651; x=1790252451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYijwURBgre4NraXqG8mIJdmB3HdAUmRokXImKMdIY4=;
        b=SBvWr5mZ9qkymL8ujMLKq5tc/y0LHRS/kcE0CvJrLDNP1R6r8Had8qOooOp7vRj9ma
         4yo5R6OLBrYFkzSL8crOZFz5PrmBocNzvh/op9OL0eQgfX9FgPuX5bCid0t4hWyPrAHU
         htOoWc2RHEBu//i8X+0/j0q86knKYjR17pACd3WUy+FPCI+b0+/1vAyHpbsuZyZYDQsZ
         HW6b3dF6lAT9zr7M0e4O1n0X2LbrVutTx/vBxQwHn8qxFfM+GVexoS+39sc/vXb7J+KU
         AASVePY/v8n23N4x6CRxnjDDGKmzihoC3EvTPeucfqpvm2vY7yq1/B+186Qm9TxXcmQ0
         5pZQ==
X-Forwarded-Encrypted: i=1; AKwUvByiGH5LAtDSRYpPxAGeWUQKcCEpHtKA9Y6STHFePNr9SxWmymXvdSd8jmDW2tbidWpNCKMM4Zybt9dAa3n6T6sK@lists.infradead.org
X-Gm-Message-State: AFuF++mfnO4V1Lgw3OrAj089l/iiPBRVOZ9L9db4cq/JkS++lYpqUaO9
	ez55ay8dKYIhVbjpQ/PxUKFnGmU086Ptnr8L3bQyeD1FTOy5BekgNIV4rTpz399uyOWGggpvNLL
	9DQCTy7RBVcj9StAgdSptjEsjBlaRxu3jysK56MQ=
X-Gm-Gg: AYBFou0bsF0lyjrcRMY5lF5jkTmisexf/xrzNOf5pw5UPRVRnhvyhnjOy1r1VtRh0xo
	oUYaA6aIj3WmwJXpYlzns4kMV/KdV7kbtjmKfmgLvUwraJC7Ws8MXfBQCQkM7jJ6+BMyy+yg1Bp
	j+AmrUwFpNDA7Bhk39u4Ssk0ftmcaOpB8+M90hm6gXRjbHEJN+yGaiJK1C5jrG7pAwYZeiFLiuB
	/R87Dzn1kFs/0E+OQQufwWy3JHBP1Y6b6eY9qVJwEFkpKSTRTI+HR10sTGf+D/XRTgFbwSGUsst
	EyPt1wSi/LycFLH0f1bUwT0bF8EkVQm+oD+iPL7hJyMuMu3TQLQpIO5ar5SR/Lmg
X-Received: by 2002:a05:6512:a8c:b0:5b6:1a7c:27 with SMTP id
 2adb3069b0e04-5b8b6649f01mr2202222e87.42.1789647650597; Thu, 17 Sep 2026
 05:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260915065534.102249-1-maimon.sagi@gmail.com> <178962831034.22033.349240265456808212@kernel.org>
In-Reply-To: <178962831034.22033.349240265456808212@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Thu, 17 Sep 2026 15:20:24 +0300
X-Gm-Features: AcwNN1Xpv2dec-eWESeM4Wy6Y9WRN3elg-R5JrcdXrRAdLmAUBat1N6Ju4KqLAs
Message-ID: <CAMuE1bGnQNWvEKVzjwo7nZSzA8Ctv0bsW=uE_CnhUOPBvc6DUw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: axienet: add a TX timeout handler to
 recover a lost DMA interrupt
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_052053_410982_DCB88826 
X-CRM114-Status: GOOD (  49.27  )
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

On Thu, Sep 17, 2026 at 9:58=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 1 (1) =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> - [High] The new .ndo_tx_timeout handler (axienet_tx_timeout(),
>   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1907-1913) only=E2=80=
=A6
>
> Pre-existing issues:
> - [High] axienet_dma_err_handler()
>   (drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2727-2810) tears=E2=
=80=A6
>
> --
>
> net: axienet: add a TX timeout handler to recover a lost DMA interrupt
>
> This adds an .ndo_tx_timeout handler to axienet_netdev_ops that queues
> lp->dma_err_task, so the netdev watchdog can reach the existing DMA reset
> path without depending on a DMA interrupt.  watchdog_timeo is set to 5 * =
HZ
> in the legacy DMA branch of axienet_probe().
>
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/driver=
s/net/ethernet/xilinx/xilinx_axienet_main.c
> > index 782f903d318f3..b5927e979c341 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>
> [ ... ]
>
> > @@ -1884,6 +1888,30 @@ axienet_get_stats64(struct net_device *dev, stru=
ct rtnl_link_stats64 *stats)
> >       } while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
> >  }
> >
> > +/**
> > + * axienet_tx_timeout - Driver TX timeout callback
> > + * @ndev:    Pointer to net_device structure
> > + * @txqueue: Index of the transmit queue that stalled
> > + *
> > + * Called by the netdev watchdog when a transmit queue has made no pro=
gress for
> > + * @ndev->watchdog_timeo.  axienet_dma_err_handler() is the driver's o=
nly reset
> > + * path, and it is otherwise scheduled solely from axienet_tx_irq() an=
d
> > + * axienet_rx_irq() - so a completion interrupt that is never delivere=
d leaves
> > + * the queue stopped with descriptors unreclaimed and no way back shor=
t of
> > + * unloading the driver.  Schedule the reset from here as well, so a l=
ost
> > + * interrupt is recoverable.
> > + *
> > + * This runs from a timer, so it only queues the work; the reset itsel=
f happens
> > + * in process context in axienet_dma_err_handler().
> > + */
> > +static void axienet_tx_timeout(struct net_device *ndev, unsigned int t=
xqueue)
> > +{
> > +     struct axienet_local *lp =3D netdev_priv(ndev);
> > +
> > +     netdev_err(ndev, "TX queue %u stalled, resetting DMA\n", txqueue)=
;
> > +     schedule_work(&lp->dma_err_task);
> > +}
>
> [Severity: High]
> Does the queue actually get restarted after this reset?
>

You are right that it does not, for the DRV_XOFF case.  Thank you - the
analysis is correct and I had not covered that path.

For what it is worth, the hardware run behind the changelog did recover,
and the logs say why it did not expose this.  Sampling once a second
across the wedge (MSI-X disabled, TX completions stopped):

  T+6   TXirq=3D24542  tx_pkts=3D1767  tx_timeout=3D0  backlog=3D131264b/92=
p
  T+7   TXirq=3D24542  tx_pkts=3D1767  tx_timeout=3D1  backlog=3D131306b/93=
p
  T+8   TXirq=3D24542  tx_pkts=3D1767  tx_timeout=3D1  backlog=3D0b/0p
  ...
  T+22  TXirq=3D24542  tx_pkts=3D1767  tx_timeout=3D1  backlog=3D0b/0p

The qdisc backlog drains to zero on the sample after the reset while
tx_packets stays frozen, so the queue was woken, and tx_timeout stays at
1 for the remaining 15 seconds, so the watchdog did not re-fire.  With
CONFIG_BQL=3Dy the dql limit stopped the queue via STACK_XOFF before the
128-descriptor ring filled, and netdev_reset_queue() clears exactly that
bit.  "TX ring unexpectedly full" never appeared in either run, which is
consistent with DRV_XOFF never being set.

So the recovery was only ever demonstrated for the BQL stop, exactly as
you suggest, and the DRV_XOFF path is untested.

That gap is pre-existing and independent of this patch -
axienet_dma_err_handler() has never woken the queue, and the
error-interrupt path into it has the same problem - so I have sent it
separately rather than folding it in:

  net: axienet: restart the TX queue after a DMA error reset

That one is a missing call and I am comfortable sending it reasoned from
the code, but this patch is a different matter: its changelog claims the
interface resumes passing traffic, and that is a behavioural claim I
should demonstrate rather than assert.  So I will repost the TX timeout
patch once I can test the DRV_XOFF case on hardware, about a month from
now.

> dev_watchdog() only calls ndo_tx_timeout for a queue that is already
> stopped:
>
> net/sched/sch_generic.c:dev_watchdog() {
>         ...
>                         if (!netif_xmit_stopped(txq))
>                                 continue;
>         ...
>                         dev->netdev_ops->ndo_tx_timeout(dev, i);
> }
>
> In the scenario the changelog describes (lost TX completion, descriptors
> unreclaimed) the stop bit is __QUEUE_STATE_DRV_XOFF, set here:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_start_xmit() {
>         ...
>         if (axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1)) {
>                 netif_stop_queue(ndev);
>         ...
> }
>
> axienet_dma_err_handler() then resets DMA, zeroes every TX BD, sets
> lp->tx_bd_ci =3D lp->tx_bd_tail =3D 0, re-enables NAPI and returns.  The =
only
> queue-state clearing it does is netdev_reset_queue(), which touches
> STACK_XOFF only, and nothing at all without CONFIG_BQL:
>
> include/linux/netdevice.h:netdev_tx_reset_queue() {
> #ifdef CONFIG_BQL
>         clear_bit(__QUEUE_STATE_STACK_XOFF, &q->state);
>         dql_reset(&q->dql);
> #endif
> }
>
> There is no netif_wake_queue()/netif_tx_wake_all_queues() and no
> netif_trans_update() anywhere in axienet_dma_err_handler().  The remainin=
g
> wake site in axienet_tx_poll() is gated on packets:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_tx_poll() {
>         packets =3D axienet_free_tx_chain(lp, lp->tx_bd_ci, lp->tx_bd_num=
, false,
>                                         &size, budget);
>
>         if (packets) {
>         ...
>                 if (!axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1))
>                         netif_wake_queue(ndev);
>         }
> }
>
> Can axienet_free_tx_chain() ever return non-zero after the handler cleare=
d
> cur_p->status for every descriptor?  And the wake in axienet_start_xmit()
> cannot run while the queue is stopped.
>
> If DRV_XOFF survives the reset, and txq->trans_start is never refreshed,
> doesn't dev_watchdog()'s time_after(jiffies, trans_start + watchdog_timeo=
)
> stay true, so the timeout path re-fires every 5 seconds, re-running
> napi_disable() / axienet_dma_stop() / __axienet_device_reset() /
> axienet_dma_start() and printing netdev_crit + netdev_err indefinitely
> while the interface still cannot transmit?
>
> The driver's other reset path does refresh the timestamp:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_device_reset() =
{
>         ...
>         netif_trans_update(ndev);
> }
>
> Would adding netif_trans_update() plus a wake of the TX queue at the tail
> of axienet_dma_err_handler() be needed for the recovery claimed in the
> changelog ("the watchdog fires and the interface resumes passing traffic"=
)
> to hold for the DRV_XOFF case rather than only for a BQL-only stop?
>
> [Severity: High]
> This is a pre-existing issue and not introduced by this patch, but the ne=
w
> trigger makes it much easier to reach: axienet_dma_err_handler() tears do=
wn
> the TX ring with no exclusion against axienet_start_xmit().
>
> The worker calls napi_disable() (which only excludes axienet_tx_poll()),
> axienet_dma_stop(), then re-enables transmission for a BQL-only stop befo=
re
> it starts freeing descriptors:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_dma_err_handler=
() {
>         axienet_dma_stop(lp);
>         netdev_reset_queue(ndev);       /* clears __QUEUE_STATE_STACK_XOF=
F */
>
>         for (i =3D 0; i < lp->tx_bd_num; i++) {
>                 cur_p =3D &lp->tx_bd_v[i];
>                 if (cur_p->cntrl) {
>                         dma_addr_t addr =3D desc_get_phys_addr(lp, cur_p)=
;
>
>                         dma_unmap_single(lp->dev, addr, ..., DMA_TO_DEVIC=
E);
>                 }
>                 if (cur_p->skb)
>                         dev_kfree_skb_irq(cur_p->skb);
>         ...
>         lp->tx_bd_ci =3D 0;
>         lp->tx_bd_tail =3D 0;
>
>         axienet_dma_start(lp);
> }
>
> It never takes the per-queue _xmit_lock and never calls
> netif_tx_disable()/netif_device_detach(), and the core unfreezes the queu=
es
> as soon as ndo_tx_timeout() returns, long before the work runs:
>
> net/sched/sch_generic.c:dev_watchdog() {
>                         netif_freeze_queues(dev);
>                         dev->netdev_ops->ndo_tx_timeout(dev, i);
>                         netif_unfreeze_queues(dev);
> }
>
> So while the teardown loop is running, can a transmit on another CPU ente=
r
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_start_xmit() {
>         ...
>         WRITE_ONCE(lp->tx_bd_tail, new_tail_ptr);
>         netdev_sent_queue(ndev, skb->len);
>
>         /* Start the transfer */
>         axienet_dma_out_addr(lp, XAXIDMA_TX_TDESC_OFFSET, tail_p);
> }
>
> and write cur_p->cntrl/phys/skb into a descriptor the worker is about to
> unmap and clear?  The outcomes look like an skb freed by the worker and
> then re-referenced, a DMA mapping released while a fresh buffer is being
> programmed into the same descriptor, and lp->tx_bd_tail/tx_bd_ci rewound =
to
> 0 out of step with the hardware tail pointer written by axienet_start_xmi=
t().
>
> Since this new .ndo_tx_timeout makes the reset a routine event (and, per =
the
> comment above, potentially every 5 seconds), should the reset path be mad=
e
> to exclude the xmit path, for example with netif_tx_disable() around the
> descriptor teardown?

Agreed, and I think that is a real bug today rather than only with this
patch.  It is a bigger change to a path I cannot currently exercise, so
I would prefer to send it as its own patch once I have the board back.

>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260915065534.102249-1-maimon.sagi%40gmail.com

