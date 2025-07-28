Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EEEC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 22:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOXG56ON/OYMfwTBNtCeAQzfV8BAU8WbBn8TalhqNho=; b=PcJaLwv0zS/qo/iN2FuGcbD6SX
	i0WylmpJMmoyfasD9uk3ZLjlDxskopX/vHHFayzIkWjbOm3h+y5KaGRGamMP8U8uuweXXwvpqhng8
	DCQUSp3QdfzyP1iCSgbZPQ0QwUX2R4TzrrYwdHK63wj5VnjkX+r/f9QeGhh1Fwp1fCWmyvDfJ/nQa
	+qgYUgf6ha6GzFVv5WqKZvzodVVurB1g9z/sTibM6Is8+PJnueis83/vwxmMSOWrJYQzI2vk3qTWV
	soSCdA54rNsb9w9B2U5dCtRsRWobWkqPf116LKKmVgpg8lCSTfn4CdBI7SwuXl0eCQHQrfeVGrLb0
	s/zo3PwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWFu-0000000FWUZ-2heV;
	Mon, 28 Jul 2025 22:23:38 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWB3-0000000FVpS-1QrE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 22:18:38 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753741115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tOXG56ON/OYMfwTBNtCeAQzfV8BAU8WbBn8TalhqNho=;
	b=g98zP0ybmtfdWwaqcx7JLqCEF8I8SkTztnMareSSKNVq9gW7o6q9lV03SQjbMSqGvCdApf
	fzfHdcrdWVxqlJ9F6vzoYlki83XqxY/phWzzTQfUflCyWtN/haSb8zHFvne4s+DQ1tGkZO
	Lqo1X3VtExpVhi07p4W+WlDgIhBygjw=
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
Subject: [PATCH net-next v3 2/7] net: axienet: Use ioread32/iowrite32 directly
Date: Mon, 28 Jul 2025 18:18:18 -0400
Message-Id: <20250728221823.11968-3-sean.anderson@linux.dev>
In-Reply-To: <20250728221823.11968-1-sean.anderson@linux.dev>
References: <20250728221823.11968-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_151837_519827_E3C88D46 
X-CRM114-Status: GOOD (  10.12  )
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

In preparation for splitting the MDIO bus into a separate driver,
convert all register reads/writes to use ioread32/iowrite32 directly
instead of using the axienet_ior/iow helpers. While we're at it, clean
up the register calculations a bit.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v3:
- New

 .../net/ethernet/xilinx/xilinx_axienet_mdio.c | 43 +++++++++----------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
