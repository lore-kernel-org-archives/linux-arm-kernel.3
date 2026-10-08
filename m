Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B328CCA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 05:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMR8xkSDYj9XG1geaNR+B/PoYmFLrpWKErOOKtw8mrc=; b=MQRCl998pGtR+lRlhTg5J1+VF6
	qNSTcJIDa3S50GvOYhfOK5jNJ/U0yc7sQCMMWXKJRPRs5/+fFY+rNt1ilVZjGDMIc/Q0lTgcOZ+C3
	A8zyLDIbTjBR88lIPWybKMAElNpSD4mkD3WtYX9pIzICBiQLL/zwV14kkxtwKBciF0HW8XhE5JBqj
	FA6VEeiX6LZoMj2BfI7kTWRvGTYbXmd/CL5RH5QDur5/7slDBF3xhmmhhxYR4DGcbJoLLo7qp+L+G
	ZKMei6EcodRWaIPGUT2D3YHTpXBu7uNr8xy/sy4dgohDQl+ozXPIK4epy4TVRyEySdiR70ATNo1JI
	s2wKn1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEh8B-00000003ZyE-2cCf;
	Thu, 08 Oct 2026 05:57:27 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEh88-00000003Zxd-0JaO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 05:57:25 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-9144e8021d3so76606906d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 22:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791439042; cv=none;
        d=google.com; s=arc-20260327;
        b=o2g7SErASaHNIhLWJFEmgNq+7sBlsKaYeY+YsqOtHD1MqvRCBlkp8qld1hToM3p5Zp
         WCN7D1Ztjm74+V0TddGnesCiJDNOhahFxhtsXF5lDzX3Ho2bnCTsCIRVYRuzuSaFFm34
         fbgG0SO5Qe8j+8giILDNCkNYj7ujn1jdzWujZRlTtrZUC5eZYR3GjP88FCUxm9+PTmm/
         Rrxwqw8QbhryKTL0H7F6Xy0IijzbQGaiDIPFlwXMuu6tbxzCNQFfz7DzgKkq4JGv7P3m
         /dkePMw134jWf+hvqdGMw3mBUYrBKyWilyH9GNCbFGarQo1dwnAVuZaAbxYqnmceP3sz
         loZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMR8xkSDYj9XG1geaNR+B/PoYmFLrpWKErOOKtw8mrc=;
        fh=+LccDgvEp3TU0Hw2ErNj9UKaw7xK1H8WFHGCMG7Sbf8=;
        b=MHGDJs6iujtS4PfpRAn3xiJS11oWBDijMfyZflV2Jek31LuE8WZZ08Io4s0zBPRkoP
         eEy75ek5V+qtugR3cXJPnED3VEetThC+RlJUv3WPZxtE9qcZe7VlfrwvIte88DnH88xq
         1qhDTBHl2xaKP9iOTQ9naAkjHwshMfiWgMTU0kX1r5QksWVbiIpFn8VSeJhqF8Abi4pE
         DhKoAc4oCCbi1bnhF+ZXxcVUjg7riEQEhveJlD5DghNU0kb0CfPUwD8lU65YEb+RFMzR
         qUgpJNewcc0K92X1dTzicGQDyQq/5yR6KUfpJyP3iGQKnBa/pcBBfJaj9Bka46GIV4RG
         Ti+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439042; x=1792043842; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMR8xkSDYj9XG1geaNR+B/PoYmFLrpWKErOOKtw8mrc=;
        b=qBQH/b9uOVK7UKH0YItMymRh6mEuq3vHoKZ+rU1FAxmRFuEvT2MtFgUvmqI517iFqQ
         osDrB8LhUpFnqZHVyR0vPPyoCtr0MOye8pWeCbWlfFeVbPHtPl1NKPokXpeUQT59hN0M
         DnmtHcd45AcL5IWxGM0PIRkHPzEeCcCcpIOtBKGzF/pOi4BW2ezZ+jqjZUb+0vToiyla
         Laefs8diFFgaEV+ULW2VzNjqPRalWbQGnmLwYYgRYavikHRl0R0lAvMk8weGPW6D9ob6
         xeAiVg7SZdJQReG0MaIui2qnfs9Hw249huEqCh0om4IzeY6Li3p2RT/2Snx2W8kMBk0u
         MZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439042; x=1792043842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMR8xkSDYj9XG1geaNR+B/PoYmFLrpWKErOOKtw8mrc=;
        b=KI/keC5R6bjQtDcnsqyuayj5MPj+jGrdySW9HHntrJOd3k/JSyttv0dd6XMboLT+Uu
         Y/6AiOIqDO8f8xFRvrBweeiVe/IcEfcQw/wmsgD7YDO9q/MlNkz9ywrAxQKaRglSLnew
         fcBRkHKscNSF8/5zra8Hla63ZdIOETgiaO1/CWqIZhYkoMmpYg7IBOj07jVfiTkhvm2m
         eAVTr3xs+vevAyggt8prO3mCWseEq30x8rr/u98YZYDV9HRydVkLkIjG7bsbfpykigEx
         Bd/kwLbVjMlwJWiOprJt7roLuf5CzoNkHCyUo++453FsrnDsdCGRrc40h99mLUBwgfml
         kxLA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ2VqJbOVB42Pt9u/85Ej9fwaBmTLV87w2SkUs0qMHuFnwFv/V9zz9sX5+vHUhBt0Qon0x7chiyS53juaQTXQo@lists.infradead.org
