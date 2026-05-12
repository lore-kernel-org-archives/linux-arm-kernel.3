Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674CFCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HajtVZmufe7MQp79ognmKMOCshMYmO3e6UNVc2nbHBE=; b=DaUiZphjYw3ta4xK9oHaAd/Ayk
	haUAqz2oefuE+BTauZhaggkXuWcmUn/d2T9Pig56ttmQ5M3aTXBMQyVFsvBgvEy5wXKmi+nIhhCfa
	z4QiAP4FZDPTml/xRBtfmnm8+BfEyx48bjEDcmyiYP3ruBTL94tyIl+jouG+IPGDff9JAlMbEG2JV
	TWuvK3xLxYfxe7dBOuXdIUVvkXfSF+NQVIogOQ4ZRkgfM20VmYkcI5HoY+ESUI163DugyRow1oVpm
	ab7gHgjzg9TkeqdLteVL+TsS2Gcd2RObM+Yia/iH+auh4MPCps/NUYtN7JYOfKXAg7oZ0zmpEoOwW
	Zy/xpuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZP-0000000HUGA-06TE;
	Tue, 12 May 2026 17:06:59 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZB-0000000HU1g-3BZw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:06:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/vX7KCThrtbyCJL4RdOrTmIvsFV0iHt7p2CSg98YggqyDwQ1fObBDt6mMW/1xxfdDga6jmaXGj9vgDBK4BdFtH0T/+JlzCI8RQYtgIwQVW7whPwKTb/OJ1WqVmM/8L4B5wab1PLPVFhl/u4ZnjagsHRvy+gsfk+3kOBKS3vVR+Yb/vYjHHmRQOD29/xu1QjU+XmveWfmbfyiitcNJ3GDxfiHJBRGDJkZMjm2ebIMAqlZqJFygySqdL9ziB8UOCodHMGZaMG1aBtIqN24WRTSDd2cclB90gJ7heSXjDr6+h/cvOQtoJ5S2xTz4LNt6wuE61XAP6wIAoP8YbZoxG4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HajtVZmufe7MQp79ognmKMOCshMYmO3e6UNVc2nbHBE=;
 b=XBBy2nOxssSfhYCYAQhMi/Hps2zHDWCpJLJdDjda80Yh7A9JVnYpjxr+hbejYrGPJMK4I/Otyo6Mk3BocNhkET92p3MepgKog0dmFawic9G58ZV3hTkt8ALObwb4yFN9+0j/zCAheq9yZL2mnZuXAqWjLilptZKpDjnVc5IxeSqY2zxnHEMBGRd51eB8tfpKpOjr5Xlb4bwn321ksX+mN0qn2nGXu3zzWPVX0h84Z2d4p3XSJ9uMp9WkaRy6qQbCIGR0YVpXHC1paGjsZ7QcH2UkE/iFqReodV/SR+ScLCDwRLJ9EZxQ5B3NYTlfxjCmDZMhV/EEhhR80dVZFc1FHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HajtVZmufe7MQp79ognmKMOCshMYmO3e6UNVc2nbHBE=;
 b=oHKBE+dHX7zS6WYVmhS0TkmOgL0xlPJKqJ6FO1PeaVNLr4/DQqsgZ9DCnKBNKFQqeESg30FYhp2a856rL5zyWbtRq+mprqn6Nd6yVEDpwpHSjgwxnLxh9mqZ/3tAai02dlL1wUnH6qVjEm0mqTYSaXIzbcM0TIAFfFpj0uX9tjU=
Received: from SJ0PR05CA0169.namprd05.prod.outlook.com (2603:10b6:a03:339::24)
 by IA3PR10MB8467.namprd10.prod.outlook.com (2603:10b6:208:582::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 17:06:39 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::2e) by SJ0PR05CA0169.outlook.office365.com
 (2603:10b6:a03:339::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Tue, 12
 May 2026 17:06:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:06:36 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6Pnl2235140;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 05/11] soc: ti: knav_qmss: Use %pe to print PTR_ERR()
