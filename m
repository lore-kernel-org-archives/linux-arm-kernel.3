Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6275FC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBkl7o8647tLT8kGJCo2FNoCM381VchehoKEFMYlUfo=; b=B/n/cS34lIco2CSTcv9rOf+cTy
	AOGOQAKLPFZLINDLwW7S2usf5hzv/9TwtzRtaOJvPBa9wLpmWlbpX7o/8edMks3Shqo6m04Pjcg/l
	eB/0lCeiUKLVtQfTkkbyAQ8xgF85qApud/vwxVcc5OczCzh3Cn2DpI4sZgOSGJ/w2JWKFaPeIslzC
	iCdDdduxmzhCzVJd8j115mrj/rKGa65sh/SRTESxoQwkENNH/Ovx8UDdFGQC03/y3kWN9nBg2R2Nc
	1y/4EucP/28JHYkGpcN6+1KBDBfBFkL9HHYMuQ8TN4IfCh+CkjBRU44e/2Gx8FB2I9Ve8pqEXWdDU
	H9sEIZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NHU-00000005QA3-2Bc3;
	Tue, 15 Sep 2026 07:08:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NHR-00000005Q9X-1SFE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789456114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HBkl7o8647tLT8kGJCo2FNoCM381VchehoKEFMYlUfo=;
	b=Xs04xlcTFlU9NHbcHwzH/FUuxoK18K7jGWFUStWYPX8A796sCgZxFUqRVzOlf9rpO2Rr6o
	NzGbVvTAdW2wJQcjCZEi9vdO+l6j5MZXjyVRlckobAEQwEhq0iETr8OUP8pSBkfFxrrplc
	zYGEoBE1q7PBNRwIzmFIWnvmjU1jtnA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-L-B5h-PMN_qvaSvAcmpczw-1; Tue,
 15 Sep 2026 03:08:29 -0400
X-MC-Unique: L-B5h-PMN_qvaSvAcmpczw-1
X-Mimecast-MFC-AGG-ID: L-B5h-PMN_qvaSvAcmpczw_1789456108
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1315C195608F;
	Tue, 15 Sep 2026 07:08:27 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.48.83])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3FAD81955F78;
	Tue, 15 Sep 2026 07:08:21 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: zxyan0222@gmail.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	maxime.chevallier@bootlin.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/2] net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support
