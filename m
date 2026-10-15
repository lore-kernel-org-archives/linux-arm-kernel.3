Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51BCCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P//yg+b2gnuEyhEoTs+D2xO6ThJI9Dnp4w6O39bw46g=; b=HDggdMqPUHOGkIG8PpFZdLX+GY
	JvY46tvBuxDs4inwdDCHdmAOLjwpNa66iwPQK3Kq2yrXkWn3WKVrCfd4ZO1AQgv/m2j0NpV959ebl
	KcMCbMbmeheLf7OekyXtU9Gms4gWmc14MsQn3G1WJ+y06ZhoTcwdvAz5FWa5U9o86JBCaMjOyyYG+
	jlFDhPBDqh0QDtB9NAmskmmh/OZ8UuBXY8IkhlicNVCOG/usVVjj1bNP5CS21Ch02jHEgGZgS/iUh
	SCRMdCshAf0ODYwCIiXbapc80lHmeqUx/2YS9rXf8kXvyCxuVXyB2rNr8MLLyp+zV1Aki2MfMFGWw
	HKQTguWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMuS-00000000SY4-2Ts0;
	Thu, 15 Oct 2026 14:58:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMuO-00000000SWp-2GI5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:58:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso39360405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792076294; x=1792681094; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P//yg+b2gnuEyhEoTs+D2xO6ThJI9Dnp4w6O39bw46g=;
        b=mK8vtLFddGQMWnNMInUKKyG92x9bbqeVMXyrPnsShuU2h/XTZxBi6aDsKyHB6IAs/X
         kOU4+0DHFQxEEsYI7Vu5TWDAuso+H1acdcp0DTM3t2HxdkXRxHd8GCostAXPWgfhVM15
         WfRmlkTJ14LpBxY/nha+V6L51nrgxPTq6ApTZEGCD0eH0hEBqGraQClC1gBd4e6jIK1O
         kEChyWctmHAve4tF1E/E2RPTRnY4oRXr2TauWgVDSm92QLnKUxD+edpTCD+zFnOCDWUP
         HwVVwwMISyZSxeOAYs6A6t+A/hSDBkeY1j4efXkmUIRLcygPoChYO/56avPOeFXWoxmD
         cltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076294; x=1792681094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P//yg+b2gnuEyhEoTs+D2xO6ThJI9Dnp4w6O39bw46g=;
        b=03xMZ8HRnnD053h5D+estYvVApOlMy0npwNLgF4sW91lkMeS183AQgdgHqwW+5oMxH
         wDP6gfKyiHlv1WOw1lNDX6uyGKPpjv2yQ1/72NIgNmJWHUVMvh3k0GRXKyBlYhOmc+dl
         MQo+8zwPSUtbZf4MFYkfw346yJdQZ1fm8kZz4ZTQ+L1srFIdFG5f0pvc/O4HE0Q5iBcG
         85ajBoHqKbbPD8X1mDelViqn6BIWyPH3YU7aEi8Wt4dOJ0tAK0IzJJHj3J1lyai6WxeG
         QcYgNgvKBwGmfTmTQJ59rv/4YJvwyL9ggAuWBLIywej+zb4J4tU4YkisPXKPq/JnFkD5
         trbA==
X-Forwarded-Encrypted: i=1; AKwUvByeylgZO8eHVyEV1TyA+70pQVuyD0NuglIwtorRAqg0uBLajKnzODUW9fRV5VrRDpbOuvhjD30bvxu+1gaCKlzr@lists.infradead.org
X-Gm-Message-State: AFq9FYKtaENpyE8pPRYZ5AJbqmMxqGvycl1/vhezBWuIEkmvhYZUEDju
	nT3ZupGrWRba4myq2r99N7jxbFKTd0w+0RR3F4KUfKFq7MzLc/z2UEt+50hjKxYNw8I=
