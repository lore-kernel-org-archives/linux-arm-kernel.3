Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0CAC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJYVfSEDQsVnkbBJ1tGYnH9ndL0fb4u2tq4xBMYB8CQ=; b=miV4knJ2PD9aDSUSEHcpznbI2l
	Bi/LC23nBhj5WJrMZn1zGjsAhVLXG5gH68z5cE7+LCUpGtEwfr0eiU0kbGZlWmAW2s+JXdPkUANY8
	IJt/WOVcLBitEKUNpOnlkHx/j84gSTNSHQMub535ux0xiGp7yPHZpTWJm2ChOFX5q/MH2V0wKteJo
	F9ZNEv58lOhz2XUKl1vJkSfLdgCiFUCuIcdZI6S4968aoEpNnayjUEfqL6EwarVVu2sTNBq3Ii0ZY
	yhm4MomC6HYUrDT4u1hoCyq15syHgNQCoBtpsqt0kEULVO16oK4Qd9dhTmrJLxOb/zVWWj4Hn+434
	HJsJdiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jpQ-0000000B8AT-2AqY;
	Thu, 24 Sep 2026 13:49:36 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jpO-0000000B8A1-1sPU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:49:36 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b76668f4ddso727940e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257772; cv=none;
        d=google.com; s=arc-20260327;
        b=P+Wr2nFmBcs4NyhrNIkssdZ/+y84lzXq7qfepfddBIQMTHpivyYoILIJTq4HAF6vQH
         m5210ugGJ9Hh23kuBovBc4+Bm+yqXTPdlu7U1h1sKowa1Inj+Tk+Cg2xAh17LKiGlNbo
         /+mp+bYzYmW0k+HFvJwNXpzlhviDd30Y3BGj/ZyYNpkp2cBZaHBieYtxzQP3dID5R+UN
         R1xAkz56GRKHqKj2eHLSX8ycw671tn1OxMItHenMoA/jOkO5zsQxLvuJDagkftJ782lO
         tixvYdn/udn3lMDwSyTw7u1iiB6YWt3Tu/SFvj4k5TBYI8TPS1aAbQIQw/MV2Rch6SGO
         cSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gJYVfSEDQsVnkbBJ1tGYnH9ndL0fb4u2tq4xBMYB8CQ=;
        fh=8HEiARr5cVeLoPt5QkWJ0LMaq8lQygzHmoCQlIyEdwE=;
        b=rvvz5AF4DOdowKh/aV7XgIdOG2IZuBJuon1+wZDt9z+Fxz7uk/pEHAD/gXN2rwSU9f
         tfSmn8Z+QpPlcsp4O/uudk8ef4lM9qNAFaMTazz8mrFx/SEfLS2QYze7sxhKWNqcCvmx
         v7ZzNTueuXPSOrzOksmcLTihUhGNCrHjibAA6ZE1owew/Tl7mCcB7Nu8TiyUDyyRJ4n0
         +XpblFNeyml8cD3ddHXUDJhi85asVSJED5zwCwjn1yoeS5K1hanC6X434KeaS29R6Lnl
         zFbiG2Xh8elHpTW/etE+lEQdTtAAlu98Wm5HMcjjIqiO/fDEUgBgXnj2tRBigTCnGwaJ
         heNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257772; x=1790862572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gJYVfSEDQsVnkbBJ1tGYnH9ndL0fb4u2tq4xBMYB8CQ=;
        b=ccKRds0T4Zy1rPk7Nf7d+esSKjIjn6b1Ngo0rF0RgTF1Ar3Z8aUP4OqGw2SENseaSL
         8rVcG1UABjkps79twiAYQhHfZ/SB12AcW6oxO3fm1C+57hnQl64ijLwGyBdFxLYFRQ3/
         ME+KclQCvIWPStPDqh2FfB+ArNlKhRqww2dMNJxLBlvY6wSuzXIbWa1dWf0lkdJOA9Ee
         JbBm2Ig3VyCTs9yzR8oj43gxPsWsc+L4za0hAbVneHHWG9o59NhRLj5xa6Hy6pS3vU/a
         COjV48QzGOGdM5QzaCIJspzKqSZs2oVEVzlye5sGjNbVI9gOUiKdTS5wXEaHZNdhrg4/
         kBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257772; x=1790862572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJYVfSEDQsVnkbBJ1tGYnH9ndL0fb4u2tq4xBMYB8CQ=;
        b=sDCynYcyPN1yeDTMqB+nqXpwCadyhdyvV04Pu+99j/6bVymwyla5Z1tEDI7hgpMvxT
         7Xtzgi02VjpMGAu05RnprWzhKct4W+tzPNIj4/YEnoMmfqfnWG9SgkYrzCTSuWUsaTV8
         yhsNu57PHbaJxfymnwILFeG7mVJB4IoQbRk7D4mSdXe0BNYdorIdnu8GlcAZWfboLcAx
         U7KUOUKKQ6DS1GqolJmFdUeBwT7Sp64D31rd/ySVhYmo4aWnrmXGTWJOl1ftW49wuvbc
         2d2eo3A0KwJGPeuLxmIz5h6kV5nRdF1mkhKA88+xjqTM2UKGKUSEOza2xkwXTD6KqAZt
         In7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwjnVvaWEd2MV4tuX3wozr1xvIYvFbNu3RRLDa+WrAwDo3ijGHole+b+LcP8Mq4b03hsrLC7uM8X3GwyhaNMiN@lists.infradead.org