X-Gm-Message-State: AFuF++nwwW14IRfGUQlnp8WyTI1eTw3AfGMRz6k1JbwE1dIfWxx6nrBJ
	zXsCL2IiABzJqwGEQCNe1a+pjeKFDJhIoTPe/UydRJShezq9Bg770VS+uZNu9X70Cbxg1EBqku7
	FuT8DhnfTkYRsZMj63vd4NDdvcJ1iO0M=
X-Gm-Gg: AYBFou3R47NjS35oQ16oew7lWK3XP2dQ26sO+eyzvFil1yl6RCj81MBzdJpVi84Fi7/
	4P5IWLtUMhh3FPn3P5TmRwP2+IRK7UcGKJWNHay0oJscK1IqUwDrojx9u5sewRNTftxz256Xe2p
	PJAIFZyT1XzO1gCW4qe2fITv5uKiNKJvCUs3rUrHpSqmxcgjFuNlGx7CDvSIdxvZVhFbtwNJlVq
	SjxpbKOFG12akwouyTUh1ok/2/1kZWFo/otqnGyw7GcnwAz0njKrgyC+oQ0qx8bJO5rONaTq+l9
	hSIQOzgu9FLDFZ7mU6Ug/sQBqRdK3STxV2ySjQnvOCsKHJYid+IYsGWl
X-Received: by 2002:a05:6214:2e47:b0:919:952e:95fc with SMTP id
 6a1803df08f44-919978cf7e9mr81535886d6.56.1791439042021; Wed, 07 Oct 2026
 22:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20261004120526.2728564-4-zxyan0222@gmail.com> <179120265939.434549.8164410150343143172@kernel.org>
In-Reply-To: <179120265939.434549.8164410150343143172@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 8 Oct 2026 13:57:09 +0800
X-Gm-Features: AclHuK_sj1CcRDKMDs3LRE2C0FdOUMUHNreiEzvk3po8I-OFOZUhGFebFBe5V3U
Message-ID: <CAP7veT+GpOgWxsp5t=TbM3X5g52tVrX4TWQeTa1WeXBiNrOj7w@mail.gmail.com>
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwxgmac2: add XGMAC
 timestamp interrupt support
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, richardcochran@gmail.com, 
	maxime.chevallier@bootlin.com, muhammad.nazim.amirul.nazle.asmade@altera.com, 
	rohan.g.thomas@altera.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_225724_222592_C438AA83 
X-CRM114-Status: GOOD (  51.24  )
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

Hi,

Thanks for the review.  Findings 1, 3, 4 and 5 are valid, we agree and
will fix them in the
respin.

Finding 2 we'd like to keep as-is; reason below.

On Mon, Oct 5, 2026 at 8:17=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 5 (2) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] When the FIFO-clear poll times out in the EXTTS 'on' path of
>   stmmac_enable() (stmmac_ptp.c:262-275), the new rollback only sets=E2=
=80=A6
> - [Medium] Auxiliary snapshots are only drained by
>   dwxgmac2_timestamp_interrupt(), called from stmmac_common_interrupt()=
=E2=80=A6

The snapshot itself is not lost: ATSNS stays non-zero and the next entry
into the handler drains the FIFO.  What can be lost is only the
interrupt for that particular event - if the TX poll clears TSIS
entirely inside an already-active servicing window, the level is
already low at EOI and no new interrupt is latched - so delivery is
delayed, not dropped.

