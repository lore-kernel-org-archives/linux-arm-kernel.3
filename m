Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9200CC9EC8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=; b=epr7yDCpB+OEik66nOMUqduvrs
	J99zdV6iPCghR05i5bc0UaKlYphQ5Mxna7xrpjwuM1sQfqn4rLPtA7uz80kG6sNPSvfWLEN+bI9lW
	0mvp8+QC/UW2M2/RY2u2imUDakIiifjkVEoeV1BmnhfII4w3IzqIhhyaHJajFRZNsPV9lY5T8/J1E
	muTr5P+XhMvVZvp8gi/vOW//4fE0fOe6kKGwhN9IIs62dkB0z8zmOroWKjmcc1pt0cj++wlFijWFv
	8zZ2ZjWhN4g2T+MQBjamCIP2b33WfY9fcSyWz8W49KOK03iR6irma91Um0HSxCwUUjiL0C8lKITdV
	2JAmGPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHfV-00000005NiQ-0NxO;
	Mon, 12 Jan 2026 13:09:14 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHfN-00000005Ndb-2vvV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 13:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkTt+V8vmooVw4TOFa/QqY+ZhvTPHxFla0gN/AIqDgCgKdBtSyQ0Ae3jbHYcMZpXu/rw8m5LnAzN91CYt5nh+Lq1wPEV+N5lRtr173j8edzykAVUJVzg3QwITk2ASEQFkHxvT2mPc102gzp9O5e+9WOlpEj30H0pgp31xbDwqCmnoLAMbaZf5qpt5Rtjj8LWyHAwYpwQRJlxiqBy6wtO30uvwG+tkCUsndS1d8BD9cwV6Ztpzop8KpvPqzwAaJrrQ+n/uP2CvJcOP8egKyc/5bFdXbbK6aFGfUQJQzr+5pi053miaNp7+Na9XfrKLQ+0GPaHnaFs77qhch9UDpimXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=A7v8N6VCfdta1U8yH87IYFvHWkVWWNjBLVhepIdaB2zin6L83iCLRj7mlH5GJOGKnL41Z9/IMdqIa1F72ln13FF4+C5QV8/Wfo+vLBJXxURsftsK9mQf78taCL6wqVT579upOZcB/KIJMlB9Jeib2FvimpyUbFOM1HlQbLeAOuPcvswOk7QbOcLitoQKbFpI9ItmFMymCNcMT4N8+wQdrU/qEj+6M/9iUN8oKtDj+3IA11IrYxl6hKZnHj/2DU7DFzC1ST0t/UP/ocNeq7pCSLYd++YEl7gYvEcfgUzvEgszxo3G2JrCigz37hPEh9qidcsxkMn7mdEBAsO/RcZQ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=H0YIwPNCYbfIfBFJxNBOXqoq8rW6zdReA0a7Sdi+YA9BrHAm2Uk3GZ2xj6/iBn83iv8tNDkbt4ZlPw/pC5komv9lVUMHJDMfmxLkQmZDC9QX0Gt3/tZU7vMAjve32BPrem1B5pDzSSWhChvFQk+6RMemTaM26bsJtaLDkb6WYYVGyqWCIpgaHoN3RJn0JD2mizYMZYgbOR14tCN9AWG6vZ2/chdeLGh/bBNNy41lfTu7c8dbwp6LwyceY6XeibNuEfZ3EQyUl6l16eV/yMnoLf9IoLayn0ssdZ4BclQsk9tpjgYFm2Q8GTCVnpMDbLh8J60cvWsBrasDwo6gKCHoAQ==
Received: from BN9PR03CA0544.namprd03.prod.outlook.com (2603:10b6:408:138::9)
 by PH0PR22MB2876.namprd22.prod.outlook.com (2603:10b6:510:fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:08:58 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::9) by BN9PR03CA0544.outlook.office365.com
 (2603:10b6:408:138::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 13:08:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Mon, 12 Jan 2026 13:08:57 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id D4AC9F2E71;
	Mon, 12 Jan 2026 15:08:52 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] watchdog: imx2_wdt: Allow to continue in low power mode
