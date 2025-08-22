Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A28DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVaXdPg00eE0Jg/sZmunFFWiOZhrBEbEUFiMAcYPr1A=; b=MEI3UZ1dDIcBwrtlLAZEhgXkw7
	TiXehgC4rLkcTJg7Bz3aid4ycDfcEhUiZaW+BYY/HHikXxgi465wHqYdfHQe67AVt+wAmjEuyGe/b
	Hah17HhApS1mZQMgl+iMSKUmMi0Nnf343HWRWyTb7AMUleRgMGMZioldEJgqN1MWi/JIIaUsbpI+G
	ZNIK81fTgOFU+dJfrjh4CiI1CI70QbMsOEUWd53QQrEV7FB6Va+gC31XzhqTM722rUktg7ND9iice
	xzm5vKAwQjGDyBk0Tk2C0+7HVBv4THbprVLvYpPv8qkQ2zvPyr2nVbdJyim7CNQlIvSR0VB3Yk2E7
	zneZwizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSaX-00000002juo-3IqS;
	Fri, 22 Aug 2025 14:17:53 +0000
Received: from mail-bn7nam10on2062a.outbound.protection.outlook.com ([2a01:111:f403:2009::62a] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJqX-00000001Xl1-2y3f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 04:57:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8rJYSnqPPEmton/DwmQB6o+pb0cEe8h5QqZn7yk+eMXyJvUgWPcgCwOBhbXvLO48klV3kQaWdzYMLJeHizQwBgYIpU8ruJoDQtXsLUyDUrJPXjt7nb1nfNrtJQUBGVR99gB9qv2vdKQIhw1/x/UjFkzZ0LzUWkDkyGujU+bYkyNcdWoajdBZfvdxmY1j7yFiu4orYC/Ymbrc8z6k7wnSkI9YO3eZSgtzhudMiyx0clTrhJcjGNYhoQ+qG0HAXKUY2VvXhK1pAIpsD9KaMBcVEA2BDxamX/2rZwwJ1iJygxR15Sx1IadWVBJz4Ym0f/w+VJFf+RPko2nvCLBpOVTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVaXdPg00eE0Jg/sZmunFFWiOZhrBEbEUFiMAcYPr1A=;
 b=OeUm0xH5vX8FWBQqBKA6A2YCt148o75wMTdU9/glUe92MkKlLDrcy7TbfFyJDcSjo+fCKR7hkxJpIi5jQoYCR9FI0RwDZDqUzAZGN/Pi7LTFh5k+ef1LHabPGePjwjPp+fET+O3z3t5axiNwfOsHQ8QeXclUBbOJ4LWHWytHPLjBKejfBUFTF9w1yIPDbtQJ9fiHqoScF+NO8ph4kfpNY2oqoKp10+xH57l5gPQF6ZlcG+gN4QzJ95KnOkYKwiYvJ7pnozV6RjA2Ntczc1K1hOFBXSBIDPw+XRVDejKVoiGwVLgGoewqjzHSdFg1ZO5dHpe+Wbfd00KZJ5Vvu4epEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVaXdPg00eE0Jg/sZmunFFWiOZhrBEbEUFiMAcYPr1A=;
 b=FAB/dtbnKzE8q7xHcC4xJVpPGGtFY/niOlqK00HCzu9U9kdHwUHtl7fPDjfBrWIxqpAk6wZ7tJZJcqqX71r6/Ds2ULYcBMQVxQc5qIMuTdYOQP0PgyZ+73hTG59n7BUj0+G1FppdC3CgkYrty+qdsK2OiliJd1S+x5OFSu/buUw=
Received: from BY3PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:39a::34)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 22 Aug
 2025 04:57:43 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:39a:cafe::8b) by BY3PR03CA0029.outlook.office365.com
 (2603:10b6:a03:39a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Fri,
 22 Aug 2025 04:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 04:57:42 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 23:57:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 21 Aug
 2025 21:57:39 -0700
Received: from xhdharinit40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Aug 2025 23:57:38 -0500
From: Harini T <harini.t@amd.com>
To: <jassisinghbrar@gmail.com>, <michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH 1/3] mailbox: zynqmp-ipi: Remove redundant mbox_controller_unregister() call
Date: Fri, 22 Aug 2025 10:27:30 +0530
Message-ID: <20250822045732.1068103-2-harini.t@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822045732.1068103-1-harini.t@amd.com>
References: <20250822045732.1068103-1-harini.t@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8541e8-38e2-40b8-276c-08dde1386da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3UnWwOeQAqsyy1lBi7Wg861uY2BP/SlnEgkau3w8RZBP0D045/Y1Tsx3h70W?=
 =?us-ascii?Q?FyL0U3JgEBM+R9R8iEIQuueRqhuwoZV7q0AaksulhAPo/67xoVTul2hyRpmp?=
 =?us-ascii?Q?UJW/mLnDYwuyKK6elpk10qkoW2EMgaN8cPMD99wisQHI8PKYEldryFixemjV?=
 =?us-ascii?Q?82bHeUzV4aUI2AZHXmRZc9y87Nzxv7PDchbjT7P61bjkfBxs0IEK9U29XL00?=
 =?us-ascii?Q?dQ7qEu04BtIrOy3BxhvIjWphTMpR0mk68+dqk90H3wqYtFyn9HXHcSkHj6MG?=
 =?us-ascii?Q?deaq/FIvFoL+XdFLC0Zsb2aHRjKNJKDWJmEpcikXjJufjT1nCqlStkVNWg+B?=
 =?us-ascii?Q?el4v22O/a7v5OD4iFqatQ5QfE/pJnat2FIztdoDcYLTpCOrCACcn2yazp5r3?=
 =?us-ascii?Q?SKms/H/ybFssSgthLxZnEbd/U0NxRJT/MkmYlRRdmKxSODQ/YmSuMvNdnhkN?=
 =?us-ascii?Q?c2JIvxome8JKsfSpWYPXZRQFS3ECgB9SweRM1fQOKYeG9HDfjyUksoK+76ZI?=
 =?us-ascii?Q?lnsrddlET7LYFGJEMlAJDD7ndYRIIgUiwXfDmccplPGTscrA1Oz9e8K2O/9v?=
 =?us-ascii?Q?TbFo5VQnEPn2h8gWEiF4WxkWiLQyV2A3JOCzaonG6z4X7MqUhv5pW4P526IC?=
 =?us-ascii?Q?ozomzTr+gp9Z7FvqiHHUdCjM6L7HdVuthrLENo0lGL+Vq4LDYFPbF1n7Q4cs?=
 =?us-ascii?Q?eepLOQk2+jWoscevFaBYcJpBtyLF5B+xNKkVaH2/Nm5ju/XheCCb1zdi+1Gb?=
 =?us-ascii?Q?Geks+wZhHv9OYz8sGnEcXCn1K70ZF3Yox7+QDldeJ8a6HRD1yBRCrrtQed6e?=
 =?us-ascii?Q?5hNjHwfvrYWm4oNuFy9ZktXlwQKoW445JhSiX9hKaEGe67ggMYhqfnoLZGW7?=
 =?us-ascii?Q?uY+MgditLKBPuACPK8xc5BAN62PsQolW6QcNzLT929XzarxVkhH7IXt/xT60?=
 =?us-ascii?Q?49+fgBQMplCjCjjflFd0YYTpb83mQJN51HCkTynhh9jfM+jS9fh2JhmVS/Td?=
 =?us-ascii?Q?XJWox475ULX3cDYHXHbd2ExRs6Q4HrvTk1A17JsHMmpnawdA9afSoVhrR/Q/?=
 =?us-ascii?Q?azhKoCTYUF33k3d7qpNmQSA4722z9Y/UePdgGsoBm3pOJwWGqtMAsML8uzL3?=
 =?us-ascii?Q?ndls0gBUA2ntin4TJsCv/+KGyw4lmp/xWM2RNX+x7DcpK2V5XHxyZyD5JCeE?=
 =?us-ascii?Q?LPvZQwlQjI3RzicxRp6jcxK4aI8jiLgJBsIeN2KYphRUmlxyPJDtW/WkN8kz?=
 =?us-ascii?Q?pXDC6ScVEOrkcCIGoi1rUMrvv8SHAghy+/JYq+2q1qRxgBPO0C+nJgAYd62s?=
 =?us-ascii?Q?GjihzA5uwkrMldNLJq64BrAVUMtb1sXBhU5Jq2zJSacGd+2Rrogcwd/wwkS2?=
 =?us-ascii?Q?DVPCVYrNmZ66ZZS3sd2oQHprg0c0pINQBxZDMTjjUsGyy+MNQXV+T3MA+U4x?=
 =?us-ascii?Q?qt/4mkCCIaEyVru2metONlT2rmca6ZZCHHKtxKI3XewYQb3p/3VysHNbyBFl?=
 =?us-ascii?Q?daQe/fboGDqc+2Ud1cUg2rUqIAY0UsSJsSn6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 04:57:42.8835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8541e8-38e2-40b8-276c-08dde1386da1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_215749_756950_FCF2BF82 
X-CRM114-Status: GOOD (  11.79  )
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

Remove redundant mbox_controller_unregister() call as
device_unregister() handles controller cleanup.

Signed-off-by: Harini T <harini.t@amd.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 0c143beaafda..bdcc6937ee30 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -893,11 +893,8 @@ static void zynqmp_ipi_free_mboxes(struct zynqmp_ipi_pdata *pdata)
 	i = pdata->num_mboxes;
 	for (; i >= 0; i--) {
 		ipi_mbox = &pdata->ipi_mboxes[i];
-		if (ipi_mbox->dev.parent) {
-			mbox_controller_unregister(&ipi_mbox->mbox);
-			if (device_is_registered(&ipi_mbox->dev))
-				device_unregister(&ipi_mbox->dev);
-		}
+		if (device_is_registered(&ipi_mbox->dev))
+			device_unregister(&ipi_mbox->dev);
 	}
 }
 
-- 
2.43.0


