Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FF2D6AAF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CELZDdcN/0BKRjSyp2BaQL+mhviHOHQbO7fA4hVXdDI=; b=MRx+/h53rif8xnR4W3GmcjA+z/
	0VG/q/+n0wgVN80PgHiwIEvzJtg8Qr6qrjSpQuC4MJGwwl131CzhG73TNrDosiTLVF3zZjp6m4HvB
	jpO62mwJF5cLTj5uF5mOCGZxEV9GWM0Xx3FclwN9zGU+kUP63O/RmWy+sw1Y8UPTf2SUQW3Oo1+Sj
	aa9+Cr5d/nzHZxFHy3NiJ9WyeUY1skDSmrVdqEzGHTsiQsVGdb4RgCwrwUQ5gmu9CaVZ5PljZBNpx
	1qmBeuFEFhbhExi1MCKTXdXT44pQzCbCDgfoNlw40lBUwF0VozEJo1Eeih7aTDMIdvLad0lOnElH8
	FFX0ijWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8L4d-00000000WjO-3OOI;
	Thu, 02 Apr 2026 16:39:15 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8L4b-00000000WhR-14JU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:39:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRDlMDEGRZVL/xZnamUhWOkHI7XJcYNcw4SN8YX6I0ilLs2/bPAkNFcjoTi4Gsq91eROp1iOaufQxQm2anU+ZPIGE6TNNOV+DQa3E2EX2C0wrqjAUpTFPOtgvkjDH+OxdEMUZorzEqa0hlERaLvNnTSTX6VMA6h2M9yzUiF0/egRMdCEScgj1+zXWbJNAD/qWFXL3HJKWDnOl51WwXXTn6D2XjzunyQdtibF845yf9t9qeHt3Q/59BX4Zyjwa0yX+jkibq1uUUNMAgTjxE17NBVR5fVGSvjX+/syCC3S+bBSat1G3GWweBsVHPLJQez6CBT99GexR38DH/f3n+b77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CELZDdcN/0BKRjSyp2BaQL+mhviHOHQbO7fA4hVXdDI=;
 b=HqGE+37aRx5/1JP9CDJFHTGDhwyj+dORVleivEnUr5Ryw0JvAJXJdaBRwcSFjvPJT91W6itRnuK5ZmYpHDx6QDxnv6gwdJAseSZ1MaUz3xElzqbyfl8KiceQUShGbAuSgEpSj2vp+kV+CBKKHLzbn/FoOSmgPFpQ+ha0DftLuMMwdngHbT8AFxg/HX37NcTFryKIV8FGIFJexcfp3ivsQNIHTikPntFKtgx++nyT2y2+TYdHi1ZsP2JHPUphS2y5d2M8lmShzAuTk5QZmHguEo6r6bLG53ExYYV2NouYiGtSr9G8YH/nyphLeQsvtU0rsShzVf5Yhxur/crprj3Ldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CELZDdcN/0BKRjSyp2BaQL+mhviHOHQbO7fA4hVXdDI=;
 b=GUXjHd8iDBswlM5t9owxy0IY/4NlpDnFf4uCT+fj9VqzbPVF4uHT2jOI1z+a8bPIBPtvGjwd7N0Q/HpJ7kutA+QaRKMwJ8yjbOvKXZ9Iitq3rWpgjC1DNsu3Be6FyggcGWMgyUyCVcp+kvFaRhY3mMeQqqBfxTLwRHPVCjS8Xtg=
Received: from DSSP220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::19) by
 PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Thu, 2 Apr 2026 16:38:58 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:8:3d3:cafe::8) by DSSP220CA0008.outlook.office365.com
 (2603:10b6:8:3d3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Thu,
 2 Apr 2026 16:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 16:38:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 11:38:57 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Apr 2026 11:38:53 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>,
	"Michal Simek" <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
	"Bartosz Golaszewski" <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] gpio: zynq: Add eio gpio support
