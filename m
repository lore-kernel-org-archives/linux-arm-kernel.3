Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC160CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 03:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9D78vrkEaiw/Is5KlQ/iLJagt3SGFDs7ZK10PGJQZuE=; b=HL3qSfHQjf/Evy7J7ebbFA7+yO
	MOeeghpijPt/kyryPuUONsaJUxZ8fBG9Z0zn8UQTVgyVtJ16jI9mcLbIqsszEYjBZEWeuJ/AtXbzK
	nZdZaMdbGCgMeqBBzuUwcq7evrCGZ4O4nko3CJlW/NL6pLIfYP8pRGHPg7bOnBrON+xHO9KQXNJht
	9p9jCJ0ZvuR7f6YNUatDeq/N9C3OnKo00rf7QyeTj+/UirXmlScBiOzTOkBT4QWzZssCroDDEUVYv
	KWpft+hRs+6ibWBiN8stPbeOgfmIo8+S6xR2GMgWVJVCNVQNJZaNsM1xlKX1OoGPmASLIYODJtQCy
	makzAVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdd8-00000006Ujr-2Sb7;
	Mon, 19 Oct 2026 03:01:42 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdd6-00000006Uhv-0z3J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 03:01:41 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-919abb3335fso13069556d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 20:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792378899; x=1792983699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9D78vrkEaiw/Is5KlQ/iLJagt3SGFDs7ZK10PGJQZuE=;
        b=g6EHH9szpY10TQGdR3xqlQxzJgcs3Be+RyveS2+Guc9X9RW7l7DGsQQyChY8S1Fbo5
         9YRUPrOfLaa1/2Py/i0Sum5Wmg31iT479A+XuQ1cbpmo1dYAYqFuf4vWR+Jn8L0jSwvz
         2ec4HGtZC3qDtdKZK62yNRvvNm6RXiw9zQ9dkn93BhvuyR4lRft+J7yM48SMty4nT6pH
         dFNCkoa8yCPqYtmjcuYscYkVefX/dJ8EortdgyFQTOO4XlQuACfC5pcD+vNi3lkgSzAr
         svA0KbqZOWS8TciIAQVZactvQe/YOqjYRbIYlytNnc/t+pDje8w9vfEZWoS+yJlG7fh3
         z5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378899; x=1792983699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9D78vrkEaiw/Is5KlQ/iLJagt3SGFDs7ZK10PGJQZuE=;
        b=Bm9VNXIvIvruwVwhFgUt8k3pte6PtkYu5Sa7/IRXjjDxEWrhplfqcrBCDv9m8QwX/Q
         xakSRMmvHqH8CmoX3rphTvKviyBiV0NMHoU9kKW6cnkEf7Yff1JIDAIbBpv3MpgN/6sT
         Nk91fe+YWJryescsp7KWjVJsoV0b4/3zfgPEBBmNNdNfDKiRNPQ//s0fpxyEGvjF1PSE
         FRXm0+Hzqum130OPAh2vEeVlc5v66VqNw6lKj2Wb6g3c/dsmua1+0XYw2DUy8RFhfOrB
         odkDMKgP4ZzXoxX12OACdJcsJOlvKRM2sAe4ZWdaa2o8uYDn5SzG8VS8kRSo8xSZq6Hy
         CB9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwoHBxIdcaeyhn8HdIhk7QcUanOb/V2se7CFDwOuwGjJoaljtmfiIN/GjYw836T/rF/QLFk4ydjWnYVcmt7PpuS@lists.infradead.org
X-Gm-Message-State: AFq9FYIQdATByePqyiBjzMaV+NwiMqCVGyTa6tw9EHoWG7gjN4pUm96Q
	b5M4DSVpSO+Ac37msZ0/XEfiHdF684yFm6lTZMpdOZoatxtrjYbMdJyKGtXd5ddj8fg=
X-Gm-Gg: AYBFou38eE2uhoyqzO3OjtqKHNQWVsj7cYjeG6B80LyHc8WgEErVtl5QWAcLgGugXVG
	X2gzsthE5pIE27EKtG3Eo/e1TCC1YLszDOvZwDClTMcf9RBnTlZh9S8j9QGPECLoURMsa7eTW/f
	vybvmxjBa4QdaVRqYyybLbXf2Xo8sv8SdXwxOutKZ/Mx1YVIureZbVSOJWz7gSBj78nLfIxPkxF
	dWcUehECIzqs5YKgWZzTQzfrflPITGXwrfI5vPLeBCn05KGTvCBBkTqtW2enTMP4daJtupi+c/s
	tZKEREtIf5bCV0g/UzOmaW1wczsG006QUKpGrqJDP/lfIXV3lXY3UEIHlTNIbN71gccBE3Yynau
	53jkT8t9gtw0zM/z0iCCQcQtHUTdJ3xOoTupMYwVT9OeBF/wpiHq6GuqqdNWuYYI85m7FwSQxuR
	NlyvgbPYJHlqH8G+ofQ8rXkseDHmtRWRuw7CZ1zn6e1t77ABqEqyrFuG4TjxZrgPZv6dZ4iemhX
	i0=
X-Received: by 2002:a05:620a:28c1:b0:93e:7939:acd0 with SMTP id af79cd13be357-93f29d10508mr1118565485a.37.1792378898919;
        Sun, 18 Oct 2026 20:01:38 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm216840185a.10.2026.10.18.20.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:01:38 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/5] net: stmmac: dwxgmac2: Add XGMAC 3.01a support
Date: Sun, 18 Oct 2026 22:01:26 -0500
Message-ID: <20261019030129.1470307-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019030129.1470307-1-elder@riscstar.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_200140_299535_9F63B2DD 
X-CRM114-Status: GOOD (  19.21  )
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

