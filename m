Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DFEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w5qzGqYNtcXVKnkJY6yYk6vm8l8FZO+5k1KrJz2DeFQ=; b=gpjvRfpOzKtvV1BicmO6QcrKYD
	DRmvJGLweaaH9Lf5LbCy39eXyNNUXzAmu54jbDpmAKv6DC8xMjNV13dqMWNCfBezARDWrE29kFfoQ
	13joJGcSSLtLuNM6NSwD61SIVacosVU8uVShf3h5vLRnMmGaPqL1Vw0oRKaL4oKRvQKQ+iLs/V6Cl
	8b6O8m+VD78baeg7Ybgt6n5lf9Gl8EeMEqWYhBfiny4datdOyALozsOlGgNKJNU8dUTEndxSomO8d
	iUaaBi28n1DvSy1NF4sdwyc22dZSN/qOE/lxENsXRIhYP0jfUmuCvU+eBIIGYdGLCGx195BpZS4Fo
	2pfNnY6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2Hz-0000000Dqc5-0IGi;
	Fri, 14 Mar 2025 10:29:15 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2GI-0000000DqLw-2XoP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:27:32 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52EAROek1654743
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 05:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741948045;
	bh=w5qzGqYNtcXVKnkJY6yYk6vm8l8FZO+5k1KrJz2DeFQ=;
	h=From:To:CC:Subject:Date;
	b=skypVqA9Lnak3jdekm/tYR026cOAKKMklxqsQO2Jyv/aQOmizSmFIjWsAJ5XfHvYV
	 qE3RpsNe7Fio+1DeV3cmUji9lbDMr+TGDI34hgwKae34pGS2juB/MLtQvhEzIvlgN2
	 f7GtZHlO18seGqlhhewsXkUkzTviGFkWrrhOzuKM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52EARONO116857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Mar 2025 05:27:24 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Mar 2025 05:27:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Mar 2025 05:27:24 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52EAROxS081406;
	Fri, 14 Mar 2025 05:27:24 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 52EARN2R024336;
	Fri, 14 Mar 2025 05:27:24 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: Sai Krishna <saikrishnag@marvell.com>, Meghana Malladi <m-malladi@ti.com>,
        Diogo Ivo <diogo.ivo@siemens.com>, Paolo Abeni <pabeni@redhat.com>,
        Jakub
 Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
        "David S.
 Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net] net: ti: icssg-prueth: Add lock to stats
Date: Fri, 14 Mar 2025 15:57:21 +0530
Message-ID: <20250314102721.1394366-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_032730_742100_812D4237 
X-CRM114-Status: GOOD (  15.68  )
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

Currently the API emac_update_hardware_stats() reads different ICSSG
stats without any lock protection.

This API gets called by .ndo_get_stats64() which is only under RCU
protection and nothing else. Add lock to this API so that the reading of
statistics happens during lock.

Fixes: c1e10d5dc7a1 ("net: ti: icssg-prueth: Add ICSSG Stats")
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
NOTE: This was suggested by Jakub Kicinski <kuba@kernel.org> [1] to get
this as bug fix in net during upstreaming of FW Stats for ICSSG driver
This patch doesn't depend on [1] and can be applied cleanly on net/main

[1] https://lore.kernel.org/all/20250306165513.541ff46e@kernel.org/

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 1 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.h | 2 ++
 drivers/net/ethernet/ti/icssg/icssg_stats.c  | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 00ed97860547..9a75733e3f8f 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1679,6 +1679,7 @@ static int prueth_probe(struct platform_device *pdev)
 	}
 
 	spin_lock_init(&prueth->vtbl_lock);
+	spin_lock_init(&prueth->stats_lock);
 	/* setup netdev interfaces */
 	if (eth0_node) {
 		ret = prueth_netdev_init(prueth, eth0_node);
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index 329b46e9ee53..f41786b05741 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -305,6 +305,8 @@ struct prueth {
 	int default_vlan;
 	/** @vtbl_lock: Lock for vtbl in shared memory */
 	spinlock_t vtbl_lock;
+	/** @stats_lock: Lock for reading icssg stats */
+	spinlock_t stats_lock;
 };
 
 struct emac_tx_ts_response {
diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.c b/drivers/net/ethernet/ti/icssg/icssg_stats.c
index 8800bd3a8d07..6f0edae38ea2 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_stats.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_stats.c
@@ -26,6 +26,8 @@ void emac_update_hardware_stats(struct prueth_emac *emac)
 	u32 val, reg;
 	int i;
 
+	spin_lock(&prueth->stats_lock);
+
 	for (i = 0; i < ARRAY_SIZE(icssg_all_miig_stats); i++) {
 		regmap_read(prueth->miig_rt,
 			    base + icssg_all_miig_stats[i].offset,
@@ -51,6 +53,8 @@ void emac_update_hardware_stats(struct prueth_emac *emac)
 			emac->pa_stats[i] += val;
 		}
 	}
+
+	spin_unlock(&prueth->stats_lock);
 }
 
 void icssg_stats_work_handler(struct work_struct *work)

base-commit: 4003c9e78778e93188a09d6043a74f7154449d43
-- 
2.34.1