Date: Thu, 2 Apr 2026 22:08:40 +0530
Message-ID: <20260402163840.938417-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402163840.938417-1-shubhrajyoti.datta@amd.com>
References: <20260402163840.938417-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 35439377-9ea7-4316-4a38-08de90d656a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: k1Hb+xK34T145NCSKY8oCf/mCzSBAwYOSsr82Yic3LR8dJwe/3Upoio3peKW2IVsmSH07sQASnYdTw7Tr2mirdx/BV0x+Ev3YrRrqpkBlacCJ6BAmzDFz76RXRt/2/h20a1ifB006rHvOSiEyCuYDiqkR9MdpdDZCfkiC79VmpsQM3qyon9d+8o2GWtSDUCL3sg1O6mAiPLyX20u1MLKJXCc4Sxw7paOT5Mw1QDBXmgcX3I/OAiXuxK3OmJeAIo+hF0YdpGsaTExocssJcuxMUvvtWQv1mstgwePBFA8wDV4xTv7hIIAToc5BFuAUy/FoR5plMtybHPLlVBiZXNqSDm3l5LMIJNTckv72dwv4p5JgwI08A1wHKBWGrpL2zZSa3hy/cBhvFFtcDieehM2w9cblIqHBpMvnLfKcIwPZyujlCgTZTdS/hsRR035+SONxUgttBEH/X25OccFryjVdiaeMBHtMkXA56WF5qNt3ui7v5ODuli+NlBj/AvvfPMHm/fhbyKofxgB02pKbnxt9lu5mItWkunlpgM3aLBazG1ux9lDJTaBpL9/26n8tXFJweircK1sLwalA+acnJ3ADk8+u9HojfqkVyOs3vtxtsVUi08aMsyAp3sY6Y8fgOEgkb7U0a+vm/CQ4oqIDw4181Upo4WcEwKJjpTQOwYkA18I1FLAsMbl3gesUmRawvWESMfWG9DT5UjKwwIW2GXFdOW6bKrI7E+qOMn9FasSSQTR7YHcgE7ZsuyfQ9oH51WI8JlF18r4fs520QgzNu6q6w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Pp4iS+5bFceeAUL1cwR78qvzS30TJTn0GXczzuU6ayeqgKaV9ZGwiidltC910w1n+d7DMlirpQg3OH4VCrp9NuY6CHBPXieGLCWY7P5fL/en/tJOSfkOyiNiTNasSQF4hOfpvTun/e+NE0d+Ixo/WVdHilJQKhKgta9tPqeNcjmaM2ewZcrXIVwkM8zUdcSlmrykn2V+r1QGwqaY/Xp4+xT093tnm0M4CFzqwv/vw159AcoPau3+PAZPRn64EWJVwsBXiikHACWjhypj2xLd2zqef66BrtM5DJYDijq3wOGPi0eX53kqQhGNSXLX0UqFY568sPowvKhdT/fHAWKZiAfU2S3e1scLtdVlGEcwlcvpQBE0LvSYBtQ+5ns4lKywDPRo+7yj73ziMzgAMW7ROjyucXbLBI2I1hVEVNiDhSvb2DdmFf9dBDkG00h5Q/hc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 16:38:58.4042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35439377-9ea7-4316-4a38-08de90d656a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_093913_297323_5D1BD048 
X-CRM114-Status: GOOD (  14.43  )
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

Add support for the EIO GPIO controller found on
xa2ve3288 silicon.

The EIO GPIO block provides access to multiplexed I/O pins exposed
through the EIO interface. Only bank 0 and bank 1 are connected to
external MIO pins, with 26 GPIOs per bank (52 GPIOs total). This
change extends the Zynq GPIO driver to support the EIO GPIO
variant.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/gpio/gpio-zynq.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 571e366624d2..8118ae3412c2 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -25,6 +25,7 @@
 #define VERSAL_GPIO_MAX_BANK	4
 #define PMC_GPIO_MAX_BANK	5
 #define VERSAL_UNUSED_BANKS	2
+#define EIO_GPIO_MAX_BANK	2
 
 #define ZYNQ_GPIO_BANK0_NGPIO	32
 #define ZYNQ_GPIO_BANK1_NGPIO	22
@@ -818,6 +819,16 @@ static const struct dev_pm_ops zynq_gpio_dev_pm_ops = {
 	RUNTIME_PM_OPS(zynq_gpio_runtime_suspend, zynq_gpio_runtime_resume, NULL)
 };
 
+static const struct zynq_platform_data eio_gpio_def = {
+	.label = "eio_gpio",
+	.ngpio = 52,
+	.max_bank = EIO_GPIO_MAX_BANK,
+	.bank_min[0] = 0,
+	.bank_max[0] = 25, /* 0 to 25 are connected to MIOs (26 pins) */
+	.bank_min[1] = 26,
+	.bank_max[1] = 51, /* Bank 1 are connected to MIOs (26 pins) */
+};
+
 static const struct zynq_platform_data versal_gpio_def = {
 	.label = "versal_gpio",
 	.quirks = GPIO_QUIRK_VERSAL,
@@ -882,6 +893,7 @@ static const struct of_device_id zynq_gpio_of_match[] = {
 	{ .compatible = "xlnx,zynqmp-gpio-1.0", .data = &zynqmp_gpio_def },
 	{ .compatible = "xlnx,versal-gpio-1.0", .data = &versal_gpio_def },
 	{ .compatible = "xlnx,pmc-gpio-1.0", .data = &pmc_gpio_def },
+	{ .compatible = "xlnx,eio-gpio-1.0", .data = &eio_gpio_def },
 	{ /* end of table */ }
 };
 MODULE_DEVICE_TABLE(of, zynq_gpio_of_match);
-- 
2.34.1