From: Daniel Thompson <daniel@riscstar.com>

XGMAC 2.x and 3.x are architecturally very similar.  That means that
for everything except one erratum we can simply use the XGMAC 2.x
callback functions in the stmmac_dma_ops structure.

Only the set_rx_ring_len callback is specific to XGMAC 3.01.  It
limits the number of outstanding write requests that can be serviced
per DMA.

The other erratum addressed in this patch is simply a comment to
ensure that a feature that stmmac doesn't currently use is not enabled
without contemplating the errata.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 52 +++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b9..0fe86e9942334 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -374,6 +374,8 @@
 #define XGMAC_DMA_CH_RxDESC_TAIL_LPTR(x)	(0x0000312c + (0x80 * (x)))
 #define XGMAC_DMA_CH_TxDESC_RING_LEN(x)		(0x00003130 + (0x80 * (x)))
 #define XGMAC_DMA_CH_RxDESC_RING_LEN(x)		(0x00003134 + (0x80 * (x)))
+#define XGMAC_OWRQ			GENMASK(25, 24)
+#define XGMAC_RDRL			GENMASK(15, 0)
 #define XGMAC_DMA_CH_INT_EN(x)		(0x00003138 + (0x80 * (x)))
 #define XGMAC_NIE			BIT(15)
 #define XGMAC_AIE			BIT(14)
@@ -465,6 +467,7 @@
 extern const struct stmmac_ops dwxgmac210_ops;
 extern const struct stmmac_ops dwxlgmac2_ops;
 extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
+extern const struct stmmac_dma_ops dwxgmac301_dma_ops;
 extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index ff83858ebc1f3..f9a77d641eb65 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -36,6 +36,13 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 	 * Route DMA interrupts to per-channel lines when multi-MSI enabled.
 	 */
 	if (dma_cfg->multi_msi_en) {
+		/*
+		 * A friendly warning to future adventurers. If Descriptor Posted
+		 * Write support, which is off by default, is ever enabled then be sure
+		 * to make it optional. This is required by errata for at least XGMAC
+		 * 3.01A... and the XGMAC 2.x and 3.x are architecturally similar so we
+		 * use dwxgmac2 support for the 3.x family as well.
+		 */
 		value = readl(ioaddr + XGMAC_DMA_MODE);
 		value = u32_replace_bits(value, XGMAC_INTM_MODE1,
 					 XGMAC_INTM_MASK);
@@ -492,6 +499,20 @@ static void dwxgmac2_set_rx_ring_len(struct stmmac_priv *priv,
 	writel(len, ioaddr + XGMAC_DMA_CH_RxDESC_RING_LEN(chan));
 }
 
+static void dwxgmac301_set_rx_ring_len(struct stmmac_priv *priv,
+				       void __iomem *ioaddr, u32 len, u32 chan)
+{
+	u32 val = FIELD_PREP(XGMAC_RDRL, len);
+
+	/*
+	 * Reduce the number of outstanding write requests to 3 (from default
+	 * of 4). This is an errata workaround for XGMAC 3.01a.
+	 */
+	val |= FIELD_PREP(XGMAC_OWRQ, 3);
+
+	writel(val, ioaddr + XGMAC_DMA_CH_RxDESC_RING_LEN(chan));
+}
+
 static void dwxgmac2_set_tx_ring_len(struct stmmac_priv *priv,
 				     void __iomem *ioaddr, u32 len, u32 chan)
 {
@@ -621,3 +642,34 @@ const struct stmmac_dma_ops dwxgmac210_dma_ops = {
 	.enable_sph = dwxgmac2_enable_sph,
 	.enable_tbs = dwxgmac2_enable_tbs,
 };
+
+/* All but one field are the same as dwxgmac210_dma_ops */
+const struct stmmac_dma_ops dwxgmac301_dma_ops = {
+	.reset = dwxgmac2_dma_reset,
+	.init = dwxgmac2_dma_init,
+	.init_chan = dwxgmac2_dma_init_chan,
+	.init_rx_chan = dwxgmac2_dma_init_rx_chan,
+	.init_tx_chan = dwxgmac2_dma_init_tx_chan,
+	.axi = dwxgmac2_dma_axi,
+	.dump_regs = dwxgmac2_dma_dump_regs,
+	.dma_rx_mode = dwxgmac2_dma_rx_mode,
+	.dma_tx_mode = dwxgmac2_dma_tx_mode,
+	.enable_dma_irq = dwxgmac2_enable_dma_irq,
+	.disable_dma_irq = dwxgmac2_disable_dma_irq,
+	.start_tx = dwxgmac2_dma_start_tx,
+	.stop_tx = dwxgmac2_dma_stop_tx,
+	.start_rx = dwxgmac2_dma_start_rx,
+	.stop_rx = dwxgmac2_dma_stop_rx,
+	.dma_interrupt = dwxgmac2_dma_interrupt,
+	.get_hw_feature = dwxgmac2_get_hw_feature,
+	.rx_watchdog = dwxgmac2_rx_watchdog,
+	.set_rx_ring_len = dwxgmac301_set_rx_ring_len,	/* Only 3.01 */
+	.set_tx_ring_len = dwxgmac2_set_tx_ring_len,
+	.set_rx_tail_ptr = dwxgmac2_set_rx_tail_ptr,
+	.set_tx_tail_ptr = dwxgmac2_set_tx_tail_ptr,
+	.enable_tso = dwxgmac2_enable_tso,
+	.qmode = dwxgmac2_qmode,
+	.set_bfsize = dwxgmac2_set_bfsize,
+	.enable_sph = dwxgmac2_enable_sph,
+	.enable_tbs = dwxgmac2_enable_tbs,
+};
-- 
2.53.0