Date: Mon, 12 Jan 2026 15:08:49 +0200
Message-Id: <20260112130849.3748465-3-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|PH0PR22MB2876:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c83cfa06-5642-463e-fd8f-08de51dbbf40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eWZC3J/cTJ2J3UJUij6VL+XZF1QTKnmzL8twdaJkBdoxgtcVb3uYgw9QZ46C?=
 =?us-ascii?Q?L0DuPAX7t67tL9imQ6PDFsVWEcOVHJSO5/0eDNHurMm7a+eQ1Dro89Qn7nlk?=
 =?us-ascii?Q?MNtnFE7LGsYOKPxgWlILnYrVQVDL0OyYgdkRbsJn4qSff3IMQvXZ3iiA/Csc?=
 =?us-ascii?Q?SD3wXnYcPolqGH2EjxpBhHRI1PbXywMnUkLAzxQFAdQakm6dMnaiizrJcPuz?=
 =?us-ascii?Q?RY6EvwZ6s8CS4DEejY/KnlvkjEeTm6pR2s6ZgCayr6Youm8W0UG08UzIloDy?=
 =?us-ascii?Q?vusKaGG+Kb2ReZ+xY4nZZd81Vk2jGCmqkHoOtTKRO/CB/5zX0JSJgOajcrD6?=
 =?us-ascii?Q?nd1lnqZsSieCyXANH2AY5AVJ2ZwBOt5jELKVj9B5uvLPduMiBP+tLMwXGs+I?=
 =?us-ascii?Q?nvX0aLZg6vc5IvKcc9BAKOYl50vxxXtft8HVF3WipgR2OxnjzFSRLbjes1IT?=
 =?us-ascii?Q?nAfRc5ofxrMskCsc97DGBxEq+CkvArQbF5eUQ3TYwlnvDRpQHkrfJKf5tkha?=
 =?us-ascii?Q?bN/vxHzNRzN3avVkTknCXXYbtWBfhNTAWq9YsJpcsIaWGAOuJTL4i5SKiCkZ?=
 =?us-ascii?Q?D+8LKTbiuC17gkbLpNqXeyPQ+f0PB8KaX1OV3JM8VEb4c6u9lIkycX5idqID?=
 =?us-ascii?Q?cpJfpKe7FIgLT6BZ0YaxQlcg4tyxs75HZeZrcN1QF9s/e8cKRzxPDYPYqCaS?=
 =?us-ascii?Q?vcKqMPenUhJPXTV52K1mrmamgJpbGoGZTU9+htsE/httxMTZ0bikLzM9+PCG?=
 =?us-ascii?Q?YGmhXTb/ZsIIgHeknrfD38b0MnafrmpaAjAdm6eaeikYpbwN3mOKsSjDx6hL?=
 =?us-ascii?Q?SAY19/YUgT61bDA57EqO9pdSuN4sunD5E5doIhwXwPBVYMbdvEpBzZ5q3bO+?=
 =?us-ascii?Q?Of5xTT3bsA9lV+lBFK85oeWjSd3uOR8hSd64I/jIPg1m7LlBQtbMoS9AzB1k?=
 =?us-ascii?Q?U0i+I69k8fEHCLtinlEQL6FuvubjsYHCM+0eb0QtEhYGQoqbriCC3FO1+b/N?=
 =?us-ascii?Q?boTFg4Za1XkoR+vaXYsttgb3f7bk5l4afnxoaJOzhcWpknavlxOo6Wa+J+l9?=
 =?us-ascii?Q?8jHEeW1CEQyb4jbJeMj5UXMq5N+1GJvVhUgExhav5vrIRi8F6kxabWHur1aQ?=
 =?us-ascii?Q?lpq202l131wA06cMhnU9cSXXoaO5VTnxjjWkmI0rFOiLdQ8IK9aSjR5grpyW?=
 =?us-ascii?Q?oXU/2P7U3ZnOsTiESloY2OGS1PwqcbtoRFDwWKp4z9/pEeITkWhv+qrimQK7?=
 =?us-ascii?Q?qHf/BR6hiukIie1yIue31ptTAxaF9l1Cxe7tlJePJnT8PsDaXqN4k+y/zmVa?=
 =?us-ascii?Q?te2+jqbLXVndVFiU0ecWZmReJZ/8HlRO5ctc3oQSi4bwGgqNEx5uXniTXAYh?=
 =?us-ascii?Q?KDcXkKFchEBex6AhgTScegkLRJvCN/0qu93SZxo84qcA13mhRrIx9WQPf7rN?=
 =?us-ascii?Q?Cp/m+UjlzDwketXVypWdzMnhPz6HPMUTwXvD76t2Td3A26Q/zRBWsHwwEmsY?=
 =?us-ascii?Q?sxPf+DEa7yI/ZqUlqiiztYXpgDTE4Z486LcdhySwAEqBhv5KwGcWd2pUlGkb?=
 =?us-ascii?Q?75EToMP63mkblcToOwo=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:08:57.9220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c83cfa06-5642-463e-fd8f-08de51dbbf40
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR22MB2876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_050905_739621_701A1FF5 
X-CRM114-Status: GOOD (  14.28  )
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

By default, the driver suspends the watchdog in low power modes (STOP
and DOZE). In some situations this is not desired.

Add the possibility to configure the continuation of the watchdog timer
in the above mentioned low power modes.

Note:
Please be advised that the difference between the variable name and the
device tree option has been intentionally selected to uphold the
prevailing driver functionality. This ensures that the watchdog remains
suspended by default in low power mode, while also facilitating a clear
and intelligible device tree option name.

Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
---
 drivers/watchdog/imx2_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 4b3a192ee3e8..6e837cfc3c5a 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -71,6 +71,7 @@ struct imx2_wdt_device {
 	struct watchdog_device wdog;
 	const struct imx2_wdt_data *data;
 	bool ext_reset;
+	bool wdt_suspend_in_low_power;
 	bool clk_is_on;
 	bool no_ping;
 	bool sleep_wait;
@@ -135,7 +136,8 @@ static inline void imx2_wdt_setup(struct watchdog_device *wdog)
 	regmap_read(wdev->regmap, IMX2_WDT_WCR, &val);
 
 	/* Suspend timer in low power mode, write once-only */
-	val |= IMX2_WDT_WCR_WDZST;
+	if (wdev->wdt_suspend_in_low_power)
+		val |= IMX2_WDT_WCR_WDZST;
 	/* Suspend timer in low power WAIT mode, write once-only */
 	if (wdev->sleep_wait)
 		val |= IMX2_WDT_WCR_WDW;
@@ -326,6 +328,9 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	wdev->ext_reset = of_property_read_bool(dev->of_node,
 						"fsl,ext-reset-output");
 
+	wdev->wdt_suspend_in_low_power = !of_property_read_bool(dev->of_node,
+						"fsl,wdt-continue-in-low-power");
+
 	if (of_property_read_bool(dev->of_node, "fsl,suspend-in-wait")) {
 		if (!wdev->data->wdw_supported) {
 			dev_err(dev, "suspend-in-wait not supported\n");
-- 
2.39.5


