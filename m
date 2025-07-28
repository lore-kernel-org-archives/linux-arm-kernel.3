Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F4EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 22:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Di1cyw3vFeHymmCdFM7oOslo1PcW+F7Rf0w8IzgGW8=; b=F2GTXWDmeCYN34cW/eCxW/ZDu3
	dJfSfnnzqp4IDax94g7/BdrHeWbPVa1BnWQqMnyJyiguL8ORyCC89NNy0zjXncgYLWeIb/3onK7oe
	dBtdl6ChUKGt5dW9+rhuVp1/4Rz/ifq66/bf1pZHHVDOfK7iOXujym7FxbEBlSEV6zqtJazQhedrZ
	UZnoxDOlBGQmcf3StUjkAfUbvEYKpw3mINQjNwvIw33nPKe/FcjJjcx5IbNA2a63gghCaWkj8gKU4
	24PbmxwURO51jilKiGHhpwqx4W+JDak/r0xbN2iGPtHa53tqHB2eyqjJzZA7X7bb0jyEKHudw/qTR
	42dggpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWKl-0000000FWsG-0hAB;
	Mon, 28 Jul 2025 22:28:39 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWB7-0000000FVq8-20Ci
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 22:18:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753741119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Di1cyw3vFeHymmCdFM7oOslo1PcW+F7Rf0w8IzgGW8=;
	b=JVGSeMEoXYCLwM/PnBAUMf4YVK5EEjqIUhOBiZuCM3Bcf24r39TLSDmI5zMR54RsALG0ZX
	iOneZpgb/8VWYVXnHlFYF3iGjCuwVKtrNWEOxcS/sMZtz6Eec4ds7Id6B2yyc4TN3n1ExL
	dz429R5R/NSAifUUikaf48uvFulpmok=
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
Subject: [PATCH net-next v3 4/7] net: axienet: Simplify axienet_mdio_setup
Date: Mon, 28 Jul 2025 18:18:20 -0400
Message-Id: <20250728221823.11968-5-sean.anderson@linux.dev>
In-Reply-To: <20250728221823.11968-1-sean.anderson@linux.dev>
References: <20250728221823.11968-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_151841_667357_2F589F01 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

We always put the mdio_node and disable the bus after probing, so
perform these steps unconditionally.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
index cacd5590731d..2799d168ed9d 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
@@ -302,19 +302,14 @@ int axienet_mdio_setup(struct axienet_local *lp)
 	ret = axienet_mdio_enable(bus, mdio_node);
 	if (ret < 0)
 		goto unregister;
+
 	ret = of_mdiobus_register(bus, mdio_node);
-	if (ret)
-		goto unregister_mdio_enabled;
 	of_node_put(mdio_node);
 	axienet_mdio_mdc_disable(lp);
-	return 0;
-
-unregister_mdio_enabled:
-	axienet_mdio_mdc_disable(lp);
-unregister:
-	of_node_put(mdio_node);
-	mdiobus_free(bus);
-	lp->mii_bus = NULL;
+	if (ret) {
+		mdiobus_free(bus);
+		lp->mii_bus = NULL;
+	}
 	return ret;
 }
 
-- 
2.35.1.1320.gc452695387.dirty


