Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9558EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 22:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4ypV3tQbWdlibJNYX1clwuOwlvFN4BhFLLDGnhlf6o=; b=ANGl1y2ZAH1/Ovv9YHP0Mt8ls5
	TyA/O1BLjIAS1Fxt28Mj6OsQkIDvUc7KaFIWWrKuYcknqN3iDby7CYkVJCm6eUagmz31NM4nx6sri
	fs1A4SYqMFLlhUVnS+l798UEnYc7fs0PXy6+YbF9QhM9SQ1BKAFBeXcePr2lfOHqxVdr6HAMYP7Gj
	M3/CnWABTcEnfJUhyT6yESRcd9G3Q/yUfLu+4L/qtYtJWCoAAJ7VVIr4zog8EVFqc5Mk5apuhkpGh
	EB8Ba3XX8ZQo7Aq0vhL3RjZmPJmuAM9vMhUwUE6vK1adJFITXLKih8E7HJ34jVZ48WCav/y2ynOlG
	CIDOCvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWIL-0000000FWfa-1pfr;
	Mon, 28 Jul 2025 22:26:09 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWB5-0000000FVpo-1LwA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 22:18:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753741117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4ypV3tQbWdlibJNYX1clwuOwlvFN4BhFLLDGnhlf6o=;
	b=gtgtrZGQ/U1EmzXqAkhmEymzW7RZNBvppn61y0FwIzzgqLlzy0oxkYZZ8E/TnbbgKjlVxz
	MXX3kdfoEGxk/8hQc7Tg23/arS3VSr8ni7dwf1cJTrl2uG2jclzKgLXb0KXpDBmeEX32j7
	K0YA2VVbbvEjWhYbeZHyqKyO4E4hupw=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Leon Romanovsky <leon@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next v3 3/7] net: axienet: Use MDIO bus device in prints
Date: Mon, 28 Jul 2025 18:18:19 -0400
Message-Id: <20250728221823.11968-4-sean.anderson@linux.dev>
In-Reply-To: <20250728221823.11968-1-sean.anderson@linux.dev>
References: <20250728221823.11968-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_151839_657412_A18E8F32 
X-CRM114-Status: GOOD (  13.30  )
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

For clarity and to remove the dependency on the parent netdev, use the
MDIO bus device in print statements.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v3:
- New

 .../net/ethernet/xilinx/xilinx_axienet_mdio.c | 34 +++++++++++--------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
index 16f3581390dd..cacd5590731d 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
@@ -104,7 +104,7 @@ static int axienet_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 
 	rc = ioread32(lp->regs + XAE_MDIO_MRD_OFFSET) & 0x0000FFFF;
 
-	dev_dbg(lp->dev, "axienet_mdio_read(phy_id=%i, reg=%x) == %x\n",
+	dev_dbg(&bus->dev, "%s(phy_id=%i, reg=%x) == %x\n", __func__,
 		phy_id, reg, rc);
 
 	axienet_mdio_mdc_disable(lp);
@@ -131,7 +131,7 @@ static int axienet_mdio_write(struct mii_bus *bus, int phy_id, int reg,
 	int ret;
 	u32 mcr;
 
-	dev_dbg(lp->dev, "axienet_mdio_write(phy_id=%i, reg=%x, val=%x)\n",
+	dev_dbg(&bus->dev, "%s(phy_id=%i, reg=%x, val=%x)\n", __func__,
 		phy_id, reg, val);
 
 	axienet_mdio_mdc_enable(lp);
@@ -169,8 +169,9 @@ static int axienet_mdio_write(struct mii_bus *bus, int phy_id, int reg,
  * Sets up the MDIO interface by initializing the MDIO clock and enabling the
  * MDIO interface in hardware.
  **/
-static int axienet_mdio_enable(struct axienet_local *lp, struct device_node *np)
+static int axienet_mdio_enable(struct mii_bus *bus, struct device_node *np)
 {
+	struct axienet_local *lp = bus->priv;
 	u32 mdio_freq = DEFAULT_MDIO_FREQ;
 	u32 host_clock;
 	u32 clk_div;
@@ -186,28 +187,31 @@ static int axienet_mdio_enable(struct axienet_local *lp, struct device_node *np)
 		/* Legacy fallback: detect CPU clock frequency and use as AXI
 		 * bus clock frequency. This only works on certain platforms.
 		 */
-		np1 = of_find_node_by_name(NULL, "cpu");
+		np1 = of_find_node_by_name(NULL, "lpu");
 		if (!np1) {
-			netdev_warn(lp->ndev, "Could not find CPU device node.\n");
+			dev_warn(&bus->dev,
+				 "Could not find CPU device node.\n");
 			host_clock = DEFAULT_HOST_CLOCK;
 		} else {
 			int ret = of_property_read_u32(np1, "clock-frequency",
 						       &host_clock);
 			if (ret) {
-				netdev_warn(lp->ndev, "CPU clock-frequency property not found.\n");
+				dev_warn(&bus->dev,
+					 "CPU clock-frequency property not found.\n");
 				host_clock = DEFAULT_HOST_CLOCK;
 			}
 			of_node_put(np1);
 		}
-		netdev_info(lp->ndev, "Setting assumed host clock to %u\n",
-			    host_clock);
+		dev_info(&bus->dev,
+			 "Setting assumed host clock to %u\n", host_clock);
 	}
 
 	if (np)
 		of_property_read_u32(np, "clock-frequency", &mdio_freq);
 	if (mdio_freq != DEFAULT_MDIO_FREQ)
-		netdev_info(lp->ndev, "Setting non-standard mdio bus frequency to %u Hz\n",
-			    mdio_freq);
+		dev_info(&bus->dev,
+			 "Setting non-standard mdio bus frequency to %u Hz\n",
+			 mdio_freq);
 
 	/* clk_div can be calculated by deriving it from the equation:
 	 * fMDIO = fHOST / ((1 + clk_div) * 2)
@@ -245,14 +249,14 @@ static int axienet_mdio_enable(struct axienet_local *lp, struct device_node *np)
 
 	/* Check for overflow of mii_clk_div */
 	if (clk_div & ~XAE_MDIO_MC_CLOCK_DIVIDE_MAX) {
-		netdev_warn(lp->ndev, "MDIO clock divisor overflow\n");
+		dev_warn(&bus->dev, "MDIO clock divisor overflow\n");
 		return -EOVERFLOW;
 	}
 	lp->mii_clk_div = (u8)clk_div;
 
-	netdev_dbg(lp->ndev,
-		   "Setting MDIO clock divisor to %u/%u Hz host clock.\n",
-		   lp->mii_clk_div, host_clock);
+	dev_dbg(&bus->dev,
+		"Setting MDIO clock divisor to %u/%u Hz host clock.\n",
+		lp->mii_clk_div, host_clock);
 
 	axienet_mdio_mdc_enable(lp);
 
@@ -295,7 +299,7 @@ int axienet_mdio_setup(struct axienet_local *lp)
 	lp->mii_bus = bus;
 
 	mdio_node = of_get_child_by_name(lp->dev->of_node, "mdio");
-	ret = axienet_mdio_enable(lp, mdio_node);
+	ret = axienet_mdio_enable(bus, mdio_node);
 	if (ret < 0)
 		goto unregister;
 	ret = of_mdiobus_register(bus, mdio_node);
-- 
2.35.1.1320.gc452695387.dirty


