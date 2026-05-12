Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F4FCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8Cdh62XnSNYe/v034X8EwhHXD47DBfQv0nZEjZFl/0=; b=1opklOnBa7600yzXz2iktvk9n9
	j/25gJfqVGwyKc29oxqqIw6MhOtYryJQd6voD0ELryqu44YR0TKx1IkAJrnb6E81xjDMlGUIkY7U5
	OjvklkJVICU2RC6TIjW86vivc4fdGEffKQ+XBiWogptLk4NbgZqdDkJmWp/08bvR1S8s4bpaiu3h1
	blpcgsv0jd3IsWI2exfCUSsx4p5gp0VUPr3EvLGz/ZDfNbtVCk9LG/7Wk27Z9cPcNCqB0nCjx7knv
	CpagK6+R+jABRnscbo9t4iOwSrwZCI9hvuBXBKeLyPsvF9zPB+Bf9PoDL+HzrPKbv5/+z40tjXSbg
	HScciwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZT-0000000HULX-1Jej;
	Tue, 12 May 2026 17:07:03 +0000
Received: from mail-westcentralusazon11013059.outbound.protection.outlook.com ([40.93.201.59] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZD-0000000HTxR-1T4t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:06:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hum4rDECzP+MPQFKkugGU3aaHvDncaUqzjoqJNtOQWx37kNAUg12tt+GXo5wSqYW/sGyObP5pLo0wF6dinS8ttnv6pPQSJcpuWEDs4qjRtV5ILiVLmXDoefC1HTp3OM7wTADihOJmBOYMKxHMvxQ5gX098jQBiLzIVce5jYQ+R93wplMtRKiGNrphloJqCCi/D/iJ4nnVvyeQm1qCtF4ft7B+5gKVZgZD5GEGZigywW6k3FYkA+DlhxTzf+Wkk/yp1QY9uC6RxLR/BT0uV+f5Tl1flKJYMTw4WGjBxp7+Fk/4g0Q2kRmcREy3ggVBwNC8tYAc1Odm1M70kq1y2zDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8Cdh62XnSNYe/v034X8EwhHXD47DBfQv0nZEjZFl/0=;
 b=HX3IWeTwMBfo2yXbtBC/ttmqUMpnaUjxHbSXtSNMouBzS/dXiRCKve5JDOwB12BeL9kVlOIsCwDAqfbwTFAXHGk3Q1aVmIQMi4dIG7MqfRcmxd35ueIc5v4RnkubEOTer7TJ5JEW9BhBsn4rjzc7irP+WZX95OVCUZ4nd/peev/UcnRQBXmu60pLmyepG1A/AQRCEiUwRXdqpAcj2J5jS6KTGMwDYlXWEKAB3WCC21hH+m4y+bjNTvFi2AhH20QxWE2jURxUKpDQQKvD0WBGxy//srE5Zf8i2+fnDmgYk15kQsDZ9DMGC0t1ACVZNDMo+/JOa+FIK/KCjqeFO4V7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8Cdh62XnSNYe/v034X8EwhHXD47DBfQv0nZEjZFl/0=;
 b=mThZOG762vN3L7YdnRx6JWGcTPfEBCN5OhcAw46Wd+by0fktMPbbYYtXLkhXa2wdQTLPS8D3CAg2Vn4oCWUGj8JOGkuLMIfbKPF3t9t3QBVLNhuEkZYfB0LjkrFNtB9dhhwINawRLjnFcIYzHcyRFOfA++vz5Kvh/ewkZvOT1Kk=
Received: from DM6PR11CA0011.namprd11.prod.outlook.com (2603:10b6:5:190::24)
 by DM4PR10MB6816.namprd10.prod.outlook.com (2603:10b6:8:108::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 17:06:34 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::f5) by DM6PR11CA0011.outlook.office365.com
 (2603:10b6:5:190::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Tue,
 12 May 2026 17:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:06:33 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:26 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6P7Q2235150;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 10/11] soc: ti: knav_dma: Use IOMEM_ERR_PTR() in pktdma_get_regs()
Date: Tue, 12 May 2026 12:06:22 -0500
Message-ID: <20260512170623.3174416-11-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
References: <20260512170623.3174416-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|DM4PR10MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f0e7dc-e582-4111-6f24-08deb048d1ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: eGctHrYGMcFFIW5YQWMBrSj4CTfWwGzvBpKRFR7yuYbZElX9wyrjpnQKwEEshAOApjrmm35kS2bEP+63FXj+vXUuzMo2pDFKDJy/gR9qrVslZCsBV5SmkhkA2zST9gNY9O2THln5PEHA8vFFdnJvU7maMYFvcDlGUF3/30vB2gqaXZCGXlGmR61RV7hBIO4ghX0kM7SfxfU64aWwsGWV8cLl4JtHLVC1wp4m8h01zNnGkr1sMnbJ7tiWRGwdMoyf4hLCOo9AhPgkwfI4QQkJmEoJi55Kl6vnvQUZISv2s8izfjbO2J83Una7m6sv/MfMYeAxfR51I+CINmGho3nzI42e9ri+q3u4c9YrIvcNBl0ZJOuXwkjq4jFo0jf0iTp8J2Mq4sEJ4QAVIeSrXJv8lF7/MUkXFcLDcdhaiAw/uNL09WqlujYyzK5rhv0+TUTGzX0gwUrSvFut9Ph2AWzUYOMeNt16gvKIBwoPhomeM9JHFAeZ2fHQg7P+ceXeOL0Gqn/1SyyhMdW8v6Fsbcj2L+g4DGgAj++ZW98AFtMKPypsS5uN5jfUHM6vvvtlnzkm+9S6E0b61obFIodnLEi8Az7efONK0/kpBxObUERpezLP8AUIM7ki/hY0exc5OBkpGrjVGrKvgsUj6FwRs6Pmz/g3rojJ3XjlppePbwqvODdg2k4lpjxGrIbJXkcYuAmNiJeyxq3j3bBjDGbxVtfLhAL6zWIYtiHPmNM6dvyQOg8=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JGwAeYhXiP2MQ9pe78ac0Ezleu2GsuyKhVi9dGLfMU+q70+vhCTXPQ1vkvkMeSddlnbw38UOkr5H1nlijVTp8GSk+BBeJEFFt5+pb0i3IcgZrpFugbPAQWWtuz7oBhzhLt7epYW0RzCI3abgmwohM3gM6Gv8JiJDdLUKhj1DcnMZ53Je6bwKU7vU2ZqWGjA3foOkIbJRSHYzpzInOBx08T539gQkg0VVLdiXYMX6QukPfLQZU6Q5oObgCX3SGwBXq0D9v2PiG0nZ5vfnVAIA5GXBqyojJuaTECXWyXchDa7VBYEnDjsxhUnmaixTxfaw1SZRKrZKKXM90FGrS+mB9yjOsGedFi8CjaRWF3IodCA14aS1BFUwxRwVtVzd5nNns3sDFP1G2w17yLN0LQsGj2d/VrKX4oFEgGgNVuOKuvrn3BMu46b/NUI2WWcMrEAV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:33.4249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f0e7dc-e582-4111-6f24-08deb048d1ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100647_404784_249D4AC3 
X-CRM114-Status: GOOD (  11.40  )
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

pktdma_get_regs() returns a void __iomem * but uses ERR_PTR() on the
error path, causing sparse to warn about an address space mismatch.
Replace ERR_PTR() with IOMEM_ERR_PTR() to resolve the warning cleanly.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- None.

V1: https://lore.kernel.org/all/20260508153211.3688277-11-nm@ti.com/

 drivers/soc/ti/knav_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index 7ba6fd58e9ce..96df3982e47b 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -520,7 +520,7 @@ static void __iomem *pktdma_get_regs(struct knav_dma_device *dma,
 	if (ret) {
 		dev_err(dev, "Can't translate of node(%pOFn) address for index(%d)\n",
 			node, index);
-		return ERR_PTR(ret);
+		return IOMEM_ERR_PTR(ret);
 	}
 
 	regs = devm_ioremap_resource(kdev->dev, &res);
-- 
2.47.0