This is a deliberate trade-off, because the alternative (gating on
XGMAC_INT_TSIS like dwmac4) is worse: TSIS is aggregate and
read-to-clear, and dwxgmac2_get_mac_tx_timestamp() polls the same
register for TXTSC, so a TSIS gate would silently drop real EXTTS
events.  Note that switching the TX path to descriptor timestamps is
not possible on XGMAC: dwxgmac2_get_tx_timestamp_status() returns 0,
the MAC-level timestamp in XGMAC_TIMESTAMP_STATUS is the only source.
So the choice is a bounded delay vs. silent loss, and we pick the delay
(the snapshot is still in the FIFO and ATSNS tells the next handler
entry to drain it).

> - [Medium] dwxgmac2_timestamp_interrupt() (dwxgmac2_core.c:1163-1212)
>   reads STMMAC_FLAG_INT_SNAPSHOT_EN (line 1171),=E2=80=A6

We will add the synchronize_irq().  The handler runs in hard IRQ and
cannot take aux_ts_lock, which is a mutex: each of the flush/drain paths
holds it across one or two readl_poll_timeout() calls (up to 10 ms
each), so the handler can never acquire it and the flag stays the only
exclusion the handler itself can read.

A spinlock would close the window fully, but it cannot hold these
paths: readl_poll_timeout() sleeps, so it cannot run under a spinlock.
Moving the polls out of the lock would reintroduce the concurrent
FIFO-flush race that patch 1 fixes, and busy-waiting under a spinlock
for up to 20 ms with interrupts disabled is not acceptable.  So a
spinlock is out of proportion here.

synchronize_irq() after raising STMMAC_FLAG_INT_SNAPSHOT_EN gives the
part that matters: any handler already past the flag check is drained
before the cross-timestamp proceeds, and any later handler sees the flag
set.  It needs to cover both the MAC IRQ and the separate WoL IRQ, since
stmmac_common_interrupt() runs from both.  One residual window remains:
an EXTTS enable's ATSFC flush can still complete between the handler's
ATSNS read and its ATSFC read, because that is a check-then-act within a
single handler pass that synchronize_irq() cannot serialize.

