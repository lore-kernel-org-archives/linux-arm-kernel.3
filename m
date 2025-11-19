Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDE6CF3189
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbRkLsOzrPKfiOjtitRKcKtlTS1mD+vXrFtZbAGt4MQ=; b=iePvnuYPh7Gr26mYisKovEsUfa
	lfye6NFMwnWQigfCg184tK1UD50K4DJzNH4SifPo0AR9HnYu2Z6x9+UDLpLqIOb4P33nR3bBMEFuC
	W2gCGRl/T1kQcCl+EmBYF1NT79CMxh+qnSeWlDliblIW1g09FDcMnXqiabMiKWYDBFQ2ZZz623Rgw
	Toj38QQVjX16S9zIdvrkEE7YJNJNa9Lzw/ClGbRnv5+m2zBPHfR24WOrrPzlqHux4dvm0EPBKMNl5
	HozY8V6WSTa6eX3IlRySjmsDsbPnQ29Eqdsl3A+SPVKHqhZuClGWovPOP9OMMe1H2bX4YPOG+ghp7
	KQXQrT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfLT-00000002xKl-0zrq;
	Wed, 19 Nov 2025 10:23:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfLR-00000002xJc-1i5P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 10:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sbRkLsOzrPKfiOjtitRKcKtlTS1mD+vXrFtZbAGt4MQ=; b=Zo7vfu7Z6HTQHQvm2FYRanNvTh
	1eTs+K0wgvZnVzuYb/rlhngHfF+SSxcoC5Mws6OrriKZipx3nQHhyQqvKruhUfvvOQypt+OI6Lq36
	xc8Wf5twdC6E1ByYQoQ6WRiXq66CB1LE7GqQ+0j05OjyBLFMp2bOPdxCCutKfWGrE9VaQU/Q8bxMD
	XgYaI3fbgxSjkEWC0UZAOL6RGdxwaC9y9e/3gOb+jGgb7Lw6D3In0u4BY9E1TWddxpw+E45a5G7+F
	U8B9P92swp13X8nkSGhzBsRx0FIXnS8pJynrHdBlZR4Xkhe6RRG8XzVONLN1ZhuiS/qFUGk+P0MDw
	F7UJ2GhA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48928 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLfLM-000000004Us-3O3A;
	Wed, 19 Nov 2025 10:23:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLfLL-0000000FMap-49gf;
	Wed, 19 Nov 2025 10:23:20 +0000
In-Reply-To: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
References: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/6] net: stmmac: move common DMA AXI register bits
 to common.h
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLfLL-0000000FMap-49gf@rmk-PC.armlinux.org.uk>
Date: Wed, 19 Nov 2025 10:23:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_022325_480303_C00B445C 
X-CRM114-Status: GOOD (  11.64  )
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

