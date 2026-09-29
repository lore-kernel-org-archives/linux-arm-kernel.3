Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87B3CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3vIaoJznmnC3QOQ//cFZXaZ2tH8nkehUMIldx+++xA=; b=wghl8YZW4Irbb/TrYeNjI2AdWf
	uALWmrczAC4KWxa7yGRFSwdYC02jru+Ng6EsVxZJXncJRoRIXibkM32r1+H6NbykzQHdwQlTLuvMc
	5vdkF7NjBpu9A/Rky58sx35X6UHaQ2stT5wysfUQ53NaB1tSwQNVzwS8J/Pv3ciohZWMDQgBMUCPc
	2SV7Ts/gzqPa3szRitAYDFCwfgKXG3FBaP8YmlkiYmGZh86vtIi7IwGGbewoM6/fDFE9qfW+mMTMu
	vt2ELwABESjQ7Bi4S4AxoNMY1bBy3v2ZwRz8WlWdXLIgpZbAPqWOnhlciaoPwuFPzw7jXw0LJZRdJ
	eReY71gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSP4-00000002dKT-3W6z;
	Tue, 29 Sep 2026 07:37:30 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSP0-00000002dIz-2XEd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:37:27 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so1260599a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790667446; x=1791272246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3vIaoJznmnC3QOQ//cFZXaZ2tH8nkehUMIldx+++xA=;
        b=EUPV2jdc/a/HbC6yyxQRRiH3uuUfGuAimukJJpf/9AGFAupcsCCeVeGvGunRw+sUDz
         HIV92C6FartlDe36M4N/Wue/y4lq/zWOjqp+S7pcprvYemlPiMzldHrG0yNcpiMxZXV6
         d57JgjMqCh7StusmnHDyhUDJItg/QwDTaSdcoianhAIFvSIpZ996NKG/Gy88DJzF3stu
         3N8pjLrtRFDJnh1cjRUQfcjcw/QnbmlnxgnxySn1i4uf/9bRgagz9T/TeIfO3rSxkwgH
         jkSOvMHyqH+4AtgdsvcJMs89sYEZHrpUFKkHW+fi2R6+bkiLxj9GtDUfaiQBqY48K7/l
         IZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790667446; x=1791272246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3vIaoJznmnC3QOQ//cFZXaZ2tH8nkehUMIldx+++xA=;
        b=azLpy6+GWMIeRFYRzyeRYW9ECQgDPZK3yi6gce+yEJrFL+Q5RKQwpET3T0l4RKTRbY
         rEhlgAA0ovx0WMMvpYcgTatQ8HGIkk0q/5bPga8ouFIsPn1AbkTR2bP8wDpFiQKGGph7
         hkfM1wutUUQ/l1usWTjjrcXuMvEAp3vv67TVAToKBiUxIo0QfJTyWeBQDKe5hNBJupTR
         W1vKMUtjkGO7apy1FkTJx38nbO1d1R88ggd+Jn/g07Zs010rwqJOKdMQqSZNy9nbEiWX
         w+OTChIIH+vA5ietcgCIsXptWxAhGM15WGahxTGlzkt3pAufMXJoPRR5jjfDvP60Kjny
         hB2w==
X-Forwarded-Encrypted: i=1; AKwUvBwF6hnV5tr9t/e3S82FM+NStHG4NWzKkSalkNY5qlrYFHNl6AdeRtIGSlcnAiCvlf6xjzvOPAB/Tlsi8odygHJ0@lists.infradead.org
X-Gm-Message-State: AFq9FYKDqyXNXSwQmZ7SLOXk14BT4+VKpQbVUbWmo83eAeANVz/9pr72
	BzeAIcNgeFeDOKQJ9rt6W01swUvhF3aZyV5YeF0PK0ZwDrLtHQlGWmAP
