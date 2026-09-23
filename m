Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1925CC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WTxfCVCZN/a6wd9MlF858+8dFLDmzinP5igawoPY6is=; b=PsKD1PCiho4rPTElF3Zcm8ytz8
	2PflGjl0qA44yBX5exOqeSNGA729392/NoXxYJZuU22X4UfKOC8ejn7xHRRlXyTGzETFgn1JFqsHv
	Y35JJMwPZpl5cdmbeK0OZyqrW3rzHrBGoN/jj2YrcZAqGmmqWM4zI060yHHCWhfA09sFLXOf0fmBG
	2eKTJ3S8MxO/HLlWgYwf/6HVFfVwMYl8W96J5t6P6mRCghdogs0LEcEk8khus8AR1m9rOr96zvTgF
	Y2NvrJlJkblXg3u6/zQs89YlxrGhLu+954PR1Ht5Sc2Y9H3GOFeBaqruNVXp7Zcd22bGfuCUC6KBR
	Ox8iK4dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jpz-00000007qHN-0rEA;
	Wed, 23 Sep 2026 10:04:27 +0000
Received: from mail-westus3azon11010023.outbound.protection.outlook.com ([52.101.201.23] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jpw-00000007qGd-17jk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:04:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ac4n57MDrCmxy0HAC/HW9tYRh0n1pebca5lsVT18OyRGAT4hV7cv1iS2qXSmM0ZQgGH7Pw/oVHjdjI9OV1+f4lEk4CuVR2DSKx2tzJiuAm/ALG/0UGYzb5U2F+7gJCmXIw/qjqOboQx8chyW8it+7iOH2SkQ3qU3kKd7TPLc3GDgrrDazhXZBFiEpyaQeqrSIvMc18/hY/kNUaf15az9VsKcLgZ/2T2IYMFNie7yezG/zNqvtXNZxraEr8Ugjy3+OU7zicMgjcpJz7NiUB+Y2OrQrktTtAvMlwNDjxT6FSt1MEibgqCa6D0E0T4J2NCjEaP2H6602Oxq5ifhU1tTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTxfCVCZN/a6wd9MlF858+8dFLDmzinP5igawoPY6is=;
 b=WnfBrNYkW/295VTx5ZdMoUPiO46gr3mI/W7n7UyLYbtGkPDDyIMf9dNIh/cbhL8YMxPdFbFvPMb35EAftuIes/me4+JcHjzCvZyvJAXpIScGSyKOpv2eYjyNrSwAZIKD2AmAfvnzQpEFGCgf4Pj7pKqPPW+J2f2GACOmsmk9qejyAjskiPGAr8Z14Y1QU23+lWxd3RbR8ur30wrSCq1yI0fulXxOcagOF7tAmFCl7b2ZWBVdt3kbeXiXBh0M+Q+ds6vj4obrd01SLzXPy47k6JiczUtDXF2jpkYTLDDeXOeJL/fkamqEVPVIEi+fIYbhSOg8tSigYn5VM4Aiwg1RKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTxfCVCZN/a6wd9MlF858+8dFLDmzinP5igawoPY6is=;
 b=mPzDdjFLdQOcRFhOtBEeJaV5DTTb7XKcjpxyfYknii26+RcZafQmq/CxNhT+jOaMwwTIfSdocwwLCIDcB2Whr3oFNe3iK+xCJD+4aVlK8qOZlxAEibtz6+cTf5e0dNOYdQKhoiH1wRrdcxkj80WF/YfG8WHwqoIO/9OWFzD66w8=
Received: from BL1PR13CA0076.namprd13.prod.outlook.com (2603:10b6:208:2b8::21)
 by BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:04:14 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:2b8:cafe::2a) by BL1PR13CA0076.outlook.office365.com
 (2603:10b6:208:2b8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 10:04:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Wed, 23 Sep 2026 10:04:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 05:04:14 -0500
Received: from xhdjbuddhab40x.xilinx.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 05:04:10 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <git@amd.com>,
	<linux-kernel@vger.kernel.org>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH] firmware: xilinx: Request pre-allocated peripheral nodes after bulk release
