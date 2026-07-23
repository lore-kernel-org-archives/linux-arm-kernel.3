Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2CAC531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7Ro4rtkHhKek+O7kz9VOvZAHsSx+xr2WyaK4v6vnKk=; b=tq1LKwOpHWm1BwKXLXznTB1aPP
	5WdWZqk7yJEQJOt+3c8R6vM9neXEEZF6waOgcNB4V7EasP50VNxYiWuMHH+sU3qViD2TUmr84iXcG
	L+icZe92KjHxcShdGQXozH8FHCiEtBOK+6MNdcv8AVf6dzKRjAHU30PzGTpAFXS4/k3ejBjs1O3H9
	xovmnmkbTgpP9eRdg1kFodtacDEd+WNLPGWnCHehMpIetsRQWW1DSZc9jM9TMmDK9bkvoRiosRtLx
	YjN1xEwpeLKbnl5tXXyEbJQy655BY+q3OsrUCnDwt6x39OWli4IZlBCWZk+4lMNFmRtXdfLgMjsL+
	14Iw2GtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmssp-0000000EGwh-4AoT;
	Thu, 23 Jul 2026 12:50:39 +0000
Received: from mail-eastus2azon11011035.outbound.protection.outlook.com ([52.101.57.35] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmssk-0000000EGtg-3oue
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=II+IXbsMML/GUERwh7ZrDuaWpK/iluBaoEmEUKix8RkOrMBPZ0k5gT1kz7zAYtLRoSbwbwkxpSrnvFyMyzvaMtIboPH3dkuqP3uoA59P3/O5rjggJJIJAyr43rYbQuiWQ+NG0JeM23Gg6/ydsZaSXhWfE9EeTjF9HQaoKkHNca/frPdO/yHsyDJpCZ6WsY06xbihSPVDGOhcdyxfA2RPxzTLnFmSl/u7CVGO6mOL0BOt29caynkFK9Aa5saCwXG2MtZEYxSb859JMbfjnchvHJQsZJnBmZzh7Nnb7D/mS8BPimoGWUnaIPiaaxNU0QMP3K6SzalWkCbSH5k5cqg+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7Ro4rtkHhKek+O7kz9VOvZAHsSx+xr2WyaK4v6vnKk=;
 b=ne4RlPrW6+fDMMEwud1K7+9Rs3HoqQ0zpJ0ttthuC6li5e7MClShv6cbKGw9hYsTbYIhBNvJMYtGIGfLU4H+pDgMrn3NH17LqMQJcrEtAgWQxpVwagFBlD3Sv+KHoh3O0BhLl52kV5OAOtEaxKGA+A1cfyY2j3dAMGJ9/LUhLu8m1/SZTnkICcg57tyzEYvAFd3Jn0H7ooHR8teI5CGub2On+7eympl9wZtstX9zvIuLzeq0YnA63fmpyhMEgEgvYNDny1TXF/WpPAIx2hHidrMxaIpj6ER0OVHt67sFaLkA+emeFZmxRy25WpzVUBaaegFsxT1tPQJYi54fOHgJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7Ro4rtkHhKek+O7kz9VOvZAHsSx+xr2WyaK4v6vnKk=;
 b=s0Ic1dSB4tbYE9hf2MlDVS+P38/09/MTZSnthSYrBr/3oLUx9FWi3FsSXYfL5FHLwMU3YLzyZ3AIzibM8RwlvGIU6DtxpPEre7txbN3gZx+LYWUMJTTygZwP+E4y5Jj5SpuWIYeAdu22lfRMzI9DaY/Et8kMELII7DwKmsRh930=
Received: from SJ0PR05CA0108.namprd05.prod.outlook.com (2603:10b6:a03:334::23)
 by DS4PR12MB9563.namprd12.prod.outlook.com (2603:10b6:8:282::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 12:50:28 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::84) by SJ0PR05CA0108.outlook.office365.com
 (2603:10b6:a03:334::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.4 via Frontend Transport; Thu, 23
 Jul 2026 12:50:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 12:50:27 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 07:50:14 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <git@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 4/4] firmware: xilinx: Use TF-A feature check for TF-A specific APIs
Date: Thu, 23 Jul 2026 05:48:41 -0700
Message-ID: <20260723124841.2567827-5-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|DS4PR12MB9563:EE_
X-MS-Office365-Filtering-Correlation-Id: e4cc1929-4dc5-4c61-1251-08dee8b8f8ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Xd2XASZPscC/A/5MotGgKKDTduR7MCwp7+e2kNaMyrzZ7uE46lEounHdEJgnW3u2qLIk7deA7A/WD2GZWtDCcfDhgkCSU0g6uz1wH1R/Oq6uQqjXPV0H9f8Fohividbo5dZfwFafnO+s6M945OZ3CZlnbbrpSiG574Ii5RUWkLD3zCXE8If6u/k9s2sfBJNqB9aYdGQvVHT8CgrW/JAel7jgD4V6dNPjKyY+3iim2CNx5Fu7HKfhfX9M+UvOFPxIYDFHndNEhwxZeBQVdKabvcPX9DJQhA8X4iHx3H8wbG2m3DWeC5KdVNbhEgm79HSZQPFBrzjCUrqrk24tqiPdUZ53ijbzld0xDUDVdKAAjpY+3nCMOfXyvmcIsaW3QUL1vvyWBpNio5o+bpe2wkwW5MyFsbz9EPJMNZL8LIVQsR0d8zAj0UAvBZ3omsDRJfom4bcWgDeU6qlYem8qqOPiCS3FYl33iOibi7YrWuufaCwixUXZHNl5aWMuQK15Rapzj0woyz4Atbog7HkexI8937NserdzvLm4iI4KaWziCzLNxYOh0LiSvKKIWKzwrOCHRAJzePm+Q2qFRJG8UDVnsV1oUW1vwy6QsD/OpofqUlAvPClR1Ex5Rh18SaV14uN4spQMrpj59a5WBYwUQlU0rFDj/aWHSQ0dsSnOzd6JxCRKcTe/2pwXXgi3h/Pvq1bNk5jN4R2GCV52Q/K5RZdRxg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AUX3TmYrLeoF1xuEiZbu1K0zhiNWpGwc80X2G7OHvkn+VamFiSSxbrDZtQW0VCdmwUkfLFOu1paqjECvpSfkDZ5qcQiIklFEajJgQsc0kiIsdEikLxI2No1Opb0krJdB2ALZQ9aZsw73j7MbvhdRtgmuS2N5YhGM9Uh2vta8Uke0T/+/LBgexVsLQqKAq8S0nZ8zniHM1LKo9d4SxAClvVryBlXWMF8+01ctLeAbD2duLDw0JXo9VuOuaGjuEQ/+65DJUQeF3N3laAixOWyhOtHE8HA26YetZ/NIG77NKYUqf4lM3yZb/SXDrAry8KFIHtluJqxqOYeN9WJ+di0rcZH1ojDzD1zZNEaAZZBtVXgPwU0y1lDJxwRehGUcjBaVgOmnYec0C2FClyKk1asjTDTe0xmrp7gcpSXRkDVdr0NIlFduEzVaHHGmS7M14lsI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:50:27.9869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cc1929-4dc5-4c61-1251-08dee8b8f8ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055034_996552_7ED89942 
X-CRM114-Status: GOOD (  17.70  )
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

Currently, TF-A-specific APIs are validated using the firmware
PM_FEATURE_CHECK API, even though TF-A provides a dedicated mechanism via
PM_API_FEATURES API. Ideally it should use the TF-A feature check
(PM_API_FEATURES) for TF-A specific APIs. Update the feature check logic
for TF-A specific API calls to ensure it is validated using
PM_API_FEATURES. If this check fails, fall back to the legacy
PM_FEATURE_CHECK to support backward compatibility.

When do_fw_call() fails, propagate the errno from zynqmp_pm_ret_code()
instead of always returning -EOPNOTSUPP. This applies to every module ID,
not only TF-A, because the rewrite sat in the common failure path.
Existing callers only test ret < 0 and are unchanged.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index fc7212f554ee..0b6c20a1d8be 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -224,34 +224,37 @@ static int __do_feature_check_call(const u32 api_id, u32 *ret_payload)
 	module_id = FIELD_GET(MODULE_ID_MASK, api_id);
 
 	/*
-	 * Feature check of APIs belonging to PM, XSEM, and TF-A are handled by calling
+	 * Feature check of APIs belonging to PM and XSEM are handled by calling
 	 * PM_FEATURE_CHECK API. For other modules, call PM_API_FEATURES API.
 	 */
-	if (module_id == PM_MODULE_ID || module_id == XSEM_MODULE_ID || module_id == TF_A_MODULE_ID)
+	if (module_id == PM_MODULE_ID || module_id == XSEM_MODULE_ID)
 		feature_check_api_id = PM_FEATURE_CHECK;
 	else
 		feature_check_api_id = PM_API_FEATURES;
 
-	/*
-	 * Feature check of TF-A APIs is done in the TF-A layer and it expects for
-	 * MODULE_ID_MASK bits of SMC's arg[0] to be the same as PM_MODULE_ID.
-	 */
-	if (module_id == TF_A_MODULE_ID) {
-		module_id = PM_MODULE_ID;
+	if (module_id == TF_A_MODULE_ID)
 		smc_arg[1] = api_id;
-	} else {
+	else
 		smc_arg[1] = (api_id & API_ID_MASK);
-	}
 
 	smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, module_id) | feature_check_api_id;
 
 	ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
+
+	/*
+	 * For TF-A APIs, if the feature check with PM_API_FEATURES fails,
+	 * retry with the legacy PM_FEATURE_CHECK for backward compatibility.
+	 */
+	if (module_id == TF_A_MODULE_ID && ret) {
+		smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, PM_MODULE_ID) |
+			     PM_FEATURE_CHECK;
+		ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
+	}
+
 	if (ret)
-		ret = -EOPNOTSUPP;
-	else
-		ret = ret_payload[1];
+		return ret;
 
-	return ret;
+	return ret_payload[1];
 }
 
 static int do_feature_check_call(const u32 api_id)
-- 
2.34.1