X-Gm-Message-State: AFuF++mbDk0TN/fNrz38OLIFijUAJrAjRVXWq/goDnPWDvigvOtk0yIy
	7WuyBldNfTLSl1HhGpCO+Ac9PXkVd5x5iMnuCIZ1obIN0y0Uq4nnUD04X2a+RYpt3UPsmwkrDVR
	q92UXPlTEpatHaHLkP4o9g7LnffxWsIM=
X-Gm-Gg: AYBFou264zE/mmtilBYthI2ya8Xj3Hup6jH499pZ/lPF+Q34byLdcF993vEa9SourXR
	BAhOA/3bCDGmLD2D09O/IElGK2A5i2X8O1UrugbmHWfKxWuMdvOutF6+bIdLeV6auKSan0RMnK6
	7QLXFkU5+1e9xeVDg+A6aAp4pcr7qmjq+01aQVPKdlViWJ72WUny5Y94PVP3Lg8N7yDzqHRvbHV
	HHnl0d6HWDo6peHCQlhlDc3tHmuYA6Q3GBeDaM5jA5DvZB/jY6+TwAr/k5NMRk+3WEyWWqh2W00
	oLZOZZ2MpFRnOx3n0cN7KFRmjUD5bXdvNoy2QKLLiTOuB17EjfjROg==
X-Received: by 2002:a05:6512:150d:10b0:5b8:b419:b89 with SMTP id
 2adb3069b0e04-5b8df0d75e8mr579645e87.16.1790257772059; Thu, 24 Sep 2026
 06:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260917121306.23499-1-maimon.sagi@gmail.com> <178999282007.2160803.6952878199943822549@kernel.org>
In-Reply-To: <178999282007.2160803.6952878199943822549@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Thu, 24 Sep 2026 16:49:05 +0300
X-Gm-Features: AclHuK85KsXovvOUr2OPfXpsHg-ZsrDaqPDh7LgpYDySab54LfHYs-T8fpEBRXI
Message-ID: <CAMuE1bE40RYoB0q0Wxq15PPRzGigX=T3EPJV2C5WRwcO7cbPow@mail.gmail.com>
Subject: Re: [PATCH net] net: axienet: restart the TX queue after a DMA error reset
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	michal.simek@amd.com, daniel@iogearbox.net, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_064934_661584_42DE7530 
X-CRM114-Status: GOOD (  54.32  )
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

