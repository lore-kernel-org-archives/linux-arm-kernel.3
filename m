Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E001C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7icB+mFn47r22Tll8dVKEqXUZ7IexWk6IFOaTVD/4o=; b=CW0dFhwKpNBixQ6v7uev2bFKkq
	LxhUHD7IJrgcMHMjjaBCN6Hua+9xOTO/lM5ENn8WA7ROHnuqwqIxlX3oTiLT6zFMIdocDD0C3YAW5
	oRNNe7HRV9zc7+rMn293B7w+JFVTWB3oDXUcsXZInFNfVOlZ6ULNUE79o3Lk7+EFFZ3nx2jGlCoY1
	VMPd2a7CO0wYWbSDvaufSaHP3k4Y+ogDQf+QSBEaVCsDvCeTzVDP34wSug21LYIbf1MWBrdWe7dh0
	u57DtAThWGEbuTK99vvRB9PkES3EepTy3o6JPQwvgb9rIS7D0PKRcK5j3k3ghGxtcUAvIaGNrzOgw
	gFFkxl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1koB-0000000EmHG-0jgg;
	Wed, 02 Sep 2026 13:15:19 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ko8-0000000EmG7-3AbJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:15:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8541875f596so370119b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788354916; x=1788959716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7icB+mFn47r22Tll8dVKEqXUZ7IexWk6IFOaTVD/4o=;
        b=i1A8hWuDYWigMXTPB3t8VxN0aAC2wWueyTw8FQ6W29LieZODq7MWKs+3n2KymmPnhi
         S0CymMC7OwAcTukpKBNfRlBPpMxm3qwakeNzMrjOdfjX2tC+u6PphnSjj0D6KqQ1Q8Kg
         PjDMLe2PDK0WzghSPR1uG8esPog8Jir/rclxPk/CxTax5KydihU/AQaI114FjKXWMftW
         WCRB4elDDZ0u8sUjoWFB+J+HWTi6PP23K1UrUhayB+XYgqqrSpGWgCDu88+Na7DDBOsI
         DogqRBNN1d6NjMjYU13+JCydXVoXyUaQGeYsmPLJVzDv1kbcsWENh+bhNqtQrgvjWoFb
         MZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354916; x=1788959716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7icB+mFn47r22Tll8dVKEqXUZ7IexWk6IFOaTVD/4o=;
        b=VeGwSLxNgwFOEVsHVC2Y4drigyrYYielyIME0/x9N11EDFtTeGLmzu/iDTe045eG3k
         aTmfl/eThnBIZ50cosEMtqHq+falgLHQFPKLHRacE8cya0B+fdz9//UbS9KKXkOpmULz
         XsZ90n1WvztCG8gNiyY0wLGjuXxQ6yvH8jkwwlSSaLz4+AbnPa4k0TjZufu0+2IqP+b4
         /QAoAeGHArv773SjQz/wfHIRWzDTy8C4GtW+o65HMdFykfSvV7XqopnO84NrEHeom0AS
         SbVbTJwpj6n+OWlDciWxRCqFd47FzmNi8yS/8ty7ix4OnBG+hVBBQm3TLxRc1vyyzar6
         4vKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8gb6BxV6azzm5ADTIWvzgmP5HfQumI8cPYHj1Ja1AagLAgA6E8VRx++qc+fQmCypjxbEGFam3ba3eP9GSs3qw@lists.infradead.org
X-Gm-Message-State: AFuF++nYb5fSIe4FVS+2AyGbdmgeU6RfowE8fhBjSDtT1p/2HL+B4ob9
	feEFtnYCmvr5yR55VEmPyfXThQ1HUw3JEJIcSgnppZaesmrN8tZc9BiH
X-Gm-Gg: AYBFou1kzbhVf8Ywei7D3ZXlkj+d/C7bqW+wzOAv3zy6D2NzP+q/vakOsOgLfZHA4WK
	+zYV0yy11xurqZ9sVwdPEgxPatT0zk+HwMnjgsXWx9T55yJJL4pRR7wtChE7tLewP/mKW2yL4w3
	ilLKHDdGrXaFzOWvOSpmuOCKCO9Mfd5mL0ZIQsx/WcQwIBVTV9uXA+HLR29D/bZNOkM1HobzKht
	RlcmtXhz6Z0JxOHfLsLCW/eE5Tx+V/9KUphX8Si7gTqko5ZynhxIOX5bKxWnWmxz0j92Q8nneqp
	gUTh+zYnuPOrmbWxSlpEkwuD7CyVT4YPJXRPrT02FdxOEmvwiEaKSxcNlIGTDZoKhdso2JxJSaA
	nfneUOKDMqV3OGZS/wp2mHQET0QsR0oy7/8FUcC1wjBCtHEt72/XRHEoBG1Z6CrTZ4F2OeI5v47
	3Le24b06CJfaa/OMVab6PbgAA0u26tL9pbs7eCbDzswiuSXy9nMmLPfNBs490=