Date: Tue, 12 May 2026 12:06:17 -0500
Message-ID: <20260512170623.3174416-6-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
References: <20260512170623.3174416-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|IA3PR10MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e2877a-942c-424c-06e5-08deb048d3c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dLWqQHzYDb/djoHIG0/m3FRn6I4MfjwerrBgUAV/AHJbWlPulEIKVKjg4H3CNw4X8NpQWYr1Q/L3YshY+ZQSoOV2SwC5EUHxOWs+HlH+FCE3gtpOJRnLmxB+C0KkJJh+CG60Jw7mRSOJj8JxJza/ZOw8g1HqrXKhrh7Qq4FheimKt0LVIe1OqffjSr0LRPr/zCdfM6F8+DAQVoL4ET+t9TK6tb5/gyw2JwxjjFgNPxhLgpqSJhMPs0ebvdEG9Q9BABT6qAI9REV005CLKeCLJxOcG1YHYNZgBCA5A5VfU5J0UVXNzqqQ9JNOjalzD4peGXe8ZcLkpeHgzeZ7f2w04M6OtBV3NUfskeC8n03UeNvHMccFiSXyvqPdWC6eTx0YPFdnkJsPgPk0IDZ/RSwQX8mr0nyu9OzMYuwCJV0vlrVHEW4uMyVc2vYh8geUuEGiXtrKT7929Vbi7vrCCwpAb+2uLRmanUczJDKkMCsS5m0uAYBrH5wDoQqvEmiBhso74JZNPnWCpwuBIqWpRoZ+03mkTVIynYv//j6a6bPSHVRGhraV5rGfloGXrsnzPIKQ3ZFVetG6mdiJauDdVtE/AMm3qMzWrgDEa9rhqPDLFj1qu1LFlBv1iI5RxQLGK86AfCh0qBlh1X8y5/lNHr7XBcOQYQNWvzAXf5LjWCXd10Hsk6cHVLV+WoaUXFu1a20hvlwJ5VYINJdKhoGVdGXc0DN8y2iOiQjBlwXydYIuKoo=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Zj39qdO29zynGMP/somNUWw21cMYIIl0GB/d10ax7bWBqkRirzVhlC9FJBiGA17L+xUcU9WWj3wmlne12/PSaklLUCOgbLdlCKFW8gUMeOBoABSIc4LJMnC18cFo5dEUGzua9qYb586pv8qEyhjHFdyHHxDmSWEI5emMF3czi6Mvqwa+WPxkDDEAkkX6wrj8wX8CdcLTAOsjTn748UgTZqnmrrEPmwkj6mn4WS0R1pP/jX44QeFDak7VyfgP/WGQoZ1PXT5n1hNUe+CjiVn0zUeT3Sv+xOFtOcxTnV/VTU9mHXYU3bgp1owaPKmQi6M3K0GEdEiSQ778QIJsyps9LlrbnfdwOQDnPsO7dUqcv217LEKotkxADNW4K6hez1pAHA2ea5NvgX9iPCaniNFX5jMWp9kKU67Evdi6fntApj0ynJg8VyZKlrKv7SZBXYtb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:36.8783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e2877a-942c-424c-06e5-08deb048d3c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100645_838367_31C8FFE1 
X-CRM114-Status: GOOD (  11.63  )
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

Coccinelle (scripts/coccinelle/misc/ptr_err_to_pe.cocci) flags the
dev_err() call in knav_pool_create():

  knav_qmss_queue.c:789:9-16: WARNING: Consider using %pe to print
  PTR_ERR()

Replace the %ld / PTR_ERR() pair with %pe and pass the error pointer
directly to also print the symbolic error name.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- None.

V1: https://lore.kernel.org/all/20260508153211.3688277-6-nm@ti.com/

 drivers/soc/ti/knav_qmss_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index c3f85052002b..50072e9dea37 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -785,8 +785,8 @@ void *knav_pool_create(const char *name,
 	pool->queue = knav_queue_open(name, KNAV_QUEUE_GP, 0);
 	if (IS_ERR(pool->queue)) {
 		dev_err(knav_qdev->dev,
-			"failed to open queue for pool(%s), error %ld\n",
-			name, PTR_ERR(pool->queue));
+			"failed to open queue for pool(%s), error %pe\n",
+			name, pool->queue);
 		ret = PTR_ERR(pool->queue);
 		goto err;
 	}
-- 
2.47.0


