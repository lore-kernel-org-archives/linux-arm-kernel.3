Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D015EE6B4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 19:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PM+rtinxLhHxeRr9i4lZc8RjHACv6rJTcBi+0fDTNks=; b=vj8SYDjg1PI8uaBBwM2qs/9FpF
	HcJWqyhRpy7XdhX0EUfDONlvGEiSw1Q6OzoUtZiKXjHfa6kr13eD7ALMYXz/3IBFlCM6RSmLtH7SO
	WdDKuIPv7SYt4RhJC5hYg0SrzhFfMCTry9t/9BLCycNE3mPvkkgAXSMqRQfsaBt8hNES+QWwEbKzR
	gpkYt/w0EAtlbHd0o/RPkenx5q/zuZldMrfiCD1ks4DfE0iK6LeDHbwsxFb4o+50DOKBP4OZ8csey
	U2chpln5ERQyhKoSfBSwtQveUlVQbrh3wp2J+U5WYlvPQZUxGC8wPpqjVHrhzMa1DTYyq9si4RWoJ
	+X+XqteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRMW-0000000BjKo-16MH;
	Fri, 06 Feb 2026 19:19:28 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRMS-0000000BjHQ-3o8r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 19:19:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIS8t+UZ+YBQF8Mn2GzvzbHkqfGi+FePDVIajAiRIFDU/L48QWxuvGGqFQru8WQqiX/ioITBUr821U8RqI438YfjM6IzJ6IpJAL+LYXanx6ckH5QkV7Pnu3hHvZg+qYrpm11K47v1096mxT0Oj6vFPRWwGm2/r2RTUKKpdg+Q76Cwm7QlK1lQjvz9oN9jeyGBPc1e4UBYd7f8N9914cor7AG6ieWkHmOhYkaflGZJRWh39SgSGYXnqrrotmfu6dnWX5MoYTFiI0FioHA0e0ItPYOnEvfj2Fx2LKF7H9k9zR2g1/U0oddWWApW67pzglpaUPoietbxligQOFPqOegOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM+rtinxLhHxeRr9i4lZc8RjHACv6rJTcBi+0fDTNks=;
 b=B/7mLlqoSyuYetiHMIiMngNNx3+r1L9297QG0UzUbJ1ttFyFUutrDB2mLLwIPGfzumePv20YBHKaz0EDDr9lvl8wlIYoAP7XZaL55mpUctlnfS/jzEwvPcFr5ZYiorzU+gYDoHeTihGCxTlJh3B1Rgo0Am/EUpTbNw91MxWzCPTf17qYK91xiI++hxTAztHK/qzgvwgFJ/asEWD+J3Asg5aQ8cJFCIRFmeEPOhV14+BhbdLFu7ld+vXoUNER8AoEehtRln5ntnDU9HgOGrPkJw0bnJTmBKVm1xMyD2nyGgRcMsS0nqOLM69JAXgmjbd1dkwnNBYP9xn9cl5BU718gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PM+rtinxLhHxeRr9i4lZc8RjHACv6rJTcBi+0fDTNks=;
 b=m0ZuVyOoDSraFm1bwAPHyLS7SsKVdRaapnlPASFbOQptmtNNxxp3Or6lN4dmxMcI66TQ5llod7FvI4SJSxQbv9EyuXr+mNkeATL1iU6Qlwens5ehDJjHT6urk9h5fSVjKLwLcF7PjALlf3M1nu2+360nfLje/vSvtKIezU771Fw=
Received: from PH0PR07CA0026.namprd07.prod.outlook.com (2603:10b6:510:5::31)
 by IA0PR10MB7327.namprd10.prod.outlook.com (2603:10b6:208:40e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 19:19:20 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::77) by PH0PR07CA0026.outlook.office365.com
 (2603:10b6:510:5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 19:19:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 19:19:18 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 13:19:14 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 13:19:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 13:19:14 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616JJEK81401656;
	Fri, 6 Feb 2026 13:19:14 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v2 2/2] soc: ti: k3-socinfo: Add support for AM62P variants via NVMEM
