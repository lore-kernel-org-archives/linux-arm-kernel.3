Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2FBC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMNOYxUC8kBKSOdWY4LhqBSiknKEQlKBIbq61EienwE=; b=ELcKqAzmUeK+3kHOmp4NRO4Rja
	qfu1oGdsVDUZ0HCmtHiFeQO4FUK9tz0TCZa1PSnMpX76e3/s89chpFpX/+oPZvEJN4uEZJUKQIdwJ
	vONfofpEJpf/KEhs2e2JCnAOOTkfuxerTS4Ywbt9pwE+4wMjBIJR7WpRssazD5P7/WV0S+2c0Jc33
	ZrtjfE7INYuoBe0j3MPc3GcR1V8JzAKbWnoOmTKft5hoo7s814prw4noPJN4Q93uBlmbP2oCCr8Vc
	+8I4szzECYsIlwOebFEdJvbfIAhSbXIj6ghR8SCJp5oz+2X2YxyRdI5twn7QyKxKjgur1Zch84Vmh
	AoqRlfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq5F-00000007DSz-4BSm;
	Mon, 20 Jul 2026 15:39:10 +0000
Received: from mail-southcentralusazon11012013.outbound.protection.outlook.com ([40.93.195.13] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq5D-00000007DRo-22LY;
	Mon, 20 Jul 2026 15:39:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uxe9hHmoMONG1lL6HAjPCpXPHlEzqyhExBieP/nofYKC02JwTCL6uI05dJ7xakSAm0jUgntNzq57nD/0hiyh0CeA7aetVvor7Vc/CsDrt/ciN4dj1IK99NASRfQIqUg0SYjP3ethSUxqr7lM0vdsxWEFdmhfR+GDUXcWn78yvrOML6iEORNNjIz6X/SYk8m9qcMxdbNWAeQQgDzcFn9JTr/mapXAOB9DOOv3AHmjnMXQhzT17IQNPjQ+7ot8+EqsRwGLD5ssNkPtcTB6TSH1N61hYJPEPtG+Li4MibIivUCXTrdInrYsQtELFcXMsG7E8Mqh9L9gLpzBs7C42TBuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMNOYxUC8kBKSOdWY4LhqBSiknKEQlKBIbq61EienwE=;
 b=S562hdTY8UWJmyl3nTSknVsxDtvJSd5nDL6oPI8HXsLisQflKasxS73H09+2xXJwoXTm2M9lv+4zMyWfVhti5VE1egbSxekvVIbhjEd7CD1Zo/8VZTjoOqyY0c15zChFh9L4ndH5s8wl6Tc54Jd6P/6meGMQPkht5kIw487rF+FML5odhOHwKfrv4oq8d4cwnYSxUIiCjY08EAI3iwOdOEYX89hg9RlSe1MeR0DNgGZjyn7i6ex+wj23R7oVGjqvxnIwhY6zuFjQDAU4jQwYuT1JmhCAWX4qHna9MuQFwcxAqsOiFGXWBMnBOLFq/8YL4zMhz5My+xpm3u8Yrvnasw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMNOYxUC8kBKSOdWY4LhqBSiknKEQlKBIbq61EienwE=;
 b=pRkkiGlXOLHvnlQw4LZpEotg+dw8NUpRaJcWYqFULf4F4pJoGk7ukYPBAitnk2mWYlNfJBLEpsJzjb2WcxhT69JIvAUSa7njZR1X+WpIdRrr4L9JOrE4BRqMK4Zd5TSs0VwoJWuf6ZHd5Bq6S/Xx1tKdUhEpCgGrY0XaK11g80M=
Received: from MN0P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::8)
 by DS7PR12MB6094.namprd12.prod.outlook.com (2603:10b6:8:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:38:50 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:208:531:cafe::77) by MN0P222CA0005.outlook.office365.com
 (2603:10b6:208:531::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 15:38:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Mon, 20 Jul 2026 15:38:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 10:38:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 08:38:48 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 20 Jul 2026 10:38:45 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <tomi.valkeinen@ideasonboard.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 2/2] phy: zynqmp: fix runtime PM leak on probe allocation failure
