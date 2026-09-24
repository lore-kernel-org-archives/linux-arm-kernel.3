Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C7CC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGZb92y65Zgpq3x5v+GtiE7R/fU6xpwCAj6PKyWY/vY=; b=UhzxkdbOW1NUqaC1Z5UAbE+cF1
	bvgjaBlxMWlsxYZdz9uxkzZE/UIUMGMyubGj766dfMMfbjB/4IWCjGvZeDA4lNiUmPa3CWPumk/J4
	LmWbPIRiqhUTId+mbKYyXjkD+AkcWxINj9acAEwrbJDZktRIY1Nd3vKcfGKqCC7z6NtWsacY85/Tj
	rs5uZ9AnXGnY1fqgflP1yeRe6EA3Vw2sfqn5CGua5DHsNmxc41tKMn3BiX67cdPxWnH5pK7RmFXL9
	IUTHeTX6f41z0O99DvDaQHH1mlmsdrtiBweyaSpmtsgM/VP/wNV6C1SIafC0M59d4XgBo0JthqZMv
	om03A5gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jhY-0000000B7Bn-2KZ0;
	Thu, 24 Sep 2026 13:41:28 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jhU-0000000B7An-1m7s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:41:26 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b74dbc7359so1791744e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257281; cv=none;
        d=google.com; s=arc-20260327;
        b=KmLmRIvfgd+bY7W1EbJkWEpCeV6RB4KWwuMykW/q+xBB4ZSzypsydf+DU2t8XErHsg
         ZyKjjtPDmQf5cSJweNvbVsja0STs3Jxo0PE1TSyKkJDh2Ay+8gg3gF+BR1JpNN925SfL
         go7MXpdCwPDxRdpbKiFqYHCQvQyD3HRYxF6IB2fNcT76tB+tYe16/uC3+v9ZRhr4RmTm
         4iEWWL8RMm847i9jACb+OE3r68fHzBiLIMgaKDiw+ZPXnWAw9kV41ZZOfAjS7M7uDRT6
         TF2oNJsbg2Ttf/yTv29YVKHlO1HkVUo4DRFpMagU24szgK3gSW9tLln1dXDbbusCVmqZ
         CLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGZb92y65Zgpq3x5v+GtiE7R/fU6xpwCAj6PKyWY/vY=;
        fh=6RWdwuVf2UdnKywsoYN/8iqcUV4Xt2b/nxePCxXaC14=;
        b=RH9HLxuXuR9cHgK9ShoxHsNKY2CIJd42co4CGn97g6K6MFwU9i+iNwwzwI5Bu4gvfz
         9tpwAztCiSYgEi3HCdAercP0IOBJAaxHaIWE5xHdHOIGkQHIJaBLgn7Se6W7e316qSHQ
         rSwv21KLEq4Ms7IFNLe5cnj1ig3yt5K5Tl9Kh8/8+xUUywIfVVVsP0aAcWxfcBddTPUG
         Fe35Td+YlQSq3N8kT/QfWeGtbPA8CATRzy/MZ1QOrEwaRaTfkzoHNFdwXo1E54iUDUdh
         lIIdZ3aRLc9nfdMAb9zuPQPE/x9JUDGgpcL2Wj7mm+3dzQSl3c/qFW6lohAYxEAWC/4T
         bNHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257281; x=1790862081; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGZb92y65Zgpq3x5v+GtiE7R/fU6xpwCAj6PKyWY/vY=;
        b=J6IDFwwfi3BF+nfhRXD9bQENN31gfgNEDw400eTGx5zRR/PbcG/xzz195rVEqh1KaH
         kgpG3rPtZ5xd9mm6Z8Heaznru5JVUvzvjhooYYQn8W+/yqs9sidgvPit1rbtq5PzI2vm
         AYca2yHPKFcEPkPjMovsNUEVZzhYArEzq7Zd60e2Nmx1UMSiNu5GqK2Xp3WNKcxNx7q2
         6u0CtqZeUr2jjHmszpoC5MXPhBEmBBFgtvlCF8YAhHZOHGjoX8Hh5RCRaQx5yBGpJTLH
         iuhW2wd/m4pGAyt4Ax4MtHfYiRkxNUgqXLsoVLcHulyMVlmdLNfb6cxVhgS+qenhychD
         J+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257281; x=1790862081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGZb92y65Zgpq3x5v+GtiE7R/fU6xpwCAj6PKyWY/vY=;
        b=KjiGOR/lNNBA8Ytl9lJ4KcMKnxcOi5tY4IrR0P4AcF+5FKP82LdJf5s8SJMZpuqz/2
         d7rBsHpYd28+jSS0/FRFXiElWaeQap0g82V+dVefL/N++fJUar7tlnSASvu6i8ox+QZT
         ZHS1hfUucQ7HLLoLNGi7IWn8Ba+FceivVCSruxa5oT7jXUY4h5KCp5yCOVHAmFsQRR9G
         UZ5ZXJ1EknocNE8Ot7JzUV16e/cUE1X11mmgeGHghXrvkTB6NXcC3sjShewnbtdJTVeQ
         Ii18SLjt5tctPjB1PemgRecjznG/omA2PGh0FTO6DyRS6N/Ig1xNz/13Xr160sywR5Ni
         Ataw==
