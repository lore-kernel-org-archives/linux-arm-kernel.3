Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CD1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PgHY7KIZFZ8t2DI4sOYMaRrOgbk3f1xCaugWWVlTH9w=; b=N0Y/nJ43/ots3nzl0eX54iu2G3
	ALb+CeDgv4Za921HegOWNvuNY/3bNVrmYhrBG4tSmcfs9Ry3og0II8tlIUTkzYN4feMHSBQhq1gZB
	SwSAXvYFMKgUlum6dQxcY2Xe8qFxCbn+iNLXWCfvbNX8YFAdsUXClW5K8haL/51F2Y+jxbYDvog9j
	ZXfY570qoNBux+w+fx8TmtztjXzn9UFfO0xyn17xe2qUeBDKkwB8Oo+26LjhMsvObM4UAtmNzyC0k
	q3ICGIJa/IWe7gXOxKNc+eXa9iNxTF1qzuOiPBA1vJn94M+w0JTuqtrFkVxNbv+o+Qxkq/GZiOWjf
	2pP9NyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoxA-00000005yCe-38Gf;
	Fri, 01 Aug 2025 12:33:40 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhojw-00000005o6z-1vTT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:20:01 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571CJqg83727254;
	Fri, 1 Aug 2025 07:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754050793;
	bh=PgHY7KIZFZ8t2DI4sOYMaRrOgbk3f1xCaugWWVlTH9w=;
	h=From:To:CC:Subject:Date;
	b=REiPAhwZVjGAKHweiYdMd99mLDJ/RwRnRvUk5V67EBBDYpIiR8uKkOz+Y1K/dJlWm
	 9bMn9PA+pV64TLBB8RVyfG3ReeYN5w/I0mp+i/Nmm5IyDfFccm1HHEWNqlXsPQapCa
	 v01q0Sd0flg1BdJ8BJbFryHFv9Gi7FCB8/28Kpto=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571CJqRp4083325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 07:19:52 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 07:19:52 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 07:19:52 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571CJqKV251872;
	Fri, 1 Aug 2025 07:19:52 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 571CJooZ009995;
	Fri, 1 Aug 2025 07:19:51 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Meghana Malladi
	<m-malladi@ti.com>,
        Himanshu Mittal <h-mittal1@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v2] net: ti: icssg-prueth: Fix emac link speed handling
Date: Fri, 1 Aug 2025 17:49:48 +0530
Message-ID: <20250801121948.1492261-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_052000_603472_8720A6BA 
X-CRM114-Status: GOOD (  13.40  )
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

When link settings are changed emac->speed is populated by
emac_adjust_link(). The link speed and other settings are then written into
the DRAM. However if both ports are brought down after this and brought up
again or if the operating mode is changed and a firmware reload is needed,
the DRAM is cleared by icssg_config(). As a result the link settings are
lost.

Fix this by calling emac_adjust_link() after icssg_config(). This re
populates the settings in the DRAM after a new firmware load.

Fixes: 9facce84f406 ("net: ti: icssg-prueth: Fix firmware load sequence.")
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
v1 - v2: Added phydev lock before calling emac_adjust_link() as suggested
by Andrew Lunn <andrew@lunn.ch>
v1 https://lore.kernel.org/all/20250731120812.1606839-1-danishanwar@ti.com/

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 2b973d6e2341..58aec94b7771 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -50,6 +50,8 @@
 /* CTRLMMR_ICSSG_RGMII_CTRL register bits */
 #define ICSSG_CTRL_RGMII_ID_MODE                BIT(24)
 
+static void emac_adjust_link(struct net_device *ndev);
+
 static int emac_get_tx_ts(struct prueth_emac *emac,
 			  struct emac_tx_ts_response *rsp)
 {
@@ -229,6 +231,12 @@ static int prueth_emac_common_start(struct prueth *prueth)
 		ret = icssg_config(prueth, emac, slice);
 		if (ret)
 			goto disable_class;
+
+		if (emac->ndev->phydev) {
+			mutex_lock(&emac->ndev->phydev->lock);
+			emac_adjust_link(emac->ndev);
+			mutex_unlock(&emac->ndev->phydev->lock);
+		}
 	}
 
 	ret = prueth_emac_start(prueth);

base-commit: 01051012887329ea78eaca19b1d2eac4c9f601b5
-- 
2.34.1


