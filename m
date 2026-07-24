Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F25C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9m2oq7Ohb1RzhJOs3wMnvSXhOf+40I8HHQPcShy+v+U=; b=vpbw0sKlS+Z1Mk2yTloYBPtlN4
	uFy2QC+UZZcPee/Q5z9A/8DSS9yiVw60SwNn4oaxHVzVH4aJBebsMlkBrGnc+AVfhVyJFrUj3j3gl
	43DArUClfNDd1DZ/i39nuFRSett+l9mE+FcqOcVMMImsPe3pXZJaWRHk7hNDzoj2W8ogqwpVbEwz5
	6cJnswXSpKiHaZJyIgWRKMwW/VZF3E/Oy4zJecruEkZtNkCgkQGY9vM4UT2Y3NMgj5JaB3J76cARU
	jhh5QsRBPkRW5ClnfIEZn5qPkzGqqtsjlTogAlc4DCQCmDcvpGRkyaJ/OVvwh9xwQFQrPXTFvBAhA
	02gPtHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCbq-0000000G0zo-3kMH;
	Fri, 24 Jul 2026 09:54:26 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCbj-0000000G0vm-0mco
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMlxP/Ll7+4YCJuNxWdpg3vgJlrTsgTkW2wbuVD65HgbFEfgNH5Xu3gbp40t/O5BARYIKjKBjhbszUobvrd7vLeJXNpXEANXRauA+Lxbv+D9K9yp8JLGTDF1TlSkqiJqxZiVBL1SHKBWdWXQTtxoLpV1oJVQDnB9Qj9i+5qcWhVTOVACzBRXXdAqgg8yxfkMZeH2Ytk70RoUP83HGFYjPyUwMp3TRF7lrrxF/3czO1K+ReZ4yl4iCPE8Y5X90u3etoPd1OfD/rg1cytiNswu7p5q5c5ukjKuOoPEAH9fAEJV+UEENC9OFQ673i0TGXC8SYOs3iJtLhLQY34fhz1Ivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9m2oq7Ohb1RzhJOs3wMnvSXhOf+40I8HHQPcShy+v+U=;
 b=HFID6e0JOvOk6usOuvKIE8X9aQ9k03HyTtA1KodPMLVWLOnRXqdvPOVLYC68uaoEllF56RM2LX9jkr/AHwwd6+BB4s9yRDjIsIlZ2mgyKPhioqh2CsAbMMboZ3uUcUK1i/tHQFSVCxUBG2EOdDAfZC60tgUOgOPZcl8LgDHOsT3RDN2GvRV0riL2BgrwD+B5k7EETuMKYCdB9Xe3d/3tZGxWAOioAQeNzcxlLGjF6n7R9DQBpPYXk+1cc38AORaV87cHSFLvwqATpS8js4ZrryIgrrMfYEiN7nglMqRPLkItu8jQ6VFS/vPQHeqapf4INmGS4a9K1Q2ZYl5SxjdzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9m2oq7Ohb1RzhJOs3wMnvSXhOf+40I8HHQPcShy+v+U=;
 b=x8kdNDPXUWSjRzi6PZhpxD6y7iT94dutBRqnTG6+bYaRjsedp1zlmz0n4qYBYasNdv/jborWPP/2EyETga1kViLSK4gNuLTB+y9uXTQ9NxQYkJHxxFSFOPHAp6A1vLVArFWQOsj7poqfH6uwMovlUF92wztGGmGb8Z84fBMeF4s=
Received: from BN8PR04CA0051.namprd04.prod.outlook.com (2603:10b6:408:d4::25)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 09:54:12 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::a9) by BN8PR04CA0051.outlook.office365.com
 (2603:10b6:408:d4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 09:54:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 09:54:11 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 04:54:10 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ptsm@linux.microsoft.com>, <radhey.shyam.pandey@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH 1/2] firmware: xilinx: Use TF-A feature check for TF-A-specific APIs