On Mon, Sep 21, 2026 at 3:13=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 (2) =C2=B7 Medium: 1 =C2=B7 Low: 0 (1)
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The netif_wake_queue() added at the end of
>   axienet_dma_err_handler() is not serialized against=E2=80=A6
> - [High] The unconditional netif_wake_queue() added at the end of
>   axienet_dma_err_handler() can undo the TX stop that axienet_suspend()=
=E2=80=A6
> - [Medium] The added in-code comment in axienet_dma_err_handler() and the
>   commit message assert a TX-watchdog failure that cannot happen in this=
=E2=80=A6
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but
>   axienet_dma_err_handler() unmaps, frees and clears every TX descriptor=
=E2=80=A6
> - [High] This problem wasn't introduced by this patch, but
>   axienet_dma_err_handler() performs a full AXI Ethernet core reset=E2=80=
=A6
> - [Low] Concern that the newly added unconditional netif_wake_queue() in
>   axienet_dma_err_handler() re-enables transmission even when the=E2=80=
=A6
>
> --
>
> net: axienet: restart the TX queue after a DMA error reset
>
> The patch adds netif_trans_update() and netif_wake_queue() at the end of
> axienet_dma_err_handler(), so that a queue stopped by axienet_start_xmit(=
)
> is restarted after the DMA error reset has reinitialised the descriptor
> ring.  No Link: tags are present in the commit header.
>
> A few questions below about the new wake and about the surrounding recove=
ry
> sequence.
>
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/driver=
s/net/ethernet/xilinx/xilinx_axienet_main.c
> > index 1722b7038f340..814d92fcb4fda 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > @@ -2778,6 +2778,15 @@ static void axienet_dma_err_handler(struct work_=
struct *work)
> >       napi_enable(&lp->napi_rx);
> >       napi_enable(&lp->napi_tx);
> >       axienet_setoptions(ndev, lp->options);
> > +
> > +     /* The ring is empty again, so let the stack transmit.  The queue=
 may
> > +      * have been stopped by axienet_start_xmit(); netdev_reset_queue(=
)
> > +      * above clears only __QUEUE_STATE_STACK_XOFF, and nothing at all
> > +      * without CONFIG_BQL.  Refresh the transmit timestamp first, or =
the
> > +      * watchdog fires again on the next tick.
> > +      */
>
> [Severity: Medium]
> Can the watchdog actually fire for this device?  The comment says:

No.  Neither ops table installs .ndo_tx_timeout in the tree this applies
to, so netif_trans_update() has no consumer and the commit message
describes behaviour that cannot happen here.  The TX timeout handler I
had in mind is a separate net-next patch that is not merged.  The rework
drops both the call and the claim.

>
>          * without CONFIG_BQL.  Refresh the transmit timestamp first, or =
the
>          * watchdog fires again on the next tick.
>
> and the commit message states it as a fact:
>
>     The transmit timestamp is not refreshed either, so on a kernel with a
>     TX timeout handler the watchdog condition stays true and the reset ca=
n
>     be retried indefinitely.
>
> Neither axienet_netdev_ops nor axienet_netdev_dmaengine_ops installs
> .ndo_tx_timeout, and the driver never assigns ndev->watchdog_timeo
> (a grep for both symbols in drivers/net/ethernet/xilinx/ matches only
> xilinx_emaclite.c).  The core refuses to arm the timer in that case:
>
> net/sched/sch_generic.c:netdev_watchdog_up() {
>         if (!dev->netdev_ops->ndo_tx_timeout)
>                 return;
>         ...
> }
>
> So dev_watchdog() never runs for axienet and netif_trans_update() is a
> timestamp store with no in-tree consumer.  The note below the --- line
> mentions this depends on a separate TX timeout patch, but that note does
> not reach git history, and the Fixes: tag invites a stable backport of a
> watchdog retry loop no in-tree axienet can produce.  Could the comment an=
d
> the commit message be reworded to say the timestamp refresh is preparatio=
n
> for a TX timeout handler rather than a fix for observed behaviour?
>
> > +     netif_trans_update(ndev);
> > +     netif_wake_queue(ndev);
>
> [Severity: High]
> Can this wake be lost, leaving the queue stopped for good?

