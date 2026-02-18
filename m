Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B44E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2m98ddZ89hiWEYDEvhihOBUBnlsOJ4TJttEiVBMP44=; b=UnCcZMyasEioMjgFco+6mR27wo
	uk/P85ED9Wbng3CYwRLrHcNmLoKzk8pTdZmv1N6ukTdh0oQZCcbaaS8a1zjBHyKODS+2sVGjpCDIe
	MQNcxyyW496BWfYLeYjguVdunEqqryoiiADZlWUunckVJsX9SrlhqY9FjYm84JfDZpZM7QGpU7HCm
	6GCHLSqaGgozTTiGTXA/Dqnd2+9SI4PXsgt1kz9YMaq3f6qQi2yIjfBiG37+RnSB6sJfYFGrJ+qwq
	iAxtUaffUX5+7rKLtZx9G2lsQlS6JG/4aik1AR6g2EY0TMPRzYlFoZTL4861FVW74dIWD6w/vD41Y
	dBsezUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseFp-00000009aHt-1g5n;
	Wed, 18 Feb 2026 09:53:57 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseFk-00000009aB1-1S60
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:53:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWXz+OBpJzQkG+CpS1eJD7WjJpRaGWovtdqNZCla0F+hOecoiHYMZDBUUFIjzwzBd/6Ky7VMa3xEvDx8cAISMWy8qe822CYl5pL1DDzOlO5mEXd027VZsrXxG9rDz4lnnjdAoEC6l8Q3lKxbst8AGhZU++uZhhhyetpkJmn8cxNQd5HzctMnaShtrpWavWWSbHaA9w6BuowpBgbgyLQfap+dq5Vq0SzniqXC04ooPgUBTeTSakVESX+oxO8oZWRhoSialjhzroURwsxCBpSRF+7IoTcJiALhcEF0dwrZLLhsYNSzBUIZS9sAwbFcwXlOO+pyVo4A/eYF09g+2fILnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2m98ddZ89hiWEYDEvhihOBUBnlsOJ4TJttEiVBMP44=;
 b=NdsRZ5l9P8yskQhH3iRvMD7fSdJhmpmIdh8xXccighkYpV5Xu5wovDFrt5U/yCtKIOWw75enj1Shreg5gKT8YLXtrcUKdSSeO+xJ0z2KaoINijbi3TQr6dNNAtbTZab5eTTrvj3HGLZEoZJ+uZUuvBnW81qmD6TGQvNP1MJfJlgiB1vzKGgQTXEdwoH24HtbM0Yzn70OocT7ANxQdtF9n6dYkAT8RYMRWLWeXX1eHbTu0eCQFdgnqpdOMPq6y+kzo5XBLAQjD2VahK6jOYsUDG5mcl9LrEzt57g9jjcn27I10gbKXrGfuBVYYD1nNEGu5qcnh3SRqmS45ccAwf3kPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2m98ddZ89hiWEYDEvhihOBUBnlsOJ4TJttEiVBMP44=;
 b=lMi+MfTds1gFG2ycXDgSHtcEs/fJPamlNDKBWf8iOOjXJapwf0Ceqo+f1J5iOUhH4JYo1Bck4dIIP5G11J0OzE6SPIiuPKSameZXgUc8ZpArXnQscXsMDrpbjO32YP/9AG3Md+QpiQ97IdgyMf80XZyIp+3WfLwPdFnSvLqdYos=
Received: from DS7P220CA0037.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::30) by
 DS0PR10MB6945.namprd10.prod.outlook.com (2603:10b6:8:143::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Wed, 18 Feb 2026 09:53:48 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::f9) by DS7P220CA0037.outlook.office365.com
 (2603:10b6:8:223::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 09:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 09:53:47 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:53:44 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:53:44 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 03:53:44 -0600
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I9qpIH200561;
	Wed, 18 Feb 2026 03:53:40 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
	<ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
	<Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v5 10/18] dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-common.c
