Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D7FCE8E69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aMLsOpWO/pYNkEAk0fPsDrgjjgnzlpp9C0m/g9waCuE=; b=L3YzHx33tROyawvf9zU+WBkdCv
	LldGFTBauX3cPaIWX1KMhMBQDM8M27Ri3XVEf3SDwnOrvffxULwazNH/6uDy6Lp2C4dcyT8WfenzI
	RdwpRnyqWrYTQA37IP7avTGKRxOGOR+kElZdbkVGMxOvBwQAqdL29U7EnGzBgOm1KwqhYVu9NZJHR
	a+jCi/SBono+vsKP7sZ1mGnUXtdcz/7nyXa9eQJdSA2SiLf5suAqoRkrBzZ0kE12V8u0eeCpE9kX5
	2XwgvgogCfWiMSr5mNsopbAwifbZLryHp5HjMg6aFLJ+3g43ll4RVgdpf0vFBULQkmVJIL+XBY4fi
	0FNDA8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wNt-00000000Fuz-1kT3;
	Thu, 24 Oct 2024 11:52:09 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3w4m-00000000DYn-1nfJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:32:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49OBW7LM116527;
	Thu, 24 Oct 2024 06:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729769527;
	bh=aMLsOpWO/pYNkEAk0fPsDrgjjgnzlpp9C0m/g9waCuE=;
	h=From:To:CC:Subject:Date;
	b=ZJU367tW0yBQ3ojql4Noam33G+/lcMIbRFioV8ISAsq7Qyhevfv+jXYdJdeuaLAPT
	 zsKrqv+vu71oIZZ7yY6wQ9334E/oQvfXWUEWNY3S/vYl+RDkjPxsoUiEDGasf/8U0v
	 titvqwvfkkNXg2uFGZA4bsR972oHBmfKyN//043Y=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49OBW7Bt026893
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Oct 2024 06:32:07 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 06:32:07 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 06:32:06 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49OBW61O044845;
	Thu, 24 Oct 2024 06:32:06 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 49OBW5Ug002932;
	Thu, 24 Oct 2024 06:32:05 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <vigneshr@ti.com>, <horms@kernel.org>, <m-malladi@ti.com>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <vadim.fedorenko@linux.dev>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v2] net: ti: icssg-prueth: Fix 1 PPS sync
Date: Thu, 24 Oct 2024 17:01:40 +0530
Message-ID: <20241024113140.973928-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_043224_651829_107808A2 
X-CRM114-Status: GOOD (  12.47  )
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

Hello,

This patch is based on net-next tagged next-20241023.
v1:https://lore.kernel.org/all/20241023091213.593351-1-m-malladi@ti.com/
Changes since v1 (v2-v1):
- Use roundup() instead of open coding as suggested by Vadim Fedorenko

Regards,
Meghana.

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 12 ++++++++++--
 drivers/net/ethernet/ti/icssg/icssg_prueth.h | 11 +++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 0556910938fa..6876e8181066 100644
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
+	start_offset = roundup(current_cycle, MSEC_PER_SEC);
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