X-Forwarded-Encrypted: i=1; AKwUvBw3ylBpEOwifo3eSyrBTYdBOfKZO3Zi2g9IjObFWUOSTdWoJXZlInMIvN4AtMyYYzjWBMV2WbEOUkBeFWopMcmV@lists.infradead.org
X-Gm-Message-State: AFuF++lTOR+z6KBauA/THf4yhlBKcmR+UaQJJi6LkQtl7YcB49W84URF
	iTvgCRCSVSyvSQOqiSaSYNGGrKuUhp5XdqZTAsTh9JeFtHG2RVW+yA15T4mrUBQwFBYjRXDOfwJ
	EDiCQiwacOLKgviUfJsFq8lsZWT/eVo4=
X-Gm-Gg: AYBFou3PtSw4XLRoYKmaU3Y/XcOz19lOW7GA+4t9nPWsOKN5x2Rl37dgNBumi/JDOvx
	O2kVzENs00kKAnISyMb2DUtv+ZDPsk+mRFMr+qI0GicJwe0atcyJrZfZUAnT8rNkJZ34KsRVTZK
	ubfRpAqKX9b4LTQvGFoAubAtXaPFUNElW5UlG9kqzYB4mqiLnB3wuYdiFPfQXmF602oDKCMUeF5
	xm0bh576n6ge6MnOb9013LsEB6PAIo2srkuaR9kruvr7tz8FDpxLG8C8a7Y4WL/FbootnDjhOBF
	ZTj64BeKFUMLS90+5jA5EW9C9HDFO0aESuwFyAa9ua5UsKmkWlreigQp+y2YKqj0
X-Received: by 2002:a05:6512:1192:b0:5b8:b3a6:719a with SMTP id
 2adb3069b0e04-5b8df09d744mr945812e87.30.1790257281161; Thu, 24 Sep 2026
 06:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260917115657.20697-1-maimon.sagi@gmail.com> <178999185805.2160803.2118648689532400433@kernel.org>
In-Reply-To: <178999185805.2160803.2118648689532400433@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Thu, 24 Sep 2026 16:40:54 +0300
X-Gm-Features: AclHuK_mv6cx7MF56HvpPI8ZeHUQyEOf1bmrhadhyKpWsU2yerYqhZUPa9QgwcM
Message-ID: <CAMuE1bEbupbvFxV4W8ZS5NxMAQP6SvxP=S6DC=+ho-+zkFQ=Vg@mail.gmail.com>
Subject: Re: [PATCH net v2] net: axienet: bound TX completion cleanup by the
 NAPI budget
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, netdev@vger.kernel.org, 
	robert.hancock@calian.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_064124_525360_C406FB8C 
X-CRM114-Status: GOOD (  49.17  )
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

