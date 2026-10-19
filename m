Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BACCCA490
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 03:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvw4syNS+titZXjd+BAVQh8BZuoN5qywIcBOPbcEmbk=; b=aO9vMVcLSpSbDtsR/8jHJv2jhY
	zflQzQP8LR5X69o1y4A+ul3OKfXmNvQcNXx9t/2AsA6bn4BD2zZuEVQS7FnVBNw7bOyF62oGm+pg1
	WmII7wuuYB6pj2/z11im2GMO5CDhrgn9pA8AFPvpNSnx8JLuiHUP9dJDXkBi08dmniJWh3Wt3hHBK
	4h45Jf5rMBffvkZAzuS0F8VIzClAeklvu31kDf7Mh0eOO/cIbsL0qzPxUQrxTeSm0gAC0UljCg5ol
	U+mgP7m1wzpjwWUQp4Ls8dsFBt7/mTz2zTWD3Gn/y2lMmnC+a2i4/aX0UxsuWcPhemjgwAcVsQz2J
	4CnkNoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIddK-00000006Uqe-0GRZ;
	Mon, 19 Oct 2026 03:01:54 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdd7-00000006Uif-3eXN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 03:01:43 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-9196d8543cbso15937466d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792378900; x=1792983700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvw4syNS+titZXjd+BAVQh8BZuoN5qywIcBOPbcEmbk=;
        b=Q6eWRyidlzsTWG5V/mE649GYZFC4RX/SHJAn62xjegVPrJPY85BK3GHh5LSQgeXFO8
         zCbak9kYjV+R57M6bwPvsysm+vsTAfq+Xkuvbio8iKYKa2cJoCX/zmlNRUqlRwgbdoHo
         kFkiMqICUQYcaXZxauuLq2TiDTuI/7kSlpcuDkwmjHHxUOImNhp/TPiSCdM8Yx1vcy21
         b73lxLz3iurh/9w89t48EJE//h7rDGgCLmnUfEOB6rf5kCjZKoW9/gftN78MGeyiw99m
         pezR3OfqUj/0L9VzdcBqajOqmWTHFQ+n1G8DGP3RyN37G2K8ADVzYsJ/E61SX0YzkAJp
         bYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378901; x=1792983701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvw4syNS+titZXjd+BAVQh8BZuoN5qywIcBOPbcEmbk=;
        b=lwosl8j5c5RjzET1hL4n3LO3/OB4YUNjHsqJrYrIDOX0cT2A+nYRPBI9lNNvr2Vz6X
         JvZaXfDARKpVGWIU36bZek68CUURkOzeuHEHk5ky5ysP5dSAuC1TCq+EAzR1AKwr19aY
         ylnvmedpd6CFrBQHkz476jQuAt3diSJIjwoen1EBxAT6cLslzvJ4oQDxdDnnsVj1CmCR
         B5HhFZhdPgvWWFUM0vdE5Abw0CDw0Y3bHmJDgAfZsSTZXdTzFrla9jxiezs/6v0Le3Ux
         aSmauZFcewGXQloeKkewUchZijVc+jueMY/M99SNM7/TcCLBvnrYHpjzMKtzpEaF1ZJW
         r4Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxUye6NXUeYaIaas5fURKR5RtUwjYWcOpTivn8d4TP3D117ohXHt5RV+cSF0tld+2o29cARvg4/CJWAFKrRPHxR@lists.infradead.org
X-Gm-Message-State: AFq9FYLpk2TEm+Pv4jYmZakgTUxnZ5lH5w3NHF0LjLUVJ98ft68a3kre
	bfWNHB2BvW6sF16ywFa2Csdfqrt9z3jb4T5D2rU+7BId8iWeWIsMNLEk7DchVbxk8sI=
X-Gm-Gg: AYBFou3Le9GnZsuQWvnbFzoisSITC9GQJ/6X4vcwsyReXuCOB0ZCPaS68WngRa2iTRG
	9FJSUpVXEkRsVQePJbzre9AD3SiEjZ28LL6zL0jpwRj5I2u9pfLBJy/c8WYPc16GGMyMPJU6nrJ
	l7+x5mDkxAG5G5WI9ugWyNN+fS+pi+SSVP+FAEdLaU1KPiZwErstx+yQur++60HyzaO1QPTzs0w
	wUHFQhJiRrDKePI8IFzMW2Xv4DRLziq7AdJbes7yxPvyCarZr89M7lWk1XUlQuUcmtR4VlHfENb
	OdagoHlP5BTczFaD8xqfYWj1EZbuwQXFGpa2iYATk44zdAcop2Pdh/pSGOUj3a/NcgMp4AZs8Wj
	otWwmP4T0QycLo4RJ5n7e4BMeNxqLcv//66fhUuROqxsSVJkBg6yL/Hn7k+Px/Vcy1V8WmSyty5
	XFaQlJXeXPS2gc1ftnHHPSM1lue+Mqv7xPUaWtS9KLVB7v2xn8IsXZ1HzWHYKzbLgFPTxSm/sAJ
	Tki