X-Gm-Gg: AYBFou2nFHM3hwQvPzLTZAcWvfSZm7z/GULnXE1jKAgdHm6wmBkXwm7aR/GxZAJWX7l
	xMellYLnXDxuT1T+ouHxAgOGGFMFgFswbSJVMmVXJKp7M536BjSCEJ2Pf22ifkyENJl5dHhhpPL
	Oea1ew2j8L5GHRSxVzYIg8Xc2RPjP5rCECnCaikvuZ5rALeJJTXqL2FykmUX6IXYdmEB4RT/AFv
	70QLUv3rDF1t+HuDN641J7/w+GZ34PZGTq5OZD6hqY2XCT5NcIdpQJqFedXUohLePIY4AgVb5oo
	I9V0eGKQITSPHkwF6nAbgygq13YK14/o6QXV7YWA0b3Kqg15Yn19iRXhvqFyU0wnyc5cVpNOJMa
	yagHY/b+DBC5Qtbsn3V/3sb76PxBDWJAFaCJSszWI7kgMIAOn1HjbytDCFfGYwXPb/2YKassgLp
	3MJlLQLtB6oEoV4OpzeHG9y+MMDQOd5Ji6bbH8iVqby4m8gXmGEFKNtmDBp0zaa8sYfb0ClQ==
X-Received: by 2002:a17:90b:564d:b0:3a4:6ff6:413b with SMTP id 98e67ed59e1d1-3a46ff6485amr2002042a91.47.1790667445538;
        Tue, 29 Sep 2026 00:37:25 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498ecc986sm1328708a91.3.2026.09.29.00.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:37:25 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	maxime.chevallier@bootlin.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v6 3/3] net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support
Date: Tue, 29 Sep 2026 15:35:53 +0800
Message-Id: <20260929073553.4136336-4-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929073553.4136336-1-zxyan0222@gmail.com>
References: <20260929073553.4136336-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_003726_677665_DFC08DA4 
X-CRM114-Status: GOOD (  29.03  )
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

The DWXGMAC2 hwif entries use the generic stmmac_ptp hwtimestamp ops,
whose timestamp_interrupt callback reads the dwmac4 offset
GMAC_TIMESTAMP_STATUS (0xb20) instead of the XGMAC register at 0xd20,
and whose interrupt enable mask XGMAC_INT_DEFAULT_EN omits XGMAC_TSIE.
The PTP clock nevertheless advertises the auxiliary snapshot channels
on XGMAC, so PTP_EXTTS_REQUEST succeeds but no PTP_CLOCK_EXTTS event is
ever delivered.

Fix this with a dedicated DWXGMAC2 timestamp interrupt handler that
reads XGMAC_TIMESTAMP_STATUS and reports the pending auxiliary
snapshots as PTP_CLOCK_EXTTS events.  The handler deliberately does
not gate its status read on XGMAC_INT_TSIS: TSIS is an aggregate,
read-to-clear bit that the TX timestamp completion path (which polls
the same register for TXTSC) clears before the handler can observe
it, while ATSNS and the snapshot FIFO still hold the aux events.  A
dwmac4-style TSIS gate would silently drop them.

