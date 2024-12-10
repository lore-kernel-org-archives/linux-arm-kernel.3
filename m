Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F3BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpPxhlZpHvFlidjzPl8bUSFkNAwxTYNWeE3I8YY9mYs=; b=3MT2X8nrfHkLyJVGbwL8GyWysR
	qsrlPw+8H6qwVZUplTU3j+6tzYf6JRvJAZk/5Z+rm9M6ypXGJaNTFaYqgKqxQrVKzx4WkPFE+gKmu
	8RDKmLUXqbI5aQ+poeRYU15QH/jSb5fGQhbya9qm3NvWhcYKTrRJffIL59f9JCMbZVxoGu2ut9Cus
	Gz92NUDbzXbjWSXiVFob759w31nTIDulz//B6T976ywnLQJ4SxBetT0YMxMJTdTcigW4C8VRSOwx5
	pNI2lEpH2CGAEm+vZUQcBNDm7l1HxDW/daOiaxaxmEAZ5vCXcxo3q3vW0AgqcHNllL5P2AVuBAI77
	/Hr03v6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKx9S-0000000B4jq-2Rir;
	Tue, 10 Dec 2024 10:07:34 +0000
Received: from mail-bn7nam10on2062f.outbound.protection.outlook.com ([2a01:111:f403:2009::62f] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwvN-0000000B16W-3tOj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:53:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUWCw+nJFq916eG/xDjGlE9b6sEJ2lt7Kb5J4E9/WwZjv+qohf9+C9vQgamCUQP/FvvDawfNwcizttEcIjowsSTsUXQRPwXY3nE3PXCSiI1+9BTBmjf/GPM932Sd0OslEQwY35wRz4M6C7N9HgcwYlstzG8RzLXkSc99bmxbX0LkYPqpmkmVBZE8L3QWglFRBkOkD8X6plwbKPaO/jHZc2hm9zMxzi3JYMhYbs+vnCaHNgLAe8G9qeEcE/2mWRsXq0UTKHgJiNqVCXKQ8usAezGCxzPtD46GnmMwX8H/V6oNJllZ3jSd5jqg9Zl0ufPHkOYlkHdQ51brQNlsDozM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpPxhlZpHvFlidjzPl8bUSFkNAwxTYNWeE3I8YY9mYs=;
 b=mGgeSXvzTWlyssQuYuWI1fwP/4gl9yW+xYA5wm9Sw3tR3yP+CrZFEzR1kA4hKCnUIqJrpz6PNuOOl2RW/9I/BqAQvEN5QXXIb6Bei1GcndzE3M5Qa8MXMXEtmn4DGryDjV81smrMExr4nZ+d/hWeJBiTyhG0JL+VuGKmvKAozfvj77UhvZrqfAD8x1bfEvitnOeDFq04x6mM08rNPf0QNM/qUWlswSi27eLfTbiDlosW+ec3Whzvy33tqGjf9Zz7jbtBdIIOBBiVVLVFSJH1lfYIliMDq20u/4BvN2sLl0/o/4S18e6MJlUrWKQuDgKTq9ji7BHJ4jQDiQkU0MIa6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpPxhlZpHvFlidjzPl8bUSFkNAwxTYNWeE3I8YY9mYs=;
 b=BbZsxyH65ook8moU/eAB9BBY/GzWIQGVoi8Vy+UtF3aFiNKQQczldMmvA0XyMdBh5ZKfGJ2i7zrR25YTM/z3PtbRg1Awkzzty4SAJTsv/2JVCKlpQFgfpdN0nz/EHhaR+NCmPrw7Hvswbt3kY539UBHSgn+e+vYoWHeB/M+GWAw=
Received: from MW4PR03CA0030.namprd03.prod.outlook.com (2603:10b6:303:8f::35)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.24; Tue, 10 Dec
 2024 09:52:57 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:8f:cafe::e5) by MW4PR03CA0030.outlook.office365.com
 (2603:10b6:303:8f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Tue,
 10 Dec 2024 09:52:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Tue, 10 Dec 2024 09:52:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 03:52:54 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 03:52:52 -0600
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manikantaguntupalli09@gmail.com>, "Manikanta
 Guntupalli" <manikanta.guntupalli@amd.com>
Subject: [PATCH V2 1/2] i2c: xiic: Relocate xiic_i2c_runtime_suspend and xiic_i2c_runtime_resume to facilitate atomic mode
Date: Tue, 10 Dec 2024 15:22:41 +0530
Message-ID: <20241210095242.1982770-2-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
References: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|SJ0PR12MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 8353bc58-e0c0-4da3-a5a7-08dd19006ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oYZNT0tSzhtso0A+D8Imdq0fHTB1RdW1oP4KvDQMlRhmNPlkqf1Iktz+IneI?=
 =?us-ascii?Q?7URcdxigyoqyJvGdivjG1PeZsOZGef1dzEhaqfS7afiGXB1bUOwMmLFOUxtO?=
 =?us-ascii?Q?2wC7qn9DV3RlnOH18ESKP2Cgq/SaU7jocr4HFm4IcrDByMX+aTkTSOE8yRuK?=
 =?us-ascii?Q?jnGPHlj6zrpNeNqcupwewc5L4/XySwuXedOlJRcgzcqcKF04qcCrmw+h0dTV?=
 =?us-ascii?Q?k+R3h31SW5dx6CxAafxf4evRTyBJUo8jG9btHiXyzP/eC0CS0XsusgHDTN8Y?=
 =?us-ascii?Q?TuPw5EUZkHXSWTxaipCVPc/b9xQ/RD9O0Rs8KLkkc8DoFCyxhD7Y6Yo5lVHZ?=
 =?us-ascii?Q?Upy430TwKpfbU9dCorgIVuVXdclBSyQ4jAyKsQHxLgjoE0I0yM1LSywJZQUY?=
 =?us-ascii?Q?xlfP8z+9ZZiqsipxbtibyTjdrmU3I8UfOdVzbZzhUo0b8+jv81hGzSAxwCu7?=
 =?us-ascii?Q?QltsX9APop7sqj1NIKR4MD+jW2TMFAlUqfkBq1ohIzgHiusQa3Wuc/oSZ7q5?=
 =?us-ascii?Q?XVAOZCzsVDbUolYrqTsWDDG9zHznx27A144Kl2PbKL0RJpzCWQpxF84359AN?=
 =?us-ascii?Q?fIULd1hQGKEWtQSiAiraOnHVwjq4qdFqgjtePn0AJdH3YTmU2E6FdA1ua1mt?=
 =?us-ascii?Q?1yLTlfSogbnbUyPbHLafDXV8DVwk+pqlCwpapKbl0rfdyogH5LPMJQcMpcgh?=
 =?us-ascii?Q?Acy99EKTnIroDWtBa56w3W2AG96BnHFU2NxP5xGBMH+uqffluQbXsRt/utJ/?=
 =?us-ascii?Q?uVq9p+Wg7I++x32SHtT+hbLCt9yuA7me3ZyuZFNdneJtveW/y/5eUxTsVr8g?=
 =?us-ascii?Q?SRt/zmeEc3DBX2uRRJkBzb/afIYj7cEjxhDIOf5I8ego5rDdo2tmbGG3erjn?=
 =?us-ascii?Q?4nsVkC27xGzVQFqVwW66/2S0B1Ms7VBw84qixWkjNf9fI0opXqjz785v2mYQ?=
 =?us-ascii?Q?vSJwMd5TM9DMq3yCPSxVmz0Yi0p/l4ZHtpmxDZOREABpw04rzs7Vj0AIZpFj?=
 =?us-ascii?Q?N7yCGOpxH7vwNR/RbsiYLIFyQYpkpnzjdqNsYFQm+bQMwq6+lwIm/rjU/mi6?=
 =?us-ascii?Q?7mnwLetxgyIItCBPlHQCqGKlOciC2shr9qgvR708cu4GFSvee51mEngFYPSU?=
 =?us-ascii?Q?GTvfsuWJo7OtoUItvGOgqJyh7dkghSaV87I0g9cw9UJqfEuI0+ApKYFugQHu?=
 =?us-ascii?Q?M7HZNgGTiDsHucYszAJ1I2udNoI9/h41/Sh1bL0BmptGiShqybpZ4yrKkyIE?=
 =?us-ascii?Q?OZa6cvzfrD873fLVcTHrOJNlfKz3EQJwmi8HOdpRSIF1WsUmeuoKe3Q8d2H5?=
 =?us-ascii?Q?hvT3Bx2r8H2SPJpiNxkR8Bhd0/v642CVDP/b7ZReoICHK5CYGhMMjIARRJAP?=
 =?us-ascii?Q?wbKe9Vb7NyVKK+7ZYQ9h3mRl5VdkleBAg+1Zwg4vOU+b0IRX0lgLuqrC5zgL?=
 =?us-ascii?Q?73WmvE6N6C8XAzrgeAhqfwlViUPA/+qL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 09:52:56.8602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8353bc58-e0c0-4da3-a5a7-08dd19006ca8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_015301_965227_9FD3B3AD 
X-CRM114-Status: GOOD (  12.80  )
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

Relocate xiic_i2c_runtime_suspend and xiic_i2c_runtime_resume functions
to avoid prototype statements in atomic mode changes.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
Changes for V2:
None.
---
 drivers/i2c/busses/i2c-xiic.c | 46 +++++++++++++++++------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index c4d3eb02da09..f48e73f905e5 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -238,6 +238,29 @@ static const struct timing_regs timing_reg_values[] = {
 static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num);
 static void __xiic_start_xfer(struct xiic_i2c *i2c);
 
+static int __maybe_unused xiic_i2c_runtime_suspend(struct device *dev)
+{
+	struct xiic_i2c *i2c = dev_get_drvdata(dev);
+
+	clk_disable(i2c->clk);
+
+	return 0;
+}
+
+static int __maybe_unused xiic_i2c_runtime_resume(struct device *dev)
+{
+	struct xiic_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "Cannot enable clock.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * For the register read and write functions, a little-endian and big-endian
  * version are necessary. Endianness is detected during the probe function.
@@ -1365,29 +1388,6 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
-static int __maybe_unused xiic_i2c_runtime_suspend(struct device *dev)
-{
-	struct xiic_i2c *i2c = dev_get_drvdata(dev);
-
-	clk_disable(i2c->clk);
-
-	return 0;
-}
-
-static int __maybe_unused xiic_i2c_runtime_resume(struct device *dev)
-{
-	struct xiic_i2c *i2c = dev_get_drvdata(dev);
-	int ret;
-
-	ret = clk_enable(i2c->clk);
-	if (ret) {
-		dev_err(dev, "Cannot enable clock.\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct dev_pm_ops xiic_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(xiic_i2c_runtime_suspend,
 			   xiic_i2c_runtime_resume, NULL)
-- 
2.25.1