Date: Tue, 15 Sep 2026 09:08:09 +0200
Message-ID: <20260915070809.20575-1-pabeni@redhat.com>
In-Reply-To: <20260910081020.86227-3-zxyan0222@gmail.com>
References: <20260910081020.86227-3-zxyan0222@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 1p9XSLKqVKap2_2jEgV3pX0RxBRkTGS8OCnQSmasyTw_1789456108
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_000837_568797_193288A6 
X-CRM114-Status: GOOD (  47.65  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://netdev-ai.bots.linux.dev/sashiko/
---
net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support

Adds a DWXGMAC2-specific timestamp interrupt handler that reads
XGMAC_TIMESTAMP_STATUS instead of the dwmac4 offset, derives the pending
auxiliary snapshot count from ATSNS and emits PTP_CLOCK_EXTTS events.  It
also adds XGMAC_TSIE to XGMAC_INT_DEFAULT_EN and points the DWXGMAC2 and
DWXLGMAC2 hwif entries at the new hwtimestamp ops.

A few questions on the commit message and on the new handler.

[Severity: Medium]
The commit message says:

  "used &stmmac_ptp, whose timestamp_interrupt callback read the wrong
   register and whose config_hw_tstamping callback never enabled the
   XGMAC timestamp interrupt (XGMAC_TSIE was not in XGMAC_INT_DEFAULT_EN)"

Is the config_hw_tstamping part accurate?  The new ops struct installs the
very same function that stmmac_ptp uses:

  const struct stmmac_hwtimestamp dwxgmac2_ptp = {
	.config_hw_tstamping = config_hw_tstamping,

and config_hw_tstamping() only does a read-modify-write of PTP_TCR; it never
touches XGMAC_INT_EN.  The single hunk that actually unmasks the interrupt is
the XGMAC_INT_DEFAULT_EN change, which dwxgmac2_core_init() writes to
XGMAC_INT_EN.

The second bullet says the handler:

  "- derives the pending auxiliary snapshot count from the persistent
     ATSNS field instead of the transient AUXTSTRIG status bit"

Is anything changing here?  The generic handler being replaced already used
ATSNS:

  num_snapshot = (ts_status & GMAC_TIMESTAMP_ATSNS_MASK) >>
		 GMAC_TIMESTAMP_ATSNS_SHIFT;

and no AUXTSTRIG bit is defined for XGMAC at all (only
GMAC_TIMESTAMP_AUXTSTRIG in dwmac4.h).

Could the message be reworded so it is clear which hunk is load-bearing?  As
written, someone backporting could take the ops table and handler hunks
without the XGMAC_INT_DEFAULT_EN hunk and still get no events.

[Severity: Low]
The body describes a user-visible failure:

  "As a result, auxiliary snapshot events were never reported on XGMAC
   platforms."

stmmac_ptp_register() already advertises the channels on XGMAC:

  n_ext_ts = priv->dma_cap.aux_snapshot_n;
  if (n_ext_ts)
	  priv->ptp_clock_ops.n_ext_ts = n_ext_ts;

and stmmac_enable() accepts PTP_CLK_REQ_EXTTS, so PTP_EXTTS_REQUEST succeeds
today but no events arrive.  Should this carry a Fixes: tag, or should the
subject drop "add ... support" and state explicitly that EXTTS never worked
on this hardware?  Without either, it is hard to tell which trees are
affected.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index f8ab347f7b5b9..03cbae326995b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -87,7 +87,7 @@
>  #define XGMAC_TSIE			BIT(12)
>  #define XGMAC_LPIIE			BIT(5)
>  #define XGMAC_PMTIE			BIT(4)
> -#define XGMAC_INT_DEFAULT_EN		(XGMAC_LPIIE | XGMAC_PMTIE)
> +#define XGMAC_INT_DEFAULT_EN		(XGMAC_LPIIE | XGMAC_PMTIE | XGMAC_TSIE)

[Severity: High]
Does this revert commit 30300d9f9150 ("net: stmmac: xgmac: Disable the
Timestamp interrupt by default")?  git blame on this line points at that
commit, which removed exactly this bit with the reasoning that XGMAC only
polls for timestamps in the current software implementation and that dropping
the interrupt "greatly reduces the system load by reducing the number of
interrupts".  That commit carried a Fixes: tag.

dwxgmac2_core_init() programs this unconditionally on every ifup:

  writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);

with no check of PTP capability and no check that anything consumes
auxiliary snapshots.  On platforms that never set
STMMAC_FLAG_EXT_SNAPSHOT_EN the new handler returns immediately after one
side-effecting register read, so every aux-snapshot trigger, target-time
match, seconds overflow and TX timestamp capture becomes an interrupt with
no consumer.

Is there also a missing disable counterpart?  XGMAC_INT_EN has only two
writers, dwxgmac2_core_init() and dwxgmac2_irq_modify(), and the latter is
used only for XGMAC_FPEIE and the PCS masks, so TSIE is never cleared.
__stmmac_release() frees the IRQ lines before releasing PTP:

  /* Free the IRQ lines */
  stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
  ...
  stmmac_release_ptp(priv);

which leaves the MAC timestamp source armed with nobody left to read
XGMAC_TIMESTAMP_STATUS and clear TSIS; on an IRQF_SHARED line that shows up
as unhandled interrupts for the co-owner, and stmmac_interrupt() also returns
early on STMMAC_DOWN without acknowledging the source.

Would arming this on demand from the PTP_CLK_REQ_EXTTS path via
dwxgmac2_irq_modify(), the way dwmac1000 does, avoid both problems?

>  #define XGMAC_Qx_TX_FLOW_CTRL(x)	(0x00000070 + (x) * 4)
>  #define XGMAC_PT			GENMASK(31, 16)
>  #define XGMAC_TFE			BIT(1)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 1a88cbaed70ca..891b7ceea2d45 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -1154,6 +1154,49 @@ static int dwxgmac2_get_mac_tx_timestamp(struct mac_device_info *hw, u64 *ts)
>  	return 0;
>  }
>  
> +void dwxgmac2_timestamp_interrupt(struct stmmac_priv *priv)
> +{
> +	u32 ts_status, pending_snapshots, acr_value, channel;
> +	struct ptp_clock_event event;
> +	unsigned long flags;
> +	u64 ptp_time;
> +	int i;
> +
> +	/* Read XGMAC_TIMESTAMP_STATUS to get the AUX snapshot
> +	 * count.  This read also clears the TSIS bit in
> +	 * XGMAC_INT_STATUS.
> +	 * TX timestamp polling may have already cleared TSIS
> +	 * and AUXTSTRIG, so rely on ATSNS instead.
> +	 * TXTSC is cleared by XGMAC_TXTIMESTAMP_SEC, not by
> +	 * this register, so there is no conflict.
> +	 */
> +	ts_status = readl(priv->ioaddr + XGMAC_TIMESTAMP_STATUS);

[Severity: High]
Should this read be gated on the MAC interrupt status bit first?  The
dwmac4 implementation of the same callback checks before touching the
timestamp status register:

  tsync_int = readl(priv->ioaddr + GMAC_INT_STATUS) & GMAC_INT_TSIE;

  if (!tsync_int)
	  return;

The XGMAC equivalent, XGMAC_INT_TSIS, is defined in dwxgmac2.h but after
this series git grep XGMAC_INT_TSIS matches only its own definition, and
dwxgmac2_host_irq_status() does not consume it either.

Without that gate the clear-on-read register is read on every MAC host
interrupt:

  stmmac_interrupt()
    stmmac_common_interrupt()
      stmmac_timestamp_interrupt()
        readl(priv->ioaddr + XGMAC_TIMESTAMP_STATUS)

and in the legacy shared-IRQ configuration stmmac_common_interrupt() runs
before stmmac_dma_interrupt(), so under traffic that read happens for every
RX/TX DMA, LPI, PMT, MTL and EST interrupt as well.

The same register is polled from NAPI/softirq by the pre-existing
dwxgmac2_get_mac_tx_timestamp():

  if (readl_poll_timeout_atomic(ioaddr + XGMAC_TIMESTAMP_STATUS,
				value, value & XGMAC_TXTSC, 100, 10000))
	  return -EBUSY;

reached via stmmac_get_tx_hwtstamp() and stmmac_xsk_fill_timestamp(), with
nothing serializing it against the hardirq read.

The comment above also seems to argue both sides.  If reading
XGMAC_TIMESTAMP_STATUS clears TSIS, as the comment states and as the sibling
patch "net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS"
asserts, does the whole register not go read-clear, including TXTSC?  In that
case the interrupt handler consumes the TX-timestamp-captured status before
the TX clean path sees it, and readl_poll_timeout_atomic() spins its full
10 ms budget in atomic context and returns -EBUSY, losing the MAC level TX
hardware timestamp.

If instead TXTSC really is cleared only by reading XGMAC_TXTIMESTAMP_SEC as
the comment claims, then nothing here drains it, so TSIS stays asserted
whenever a MAC level TX timestamp is captured but never fetched (descriptor
level status in use, or hwts_tx_en turned off).  With XGMAC_TSIE now
unmasked, would that not re-fire the level triggered MAC interrupt
immediately?

Could the comment be reconciled with the databook and the missing
XGMAC_INT_TSIS check added?

> +
> +	if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN))
> +		return;
> +
> +	pending_snapshots = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, ts_status);
> +	if (!pending_snapshots)
> +		return;
> +
> +	acr_value = readl(priv->ptpaddr + PTP_ACR);
> +	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
> +	if (!channel)
> +		return;
> +	channel = ilog2(channel);