X-Received: by 2002:a05:620a:394c:b0:93e:c12c:4416 with SMTP id af79cd13be357-93f29df8910mr1058004285a.82.1792378900653;
        Sun, 18 Oct 2026 20:01:40 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm216840185a.10.2026.10.18.20.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:01:40 -0700 (PDT)
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
Subject: [PATCH net-next 4/5] net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
Date: Sun, 18 Oct 2026 22:01:27 -0500
Message-ID: <20261019030129.1470307-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019030129.1470307-1-elder@riscstar.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_200141_947910_377A6BEF 
X-CRM114-Status: GOOD (  18.40  )
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

Toshiba TC9564 is an Ethernet-AVB/TSN bridge and is essentially a
small and highly-specialised SoC. Ethernet on this chip is provided
by a DesignWare XGMAC.

One consequence of the SoC-like design is that the internal AXI bus
(used by the XGMAC for DMA) maps the PCI DMA space with a non-zero base
address. This requires a translation step (happily just simple addition)
to convert the PCI DMA address to the hardware DMA address.

This is pretty funky so rather than push that translation logic into
the core driver we intend to keep that logic inside the TC9564
platform code. In order to do that we need to export a few symbols
to allow us to override some of the DMA and descriptor op tables.

FWIW this approach to overriding the ops tables is similar to the
mechanism currently found in dwmac-loongson.c (with the exception
that we have also exported a couple of functions so we don't
have to replicate their content in the TC9564 platform code).

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h |  7 +++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c    |  1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c   |  1 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 18 ++++++++++--------
 4 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 0fe86e9942334..1b32d14c37440 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -470,4 +470,11 @@ extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
 extern const struct stmmac_dma_ops dwxgmac301_dma_ops;
 extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 
+void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan);
+void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan);
+
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1a88cbaed70ca..0effdd6969d65 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1542,6 +1542,7 @@ int dwxgmac2_setup(struct stmmac_priv *priv)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_setup);
 
 int dwxlgmac2_setup(struct stmmac_priv *priv)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395bc..f0e7b8ee48ac7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -374,3 +374,4 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.set_vlan = dwxgmac2_set_vlan,
 	.set_tbs = dwxgmac2_set_tbs,
 };
+EXPORT_SYMBOL_GPL(dwxgmac210_desc_ops);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index f9a77d641eb65..2f9334d7cb922 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -63,10 +63,10 @@ static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
 	writel(XGMAC_DMA_INT_DEFAULT_EN, ioaddr + XGMAC_DMA_CH_INT_EN(chan));
 }
 
-static void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
-				      void __iomem *ioaddr,
-				      struct stmmac_dma_cfg *dma_cfg,
-				      dma_addr_t phy, u32 chan)
+void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
+			       void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg,
+			       dma_addr_t phy, u32 chan)
 {
 	u32 rxpbl = dma_cfg->rxpbl ?: dma_cfg->pbl;
 	u32 value;
@@ -78,11 +78,11 @@ static void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
 	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
 	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_dma_init_rx_chan);
 
-static void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv,
-				      void __iomem *ioaddr,
-				      struct stmmac_dma_cfg *dma_cfg,
-				      dma_addr_t phy, u32 chan)
+void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan)
 {
 	u32 txpbl = dma_cfg->txpbl ?: dma_cfg->pbl;
 	u32 value;
@@ -94,6 +94,7 @@ static void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv,
 	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
 	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_dma_init_tx_chan);
 
 static void dwxgmac2_dma_axi(void __iomem *ioaddr, struct stmmac_axi *axi)
 {
@@ -673,3 +674,4 @@ const struct stmmac_dma_ops dwxgmac301_dma_ops = {
 	.enable_sph = dwxgmac2_enable_sph,
 	.enable_tbs = dwxgmac2_enable_tbs,
 };
+EXPORT_SYMBOL_GPL(dwxgmac301_dma_ops);
-- 
2.53.0


