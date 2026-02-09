Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FCDE7E0D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aURdM4BX7ur5Rh361kVNzPk4uS3w5T92xS0ffwcAx2M=; b=2PBXWRYMZa9IaeEoxVfzmsviwK
	8otuAwkq5WWDtT4pZenPIloe1NLuUudoxu7sV6W42EtzrGUPg2kk5zGq4vndiBZLJmv5AC9Mh+if3
	jupDcUpCGYJCkq4Yjn0kqd5nyRIxEmXJ3ve11blEDxkb86kfGi2Xz0/GCPzJYKZtX0Y1pq6W8dLeB
	YVI1vOIWWLRJqa+Mj0d355+G2rB4bd2x6Ih8RcmkxTGWYLVWhDcB7tu/3RkxQHw9zLRl0Q34PGqzk
	kQJ/xbwAuNgYNbhshX0OS4gystnFmN8f1n58FoPaXw7r9icD5RRWvDmY0bQjqLQR7Q1YeU/I990WQ
	N9ggjViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUzA-0000000Floi-2nDl;
	Mon, 09 Feb 2026 17:23:44 +0000
Received: from mail-eastusazon11011062.outbound.protection.outlook.com ([52.101.52.62] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUz4-0000000FlnE-3X3B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 17:23:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANXmK5hIbpHqnlXCtd9Ioh+anOnJeztLqmxpE+pgr39AW5aYPNQAmE1rte8W5PrjMP/+6vGxFpPBznaMJPwkuVcHB3zise5OipWfRfCyLLVxMnzKjuV2BT+syGgvfvb1IPC3oxNFHSZ3/TdSDpxpjBqe3wwTXvCIUnqTcSYgh7lZG2o6By24ZPXkr9shIzwg2XpAgD9v2hmwPm8gwnb0+9X15lzRavAC1nITZX9j3R+HonI5/jr1Aiicu7lkMHisxDa/ih5r79AymGMjUkfD5rqxdWozdSjR0sChkOKp6jPtD+vs01WshrUtHZDCz0IwnbW/YQ17voBlzMxZnjPosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aURdM4BX7ur5Rh361kVNzPk4uS3w5T92xS0ffwcAx2M=;
 b=mKelE1Hb6uzApueovuQeqoAFcD+KXpwNu4oA6exZmsr6rrq3zNpwZcJqyW1M1lua9cVXJ6Gnv5JnEO96ooXTChr+J60e5RZ63WXSKf/OplHDJ1jmbH/yrEkADxSEcuS+u1jFwV0rDYJRTbqYMBr8qe+pbXLxAaByD1gOJeC/nZxbnh80TS+Q52ExFX7muu44NblCvxaceFZD0L7EzCJyDHnlui+XCTcBqJqkuCpU1kbJflzCN99SpczLRi4eYh5RIh6ceRveW5jkGbrOlzzzps/ZfN8XNzpM0yMuVbh4DOuqvXA7QHODLAAi2j08yTqD5foUUocfPRXhB0S+fUzW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aURdM4BX7ur5Rh361kVNzPk4uS3w5T92xS0ffwcAx2M=;
 b=Zjsz6LqjA6ejUR7t/nIjuRetQBeri572YblKXrMVOf61lydRYVDCd7FYVuB1s8i3x9lK1lccq92cqwwDYUojRPqiqenkNDod+GyeX3yORcySD4P5q3UnZ0uo+mBClFIGz/sH+Sk0MRKf/9gwQZCX7XDItrBVxsVIlOG3dzS3k4Q=
Received: from BYAPR06CA0058.namprd06.prod.outlook.com (2603:10b6:a03:14b::35)
 by SA2PR10MB4778.namprd10.prod.outlook.com (2603:10b6:806:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 17:23:35 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::9c) by BYAPR06CA0058.outlook.office365.com
 (2603:10b6:a03:14b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 17:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Mon, 9 Feb 2026 17:23:34 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 11:23:31 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 11:23:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 11:23:30 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619HNUl61959220;
	Mon, 9 Feb 2026 11:23:30 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v3 2/2] soc: ti: k3-socinfo: Add support for AM62P variants via NVMEM
Date: Mon, 9 Feb 2026 11:23:30 -0600
Message-ID: <20260209172330.53623-3-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209172330.53623-1-jm@ti.com>
References: <20260209172330.53623-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|SA2PR10MB4778:EE_
X-MS-Office365-Filtering-Correlation-Id: 94389f70-a91d-470c-bbc9-08de67fff44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AU4tJLjWx1rupPBNaxEOEymeUGsh02/01lhUmxgqPBztSerglFF8dNKwroP3?=
 =?us-ascii?Q?3DA6AxUdaEloWnLqCt+fc2ACkXoIkTVl5nlYhMEfaKDADtwoheBbqOocmQfY?=
 =?us-ascii?Q?b5ryY9kD4SUlBgfUO0ZSTbfyMEwcEXXoC876Wd4TCKDKUxVGC2iHuwxMH8DS?=
 =?us-ascii?Q?xKscTbDLmlgOO5IXawKrbRLtmKzBFBq8OZPi9VrRMNXXQaF0muC9kY5baG/0?=
 =?us-ascii?Q?SbJcKEojAV60VAJb93yJRnA4bCsylAllA4zLEnzVOMlnDnImugj6N6XTUZ1K?=
 =?us-ascii?Q?zCPIEa9tA0fb10poZpN3DHZHhPDHTYiPZgxfUnHhaY3JcHMwJL+SX45mq6o8?=
 =?us-ascii?Q?GdP5XT6+CVKLRt6lbT2bFu0eSY3yViySn1gXUzmdt57CGdxNgybbadiQDCj5?=
 =?us-ascii?Q?kzjdIrp2iDo0ZE6LMnOYOXpXAMICjep7bkTRZvZQVTq74EHf6mZEj6V5gHOI?=
 =?us-ascii?Q?EYpxtQ93PyU65R97fAsQ4tm1553DKvYQzr80fHIKoMj+fQKJrEAl5cgN5/Qj?=
 =?us-ascii?Q?/El3C+KdK49biOcj7Do8zjEM1YesKFCiOryq+gjDfbnvTjYQTjGJqwAcyhfx?=
 =?us-ascii?Q?giKkJJ8zjYXoo+lzu7r6R6tJbGaUrmeoYtZFrPpezvzDAijOYbnSy0JgR6VQ?=
 =?us-ascii?Q?27wAFBYpYI08sjS57SSa9H4qhBEV7WehR13+9/XsrENSMUPfRjRHlKWzUlM7?=
 =?us-ascii?Q?JFihluXr4vVJWwSJOqPoDOdFe8Lp801swXmCA593HFJqGxfdWU3PI5Qh0SGl?=
 =?us-ascii?Q?bXu26DZB187IFmFRZ+rK276AUclERUlRgkdsvfFr9L/ACqOfckDLWY3kegLN?=
 =?us-ascii?Q?6kG6PGFb7phqL9UiLz78gWjH95lWIjCqTZLlzOjGJllNQnUigxYDmXx2Mew0?=
 =?us-ascii?Q?YV+eyi/cokn/Lmvcf6Tlkv0zbiObtAocZX/wEoASkKxRCJ8dH7/RMiFFj1ML?=
 =?us-ascii?Q?DoaEYYXHuFmhltPM5KFzZVOBNjZKWAsNc/5PFHB4e89fBxYOlQTrcDXYtg6M?=
 =?us-ascii?Q?xiDqq0wgUzEw6mRwGP9ldw7Jr7E6CCiLC9NgCOrjAn4Qm356D2AVcCPH5/cC?=
 =?us-ascii?Q?FwCqrsYizOkEGYAnQb+ew0Ox5prAUZwR9IXv+7q5pfUSRWZoENpe7/yNqvWQ?=
 =?us-ascii?Q?QG5sjD8114BTw29XnjLlVVX7yDwC8tPMgbz+4zJKq3KXOXXruhQTSJ93Lva1?=
 =?us-ascii?Q?4Jr8ugY+4znDVfiNt0yFqap9/DUiU367VCKHSgN1GS1CQLTcjcg07oQSe4Ie?=
 =?us-ascii?Q?zUd/tdP+79uo9WtC3ZZmvyyGU6nUKhWKPFYvHpV8F/cRqIzffHurfgwNNX+G?=
 =?us-ascii?Q?eHjGWbK2weHa+AJU02TOqZD6ywIvpqmkCAMau8EolsUecHOwsv9TsNmSgrAQ?=
 =?us-ascii?Q?ZU0e/cNIREloDKBBR/tVUi05ZtSRGqYJZ8oEvpu7tnuHg0WUJ9wGrZpRltR1?=
 =?us-ascii?Q?Oldw5QIwwQiku+hqsSQqWdcDxWwtizb1euThzG7i626ZDWqv2lxtEB5FZ99T?=
 =?us-ascii?Q?veK25RUMrcITBoE02gt0XBuEfnYJV+9qkqf0pNhjBB/INCmJB6CBaTFWUQbX?=
 =?us-ascii?Q?KQFKVe/+F/bAdMP7wvd6sVjSoL+Vzz+210euWQtBnfdDIDaAjE3lX2cZPQ+R?=
 =?us-ascii?Q?hL9fLDY7OtUbmnewUR5dMB2KqNRPHHSj+8PbnqCq4NSEIiFNzKUp/WgIlh/e?=
 =?us-ascii?Q?xVs9cA=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Lg6RwufknhsXmIq3wBoMAE6H3g5hIFeDfIHzHp+KjA7xE8CuxSV8ldvsQJj6WEvYdD5f982WdD3MxmImRvJrh79bVicYogK9D1EIgcwCvQHDp34TunvGZf0fRFIt20h9BVPL/UJC34zxeSMjxGaFKdonHhEa25xZsKwogG+I3ts0nZY0vlOK1ufKzWy1cs1/W7ukn5WxKGC8tsSHruqZIRY5Tai/Wka3x7V2DKvxEPu8t55QtD/WBLfm2CUcZ8BkNUx/plMDb1LlqISev+gpVfWemcisyfUbvf8sVx6cDBF0zbvtj5A7A035zbuMpwR4nG+LxtPXn2O1eTRK0xRKn74vXZri/g/pdUTbB5DLH829pYULcjxO7Jb/awh7qF8GlNrd/IHLjL2KWu1JAAp2pbn9uJ1WdGPz37UTnwAlTeSoP6GdPNKYpxdnmBoNedn5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 17:23:34.4748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94389f70-a91d-470c-bbc9-08de67fff44b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_092338_881272_18B59B5A 
X-CRM114-Status: GOOD (  16.37  )
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
Reviewed-by: Andrew Davis <afd@ti.com>
---
Changes since v2:
- Switch k3_chipinfo_variant_to_sr() parameter from pdev to dev for
  consistency
---
 drivers/soc/ti/k3-socinfo.c | 41 ++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 42275cb5ba1c8..3a35fc456e544 100644
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
+k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
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
+		gpsw_variant = k3_chipinfo_get_gpsw_variant(dev);
+		if (gpsw_variant == -EPROBE_DEFER)
+			return gpsw_variant;
+		if (gpsw_variant < 0 || gpsw_variant >= ARRAY_SIZE(am62p_gpsw_rev_string_map)) {
+			dev_warn(dev, "Failed to get silicon variant (%d), set SR1.0\n",
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
+	ret = k3_chipinfo_variant_to_sr(dev, partno_id, variant, soc_dev_attr);
 	if (ret) {
 		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
 		goto err;
-- 
2.52.0


