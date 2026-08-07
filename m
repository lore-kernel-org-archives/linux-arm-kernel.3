Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B50C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3WZkuOMbp92kOt8eS8keVcyPScCsl2/DBIJFG9MbM30=; b=waOQaITSlM0G1zC2jOaaLcjGnu
	eTAHNcHpeskRlzbVW4GABnGIQW31qn+xqmrA7E2TZkq5lj4q/TwiCkhbEkYuFGEKcNq+S9ap9Tw4Z
	Y0t4BhKECaQPahnR51ZM/E1m9D8bIzaRuEKum2JGufQfGXgdQoPIwTmclQ6zIIF3PgBhkpE6v5C2w
	JhTb6iqzbKZBwmXi/+ndZ5QqAAm9ramCi2GCEU74oXgHjJkY57YZ6REuaE6NQkcpUFP1JZSNDVEfW
	S0E214AFVUgkBuZL+SE0MYWDD2BWwSPIp+iJfAhWbhyF0IXzCQ3jaDQ/JN9/68l2q4B2jjxBNkQ4A
	Mc+MLRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNOM-00000008Q5a-2fjf;
	Fri, 07 Aug 2026 16:25:54 +0000
Received: from mail-eastusazon11011019.outbound.protection.outlook.com ([52.101.52.19] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNOK-00000008Q4q-0Mak;
	Fri, 07 Aug 2026 16:25:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsJctjXA57ZXtCAXdmFvypm9QFGlDRcXSEOUTfhEl9XIU/Nom44f+Fu4n3XUOc/t43Q98EEkfLGJXpcnYN4GWhBQOV8zd+8bJ+oq9RIcb8pFZSS1J7vn9Ku2DWb7R7ZvIuvT8+EpmCud+mZib1Ya57i28mCfRV1zvnYq4RdWU2FtAbRKu3hmS7JjN06ZGrIYL4TjztDco0TZhoacbEa3ij5SbU05YG0kgtzXQxCpGbmbMz6mYilJLBoRsm/Wd8fiIy9a/85lik6oCF6JBnK6FACrr9bUsEg8gF7/iwJ1EwzM1+lxB4/7ZwY6FJvi63Y8WaEGdrWp0KmFuG1QAL1xDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WZkuOMbp92kOt8eS8keVcyPScCsl2/DBIJFG9MbM30=;
 b=TFVl4agUu74K8wcB7fM6UU8JhAnMx8uQgGfTxGhZw94/BR+mEiRk5rAsD13Z1V6S8YFcHxkQy+f/I1ojx9Z9SOWqKJPZWDLjRkG+kP7v9bqsmmmKP/hl2Kq+hjE9UyxlVYPL4bQDT8U+r/a4QF9SVrIxb68aOS5b3dgsbaI2/S+KLQSEys6XFAZItppO+76xTHjuObX917Y8Yco3TKNN6v0PY2+3ToHq3mwC1awD0OOZmDj3KDltoj+q6yO2FBzh/g+iw6u40H9fB6r3eomQ0l28mYJf3Vh9Pe8kj4YHBD+2w5FsmHpQEzf9P3iOMWnO1wabpHjZl3M9CaCHf+CEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WZkuOMbp92kOt8eS8keVcyPScCsl2/DBIJFG9MbM30=;
 b=1pQqZ8ojKFAZP9eSni1CD/hY7cnf00G8UqgIntOSPkqMk1yDAvfu4556v50o2bjsDP3lxPMwDH1N5MxdkSYh+G7VQfQDYOnD0YS7xqcZPfvgxNNn6UOaJE97MbEUhnkVWJRC5ycaFVx3SxMrMMlb/RQymKOSCD6y6WRt7QYqDlY=
Received: from SJ0PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:33f::7)
 by DS0PR12MB999103.namprd12.prod.outlook.com (2603:10b6:8:2fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 16:25:29 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::6f) by SJ0PR05CA0032.outlook.office365.com
 (2603:10b6:a03:33f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.8 via Frontend Transport; Fri, 7
 Aug 2026 16:25:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 16:25:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 7 Aug
 2026 11:25:27 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 7 Aug 2026 11:25:25 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <tomi.valkeinen@ideasonboard.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] phy: zynqmp: register PHY provider after probe initialization
