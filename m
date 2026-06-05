Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE89CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bUHKe8xq0j7moOuD73/H9vKbxT6KczY0fAxl1satXM=; b=fsE2zsNAm6IC8pOcH22t/WlvEU
	xaspMLawEBqSuJZKj52kZZOhcuCwMQgxPxe8zi5fR23SjcyXM188Qo/HRdSaZJRGMDJ5DbKD1CG8Y
	MuozVg1SrKot+iIkNyiFDiJw2+HbkGZ7gbUihDwtGXdDGY23txndeOa/OHkfor2FILI1V8e2OR2va
	fHwmvZLWgm68xx2y6irIPRuuoNWzJjqm3pfl9ynuIso3zdyDqs3yx6EUARHaiCJBzAqZXcxlnh8LK
	RobnOdeXsyKuKutMJEIfUhptYytN/ROpCZhVCFnVlRQGEIiKBh/NNl5ZeX5uRS+LPyrPik8r/MKmn
	3do50/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvt-0000000HU1F-1vLl;
	Fri, 05 Jun 2026 01:01:09 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvi-0000000HTrw-046n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 01:01:05 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4863eae453eso644583b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 18:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621257; x=1781226057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bUHKe8xq0j7moOuD73/H9vKbxT6KczY0fAxl1satXM=;
        b=HGUnBKHNPs44sMXjw8DYkfXFEiABrkH4+2dLHNDPVAxr7l2/FJGxKQkmhSVk1gZM3S
         0XnyEkGHcRPjxhjI674FMcHNuyw0oCnNeYIs3170KAq6HjlodZaSksJVfR1ftYfJmGos
         tUTwjrd4fkuHQ3FacPrE/N+5OtvbuMnVo6jujMJvPaAq18jPEFsv+scmyG4HG3TYXf1H
         JMkL3hzv1o6wpPCzclNY7ySUbX2gna3R7jAcFovJSyr1Rx4bA9H6ajRir30MWlPSMD7a
         thMwOoQdd35TQM259EA4KLld9shEb77xtFdS+SKiW5KXLa6InliAWT6hTpJBngcYgX0S
         RVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621257; x=1781226057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bUHKe8xq0j7moOuD73/H9vKbxT6KczY0fAxl1satXM=;
        b=BV8agPbQ08fcf3PmeRRnqcO/paPYhP+/NAS6Xe4nlI1W8PpTzS9ssefXpL6liukS3A
         cy8qf04fOUbodtQ7jlcPQHxzaXTY8xU3BZMgvSsjXk2qqkZ/Wd6shbhalahhZy4o2Brn
         KjcsPGALZ9FFcS+eOjs+Q1wg/XwIocz9aV0EgPyAEMhW/zdbExxkoULQjZcNWE+jZyYC
         feRH39AEwql+JM349DBoLQScdt9NVYJ2S5Oxb5fP+DfDv9FjdQx/b5mWYM3eqCtdKc/t
         WB0QETj+jFHW1p4/WG3sY2EyXVVeha/ZXoATf3Kb7J2YtKUiQMvm01JJuEc3fpDU6fIe
         1XRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LEsqlaSn1HHMYHKyiw0a09FWKidLs8YWW5OWyOcCmKpCGsm2mCh5MJt5KP7Ofsm87N3aBJo/6ZXjzjDJ5zQmQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzDXTKTYypZY3cWxP8GA/bjLpJkcFxrv8lAzEPMo81mew0xhb2j
	reXgNKjsJOUR/UnsZi7m7be6ySsoWXfUPfKT70ZbX51zHY3DXdkcqLy/tFZAkPmuMq0=
X-Gm-Gg: Acq92OG+huVliQIYxP8kvy6UWktX/oAugodRp2bvuvr4NySzQ9iBhK2D2VHner24nC0
	sGVa7PvJDSKeIJiEOtJCr1cE9U1rsRKGg6LXCYM14GUYW+GY8PZ+jRtkZB7KGPkpNu6BYlXAxdP
	2bQZSSKG+de/l53SqMzGhUg1BAnT+G+tbQzohcEjvX6FJwDpXxzpuXNrHx/Em9CDdG5gZyAGz1x
	H4Jxzll402GSD07aAWx3h9DQ0e+mWmO6mgar8GkkI+tGHdyMcAOCuJ+tvKk5Q4PqpOkCKQXDsNy
	g2gQUOGFn0QNI2erKqV4I744VmCfG1NDJe8vX5UYLaslf9S/ihldX/63JLNsGFJsYNWuN+X3wxP
	EQ13s54AMOwbz899ZReCmJeP7toMflMxZhW/lnqdsFfRPPERuvTwidxJOKXrYmfUvv1uRrz3EC/
	rycdW30W/zxmX7CgAyYilS47xKnGZuX6yEZvYJWA==
X-Received: by 2002:a05:6808:1794:b0:486:3537:2193 with SMTP id 5614622812f47-4868dc58812mr926917b6e.11.1780621256480;
        Thu, 04 Jun 2026 18:00:56 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 09/14] net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
Date: Thu,  4 Jun 2026 20:00:16 -0500
Message-ID: <20260605010022.968612-10-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_180102_630401_C1FFB6DD 
X-CRM114-Status: GOOD (  18.04  )
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

Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially a
small and highly-specialised SoC. Ethernet on this chip is provided
by a DesignWare XGMAC.

One consequence of the SoC-like design is that the internal AXI bus
(used by the XGMAC for DMA) maps the PCI DMA space with a non-zero base
address. This requires a translation step (happily just simple addition)
to convert the PCI DMA address to the hardware DMA address.

This is pretty funky so rather than push that translation logic into
the core driver we intend to keep that logic inside the TC956x
platform code. In order to do that we need to export a few symbols
to allow us to override some of the DMA and descriptor op tables.

FWIW this approach to overriding the ops tables is similar to the
mechanism currently found in dwmac-loongson.c (with the exception
that we have also exported a couple of functions so we don't
have to replicate their content in the TC956x platform code).

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h |  7 +++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c    |  1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c   |  1 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 18 ++++++++++--------
 4 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index bcf59ad8a1939..8cecde1bef8a1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -468,4 +468,11 @@ extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
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
index f02b434bbd505..c9547dc6912a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1556,6 +1556,7 @@ int dwxgmac2_setup(struct stmmac_priv *priv)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_setup);
 
 int dwxlgmac2_setup(struct stmmac_priv *priv)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index b5f200a874840..cc67d8e1a920a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -368,3 +368,4 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.set_vlan = dwxgmac2_set_vlan,
 	.set_tbs = dwxgmac2_set_tbs,
 };
+EXPORT_SYMBOL_GPL(dwxgmac210_desc_ops);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 584ab28d7f7f5..f564b9bd7d128 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -62,10 +62,10 @@ static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
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
@@ -77,11 +77,11 @@ static void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
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
@@ -93,6 +93,7 @@ static void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv,
 	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
 	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_dma_init_tx_chan);
 
 static void dwxgmac2_dma_axi(void __iomem *ioaddr, struct stmmac_axi *axi)
 {
@@ -672,3 +673,4 @@ const struct stmmac_dma_ops dwxgmac301_dma_ops = {
 	.enable_sph = dwxgmac2_enable_sph,
 	.enable_tbs = dwxgmac2_enable_tbs,
 };
+EXPORT_SYMBOL_GPL(dwxgmac301_dma_ops);
-- 
2.51.0