[Severity: Medium]
Can this read of PTP_ACR see a half-programmed value?  stmmac_enable() does
its read-modify-write of PTP_ACR under priv->aux_ts_lock, and sets the flag
before the register write:

  priv->plat->flags |= STMMAC_FLAG_EXT_SNAPSHOT_EN;
  ...
  writel(acr_value, ptpaddr + PTP_ACR);

priv->aux_ts_lock is a mutex ("Protects auxiliary snapshot registers from
concurrent access." in stmmac.h), so a hardirq handler cannot take it.  An
interrupt landing in that window sees the flag set with a stale PTP_ACR and
reports the snapshot with the wrong event.index; on the disable path it can
see the flag still set with the mask already cleared, take the
if (!channel) return; exit and drop the pending ATSNS snapshots.

priv->plat->flags itself is now a plain non-atomic |= / &= shared with a
hardirq reader, with no READ_ONCE()/WRITE_ONCE() or barrier.  Is that
intentional?

[Severity: High]
This isn't a bug introduced by this patch, but the guard added here is
missing from the shared dwmac4 handler that this new code was modelled on.
In timestamp_interrupt() in stmmac_hwtstamp.c:

  channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));

For a non-constant u32, ilog2() expands to __ilog2_u32(n) = fls(n) - 1, so
ilog2(0) is -1.  Stored into the u32 channel and then into event.index it
becomes -1, and ptp_clock_event() uses it without range validation:

  drivers/ptp/ptp_clock.c:ptp_clock_event() {
	  ...
	  if (test_bit((unsigned int)event->index, tsevq->mask))
	  ...
  }

