Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA849C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nObDWTrlQ44Z/X696LYJMaP+fL/T8HKfGNVSwMBJTLo=; b=wWVPM2lLlO9/bWVzP1WR+xyVHV
	gido80Ll7+aQr87wwWbXpr2ZMssXDRj01Cbh/9+7Nlk4MxdtQtN4g7ed5adrruEZbPLY8/qysULA6
	utV6Fz/TA+IitKlXQV2WDb6BkgwS6usKvOrteiC+Fr45TCM98olKavWrVGoliR31+gfyNfVP9I1Uw
	HqbZuCdclIiHNU3y3nYPUmX5EG5OwtWRZJWngnIB0AOM/Z9bLTE3GHi3+/vsR1BlaDNkxhD5yUE1T
	tE26kA2lRe0pSnrTgKYtw2uGs18639iHGVSVICIhvXZ5T6VqzEoGR10gtpTcvlHiRSe3q+mQcC6yi
	349JXCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMyg-0000000BSwB-1fmZ;
	Mon, 10 Aug 2026 10:11:30 +0000
Received: from mail-southcentralusazon11013023.outbound.protection.outlook.com ([40.93.196.23] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMyd-0000000BSu0-20uc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:11:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6Aa4VNtXQdJQDMQAe+mJM+4ddiQoeeelQ8CXiI3KJfsDtyIhIgvJEb6KYHSQfI3EFFyio90adcnlsx3msBP3nlNu11sKIpJf9LQfzow1tEXkNMZzjfxhwFC9jhKd6tLm8LzTvEtWMe4vd4AREjO4HrfcgpspLE11rRqCpq3rnhDGrrIVwWBwT2eBg5uwJ9N+79q1JJyWwaj+44V2py3DUpP+reqfDSNHdps127qe1pXI3eSfMebQqAl8+s9Zczxo9g7eC4psNBypw7iHhoicMbzX4w4mGX/3bEUv1H/zxhbIZXsqGgbuHDieBJi51B3VsgTPFw410IAqkq5QLZEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nObDWTrlQ44Z/X696LYJMaP+fL/T8HKfGNVSwMBJTLo=;
 b=tinNicVWUFcZ4go+cc6Lr+wBAMLHyL7y4UvE+6ipPkV+WR1N4EDscPqTHwNnDSRQtJawSsI6WA3pkDlhFLJUW3ZfX7GhNwXggFTAE6C1lfmSUkmr/e25NEBjdr9/+tyXyrv85qi+h6uNY0f3gwCsYG8Ia157AQsFGGapg8J3YSCpkLmqT3CCbjM3DZ84vHPNm/MvaBIlFv5XWtJfqXjCbNk03S+DMGTEtgzYhznb4HluElEj7SLzEGCl7c0jsOU0L4G3Y3BWDT3/6NXc+nFv5C5Q4g3RcVTD4jCC6YHuD6WTprMl3kvU5NrRPgW+qtWrdpOzj788NEfqkYPzaKy4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nObDWTrlQ44Z/X696LYJMaP+fL/T8HKfGNVSwMBJTLo=;
 b=nwscj9f5Q96Cbvuw6ERxUfli3ywJaXPPa6Xmeyf7jpO9H5mx+Y9lAvLU3lmv6hs1GqtRKEmfH1+VYGd+GiJ15uIL2fXVCj4lRwMcctE94tx7FJc9JJIrvBBp4i3+zl+n142aElQUnI9L9ypx2mDD+d3ID0byDPSMrgnrTutAFNU=
Received: from MW4PR03CA0353.namprd03.prod.outlook.com (2603:10b6:303:dc::28)
 by SA1PR12MB8164.namprd12.prod.outlook.com (2603:10b6:806:338::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:11:15 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::1c) by MW4PR03CA0353.outlook.office365.com
 (2603:10b6:303:dc::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 10:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 10:11:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 05:10:58 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 05:05:08 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 05:05:05 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<rafael@kernel.org>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <nagendra.golla@amd.com>
Subject: [PATCH V3 3/6] dmaengine: zynqmp_dma: Guard IRQ handler against spurious interrupts
Date: Mon, 10 Aug 2026 15:34:49 +0530
Message-ID: <20260810100452.426320-4-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810100452.426320-1-nagendra.golla@amd.com>
References: <20260810100452.426320-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 699671c9-ff43-446e-a5fd-08def6c7b5e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: H9Uq4Htx2Cl/gLTDMHWWEF4wpX5Fr789v+gE/4W1puIFm29lwvbKIakY1lcZzvQmdWq/mHvZoKX4IvwyoJGLfdkCmfhIBculb+G6t6QFaAz00BZwWwNcnIkneBhAZkrR2MNjFYOmok69LsLGG4V0M3+PlQajFPPC4VLxpr3z3xgNp1JZcK0qEbBZaEkJmgipRzz+imKtDH8CXq0HM5CMb/6ocEFPVMppVHTSvt/KdQhE8z7kumTES3t5I52bVjiF8joK64gYyAhWlL9eUDro5DQRT/T9l4RwxkTKtyhqL7cJ/EdatlDQ8suJGjjdHXPm+Mfl7XzQxwLqKSL9JpN/Cl2IOl4nOjojNDlCXvLCxQeXRgVUAnqE4UwVntHXjOfyYX6eN6miRVq2w/SRBZ1Mb9iijUV6GDYQ09SHE07P3kZq+ptPiS8NTTinq2iX9TiPqB2rEIuK1ELXwt8EM68tN4oAzeR89BeSgYgDsEQ4wMlUbfdX1mXSfn0uoBMV4xntM1LPJWWw7PiN2D8TeZ+9R7aBI9gxehboX4p1jAkUZmftuKfPoucX8cywoFpP2YwC6H2OPmkOusp4oeJcCEzXnTqDHs0BJdXKisTQ8LmzFV0ZUasRLq+IGJL3bAfAzZRjbJH0F+U2BckmSR1DjA3h3Frd32Ba8H+PtLEReh69AYhqHJuYmDOmX0hZRgaUK5pBZhOhvEE7gWRLpVCI97xw1A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k8oNTlqKkUmcPc7WnTm+1g1t+JyVcY7AeiXxgRUHFso2FO3v3vrL9NLQAkoUCf7brxbfgOxT9z9JE9OpswOstI+zb3kHwrxoYoikFGB0GJQ/Zomlaem4Lk5NwSYndC9cVDdsEFykcJ1K2f5nbItC6MQ08JKwQ3Q+zkQEZsXL7slHLsvW30LgttDi90s/L1at7Jh+tTAmmZHczCehm0l8hxL0WfVmXQULS+XbwOPNzXbGLTj8AHD1EX+sjPDjkasl3ki4xAlIpjG7an3GIhlh7KHgGhZgyqfJBF7eecTLMpFC2AIZonMd30HYzTrk2BfqnX7k30itwqZwp5SgjOcMlUf/8QD4dkE9nEWV/9K16Gmf42qLKYhkcrYxoIHymvYIZIW+piWCZusWW1J7Au9jdBT5Fs+dK/VuTplhbjxMrP0QGh5h27buIb7WLQoGjkjW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:11:14.2678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 699671c9-ff43-446e-a5fd-08def6c7b5e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_031127_549734_674567DA 
X-CRM114-Status: GOOD (  13.80  )
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

Use the PM_RUNTIME_ACQUIRE_IF_ACTIVE() guard in
zynqmp_dma_irq_handler() to safely handle spurious interrupts that may
arrive while the device is runtime-suspended.

The guard acquires a runtime PM reference only if the device is active,
returning IRQ_NONE when the device is genuinely runtime-suspended. When
runtime PM is disabled for the device (probe fallback path), the handler
falls through to normal processing since the hardware is still powered.
The reference is released automatically on function exit via the cleanup
infrastructure.

Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
Changes in V3:
- Replace open-coded pm_runtime_get_if_active()/pm_runtime_put() pair
  with the PM_RUNTIME_ACQUIRE_IF_ACTIVE() guard macro
---
 drivers/dma/xilinx/zynqmp_dma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 87986f65d24c..b03171e37e27 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -729,6 +729,11 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 	u32 isr, imr, status;
 	irqreturn_t ret = IRQ_NONE;
 
+	PM_RUNTIME_ACQUIRE_IF_ACTIVE(chan->dev, pm);
+	if (IS_ENABLED(CONFIG_PM) && pm_runtime_enabled(chan->dev) &&
+	    PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return IRQ_NONE;
+
 	isr = readl(chan->regs + ZYNQMP_DMA_ISR);
 	imr = readl(chan->regs + ZYNQMP_DMA_IMR);
 	status = isr & ~imr;
-- 
2.43.7


