Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35828D489A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XXUdDl56XWwHf025a/0Qu9VsfN6W/tz6PoWHWTL3u4=; b=ONoafLrLdY43dhot3p0Njg4zB6
	4PL5QzRWzf9P09xJwZ/uAyoXZXG/BWwLNyyQACHcRDQGJvAKEK6aVevJWGcS6KALkLl6KitdzywC1
	pguLeJMO+taoMRRWLboJkSxcfFBJQ8jJGiLw6DxSL59FmQn9hbx1iRf16I1v6PyOyne3BAqdLem6N
	O3SLy/t0uK5ZqDNf2zlaWzfPdAuzQMd1uUllK97EKLsW28gjMQLFa5P9jqIjS8xH71mmvHky01uvq
	WJyJxplzP5KmVefra7Zy6SczgZB87mKSDzAa2Hwb2A56eSOiqqBtVusSFJGK4xJ8Eg/RD8CD1tlBI
	1I6mKGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjbs-0000000E9VN-3geU;
	Fri, 16 Jan 2026 13:11:28 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjbn-0000000E9T7-351r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 13:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/sH3gqKWeen7cBvkYc5DHg41clZ5lNPL9n6qrrBSpTZ2LTnH3IlePwa8yu4Ld69RFmDjQEejZE/JF16S61kzAKqNNL638p3yy6+hvcmaSbOtVIn+35LAANEjpDzWrfgJ8NIVeRRzveqQh6VRTfxX8Q42xYci9Z5fSGy6UohovAuZXebRPp65Vf9nBC7MNuc+GjWCdUZ4owJquT8cThT4gjNIWd1X6KPHNpzm17bWREF2B7OY49XpoQmtgByU8SWpvaLeBBEjt1S8StxS6sWB6sAstArqXxV4bPPjNTj/ffLe8DZBvlq3f6EYqYl5kShAEx6yzzDzo5vPcFuuhIFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XXUdDl56XWwHf025a/0Qu9VsfN6W/tz6PoWHWTL3u4=;
 b=seIxclNUW+tz2e87a53c/SSY3mjfROWOL8dFyr8XFqYlvUYFjCRU2OoGM7NSZL3GZHkxrxb2/unNFDrBOkr6M7L8bC1A9CnQOvcYaOEr8C7Y6Wyvn6RRp+EgBhE+IkTrYPN8QmaRkKWpI4H9wbk95JGrJXREjAMew79erP4NO7D090818XI3DHfeqZ5vohxCfW7W2RwaOo6h1SSxTG1rf1UxdtA66r00eBPjLr3JrMy8q0fPQ97uXcIADm2rYd8ho5aMfmhVwshxy+1ym6JOeXsVM6ykcY+W4L9PTldywuGpkep4p0gmK+ObV4NTBIt/rgX6bhvOVgdqCodjeGBGVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XXUdDl56XWwHf025a/0Qu9VsfN6W/tz6PoWHWTL3u4=;
 b=drWml+QvdRjmjY5Pz3pIOQL2Yho5iPmbzMcXZTC83wiyR9JX+tWy5PafK745lQ8uL4SvIpuNpJ0IAqAz8YjN17B48V/x9Adz6uvUZGUkkyNFAkCzskY54WI9KmJdi4Vh9aFsPORvOYtL2HbTmzH7C5fb6ivDq1Mf+Pgg1BvOVj0=