Move the common DMA AXI register bits to common.h so they can be shared
and we can provide a common function to convert the axi->dma_blen[]
array to the format needed for this register.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h     | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h |  9 +--------
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h  | 11 ++---------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   | 16 ++++++++--------
 4 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 7395bbb94aea..3c6e7fe7b999 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -548,6 +548,16 @@ struct dma_features {
 #define LPI_CTRL_STATUS_TLPIEX	BIT(1)	/* Transmit LPI Exit */
 #define LPI_CTRL_STATUS_TLPIEN	BIT(0)	/* Transmit LPI Entry */
 
+/* Common definitions for AXI Master Bus Mode */
+#define DMA_AXI_AAL		BIT(12)
+#define DMA_AXI_BLEN256		BIT(7)
+#define DMA_AXI_BLEN128		BIT(6)
+#define DMA_AXI_BLEN64		BIT(5)
+#define DMA_AXI_BLEN32		BIT(4)
+#define DMA_AXI_BLEN16		BIT(3)
+#define DMA_AXI_BLEN8		BIT(2)
+#define DMA_AXI_BLEN4		BIT(1)
+
 #define STMMAC_CHAIN_MODE	0x1
 #define STMMAC_RING_MODE	0x2
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 4f980dcd3958..dfcb7ce79e76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -69,15 +69,8 @@
 
 #define DMA_SYS_BUS_MB			BIT(14)
 #define DMA_AXI_1KBBE			BIT(13)
-#define DMA_SYS_BUS_AAL			BIT(12)
+#define DMA_SYS_BUS_AAL			DMA_AXI_AAL
 #define DMA_SYS_BUS_EAME		BIT(11)
-#define DMA_AXI_BLEN256			BIT(7)
-#define DMA_AXI_BLEN128			BIT(6)
-#define DMA_AXI_BLEN64			BIT(5)
-#define DMA_AXI_BLEN32			BIT(4)
-#define DMA_AXI_BLEN16			BIT(3)
-#define DMA_AXI_BLEN8			BIT(2)
-#define DMA_AXI_BLEN4			BIT(1)
 #define DMA_SYS_BUS_FB			BIT(0)
 
 #define DMA_BURST_LEN_DEFAULT		(DMA_AXI_BLEN256 | DMA_AXI_BLEN128 | \
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
index 5d9c18f5bbf5..967a735e9a0b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
@@ -68,20 +68,13 @@ static inline u32 dma_chan_base_addr(u32 base, u32 chan)
 #define DMA_AXI_OSR_MAX		0xf
 #define DMA_AXI_MAX_OSR_LIMIT ((DMA_AXI_OSR_MAX << DMA_AXI_WR_OSR_LMT_SHIFT) | \
 			       (DMA_AXI_OSR_MAX << DMA_AXI_RD_OSR_LMT_SHIFT))
-#define	DMA_AXI_1KBBE		BIT(13)
-#define DMA_AXI_AAL		BIT(12)
-#define DMA_AXI_BLEN256		BIT(7)
-#define DMA_AXI_BLEN128		BIT(6)
-#define DMA_AXI_BLEN64		BIT(5)
-#define DMA_AXI_BLEN32		BIT(4)
-#define DMA_AXI_BLEN16		BIT(3)
-#define DMA_AXI_BLEN8		BIT(2)
-#define DMA_AXI_BLEN4		BIT(1)
 #define DMA_BURST_LEN_DEFAULT	(DMA_AXI_BLEN256 | DMA_AXI_BLEN128 | \
 				 DMA_AXI_BLEN64 | DMA_AXI_BLEN32 | \
 				 DMA_AXI_BLEN16 | DMA_AXI_BLEN8 | \
 				 DMA_AXI_BLEN4)
 
+#define	DMA_AXI_1KBBE		BIT(13)
+
 #define DMA_AXI_UNDEF		BIT(0)
 
 #define DMA_AXI_BURST_LEN_MASK	0x000000FE
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index e48cfa05000c..16c6d03fc929 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -338,16 +338,16 @@
 #define XGMAC_RD_OSR_LMT_SHIFT		16
 #define XGMAC_EN_LPI			BIT(15)
 #define XGMAC_LPI_XIT_PKT		BIT(14)
-#define XGMAC_AAL			BIT(12)
+#define XGMAC_AAL			DMA_AXI_AAL
 #define XGMAC_EAME			BIT(11)
 #define XGMAC_BLEN			GENMASK(7, 1)
-#define XGMAC_BLEN256			BIT(7)
-#define XGMAC_BLEN128			BIT(6)
-#define XGMAC_BLEN64			BIT(5)
-#define XGMAC_BLEN32			BIT(4)
-#define XGMAC_BLEN16			BIT(3)
-#define XGMAC_BLEN8			BIT(2)
-#define XGMAC_BLEN4			BIT(1)
+#define XGMAC_BLEN256			DMA_AXI_BLEN256
+#define XGMAC_BLEN128			DMA_AXI_BLEN128
+#define XGMAC_BLEN64			DMA_AXI_BLEN64
+#define XGMAC_BLEN32			DMA_AXI_BLEN32
+#define XGMAC_BLEN16			DMA_AXI_BLEN16
+#define XGMAC_BLEN8			DMA_AXI_BLEN8
+#define XGMAC_BLEN4			DMA_AXI_BLEN4
 #define XGMAC_UNDEF			BIT(0)
 #define XGMAC_TX_EDMA_CTRL		0x00003040
 #define XGMAC_TDPS			GENMASK(29, 0)
-- 
2.47.3


