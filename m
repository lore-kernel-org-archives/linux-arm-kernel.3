Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B03C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSUdjl5EXNDym82PgyD7h9M797SOcfASzVlTsty4UlM=; b=RDYFgqGOu26affWnI7bKxlFTaE
	CM1yTZrZtXy4cQUGtofHwOU0AllwKoppqyaxa9M7kukDGOBydIr18YdGvsyN44Gym7GvyTm20VRha
	6JKmVYCzyszbqiRc92WIVEaeRkj1CH2dbRQXQKze+kzpOCw/a9LGHbSdeSsHJQNqWvdYBU7XSoyic
	Kcn89ZIRgKubd1QoNy0fZEuGTgqhlCDlhvbsr/Ne1KWbkxLRbuHTF3lKeKO+KDfYMqapZpL5SqCJQ
	sIi0P9qTSdkJfHUPe06OnnZORT9OgVvcr3h89Pbw/ppKe2hEKLrDad2xXOt/kzkqT8slggOhm+oM1
	N2SnbmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmiH-000000026Jk-40XK;
	Thu, 09 Jul 2026 11:14:41 +0000
Received: from mail-westus3azon11010027.outbound.protection.outlook.com ([52.101.201.27] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmiA-000000026Co-2uP0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfTp9CRts5K8AflkIoau1EquPOZv4RWcaels8JcXgBH5ug5bDtiTn+yz62jbRNhaINhk6SldhIzHu5VlQ2L3E3JfQMiuxpO2nL1wFEhTenxI+1xU/bVCP/sHVEdsWpbzEasokeSQNUH05TY4DDFV+F5Zyy9lxyFI72CuQiceurxxRZEC/gEDs+4BZOhW3DGueyxmxGZpQXEhe+quFytxBZVAC6Uowtkt0HVRLijqsBmsn1fCroXPBHg40VWjVeBOJLZbL2Lfv/dhFxOzIdlS6acycsPZWPihWvqKqmeZcgAAAFtOVCFBR/hs/gTMtaQ7fXk6j7C3I77LpOVznlpiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSUdjl5EXNDym82PgyD7h9M797SOcfASzVlTsty4UlM=;
 b=XyXHWOWz4rUbuT3z649QSiYLtKs/XBR0ZfDa7BqelNIJU34pssExqYkMb6izK/6Sx2Z/Ou71dsQT219BN8eZWdj+ybxgFYv+KARl51RX+Ubs1Ig+2HB3pxssXrJZVeIaKwBvpGLeJOtZKLN6Ho87Ai/hKPwZaH5EAJfNdxUZa5EzKfRBGD695/vQ95xs6wzuw9dDlWil4GcNYSmsC93YJSakH4j0Q+1R13a9NsnRkF4lkay0fcC0a+cIECdMwAShOk0rxzBstLoOhBchUEPP/GJWMk5oOFuXysjXjXw+Y6sdk8xQyQY5a2Om82hpQPmLudX+BH7jJ9HKxC8vAktu7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSUdjl5EXNDym82PgyD7h9M797SOcfASzVlTsty4UlM=;
 b=QxJGgCk4mmeq7Lq90rVMEKy/guDYPZ/6Fto2v2bshZoZsEMlA7LPnx9DtgyBhQjMqt/IVGNLBz0/f3ZJLKE50GsZPiYm/ATzY39bE6A6v9GPZs4W1+Khtd/pQ7mz/gCkUh3l0ulWQ3lmStfkilI7vOvsz6PVU1pANLiTHYunlGQ=
Received: from SJ0PR05CA0062.namprd05.prod.outlook.com (2603:10b6:a03:332::7)
 by CYXPR12MB9444.namprd12.prod.outlook.com (2603:10b6:930:d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 11:14:30 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::57) by SJ0PR05CA0062.outlook.office365.com
 (2603:10b6:a03:332::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 11:14:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:28 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:25 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 6/8] clk: clocking-wizard: Use dev_err_probe() when mapping registers
Date: Thu, 9 Jul 2026 16:44:01 +0530
Message-ID: <20260709111403.1579159-7-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|CYXPR12MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a30145-47d1-4374-b64e-08deddab3f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 6Ty1e4sptbdEMBY0k/j2KIb65VLji4/qLR2PaYpNdr1hbQJ+dBLkjFWCCpzlbbAZ3/RWSzD9na1GmE6Y8Q8UwYzBltDe45snt0PNfzGg6sj0Y0r1F1JHBfbWpKQVM1lN6ONLAwpRsefTda9X54gKyEGVrCqGggCZXcmXFey8ghIbvu/t1XlOyQEhyj03Fsa53tEQBpiKrxWCAKTHvkhousoYyA2neqfiJAYO3kY+33DYtDO94UVZhGe51noljYQ9R9cveKlbAfHJQ99dJFHuNMqZ5EXKOk90ITD5MKcz326CT4HQ4A/cTFfyy1TLiiiMLHmqQTdyC1xyOyL2aZkRuaxGeSki2GTFwjXIWOLZZrbRtUA5ZD0dQViLYavCuhDLe+pfqJabJXwFrt+MNKyGyT8t9yXd0Y+zi1ZaVVjxeID/AufS8+FSJsYgOyV2sjHs0KlmQqZIZJiQOWyIlln1j6M984pJCdwz68/C8Ef1+OsZGO/cwPEJVNHcd1F3PbqGtUsu0OnSYL/wsqJYME/Mbw2dovcirpc/fP+ViqIJUxIXU9BEETjeo3wAHxWh29credP2BU0MyI99aGxCZeM8leObUK7TqCJIw+VzjgvcsSvH2GAChuiw73gM6eowdijVEcGc0zuiPPCCrSWMP0OutVD3kW8loE4s9pBN7LIrdE2bsjhSzmx8LI6Cd6sZ5+xY3rp/ku9feSIPJha3gKbg8w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uj5RoYSaVI0o0OHAnHJapPhxO4IzVFxi9ab/Wh6EKZI2oOVtb5ERADpqdDlBOTlCn0VKuxFCDSGqyuJvei+ULn9ENKan6OGJfBi7BFZ3poxpovlICRGIOnh1xza5VZWnMW40XwHuZjXbdpcv8/HqUw6RHt6vFTFRqbwvleQmoYGMwsXaEcHIa+pq/T5lEYcwJNctXe25zdVcoaR8rzEnmKDDo6wA9fZwoFoLNZ4BTGA6RNT562F6vSTGSUB/EIHBeoJ1bqUpvNtFAHaVw7bWOtTZ7FOpu0lXgHZpxeu+/is7KogDAdBxp6yJPnJ5+UdxgN3NMZFan0pti8VJx363UvLRGYp1AVyao2cawlybygFelg9AYYp8yl0+Uxvgn2tZO8la9KJ5LHfJtykI8bnwGPDF8xHaJfL+8qkGQjuji8E0HGr+Gd+S4tm4opdqcKo8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:30.4756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a30145-47d1-4374-b64e-08deddab3f5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9444
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041434_735220_787E1682 
X-CRM114-Status: GOOD (  11.79  )
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

Align the devm_platform_ioremap_resource() error path with clk_in1 and
s_axi_aclk handling for consistent logging and deferred-probe behavior.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index fe73ee02b54e..381e396aef0e 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1277,7 +1277,8 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
-			return PTR_ERR(clk_wzrd->base);
+			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->base),
+					     "failed to map registers\n");
 
 		ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
 		if (!ret) {
-- 
2.34.1