Date: Fri, 6 Feb 2026 13:19:14 -0600
Message-ID: <20260206191914.52878-3-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206191914.52878-1-jm@ti.com>
References: <20260206191914.52878-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|IA0PR10MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: de729ef0-844d-4f11-c1ef-08de65b4a002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KpzQlr7T7OuZtzrJepXMXtitaBUnSTjoXbfMPUFxaMiVUnSHfpbba7FeiGfX?=
 =?us-ascii?Q?b8rqZ4/JL6tYziJ6eyqf1fq8+3onvPU+UgS6koH4wVB5U+r5p53s2Uk3Y/83?=
 =?us-ascii?Q?gGU316SQVlU6oKYAGe9S5wpGcLzQ9Yvy/2CJsL5kS5eOz+6CLZW4MY9a8Rgn?=
 =?us-ascii?Q?Fb2mxDW1F2i6tyOMDk75QZmTDfOmOxM/22SGZmKji+LjzRTRTR3RodMxeVLQ?=
 =?us-ascii?Q?F2A2rSs08js/mckaMXJdJDqp8MY8dhTLmI8OQt1ehPBc0FFTgJdj3pAg9SHn?=
 =?us-ascii?Q?9VBTfpdQUWKy8Q7uenbTnTnwC4psScmbHZVKG3RftH318DRC8VKvACqm8F+r?=
 =?us-ascii?Q?sbxvnhrae/JWXDMVc6mUFItVjGo0M6Y0cVpYcdEoNn8x+qGXMt/1Jan5yc5I?=
 =?us-ascii?Q?DbTFDPwUVLKiGNKI2lkD89XuUQBkCWuJsnauDTeW8fVty61duVe50FiPVRzq?=
 =?us-ascii?Q?ZbezcsgC90J2ukR0F71tVOESjv9GdIQuJQ/V6x5HQ7l1fJUdDxi0fGw5GE50?=
 =?us-ascii?Q?A5fvYZ2zU7dzDHvDRD7q1Bz1YRJi+nHYusWQ/inVVKf/WBiUWGNCKW6JnYbT?=
 =?us-ascii?Q?0rXz0tGONcJAQOCw9UYBMSQPhNCzvEYfhA0UJQBdr/YCJyf01+0NYkKmwAcD?=
 =?us-ascii?Q?C2DA1hKk2qvg53tifOfiSdR86mJYd+TV4D0dmCrDQmNGBrk5NYAgL/mF4wVk?=
 =?us-ascii?Q?SEyj9M2p6zu2rTEa5K3cGExb56uf/bNjaL1oG11jAVZAO14sHX2HwDlQjKxX?=
 =?us-ascii?Q?VvERv6tIGU4VWIYweqIMYYPl5gluS2z/fhA0pITagxlCs8+NQM55e980YpTp?=
 =?us-ascii?Q?h8MWh65s3QSKmXP9PJlLcWdHHB4xMJBykYmtVsn1973EUSeRq5uTf+c7aqH+?=
 =?us-ascii?Q?scnym2KUO0b+uLXNpSZmXzAGOb++7tEYfU3ngJAl/YbdVkX6wAwwN1WerNyY?=
 =?us-ascii?Q?/64nLPSauFSCHN98RqbHoLA3QpevZ7OWstiuHfkqlsRcyUzbfinyD7YstfTV?=
 =?us-ascii?Q?2kQdVb2RIXcUFGyjGdyTyxfICodww+FJa7vzWk5nc3dFB8XRHvWusYzTs0pG?=
 =?us-ascii?Q?vEKPERwdQo2ZYwA8NArkF5Z/0/F7jRmyQKr9ldjrq+cNNq86KyzKcPuY7ecr?=
 =?us-ascii?Q?rp3QYSTaFm5v72HU9DbAUVYsXzx5OqmuXHB4n46/7s+7GsADGKU1Q6NbpaJv?=
 =?us-ascii?Q?f0D4Lk/6F/qHv9N2p3YPF4waoPuQg2N1Y8oJlOwCA9T6epsve/sTUtOUbRvl?=
 =?us-ascii?Q?2Ql7xN3dyV6eFoNU7KpnlNfyzNEZVCPJnIYm1HULCdgfxU/P+PhAghNOLiYw?=
 =?us-ascii?Q?m9LdvtQht9KPjb2nYkpl8IIRpvD15PIdL4sEtxA7mp+bM2M6lVK2vLJJK8oz?=
 =?us-ascii?Q?psJq9pXKHBgr92HafFMuNUSXsYmG4KC3nOJla6aRREuRYnPr5X7dzrKkya1Z?=
 =?us-ascii?Q?An8X/lphoI4jzgitTjGfhS5v0RjRGebQHqEIO7G7STSG+e/aQg5qAmBuj+iS?=
 =?us-ascii?Q?2hPW1oQM2cPZaT3xpl6D+A+8KAtBD5dPdi2/kEvPj4EoURfubfmKVs77tS/O?=
 =?us-ascii?Q?bkrbB1q9TxJDWwyGcG7DDNkMw2EtxK7uBdBTkzRRc4N9urmWKiPt3mbBA8pi?=
 =?us-ascii?Q?NxjWz5ZiTMg9TivBqHayzlltYpTk2+TI/5sYK7Dayg2O97SzOCY3RcXIF7mg?=
 =?us-ascii?Q?IbT43w=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2R4FttafSX56oekQNH5PL2MX+5YBb/FrvX87xEerPIjDKF3KMrzDP86PbO8fv/mOQMJ18XhjTNtcw8gdRoOgK3XV8GaviRUEPwxyFxCmb+0Q3tyFRiSg5vKl26dqX3KjQoYKD4gO4sHCjIlSMgEmtUQwHWtFZmL6UtP+WCV3gAkV+ibAJpyTSRo9zEYr5j2hHtv672WS7aDDz2lfw7ppFPZU0UNUOrwqvARDlgVlJVVRNs2+lzNOgQqJn8WPKm2s9CCBqoPyfpOpoU3fVx3G4VTuqFnIO827HJr1zgn7XmNg/af6L5mSvA0S10TZ2uMiUjfDFM08J7bQm9XlHi6Pb9zerJ7KuEQuIMa2hF5Uu3mCv6mU0k3i08DZDmL5WULbhCzFPKtFQUNMk75D6fMuytoBlcktuDjBMuGINiXPkA2n+X+l99wDMOKD5vLrJfv/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:19:18.5464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de729ef0-844d-4f11-c1ef-08de65b4a002
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_111924_949420_5911B540 
X-CRM114-Status: GOOD (  16.12  )
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