On Mon, Sep 21, 2026 at 2:57=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Incomplete fix: the new budget guard in axienet_free_tx_chain()
>   is disabled when @budget =3D=3D 0 (`if (!force && budget && packets >=
=3D=E2=80=A6
>
> Pre-existing issues:
> - [Medium] Pre-existing (not introduced or claimed to be fixed by this
>   patch): axienet_dma_bd_release()=E2=80=A6
>
> --
>
> net: axienet: bound TX completion cleanup by the NAPI budget
>
> The patch adds a budget check to axienet_free_tx_chain() so the TX
> completion loop stops on a packet boundary once the NAPI budget is spent,
> and treats a budget of zero as "no limit" so the netpoll TX reclaim and t=
he
> @force callers still drain the ring.  The kernel-doc for @budget is updat=
ed
> to match.
>
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/driver=
s/net/ethernet/xilinx/xilinx_axienet_main.c
> > index 1722b7038f340..039885814a5d2 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > @@ -772,7 +772,9 @@ static int axienet_device_reset(struct net_device *=
ndev)
> >   * @force:   Whether to clean descriptors even if not complete
> >   * @sizep:   Pointer to a u32 accumulating the total byte count of
> >   *           completed packets (using skb->len). Ignored if NULL.
> > - * @budget:  NAPI budget (use 0 when not called from NAPI poll)
> > + * @budget:  NAPI budget. When @force is false, cleanup stops after th=
is
> > + *           many completed packets. Zero means no limit, as used by t=
he
> > + *           netpoll TX reclaim and by callers outside NAPI poll.
> >   *
> >   * Would either be called after a successful transmit operation, or af=
ter
> >   * there was an error when setting up the chain.
> > @@ -788,6 +790,15 @@ static int axienet_free_tx_chain(struct axienet_lo=
cal *lp, u32 first_bd,
> >       dma_addr_t phys;
> >
> >       for (i =3D 0; i < nr_bds; i++) {
> > +             /* A NAPI poll must not return more than its budget.  Sto=
p on a
> > +              * packet boundary once it is spent - cur_p->skb is only =
set on
> > +              * a packet's last descriptor, so no packet is left half-=
freed.
> > +              * A zero budget means no limit: netpoll polls with a bud=
get of
> > +              * 0 to reclaim the TX path only, and must still clean th=
e ring.
> > +              */
> > +             if (!force && budget && packets >=3D budget)
> > +                     break;
> > +
>
> [Severity: High]
> With the "budget &&" term, is the case the commit message is about still
> reachable on the netpoll path?

Yes.  For a budget of 0 the loop drains the ring and axienet_tx_poll()
then returns the reclaimed count, which can trip the WARN_ONCE() in
poll_one_napi().  That was already reachable before this patch, while the
loop was unbounded, but since the patch is about honouring the budget it
should cover this case as well.  v3 returns "budget ? packets : 0" from
axienet_tx_poll() as you suggest, keeping the accounting and the queue
wake.

>
> For a budget of 0 the guard never fires, so axienet_free_tx_chain() walks=
 up
> to lp->tx_bd_num descriptors and increments packets for every completed
> descriptor with a non-NULL cur_p->skb.  axienet_tx_poll() then returns th=
at
> count verbatim:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_tx_poll() {
>         packets =3D axienet_free_tx_chain(lp, lp->tx_bd_ci, lp->tx_bd_num=
, false,
>                                         &size, budget);
>         ...
>         if (packets < budget && napi_complete_done(napi, packets)) {
>         ...
>         return packets;
> }
>
> netpoll is the caller that enforces the invariant:
>
> net/core/netpoll.c:poll_one_napi() {
>         /* We explicitly pass the polling call a budget of 0 to
>          * indicate that we are clearing the Tx path only.
>          */
>         work =3D napi->poll(napi, 0);
>         WARN_ONCE(work, "%pS exceeded budget in poll\n", napi->poll);
>         ...
> }
>
> lp->napi_tx is on dev->napi_list (netif_napi_add(ndev, &lp->napi_tx,
> axienet_tx_poll) in axienet_probe()), so netpoll_poll_dev()->poll_napi()-=
>
> poll_one_napi() reaches axienet_tx_poll() with budget 0.  If netconsole o=
r
> kgdboe is active on the interface and at least one TX descriptor has
> XAXIDMA_BD_STS_COMPLETE_MASK set with cur_p->skb !=3D NULL, doesn't that =
poll
> return non-zero work for a budget of 0 and trip the WARN_ONCE?
>
> The "packets < budget" test is also false for budget 0, so
> napi_complete_done() is skipped on that pass, which is the secondary symp=
tom
> the changelog describes.
>
> Would it work better to keep the unlimited reclaim for budget 0 (it is
> already bounded by lp->tx_bd_num) but have axienet_tx_poll() report
> "budget ? packets : 0", while still doing the byte/packet accounting?
>
> The new kernel-doc says zero means "no limit, as used by the netpoll TX
> reclaim".  netpoll asks for two things: drain the TX path, and report zer=
o
> work.  Could the kernel-doc and the in-loop comment mention both?

Will do.

>
> One more nit on the changelog:
>
>   "Zero therefore means no limit, which also covers the @force callers th=
at
>   clean up after a DMA mapping failure with a budget of 0."
>
> The guard is already gated on !force, so the @force callers are unaffecte=
d by
> the value of @budget here.

Right, that sentence is wrong.  v3 drops it.

>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but while looking at the TX
> reclaim path: does axienet_dma_bd_release() leak the outstanding TX skbs =
and
> their streaming DMA mappings?

Yes.  It is independent of this patch, so I will send it as a separate
fix rather than fold it in.
v3 follows.  It passes traffic on hardware; the over-budget and netpoll
cases themselves were not exercised.

>
> The RX side walks the ring and cleans up:
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_dma_bd_release(=
) {
>         for (i =3D 0; i < lp->rx_bd_num; i++) {
>                 ...
>                 dev_kfree_skb(lp->rx_bd_v[i].skb);
>                 ...
>                 dma_unmap_single(lp->dev, phys, lp->max_frm_size, DMA_FRO=
M_DEVICE);
>         }
>         ...
>         /* If we end up here, tx_bd_v must have been DMA allocated. */
>         dma_free_coherent(lp->dev,
>                           sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
>                           lp->tx_bd_v,
>                           lp->tx_bd_p);
> }
>
> The TX ring is freed with no equivalent pass over lp->tx_bd_v, so descrip=
tors
> between lp->tx_bd_ci and lp->tx_bd_tail keep their cur_p->skb and their
> dma_map_single() mapping.
>
> axienet_stop() disables TX reclamation before the release, so nothing can=
 run
> afterwards:
>
>         napi_disable(&lp->napi_tx);
>         ...
>         axienet_dma_stop(lp);
>         cancel_work_sync(&lp->dma_err_task);
>         free_irq(lp->tx_irq, ndev);
>         free_irq(lp->rx_irq, ndev);
>         axienet_dma_bd_release(ndev);
>
> So an "ip link set down" or a driver unbind with frames in flight would l=
ose
> up to lp->tx_bd_num skbs and mappings.  The budget cap added here can lea=
ve
> completed-but-unreclaimed descriptors around for a later poll, which slig=
htly
> widens the window, but the leak is independent of this change.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260917115657.20697-1-maimon.sagi%40gmail.com

