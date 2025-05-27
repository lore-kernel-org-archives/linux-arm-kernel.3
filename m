Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87479C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 12:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RwoB/vlUsHP1ZLM3IDcLtLPVLnnKHq3/34iyg4x96t0=; b=Xi//VeMU3RSmzmDmjOiNg2ItGA
	4gt6j661DykGnc/0Gp7ibRRyqxoaZb7eEPG66nQH/7TBu5riYG1jUw0v6TdpXQa9mPUHWBIDuVPlf
	GmzJU1kp6TSBn+CnZ0+H8XSMjTcIrCzDXzpme/wyWL54/WbSauz6giy8JJDAnuGj+3LJL/Fp6ShuN
	ZvL3ZL5rBHzy8kas06SKRGCw9pBXNakMpacsk8XMjkLbz8Ph/aP8/uVkkoBp/A+sNLHcZl7vOw0M3
	eGIsTp5g8KUb5IXKYSjoPUY98AFZQNW3tTPYB+QI9t0if4/iFOLsTDrBVAw02OAnxz7WaXKryHZHN
	YV0pnU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtDm-0000000AglL-2DJR;
	Tue, 27 May 2025 12:15:54 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtBd-0000000AgOR-2UAQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 12:13:42 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54RCDVTr1817415;
	Tue, 27 May 2025 07:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748348011;
	bh=RwoB/vlUsHP1ZLM3IDcLtLPVLnnKHq3/34iyg4x96t0=;
	h=From:To:CC:Subject:Date;
	b=xobZlwPXiyqJzvN0BooFv9JGwCl9JkSKVob0a0KopxHTELra3rC+b4klVKkUyOVHG
	 GVmBA7hLyBzQ1WNU82DKk92b23uHU8P+6jIGh3H6EgM5AIr2pIhnNO9Pa37cluywc2
	 EUGqkjqWVmqfNZLrTfz+Suw79QFfcQdj9JiJayT0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54RCDUjm2853093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 27 May 2025 07:13:30 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 May 2025 07:13:30 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 May 2025 07:13:30 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54RCDUtW046812;
	Tue, 27 May 2025 07:13:30 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 54RCDSsB020084;
	Tue, 27 May 2025 07:13:29 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <m-malladi@ti.com>, <saikrishnag@marvell.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net] net: ti: icssg-prueth: Fix swapped TX stats for MII interfaces.
Date: Tue, 27 May 2025 17:43:25 +0530
Message-ID: <20250527121325.479334-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_051341_719330_E8A777DC 
X-CRM114-Status: GOOD (  11.97  )
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

In MII mode, Tx lines are swapped for port0 and port1, which means
Tx port0 receives data from PRU1 and the Tx port1 receives data from
PRU0. This is an expected hardware behavior and reading the Tx stats
needs to be handled accordingly in the driver. Update the driver to
read Tx stats from the PRU1 for port0 and PRU0 for port1.

Fixes: c1e10d5dc7a1 ("net: ti: icssg-prueth: Add ICSSG Stats")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_stats.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.c b/drivers/net/ethernet/ti/icssg/icssg_stats.c
index 6f0edae38ea2..0b77930b2f08 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_stats.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_stats.c
@@ -29,6 +29,10 @@ void emac_update_hardware_stats(struct prueth_emac *emac)
 	spin_lock(&prueth->stats_lock);
 
 	for (i = 0; i < ARRAY_SIZE(icssg_all_miig_stats); i++) {
+		if (emac->phy_if == PHY_INTERFACE_MODE_MII &&
+		    icssg_all_miig_stats[i].offset >= ICSSG_TX_PACKET_OFFSET &&
+		    icssg_all_miig_stats[i].offset <= ICSSG_TX_BYTE_OFFSET)
+			base = stats_base[slice ^ 1];
 		regmap_read(prueth->miig_rt,
 			    base + icssg_all_miig_stats[i].offset,
 			    &val);

base-commit: 32374234ab0101881e7d0c6a8ef7ebce566c46c9
-- 
2.43.0


