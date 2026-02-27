Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFC2FD7F8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 10:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gc2DPN8dhX2Y1LOPz3Pgjt4dmwCjQz6dghOPKT5Mkqc=; b=NGCPZa9K8ZVbS2X02EpM8Gp9/4
	JnKA+zZFskcXY0B7mVswjeEAnAQZTxDLgzc2RsVR8U5cx0t5vFbDw+R3p3OBcutx+k4+be7U040SO
	kKVZTSYIyUD/+ENfD7nc3+J4rbnSnoL83UkztJgV2ssBCqcUTfbH0OpQiuevbK3WgES7/Ci6uj5DH
	qD700R3MDC7jLUzZHR8/GK+gVAXmdEa+uh761aOjJKH973b5kh8fWy2UkRVvc2+urZCbXJPYU/ayh
	ISwLZDYyl0l4m3KmHEYI/GL6CxMLEBc3r9wZxYiOi6JF8B/9bj0qqjR8mjZ/xtzH+mbL9U6K1OGuX
	1k9HCTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvux6-00000008DvR-0hBA;
	Fri, 27 Feb 2026 10:20:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvux4-00000008Dun-09DZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 10:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gc2DPN8dhX2Y1LOPz3Pgjt4dmwCjQz6dghOPKT5Mkqc=; b=XRuEyIeAZwlUVZF1DdUW031rTe
	cvvhNEEzGhi671hJzVqyKXUiWPT34bBho+i3MQDoZkj5prIbekJXlJVsSB/98Y5aQPZdg7keIBOul
	e7o3J0LjKtdlHaD9V8VFiSj5BPjSWkghqn8Z4JWb5irZRwTcqv2Doa3uzHfCdaSg6gRhgsfAyX2un
	usKAWz1E3VYotNfggkhzfv43CGdbuex8AuSftqAVG7gZ6LYf1/0zxam8IXHP8OY0YqkK2rSoiasyF
	ZCXLH5bFdDeMwWeSzEhZbDXnpAjB6ZK6vIeiZoDzZIgryNrbBBx3c36Id8vwskgNe0wiSfUsYxw/m
	xbEPlcBw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43828 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuY5-000000000fN-13zF;
	Fri, 27 Feb 2026 09:54:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuY3-0000000Avnq-1Spv;
	Fri, 27 Feb 2026 09:54:15 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 14/14] net: stmmac: move DMA configuration validation
 to driver probe
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuY3-0000000Avnq-1Spv@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:54:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_022006_076113_943C12E3 
X-CRM114-Status: GOOD (  12.05  )
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

Move the DMA configuration validation from stmmac_init_dma_engine()
to the start of the driver probe function. The platform glue is
expected to supply the DMA configuration, and a non-zero programmable
burst length (bpl).

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a9b26d12a057..5d1cc9aead00 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3249,11 +3249,6 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	u32 chan = 0;
 	int ret = 0;
 
-	if (!priv->plat->dma_cfg || !priv->plat->dma_cfg->pbl) {
-		netdev_err(priv->dev, "Invalid DMA configuration\n");
-		return -EINVAL;
-	}
-
 	ret = stmmac_prereset_configure(priv);
 	if (ret)
 		return ret;
@@ -7733,6 +7728,11 @@ static int __stmmac_dvr_probe(struct device *device,
 	u32 rxq;
 	int i, ret = 0;
 
+	if (!plat_dat->dma_cfg || !plat_dat->dma_cfg->pbl) {
+		dev_err(device, "invalid DMA configuration\n");
+		return -EINVAL;
+	}
+
 	ndev = devm_alloc_etherdev_mqs(device, sizeof(struct stmmac_priv),
 				       MTL_MAX_TX_QUEUES, MTL_MAX_RX_QUEUES);
 	if (!ndev)
-- 
2.47.3


