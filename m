Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C03C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hA6QP0tdX0LjWDwtqiePGU8ZVgObT/BHyWxUwhYt+Ho=; b=MTJzgL8dNJiFZ2ebJ8as4hDeEN
	d6qbLhHW54rHWzEozRVboAVI1dJMIH9VmjQnTGUtL9XMR/tcQyl88JfbAooTxGHMfn80Y/TSl7L6F
	Eh+aRhQomeYmhRxJ3vdu6VAcT0JxwVVNvCmgh6nbvcRuY2y1gLJXc/lyCu+fRypf3lzz0K/Vs2H4G
	ZQa01nW0LssVpGeJQtXp9i7M/RHHrMG5kCFcYJpEfrVGaMrfUkfEYL2Oe9W7WAE7g4M/kre0iov3z
	Bir/fZ+o79ux7ZRFpiR/KfGyBc7QFmTZZlIIBl4RBVJmiMREobEyosHKT24TUYTyN479wI8chU+0+
	mXU/Hb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2ah-00000000Zcz-1BQQ;
	Thu, 22 May 2025 09:51:55 +0000
Received: from mail-bn1nam02on20601.outbound.protection.outlook.com ([2a01:111:f403:2407::601] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2Ya-00000000ZBn-3Iol
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 09:49:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SF9zr/5ERznf8PK0bl3WT95p7dEporEEN3M87Dh3Zf5IkilQ0VKji+N/aK/R/0FovLZwamSoO8wwIFDzpWS0f2nWt+y/NHMyLeZbbgCEVhztVKroPdo1gxsWQMOsKvLpoaytdZhj+guTOS9pZZfog2jz4sjfHsfFoQa083D9J8xdIzB8uRta9xfLoL8oMv8Z3UxtIva3nFDVqjjmJ0U9jloWLWN0JYIsrBJh7RfMkjwdPYIj/BdwrIiLNP6hIId728QKB5G8OEMlwzX/d+JJMZ2fi0rMfRLHPK78s7OhGnYtUvupcd3cJi49KAbqxh3s3iXPvBZfYuFQIMwM4Up4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA6QP0tdX0LjWDwtqiePGU8ZVgObT/BHyWxUwhYt+Ho=;
 b=W36nvKGVVzUrdWv9e0VfFynmafT/G+M139j20NnNqzeC1HlJ7xyQonSrIsT/viaXEJ3Zd5PvkW0O6cRiPn3ez/nw7oBGCcurz6k1Sw8YMrOYuiT/Eh8iT8qQN70LqCoMO+641wsMx5g/dM3ZjHK5X6OL5czvuveVLLhjXiAMeKx9G18yAzkVVLJGWXk4j6pwYBt9uxrWzpzuELNN/A8KBUrsiD4OrUfmTYnnA1ZXvW+M1oo5Eem+52Tm4+1IzWMNN1TOiK17KARW0oIE8lmq/i0FMWZBVYMw3BzM1kyjOin4pfS0zRdOo4gW/TpZmfaZ1IQ8tE7/rexERtSZVyNXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA6QP0tdX0LjWDwtqiePGU8ZVgObT/BHyWxUwhYt+Ho=;
 b=e+sjXAPFrUSjl3ya91VD12FxvU6RrhTjhEDZRrn//6gMJrPLfXYEEFPr+oXF0E3quyy7cprkz7bOalodCH/KoIuFHw4HQR8IEyNGzc1JH+dkpQxsaCVbaM/Nu1oDIAEY2TIGmB7iFZG66EHVMjOYJmzbt0utxZFSz2B8zXmLBPo=
Received: from SN7PR04CA0025.namprd04.prod.outlook.com (2603:10b6:806:f2::30)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 09:49:38 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:f2:cafe::e5) by SN7PR04CA0025.outlook.office365.com
 (2603:10b6:806:f2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 22 May 2025 09:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 09:49:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 04:49:35 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 22 May 2025 04:49:33 -0500
From: Paul Alvin <alvin.paulp@amd.com>
To: <michal.simek@amd.com>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>
CC: <git@amd.com>, <alvin.paulp@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] mmc: sdhci-of-arasan: Add shutdown callback
Date: Thu, 22 May 2025 15:19:32 +0530
Message-ID: <20250522094932.4187301-1-alvin.paulp@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: alvin.paulp@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a528a53-fa5a-43d6-84b7-08dd9915f716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CJDgwABLMsd0I+vj4mQsganDbUCR8U88YpdKeSd2Q5F7jf0kjF1HLBwiouV1?=
 =?us-ascii?Q?JEUCs1u/d5tGK1+O3p1N4xZT63JeU9k5gs2cbdqMhoSovV+uInP8LzZea6Fo?=
 =?us-ascii?Q?Z8v++dnZ96sdsVyJve6tN6chBncLCY/7nDZ5OvCFbVXXWv+eUX9UnFGifr25?=
 =?us-ascii?Q?CrGCnRLWqIleP1pOL/druvXW00+GUFGhE/eSWfe0QRHzmJ7c9Z3bF6gScnuN?=
 =?us-ascii?Q?GYmlbMbGlrmlFM1Oooo2oYtUBuVIzF4FlgYBKJ65RtO0lUN3re31Fq13ejUU?=
 =?us-ascii?Q?kFtUfwHao9Sx/sw62wv1X7fD8ixAraBX/SOeqa9TSMeHSHIz91VZlpacfPiV?=
 =?us-ascii?Q?Y8A9q/d/PP4e/JAY7U8bTGGM0hJ0XJ16XHVMcRVYRSw50OmrFcHVbIkrPMUF?=
 =?us-ascii?Q?yzjkpJ01YVpx1DMZjJrw/mRNZeuWNN1mP7QR4WTgdBWN/NQa8fqi6tiT+9Is?=
 =?us-ascii?Q?8TiMpXpyGMo0fKpQYAaN3OAQBJ4NJlCsCswQJmmlI1j1q6lVuKzVJ7QgeI/0?=
 =?us-ascii?Q?qkR5jKfyzTq/26rS1HS3vTTtBqcm4s5IvrkKbIBtb41M9HcOYYH4SkV62pTC?=
 =?us-ascii?Q?4RpB3REPah6FIpbY0zIQOyiP6yg5w/nGr6PEx1kkgTEg6/9p2BXeBIlZj5nh?=
 =?us-ascii?Q?H/UN/E6va4zY6SU+6rsOOiKokgZuuBbilBpzwkoS2cGjC0ENKM2m1M+1DRc3?=
 =?us-ascii?Q?GA1E2BZ1Qcmtp2TB6oFMs4zSR19DZWhfQI36qfBRcF2eQtZQyesGlTI8AHJN?=
 =?us-ascii?Q?9xso72MdS57oDqjct9ENk/TmfZ+eWPs/CC/5QOKLO1JfCXlWUqDGXIHi1b1N?=
 =?us-ascii?Q?SQZxYoYrCy6h/gXT7XM5Jp5v7zY0vv1HONrDmrURUXc1O8VfIFHHOJPxiOvx?=
 =?us-ascii?Q?QL7xmJsoGP+2nwQam6ZdjbfPjAfAaf88jmPbS6G6aC7YaLoDR5UYzhwFAX16?=
 =?us-ascii?Q?CO0o0SruJHrwBLYpYEFDcf2r23bfjmVrTjeqtlfF2T/nUz1h1IuQFmpSOhzS?=
 =?us-ascii?Q?Ywa9vNT/95SNhtjEkc8NIqcxLCGJuHbJprO/8KqY0BjaqY/M8Gdscbi1DTZ8?=
 =?us-ascii?Q?Q6A3AVY8N1jC9XPdaapRscQvkAKyfPSD3itzWz324wM++VVjmcGPkgVQo3bq?=
 =?us-ascii?Q?HekXuaxk/R0lFbIwiZCNhubtE1JOzueqUcucVva+s4tVJnHyJR8f1fSkpVG4?=
 =?us-ascii?Q?DtNy7Ed8tz6Ttc9PIekAdd0FmqxqG0vGbsRh2M/OSnVwDdgoEUfvIn7MJ5XC?=
 =?us-ascii?Q?WyIpphl/GIr/kAtn/7wnKSsWZI5ToDuO1mH2MqIgYygTPusdKUqYWcj8V6/q?=
 =?us-ascii?Q?t7XWOO5q/JakyHXfaKCKfkMTxZoVf3dxjxezKyBJZgdI3UmPNNIHLSH2/bby?=
 =?us-ascii?Q?mstFslGLlJoOm69wGm5hHefzghap6P2BYcwERmoPUE/KwwsNYc22mS/c4f3+?=
 =?us-ascii?Q?+KDNoeBhiLfBj/M7+LcRvJE1xk1chkx7QsltN0V9zdKDmAdyLVdkjKamUUDa?=
 =?us-ascii?Q?a+Xm/SkgzEmnZGn51paj3i26CnJZxMO3WZbF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 09:49:37.4789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a528a53-fa5a-43d6-84b7-08dd9915f716
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_024944_824147_A6062936 
X-CRM114-Status: GOOD (  12.89  )
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

Implement shutdown hook to suspend host, power off PHY if enabled and
disable all mmc clocks.

Signed-off-by: Paul Alvin <alvin.paulp@amd.com>
---
 drivers/mmc/host/sdhci-of-arasan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index 8c29676ab662..af4643e24ecc 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -2056,6 +2056,13 @@ static void sdhci_arasan_remove(struct platform_device *pdev)
 	clk_disable_unprepare(clk_ahb);
 }
 
+static void sdhci_arasan_shutdown(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	sdhci_arasan_suspend(dev);
+}
+
 static struct platform_driver sdhci_arasan_driver = {
 	.driver = {
 		.name = "sdhci-arasan",
@@ -2065,6 +2072,7 @@ static struct platform_driver sdhci_arasan_driver = {
 	},
 	.probe = sdhci_arasan_probe,
 	.remove = sdhci_arasan_remove,
+	.shutdown = sdhci_arasan_shutdown,
 };
 
 module_platform_driver(sdhci_arasan_driver);
-- 
2.25.1