Date: Fri, 7 Aug 2026 21:55:10 +0530
Message-ID: <20260807162510.3681572-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|DS0PR12MB999103:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5a3503-fceb-4f40-b4a5-08def4a07ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|13003099007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: OjyXnKZuxsYzpB0MQcahjJyKeYOz9d/C42LhiNAMI4rSkIym7aSxBJBI8cKhMDJQI06N9729Kf2g6Fno7vxKQSp2K5GSLNfd7LWGLl4cNRwa6F8+dXQxaFPJ82Y2OeQBgDXUe5PSSEeruCVa8r28y7JndNTZiD8O0V0HTfrdVPBfYdulAs1Qi0XMmi8/eezb2ldFmHpZKRMjYwQccm+LVu8zoP5urxDH+bCC6PkdMeQdIKaMwahFJhRVp8RTOf+gpeJDeWpSgG9SU2EzarSVHBITGbVlcXvWOv2le5y/p7Ug12Sx4OYRHY2rjDWXLm9Mo6KvPL9HR+zJSCOvHeG4ys56cvsGqdcuUofJOnce2Et1qL2JxcXd9BAZecMMHTUQQOalLK44pzWqWycwLMBk5Ohq2SkZAtNgXiDqhDjtq+ucSThFPz70Pkpq5IlefGpMoVBRcnKfG3DQ1l8MeVzp1nq+0XEKY8tK+gfUlZXGuMOlSYgLIEquYda/iHADlBrn9sMQy1Y+aASRkipOQtU3GsUjaiYa00nVYVQCgjD47jJ0jv+1jXdC8erwk7wBo2SXFN5Ux/fdsTl0y2pPe95TGSRQ2J/FO6H419vYBKjP3WuC5OP8xtqJ6OmqQz/37hReEGp9+B4kGlRRUFaK8+EGEzDBwi1JqCtc88H1WXFzKBYaIg9Nrj/1p1l6GkvMib/EBhYpP/FrtdpZAJdRzho2BQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(13003099007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IungOQzrb0yUlhdVPOgyKYB4a250yuJlJPLrb6DdfB0+G2j5okENbzEMdelc16pKJf3650xAcxWjJI/HI5Ihrf0J40GnUzfT+Y00NIA3GZ295eNjafxBxEY/etb0bz8rDmz4LDSzL5k6DlB6SsoXff79tb28txbcY8nwrqIwyRvWhsdlb90HWhS0nhxbLyOoS+tBTuWGixTNUstabw/Ob7Fg7MFPK/uDGT3MyiW2gKT/u8JKGiw3P0rWtJpD39rqlMBvMVejoVi8Tgn6veKqvGXr+v1GK1/DrMRhXaDfPsVwYQ26RQf6iqaGsfssOzcalSzcg3LCwdlzWOkwgmKa7IwhCDeTBKTPXPSK/uZBdWcmwKySyMVAIOCxOmZ/0oMRd7Xlgn8yk2c/qbQ/RRA9uwauZbHiGQhWC7XgCm2p0lTmL2kGIkzCJ/DwgJRwxBdW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:25:29.1673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5a3503-fceb-4f40-b4a5-08def4a07ed3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_092552_169083_05102946 
X-CRM114-Status: GOOD (  10.50  )
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

Register the OF PHY provider only after saved_regs allocation and
runtime PM setup complete successfully. Publishing the provider
mid-probe allowed concurrent consumers to obtain a phy via xpsgtr_xlate()
while probe could still fail, leaving them with references into driver
state that devres would free on the error path.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260720155732.9DA581F000E9@smtp.kernel.org
Fixes: b3db66f62446 ("phy: xilinx: add runtime PM support")
Fixes: 5af9b304bc60 ("phy: xilinx: phy-zynqmp: Fix SGMII linkup failure on resume")
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/phy/xilinx/phy-zynqmp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index 240626b55475..8930cbe24b5a 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -1060,13 +1060,6 @@ static int xpsgtr_probe(struct platform_device *pdev)
 					    xpsgtr_status_read);
 	}
 
-	/* Register the PHY provider. */
-	provider = devm_of_phy_provider_register(&pdev->dev, xpsgtr_xlate);
-	if (IS_ERR(provider)) {
-		dev_err(&pdev->dev, "registering provider failed\n");
-		return PTR_ERR(provider);
-	}
-
 	gtr_dev->saved_regs = devm_kmalloc(gtr_dev->dev,
 					   sizeof(save_reg_address),
 					   GFP_KERNEL);
@@ -1082,6 +1075,14 @@ static int xpsgtr_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	provider = devm_of_phy_provider_register(&pdev->dev, xpsgtr_xlate);
+	if (IS_ERR(provider)) {
+		dev_err(&pdev->dev, "registering provider failed\n");
+		pm_runtime_put(gtr_dev->dev);
+		pm_runtime_disable(gtr_dev->dev);
+		return PTR_ERR(provider);
+	}
+
 	return 0;
 }
 

base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
-- 
2.44.4


