Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7F4D2E031
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LKQibn8A/Kbr7PK5vWjRMEeinVr3jKgKgEFBSe99U/8=; b=nRqnjSMeau/T2jkYCk78Xmpt2i
	VjdIXTdp2TlXXO22Knh2458nk81P0TkFrQeFjbXsqaKMyNzJ289bxhNK4hgljfY2M81ND9p5xuJt3
	hBrhEnttWN6gk6nvPX33aUGVieXvwEz6nto+4/KHvl95dO2zVODMQ003efpKJACOVG6yzrhcFXA/e
	VD7xEXbqt2+HICg+O24YhRBHD1MJXP9MmV66zG/0Zn4d0LUidaFBAoRImO37JFoc/YCmLBUO68K+n
	T0pf++UAhiSL/i2zAvkFOxcqAY05hN1cNEYdb2MGxbQzsZz1b7e9T7G9p8PrEEMslU3kSPCy5O/9D
	exfDXtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xn5-0000000DpEL-2sTb;
	Wed, 23 Oct 2024 09:36:31 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XPp-0000000DjYW-0kbm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:12:30 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49N9CL0M097005;
	Wed, 23 Oct 2024 04:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729674741;
	bh=LKQibn8A/Kbr7PK5vWjRMEeinVr3jKgKgEFBSe99U/8=;
	h=From:To:CC:Subject:Date;
	b=P/rkZNKtba6Kr6JVbLHB8vubv9MD8ilKaV5PGgeeDo+/hE5qbrXvHFaDobg2d1LaT
	 ege7xG3O3ILieCIoW90lpvuKTbgBCMlkHfoe16lEN44SCaTFDUJxPJsETe9NDj3+ys
	 8ENAJjapQ0nil3bvYecPv/zA84q/wrPCuDEBZs2I=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49N9CLD8114316;
	Wed, 23 Oct 2024 04:12:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 04:12:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 04:12:20 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49N9CKJq045456;
	Wed, 23 Oct 2024 04:12:20 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 49N9CJ0d004526;
	Wed, 23 Oct 2024 04:12:20 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <vigneshr@ti.com>, <horms@kernel.org>, <m-malladi@ti.com>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net] net: ti: iccsg-prueth: Fix 1 PPS sync
Date: Wed, 23 Oct 2024 14:42:13 +0530
Message-ID: <20241023091213.593351-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_021229_341856_E0D632F2 
X-CRM114-Status: GOOD (  12.30  )
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

The first PPS latch time needs to be calculated by the driver
(in rounded off seconds) and configured as the start time
offset for the cycle. After synchronizing two PTP clocks
running as master/slave, missing this would cause master
and slave to start immediately with some milliseconds
drift which causes the PPS signal to never synchronize with
the PTP master.

Fixes: 186734c15886 ("net: ti: icssg-prueth: add packet timestamping and ptp support")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 12 ++++++++++--
 drivers/net/ethernet/ti/icssg/icssg_prueth.h | 11 +++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 0556910938fa..6b2cd7c898d0 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -411,6 +411,8 @@ static int prueth_perout_enable(void *clockops_data,
 	struct prueth_emac *emac = clockops_data;
 	u32 reduction_factor = 0, offset = 0;
 	struct timespec64 ts;
+	u64 current_cycle;
+	u64 start_offset;
 	u64 ns_period;
 
 	if (!on)
@@ -449,8 +451,14 @@ static int prueth_perout_enable(void *clockops_data,
 	writel(reduction_factor, emac->prueth->shram.va +
 		TIMESYNC_FW_WC_SYNCOUT_REDUCTION_FACTOR_OFFSET);
 
-	writel(0, emac->prueth->shram.va +
-		TIMESYNC_FW_WC_SYNCOUT_START_TIME_CYCLECOUNT_OFFSET);
+	current_cycle = icssg_readq(emac->prueth->shram.va +
+				    TIMESYNC_FW_WC_CYCLECOUNT_OFFSET);
+
+	/* Rounding of current_cycle count to next second */
+	start_offset = ((current_cycle / MSEC_PER_SEC) + 1) * MSEC_PER_SEC;
+
+	icssg_writeq(start_offset, emac->prueth->shram.va +
+		     TIMESYNC_FW_WC_SYNCOUT_START_TIME_CYCLECOUNT_OFFSET);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index 8722bb4a268a..a4af2dbcca31 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -330,6 +330,17 @@ static inline int prueth_emac_slice(struct prueth_emac *emac)
 extern const struct ethtool_ops icssg_ethtool_ops;
 extern const struct dev_pm_ops prueth_dev_pm_ops;
 
+static inline u64 icssg_readq(const void __iomem *addr)
+{
+	return readl(addr) + ((u64)readl(addr + 4) << 32);
+}
+
+static inline void icssg_writeq(u64 val, void __iomem *addr)
+{
+	writel(lower_32_bits(val), addr);
+	writel(upper_32_bits(val), addr + 4);
+}
+
 /* Classifier helpers */
 void icssg_class_set_mac_addr(struct regmap *miig_rt, int slice, u8 *mac);
 void icssg_class_set_host_mac_addr(struct regmap *miig_rt, const u8 *mac);

base-commit: 73840ca5ef361f143b89edd5368a1aa8c2979241
-- 
2.25.1