Date: Fri, 24 Jul 2026 02:53:51 -0700
Message-ID: <20260724095352.2890326-2-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724095352.2890326-1-jay.buddhabhatti@amd.com>
References: <20260724095352.2890326-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa4c863-67af-439f-eb85-08dee969834d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LSc4dPOeTKry8oItJ/DfaeXytc4eRpt3PR6z/qPGBee7xm9sG5GslFpWLpQVZJ1Opwo7YRCQvgTZIbnppbsFoYjKGvhtMMRN/RTH2Vp4FL15x3VQeQVtE610H/CoiOENhmddCC9tNOqc78kFZ3Jr53vDWMb12d2iWARRwm+/UUnI3Riv0xz99gKEaWkm1Sh6+O7cDBcyJncddEMK5rJe1aTRUCAokSM2bKvYXxnbsGT04HxqcOWkc8dqOVhXPI7/a0Hp/BbzUM/E0XPMLCMD98+ZzGLdFD0o2p/FjABh4I9YRqFV+95lNVDwLmnEhCkw3nHqSF5u4pAYaX7qZ4HLipLBE5JRmc4EqoHMfpsHNWHd5QMyFoU1kDOyntBaXCFCDFcfhVJ4YL4tRdMvj3tZ864oMQaetd7m9BVt4eKft/OtiENmc16q9YuL4L3QvSoO2bzRYVFIe0O3WTJrpfyNdjcBO43c1/WJBwq3O4R1vnNAKqEftHblX0Y339uFsUSruwbj1cPcyLl3ccdLqzjn4mylVnaMOIweG82XVdL0+VFwFMAu0nzG+QwX+ewzeLoPZWZl2iJ1WSldigawHZbV/QaqvBdE1/1wP8C0e/9fAnFwQGnYxccFyh9O8u/z0NhDStIuDLF7VsEF8SYbaZBSlvlkcSa9fVeqaDLOmngMfep4QWk4WEzFjv5U7cUMVv39NCxaGE25jvm67EH6l8/VvQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x8QvFvV7cWGMVw28oZg1z7v20oDVKlT/nwEiJ8aSrxoKnkC25A/zofwNG3mPGgUsT4lxKk0Ly7S3SDTUlItlor+YdAiUxRlmfFuDcDhQhwiiH98y/yf5Pj8dgmlfSwZ1vi+nl3bEe6GnaHbqQFhMAscqDyDMKgjWbUIhjDd46y24Qi95bQrrqt3bdQMus7Td2mKIOEQ3ovh8WBKuVQ0sDkUTBk2vwc+pkgIXzOY9XqNADxOVI9YF1FWI8qL6aoQAsZcI4VnUwwR340qETT8CRgcciIRdDWWQtHhMQuTsxNOd4I45FIjQw7NZ01ukFHe0zA3AaIU9JdMkHHA/fga+9KA96BfPitxOrElXMXJmkpt8QuHaH5MDNT0qLQDhJ5gQR4nD9iWfNiOKrEFmURijvnlj7kyUVN1XiXvnxzlTnat0koLivz2od6OvUTy4XQ3K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:54:11.6513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa4c863-67af-439f-eb85-08dee969834d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_025419_251254_E500913E 
X-CRM114-Status: GOOD (  15.42  )
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
PM_FEATURE_CHECK API, even though TF-A provides a dedicated mechanism
via PM_API_FEATURES API. Update the feature check logic for TF-A-specific
API calls to use PM_API_FEATURES. If this check fails, fall back to the
legacy PM_FEATURE_CHECK to support backward compatibility.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/firmware/xilinx/zynqmp.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index fc7212f554ee..95f5941c5ca8 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -224,28 +224,33 @@ static int __do_feature_check_call(const u32 api_id, u32 *ret_payload)
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
 		ret = -EOPNOTSUPP;
 	else
-- 
2.34.1