X-Gm-Gg: AYBFou3lKc/STtD1SXHTqn4YN72e3YbfFKqUCC5qbp1v2Fjpqbg+EsayKVkTcqA4TKt
	JrX9nqbOWR8N5ZXSyJcR8R19sXxa4fxGad9MchCsOAO6uKdTJp1koKpTjPZPItSqr2qXaa6bfk+
	e+6YffSOADQNsr8WRFmZd4P1R7rRDHrY1IzWKvgfcbwH7WgiRwPM70lmccsdidqHTZpkAVXIVeZ
	4nqllMzbG1YCcKysg+Ym7mFNbODzBtUa8UFuy5TMZZE9kAj9yPnzSGyNt3ae8PPQfy9fLnKaTA9
	K2snoVjoEXOoFVq2gwg1nxEkr+CTsIKqfZN95KIO8D9pM8mCMLe1YNPQsgCimYiNX7F2YvncW9u
	aiBw6hs0q5oHi7FC0UniZapsDCUbS5GpSts0TndXPXhON8PCTttQxmy/W7wChI30UzgCkl15X/N
	Vf6kKlGSES/WbMypVN58ymLIazQuAdv984FyuYD1IFMKZXG4IWJeUgJj/CHaoRFlLYzARWxhRgm
	hEe1xKhdLnBGvIUjOf4EqkYUzIrapEL5yH1h2DhWNDlSOcGXhwVB3L7327wLMnZiz1FAMoStxij
	5ZYKvzp8+PYPg+t/T2sZizr4nYL5VkbBvRc1AT0GMbUmUySG60t4groS+itk
X-Received: by 2002:a05:600c:628d:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a1c5ebb599mr16894025e9.35.1792076293476;
        Thu, 15 Oct 2026 07:58:13 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac4fd7sm19738293f8f.40.2026.10.15.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:13 -0700 (PDT)
From: Daniel Thompson <daniel@riscstar.com>
Date: Thu, 15 Oct 2026 15:55:01 +0100
Subject: [PATCH net-next v3 1/2] net: stmmac: Introduce group arguments for
 enable/disable_dma_irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tc956x-stmmac-no_irq_teardown-v3-1-8189870be545@riscstar.com>
References: <20261015-tc956x-stmmac-no_irq_teardown-v3-0-8189870be545@riscstar.com>
In-Reply-To: <20261015-tc956x-stmmac-no_irq_teardown-v3-0-8189870be545@riscstar.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Eric Dumazet <edumazet@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16729; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=1Xb3fJ7DRTRY19rNYNeO6Dwme3HMA8kT8BWjh0UFPBM=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBq0OnldKy/ZpiW4qnaBP3+CdA4DhBRl9k5GGlzC
 aIRzEhgG5mJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCatDp5QAKCRB84yVdOfeI
 oT98EACPJZ4wwOnAX2SzRaPT1mwPXqX/puS+H3E0hOyM8LSHaPV1t3H9/l2dFVjdt8C0nZE1dex
 hVwlx5KvuUH6xJYQTCFP+981ov14q+lvria9nkl3nDDgUVs6mh15uJYfBZI0YuIEhALbrhzmvn5
 LkOuafudpYnkyeJuCVSozjiEUniRqu8zf+Co8Xgr26/WhUAtTGz14OLoel33uaa8xLn+jgOs/zK
 Cij7/B1nFRg3ZfR7oMYKpRAvpAtPu2XH+g5F9fOMeYUOQAlMYSanaQCxyLG0lyDJw/wqm9oLW8W
 AQK/Dg3QikpNx8hbYCilwF+oh5lgLjKvI6pKhdMlh1vvGJmHafTHWCAJBUujpGDC++um11JG2Uj
 Ip/rWZOk+e/9tngbTekB88cFTYOaK3+GXo4RBSGLxKSU2S0UHxWSJoPBEiR9Y5xwEiDc92Axt8c
 SdagVsfCt6beVcf+qdyvFLJQKsxUuofhmeLLjUAlQPJ12P7A2iONrlfJekXt6MoNytnwkgbEcSL
 pCVwSaaDVZ2IZJz8v2snw3umLOU4YGMiXQIjooP7MTLUmaER+KRahoOiSnC+nBrZF6HW+AWloIJ
 /D2czylDaAYoUIQoXWtBYgRvrYu1OvZOOP7NyaYcqcxI1zZjTf6YPkuYazzerGy7jBL07C64Yhs
 aXOiUm5O4BZzQSw==
X-Developer-Key: i=daniel@riscstar.com; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_075816_740220_E822FF42 
X-CRM114-Status: GOOD (  16.65  )
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

The enable_dma_irq/disasble_dma_irq functions take two booleans, rx and
tx that identify which interrupts should be disabled. Replace these
with a single bitflag argument, group. This allows a third group to be
added which is used to enable/disable other sources of DMA interrupt,
specifically normal and abnormal summary interrupts which are grouped
together as "other".

