Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00501CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qgAfxK2MHik3nNugmeifO/rBJyY1F9RlKzlJQysCZZE=; b=zeTzS/PGyqf+iDzvZvY9JqMT0u
	iU38aDS9OmtM1u+rzA4vpTtcg3Q/rlrNTA74rhBOeADXUEELGOM7ODUV78R5Bv2DtVk52mBkK67lD
	2DPXuMj1yzX0VTXRgN9VNXWwEKcMgSfPutUMi3La5tSWoHGLHw+JvKabOxfLuabgoHlBpsuf5EFqz
	JiASGyKOl1W6WJHmrI5pMFZde90P4jycKOV1pmXVdBh3U1pYWPF7JlYnhm6b6JaK1/P6YJUDoRL6F
	twCXe6MAvl8V5Neez+Ay2w9QY1ly7F2Frka7vd9hE4Ph83Kxh8fexYumEsROvugrMriYdx/yTYrYT
	dhGKszYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImWJ-00000007481-2vGZ;
	Tue, 11 Nov 2025 11:26:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImWH-0000000747e-1tRs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qgAfxK2MHik3nNugmeifO/rBJyY1F9RlKzlJQysCZZE=; b=teHh3k49Ca2cV+YDu4ciIA/DvO
	kg6hvuAZ3bGw6zDo8ruejkZPLdHbqB1KpfgFl/2sX8GQHmNPh6WVxBWmozfxxmnVPRG8+9fiLJuto
	GcKmwMyV7pp+va4OgEptejkSSPvoGzTgGnxNOO1Mzm6S+rGHqqGJj8L/06NGF/cmDokJ+skKhAKHt
	JoDdXS2OeSxW6IQyteH/HrM3Q0tJyTv5csqOvR1Epc4VF8adpaOexLrt/0Egp4i7qv1i9niGvWFhc
	m4xGWNaix2TM6YdM0wh029QthFNzEfIf94HIjXBg9ehdCSi18kym85CH86CVfeKLVGs3EpQR103SP
	Rj7YP5YQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55950 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vImWB-000000002Tq-09lg;
	Tue, 11 Nov 2025 11:26:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vImWA-0000000DrIl-1HZY;
	Tue, 11 Nov 2025 11:26:34 +0000
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
Subject: [PATCH net-next] net: stmmac: improve ndev->max_mtu setup readability
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vImWA-0000000DrIl-1HZY@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 11:26:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_032641_510433_9C49CF50 
X-CRM114-Status: GOOD (  16.78  )
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

Improve the readibility of the code setting ndev->max_mtu. This depends
on the hardware specific maximum defined by the MAC core, and also a
platform provided maximum.

The code was originally checking that the platform specific maximum was
between ndev->min_mtu..MAC core maximum before reducing ndev->max_mtu,
otherwise if the platform specific maximum was less than ndev->min_mtu,
issuing a warning.

Re-order the code to handle the case where the platform specific max is
below ndev->min_mtu, which then means that the subsequent test is
simply reducing ndev->max_mtu.

Update the comment, and add a few blank lines to separate the blocks of
code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ccf383b355e7..eb4350193996 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1392,9 +1392,9 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 	return NET_SKB_PAD;
 }
 
-static int stmmac_set_bfsize(int mtu, int bufsize)
+static int stmmac_set_bfsize(int mtu)
 {
-	int ret = bufsize;
+	int ret;
 
 	if (mtu >= BUF_SIZE_8KiB)
 		ret = BUF_SIZE_16KiB;
@@ -3958,12 +3958,13 @@ stmmac_setup_dma_desc(struct stmmac_priv *priv, unsigned int mtu)
 		return ERR_PTR(-ENOMEM);
 	}
 
+	/* Returns 0 or BUF_SIZE_16KiB if mtu > 8KiB and dwmac4 or ring mode */
 	bfsize = stmmac_set_16kib_bfsize(priv, mtu);
 	if (bfsize < 0)
 		bfsize = 0;
 
 	if (bfsize < BUF_SIZE_16KiB)
-		bfsize = stmmac_set_bfsize(mtu, 0);
+		bfsize = stmmac_set_bfsize(mtu);
 
 	dma_conf->dma_buf_sz = bfsize;
 	/* Chose the tx/rx size from the already defined one in the
@@ -7773,22 +7774,23 @@ int stmmac_dvr_probe(struct device *device,
 
 	/* MTU range: 46 - hw-specific max */
 	ndev->min_mtu = ETH_ZLEN - ETH_HLEN;
+
 	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
 		ndev->max_mtu = XGMAC_JUMBO_LEN;
-	else if ((priv->plat->enh_desc) || (priv->synopsys_id >= DWMAC_CORE_4_00))
+	else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
 		ndev->max_mtu = JUMBO_LEN;
 	else
 		ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);
-	/* Will not overwrite ndev->max_mtu if plat->maxmtu > ndev->max_mtu
-	 * as well as plat->maxmtu < ndev->min_mtu which is a invalid range.
+
+	/* Warn if the platform's maxmtu is smaller than the minimum MTU,
+	 * otherwise clamp the maximum MTU above to the platform's maxmtu.
 	 */
-	if ((priv->plat->maxmtu < ndev->max_mtu) &&
-	    (priv->plat->maxmtu >= ndev->min_mtu))
-		ndev->max_mtu = priv->plat->maxmtu;
-	else if (priv->plat->maxmtu < ndev->min_mtu)
+	if (priv->plat->maxmtu < ndev->min_mtu)
 		dev_warn(priv->device,
 			 "%s: warning: maxmtu having invalid value (%d)\n",
 			 __func__, priv->plat->maxmtu);
+	else if (priv->plat->maxmtu < ndev->max_mtu)
+		ndev->max_mtu = priv->plat->maxmtu;
 
 	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 
-- 
2.47.3


