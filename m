Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C63C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmvm3ctP3Pfive7gMOXkuZcsY7qA7U/+IORReJCcNCk=; b=ct0J2G9oA9X4yTqV7obZXhEVgu
	CXJNvkOqImZNqU9gJWbTey2EzOC58HAw9EgRLM0N2wCtctWVjUBZRErWtorXj7iACYdxJVzbdXEuL
	a2KVjKa7U7X4IydKLllA5xIUoGdBMcbrT1WIyNAQvmhjOE89PRTpFWQ/EFPloIs6Hw0lgD0yIuWjB
	4OHPrcgq4aWiQ7Zvkyjub6CDw2M687O+QUm1wYY19r05Uz9t5aQnyskt2YH9VSglWcW2xmqninddt
	JNzzH46z4b28y0LIzqTQqt+cpRIwZ0fiJGzEsghfxM6pGIjHKcPFz04wxVpyF2VOmtiUhvLlRBWoX
	uONJfztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Mm-00000007u1r-361N;
	Wed, 29 Jul 2026 12:26:32 +0000
Received: from mail-westusazon11012007.outbound.protection.outlook.com ([52.101.43.7] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3MR-00000007tkY-2Gfd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:26:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTeQmInBIm758kRQ86oZEolNACZLBg+ZKL0cVlU2ftF2IcsCR7wRU5CkYs/C8k3axc8tpFSnKJ/WIRgCQHp6grdW1/5rdfI+a3ZVn9bipvAwwv+XP3Qidqc5zHbTvjDdAVx0vv/W2D9NYjhVw5BJxYaBQtlPBj5SCw8C8NBFOadtiPgrWMKdvQLm6FmW8kTC6aVrTASjmTEpoUIrOsSKHFGEeSxWSi3xDimSPp6sRq3QzB1nTZxeuwAZllPDDZ45hiLKHfNTLfSXtwxZrqnYvNAWosGeLX8U/Pv7jqC2ITiNZzGcIT6mJNLaPUFMW7SfmMuSu3UquA6LDtKYHOUWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmvm3ctP3Pfive7gMOXkuZcsY7qA7U/+IORReJCcNCk=;
 b=rTt+jDbg4URaGI8QFw9fipbpyz3gs/EGDL0SmVT6PNi9c70iV+DtaevGgsTcrSrRrcNo5bYGH7IdWvDs2B05Lg8QSx4MN6CLb47Zi2FnEpfAbvgGqmgigy+gJTWyp86XUUziJflJTyH297T0z6gKQo6o3zXHg21oPgoXu8l2wD7dUcZ8LHw5jaMJ1BUtirbrhfy8JP8LctlBczSeHjmXEH7tZTHTfmgAuPbaz7U5I6vDiZQNm3oK/RA+V6VmZgUsXBZHtmo4Z2UK3SLWPCbKhCNB5AHO7bqAjBVP+S7TYbLPrg9exQouOnR5zmqzMa8quo+MFQooo3+FDHEGC2FuaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmvm3ctP3Pfive7gMOXkuZcsY7qA7U/+IORReJCcNCk=;
 b=ag5+n0+VEznqRI5JI19AQzsXUFCT8H5v+8Y3qYRZrTAFUAfiQAR3OWLufYPUyQFhgvScitH7bJEmvXC7SMVrLWGUpK7f00igG9nVHIOm3KDTEZZR0GcBdfCF3BfxGDSJIDvtYQ+r/grjKDu20Lzcs2EXxDAOUrJo3yRuIYGSLWk=
Received: from BN9PR03CA0722.namprd03.prod.outlook.com (2603:10b6:408:110::7)
 by IA5PR12MB999278.namprd12.prod.outlook.com (2603:10b6:208:603::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 12:26:05 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::7d) by BN9PR03CA0722.outlook.office365.com
 (2603:10b6:408:110::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 12:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 12:26:05 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 07:25:59 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <git@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Prasanna Kumar T S M
	<ptsm@linux.microsoft.com>
Subject: [PATCH v4 3/3] firmware: xilinx: Clear firmware notifiers across kexec transitions
Date: Wed, 29 Jul 2026 05:25:22 -0700
Message-ID: <20260729122522.3732875-4-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729122522.3732875-1-jay.buddhabhatti@amd.com>
References: <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
 <20260729122522.3732875-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|IA5PR12MB999278:EE_
X-MS-Office365-Filtering-Correlation-Id: c0dee568-e0a1-4385-c848-08deed6c8fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: UbU11MZT0Sln/SI82iV/7X4zC91bYzt8sop4+8pKiacNYLshIyDPBNsir8HNYeWlEgxIJgQRLGzZWf7dQnHjO5XqpL90J+yIQJ/wQltJoNmhzWWfSRcdk1ZS5ImQ6ZcaacoTHXJv7mMSVQlUBAys0dgIIoZRLLPCAY8gd5YNkEcQYIimVfZcgEFMvpyV/93+pkm0hpNyIAzFqI+pkhKdj+CxquhqSb8Gfb2cBUn1cTtDqNnhGvU1ZG7yVwW86SnKfu7UFsj5PwMV0A+bLrFlZDO/B+HoZ1JziI8kpuAbi6mXnb4ktLcqp1OoBV5Q0N4sjh8Cac/sw5EcpFmGJodPzEFYgH2Zs9ae4699DxPsaYo04+wKVpdxlAfx12sL9F+ltelbpvP3/ro41traH+SBciDKHoxl9O0HilIukW3yhjuOVVYMEBrnBRdqW6dYurIw9yDqAekIzLtd4YYQj1jw2Iv+B6y25yQRxjNApQg4gIq6n57+sY4RDWvfSVrdWfyrEKMdRZpGDpNNlTYqsu1BQHHeHmK6DBgRWu02XVtwrNskkfKirMvLQZH2rTRzsjJzGbjqeCeSRwxYARpACDAZfZPkcqUv5Y2Jle52VJLAqp4bO2EvfoHyhquFMHlISkYcWXGKtLKSlmxqyF55PvBycKNnjAojzimInRLdMz1lbzE/zHBifUcX5BhJvXQ3RXFbRaObJkhLKrG60XF9PFGF9w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: suLQ2KGBkA5C4qyPMZ8E5LKA8xupIzHyRGXzOPyoc+QTNv0y5PGLSSWI1JgEi9Um09RRdl1DFzexQqG0WvymnsFP8NEy0J9c+IGGtUQLOgX3fpOnM77xtZtDBACRGa/Z1+PF5dHX9CrXvv+prw3OKavsZ/UIo/dMrTEFS6XAT/aXGrbQc/2wI+FeFMVfmEUrMbx3mjG+Qv1gB3EilzU/KTQJAs5ZpkVdkzMrOsSsCt/YbdmGlwWX0cXCqedKSFEjROWQjcoMGG7j90b1ytcpAVAKDkXILgoTyoca/aiGfmMQwj1rexs2LGXg01MS9xzftdrSyuXwjL2oD4yjzSIuDubpt2/KvxTsL/z/6cf9GTKBslFVVBePqG46oVC3b8bTlzxCpY2p4w3QJ2ZE1uMpZBvLC/pYDW2Ymp69LkfXfJxRs9mxW+GvqvMh9h1kbCVx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 12:26:05.8104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0dee568-e0a1-4385-c848-08deed6c8fd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_052611_578688_10BF0D2E 
X-CRM114-Status: GOOD (  18.68  )
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
index 28bcf3a1e6db..89380cadc8e4 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2112,6 +2112,20 @@ static int zynqmp_clear_pm_state(struct device *dev)
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


