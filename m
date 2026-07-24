Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4813BC53209
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH1/Hr7l5eO8f8631dkBZUk6vL5wKe96/qcNrf/7kmQ=; b=HtjVPEXGommOrRkFwwPDl4nNMh
	Vo4hpMvzlD4m1zPhcuRKBuZfQkW+11okvwlhLrKlNtwTN1HoZUvkFlUYopKseQRrT6ws1mNsX2bn7
	NPZyZFP/BdIHpkDpNQRXDik2wLlmunUhN0V4fO5HReIUkcPa/zj4Jw9VtEGK18LXRA7JW0b3TfsR2
	pUeJwFFSOVRurDdR++92mGq6QRtxBmPXUL1LnTAJl1v2zX1Y9oMjBD4SLH28el/Ayb0Ym2tfrfMy9
	6RKcydAXBP05JtD2P76aw7wfZa/gQh2AcKBbTAWdAVsxsUioUNoYDst9HHKJlGX6oCl3D/aL4dbDK
	I464+KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCb5-0000000G0g9-3sOS;
	Fri, 24 Jul 2026 09:53:39 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCax-0000000G0cr-0fn5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:53:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXAzm4k/0V5r4WoRIP5biTgXLG4IL22jUNfpmZH7/RUauUIcLtEZ0DY8NGjLPDhTVP2ExDfILA4WMamnmQfUKcaPHI44UnNfbZunwtCoFtZfoSI9JmyWpYfJLE0l/HV708XxGmYLUY3zAvAEPVfI8Ccn6qHLw+8edHdAcwo1j/qM2BkQZJhMiiAxJisyuzfeX3ujosuH1Jhs0+mP5L/VDaWlPQnvOIM/z5XN+ngNN39AnoZ8wRpAvExDwzreObDhm5Q4ez3HQ6vSqxLbCxTAE/Pgj5Nrrq72zzTVB6puD9GLVSQvVv+SJxtoxynqquk0tyipLFImt2toFmZOYlcdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JH1/Hr7l5eO8f8631dkBZUk6vL5wKe96/qcNrf/7kmQ=;
 b=i8/9wzLanWH4DDgUqO/wzIOBBWs+5qBl3yJqlNa6EX5DPBg3MUpKYuLYUZpGXZ8CIMg/jMc1BVcHBRRAcr2BCrl0Gi/aM+NhEKIFpLdG+vpgNOb0XvPSb3T8ryGsCyRU5oUsHrdhva0s/8QclmZF2zwp5gymXLAWp+Spy0ZkmLPKPK6oYvhuexLC7GiIBrGpnXDd+STVZTpqShDLvUUKEQtm75h1Vh2LwQHrXkwbHHxk+iYDiz6oUjwp1JX8sKd5Nr1Sr4FssKrN3VpWIgyp4AX1q/7F70lwINw4Vtl35aHxoS9N73ABoFERJIqxGCvIALKkaztp55QgRZ28b8Z7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JH1/Hr7l5eO8f8631dkBZUk6vL5wKe96/qcNrf/7kmQ=;
 b=r8aoCObebuWDR0cBN/2dNrynYc42HCrUWKpoTx/MzCcF2qI2qU3+wG/HFsEtm7PMK5GQkMLhw1+7Sr2W0tS2+OkksedOsLMGoaHKar+JarxujDnPQcMbtTbnUIzci8nBaUh0M2P7uXyfCOrpmTgU1Q3TgbwrHNriO3U8FGwfJw4=
Received: from BN0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:408:141::33)
 by BN7PPF7C0ACC722.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 09:53:25 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::a2) by BN0PR07CA0024.outlook.office365.com
 (2603:10b6:408:141::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 09:53:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 09:53:25 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 04:53:24 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ptsm@linux.microsoft.com>, <radhey.shyam.pandey@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH v2 3/4] firmware: xilinx: Clear firmware notifiers across kexec transitions