Yes.  The handler takes no part in the start_xmit/tx_poll handshake.
The rework quiesces the transmit path with netif_tx_disable() at the top
of the handler and wakes the queue at the end, so no transmit can race
the teardown or stop the queue again in between.  That also covers the
pre-existing teardown race you point out further down.

>
> axienet_dma_err_handler() runs in process context and never calls
> netif_tx_disable() or netif_tx_lock_bh(), and it sleeps for tens of
> milliseconds inside axienet_dma_stop().  An axienet_start_xmit() that
> entered before the teardown can therefore finish after the worker has
> reset the indices:
>
> axienet_dma_err_handler()
>         lp->tx_bd_ci =3D 0;
>         lp->tx_bd_tail =3D 0;
>         ...
>         netif_wake_queue(ndev);
>
> axienet_start_xmit() then runs its own stop protocol:
>
>         if (axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1)) {
>                 netif_stop_queue(ndev);
>
>                 /* Matches barrier in axienet_tx_poll */
>                 smp_mb();
>
> If that netif_stop_queue() lands after the worker's netif_wake_queue(),
> __QUEUE_STATE_DRV_XOFF is set again with nothing left to clear it.  The
> only other wake is inside the 'if (packets)' branch of axienet_tx_poll():
>
>                 if (!axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1))
>                         netif_wake_queue(ndev);
>
> and the commit message already explains axienet_free_tx_chain() cannot
> return a non-zero packet count once the handler has zeroed every status
> word.
>
> The existing queue-state protocol is a two-party smp_mb() handshake
> between axienet_start_xmit() and axienet_tx_poll(); this adds a third
> writer from a different context that does not take part in it.  Would
> quiescing the transmit path at the top of the handler (netif_tx_disable()=
)
> and waking at the end make the wake unloseable?
>
> Related: lp->tx_bd_ci and lp->tx_bd_tail are written with plain stores by
> the worker while axienet_start_xmit() reads them unlocked
> (orig_tail_ptr =3D lp->tx_bd_tail) and WRITE_ONCEs them, so is the commen=
t's
> premise that "the ring is empty again" guaranteed to hold at the instant
> of the wake?
>
> [Severity: High]
> Can this wake undo the transmit stop that suspend installed?

Yes, and that one is a regression introduced by this patch.  The rework
skips the wake when lp->stopping is set or the device is not present,
and axienet_stop() quiesces the queue itself before tearing anything
down, which also covers a detach that races the check.  That in turn
needs axienet_open() to start the queue, which it currently never does.

>
> The worker checks lp->stopping only at its entry.  If a suspend starts
> after that check:
>
> axienet_suspend()
>         netif_device_detach(ndev);
>
>         rtnl_lock();
>         axienet_stop(ndev);
>         rtnl_unlock();
>
> net/core/dev.c:netif_device_detach() {
>         if (test_and_clear_bit(__LINK_STATE_PRESENT, &dev->state) &&
>             netif_running(dev)) {
>                 netif_tx_stop_all_queues(dev);
>         }
> }
>
> axienet_stop() then sets lp->stopping and blocks:
>
>                 WRITE_ONCE(lp->stopping, true);
>                 flush_work(&lp->dma_err_task);
>                 ...
>                 axienet_dma_bd_release(ndev);
>
> The already-running worker reaches the new netif_wake_queue(), clearing
> the DRV_XOFF that detach set and scheduling the qdisc.  Suspend calls
> axienet_stop() directly without dev_deactivate(), so the qdisc is still
> active, and the transmit path does not consult netif_device_present().
> Can backlogged traffic then enter axienet_start_xmit() after flush_work()
> returns, while axienet_stop() proceeds through napi_disable(),
> axienet_dma_stop(), free_irq() and axienet_dma_bd_release(), so that the
> in-flight transmit writes into lp->tx_bd_v as it is being dma_free'd and
> kicks XAXIDMA_TX_TDESC on a torn-down engine?
>
> Before this patch the detach-installed DRV_XOFF stayed set, so no xmit
> could run.  Would re-checking lp->stopping (or netif_device_present())
> before the wake close this?
>
> [Severity: Low]
> This isn't a bug introduced by this patch, but the hardware reset result
> is discarded on this path.  __axienet_device_reset() returns -ETIMEDOUT
> when the DMA reset bit never clears or PhyRstCmplt never arrives:
>
>         if (ret) {
>                 dev_err(lp->dev, "%s: timeout waiting for PhyRstCmplt\n",=
 __func__);
>                 goto out;
>         }
>
> but axienet_dma_stop() drops it:
>
>         /* Do a reset to ensure DMA is really stopped */
>         axienet_lock_mii(lp);
>         __axienet_device_reset(lp);
>         axienet_unlock_mii(lp);
>
> so the handler cannot tell a recovered device from one still in reset, an=
d
> it unconditionally re-enables XAE_OPTION_TXEN via
> axienet_setoptions(ndev, lp->options) just above the new wake.  The added
> netif_wake_queue() does not make this worse - transmits already reached t=
he
> possibly-unreset engine in the common case where the queue was not stoppe=
d
> when the error hit - but should axienet_dma_stop() propagate the reset
> failure instead of returning void?

