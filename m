Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861CDC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+hZB7ghV8Rxj0OljYmZuu5Y59IzZc0Ear6XA2q5p3E=; b=rGrZ9V3bY+vClU5fJUiPtutqUt
	1sQ5+Yv94yirt6yKkewluwmNKIud0kKc2/479UBmyKgwtNX+l6WYsj7Fs82zp2nU5VkbnsN++QCzO
	McftfWBCdMbicmLpasK7M/okYwpkesk691PjNnH2iNYdkwIww0t5l4gxAtsj64wNP+ATsNx2Jdayn
	vEx2n9LnwfbFJBN7Cwgp65cdY2fHVINFJrLgXqwbePE4xEUwBFO90tqHGxW5/Yy9xntUGi3SFanKr
	9cVVda8AQ1rmtQ7p12TEQgol8EpmpPkX+OPE5p/7tqw4mEtQBpwqOr1v9M+wRXbPXCgZ7XnbsOV2o
	AI1j0oOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD1Z-0000000G4LI-39Jh;
	Fri, 24 Jul 2026 10:21:01 +0000
Received: from mail-centralusazon11011036.outbound.protection.outlook.com ([52.101.62.36] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD1K-0000000G4AU-15Bo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:20:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLKZC+hdrUDO+gPQT2eczoWUa+QEWB0Zoe8Jett+J2t5tHR1UyinGRDUVqaYgx6VeA0afZx7/1/sv84Ugjh8r1rYTT+zD1J87A8ZGBRqe04YImukye2Dxk7atlorzR7ZfEDbL2xG+1UZAoVw755+beLTIe6y2gJwImG7Yj84SHAvczuy2ChaV2FtGrL7SOZo+y963YQ/7c+nBRSZz6WTc3DlZHE/pcczI7n2CUzCOY+MqJkc6BZS8pZUzng6IKOFh1yN0QDKVlqiIR+QAUybAIVtGBi8M4SOaao1Rs2ItmsWlWFpD0HubSRfAifS/HLGccJig43lvPMgXTkQmdjZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+hZB7ghV8Rxj0OljYmZuu5Y59IzZc0Ear6XA2q5p3E=;
 b=kieHueEcHWZb8Hm39PU96VNLmubBm7pWsGtDfy6l33+IocGguQ6vy3KJgeUv3zSJ+oyRxwqCUWS2LnoVGhg8Ymp2Si7jIUQXNuTCTPhRD7Hzg15jUdSLT4tnLgj1ouwqquHU9i6ednKR6/OfKvjKXNg+ltfeaoTqmc5hqde+5lL0XyR5kkgOHRGd8Xw+M+JmziFQEZ/xIKh7LDbM7KMvt45WD6qL78+b0g8UxI0aI7hs8pEDsMfxBgrHeAXAhHL5a+fp5YLkH3NewR+9tkymJsDCkJKY4+9Znxg/3rGYFIXr7+wTKxVAmbS5Gdxz2P0vqaXliol4eB8eKs4kNj7BQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+hZB7ghV8Rxj0OljYmZuu5Y59IzZc0Ear6XA2q5p3E=;
 b=oGFKMZ3TvlQOy71uopB+n4QkE+uybdAKMSjuq6F/IIaUbRDx+3UR76A2WpG0lGNpaHKDUK1zO3jSHpS5EKdXsAycz4XhRUtsbl5mzZWp9tqIL0AfxUo3fu64focU4wJFzdADgkMOiR4xnoa4G+7UPX0blzJIz4LvHrdmDhc+7ZQ=
Received: from SJ2P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::10)
 by SA3PR12MB8024.namprd12.prod.outlook.com (2603:10b6:806:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 10:20:39 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::1d) by SJ2P220CA0002.outlook.office365.com
 (2603:10b6:a03:5da::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 10:20:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:20:38 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 05:20:37 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ptsm@linux.microsoft.com>, <radhey.shyam.pandey@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH v3 3/3] firmware: xilinx: Clear firmware notifiers across kexec transitions