These changes certainly improve callsite readability, although the real
motivation for the change if to support future changes that need to
mask "other" DMA IRQ interrupts.

There is a very subtle difference introduced by this patch. The sites
that use STMMAC_DMA_IRQ_ALL would previously only have enabled
STMMAC_DMA_IRQ_RXTX. This will not cause any change of behaviour
because the other interrupts are already enabled in all these cases.
STMMAC_DMA_IRQ_ALL has been used in each of these cases to provide
clarify of intent.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 12 ++++-----
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 29 ++++++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h    |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c    | 29 ++++++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 29 ++++++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/hwif.h         | 10 ++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 26 +++++++++----------
 8 files changed, 88 insertions(+), 55 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb9623356b12b39e5c0105d745e237007d6..af7acfc7a26fa4f00bad0901b9fb91d9ce532854 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -347,13 +347,13 @@ static void sun8i_dwmac_dump_mac_regs(struct mac_device_info *hw,
 
 static void sun8i_dwmac_enable_dma_irq(struct stmmac_priv *priv,
 				       void __iomem *ioaddr, u32 chan,
-				       bool rx, bool tx)
+				       u32 flags)
 {
 	u32 value = readl(ioaddr + EMAC_INT_EN);
 
-	if (rx)
+	if (flags & STMMAC_DMA_IRQ_RX)
 		value |= EMAC_RX_INT;
-	if (tx)
+	if (flags & STMMAC_DMA_IRQ_TX)
 		value |= EMAC_TX_INT;
 
 	writel(value, ioaddr + EMAC_INT_EN);
@@ -361,13 +361,13 @@ static void sun8i_dwmac_enable_dma_irq(struct stmmac_priv *priv,
 
 static void sun8i_dwmac_disable_dma_irq(struct stmmac_priv *priv,
 					void __iomem *ioaddr, u32 chan,
-					bool rx, bool tx)
+					u32 flags)
 {
 	u32 value = readl(ioaddr + EMAC_INT_EN);
 
-	if (rx)
+	if (flags & STMMAC_DMA_IRQ_RX)
 		value &= ~EMAC_RX_INT;
-	if (tx)
+	if (flags & STMMAC_DMA_IRQ_TX)
 		value &= ~EMAC_TX_INT;
 
 	writel(value, ioaddr + EMAC_INT_EN);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 43b036d4e95bdde882ab79e57e7cf6e0b9cb2e39..ca8caade68079252de0d2c4805387f8e07a56f22 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -175,9 +175,9 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 
 int dwmac4_dma_reset(void __iomem *ioaddr);
 void dwmac4_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			   u32 chan, bool rx, bool tx);
+			   u32 chan, u32 group);
 void dwmac4_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			    u32 chan, bool rx, bool tx);
+			    u32 chan, u32 group);
 void dwmac4_dma_start_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
 			 u32 chan);
 void dwmac4_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index a0249715fafafdf8c93d1535a15b73daed1168cb..7c5881ca61e8bb586b6d6f791a3fb1c122c814bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -109,30 +109,39 @@ void dwmac4_set_rx_ring_len(struct stmmac_priv *priv, void __iomem *ioaddr,
 	writel(len, ioaddr + DMA_CHAN_RX_RING_LEN(dwmac4_addrs, chan));
 }
 
+static u32 dwmac4_enable_dma_mask(u32 group)
+{
+	u32 mask = 0;
+
+	if (group & STMMAC_DMA_IRQ_RX)
+		mask |= DMA_CHAN_INTR_ENA_RIE;
+	if (group & STMMAC_DMA_IRQ_TX)
+		mask |= DMA_CHAN_INTR_ENA_TIE;
+	if (group & STMMAC_DMA_IRQ_OTHER)
+		mask |= DMA_CHAN_INTR_DEFAULT_MASK &
+			~(DMA_CHAN_INTR_ENA_RIE | DMA_CHAN_INTR_ENA_TIE);
+
+	return mask;
+}
+
 void dwmac4_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			   u32 chan, bool rx, bool tx)
+			   u32 chan, u32 group)
 {
 	const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;
 	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 
-	if (rx)
-		value |= DMA_CHAN_INTR_ENA_RIE;
-	if (tx)
-		value |= DMA_CHAN_INTR_ENA_TIE;
+	value |= dwmac4_enable_dma_mask(group);
 
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
 
 void dwmac4_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			    u32 chan, bool rx, bool tx)
