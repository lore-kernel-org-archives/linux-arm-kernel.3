Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E9AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj6vtM/CNVLwlXZDOoxN5Gw67hDe+I2kHtCUTuszPuI=; b=mrSS8TdeqAqxLL1meFyKt9jxl3
	f0A9e4b4mzBrxVz947t2KxONmSgUNDOZNan5O2mVJ9AQJLQFcW/ENQdPbZNLvtyAAQZMKUlJOrUei
	WJgPbnN2eEzJhdvS8j9u73IGf9+kFAj+HbWVuf5jaOvYMhIWX1oI8iaPAPp3hu851ywyRyYnYSwpv
	7LazJLVe7yK6NZwOU/0W8eXSUFjixUy6ihr0S7raqucxlKKNvGrUdHOE/T99rUyegTGtCekEqnRnA
	pGLYQrwbdeilvBMVHPIHPysR6eg5O9GQxd1rFRfupiYCL5KhxhdX2GE+2aqFjh2NRu1BanrJfbAHk
	mBjQLgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmiL-000000026NL-0Na6;
	Thu, 09 Jul 2026 11:14:45 +0000
Received: from mail-westusazon11012001.outbound.protection.outlook.com ([52.101.43.1] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmiH-000000026Ib-0Iy1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:14:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XL4ENeNcXCNw3MnZFAXYHVDVgSKCTUmhcKK81ffHRqRs6bqme/pSty0aBvF0mY7h3Nh01+i3cGoYwVEmkiFQjqD1VEau1qY9fLLoLwvFkdzBXTQeegQYEudB3a1Ixe35ipw2GmuvxQOSSoz4RJt5+ZGVxe5mKaKFRJWp+mYt33IfhoTpdGs67hM5IStvARIL/CT+4o8iQS5k75prUWzC9qYzIMKiXq9wLakpu4SpWpCxjEHLSQUM6bmTCMs3x7YZ/SkytWwuzTw0DbbiNfIm8pwwMmwwVLVTN4hBrqFnLwNLvb5yHCt77DT4/DNPgSkpp0dv8swx7koYbNOXvbxMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rj6vtM/CNVLwlXZDOoxN5Gw67hDe+I2kHtCUTuszPuI=;
 b=COleHlS3OpFE8xz7wDSdI24UhjM/TKrbwTfkCfxOVC+D+2q6Dwk/qaWSAWteQXAMmoqMq+sVBwl6gd/Qrr8thqSZkj9Nrj4WN4T7kJmO/JjUPxji+3xMcrKk2EmEX4cbBjVRBRreOFuLyBy6AzVJW/1Ij/eJyVGtM93uU7/S6DlhkiI/5Il0syb4+iUwPKJanD5sZ+7OGLxw/VMLk3UCZt0Vgkj8CIfybptO27DDTXNIvJKM3BLVYWyCBNn0HuPs9GrWYBXe3lMKnlxDn9PV1UKagwWPB5ZlS0RvEddI3T298oQXNXkHTCvuQ30GYs0l7kzIcDn0XHmRQ94QXWxrcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rj6vtM/CNVLwlXZDOoxN5Gw67hDe+I2kHtCUTuszPuI=;
 b=TgzF5FYmFzMXkRzWH2z+D2PgPrKYjZg5skJQKw9kJ+NZ/AYlrnNfVpqukKvsv2AnJzVyoHyOjNUvBsnOn7CscpLPEaZ0KHPiz4GsHMgRUY8OQUNt34Nmbz9hS8a4j9OnEMpDgLBktGj10Ga+cPtPEM1tVhEqnHjJ3KiCt9DTo/c=
Received: from SJ0PR05CA0064.namprd05.prod.outlook.com (2603:10b6:a03:332::9)
 by DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 11:14:38 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::9b) by SJ0PR05CA0064.outlook.office365.com
 (2603:10b6:a03:332::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Thu, 9
 Jul 2026 11:14:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:37 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:36 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:33 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 8/8] clk: clocking-wizard: Use separate notifier_block for each clock
