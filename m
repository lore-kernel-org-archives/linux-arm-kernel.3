Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C58CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kvCL89Ro3HL9rEfL+xQ3eBNuiik677mNHRJlZk6NJg=; b=vevFWUPhdTeybCcLPYgKAwOogf
	Lh1ZYp2XI5ksEGfwJy+FNqwo/bdalfbw8QDuLNaQTP2zPHAK2YHvFCoLrfY8ZP2xK0qLcqYJexzX3
	lpep/vQYYUle95A+yfr//bZ3KsP/nu7OvD2D6K76s7Z6vgjO3qHG1Vdv0IsImhcWda/OlGhVhW5IO
	BfUszHsG0xaWOsuxqRp2dfqH4lrrkDbC8b/67VBkj85RTe67gdrXZ3DVY6SzZ5gA2u8vdO55nUIfv
	QuEU5pjmWfCR2Q9/dDr4WAsAsQbyhNvTrhtkkCOj5p+jT7C5BwJxRqAV0A4FQKp8SBR3IBemccpsD
	2hX6gSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZO-0000000HUFx-3lUv;
	Tue, 12 May 2026 17:06:58 +0000
Received: from mail-westcentralusazon11010028.outbound.protection.outlook.com ([40.93.198.28] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZ8-0000000HTz8-2IyY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWaswd0UFInXzEvHqqDweInKtuPJADfgF38vo2ONBDrYor0F8RXyF538PUuShLkoorUrh3rHdo64zE1C4hno/pXkaEGcS4Xq867CkW9nDgr2/Frjnm3f9FOna7K5KMmQSA7oosHXjAEH8wu6orV1DwrDYkYaV6DK9HBk3nKpUiJYYNb7COz5/Mb7mPuL1ODRuQgSIuyTqnxCXay1a984GqDNbGLA1pTzi0P/i9J3901VTdo9yYKH70sZWceXyEkqR6AFti33FvFIOnOdvFq/bbdE4Ki+RjGk2ZN0lsPg7dQo1NhQwwZe3DAa3UdCYNjCTCkp/T/ac4iet0+M2xnCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kvCL89Ro3HL9rEfL+xQ3eBNuiik677mNHRJlZk6NJg=;
 b=Y2VshKek01qFwlMgT6G7DxvF2DU50E37ROAOv3h5dOK3XVkp2Id27Uy+vEe2SJ5AmGoeTaNeIeciNuwt9jbFnp4vOzocvQHwgbnvgQLY/NrhkeBg2qV2XDVdcT6a5Yv+EMqsC6UtrXi2NEwqjexVVxwlq2jkHhQYgXCGB4BqUUVfvZgLvF0vwB0ATMjxqz+bO7I+qEdcMRs2RcA/88menYLz25FzC0GXuxNJUtpf8d9vUikRTtYHuiAWoHqhP2YhXK21ULqPkKGXNvs4Bmcf7QwRfH5AUwpt3IJqDoQYK5GVLrFQuMisFqdnRi8bQ++v5Ai0z4pVf5RXZ7wzenmi6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kvCL89Ro3HL9rEfL+xQ3eBNuiik677mNHRJlZk6NJg=;
 b=OOSvPWMZG7yYz2QOzQOJ6eamCop3UgbA4s4Appcp/0MgR1d6d5L2Dit4i28b0G8ySXCrMDnGm/7NjLCT/RHqPJcphEugqpq0VQYpKSiPncfLYzcmaGmc5IkO7WXyMQzI84RjgFB6EWt/IIoUYCzIvE34MYbNk+QC/g5/QgPCads=
Received: from SJ0PR05CA0180.namprd05.prod.outlook.com (2603:10b6:a03:339::35)
 by SJ2PR10MB7810.namprd10.prod.outlook.com (2603:10b6:a03:578::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 17:06:36 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::b) by SJ0PR05CA0180.outlook.office365.com
 (2603:10b6:a03:339::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Tue, 12
 May 2026 17:06:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:06:35 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6PWJ1887820;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>
Subject: [PATCH V2 04/11] soc: ti: knav_qmss: Fix kernel-doc Return: tags
Date: Tue, 12 May 2026 12:06:16 -0500
Message-ID: <20260512170623.3174416-5-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
References: <20260512170623.3174416-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SJ2PR10MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8fe1a4-1268-43c8-6325-08deb048d2c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: T9Pkg3/ISx72QP3JwDa5yLPbshWCQWBNvnJchK6YMBfoxGqh07VJ4ZVuLijBYOiDc8NlSmKOefsvYWCP/cbNI38CSQqvjg4wC95MH2Due8VPc7+MKuiq1T9sEaopAVfGtEtYQUs5TZkBAViEN38+p3/eC15RucV44scNQHeqr3aOf48eYk3/t1FlnOXbCW0sA7PJRVj7h/x6UILaC7q4+2xtrJmaBR/k9lVL5rKAdo2oMyv+/h1MQvYf5UXEqy2yyDwj3Q2ztqZnZiioRL6gypjwdlOyt+zyUL3ugPH6TSTaLc8W/VUGmjCxe43DnbLSyHyUBjedajhvYIVZ9N0jrPNmtseV+6gk0Lk4zclvmrfCVnhmek13iqK84iZToPKUKHPOyg/xnzOxHA0MEh/fKeJkAXO4tF3JvxS2toDu+Y5yeYF/lbGFeVu0aAgqZ0T9Ls3ri6QOcx6vJXStjpLSPF6uKwifTNJfN/4zznZSQi4cWugtWZyXIvDuHYsrpuCGmPPNSmq/VWVHh5grrE/8a1i4sGr5iHdF4nUgaXyQxRwcF+gZLJpeyv0KwR34n54o5WivHd+JWdvLelzbxQzAQJIiBnbK0BkWtR0QG8ba0dK253D9BK43e+mDsnUZpyzwyUilsVgxLONX4ZWN+z+DJjlUYYBOKMBa6Ft8Dw3HQ4ciHp2rBQ+xH8fhtVUPcVg5uW0jLMb1kR44qvWZNt2oyN37yDkLL5SBPjdiTIKfAT4=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: upvp4CSPR+ntHjPZ3QMPaPx+BKDakYyZP51b4RxYQC5cljFZYIjIW/nzItLZ0LtiQTUs97AtsTNYU3DnJj6uR7nP22yOgldF63H68RTndZCBMoMps0KF2USIVPisbBeQeCdhrayNEpabcQ0/wii6An3jI5bhTswER6Gue65UHMPuOFmyvnKVusaqS+4gRgMHFYjjXBrM5fIyCSdN+fPVJvrMKMSpYmTNtutPIrLVDVCmysMTYeyKYHgQxcKCnTWgNESy5PY8g4YXFyMnSBItbT/AgJltcirM8Tn+2QOl+vEdpj3Pn7MdM5PfHhCrp6bhyFCM+bcLnig+UpK0u5FP8ZDTp7KpbnvnQ4SAky7a1s3nyQ8TjwHFDWGhswFm/Y4i21pn/4h1VxLIE/iNWE4WpEtbV3oD5CLoDTMd+W9Mi/obG5dgZO0gKq8yHOl8Bu7D
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:35.1796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8fe1a4-1268-43c8-6325-08deb048d2c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100642_598506_3D1FF1B2 
X-CRM114-Status: GOOD (  13.84  )
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

Fix functions that use inline 'Returns ...' instead of 'Return:'
kernel-doc comments, producing warnings with W=2:

  knav_qmss_queue.c:524: No description found for return value
  of 'knav_queue_open'

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

Changes since V1:
- Picked Randy's Tested and Acked.

V1: https://lore.kernel.org/all/20260508153211.3688277-5-nm@ti.com/

 drivers/soc/ti/knav_qmss_queue.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index f65658014b05..c3f85052002b 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -517,7 +517,7 @@ static int knav_queue_flush(struct knav_queue *qh)
  *			     Subsequent attempts to open a shared queue should
  *			     also have this flag.
  *
- * Returns a handle to the open hardware queue if successful. Use IS_ERR()
+ * Return: handle to the open hardware queue on success. Use IS_ERR()
  * to check the returned value for error codes.
  */
 void *knav_queue_open(const char *name, unsigned id,
@@ -573,7 +573,7 @@ EXPORT_SYMBOL_GPL(knav_queue_close);
  * @cmd:			- control commands
  * @arg:			- command argument
  *
- * Returns 0 on success, errno otherwise.
+ * Return: 0 on success, errno otherwise.
  */
 int knav_queue_device_control(void *qhandle, enum knav_queue_ctrl_cmd cmd,
 				unsigned long arg)
@@ -625,7 +625,7 @@ EXPORT_SYMBOL_GPL(knav_queue_device_control);
  * @size:		- size of data to push
  * @flags:		- can be used to pass additional information
  *
- * Returns 0 on success, errno otherwise.
+ * Return: 0 on success, errno otherwise.
  */
 int knav_queue_push(void *qhandle, dma_addr_t dma,
 					unsigned size, unsigned flags)
@@ -646,7 +646,7 @@ EXPORT_SYMBOL_GPL(knav_queue_push);
  * @qhandle:		- hardware queue handle
  * @size:		- (optional) size of the data pop'ed.
  *
- * Returns a DMA address on success, 0 on failure.
+ * Return: DMA address on success, 0 on failure.
  */
 dma_addr_t knav_queue_pop(void *qhandle, unsigned *size)
 {
@@ -747,8 +747,8 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_dma_to_virt);
  * @region_id:		- QMSS region id from which the descriptors are to be
  *			  allocated.
  *
- * Returns a pool handle on success.
- * Use IS_ERR_OR_NULL() to identify error values on return.
+ * Return: pool handle on success. Use IS_ERR_OR_NULL() to identify
+ * error values on return.
  */
 void *knav_pool_create(const char *name,
 					int num_desc, int region_id)
@@ -878,7 +878,7 @@ EXPORT_SYMBOL_GPL(knav_pool_destroy);
  * knav_pool_desc_get()	- Get a descriptor from the pool
  * @ph:		- pool handle
  *
- * Returns descriptor from the pool.
+ * Return: descriptor from the pool on success, error pointer otherwise.
  */
 void *knav_pool_desc_get(void *ph)
 {
@@ -917,7 +917,7 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_put);
  * @dma:			- DMA address return pointer
  * @dma_sz:			- adjusted return pointer
  *
- * Returns 0 on success, errno otherwise.
+ * Return: 0 on success, errno otherwise.
  */
 int knav_pool_desc_map(void *ph, void *desc, unsigned size,
 					dma_addr_t *dma, unsigned *dma_sz)
@@ -942,7 +942,7 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_map);
  * @dma:			- DMA address of descriptor to unmap
  * @dma_sz:			- size of descriptor to unmap
  *
- * Returns descriptor address on success, Use IS_ERR_OR_NULL() to identify
+ * Return: descriptor address on success. Use IS_ERR_OR_NULL() to identify
  * error values on return.
  */
 void *knav_pool_desc_unmap(void *ph, dma_addr_t dma, unsigned dma_sz)
@@ -962,7 +962,8 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_unmap);
 /**
  * knav_pool_count()	- Get the number of descriptors in pool.
  * @ph:			- pool handle
- * Returns number of elements in the pool.
+ *
+ * Return: number of elements in the pool.
  */
 int knav_pool_count(void *ph)
 {
-- 
2.47.0