Add support for detecting AM62P silicon revisions.

On AM62P, silicon revision is discovered with GP_SW1 register instead
of JTAGID register. Use the NVMEM framework to read GP_SW1 from the
gpsw-efuse nvmem provider to determine SoC revision.

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v1:
- Drop valid bit check, and determine all silicon revisions from ADR
  register bits
- In k3_chipinfo_get_gpsw_variant, merge detection of final return value
  and return action
- k3_chipinfo_get_gpsw_variant parameter: switch pdev to dev
---
 drivers/soc/ti/k3-socinfo.c | 41 ++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 42275cb5ba1c8..d8fbc243945f4 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/mfd/syscon.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/regmap.h>
@@ -25,6 +26,8 @@
 #define CTRLMMR_WKUP_JTAGID_VARIANT_SHIFT	(28)
 #define CTRLMMR_WKUP_JTAGID_VARIANT_MASK	GENMASK(31, 28)
 
+#define GP_SW1_ADR_MASK			GENMASK(3, 0)
+
 #define CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT	(12)
 #define CTRLMMR_WKUP_JTAGID_PARTNO_MASK		GENMASK(27, 12)
 
@@ -70,6 +73,23 @@ static const char * const am62lx_rev_string_map[] = {
 	"1.0", "1.1",
 };
 
+static const char * const am62p_gpsw_rev_string_map[] = {
+	"1.0", "1.1", "1.2",
+};
+
+static int
+k3_chipinfo_get_gpsw_variant(struct device *dev)
+{
+	u32 gpsw_val = 0;
+	int ret;
+
+	ret = nvmem_cell_read_u32(dev, "gpsw1", &gpsw_val);
+	if (ret)
+		return ret;
+
+	return gpsw_val & GP_SW1_ADR_MASK;
+}
+
 static int
 k3_chipinfo_partno_to_names(unsigned int partno,
 			    struct soc_device_attribute *soc_dev_attr)
@@ -86,9 +106,11 @@ k3_chipinfo_partno_to_names(unsigned int partno,
 }
 
 static int
-k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
-			  struct soc_device_attribute *soc_dev_attr)
+k3_chipinfo_variant_to_sr(struct platform_device *pdev, unsigned int partno,
+			  unsigned int variant, struct soc_device_attribute *soc_dev_attr)
 {
+	int gpsw_variant = 0;
+
 	switch (partno) {
 	case JTAG_ID_PARTNO_J721E:
 		if (variant >= ARRAY_SIZE(j721e_rev_string_map))
@@ -102,6 +124,19 @@ k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
 		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
 						   am62lx_rev_string_map[variant]);
 		break;
+	case JTAG_ID_PARTNO_AM62PX:
+		/* Check GP_SW1 for silicon revision */
+		gpsw_variant = k3_chipinfo_get_gpsw_variant(&pdev->dev);
+		if (gpsw_variant == -EPROBE_DEFER)
+			return gpsw_variant;
+		if (gpsw_variant < 0 || gpsw_variant >= ARRAY_SIZE(am62p_gpsw_rev_string_map)) {
+			dev_warn(&pdev->dev, "Failed to get silicon variant (%d), set SR1.0\n",
+				 gpsw_variant);
+			gpsw_variant = 0;
+		}
+		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
+						   am62p_gpsw_rev_string_map[gpsw_variant]);
+		break;
 	default:
 		variant++;
 		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",
@@ -173,7 +208,7 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = k3_chipinfo_variant_to_sr(partno_id, variant, soc_dev_attr);
+	ret = k3_chipinfo_variant_to_sr(pdev, partno_id, variant, soc_dev_attr);
 	if (ret) {
 		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
 		goto err;
-- 
2.52.0