+			    u32 chan, u32 group)
 {
 	const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;
 	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 
-	if (rx)
-		value &= ~DMA_CHAN_INTR_ENA_RIE;
-	if (tx)
-		value &= ~DMA_CHAN_INTR_ENA_TIE;
+	value &= ~dwmac4_enable_dma_mask(group);
 
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
index e1c37ac2c99d2ff5be3aa64cab4812821ec60e91..6b4cad57610ca7f391a9baa0871ef7060df29896 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
@@ -145,9 +145,9 @@ static inline u32 dma_chan_base_addr(u32 base, u32 chan)
 void dwmac_enable_dma_transmission(void __iomem *ioaddr, u32 chan);
 void dwmac_enable_dma_reception(void __iomem *ioaddr, u32 chan);
 void dwmac_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			  u32 chan, bool rx, bool tx);
+			  u32 chan, u32 group);
 void dwmac_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			   u32 chan, bool rx, bool tx);
+			   u32 chan, u32 group);
 void dwmac_dma_start_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
 			u32 chan);
 void dwmac_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index a0383f9486c2db08bff5a62006857c335721966a..d7465271985466c6cbd867c35ebc57a661fce64b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -38,28 +38,37 @@ void dwmac_enable_dma_reception(void __iomem *ioaddr, u32 chan)
 	writel(1, ioaddr + DMA_CHAN_RCV_POLL_DEMAND(chan));
 }
 
+static u32 dwmac_enable_dma_mask(u32 group)
+{
+	u32 mask = 0;
+
+	if (group & STMMAC_DMA_IRQ_RX)
+		mask |= DMA_INTR_DEFAULT_RX;
+	if (group & STMMAC_DMA_IRQ_TX)
+		mask |= DMA_INTR_DEFAULT_TX;
+	if (group & STMMAC_DMA_IRQ_OTHER)
+		mask |= DMA_INTR_DEFAULT_MASK &
+			~(DMA_INTR_DEFAULT_RX | DMA_INTR_DEFAULT_TX);
+
+	return mask;
+}
+
 void dwmac_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			  u32 chan, bool rx, bool tx)
+			  u32 chan, u32 group)
 {
 	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(chan));
 
-	if (rx)
-		value |= DMA_INTR_DEFAULT_RX;
-	if (tx)
-		value |= DMA_INTR_DEFAULT_TX;
+	value |= dwmac_enable_dma_mask(group);
 
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(chan));
 }
 
 void dwmac_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			   u32 chan, bool rx, bool tx)
+			   u32 chan, u32 group)
 {
 	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(chan));
 
-	if (rx)
-		value &= ~DMA_INTR_DEFAULT_RX;
-	if (tx)
-		value &= ~DMA_INTR_DEFAULT_TX;
+	value &= ~dwmac_enable_dma_mask(group);
 
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(chan));
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index ff83858ebc1f33aa8092a2d83018bd5f96b7eead..63459d1a73a95b4fecedc39dbcde31c21a87dc47 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -228,30 +228,39 @@ static void dwxgmac2_dma_tx_mode(struct stmmac_priv *priv, void __iomem *ioaddr,
 	writel(value, ioaddr +  XGMAC_MTL_TXQ_OPMODE(channel));
 }
 