Date: Thu, 9 Jul 2026 16:44:03 +0530
Message-ID: <20260709111403.1579159-9-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DM6PR12MB4044:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b97bd61-d1e4-4397-6813-08deddab43c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Ko47kh/lPqGZ+pPUkf+njxXyhSgjJJg2QTXhMN1vEB8MKpqGRupZ3MsJsu3Kpivo0PQ8BkupoKEEPLS6ldyFLDDwcuw86G1PmYH+9Ix3N8vxjWzut/koHqqHOipt3Pf5BDYPFfFT6Qb8cmbLbYQ1apAuxM9cC8WGkRn6tepHhWTAjeb0DHQEVy+pbabmYcRj0pZ19STsM4QdJxIWCfCxn+eupnWR1kazlMYcR5h4tWAss27a2p/kylw4j0jKRYewIFvMr1Qp7YaOZ5OWJqBmHJyNkogXCR3sFyVrR4S6KTK/D2ELwikrGRjjBnR3lDJDccmqiIdJDaIUKEN+RY0DcWIm49DbeEb94UVgIhvubqLhyo39AXS0XFVV3BML98LshuDPlP2KhBKmIcjpcVbITUR+DfOfslRjZ2SauaL52jGBY0BDGr3moGrAd3naSKkb87Sial0Z+5pZIYI8ZKAC8SS30zzKHIItoncwkPPLHvBHk3mTk2R5c7dGdQnJ9wIXi1ihaMm2TFEQ/hyTIRBJC0ARTFe2kuJ3t7l4HomJpO8mepf/ao04UKNZcR1vn0cmYuPdyE+kKr5b46PHTCf1bFUj6gQY3G6IVhXUhT+9xBtDwAqh4E0L1ELv7ThlEYpqW9PxutXsiMFAXaDDDWxuuIv4KXWCj+0aDnyILvXJSRJqOPdtTz/MX4jHfRDkr/0XVJ5gVEyMegV7erKekgZthg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 33+yvTnOm4CB3jJsON1uMnMVT8e2Nyv54la0khanzZElYTOMIFILA7jDuy8uUfmml2jttGW3VU7EvZ+QDaBfbEqzqokvfODBGfZif1/Jhnp4vOsmRKeSopyASKcN5C0QvroFA/+Fhl67oy36g5PJkvU552WnAuqTJRUeM0cdKJ7ry2UGKRyAPOw7TOZXhcw5t0ibGr3Wr+PCfOBPY9LvzIWozpQWcJ2CXty28tEJ6oeeLAMmF8eVo20kDikWDAE5+l8PzirgyaQL63GG5gQZbXauMsO+Zn6S12v2nnw64bw88pyXl7XrVbMczkKqWLsUjLIZVJZVMCi7I/qoDL03eBJXzvoSsLQWB0yUCogNoYNiqbileddkbemLuk8bBa9E3EtzlCUmt7o+wmRJSIFijYoJMe9USRXYF07d+6evXPbCw5e29SpltyMqoVDTzvns
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:37.8506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b97bd61-d1e4-4397-6813-08deddab43c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041441_122641_5EDBD8F0 
X-CRM114-Status: GOOD (  14.15  )
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

A struct notifier_block has a single 'next' pointer, so registering the
same instance to two different notification chains corrupts the linked
lists. Use a dedicated nb_axi for the s_axi_aclk notifier chain.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
patch added for notifiew_block

---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 289c32ab5cd8..bcbfb4341dba 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -126,7 +126,8 @@ enum clk_wzrd_int_clks {
 /**
  * struct clk_wzrd - Clock wizard private data structure
  *
- * @nb:			Notifier block
+ * @nb:			Notifier block for clk_in1
+ * @nb_axi:		Notifier block for s_axi_aclk
  * @base:		Memory base
  * @clk_in1:		Handle to input clock 'clk_in1'
  * @axi_clk:		Handle to input clock 's_axi_aclk'
@@ -137,6 +138,7 @@ enum clk_wzrd_int_clks {
  */
 struct clk_wzrd {
 	struct notifier_block nb;
+	struct notifier_block nb_axi;
 	void __iomem *base;
 	struct clk *clk_in1;
 	struct clk *axi_clk;
@@ -1318,8 +1320,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				dev_warn(&pdev->dev,
 					 "unable to register clock notifier\n");
 
+			clk_wzrd->nb_axi.notifier_call = clk_wzrd_clk_notifier;
+
 			ret = devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
-							 &clk_wzrd->nb);
+							 &clk_wzrd->nb_axi);
 			if (ret)
 				dev_warn(&pdev->dev,
 					 "unable to register clock notifier\n");
-- 
2.34.1