Date: Wed, 23 Sep 2026 15:33:43 +0530
Message-ID: <20260923100343.3147243-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|BL3PR12MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: aef4921d-e52b-4daa-64b7-08df195a05da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: zOSouMf5wfXLha0VJJ/okDZJyaQ9AKZbSQS5b/n5ARImFV1+AtGq58K6PpxklOIZP0HN3IEsl+8iQEFe1359K3aAxZrWDeYKyr51kWSgZZ4gZKZHhpI1f1Zll6b+PY+3mEhveocxN/a2M9ofgM7fI5V+ozkrU8Lz/g9NjabsRB07vZF0VRRcUqfgHZD+RUpePXlqOkcrSL4CjNWesFDJWXIxsID1VgA3f/pAvpWZ1bOXHhRnZCFZsgnvnHEuoVd9TzAQThIJLScveTHemsIcyknW3zT4c7pen/HsR9UPnGTeB3HgSAhwaY6Bv8lGboKngQOaDQ04vDWuc5+i6UOFGUIMV8XnEPQPZMoDniXqmuXz4JOGcaPIGIBYlvGkZwnjtGYCrIUdQB47xcDk8YOfDv0kBXd4DYeoHPEpRTUfCDDFCS5+5Q/88kRfRwl8JnzY/6GAs2yFWCWVF17CgArkjaWRZfwlvZ+UBqS9x9A8X+RPfcNmyVWfPSnfXCWK5NW89DIK94xhSxG3CNchlrRyKPeqytX8UwzQI3VF+OmssdjjxlBk0hntV0MSQNj+HPIMQLbV7AbtpLJWP/O6R46rTFvCCMpgASm+UV/UNmRmS1XmpW+SjmBqZ2ta+u97PgSJzuwcefpFGMrz51UAxLSxSmUuJA2pLrWHTWYQXnWrK7wLM873EBe/4Ywin3z8Q09kqNT9Zb2RYSPF2bl77HzrmQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: siQvxk24Dl4HtsrD15bWJaFoUKdfSCAXojG07dqIlnRTaHc4suhWdkkgTLDaiGj4iwZy4NpeEIYMvRvpoahebi6xReUdTQa9aEc23KJUyELYB0vyff0jgBFlufvx+3Oo1/EIpRe8RXAgJ7SBg+YonwnBqYiozRTmMLE68W/D6LBhdYpPqcHgO244xKkTUaBUL3BWw3anAot0ouu+exPiCWRb6vKaZVG8doVt/dGb632kD2tq+zH8a2koClW7ozgjBmR4iBgH00SfiRmnFHnEx9nt4Md5LM+IikMBSk0LlkVR3fbyR2PWEieXIT/NJ3Oc0aSA4sw86oFuBIq9bOHpnytyCikZQ6ImcxtrgaY79UfB9EHNtskPopZNzhlzNWktFfDEsVjNsud54/xWSIUMqDgJLSEp+USv1OlkS+mlkRYzj1CAIjwhOhKvpZY1XMqc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:04:14.5424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aef4921d-e52b-4daa-64b7-08df195a05da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6619
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_030424_311961_9DC3B669 
X-CRM114-Status: GOOD (  17.43  )
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

During a kexec restart, zynqmp_clear_pm_state() releases all peripheral
devices via PM_DEV_ALL_PERIPH. Pre-allocated nodes are then left released,
so Linux no longer owns them and later peripheral access can fail.

Immediately re-request those nodes with zynqmp_pm_request_node(
PM_DEV_ALL_PERIPH, ...) so Linux retains ownership. On a graceful kexec
this runs from zynqmp_firmware_shutdown(). On a crash kernel restart it
runs from zynqmp_firmware_probe() in the reloaded kernel.

The bulk request depends on firmware support for PM_DEV_ALL_PERIPH
(PM_REQUEST_NODE feature check version >= PM_API_VERSION_3). On firmware
that does not implement it, the request is skipped and a warning is
logged. Errors are already logged inside zynqmp_clear_pm_state() and
zynqmp_firmware_probe() does not abort if the request fails.

Also, drop the redundant ret = 0 assignments whose value is overwritten
by the next do_feature_check_call()

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index fe650747ac91..96dbb23eb673 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2193,7 +2193,6 @@ static int zynqmp_clear_pm_state(struct device *dev)
 					"Failed to clear EL3 PM subsystem state: %d\n", ret);
 		} else {
 			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported by EL3 firmware: %d\n", ret);
-			ret = 0;
 		}
 
 		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
@@ -2206,7 +2205,19 @@ static int zynqmp_clear_pm_state(struct device *dev)
 		} else {
 			dev_warn(dev,
 				 "Bulk device release is not supported by firmware: %d\n", ret);
-			ret = 0;
+		}
+
+		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
+		ret = do_feature_check_call(PM_REQUEST_NODE);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
+			/* Attempt to request all nodes via firmware */
+			ret = zynqmp_pm_request_node(PM_DEV_ALL_PERIPH, 0, 0, 0);
+			if (ret)
+				dev_err(dev, "Failed to request all peripheral devices: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "Firmware doesn't support request all peripheral devices at once: %d\n",
+				 ret);
 		}
 
 		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */
-- 
2.54.0


