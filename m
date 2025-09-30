Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05D2CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCj2gPL/swTE60NPVfYd6g82kNj4wFVRba4BUIVTON0=; b=4PwuXoC5hjH691LDWrHhr8C8uo
	I0KcKm4GWa9y4eblJ3JLdn5Nash3jDZ2s2/3qsEix4VuKc1RQce9uJCb3Ot4F22ZZAfISKUev7FgU
	EN3SJqkLy/G95SKERsv+dKtXlmyHcfL8VDx34a7pd4d5Z4PShopkvS1yrUo4w/I9GY9dlcS2aGLwD
	+BnHCfTIDS1kjoa5v0BFEUD3JDSP+foE1mWKNB5FBNSxOBtvOJX94Z2z/NiwxjYQoEEYnf9rkaDxn
	68/3VLW38R2amKksBSLw2p4MTq5nAh+RipdamHXElH5LDYgXfAYdwoady/2YndI2DqrZluWTT9dU9
	h2oBq6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZHn-00000005ELh-1CkS;
	Tue, 30 Sep 2025 12:16:51 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZHZ-00000005EGE-3CLD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:16:39 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58UCGMs62452081;
	Tue, 30 Sep 2025 07:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759234582;
	bh=RCj2gPL/swTE60NPVfYd6g82kNj4wFVRba4BUIVTON0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c8U+bAFFpNz7moJoS0kpYLakFQPAcDLbHGgDcV/FqRx65kKNJBLBCk0gX2Or5NoZb
	 p7/rzsx19crhZRSQXUV3aXq4nv7SfZXe4adqxPJaReQnkdCL5+YqEVhtal8OX2jv2V
	 VeJ6WAv0QvekZ1emNxpl11RAYyf5PT4PS+np3TFM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58UCGMbb2677457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 30 Sep 2025 07:16:22 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 30
 Sep 2025 07:16:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 07:16:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58UCGLDE2892164;
	Tue, 30 Sep 2025 07:16:21 -0500
From: Nishanth Menon <nm@ti.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Paolo
 Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet
	<edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Simon Horman <horms@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, Nishanth Menon <nm@ti.com>
Subject: [PATCH V2 3/3] net: ethernet: ti: Remove IS_ERR_OR_NULL checks for knav_dma_open_channel
Date: Tue, 30 Sep 2025 07:16:09 -0500
Message-ID: <20250930121609.158419-4-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250930121609.158419-1-nm@ti.com>
References: <20250930121609.158419-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_051637_884418_A0EF8C20 
X-CRM114-Status: GOOD (  12.23  )
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

knav_dma_open_channel now only returns NULL on failure instead of error
pointers. Replace IS_ERR_OR_NULL checks with simple NULL checks.

Suggested-by: Simon Horman <horms@kernel.org>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes in V2:
* renewed version
* Dropped the fixes since code refactoring was involved.

V1: https://lore.kernel.org/all/20250926150853.2907028-1-nm@ti.com/

 drivers/net/ethernet/ti/netcp_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index 2f9d26c791e3..5ee13db568f0 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -1338,7 +1338,7 @@ int netcp_txpipe_open(struct netcp_tx_pipe *tx_pipe)
 
 	tx_pipe->dma_channel = knav_dma_open_channel(dev,
 				tx_pipe->dma_chan_name, &config);
-	if (IS_ERR_OR_NULL(tx_pipe->dma_channel)) {
+	if (!tx_pipe->dma_channel) {
 		dev_err(dev, "failed opening tx chan(%s)\n",
 			tx_pipe->dma_chan_name);
 		ret = -EINVAL;
@@ -1359,7 +1359,7 @@ int netcp_txpipe_open(struct netcp_tx_pipe *tx_pipe)
 	return 0;
 
 err:
-	if (!IS_ERR_OR_NULL(tx_pipe->dma_channel))
+	if (tx_pipe->dma_channel)
 		knav_dma_close_channel(tx_pipe->dma_channel);
 	tx_pipe->dma_channel = NULL;
 	return ret;
@@ -1678,7 +1678,7 @@ static int netcp_setup_navigator_resources(struct net_device *ndev)
 
 	netcp->rx_channel = knav_dma_open_channel(netcp->netcp_device->device,
 					netcp->dma_chan_name, &config);
-	if (IS_ERR_OR_NULL(netcp->rx_channel)) {
+	if (!netcp->rx_channel) {
 		dev_err(netcp->ndev_dev, "failed opening rx chan(%s\n",
 			netcp->dma_chan_name);
 		ret = -EINVAL;
-- 
2.47.0