Date: Fri, 24 Jul 2026 03:19:48 -0700
Message-ID: <20260724101948.2895263-4-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
References: <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
 <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f03dd30-8dd3-4e2b-4dad-08dee96d3567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SQg4ehtPYqxAe3KTy5qreB51GPkDQzUFhnbVYAfs+r3w7AuM2VDPzVDTuDUmZrYpRT1nu55yudVXC+PlGUMJX3bHsxidbea7MQo79vcEwIW/c5afUaJWSSzA3g71vlzwX+cDzht0acS7AffcyG4JCaHS5SDlevY2YurJsjhxQKTsvr0kGjv0TFBizAWfafu0i8kfLSfeu7mFlWZZgIg54giNdACkq98hJWDyKd/D8QjS0h3YEzJMGR/4D5PEBqufXcqDr8Ihg76/b9YNuBPM+hpmgVJwWGpqPi9mqZu43tOLLVC6hB2Oqb6SaaPIh54Gvbtrm1bmpcZE7rHXf0a+5G49sA5mWy89n8dBHAoaq2usnq/qOKwee8WlCV2dA2rkHwSLpCyWfM/qrKco9fjKfCO7sTsr/npjRqb5AXqIU7HwHnbTxoBqqgQupA6NxLAOGMxZ+V6i2qBTFQHJpY1qqmaXsTMdvTJuyGJ6s/p0PvVz+gedmkIDHLtR4ecl/hNejw2x2oDLnEApPDmzIRmXd6LUWLxnV8z+F13NCtjeu3Wi3iAKJmO4dZcUcdSDX5LMjAjCphcpc8IHxxkEXrKNHOD+c9SaSKomKyvVQQqd1zuh/twJUaBlrZ2nSkCzZlixigaQvNkX/YhC4br/VaW+rm3Utczf3JhxG8Yli+sfc9JZ3KGXqUJoWW/KO+WHkXCN80ffntiPnGYw77jvtJMdPg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VQh9UuSs5YA5HIMkKUjUbEgLY558wL6u3Q24dShWD70Gq8eX4hlxk+gzY9YfV0jSDCdGwfgCngkYoB2sFW3TxWf5bH347OfFjIFpATGQNiOUJ3ZoRO1s7qhOh0LckUrCdCl6OJLHf1VHHU2cXKHsbY2+fOyrgZ5CX+8VS7HHYi2KAzCJozmhzV4bxrg0FZCNzwO1gkmMozR7P7QxQTR3m0gdDT2nWoXJD4QxW0pKeqRFevp1QOasojj+sbNFIVyThAbj1S1f76uTAi+RuO5TnZ84wMPTurGTUIW+rZxyRB1UOkDKPrQbibc5uE7AVrpEu4u+OVgTMce5zmXhxgq1jf3qnXRsCCr29qou3r0FOHjHr/yMPMNssnCUb9xGH7eVE4YbHOuYH9NVTr6Ce2qgANnxqb5LG6VjWeP9/H6wt5u63PB+SavMSnOAEEy2i3AO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:20:38.8512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f03dd30-8dd3-4e2b-4dad-08dee96d3567
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_032046_301785_7B2BD8C2 
X-CRM114-Status: GOOD (  18.01  )
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
 drivers/firmware/xilinx/zynqmp.c     | 14 ++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 64d2109eefd2..fc7212f554ee 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2110,6 +2110,20 @@ static int zynqmp_clear_pm_state(struct device *dev)
 				 "Bulk device release is not supported by firmware: %d\n", ret);
 			ret = 0;
 		}
+
+		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */
+		ret = do_feature_check_call(PM_REGISTER_NOTIFIER);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
+			/* Attempt to unregister all notifier callbacks via firmware */
+			ret = zynqmp_pm_register_notifier(PM_ALL_NOTIFIERS, 0, 0, 0);
+			if (ret)
+				dev_err(dev, "Failed to unregister all notifiers: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "Firmware doesn't support unregister all notifiers at once: %d\n",
+				 ret);
+			ret = 0;
+		}
 	}
 
 	return ret;
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