index 9ca2643c921e..16f3581390dd 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
@@ -32,7 +32,7 @@ static int axienet_mdio_wait_until_ready(struct axienet_local *lp)
 {
 	u32 val;
 
-	return readx_poll_timeout(axinet_ior_read_mcr, lp,
+	return readx_poll_timeout(ioread32, lp->regs + XAE_MDIO_MCR_OFFSET,
 				  val, val & XAE_MDIO_MCR_READY_MASK,
 				  1, 20000);
 }
@@ -45,8 +45,8 @@ static int axienet_mdio_wait_until_ready(struct axienet_local *lp)
  */
 static void axienet_mdio_mdc_enable(struct axienet_local *lp)
 {
-	axienet_iow(lp, XAE_MDIO_MC_OFFSET,
-		    ((u32)lp->mii_clk_div | XAE_MDIO_MC_MDIOEN_MASK));
+	iowrite32((u32)lp->mii_clk_div | XAE_MDIO_MC_MDIOEN_MASK,
+		  lp->regs + XAE_MDIO_MC_OFFSET);
 }
 
 /**
@@ -59,9 +59,9 @@ static void axienet_mdio_mdc_disable(struct axienet_local *lp)
 {
 	u32 mc_reg;
 
-	mc_reg = axienet_ior(lp, XAE_MDIO_MC_OFFSET);
-	axienet_iow(lp, XAE_MDIO_MC_OFFSET,
-		    (mc_reg & ~XAE_MDIO_MC_MDIOEN_MASK));
+	mc_reg = ioread32(lp->regs + XAE_MDIO_MC_OFFSET);
+	iowrite32(mc_reg & ~XAE_MDIO_MC_MDIOEN_MASK,
+		  lp->regs + XAE_MDIO_MC_OFFSET);
 }
 
 /**
@@ -90,13 +90,11 @@ static int axienet_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 	}
 
-	axienet_iow(lp, XAE_MDIO_MCR_OFFSET,
-		    (((phy_id << XAE_MDIO_MCR_PHYAD_SHIFT) &
-		      XAE_MDIO_MCR_PHYAD_MASK) |
-		     ((reg << XAE_MDIO_MCR_REGAD_SHIFT) &
-		      XAE_MDIO_MCR_REGAD_MASK) |
-		     XAE_MDIO_MCR_INITIATE_MASK |
-		     XAE_MDIO_MCR_OP_READ_MASK));
+	rc = FIELD_PREP(XAE_MDIO_MCR_PHYAD_MASK, phy_id) |
+	     FIELD_PREP(XAE_MDIO_MCR_REGAD_MASK, reg) |
+	     XAE_MDIO_MCR_INITIATE_MASK |
+	     XAE_MDIO_MCR_OP_READ_MASK;
+	iowrite32(rc, lp->regs + XAE_MDIO_MCR_OFFSET);
 
 	ret = axienet_mdio_wait_until_ready(lp);
 	if (ret < 0) {
@@ -104,7 +102,7 @@ static int axienet_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 	}
 
-	rc = axienet_ior(lp, XAE_MDIO_MRD_OFFSET) & 0x0000FFFF;
+	rc = ioread32(lp->regs + XAE_MDIO_MRD_OFFSET) & 0x0000FFFF;
 
 	dev_dbg(lp->dev, "axienet_mdio_read(phy_id=%i, reg=%x) == %x\n",
 		phy_id, reg, rc);
@@ -129,8 +127,9 @@ static int axienet_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 static int axienet_mdio_write(struct mii_bus *bus, int phy_id, int reg,
 			      u16 val)
 {
-	int ret;
 	struct axienet_local *lp = bus->priv;
+	int ret;
+	u32 mcr;
 
 	dev_dbg(lp->dev, "axienet_mdio_write(phy_id=%i, reg=%x, val=%x)\n",
 		phy_id, reg, val);
@@ -143,14 +142,12 @@ static int axienet_mdio_write(struct mii_bus *bus, int phy_id, int reg,
 		return ret;
 	}
 
-	axienet_iow(lp, XAE_MDIO_MWD_OFFSET, (u32)val);
-	axienet_iow(lp, XAE_MDIO_MCR_OFFSET,
-		    (((phy_id << XAE_MDIO_MCR_PHYAD_SHIFT) &
-		      XAE_MDIO_MCR_PHYAD_MASK) |
-		     ((reg << XAE_MDIO_MCR_REGAD_SHIFT) &
-		      XAE_MDIO_MCR_REGAD_MASK) |
-		     XAE_MDIO_MCR_INITIATE_MASK |
-		     XAE_MDIO_MCR_OP_WRITE_MASK));
+	iowrite32(val, lp->regs + XAE_MDIO_MWD_OFFSET);
+	mcr = FIELD_PREP(XAE_MDIO_MCR_PHYAD_MASK, phy_id) |
+	      FIELD_PREP(XAE_MDIO_MCR_REGAD_MASK, reg) |
+	      XAE_MDIO_MCR_INITIATE_MASK |
+	      XAE_MDIO_MCR_OP_WRITE_MASK;
+	iowrite32(mcr, lp->regs + XAE_MDIO_MCR_OFFSET);
 
 	ret = axienet_mdio_wait_until_ready(lp);
 	if (ret < 0) {
-- 
2.35.1.1320.gc452695387.dirty


