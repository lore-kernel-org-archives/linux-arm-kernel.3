Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64F8CCF2D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J84OrB0epD+t1WQyL62AEtfTDKy0Kx9O83fz9cDOcXw=; b=BCRFEOufb8bksy8QdYbxOKgcli
	+wHP5nMb0Nm9h8ezXYpedHb0sfpZ94CayrGw8ixQ7vZ0yfM36AVUDkU+Br+vVl8d92hGmYtGW0hVz
	0r8YtTeahz3Ytl9IBZh2AXzTNiTBJXr9X7Kdbqwfz5eUbSmZMJg0q2PxSsazYhu8Hj3QQbrZC5ccD
	JcrUIC6h+Be55cISM2SKHgXxjpHCD1P3ZXN3oEDKWpFGaJFOo7QXl6E9SXIoArLsjK8Wx//8n5Yk4
	CpmrqatzC9Y9kyNctGFzX31XEwrR2doYY3M1pRze0qk/QJzsL7GtYPo738O8VbPTSmkFkPkoeDVp6
	Ky4Kf7eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlke-00000001eaL-49lr;
	Mon, 19 Jan 2026 09:40:49 +0000
Received: from mail-westusazon11012044.outbound.protection.outlook.com ([52.101.43.44] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlkb-00000001eZN-1GUj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 09:40:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJn1Cmnz4a3LfDjohvN63hc0GKDD1Rapgu+C66WMmZojc5SgLWzupF4AR9sAWV9BEm5zbUMtzz11fOTbnNhw3xNj4PR7LavPEMIoOg/3N1FJNVo+0+ZaEvF04KmLORCj/o6ci/F4VuYEguipp/0i5C8Z/7zg4YN5oG3QommBqJ9mmfmee6dT430qHWCZLMj8kA8ZdNut2wWLp2R+lkiPd6aG8WdX20Zh4ObmfGnv6jtAFptLhPJ0SMPsfvYhkqgCTvRb56G9fBilgHCX7fIpb1y3q4KXJSwoTSzUx1BHWGZxu9AWpOHtUA7wOnDh8tQuDPWgFLsF8UV83KC3iZls7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J84OrB0epD+t1WQyL62AEtfTDKy0Kx9O83fz9cDOcXw=;
 b=GzolJssPbcISBYr6RblRZl5dCOsMgJLKoFs3TnWa5JcMVd640q/bbTQdNaUMDFzWuZeWYfa1bUBItU8yVaf9zEWEAA90bbRb6yJnm2R4bLQKngS+WowXB2S1z2JP2y1wDzohZeIUDyzL/8qJumhlAtYACkE+PEZUN3T32m8JS8RPPjpo8/PivOWuWnY6TMSGPtumusBdEDq0gSuXGQVgWeE1eHEkm7OZh8RLr/2X2mDeYfH8030oMO7AF282ZnSOEXKpoYWO5DZZHJbWp/+2PaLpH473UdjzMPRH7kUKeQfaqXHC3nNb8pc4qJQpBvK4akdZlaZWqimYZlS3IYDKug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J84OrB0epD+t1WQyL62AEtfTDKy0Kx9O83fz9cDOcXw=;
 b=BG856/DIk/SvB9543K2XX5UqoVRBuzTJT/w3Mqxn127cA1KUm/5u45iPt2vOk49UETenAg+0NZS4FFmSlG+9Uy5wOChUXHcSDvPAgnVhFejT8Gi1s6aPDvt5ANuXQP/esz8jMFAO1CnS0F7SZMi6iuIepSC1MvxhxhNMkAkItX4=
Received: from CH3P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::26)
 by SJ2PR12MB8781.namprd12.prod.outlook.com (2603:10b6:a03:4d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 09:40:38 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::df) by CH3P220CA0011.outlook.office365.com
 (2603:10b6:610:1e8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 09:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 09:40:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 19 Jan
 2026 03:40:30 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Jan
 2026 03:35:51 -0600
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 19 Jan 2026 01:35:49 -0800
From: Harsh Jain <h.jain@amd.com>
To: <srini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<michal.simek@amd.com>
CC: Ivan Vera <ivanverasantos@gmail.com>, <stable@vger.kernel.org>, "Harish
 Ediga" <harish.ediga@amd.com>, Harsh Jain <h.jain@amd.com>
Subject: [LINUX PATCH V2] nvmem: zynqmp_nvmem: Fix buffer size in DMA and memcpy
Date: Mon, 19 Jan 2026 15:05:47 +0530
Message-ID: <20260119093547.3583707-1-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: h.jain@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|SJ2PR12MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 601537e0-cdb8-4078-8fa4-08de573ecd8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?McTpkrRi1rOpDqFOT/syBwagIbZbJ6yXxX7Idxc7uPTOdkxuMGhkkBI3RL0f?=
 =?us-ascii?Q?UEqctyhm6l8AQfQDsyhECXtihUWEoNhT1+cFNdWteAWt/y4de7G+MhPcgEUm?=
 =?us-ascii?Q?RR/nrBaCqCALkg+IJxRFXnkAeEcDlVQbD1ejz5hgSbQLGg2u2NmR26v0DG0F?=
 =?us-ascii?Q?LfC0VGB/IfQtWpGe5aq/QKK15GN0RsD2/tS6Va7AfIz8iBdxHsDB3WGLKKPT?=
 =?us-ascii?Q?K5zrZQ3oVX13H56gMjtsG8pNOMiaTAp0DFh0uJzLEbEWSgl3MfPVt2d4I2HP?=
 =?us-ascii?Q?f+rgYTZJvA6M51Akl587nrbJ+jy4vHBwPpYe5a5qG8oWIN/GdkzkfvdO1W0g?=
 =?us-ascii?Q?mWOG5fihH4JcbdlKYTHLsVrOphDhiyujxhXgLK3VOG4/GAbvfhyEGHHtWQ3O?=
 =?us-ascii?Q?NelG3PsEDOzXxT+MrOV00amJfnqL+BBxzboL1yEZ6BY+Ad4UB9o40jg6mi1z?=
 =?us-ascii?Q?Pzf37eV0wOC3L7Pp3f6Sik9zU2UfoDoUFqjJVn5CtMPbhjsmb0RO5SeRpQBO?=
 =?us-ascii?Q?uKRRgehuGUeNMvaLkTCUh9wW6H84uVndJxnSs4oarvSEzfgSsf5ixzKBteB0?=
 =?us-ascii?Q?CbsWjQseIvgv+HDyHFDYMgoRcQ7/FxYApoftHNu3ElAhDKrhzZqIwCPrcZVA?=
 =?us-ascii?Q?MUZitMS47pF/QKFaVyebysDg9QUPt1nCqNIEGmxZXZDWsIM5RZGvTWjtRbXv?=
 =?us-ascii?Q?0yruwbQVzft03uy2lDaBMjj7xJ4FPaGkmXi+LAPhxXF8fuE3NZ28Vudc+SVF?=
 =?us-ascii?Q?xuKBTv6kqV5uzDxw+3qHQ+8oO9MBVbxNMlEBRgR3WALAmpihlp0v5trot/Z2?=
 =?us-ascii?Q?ip8f3LDlaK07EygBK+VVYtJkaOdA/YlzrrKluQ/pQyvVQbM0tI62nbwGgw/7?=
 =?us-ascii?Q?9oolb7wyAZoCBfPWfAiDrSL6ZDqiOBdUSSzcvG93/UbN1SDRcgmdyGGPabG4?=
 =?us-ascii?Q?wjgAxBK60P7KX6wIjtdkAZP60D8YJPx46R2PEOZ7+WcpSMl22esMdQQG6Nxj?=
 =?us-ascii?Q?GJPP3vBALyAxZb4/Bv/49RzL7wZkHZO4tKdzHm/iMdYj4ak2d8GdF2drPXDD?=
 =?us-ascii?Q?U9Wtxpr2S5j9qJD0W8ELFZe4pbN3J0NjMzHdd1c+uzKHVFNoqIpodoUoZmDW?=
 =?us-ascii?Q?j/dBA09BoITeH+ZU8c/G44/dIvYJ/Rv3AlY0UP4vLn59Y0chpzqqTyt0PxtE?=
 =?us-ascii?Q?pLMcKSqHNI16XTHHzap3HKW89AyZTMAZQEOZWFB5ZAVKVco6rqCXlC+aqg/7?=
 =?us-ascii?Q?Dlp9m9lddZmENuP9vd558dA1TkqtUKE0wBE2Xor/ly0mRvNaEM+O7tHykiPB?=
 =?us-ascii?Q?OzlwHUjePwqDeJ0nxM73q6jh3ltv2nqf45E/L0yUETjeH8KorgWFi8kYlwCX?=
 =?us-ascii?Q?D+boTgmjsfMd2Kxar8nCOAE8NvNMGH3DBYf7oQTNYBI8xwa2IEzDqnY62Bdp?=
 =?us-ascii?Q?iGkIhHnAKDgTPWJbzREaCmYGxL6g6HHM+iXJ6Rn8JNwxJlYCt0lVzQ90pV/y?=
 =?us-ascii?Q?oFzCZ0gGYrWBBobuj+YAFa9p3H9nK1R8eH1VfXDex0X3Tp2xf4rg11Z/vsKa?=
 =?us-ascii?Q?3pLNoPMWtfMESsspH4E2XmS6D3XfSry72VkXUaBXG0amVSLtLY9tSOUbLAj/?=
 =?us-ascii?Q?zOEXdEQguxo60nsfrnQfdLDIT0CxDl5SuxHlVAt4wKNDiYhy5yPqtVmtjGAD?=
 =?us-ascii?Q?sTD2lQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:40:38.1066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 601537e0-cdb8-4078-8fa4-08de573ecd8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8781
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_014045_344112_E10F040F 
X-CRM114-Status: GOOD (  13.81  )
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

From: Ivan Vera <ivanverasantos@gmail.com>

Buffer size used in dma allocation and memcpy is wrong.
It can lead to undersized DMA buffer access and possible
memory corruption. use correct buffer size in dma_alloc_coherent
and memcpy.

Fixes: 737c0c8d07b5 ("nvmem: zynqmp_nvmem: Add support to access efuse")
Cc: stable@vger.kernel.org
Signed-off-by: Ivan Vera <ivanverasantos@gmail.com>
Signed-off-by: Harish Ediga <harish.ediga@amd.com>
Signed-off-by: Harsh Jain <h.jain@amd.com>
---
Changes in v2:
- Fixed sign-off email and added stable kernel

 drivers/nvmem/zynqmp_nvmem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
index 8682adaacd69..3e5975231269 100644
--- a/drivers/nvmem/zynqmp_nvmem.c
+++ b/drivers/nvmem/zynqmp_nvmem.c
@@ -66,7 +66,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 	dma_addr_t dma_buf;
 	size_t words = bytes / WORD_INBYTES;
 	int ret;
-	int value;
+	unsigned int value;
 	char *data;
 
 	if (bytes % WORD_INBYTES != 0) {
@@ -80,7 +80,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 	}
 
 	if (pufflag == 1 && flag == EFUSE_WRITE) {
-		memcpy(&value, val, bytes);
+		memcpy(&value, val, sizeof(value));
 		if ((offset == EFUSE_PUF_START_OFFSET ||
 		     offset == EFUSE_PUF_MID_OFFSET) &&
 		    value & P_USER_0_64_UPPER_MASK) {
@@ -100,7 +100,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 	if (!efuse)
 		return -ENOMEM;
 
-	data = dma_alloc_coherent(dev, sizeof(bytes),
+	data = dma_alloc_coherent(dev, bytes,
 				  &dma_buf, GFP_KERNEL);
 	if (!data) {
 		ret = -ENOMEM;
@@ -134,7 +134,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 	if (flag == EFUSE_READ)
 		memcpy(val, data, bytes);
 efuse_access_err:
-	dma_free_coherent(dev, sizeof(bytes),
+	dma_free_coherent(dev, bytes,
 			  data, dma_buf);
 efuse_data_fail:
 	dma_free_coherent(dev, sizeof(struct xilinx_efuse),

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
2.34.1