Date: Mon, 20 Jul 2026 21:08:31 +0530
Message-ID: <20260720153832.1130006-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720153832.1130006-1-radhey.shyam.pandey@amd.com>
References: <20260720153832.1130006-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|DS7PR12MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: afca6672-7464-4d02-1326-08dee674febb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: FN+yVQTym+mODthaEc7888etRbI1yKKwZWaYk6e+oCel+G1N8sVi8XQKJfFO+dsCOadjeXNxV0dFmOBm5ohAE+vz4E54DJyhECdqTKeIFo6bAmIHkbQyvdhhr+4/rrpYT32e5G8B2CO7r50ZDAauA4jiUY6MvEhFnUFWLzO8JISNfeTbypsj56Rpy7CMQhSqh/KjwFfAIYV+9z6Nb0AiuGz77NII0j5O4Ua9a8wi+HwNupnEtdTPSRa1Xj5Tq02/LjLu8MBSkXkeizyiWYvMDnkBG4xCNu6UERrG2Jf9vD1h1dENPwc9Sq06dBEcbHCOwo1L2CNAasuLL9RNRX0foMH20mnxtlQagw8VGsquH1ZkGpB6VadNvdCuB3Z/noP5YzGwFzgNKzWVGs+iWmDFFgCNvrCCyzR8Mw8JFReyW+ZcYtmCgFnSLONijShkGA10Wwco/AGmyYgoit8EOr/Zty4JuVqOA9Tbq9LGyC0VmXDzfpMsaUvIvUMNBWd3xu5EWL6jFX3ex8IW+uU9XqPNgJj6uewv8JnKPCK3TCaKmZGdseYh0eVNWYw9mQ9TZbV/u0BP5oQC9FNQpYWKe5+WDjDdDEKzH1kAc9yQFRJNsSsWsydyicWv2golPSfN1UK85hEh0dNwSpPg0zdEPbPt7BHic4wIs+I7BswJin5IvgEBRfHSaapUdlZx2ao8a5LzIMaPvyfCr1uup09MPD6/Tw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P5Ltnj49SnFVkGD8SH2YDMSqfIYF+l2TdaFcrvPAdkI6052zT889S/ssbhE3iApFemipmdHqm6zseYKSdFk8Okk3rCsWBQAviz48iryyUig/EUacdJqGxDYeZKblpNO4cuwrGFkW+xuLQkUJRro6XHfKIT7wFS5/ZP/GcC++VA2SNrigoidJbl5VzCfD2D3LqaGB8Z90GmgxJT2BtmtCQbLVvCm/Jvmxkn9BU7VfALwXbrIUNENdgt0iWszb0KJNvUv9HPeskartFPRn4MBkoxvikiJNERx2hXwsMnre+7m/tv27gf9S0ptqZmD9J/vVQvSgmjWi26ovhPpz2QGR4scA72NzYLvSK1gyNh9AvODLM2BG2DrJZhGjr9sy5nRqlvQz/1mjy6JJ+kLnf2dS7kklk7xbXXnwfiMnB0N4UjVY3PdGoeyfspPve5bXwX92
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:38:49.7003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afca6672-7464-4d02-1326-08dee674febb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_083907_529489_5A4CC704 
X-CRM114-Status: GOOD (  11.05  )
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

Allocate saved_regs before pm_runtime_resume_and_get() so a
devm_kmalloc() failure does not leave an unreleased runtime PM usage
counter.

Fixes: 5af9b304bc60 ("phy: xilinx: phy-zynqmp: Fix SGMII linkup failure on resume")
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/phy/xilinx/phy-zynqmp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index c8230f2bda62..2138f5399821 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -1044,6 +1044,12 @@ static int xpsgtr_probe(struct platform_device *pdev)
 		return PTR_ERR(provider);
 	}
 
+	gtr_dev->saved_regs = devm_kmalloc(gtr_dev->dev,
+					   sizeof(save_reg_address),
+					   GFP_KERNEL);
+	if (!gtr_dev->saved_regs)
+		return -ENOMEM;
+
 	pm_runtime_set_active(gtr_dev->dev);
 	pm_runtime_enable(gtr_dev->dev);
 
@@ -1053,12 +1059,6 @@ static int xpsgtr_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	gtr_dev->saved_regs = devm_kmalloc(gtr_dev->dev,
-					   sizeof(save_reg_address),
-					   GFP_KERNEL);
-	if (!gtr_dev->saved_regs)
-		return -ENOMEM;
-
 	return 0;
 }
 
-- 
2.43.0