> - [Medium] In stmmac_enable(), the new XGMAC_TSIE arm/disarm call
>   (stmmac_ptp.c:269-270, stmmac_mac_timestamp_interrupt_cfg(priv, on))=E2=
=80=A6
> - [Medium] The patch arms XGMAC_TSIE on demand
>   (dwxgmac2_timestamp_interrupt_cfg, dwxgmac2_core.c:45-49) and re-arms=
=E2=80=A6
>
> Pre-existing issues:
> - [Medium] In the PTP_CLK_REQ_EXTTS case of stmmac_enable(), line 231
>   clears the ATSEN bits (`acr_value &=3D ~PTP_ACR_MASK`) before line 234=
=E2=80=A6
> - [Medium] smtg_crosststamp() checks STMMAC_FLAG_EXT_SNAPSHOT_EN (dwmac-
>   socfpga.c:310) before it takes aux_ts_lock (line 313), and=E2=80=A6
>
> --
>
> net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support
>
> This commit adds a DWXGMAC2-specific timestamp interrupt handler. The
> handler reads XGMAC_TIMESTAMP_STATUS and reports pending auxiliary
> snapshots as PTP_CLOCK_EXTTS events.
>
> XGMAC_TSIE is armed on demand from the EXTTS path of stmmac_enable()
> through a new timestamp_interrupt_cfg() callback. It is re-armed on
> resume by stmmac_rearm_timestamp_irq(). smtg_crosststamp() now sets
> STMMAC_FLAG_INT_SNAPSHOT_EN while it owns the snapshot FIFO.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > index c5f71bfc7cf42..9030cc1cc6778 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > @@ -311,6 +311,7 @@ static int smtg_crosststamp(ktime_t *device, struct=
 system_counterval_t *system,
> >               return -EBUSY;
> >
> >       mutex_lock(&priv->aux_ts_lock);
> > +     priv->plat->flags |=3D STMMAC_FLAG_INT_SNAPSHOT_EN;
>
> [Severity: Medium]
> This is a pre-existing issue, but smtg_crosststamp() checks
> STMMAC_FLAG_EXT_SNAPSHOT_EN before it takes aux_ts_lock:
>
>         if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
>                 return -EBUSY;
>
>         mutex_lock(&priv->aux_ts_lock);
>
> Also, the enable path of stmmac_enable() never checks
> STMMAC_FLAG_INT_SNAPSHOT_EN. ptp_sys_offset_precise() does not take
> pincfg_mux, so a concurrent PTP_EXTTS_REQUEST can set
> STMMAC_FLAG_EXT_SNAPSHOT_EN and ATSEN(idx) inside that window.
> smtg_crosststamp() then overwrites PTP_ACR with the internal channel.
>
> Does that leave STMMAC_FLAG_EXT_SNAPSHOT_EN set, ext_snapshot_num =3D idx
> and TSIE armed, while the user's channel is no longer enabled in
> PTP_ACR? Later cross-timestamps would then return -EBUSY until the
> channel is disabled and enabled again.
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index 1a88cbaed70ca..313c24e9a49d7 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>
> [ ... ]
>
> > @@ -1154,6 +1160,57 @@ static int dwxgmac2_get_mac_tx_timestamp(struct =
mac_device_info *hw, u64 *ts)
> >       return 0;
> >  }
> >
> > +void dwxgmac2_timestamp_interrupt(struct stmmac_priv *priv)
> > +{
> > +     u32 ts_status, pending_snapshots, acr_value, channel;
> > +     struct ptp_clock_event event;
> > +     unsigned long flags;
> > +     u64 ptp_time;
> > +     int i;
> > +
> > +     if (priv->plat->flags & STMMAC_FLAG_INT_SNAPSHOT_EN) {
> > +             /* Read the status to clear the timestamp interrupt sourc=
e;
> > +              * the FIFO belongs to the cross-timestamp path.
> > +              */
> > +             readl(priv->ioaddr + XGMAC_TIMESTAMP_STATUS);
> > +             return;
> > +     }
> > +
> > +     /* Reading XGMAC_TIMESTAMP_STATUS clears the TSIS and AUXTSTRIG
> > +      * bits, so the ATSNS count is the only reliable indication of
> > +      * pending auxiliary snapshots.  TXTSC is cleared by
> > +      * XGMAC_TXTIMESTAMP_SEC and is not affected by this read.
> > +      */
> > +     ts_status =3D readl(priv->ioaddr + XGMAC_TIMESTAMP_STATUS);
>
> [Severity: Medium]
> The commit message says TSIS is "an aggregate, read-to-clear bit that
> the TX timestamp completion path (which polls the same register for
> TXTSC) clears before the handler can observe it". That covers the case
> where this handler runs and finds TSIS already clear. What happens if
> the handler never runs?
>
> dwxgmac2_get_mac_tx_timestamp() polls the same register:
>
>         if (readl_poll_timeout_atomic(ioaddr + XGMAC_TIMESTAMP_STATUS,
>                                       value, value & XGMAC_TXTSC, 100, 10=
000))
>
> Suppose one of those reads lands after an aux snapshot has set TSIS but
> before the CPU takes the MAC interrupt. TSIS was the only enabled
> source, so a level-triggered MAC interrupt line would deassert before
> stmmac_common_interrupt() runs.
>
> Only stmmac_common_interrupt() calls this handler, and nothing else
> checks ATSNS. Would the snapshot then stay in the FIFO until some
> unrelated MAC interrupt arrives? With a 1PPS source that could be about
> a second later. In multi-vector/MSI mode, DMA interrupts do not go
> through stmmac_common_interrupt(), so it could take much longer.
>
> The trigger is EXTTS enabled together with TX hardware timestamping.
> stmmac_get_tx_hwtstamp() falls back to stmmac_get_mac_tx_timestamp()
> when the descriptor has no timestamp. Whether the interrupt is really
> lost depends on how the interrupt line is triggered.
>
> > +
> > +     if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN) || !priv->=
ptp_clock)
> > +             return;
> > +
> > +     pending_snapshots =3D FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, ts_st=
atus);
> > +     if (!pending_snapshots)
> > +             return;
> > +
> > +     acr_value =3D readl(priv->ptpaddr + PTP_ACR);
> > +     /* Entries observed while the FIFO is being flushed are stale. */
> > +     if (acr_value & PTP_ACR_ATSFC)
> > +             return;
> > +     channel =3D FIELD_GET(PTP_ACR_MASK, acr_value);
> > +     if (!channel)
> > +             return;
> > +     channel =3D ilog2(channel);
> > +
> > +     for (i =3D 0; i < pending_snapshots; i++) {
> > +             read_lock_irqsave(&priv->ptp_lock, flags);
> > +             stmmac_get_ptptime(priv, priv->ptpaddr, &ptp_time);
> > +             read_unlock_irqrestore(&priv->ptp_lock, flags);
>
> [Severity: Medium]
> Are these checks enough to keep this loop off the FIFO? Each of
> STMMAC_FLAG_INT_SNAPSHOT_EN, STMMAC_FLAG_EXT_SNAPSHOT_EN and
> PTP_ACR_ATSFC is read once without a lock. The loop then drains a
> pending_snapshots count that was sampled earlier.
>
> Three process-context paths flush or consume the same FIFO:
> smtg_crosststamp(), the ATSFC flush in stmmac_enable(), and
> stmmac_rearm_timestamp_irq(). They serialize on aux_ts_lock, which this
> handler cannot take, and none of them calls synchronize_irq().
>
> ptp_lock does not help, because this loop and smtg_crosststamp() both
> take it as readers. Arming TSIE only after the flush does not
> synchronize anything either. stmmac_common_interrupt() calls this
> handler on every common interrupt whatever the TSIE state.
> stmmac_request_irq_single() also registers stmmac_interrupt on the
> separate WoL line, so two copies of this drain can run at the same time.
>
> Two windows look possible:
>
> (A) The handler samples a stale ATSNS. A concurrent enable then sets
> STMMAC_FLAG_EXT_SNAPSHOT_EN and its flush completes. The handler sees
> EXT set and ATSFC clear, and pops entries from the flushed FIFO as
> EXTTS events.
>
> (B) The handler is already past the STMMAC_FLAG_INT_SNAPSHOT_EN check
> and inside this loop when an EXTTS disable and then smtg_crosststamp()
> run. The loop pops the internal cross-timestamp snapshot and reports it
> as an EXTTS event, and smtg_crosststamp() gets the wrong device time.
>
> Doesn't this contradict two claims in the commit message, that "a
> stale snapshot is never reported as an event" and that the handler
> "leaves the snapshot FIFO alone while an internal cross-timestamp owns
> it"?
>
> smtg_crosststamp() sets STMMAC_FLAG_INT_SNAPSHOT_EN on entry and clears
> it on exit to keep the IRQ handler out, so the flag is acting as a
> lock. Would a spinlock shared by the handler and the flush/drain paths,
> or a synchronize_irq() after raising the flag, be more robust?
>
> The windows are narrow on non-RT kernels. They are wider on PREEMPT_RT,
> where the handler runs as a preemptible thread.
>
> > +
> > +             event.type =3D PTP_CLOCK_EXTTS;
> > +             event.index =3D channel;
> > +             event.timestamp =3D ptp_time;
> > +             ptp_clock_event(priv->ptp_clock, &event);
> > +     }
> > +}
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 3ad9252bf6aea..53aaf2716c467 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>
> [ ... ]
>
> > @@ -8418,6 +8467,8 @@ int stmmac_resume(struct device *dev)
> >               ret =3D stmmac_init_timestamping(priv);
> >               if (ret)
> >                       goto error_stop_dma;
> > +
> > +             stmmac_rearm_timestamp_irq(priv);
> >       }
>
> [Severity: Medium]
> TSIE is re-armed here on resume. Is there a matching disarm on suspend?
>
> With Wake-on-LAN configured, stmmac_suspend() does:
>
>         if (priv->wolopts) {
>                 stmmac_pmt(priv, priv->hw, priv->wolopts);
>                 priv->irq_wake =3D 1;
>
> It leaves XGMAC_INT_EN and PTP_ACR as they are, and dwxgmac2_pmt() only
> writes XGMAC_PMT and RX_CONFIG. Clocks stay on for WoL, so each
> external trigger edge, for example a GNSS 1PPS, sets TSIS and asserts
> the MAC interrupt. stmmac_common_interrupt() then does:
>
>         if (priv->irq_wake)
>                 pm_wakeup_event(priv->device, 0);
>
> Could this abort system suspend? Could it also wake the system after
> the noirq phase when the MAC IRQ is the wake IRQ? stmmac_pci uses
> pdev->irq, and stmmac_platform falls back to the MAC IRQ.
>
> Before this patch XGMAC_TSIE was never set on XGMAC, so this would be a
> new wake source. Whether the wake after noirq happens depends on how
> the platform wires the wake IRQ and gates clocks.
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > index 3bfcc9760dce7..19fa79839e465 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > @@ -239,13 +239,20 @@ static int stmmac_enable(struct ptp_clock_info *p=
tp,
> >                               return -EBUSY;
> >                       }
> >
> > +                     if (rq->extts.index >=3D PTP_ACR_ATSEN_NUM) {
> > +                             mutex_unlock(&priv->aux_ts_lock);
> > +                             return -EINVAL;
> > +                     }
> > +
> >                       priv->plat->flags |=3D STMMAC_FLAG_EXT_SNAPSHOT_E=
N;
> > +                     priv->plat->ext_snapshot_num =3D rq->extts.index;
> >
> >                       /* Enable External snapshot trigger */
> >                       acr_value |=3D PTP_ACR_ATSEN(rq->extts.index);
> >                       acr_value |=3D PTP_ACR_ATSFC;
> >               } else {
> >                       priv->plat->flags &=3D ~STMMAC_FLAG_EXT_SNAPSHOT_=
EN;
> > +                     priv->plat->ext_snapshot_num =3D -1;
> >               }
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but can the -EBUSY branch
> above ever be taken? Earlier in this case:
>
>                 acr_value =3D readl(ptpaddr + PTP_ACR);
>                 channel =3D ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
>                 acr_value &=3D ~PTP_ACR_MASK;
>
>                 if (on) {
>                         if (FIELD_GET(PTP_ACR_MASK, acr_value)) {
>
> The ATSEN bits are cleared before they are tested, so the test is
> always false.
>
> The disable branch also ignores rq->extts.index. ptp_extts_request()
> and extts_enable_store() only check index < n_ext_ts. So an enable or
> disable request for one channel can silently retarget or tear down a
> different active channel.
>
> After this patch that teardown also resets ext_snapshot_num and
> disarms XGMAC_TSIE.
>
> >               netdev_dbg(priv->dev, "Auxiliary Snapshot %d %s.\n",
> >                          rq->extts.index, on ? "enabled" : "disabled");
> > @@ -255,6 +262,17 @@ static int stmmac_enable(struct ptp_clock_info *pt=
p,
> >               ret =3D readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
> >                                        !(acr_value & PTP_ACR_ATSFC),
> >                                        10, 10000);
> > +             /* Arm or disarm the timestamp interrupt only once the FI=
FO
> > +              * clear has completed, so the handler does not observe a
> > +              * snapshot that the clear is about to discard.
> > +              */
> > +             if (!ret) {
> > +                     stmmac_mac_timestamp_interrupt_cfg(priv, on);
>
> [Severity: Medium]
> This call runs after aux_ts_lock was dropped just before the poll:
>
>                 writel(acr_value, ptpaddr + PTP_ACR);
>                 mutex_unlock(&priv->aux_ts_lock);
>
> extts_enable_store() calls ops->enable() without pincfg_mux, so it can
> race with the ioctl path or with another sysfs writer. Can a stale on
> or off value be applied here?
>
> disable request A                  enable request B
>   clear flag and ATSEN
>   mutex_unlock()
>   <preempted>
>                                      mutex_lock()
>                                      set flag, ATSEN|ATSFC
>                                      mutex_unlock()
>                                      poll completes
>                                      timestamp_interrupt_cfg(true)
>   poll completes
>   timestamp_interrupt_cfg(false)
>
> That would leave the channel B enabled with XGMAC_TSIE disarmed.
>
> The timeout branch below has the same problem. It re-takes the lock and
> sets ext_snapshot_num =3D -1 unconditionally, which could overwrite the
> channel recorded by a newer successful enable.
>
> > +             } else if (on) {
> > +                     mutex_lock(&priv->aux_ts_lock);
> > +                     priv->plat->ext_snapshot_num =3D -1;
> > +                     mutex_unlock(&priv->aux_ts_lock);
> > +             }
>
> [Severity: Medium]
> When the ATSFC poll times out on enable, only ext_snapshot_num is
> rolled back. STMMAC_FLAG_EXT_SNAPSHOT_EN and the PTP_ACR ATSEN(index)
> bit that were set earlier stay set. Is that intended?
>
> The readers of this state now disagree with each other:
>
> dwxgmac2_timestamp_interrupt() gates on the flag and on PTP_ACR. It runs
> from every stmmac_common_interrupt() even with TSIE disarmed. If ATSFC
> clears later, it can report PTP_CLOCK_EXTTS events for a request that
> returned an error.
>
> stmmac_rearm_timestamp_irq() sees the flag set but ext_snapshot_num < 0
> and skips the restore, so the behaviour changes across suspend and
> resume.
>
> smtg_crosststamp() keeps returning -EBUSY until an explicit disable or
> close.
>
> Should the failure path roll back the flag, the ATSEN bit and
> ext_snapshot_num together?
>
> >               break;
> >       }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261004120526.2728564-1-zxyan0222%40gmail.com

pw-bot: cr