Date: Wed, 18 Feb 2026 15:22:35 +0530
Message-ID: <20260218095243.2832115-11-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218095243.2832115-1-s-adivi@ti.com>
References: <20260218095243.2832115-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|DS0PR10MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdad49c-8179-4afc-57b9-08de6ed39c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IlgiuGgnlkOXUhFXlJSJXZHzoWj+7vL06tdep0VVJ3wDQs7hu45Q+lwx1Ce9?=
 =?us-ascii?Q?tvi9wTe2mXqnKhTZIVtdu+xXHp5JzFgK48+6pED4XCic4YsgjlUs+fubWQye?=
 =?us-ascii?Q?6GOLH8cDNNfIeHsEesnOIX+C9TNQ23pZTRXTODhd4/NfN3/Y3bvukqBH1SpV?=
 =?us-ascii?Q?9qa902JpbGw3T//IrVlvTaVuu7U4TG9Tjw3OJDB+J+xleCH8FTXBA9rQrqSX?=
 =?us-ascii?Q?QnHfPOpaGQqS3CzwiPb4Js9xImmiCzlKfebLNknn6gzJqqoSE4bGPKbUFxIU?=
 =?us-ascii?Q?kBwp88Kp16yjgbPKYu36gdy6ubNvxY050Sq93joCdiIukv45J5H+XiU31zn6?=
 =?us-ascii?Q?JWSOkXtAhRMrtVVdtj83oCG5pAAOOtg1qnS8R0oY3R3pI0D/igLFkJHDHWLf?=
 =?us-ascii?Q?3ImcZp4OyYVADbrnMLn72sz4ZcoZZdh2Ou5TnooVYk9h3fXK/7GyX8euBaOD?=
 =?us-ascii?Q?L0leH1ndlXxJX6cb/XHFh88GcMuHZFYbD6u2LHgBEY9sZE5/cGav0+Smyw6j?=
 =?us-ascii?Q?mVSAYoku8GvV/2UIIhXnmjM7Rl4uiGlAYjG/zRceZZbfmIjOVVk1iGo9hMQ+?=
 =?us-ascii?Q?y9uloEV1yNRw4LaYEqrtVuDrnzmDNfeXPhEudiHYGm59CfPDetbecE1iNp/B?=
 =?us-ascii?Q?bv8oENwoJCOwJB6qwjdRhV1BhzFuZz8V4DHG5a+GSDD0PmyaW6aaAn18HkkF?=
 =?us-ascii?Q?HKO20A2JtEksOeAnzqtAT1C5sxcIqTqemIaLPsqcK3Rj/HkAWWq2+XS8JAxL?=
 =?us-ascii?Q?WZHgkYQcRigGvZiAFooTOBfrR/Yqbv8XAdd665eAYGUavGk0YKlJG0qSzKc9?=
 =?us-ascii?Q?MqWMSJ4Bfyt2IE5AHWUeCuzCYmlsAgChxQ4uGAb3Wv7T9kGZdHKxoneJMnQR?=
 =?us-ascii?Q?fF6mQcEpGw5Wasdn3sNN3iLwEGniSyHnlz9Ve099QeXjp0v58YojGUbyq3gM?=
 =?us-ascii?Q?EJvxODaZJF73oQrpNb5SFh7/vmLI2XUAs9qoUjoUWzL0rdcpR59bh143XhTm?=
 =?us-ascii?Q?G/YlucL0NRPSi4Y45YGHEmFTNvEPCK0yObGlO5lJUc4GeTCFqrETHFsfZ+bE?=
 =?us-ascii?Q?slkFQr1glymTcuUrTTiS+jeB3WTkz49sHBJpMf1t0y/ZKLG8EjIYAM9bXWan?=
 =?us-ascii?Q?g4sX1vXfGkYurQ6zFYskErgcVIdfZKWmkCeXEe62HGVU5dZlNYAD6FUDJdNj?=
 =?us-ascii?Q?2w6Ld8D9rnrbhJyBWqVPiljANgATtzT/18JrVvPL53i62R+/eTuev7jD2Df0?=
 =?us-ascii?Q?vZyw/PzMuN18Jmc+axx/8qHT1a5O56R40TtaDaB0KT5DayW5tIZ1jD8JpRSy?=
 =?us-ascii?Q?BKOgYGZRIhPqYSq/qVo1wK2ORe2irAjNG+IrX0gHdX5UMhJyHKXsCzmI+bV3?=
 =?us-ascii?Q?XAh5+gc2LmMZMTXyhxnwdWVgcaVbWARkFaGLKnzMp4YG6ciGQ2xLnurCr5Rm?=
 =?us-ascii?Q?pH3ZFsAk5BiJtFhvnUK7aS5OlJW1TSLK8pvHyYG78nD9HvMUxMi0qEtNzLbn?=
 =?us-ascii?Q?R/K5ZDFKSNyjOffyhVv20BAWvvZ+aWmwzyOFEcGThL337FfPeWL7TVEbMTNo?=
 =?us-ascii?Q?2K52dU8z3sGdNwLDLOtvVaeoftYEIMRgX3KrmCgvaBkx/6wLP82ZFtppHemF?=
 =?us-ascii?Q?bsKu3TOFIfy3poeRVtK0OH/ckdS4y2dVJo1Apyza8YvIqUyiWDCGimOVYC9E?=
 =?us-ascii?Q?lSHk2exsf5+ETuhyKWvWcmCCzvM=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D+G/poAEzVxA8Kpix5L94al7HTPRxkVD5FeLqArkeuM5vxEm6OvybpXjho1BcMyyb2BYqaLqrebz8Bx0ResMdcjujByhhLCP5MFr/Tql03Fgm4FJ8s/Q3BlAx7X6ImQvsrh/+z97EABzNEjYeSl+1KL069xYIJ/xHnM2Te9oBra8feSvRu34x/xM2voeazmN1EWxf9E5OUeQmGIg/UWbHYQXJ+NEw9yj9CNL/VyqRqtyAiatz1RKrbE5cFZlHvApbobRD16eUq9fp9gjhA8NHfGsywvmmXcNLDML5V49OLH3pe4DzsHXygA/8JIeKBEPsn5/ds79j9x/I0J2Ieb8RCGP+25jwhJaJ87/XauQ211Q7ehHqz2xsPtIaXdHy2EI9nKBPcBoE7U3Kn2CW723PJJyZm5Qz3kGvb+0dAGkcx8KDDA+GdqabKyMbIv4ZJd1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:53:47.2877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdad49c-8179-4afc-57b9-08de6ed39c60
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_015352_399108_E998C2FB 
X-CRM114-Status: GOOD (  10.02  )
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

Relocate the #include directive for k3-udma-private.c to
k3-udma-common.c so that the code can be shared between other UDMA
variants (like k3-udma-v2). This change improves modularity and prepares
for variant-specific implementations.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 3 +++
 drivers/dma/ti/k3-udma.c        | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index b419b23c401a1..0ffc6becc402e 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2539,3 +2539,6 @@ EXPORT_SYMBOL_GPL(setup_resources);
 
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
+
+/* Private interfaces to UDMA */
+#include "k3-udma-private.c"
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 83cf3d01f67fb..a8d01d955651a 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2857,5 +2857,3 @@ module_platform_driver(udma_driver);
 MODULE_DESCRIPTION("Texas Instruments UDMA support");
 MODULE_LICENSE("GPL v2");
 
-/* Private interfaces to UDMA */
-#include "k3-udma-private.c"
-- 
2.34.1