XGMAC_TSIE is not added back to XGMAC_INT_DEFAULT_EN, which
30300d9f9150 ("net: stmmac: xgmac: Disable the Timestamp interrupt by
default") deliberately keeps clear.  Instead it is armed on demand from
the PTP_CLK_REQ_EXTTS enable/disable path of stmmac_enable(), through a
new optional stmmac_ops->timestamp_interrupt_cfg() callback implemented
only for DWXGMAC2/DWXLGMAC2 (on top of dwxgmac2_irq_modify()), like
dwmac1000 does with dwmac1000_timestamp_interrupt_cfg().  This keeps
platforms that do not use EXTTS at their current interrupt load and
leaves the other cores untouched: stmmac_enable() is shared with
dwmac4/dwmac5, whose timestamp interrupt stays always-enabled and is
relied upon by intel_crosststamp(), so a direct irq_modify() call
there is not an option; cores that do not implement the callback keep
their current behaviour.

The interrupt is only touched after the PTP_ACR_ATSFC FIFO clear has
completed, and the handler refuses to drain entries while that clear
is still in flight, so a stale snapshot is never reported as an event;
if the clear times out, the error is returned without changing the
interrupt state.  The handler also leaves the snapshot FIFO alone
while an internal cross-timestamp owns it: smtg_crosststamp() sets
STMMAC_FLAG_INT_SNAPSHOT_EN for the duration of the cross-timestamp,
raised and dropped under aux_ts_lock so concurrent requests cannot
lose it, and the handler returns early when that flag is set, mirroring
the dwmac4 handler's treatment of intel_crosststamp().

The timestamp interrupt is also disarmed after
ptp_clock_unregister(), which drops STMMAC_FLAG_EXT_SNAPSHOT_EN as
well.  stmmac_hw_setup() reprograms
XGMAC_INT_EN from XGMAC_INT_DEFAULT_EN on resume, which drops
XGMAC_TSIE, so
stmmac_rearm_timestamp_irq() re-arms it there whenever an auxiliary
snapshot channel was left enabled.

Fixes: 4bb7aff9e6d0 ("net: stmmac: Add PTP support for XGMAC2")
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  5 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 54 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  5 ++
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 12 +++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 14 +++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  9 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
 8 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index c5f71bfc7cf4..9030cc1cc677 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -311,6 +311,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		return -EBUSY;
 
 	mutex_lock(&priv->aux_ts_lock);
+	priv->plat->flags |= STMMAC_FLAG_INT_SNAPSHOT_EN;
 	/* Enable Internal snapshot trigger */
 	acr_value = readl(ptpaddr + PTP_ACR);
 	acr_value &= ~PTP_ACR_MASK;
@@ -328,6 +329,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		acr_value |= PTP_ACR_ATSEN3;
 		break;
 	default:
+		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 		mutex_unlock(&priv->aux_ts_lock);
 		return -EINVAL;
 	}
@@ -344,6 +346,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
 				 !(acr_value & PTP_ACR_ATSFC), 10, 10000);
 	if (ret) {
+		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 		mutex_unlock(&priv->aux_ts_lock);
 		netdev_err(priv->dev, "%s: Failed to clear snapshot FIFO\n",
 			   __func__);
@@ -368,6 +371,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 				 FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v),
 				 100, 10000);
 	if (ret) {
+		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 		mutex_unlock(&priv->aux_ts_lock);
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
@@ -390,6 +394,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		read_unlock_irqrestore(&priv->ptp_lock, flags);
 	}
 
+	priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 	mutex_unlock(&priv->aux_ts_lock);
 
 	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1a88cbaed70c..8a39028fa4bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -42,6 +42,12 @@ static void dwxgmac2_irq_modify(struct mac_device_info *hw, u32 disable,
 	spin_unlock_irqrestore(&hw->irq_ctrl_lock, flags);
 }
 
+static void dwxgmac2_timestamp_interrupt_cfg(struct stmmac_priv *priv, bool en)
+{
+	stmmac_mac_irq_modify(priv, en ? 0 : XGMAC_TSIE,
+			      en ? XGMAC_TSIE : 0);
+}
+
 static void dwxgmac2_update_caps(struct stmmac_priv *priv)
 {
 	if (!priv->dma_cap.mbps_10_100)
@@ -1154,6 +1160,52 @@ static int dwxgmac2_get_mac_tx_timestamp(struct mac_device_info *hw, u64 *ts)
 	return 0;
 }
 