X-Received: by 2002:a05:6a00:8d1:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-85ed7d20685mr6658379b3a.11.1788354915822;
        Wed, 02 Sep 2026 06:15:15 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85da342023asm1398533b3a.0.2026.09.02.06.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:15:15 -0700 (PDT)
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
Subject: [PATCH net-next v4 1/2] net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support
Date: Wed,  2 Sep 2026 21:14:40 +0800
Message-Id: <20260902131441.322167-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902131441.322167-1-zxyan0222@gmail.com>
References: <20260902131441.322167-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_061516_809277_A1BCBEFD 
X-CRM114-Status: GOOD (  22.09  )
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

DWXGMAC2 uses XGMAC_TIMESTAMP_STATUS at offset 0xd20, while the
generic stmmac PTP handler reads the dwmac4 offset GMAC_TIMESTAMP_STATUS
(0xb20).  Before this change, the DWXGMAC2 and DWXLGMAC2 hwif entries
used &stmmac_ptp, whose timestamp_interrupt callback read the wrong
register and whose config_hw_tstamping callback never enabled the
XGMAC timestamp interrupt (XGMAC_TSIE was not in XGMAC_INT_DEFAULT_EN).
As a result, auxiliary snapshot events were never reported on XGMAC
platforms.

Add a dedicated DWXGMAC2 timestamp interrupt handler that:
- reads XGMAC_TIMESTAMP_STATUS before checking
  STMMAC_FLAG_EXT_SNAPSHOT_EN, so that the timestamp interrupt status is
  cleared even when auxiliary snapshots are disabled
- derives the pending auxiliary snapshot count from the persistent
  ATSNS field instead of the transient AUXTSTRIG status bit
- generates the corresponding PTP_CLOCK_EXTTS events

Also enable XGMAC_TSIE in XGMAC_INT_DEFAULT_EN and hook the new
handler into the DWXGMAC2 and DWXLGMAC2 hwif entries.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 43 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  1 +
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 12 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
 6 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..03cbae326995 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -87,7 +87,7 @@
 #define XGMAC_TSIE			BIT(12)
 #define XGMAC_LPIIE			BIT(5)
 #define XGMAC_PMTIE			BIT(4)
-#define XGMAC_INT_DEFAULT_EN		(XGMAC_LPIIE | XGMAC_PMTIE)
+#define XGMAC_INT_DEFAULT_EN		(XGMAC_LPIIE | XGMAC_PMTIE | XGMAC_TSIE)
 #define XGMAC_Qx_TX_FLOW_CTRL(x)	(0x00000070 + (x) * 4)
 #define XGMAC_PT			GENMASK(31, 16)
 #define XGMAC_TFE			BIT(1)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1a88cbaed70c..891b7ceea2d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1154,6 +1154,49 @@ static int dwxgmac2_get_mac_tx_timestamp(struct mac_device_info *hw, u64 *ts)
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
+	/* Read XGMAC_TIMESTAMP_STATUS to get the AUX snapshot
+	 * count.  This read also clears the TSIS bit in
+	 * XGMAC_INT_STATUS.
+	 * TX timestamp polling may have already cleared TSIS
+	 * and AUXTSTRIG, so rely on ATSNS instead.
+	 * TXTSC is cleared by XGMAC_TXTIMESTAMP_SEC, not by
+	 * this register, so there is no conflict.
+	 */
+	ts_status = readl(priv->ioaddr + XGMAC_TIMESTAMP_STATUS);
+
+	if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN))
+		return;
+
+	pending_snapshots = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, ts_status);
+	if (!pending_snapshots)
+		return;
+
+	acr_value = readl(priv->ptpaddr + PTP_ACR);
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
index fe18f98fae45..5a308e79db4a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -672,6 +672,7 @@ extern const struct stmmac_desc_ops ndesc_ops;
 
 extern const struct stmmac_hwtimestamp stmmac_ptp;
 extern const struct stmmac_hwtimestamp dwmac1000_ptp;
+extern const struct stmmac_hwtimestamp dwxgmac2_ptp;
 
 extern const struct stmmac_mode_ops ring_mode_ops;
 extern const struct stmmac_mode_ops chain_mode_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index b9a985fa772c..9d7d24259abd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -277,3 +277,15 @@ const struct stmmac_hwtimestamp dwmac1000_ptp = {
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


