Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74B2C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLg2OfvLHU1VcjhKsZeqA74rYbw6juNTurkE5jTVkdY=; b=lvNZqdQRo3Ue2LQ+PWZFZF7xwQ
	//vZeNjrUN9Mj6DXLMhVNzR8MTNixyjDI3fUtzA4bJH7Hszxep8u90EJWzdt1o/j3p4YihnYRNYQs
	MVpPxgDQcahCrExfijqbk4rCAv3PLuETJ1oWpzIFMLGOTzVg1z+7vu1E5qwrmS+r5umPJ4W2X26Y1
	W0L4tGisBBIYWHYUgoC2XCi42u8JcuxlVmBHrZDb/yKwsmUa+8yIIsO9c91tEaQkRvarDVDgFxee2
	XH++3K30kNXFW0f2xhvJBXTAZkjIi6auPHQTXi/dadN9ec63QQ5OketDTi0iKeYWnGGDFelvGj3LQ
	oVtScqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0nc-00000006Ehb-2AEE;
	Thu, 06 Feb 2025 12:16:04 +0000
Received: from mail-mw2nam10on2062a.outbound.protection.outlook.com ([2a01:111:f403:2412::62a] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Vi-00000006DIf-2zWg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 11:57:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tF522wDQBH6Q4zswt+rGu1kFs65ved+5/16v8rx69ADvNMYfmJjW3EBuzG3TAUIVZ/8jeT5we0krcO1DHs0V4y1Q3EVcvTqc8wevgQ2DrnqrTZr6VzGx4wiqLV0xaH4OAdJlAuJeLjDULNaKe+EjOPx3UydouQt2eRqhf8XSiny1r5QwHXEtEPhZS2vFNJIY8qBSh+N7L6W7jFjv/g8Wc7Eehn7XRwO2v6l3CgUReWxdCPRD7w/JNi4cqb8TC4ZqJ9jsEtvUittWvWdHd2ZBIQ98q8IZOEu6PIcPCXEkhvMONH70pr2Nh2gzfq08pePRU/tVifDzWwU1YNkfBZzV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLg2OfvLHU1VcjhKsZeqA74rYbw6juNTurkE5jTVkdY=;
 b=mUx08rNdmy0GUAVm6n4wZ8ugaSEehETGDWsDW+ZyYsA5ABncyaGoIgav22JDnvHnPGeWp+z2hOZwqDbI5TVIpqvoyEg7ArLc/bLqhkcFdkqzHdmGcqcpP/4McZ90EaIavn5L3KeMhmsCLNKQP/44RYb/PXzWGVqDHn+NQVDGK1f/XWUU0PmvLtKtuQikKuwp/lyelw37Lby5jhw84+mlKdu+RSvsMrtlM3DFZDW+POJNTx+0SV4nCD9wwaN2DBJTtZg60sVNoUPxQFAQ54iGTIyglHe89DaCU9p6ZVKZ+Ifcm6pPJl45yJRJmDlAcTeWR6eoWR4CsZck5KRbfDmH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLg2OfvLHU1VcjhKsZeqA74rYbw6juNTurkE5jTVkdY=;
 b=z7RE5OWZ88AUV4tBJ2P6Gs14q1RP6Rc1ifYBdQBPxqv50uX/VtYSQQvwcxm8eZewXw0HyQoMbNat1KEAuvFW9ey8NTM7fZ8xYWeilprGSNwL/1lqvndsIllC+D7r+obX8917O7h1tftqMh7/3PUjT9AOY/KzZOwu4UR1Emwj78g=
Received: from PH0PR07CA0057.namprd07.prod.outlook.com (2603:10b6:510:e::32)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 11:57:29 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::83) by PH0PR07CA0057.outlook.office365.com
 (2603:10b6:510:e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 11:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 11:57:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 05:57:27 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 05:57:24 -0600
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<p.zabel@pengutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manikantaguntupalli09@gmail.com>, "Manikanta
 Guntupalli" <manikanta.guntupalli@amd.com>
Subject: [PATCH 1/2] i2c: cadence: Simplify using devm_clk_get_enabled()
Date: Thu, 6 Feb 2025 17:27:07 +0530
Message-ID: <20250206115708.1085523-2-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>
References: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|SJ0PR12MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 09cb3d21-9b3b-4fdd-1a0f-08dd46a56e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yEka1AVKyZBEfbKu2DfIg63K83VGor5iHym2PUavLq8UzwzapjrlncONS5kf?=
 =?us-ascii?Q?f/fKXag4BLPFCf60ezDIiN44lWPkKzO55Flbla22XKDeoUN/vi4pmJJ2OALh?=
 =?us-ascii?Q?SW+Mv9Kgge8BIiVqZI7hLM5w5MoDYa+hVh6S8vgAOXOgknSj9M6JXNsLcPPZ?=
 =?us-ascii?Q?PjJE5K5oZYq1vIBng/ZmwJJIjKgrRFQh//lNX31DNcUO+zUHW3BFEBLFEO3N?=
 =?us-ascii?Q?PYI5WohelcGg/0HNWkvBDRghm55Vid9B1+v83oF+TmRV8LuD/p1tHL7W7Tum?=
 =?us-ascii?Q?EtMmTSUj32dwFqlOBxqwEQEeycpILwpuEfBIvpYnmuCoQVDzpApm0TB1lrpN?=
 =?us-ascii?Q?uFkvDaOBsRXU63LvhCqq9KLPw4sZ8MyYeBA6fnFrgL90OB8OzhiVOg0OvDAT?=
 =?us-ascii?Q?yIsJbUDpMGKH9XfApbxFxEzF5cgwm+A0dNKQccHEmSitKWC47zh2mJf3tzjC?=
 =?us-ascii?Q?AdnXV2MOMQ4brgRWYYqGkd4pm8iYZaAiARCpoKccaKibWau6TjXRNce68dFE?=
 =?us-ascii?Q?zXBf/J8to458hmAUeUnb4N476/AzOrmdkDZ4erini4oJWIg4V1Sb72s3HCrT?=
 =?us-ascii?Q?ZW8yx72+2U5f14HCbTgf4Nrd+IYuG3NHVKPWeMr5YyNp3mCbNlGQBqog3fPY?=
 =?us-ascii?Q?GTnN+E65s3PTIEc9iShghkhFAR3rFCxE8vlmtcjYybCWmCJMSew74GmXyDqR?=
 =?us-ascii?Q?WQI/Wexq3KKfo28Dm1figLSv0BIcrjxk0twmHBxOR7J4NJWlHlI5YH2i2HrJ?=
 =?us-ascii?Q?SO5WDRUsjgTwi3UmGYYNb9Odqj7fNxXvEyvAsrFaKaMPfXt6yPchGf7CHJiz?=
 =?us-ascii?Q?68XzHQCP9jN+P9Ueai9HSmC068rer3IGEVPSWfu/5ddBgxTrquNeWussluWd?=
 =?us-ascii?Q?NGM9NVVy2ucVtQ7oB+flOLegZYzu23d6oSZg57vHvIYb8iB4UzfjPp/FmnRn?=
 =?us-ascii?Q?ey59DMLa8/9bmrKQM+UCv/3wcrZxScW9k9Q5DXse5/R3z4e/Lhk8mNNUuVw7?=
 =?us-ascii?Q?aGUtGNeDbwYCxIwVqribUxLVhPMaBRz4dOHiHtGuGCS29q9GyDboz1XKTPNs?=
 =?us-ascii?Q?tcWiFeffhmbA5hvBJdgz8QrZE7x4FxYjMqJlkOgDX0vu5fFqPwc7/gb0T8nM?=
 =?us-ascii?Q?ZRxYGJFBy2v4z+Thf0d+PmfNq+kLu3nqDf/jWZI8RuJsU79ESbxzdmAee83/?=
 =?us-ascii?Q?CiUyqtxXjoY0CkIp442VFGEeAxKjdjwSFdVQwhT7QPmFmvnlfDSCeRtoSl92?=
 =?us-ascii?Q?XKLFB0KjYWYtYAUI5yUD5guCu1z/mquEQ5R/xTTOVvUxpmGlJsNs+gWqS4+l?=
 =?us-ascii?Q?04KiulkqnCFafHHri3X6tseNBTinqtM7ZhLgIhkFrkDYAmLziRvqqEKLFkxG?=
 =?us-ascii?Q?caBqNq6+ECShc58fdIfSt3wEiukJ1HReC0EoehCdYVAgzF/QSzMRFK92SGCk?=
 =?us-ascii?Q?FF98qnFJd4hIEDBfvADnGThD1roHysYF0zdBg3yY1rOqY/5cdwRWCmOFWu9H?=
 =?us-ascii?Q?+svd2GcUiVkhsm4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:57:29.0553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cb3d21-9b3b-4fdd-1a0f-08dd46a56e5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_035734_757199_DC8329F7 
X-CRM114-Status: GOOD (  12.67  )
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

From: Michal Simek <michal.simek@amd.com>

Clock handling can be very simplified with using devm_clk_get_enabled() as
was done by commit 8d2aaf4382b7 ("gpio: zynq: Simplify using
devm_clk_get_enabled()").
And also fix issue in connection to incorrect sequence when err_clk_dis
label is called.
When reset_control_deassert() fails it jumps to err_clk_dis label which
disables clock and also disable pm_runtime setup but nothing has been setup
at this time of failure because initialization is done below
reset_control_deassert() call.

Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
 drivers/i2c/busses/i2c-cadence.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index b64026fbca66..51dc7728d133 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1541,7 +1541,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
 
-	id->clk = devm_clk_get(&pdev->dev, NULL);
+	id->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(id->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(id->clk),
 				     "input clock not found.\n");
@@ -1551,16 +1551,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(id->reset),
 				     "Failed to request reset.\n");
 
-	ret = clk_prepare_enable(id->clk);
-	if (ret)
-		dev_err(&pdev->dev, "Unable to enable clock.\n");
-
 	ret = reset_control_deassert(id->reset);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret,
-			      "Failed to de-assert reset.\n");
-		goto err_clk_dis;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to de-assert reset.\n");
 
 	pm_runtime_set_autosuspend_delay(id->dev, CNDS_I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(id->dev);
@@ -1616,8 +1610,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 err_clk_notifier_unregister:
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
-err_clk_dis:
-	clk_disable_unprepare(id->clk);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	return ret;
@@ -1642,7 +1634,6 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&id->adap);
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
-	clk_disable_unprepare(id->clk);
 }
 
 static struct platform_driver cdns_i2c_drv = {
-- 
2.34.1