+static u32 dwxgmac2_enable_dma_mask(u32 group)
+{
+	u32 mask = 0;
+
+	if (group & STMMAC_DMA_IRQ_RX)
+		mask |= XGMAC_DMA_INT_DEFAULT_RX;
+	if (group & STMMAC_DMA_IRQ_TX)
+		mask |= XGMAC_DMA_INT_DEFAULT_TX;
+	if (group & STMMAC_DMA_IRQ_OTHER)
+		mask |= XGMAC_DMA_INT_DEFAULT_EN &
+			~(XGMAC_DMA_INT_DEFAULT_RX | XGMAC_DMA_INT_DEFAULT_TX);
+
+	return mask;
+}
+
 static void dwxgmac2_enable_dma_irq(struct stmmac_priv *priv,
 				    void __iomem *ioaddr, u32 chan,
-				    bool rx, bool tx)
+				    u32 group)
 {
 	u32 value = readl(ioaddr + XGMAC_DMA_CH_INT_EN(chan));
 
-	if (rx)
-		value |= XGMAC_DMA_INT_DEFAULT_RX;
-	if (tx)
-		value |= XGMAC_DMA_INT_DEFAULT_TX;
+	value |= dwxgmac2_enable_dma_mask(group);
 
 	writel(value, ioaddr + XGMAC_DMA_CH_INT_EN(chan));
 }
 
 static void dwxgmac2_disable_dma_irq(struct stmmac_priv *priv,
 				     void __iomem *ioaddr, u32 chan,
-				     bool rx, bool tx)
+				     u32 group)
 {
 	u32 value = readl(ioaddr + XGMAC_DMA_CH_INT_EN(chan));
 
-	if (rx)
-		value &= ~XGMAC_DMA_INT_DEFAULT_RX;
-	if (tx)
-		value &= ~XGMAC_DMA_INT_DEFAULT_TX;
+	value &= ~dwxgmac2_enable_dma_mask(group);
 
 	writel(value, ioaddr + XGMAC_DMA_CH_INT_EN(chan));
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 5e2654c91b4171da0e6143671dade4d62c750e2f..766a36e4fab6619a031e0baeae965f3794b1cbe1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -163,6 +163,12 @@ struct stmmac_desc_ops {
 struct stmmac_dma_cfg;
 struct dma_features;
 
+#define STMMAC_DMA_IRQ_RX BIT(0)
+#define STMMAC_DMA_IRQ_TX BIT(1)
+#define STMMAC_DMA_IRQ_OTHER BIT(2)
+#define STMMAC_DMA_IRQ_TXRX (STMMAC_DMA_IRQ_TX | STMMAC_DMA_IRQ_RX)
+#define STMMAC_DMA_IRQ_ALL (STMMAC_DMA_IRQ_TXRX | STMMAC_DMA_IRQ_OTHER)
+
 /* Specific DMA helpers */
 struct stmmac_dma_ops {
 	/* DMA core initialization */
@@ -194,9 +200,9 @@ struct stmmac_dma_ops {
 	void (*enable_dma_transmission)(void __iomem *ioaddr, u32 chan);
 	void (*enable_dma_reception)(void __iomem *ioaddr, u32 chan);
 	void (*enable_dma_irq)(struct stmmac_priv *priv, void __iomem *ioaddr,
-			       u32 chan, bool rx, bool tx);
+			       u32 chan, u32 group);
 	void (*disable_dma_irq)(struct stmmac_priv *priv, void __iomem *ioaddr,
-				u32 chan, bool rx, bool tx);
+				u32 chan, u32 group);
 	void (*start_tx)(struct stmmac_priv *priv, void __iomem *ioaddr,
 			 u32 chan);
 	void (*stop_tx)(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b837e8e27a352e15c0967cc12773fe18a100a2a5..7b80fe66cf199adbd31b79a484b2970aef211b51 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2515,7 +2515,7 @@ static void stmmac_enable_all_dma_irq(struct stmmac_priv *priv)
 		unsigned long flags;
 
 		spin_lock_irqsave(&ch->lock, flags);
-		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
+		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, STMMAC_DMA_IRQ_ALL);
 		spin_unlock_irqrestore(&ch->lock, flags);
 	}
 }
@@ -3088,7 +3088,7 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan, u32 dir)
 	if ((status & handle_rx) && (chan < priv->plat->rx_queues_to_use)) {
 		if (napi_schedule_prep(rx_napi)) {
 			spin_lock_irqsave(&ch->lock, flags);
-			stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 0);
+			stmmac_disable_dma_irq(priv, priv->ioaddr, chan, STMMAC_DMA_IRQ_RX);
 			spin_unlock_irqrestore(&ch->lock, flags);
 			__napi_schedule(rx_napi);
 		}
@@ -3097,7 +3097,7 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan, u32 dir)
 	if ((status & handle_tx) && (chan < priv->plat->tx_queues_to_use)) {
 		if (napi_schedule_prep(tx_napi)) {
 			spin_lock_irqsave(&ch->lock, flags);
-			stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 0, 1);
+			stmmac_disable_dma_irq(priv, priv->ioaddr, chan, STMMAC_DMA_IRQ_TX);
 			spin_unlock_irqrestore(&ch->lock, flags);
 			__napi_schedule(tx_napi);
 		}