I agree, but what the handler should do when the reset fails is a
separate decision, so I would rather leave it for a follow-up than make
it here.
This becomes a short series: start the queue in axienet_open(), quiesce
it in axienet_stop(), quiesce it across the error reset, and reprogram
the link afterwards.  v2 follows.  On hardware it passes traffic and
survives repeated down/up cycles and module reloads with traffic
running; the error path itself was not exercised.

>
> [Severity: High]
> This is a pre-existing issue, but the ring teardown earlier in this same
> handler has no exclusion against axienet_start_xmit(), which the commit
> message acknowledges below the --- line.  The handler does, for every TX
> descriptor:
>
>                 if (cur_p->skb)
>                         dev_kfree_skb_irq(cur_p->skb);
>                 cur_p->phys =3D 0;
>                 ...
>                 cur_p->skb =3D NULL;
>
> while the transmitter publishes the skb and then dereferences it:
>
>         cur_p->skb =3D skb;
>         ...
>         WRITE_ONCE(lp->tx_bd_tail, new_tail_ptr);
>         netdev_sent_queue(ndev, skb->len);
>
> Disabling TX NAPI excludes completion processing, not ndo_start_xmit.  If
> the worker frees that skb between the two, is the skb->len read a
> use-after-free, and does the following tail publication plus
> XAXIDMA_TX_TDESC kick submit descriptors whose mappings the worker alread=
y
> released?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is the MAC fully
> reprogrammed at the point where the queue is now woken?

No, the link speed and pause settings are lost.  The rework has the
handler call phylink_mac_change() so that axienet_mac_link_up() runs
again.

>
> axienet_dma_stop() runs __axienet_device_reset(), which resets the
> Ethernet core, and the recovery sequence restores RCW1, IS/IE, FCC (FCRX
> only), the MAC address, the multicast filter and lp->options.  It never
> rewrites XAE_EMMC_OFFSET.  The only writer of the LINKSPEED field and of
> the negotiated pause bits is axienet_mac_link_up():
>
>         emmc_reg &=3D ~XAE_EMMC_LINKSPEED_MASK;
>         ...
>         axienet_iow(lp, XAE_EMMC_OFFSET, emmc_reg);
>
> and phylink will not call it again because the link state has not changed
> (axienet_mac_link_down() is a no-op and the handler does not re-trigger
> phylink).  axienet_options[] has no XAE_EMMC_OFFSET entry either, so
> axienet_setoptions() cannot repair it.
>
> On a 10/100 link, does the MAC keep its reset-default link speed after
> this recovery while software still believes the negotiated rate is in
> effect, so that the frames the new netif_wake_queue() lets through are
> clocked at the wrong rate until an unrelated link flap re-runs
> axienet_mac_link_up()?  The open path escapes this only because
> axienet_open() runs phylink_start() after axienet_device_reset().
>
> >  }
> >
> >  /**
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260917121306.23499-1-maimon.sagi%40gmail.com

