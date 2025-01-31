Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32155C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xnpI7vNNrRX64SZKMg5nZojTKO/j4hSZG5OSA5Wfd4=; b=xSiwcclHbW42V09i+Ft50e4Lvl
	HxuIRZEaoCpsE5U5M3pFEQ47qwAyNSjIyi3vybPxDZoHElYaIdcl1R6DRGFY8wPRs76R/Fq8k856x
	MGSkeLn1O425mcIYd4rktvLheKKJsNBkJZrakMjOemNCjSAIndRoqyQ/khYG8YOqBCMThHxpHLpI6
	4t50xnzYXSFbUNmmGugYk7X8d1QvonjoiKowjW162Uj49MTO2xnS7HFtcUUN15yxaxkzhcvRf0ont
	nvQDN8MbVvxErBzThrIW+J9wPmelDQqOt3UvLpHTVrlye3G2LsELC09XB+aChcYq1PCr+Wc/48PcJ
	00RFdBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdndD-0000000AKtA-0nM2;
	Fri, 31 Jan 2025 09:48:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnbt-0000000AKoh-2JLi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 09:46:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C8B8497;
	Fri, 31 Jan 2025 01:47:12 -0800 (PST)
Received: from [10.1.32.52] (e122027.cambridge.arm.com [10.1.32.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C4253F63F;
	Fri, 31 Jan 2025 01:46:43 -0800 (PST)
Message-ID: <07af1102-0fa7-45ad-bcbc-aef0295ceb63@arm.com>
Date: Fri, 31 Jan 2025 09:46:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 3/3] net: stmmac: Specify hardware capability value
 when FIFO size isn't specified
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Yanteng Si <si.yanteng@linux.dev>,
 Furong Xu <0x1207@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_014649_689709_E83E39EE 
X-CRM114-Status: GOOD (  21.08  )
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

On 27/01/2025 01:38, Kunihiko Hayashi wrote:
> When Tx/Rx FIFO size is not specified in advance, the driver checks if
> the value is zero and sets the hardware capability value in functions
> where that value is used.
> 
> Consolidate the check and settings into function stmmac_hw_init() and
> remove redundant other statements.
> 
> If FIFO size is zero and the hardware capability also doesn't have upper
> limit values, return with an error message.

This patch breaks my Firefly RK3288 board. It appears that all of the 
following are true:

 * priv->plat->rx_fifo_size == 0
 * priv->dma_cap.rx_fifo_size == 0
 * priv->plat->tx_fifo_size == 0
 * priv->dma_cap.tx_fifo_size == 0

Simply removing the "return -ENODEV" lines gets this platform working 
again (and AFAICT matches the behaviour before this patch was applied).
I'm not sure whether this points to another bug causing these to 
all be zero or if this is just an oversight. The below patch gets my 
board working:

-----8<-----
From 5097d29181f320875d29da8fc24e6d3ae44db581 Mon Sep 17 00:00:00 2001
From: Steven Price <steven.price@arm.com>
Date: Fri, 31 Jan 2025 09:32:17 +0000
Subject: [PATCH] net: stmmac: Allow zero for [tr]x_fifo_size

Commit 8865d22656b4 ("net: stmmac: Specify hardware capability value
when FIFO size isn't specified") modified the behaviour to bail out if
both the FIFO size and the hardware capability were both set to zero.
However there are platforms out there (e.g. RK3288) where this is the
case which this breaks.

Remove the error return and use the dma_cap value as is.

Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when FIFO size isn't specified")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d04543e5697b..41c837c91811 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7220,12 +7220,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	}
 
 	if (!priv->plat->rx_fifo_size) {
-		if (priv->dma_cap.rx_fifo_size) {
-			priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
-		} else {
-			dev_err(priv->device, "Can't specify Rx FIFO size\n");
-			return -ENODEV;
-		}
+		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
 	} else if (priv->dma_cap.rx_fifo_size &&
 		   priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {
 		dev_warn(priv->device,
@@ -7234,12 +7229,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
 	}
 	if (!priv->plat->tx_fifo_size) {
-		if (priv->dma_cap.tx_fifo_size) {
-			priv->plat->tx_fifo_size = priv->dma_cap.tx_fifo_size;
-		} else {
-			dev_err(priv->device, "Can't specify Tx FIFO size\n");
-			return -ENODEV;
-		}
+		priv->plat->tx_fifo_size = priv->dma_cap.tx_fifo_size;
 	} else if (priv->dma_cap.tx_fifo_size &&
 		   priv->plat->tx_fifo_size > priv->dma_cap.tx_fifo_size) {
 		dev_warn(priv->device,
-- 
2.39.5