Date: Fri, 24 Jul 2026 02:53:01 -0700
Message-ID: <20260724095301.2890001-4-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|BN7PPF7C0ACC722:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6cd7b5-f5f5-43f2-968d-08dee96967d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: imB8oLaCzNXDykHt/6KkOfAOM3TQ21O0PcK1hEZz7PLmjo0jQ7XEjTMozTlwqHsk/hb3lSdBsnFSdHeU7onZ6U3V4CPzwJj5CGVkltBZ2DyUsr7KXa64uSVx2Ym77lcOfT8pKV4t0qlfpY1wE4e5jv3U6LdcaAovEbNQLbNZwiiwaKpe94wk30V3rgg5x6IHo2GFQzjVohce5JrN9LIujGWlXzrRUum8mIo5hU6xb4g5pGbR6zKiAFuvVG5kxOpJPSqcCilHGbM1U198assCKkc557GtIZw0V7RRvyL0MoGcThUwd2WajAncjYP5LbYG5wrFaHII0hl4S3bvN8gYxBwy/C9wuBcQwrmRt3CUx2t7e67ESyeCSUiaMJDdbH3kWpS7WiPYjE4D8HmN2/hk+bgkg2LhC5wMchmG8DIowZ/Uvt6dpSbrXe5N29o9VCHg7u5fi2TsEF2ZHZ01TCW6Nmlc1MpXDIp1ib57HY781pmxiXDTqict4cLtEutse8bLOcyIY1gzGNsa7YgnfcmNeIno1gyQEyLzqhdPCq1gpk5x7p0JHVoNpXEAXik3E1oM7d346hk5gqdmDCxmpcERrtsnmt+aHC+Y/CTx+Se9QRg29CeyqBJiAdz09EbD78pYvNlJz/uWCaaILS7EAgXRTacJVLwvU36k7iUui3X5w07fAAUnnBdrJHvN5G2SPoYbZMKCChSfC18DcOau/xpD2g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uMhZzouZCHfLf9YgJKK6VjYDWbxUQzDnMg/nsXNhCGO157Ll7UFPcObBm02V3vHFgC8j/rV5v6k9OfvnVhmptaNPR7uFcjoDPZJhA1qK0wxD9gwLX8Bc2WiS4i9CeJ7wd/v6ufnJ/DdXpLm8Io0Dwr5EcIL3l3m5TnCiwg9T9uv5HO5fh7yeJcnp3NnfzaY46hvpnz9UjU79TzYqGhbH5g4kUvGshu5sducYDPJglvjzOVZk6gWyQE+B/4kRz4SDVQT/YDmYnErLsHhZ7PrIzMxTR/VfyGwZzo/FZyss6Ku+V5wXXTfzzytVDHQsdwfIxjEtmehAKEGWDCsxFjOjmhODICkiez6rgntNKEjulPoB8cj+JBzEoaLslumoSAQ+V0sJzuu3M7FXc4O8DBU8LiHYwXPzB0HkUlIb6GdrcaD5wzgvoGTXmXsfxNdFjKK7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:53:25.5393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6cd7b5-f5f5-43f2-968d-08dee96967d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF7C0ACC722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_025331_203097_026817D4 
X-CRM114-Status: GOOD (  17.28  )
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

During a kexec restart, only the kernel is reloaded but notifier callbacks
in firmware persist, causing state mismatches between kernel and firmware.

To address this, introduce PM_ALL_NOTIFIERS node ID to unregister all
notifier callbacks during kexec. On a graceful kexec restart, this occurs
in zynqmp_firmware_shutdown(). On a crash kernel restart, it happens in
zynqmp_firmware_probe() in the reloaded kernel.

Unregistering all notifiers depends on firmware support for the
PM_ALL_NOTIFIERS node ID. On firmware that does not implement it (the
feature check reports a version below PM_API_VERSION_3) the step is
skipped and a warning such as "Firmware doesn't support unregister all
notifiers at once" is logged, e.g. on Versal NET firmware that predates
this API.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 13 +++++++++++++
 include/linux/firmware/xlnx-zynqmp.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 0deb278b2c2d..4e57c0ab9fe1 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2107,6 +2107,19 @@ static int zynqmp_clear_pm_state(struct device *dev)
 		} else {
 			dev_warn(dev,
 				 "Bulk device release is not supported by firmware: %d\n", ret);
+		}
+
+		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */
+		ret = do_feature_check_call(PM_REGISTER_NOTIFIER);
+		if ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3) {
+			/* Attempt to unregister all notifier callbacks via firmware */
+			ret = zynqmp_pm_register_notifier(PM_ALL_NOTIFIERS, 0, 0, 0);
+			if (ret)
+				dev_err(dev, "Failed to unregister all notifiers: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "Firmware doesn't support unregister all notifiers at once: %d\n",
+				 ret);
 			ret = 0;
 		}
 	}
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index ac39e5492961..69a2f74269f3 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -149,6 +149,9 @@
 /* Node ID for all peripheral devices */
 #define PM_DEV_ALL_PERIPH	0x18224FFFU
 
+/* Node ID for all notifier callbacks */
+#define PM_ALL_NOTIFIERS	0xFFFFFFFFU
+
 enum pm_module_id {
 	PM_MODULE_ID = 0x0,
 	XPM_MODULE_ID = 0x2,
-- 
2.34.1