tsevq->mask is bitmap_alloc(PTP_MAX_CHANNELS, ...), i.e. 2048 bits, so bit
index 0xFFFFFFFF is a read roughly 512 MB past a 256-byte allocation, taken
from hard IRQ context.

The window is the same one described above: stmmac_enable() sets
STMMAC_FLAG_EXT_SNAPSHOT_EN before writing PTP_ACR, and if a timestamp
interrupt arrives with ATSNS non-zero (snapshots left in the FIFO from a
previous session, since ATSNS is cleared only by PTP_ACR_ATSFC) the handler
sees flag set and mask zero.

Would it make sense to move the if (!channel) return; check into the shared
handler as part of this series, so dwmac4/dwmac410/dwmac510 get it too?

> +
> +	for (i = 0; i < pending_snapshots; i++) {
> +		read_lock_irqsave(&priv->ptp_lock, flags);
> +		stmmac_get_ptptime(priv, priv->ptpaddr, &ptp_time);
> +		read_unlock_irqrestore(&priv->ptp_lock, flags);

[Severity: Medium]
Does the read side of priv->ptp_lock give any exclusion here?  This loop pops
the auxiliary snapshot FIFO, and get_ptptime() is a two-register consuming
access:

  ns = readl(ptpaddr + PTP_ATNR);
  ns += (u64)readl(ptpaddr + PTP_ATSR) * NSEC_PER_SEC;

An rwlock read side does not exclude other readers, and on XGMAC there is a
second consumer of the same FIFO in process context, smtg_crosststamp() in
dwmac-socfpga.c:

  for (i = 0; i < num_snapshot; i++) {
	  read_lock_irqsave(&priv->ptp_lock, flags);
	  stmmac_get_ptptime(priv, ptpaddr, &ptp_time);

The only thing keeping the two apart appears to be an unlocked flag test on
each side:

  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:smtg_crosststamp() {
	  if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
		  return -EBUSY;
	  ...
  }

Since that check happens well before the drain loop (with 10 ms
readl_poll_timeout budgets in between), can a PTP_EXTTS_REQUEST arriving
after the check arm the interrupt path while smtg_crosststamp() is still
draining, letting both pop the same FIFO and interleave their PTP_ATNR /
PTP_ATSR reads?

> +
> +		event.type = PTP_CLOCK_EXTTS;
> +		event.index = channel;

[Severity: Medium]
This is a pre-existing issue, but it interacts with the new index
derivation.  In stmmac_enable(), the PTP_CLK_REQ_EXTTS path clears the
channel mask before testing it:

  acr_value &= ~PTP_ACR_MASK;

  if (on) {
	  if (FIELD_GET(PTP_ACR_MASK, acr_value)) {
		  ... return -EBUSY;

so the tested field is always zero and the -EBUSY rejection of a second
active channel never fires.  Since stmmac_ptp_register() advertises
dma_cap.aux_snapshot_n channels, a second PTP_EXTTS_REQUEST succeeds and
silently replaces the channel that was enabled.

With that, does the index computed here get attached to the wrong events?
Snapshots latched while the first channel was armed would be reported under
the replacement channel's index.

> +		event.timestamp = ptp_time;
> +		ptp_clock_event(priv->ptp_clock, &event);
> +	}
> +}
> +

[ ... remaining hunks in hwif.c, hwif.h, stmmac_hwtstamp.c and
stmmac_ptp.h snipped ... ]
-- 
This is an AI-generated review.