@@ -3291,7 +3291,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	/* DMA CSR Channel configuration */
 	for (chan = 0; chan < dma_csr_ch; chan++) {
 		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
-		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
+		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, STMMAC_DMA_IRQ_TXRX);
 	}
 
 	/* DMA RX Channel Configuration */
@@ -3365,7 +3365,7 @@ static enum hrtimer_restart stmmac_tx_timer(struct hrtimer *t)
 		unsigned long flags;
 
 		spin_lock_irqsave(&ch->lock, flags);
-		stmmac_disable_dma_irq(priv, priv->ioaddr, ch->index, 0, 1);
+		stmmac_disable_dma_irq(priv, priv->ioaddr, ch->index, STMMAC_DMA_IRQ_TX);
 		spin_unlock_irqrestore(&ch->lock, flags);
 		__napi_schedule(napi);
 	}
@@ -6013,7 +6013,7 @@ static int stmmac_napi_poll_rx(struct napi_struct *napi, int budget)
 		unsigned long flags;
 
 		spin_lock_irqsave(&ch->lock, flags);
-		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, 1, 0);
+		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, STMMAC_DMA_IRQ_RX);
 		spin_unlock_irqrestore(&ch->lock, flags);
 	}
 
@@ -6042,7 +6042,7 @@ static int stmmac_napi_poll_tx(struct napi_struct *napi, int budget)
 		unsigned long flags;
 
 		spin_lock_irqsave(&ch->lock, flags);
-		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, 0, 1);
+		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, STMMAC_DMA_IRQ_TX);
 		spin_unlock_irqrestore(&ch->lock, flags);
 	}
 
@@ -6095,7 +6095,7 @@ static int stmmac_napi_poll_rxtx(struct napi_struct *napi, int budget)
 		/* Both RX and TX work done are complete,
 		 * so enable both RX & TX IRQs.
 		 */
-		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
+		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, STMMAC_DMA_IRQ_TXRX);
 		spin_unlock_irqrestore(&ch->lock, flags);
 	}
 
@@ -7032,7 +7032,7 @@ void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue)
 	unsigned long flags;
 
 	spin_lock_irqsave(&ch->lock, flags);
-	stmmac_disable_dma_irq(priv, priv->ioaddr, queue, 1, 0);
+	stmmac_disable_dma_irq(priv, priv->ioaddr, queue, STMMAC_DMA_IRQ_RX);
 	spin_unlock_irqrestore(&ch->lock, flags);
 
 	stmmac_stop_rx_dma(priv, queue);
@@ -7072,7 +7072,7 @@ void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue)
 	stmmac_start_rx_dma(priv, queue);
 
 	spin_lock_irqsave(&ch->lock, flags);
-	stmmac_enable_dma_irq(priv, priv->ioaddr, queue, 1, 0);
+	stmmac_enable_dma_irq(priv, priv->ioaddr, queue, STMMAC_DMA_IRQ_RX);
 	spin_unlock_irqrestore(&ch->lock, flags);
 }
 
@@ -7082,7 +7082,7 @@ void stmmac_disable_tx_queue(struct stmmac_priv *priv, u32 queue)
 	unsigned long flags;
 
 	spin_lock_irqsave(&ch->lock, flags);
-	stmmac_disable_dma_irq(priv, priv->ioaddr, queue, 0, 1);
+	stmmac_disable_dma_irq(priv, priv->ioaddr, queue, STMMAC_DMA_IRQ_TX);
 	spin_unlock_irqrestore(&ch->lock, flags);
 
 	stmmac_stop_tx_dma(priv, queue);
@@ -7123,7 +7123,7 @@ void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue)
 	stmmac_start_tx_dma(priv, queue);
 
 	spin_lock_irqsave(&ch->lock, flags);
-	stmmac_enable_dma_irq(priv, priv->ioaddr, queue, 0, 1);
+	stmmac_enable_dma_irq(priv, priv->ioaddr, queue, STMMAC_DMA_IRQ_TX);
 	spin_unlock_irqrestore(&ch->lock, flags);
 }
 
@@ -7191,7 +7191,7 @@ int stmmac_xdp_open(struct net_device *dev)
 	/* DMA CSR Channel configuration */
 	for (chan = 0; chan < dma_csr_ch; chan++) {
 		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
-		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
+		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, STMMAC_DMA_IRQ_TXRX);
 	}
 
 	/* Adjust Split header */

-- 
2.47.3