Received: from DS7PR05CA0042.namprd05.prod.outlook.com (2603:10b6:8:2f::29) by
 CO6PR10MB5555.namprd10.prod.outlook.com (2603:10b6:303:142::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.5; Fri, 16 Jan 2026 13:11:18 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::6) by DS7PR05CA0042.outlook.office365.com
 (2603:10b6:8:2f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Fri,
 16 Jan 2026 13:11:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 13:11:18 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 07:11:18 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 07:11:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 07:11:17 -0600
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GDB0HH3181044;
	Fri, 16 Jan 2026 07:11:12 -0600
From: Aniket Limaye <a-limaye@ti.com>
Date: Fri, 16 Jan 2026 18:38:42 +0530
Subject: [PATCH 2/2] drivers: irqchip: irq-ti-sci-intr: Allow parsing
 interrupt-types per-line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260116-ul-driver-i2c-j722s-v1-2-c28e8ba38a9e@ti.com>
References: <20260116-ul-driver-i2c-j722s-v1-0-c28e8ba38a9e@ti.com>
In-Reply-To: <20260116-ul-driver-i2c-j722s-v1-0-c28e8ba38a9e@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, <u-kumar1@ti.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>
CC: <j-mcarthur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Aniket Limaye
	<a-limaye@ti.com>
X-Mailer: b4 0.14.3
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CO6PR10MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2582da-7537-4f03-bb0f-08de5500bcb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkgzcUhadWM5YW1MdENsL1h3L3Z6R3lVL0ZuZElzTXNYdmNsSmxZRE1Id3Mv?=
 =?utf-8?B?dDRXY2l4czVjdGxDREVWTURlWUJiV05mc3lOcGdnQkVFSU95TE1vVWpiWGJT?=
 =?utf-8?B?VXE5cHNZdGhaMEpuKy9YTWhDdlRUeHRja1cxUktUU09LOVd1Y3JWcW1SWmtO?=
 =?utf-8?B?a1A0Sld4Z1N6UzlTV1RzcnRrQnNsVTBjR2NsN0pQMDVrVDBRWHVDVFRvRHA3?=
 =?utf-8?B?SlNLV21pd1QvT0Uwcjl0dXgxbmUxQVpvTTVDY3psVE5GekZBMGJ2SlJlVkZB?=
 =?utf-8?B?dlhWWlBOZjRSdFd5ZUF1anpiSHBJYU0zSWpMdlhBYVNCZ1IyVm5kRlhvYWhm?=
 =?utf-8?B?UGZram9Dd1dxbTFTQ2VOQWUySGxqcEJFb2IyTzNtdGhMbU91Zno5MXB0MHJv?=
 =?utf-8?B?b2xvT3VjVlRkM3dWeWhPTXBkUU50eDRobzZXZUNIMDF1NyszY2RJR2ZrNXpV?=
 =?utf-8?B?TGZIc0t2eEIzMENaWEZ0M0QxM1dzbE1Fdi9MYkE1d1VvMGh4cWowSTVyamJw?=
 =?utf-8?B?RW9WRXpXbmZVVVQ0a05URzR0eEtRVXdCeDR1RzA2aXoxSXN4N0JKa2RrR04v?=
 =?utf-8?B?MmRyL3llanVWUWF5RzFWSENKVE5UNDVwK2VrL2ZuSjZLU1NZeFRYSy9HL1c4?=
 =?utf-8?B?UWFIZFgrdEJkMEhTMENNenRmMk0zYXRNblhCMTU5MjNTSnoyUEdVRGtOSlhU?=
 =?utf-8?B?Tkc0K3hwWWJEc2RjRWwvblBGSkI1SXNSQk9odm1Zb2pkZG8wVzJydU4yRkdC?=
 =?utf-8?B?MGNKb0h3L2gyTWduNkNWaVJ2WFhydSsyZWxFNU9IMWFTQUlqWmJ6VzMreC8y?=
 =?utf-8?B?Ym1hMklQMDAyQ044RVZxbkUrM3liSDhvY3Z0L0V5VUVyQi9RM3B5b3lkNUdi?=
 =?utf-8?B?VE9MaVNJV215WHFVYjIvblhISkpGUVBTNmk0MTlJOHhTbStYb3hidG00T2ph?=
 =?utf-8?B?TU50TElxMlUrR29FaFJmVlhwU1pXQ28zSUF5QjYzR1Z6bHUySjFCeEZ6dE03?=
 =?utf-8?B?Sit3OFEvc2xQWldhVFJEQ3RvUncrWTdJMVVSbXVBV3lBZ3pWWWtnc3orQVVs?=
 =?utf-8?B?SmdKeUoyMW1xdUZpQkhhQ3d2MFpVVmFjTWRYbzh6N0VibXpEVE1BVVNWTHls?=
 =?utf-8?B?YUc5ZW9mbnJrQ09qZUJiZVJWYzloek9oZTVXamxZcC9GdlQrb2FoSzBNMDk2?=
 =?utf-8?B?bHdyTE91UFFSQzA0NkxVUlNFZVF5OEpYVFNZNU40U0x4cjIxV3dwOUVlYjNY?=
 =?utf-8?B?blYycTlmUnlxU3IwRXhjK3RvRGFodnpWS1BxR3gzcTNHYThzL2VKWFdGbW5C?=
 =?utf-8?B?WkJQRjRTWHZUV1U5MkVhQU9RYkZkd2VHVVc4QW01dmV3ZWN1SlF2QVMra1p2?=
 =?utf-8?B?dkIrVU9Zc29YT1Q3MkR1RFZGMWJoY1dMdmVEUXdJRFRvdU9DOGxHZXdsL2xa?=
 =?utf-8?B?eWNQMWZUU01vcEhxL0J6ampIRXNqNXZCK21DMU5WUVFLM08xWDNvKzZIbmlH?=
 =?utf-8?B?aGVMUUpSVTZEV0FXTGs5bzh4MVdMV2NWcGRyWFFGV1ZWYk5PYi9DY2JwMTY4?=
 =?utf-8?B?U0tEV3JGeFZFNkhjV2xFaEYzTlAzNUJYUDBjOERvTTlQV1VCRDFvVXdyUEEx?=
 =?utf-8?B?ZDEvRHFPMFpvZEE4dGM2Y2wvOHExcGMxNFVuYVdPcXNxZG8rcFJGbXVETm9H?=
 =?utf-8?B?MzRoQmNDb0JsYmpiL2VVSmdjSDdpUm82NzZ5bTl4V2VXcnB6SVpKMnM5cDhk?=
 =?utf-8?B?VHlnMDBZUlkvRlc2S1hCWGY1OENsby9xeUpzcGxCbGF0UmpXQ3dHQWgrSGFM?=
 =?utf-8?B?SjMySjE3ZTlxWXlqQVJlNmtQbnJhRmJhSjFtK0FxazB5WU9HMXpRRjRqdkFn?=
 =?utf-8?B?Tmk1UHpjMmI3Zkd1NEp0NjZiQTJ6QVlHM2NTWTVScHIyMjVhU05OMWVyOFYy?=
 =?utf-8?B?YWJCajJXOHNkNnprdDk0TnZSR08wTVNac1hackVFYkQwT0M3elpnRmxhYmxD?=
 =?utf-8?B?b0hadzJvL1pQL0laK1plNm8xMHhxbm41dDc0OVpmZy8xSC90a09vZFp5NU9Q?=
 =?utf-8?B?WVkwVFc5ZmxpS1NFbjZPRUVDaUZ1TllkTTRDZWZtby9FbzUrSWpqVTVzMkcx?=
 =?utf-8?B?YzdwL3lvK1lXMC9YbjBNMEJZWnRQTnVxOGM1emVwelA4SDhrME5DNTdrNFlS?=
 =?utf-8?B?b0Z0aTZENitsWitsaWlkSExzeVFTK2k1UmdpaFN6cUxydWhRK1BYTFM4UzBZ?=
 =?utf-8?B?dE9TLzVtU0lSTXM5ZEhjaFB1dUFBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 13:11:18.6860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2582da-7537-4f03-bb0f-08de5500bcb8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5555
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_051123_784133_9AAF8C56 
X-CRM114-Status: GOOD (  18.99  )
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

Some INTR router instances act as simple passthroughs that preserve the
source interrupt type unchanged at the output line, rather than converting
all interrupts to a fixed type.

When interrupt sources are not homogeneous with respect to trigger type,
the driver needs to read each source's interrupt type from DT and pass it
unchanged to its interrupt parent

Previously, the interrupt type for all output lines was set globally using
the "ti,intr-trigger-type" property (values 1 or 4).

Add support for "ti,intr-trigger-type" = 15 (IRQ_TYPE_DEFAULT) to indicate
passthrough mode:
- When set to 15: Parse interrupt type per-line from DT
- When set to 1 or 4: Use global setting (maintains backward compatibility)

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 drivers/irqchip/irq-ti-sci-intr.c | 50 ++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index 354613e74ad0..56028a33a41e 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -61,11 +61,22 @@ static int ti_sci_intr_irq_domain_translate(struct irq_domain *domain,
 {
 	struct ti_sci_intr_irq_domain *intr = domain->host_data;
 
-	if (fwspec->param_count != 1)
-		return -EINVAL;
 
-	*hwirq = fwspec->param[0];
-	*type = intr->type;
+	if (intr->type != IRQ_TYPE_DEFAULT) {
+		/* Global interrupt-type */
+		if (fwspec->param_count != 1)
+			return -EINVAL;
+
+		*hwirq = fwspec->param[0];
+		*type = intr->type;
+	} else {
+		/* Per-Line interrupt-type */
+		if (fwspec->param_count != 2)
+			return -EINVAL;
+
+		*hwirq = fwspec->param[0];
+		*type = fwspec->param[1];
+	}
 
 	return 0;
 }
@@ -128,11 +139,12 @@ static void ti_sci_intr_irq_domain_free(struct irq_domain *domain,
  * @domain:	Pointer to the interrupt router IRQ domain
  * @virq:	Corresponding Linux virtual IRQ number
  * @hwirq:	Corresponding hwirq for the IRQ within this IRQ domain
+ * @hwirq_type:	Corresponding hwirq trigger type for the IRQ within this IRQ domain
  *
  * Returns intr output irq if all went well else appropriate error pointer.
  */
 static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain,
-					unsigned int virq, u32 hwirq)
+					unsigned int virq, u32 hwirq, u32 hwirq_type)
 {
 	struct ti_sci_intr_irq_domain *intr = domain->host_data;
 	struct device_node *parent_node;
@@ -156,11 +168,27 @@ static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain,
 		fwspec.param_count = 3;
 		fwspec.param[0] = 0;	/* SPI */
 		fwspec.param[1] = p_hwirq - 32; /* SPI offset */
-		fwspec.param[2] = intr->type;
+		fwspec.param[2] = hwirq_type;
 	} else {
 		/* Parent is Interrupt Router */
-		fwspec.param_count = 1;
-		fwspec.param[0] = p_hwirq;
+		u32 parent_trigger_type;
+
+		err = of_property_read_u32(parent_node,
+					  "ti,intr-trigger-type",
+					  &parent_trigger_type);
+		if (err)
+			goto err_irqs;
+
+		if (parent_trigger_type != IRQ_TYPE_DEFAULT) {
+			/* Parent has global trigger type */
+			fwspec.param_count = 1;
+			fwspec.param[0] = p_hwirq;
+		} else {
+			/* Parent supports per-line trigger types */
+			fwspec.param_count = 2;
+			fwspec.param[0] = p_hwirq;
+			fwspec.param[1] = hwirq_type;
+		}
 	}
 
 	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
@@ -197,14 +225,14 @@ static int ti_sci_intr_irq_domain_alloc(struct irq_domain *domain,
 {
 	struct irq_fwspec *fwspec = data;
 	unsigned long hwirq;
-	unsigned int flags;
+	unsigned int hwirq_type;
 	int err, out_irq;
 
-	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &flags);
+	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &hwirq_type);
 	if (err)
 		return err;
 
-	out_irq = ti_sci_intr_alloc_parent_irq(domain, virq, hwirq);
+	out_irq = ti_sci_intr_alloc_parent_irq(domain, virq, hwirq, hwirq_type);
 	if (out_irq < 0)
 		return out_irq;
 

-- 
2.52.0