+void dwxgmac2_timestamp_interrupt(struct stmmac_priv *priv)
+{
+	u32 ts_status, pending_snapshots, acr_value, channel;
+	struct ptp_clock_event event;
+	unsigned long flags;
+	u64 ptp_time;
+	int i;
+
+	if (priv->plat->flags & STMMAC_FLAG_INT_SNAPSHOT_EN)
+		return;
+
+	/* Reading XGMAC_TIMESTAMP_STATUS clears the TSIS and AUXTSTRIG
+	 * bits, so the ATSNS count is the only reliable indication of
+	 * pending auxiliary snapshots.  TXTSC is cleared by
+	 * XGMAC_TXTIMESTAMP_SEC and is not affected by this read.
+	 */
+	ts_status = readl(priv->ioaddr + XGMAC_TIMESTAMP_STATUS);
+
+	if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN) || !priv->ptp_clock)
+		return;
+
+	pending_snapshots = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, ts_status);
+	if (!pending_snapshots)
+		return;
+
+	acr_value = readl(priv->ptpaddr + PTP_ACR);
+	/* Entries observed while the FIFO is being flushed are stale. */
+	if (acr_value & PTP_ACR_ATSFC)
+		return;
+	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
+	if (!channel)
+		return;
+	channel = ilog2(channel);
+
+	for (i = 0; i < pending_snapshots; i++) {
+		read_lock_irqsave(&priv->ptp_lock, flags);
+		stmmac_get_ptptime(priv, priv->ptpaddr, &ptp_time);
+		read_unlock_irqrestore(&priv->ptp_lock, flags);
+
+		event.type = PTP_CLOCK_EXTTS;
+		event.index = channel;
+		event.timestamp = ptp_time;
+		ptp_clock_event(priv->ptp_clock, &event);
+	}
+}
+
 static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
 				    struct stmmac_pps_cfg *cfg, bool enable,
 				    u32 sub_second_inc, u32 systime_flags)
