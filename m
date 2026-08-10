Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB36BC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0wEYkzBcMdzXW3DkDjCq2S2tZx0eg9Z7Yp+aB3llSto=; b=yyQDgdgd8aLcSnj7ijx/G/J9j5
	WoIZqH4Jgo1mAzS1Afc7QhzF3yZnSWdINNtvDGhij55mPrOi3KF1b/RbhNNno8JhnMdaRkZm/0H86
	9OL9w7zXka212TFDOnaNXA1op51Np0ddaEYnUpJOqlIG57Ndcm7urvl6/oQdKbuCKEHbX8/T9emK6
	x6bUF/Hwa+/219ue8hdH/ThWesz6E15WJcEJJ52+6t8I2CNqA/z6ZSvfGV7blrCej+YsawituQPqE
	ihRGCMlN05TTCBehWDXF9AqiusgL+6A44OeBCZyZindIsUbiRETPW7caInXjt+CyZbPIbvDwiwp8f
	6PssOsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMq8-0000000BS6h-03bO;
	Mon, 10 Aug 2026 10:02:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMq4-0000000BS6K-3CDg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:02:38 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso1513961b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 03:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786356155; x=1786960955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0wEYkzBcMdzXW3DkDjCq2S2tZx0eg9Z7Yp+aB3llSto=;
        b=Nf7VGc4coVoZ0AczBWqJntWEorIJEvXIX/ScgyxwDXHN4ZIrLcIqEJs8GPcjfYAz25
         cXaP7R7jvJdW0oxAbdVGNxRa/OIkhK6ltiPj1Dpr2Xk7UlDHGA6ORVT23ywZMn+HvvfV
         Wot31oGUmA8oT1C3KH/Ngwp7tHxUaV2ihBSss+id6ndK7tnZgT4s33P5tIpTF1xTMhir
         ahyNJyyP/oWEXJz13N4WYUeluZES1O2Ojczv9pMKWucbJxbKTIa0/VqamNPcmEoh0Vfe
         T2pNXRMFjF0ckuf/q80LnYZizeDFCAxievnrvMxT572UP/JUft9Lv9jm6a8kUnRYe/zR
         8ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356155; x=1786960955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wEYkzBcMdzXW3DkDjCq2S2tZx0eg9Z7Yp+aB3llSto=;
        b=OYxgem5W0QV79NRvERR72q6PbTGaQCieyfQH8H/tD4wH8GQc1GrJH1wwGVI33/mBfx
         57b2ITcNo8Yjk1w0tWrT2UFuTNlFNxN3TQerf2j4rje9/aioMuZAiRhUk16d3D56ARaD
         jQRgT7Y2kHe4AA0kscSPJ0SBfn6stfOncLDXaRQmLPmxepttA5UCyvHVh81wASgHJrCV
         9X57xu4PzDdHZwCOmco9ppuNjXq6loZV5V6Xzw0KneLKgF6v/QUmz/fG62mr/DDP2ArJ
         GKKxrqeSQ4t6lUpTyBdwJlsGjj/x4LlcCBSi9etVXu7Ck6rhokD1iuIp2NSSHvUTS5Ul
         FXwA==
X-Forwarded-Encrypted: i=1; AHgh+RoMcYTt2K0E6zqRRl1tyikBLR0cLinW/4huBQA5RJct6/BvfEB4e5GyChiXYDUR6DiYDTCONrDWT3BoOtWb8W/b@lists.infradead.org
X-Gm-Message-State: AOJu0YzXR+t1ET1RaqSYuU9DbPPWgoOMGIOAY/LYMujhYjxCxw8Q55l5
	qxwt7byFGMM2Iuhr8/DIeI5HNsIsnfAdQ1lc6Uv96Oi940U687EgS6xp
X-Gm-Gg: AR+sD10Y4i9+FXno/jF67yvGVzkVSEMGqh6qzGw9poSGvug2VZ8ZzkiyqERrbUXfp+Q
	F+8mA329+Q7GxAarGrOTuRvGmr2ruI025HRxGmNeT4dUx/7Wtl7WLsjXLTgZbIHu64fQdYGpH0o
	gNX1QYRPvmcc3WUlDIyhjBjM+/rO9RwnBDyvSMOMeJ2mcRQJdV3vqr5ErMx0Fu6TpbvfpsLBR1Z
	OgX7w8Ha/G2XABJjCB2iKGnCvBq9BmNN1SBVYlflwc6BHXDjrkOqwYjvxanRIvhodWebUE25g9T
	VDE+tyLMTpjpSAGSdn4bbZZT3C41rgFCUxM9O9hCUpBqqtanXHvF6/CcuETl2G78QIxfVyh62cY
	YkwPm1RBZ5bnvC4CZXStMo5M5wPVRK2SEIkNtgfCjpLuAgenV3P5cN2rgCuGB0cBr1yU6QfjDMp
	rKUv1AgBRefLNKgEliG7ag2M0uWBD7RfiErtNCKqj9KpPZfV40vcn6jPzWdQ6fvFOi7ZnBrtW0v
	ZE/2g==
X-Received: by 2002:a05:6a00:c0ce:20b0:84f:72f7:de58 with SMTP id d2e1a72fcca58-84f72f7e7cemr11081899b3a.17.1786356155075;
        Mon, 10 Aug 2026 03:02:35 -0700 (PDT)
Received: from zhuxin.hobot.cc ([2409:8a28:54b5:7840:a4d2:402b:802:4ee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a58998bsm3604775b3a.55.2026.08.10.03.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:02:34 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	richardcochran@gmail.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v2] net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support
Date: Mon, 10 Aug 2026 18:02:21 +0800
Message-Id: <20260810100221.9166-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_030236_815587_9E5D2ACF 
X-CRM114-Status: GOOD (  21.76  )
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
v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2:
- reads XGMAC_TIMESTAMP_STATUS before checking
  STMMAC_FLAG_EXT_SNAPSHOT_EN, so that the timestamp interrupt status is
  cleared even when auxiliary snapshots are disabled.
- Drop the unnecessary (u64) cast in dwxgmac2_get_mac_tx_timestamp().
- Reword the changelog to describe the real problem: the generic handler
  read the wrong register offset (0xb20 vs 0xd20) and the interrupt was
  never enabled, so auxiliary snapshot reporting never worked on XGMAC.
- Update the comment to clarify that TXTSC is cleared by
  XGMAC_TXTIMESTAMP_SEC, not by XGMAC_TIMESTAMP_STATUS.
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 43 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  1 +
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 12 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
 6 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 61b6d45a02f5..76e2860a9517 100644
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
index f02b434bbd50..b849cebf9b29 100644
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
index 511b0fd5e834..9718582b8480 100644
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
index e6317b94fff7..818ab3daa91c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -671,6 +671,7 @@ extern const struct stmmac_desc_ops ndesc_ops;
 
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