@@ -1413,6 +1465,7 @@ static int dwxgmac2_config_l4_filter(struct mac_device_info *hw, u32 filter_no,
 const struct stmmac_ops dwxgmac210_ops = {
 	.core_init = dwxgmac2_core_init,
 	.irq_modify = dwxgmac2_irq_modify,
+	.timestamp_interrupt_cfg = dwxgmac2_timestamp_interrupt_cfg,
 	.update_caps = dwxgmac2_update_caps,
 	.set_mac = dwxgmac2_set_mac,
 	.rx_ipc = dwxgmac2_rx_ipc,
@@ -1468,6 +1521,7 @@ static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
 const struct stmmac_ops dwxlgmac2_ops = {
 	.core_init = dwxgmac2_core_init,
 	.irq_modify = dwxgmac2_irq_modify,
+	.timestamp_interrupt_cfg = dwxgmac2_timestamp_interrupt_cfg,
 	.set_mac = dwxgmac2_set_mac,
 	.rx_ipc = dwxgmac2_rx_ipc,
 	.rx_queue_enable = dwxlgmac2_rx_queue_enable,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 265671170bf6..eba87410f985 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -258,7 +258,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwxgmac210_dma_ops,
 		.mac = &dwxgmac210_ops,
 		.vlan = &dwxgmac210_vlan_ops,
-		.hwtimestamp = &stmmac_ptp,
+		.hwtimestamp = &dwxgmac2_ptp,
 		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = &dwmac510_tc_ops,
@@ -280,7 +280,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwxgmac210_dma_ops,
 		.mac = &dwxlgmac2_ops,
 		.vlan = &dwxlgmac2_vlan_ops,
-		.hwtimestamp = &stmmac_ptp,
+		.hwtimestamp = &dwxgmac2_ptp,
 		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = &dwmac510_tc_ops,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index fe18f98fae45..345bb8bdee86 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -317,6 +317,8 @@ struct stmmac_ops {
 	void (*update_caps)(struct stmmac_priv *priv);
 	/* Change the interrupt enable setting. Enable takes precedence. */
 	void (*irq_modify)(struct mac_device_info *hw, u32 disable, u32 enable);
+	/* Arm or disarm the timestamp interrupt on demand (optional) */
+	void (*timestamp_interrupt_cfg)(struct stmmac_priv *priv, bool en);
 	/* Enable the MAC RX/TX */
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
@@ -420,6 +422,8 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, update_caps, __priv)
 #define stmmac_mac_irq_modify(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, irq_modify, (__priv)->hw, __args)
+#define stmmac_mac_timestamp_interrupt_cfg(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, timestamp_interrupt_cfg, __priv, __args)
 #define stmmac_mac_set(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_mac, __args)
 #define stmmac_rx_ipc(__priv, __args...) \
@@ -672,6 +676,7 @@ extern const struct stmmac_desc_ops ndesc_ops;
 
 extern const struct stmmac_hwtimestamp stmmac_ptp;
 extern const struct stmmac_hwtimestamp dwmac1000_ptp;
+extern const struct stmmac_hwtimestamp dwxgmac2_ptp;
 
 extern const struct stmmac_mode_ops ring_mode_ops;
 extern const struct stmmac_mode_ops chain_mode_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 2a076e228e9a..4b906bc33d26 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -280,3 +280,15 @@ const struct stmmac_hwtimestamp dwmac1000_ptp = {
 	.get_ptptime = dwmac1000_get_ptptime,
 	.timestamp_interrupt = dwmac1000_timestamp_interrupt,
 };
+
+const struct stmmac_hwtimestamp dwxgmac2_ptp = {
+	.config_hw_tstamping = config_hw_tstamping,
+	.init_systime = init_systime,
+	.config_sub_second_increment = config_sub_second_increment,
+	.config_addend = config_addend,
+	.adjust_systime = adjust_systime,
+	.get_systime = get_systime,
+	.get_ptptime = get_ptptime,
+	.timestamp_interrupt = dwxgmac2_timestamp_interrupt,
+	.hwtstamp_correct_latency = hwtstamp_correct_latency,
+};
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 66ae365e1c89..357dd197298f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -885,6 +885,19 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 	return 0;
 }
 
+/**
+ * stmmac_rearm_timestamp_irq - re-arm the timestamp interrupt
+ * @priv: driver private structure
+ * Description: this re-arms the on-demand timestamp interrupt if an
+ * auxiliary snapshot channel was left enabled.
+ */
+static void stmmac_rearm_timestamp_irq(struct stmmac_priv *priv)
+{
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN &&
+	    priv->ptp_clock)
+		stmmac_mac_timestamp_interrupt_cfg(priv, true);
+}
+
 /**
  * stmmac_init_timestamping - initialise timestamping
  * @priv: driver private structure
@@ -8314,6 +8327,7 @@ int stmmac_resume(struct device *dev)
 	}
 
 	stmmac_init_timestamping(priv);
+	stmmac_rearm_timestamp_irq(priv);
 
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 960249960004..971cea455803 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -255,6 +255,12 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
 					 !(acr_value & PTP_ACR_ATSFC),
 					 10, 10000);
+		/* Arm or disarm the timestamp interrupt only once the FIFO
+		 * clear has completed, so the handler does not observe a
+		 * snapshot that the clear is about to discard.
+		 */
+		if (!ret)
+			stmmac_mac_timestamp_interrupt_cfg(priv, on);
 		break;
 	}
 
@@ -395,6 +401,9 @@ void stmmac_ptp_unregister(struct stmmac_priv *priv)
 		pr_debug("Removed PTP HW clock successfully on %s\n",
 			 priv->dev->name);
 
+		stmmac_mac_timestamp_interrupt_cfg(priv, false);
+		priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
+
 		mutex_destroy(&priv->aux_ts_lock);
 	}
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
index 3fe0e3a80e80..dade09614163 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
@@ -103,6 +103,7 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 
 void dwmac1000_get_ptptime(void __iomem *ptpaddr, u64 *ptp_time);
 void dwmac1000_timestamp_interrupt(struct stmmac_priv *priv);
+void dwxgmac2_timestamp_interrupt(struct stmmac_priv *priv);
 
 extern const struct ptp_clock_info stmmac_ptp_clock_ops;
 extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
-- 
2.34.1


