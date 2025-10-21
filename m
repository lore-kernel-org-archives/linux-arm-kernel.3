Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DFFCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Usx1Sr1FDAlweubt1VdxDA9QuQOcgnDZzd5QvIx5ws8=; b=M0DnxIgAqofP4dRMxd3b34SW1O
	E7OovyPP9sHwn94PUIxYJx+hnMfjl1yB97JAl8CZtHM2ZmRXxSm45NmDswqTOTUnIUNGjUgWPkVe0
	RUxqODyRRDNfQ7G4Ia7AIK5zIFcTKOnkvM4Bk24oLTdPTJW9FngokxR2f9gr0R+hXHNcMsINLeC3N
	1qQUpRqFx1J1Dq6yX/LEnhGztl+0lmJ++hRapRtTY9OdN5v8OmH6Nfbk13Tf2HhFAg7jO9Eb5E4B0
	arrP+ppfjPFy6/6XSYLRr9Psz32iBimkbqjDTp9CIWsXlISCMvp7kGW22egogWNsmbHNCcM8CSmt0
	LweaamYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBH7n-00000000Lu8-1aW6;
	Tue, 21 Oct 2025 18:30:23 +0000
Received: from mail-southcentralusazon11012062.outbound.protection.outlook.com ([40.93.195.62] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBH7k-00000000LtB-0LRY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 18:30:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jv0MIOMeeZiAUB0/VbOyfqC2vb1dUt3aPWIxLeKpRycAIZcKV/aj2h6aTOpPeR7bzhQnrKtszkmuDuogoVVqOy46i68g5z/Upt/rdkJhTQmfPtcbdmHif7SZCtje7x/0D5TcenvUKKEw6myQcRLZDBgWISQx3W42UInbnJCk4mbH19zjBllYOqSCXAzwBP/l3U/VvNzG710ZIJrj96IpBVNNifVUWZ0+IiRlf9M2BfIN7COT+Ak5Sth9hW0k953s543Uso60eSXoTXJUvcZdeqSliriuLT0eLW/CuPvWIwEMbeH0EtjV9dlpSUvRTgd/RswcbSdVzgLQXMNdRQQZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Usx1Sr1FDAlweubt1VdxDA9QuQOcgnDZzd5QvIx5ws8=;
 b=C+bg/EhUu2PpRFoufuryN75SJKg/w0SQ6VLzefkBco/kzM5IN2D+fwdQXKZLTQhQmOCfk0J+sx8zKicwirhB9CFmNpWc1WHQrUGrKCHXY5sjRxrJMpAwxdT//KNA5QVurO1PvES2ITzuSS7avNcmJcBdbtNbd0lrzybXrrViJ1u31P7D+Us1V8wKmZy0q1M2B7iyGbB2cmnH4yKTTGdexxIZOA0mhm+l1hp/XyqjdAriKpz6IM6hXJgs1DBq68yBMq7wBfy+dm9IkHXjErQ3u4kw6/L6wPp8/BMyYZjWkZBBSJfm/DOO8I5VLU5cWDIQt/mSsPFKpDe37BhwTtjlXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Usx1Sr1FDAlweubt1VdxDA9QuQOcgnDZzd5QvIx5ws8=;
 b=Gv1MUfjTXBHlmWNSTPgCBNwxFSjKwtTmGQKuXy8R6rKewbFVsDOH2VVYKByn2oWQBSstbnagx7/1rukmDt5PK1mx8Du64/8hE6bFdLDCI78tpEB1a/BpBR1Utye+ALr87xsw8vYa/ivRvmdpRNgcuBK3/yiMjb5YogfZxjHQHQs=
Received: from CH2PR16CA0030.namprd16.prod.outlook.com (2603:10b6:610:50::40)
 by LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 18:30:12 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::5b) by CH2PR16CA0030.outlook.office365.com
 (2603:10b6:610:50::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Tue,
 21 Oct 2025 18:30:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 21 Oct 2025 18:30:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 21 Oct
 2025 11:30:08 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Oct
 2025 13:30:08 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Oct 2025 11:30:06 -0700
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] dmaengine: xilinx_dma: Fix uninitialized addr_width when "xlnx,addrwidth" property is missing
Date: Wed, 22 Oct 2025 00:00:06 +0530
Message-ID: <20251021183006.3434495-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a4c4c7-729a-4992-54d4-08de10cfdf09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bvqFlkvPcce5GCNVCWqiOmK0ZYtIwOKk09HfubD53rKSkU3eb1Bd8WXy9T8Y?=
 =?us-ascii?Q?5kSnohz0nNVnA9KTmWsavON9KHbXqEP19VrYf5/4Pkj6OANyo7q3jpck7ExS?=
 =?us-ascii?Q?OYD2IpayDnpV3YAu8DK6zR0+66GMmlGjXwNfsdqBmDToQ9N0tPmxCgCzMVyZ?=
 =?us-ascii?Q?91blWSg6UfYjfrrb1Q/RxlvcAPtCKJMCBZlBjXy9+H7Qz6yCuYSHxZ/l+JPL?=
 =?us-ascii?Q?93Ceq5jKyCbCO/qqAIppt0gHESsYoI5xBCKl7wC+AL4XEVjbRFxh3C5hdIba?=
 =?us-ascii?Q?T900/jDQ2ltHcqUzQkCKrxaoA55yXNVhQkXvdZEfecFqV9CiZ3qd8uftmW7j?=
 =?us-ascii?Q?jAD48jstSrA4F34k7MnH3oqMXKgL7dyXu63ANtLVtAi9nyPS2Aizsl44gaQu?=
 =?us-ascii?Q?2xXFNfwQNqp2knYrbRPSKhqKqrEXZk5E1yOs/yJmtD4BFfsGvG3fDGeoSRMs?=
 =?us-ascii?Q?zVsD2b7uC1hE9UEsjuuEVZnhVLDKGEF7PlVLirQb9uI5i0+Fi/ktvdnVE/VQ?=
 =?us-ascii?Q?UdOuCd6pBpjkPwEI6jHVGqAhHod7/wiYnVo74zJ6ehpYbsYKqftjAz/fRfUk?=
 =?us-ascii?Q?VifPkRCwRsFFrpITQx4tPtlVD6RPe/7rppA5ag/6E6FVZ47nLHEEzXENZISr?=
 =?us-ascii?Q?yyyq+NyFwoSd5NHOwZkUzeAk8DTs7R3Z+oCDdyVKsjgNvUlhjlSOoDl1K2wS?=
 =?us-ascii?Q?VxUbLltc7psCYpXvICqylyF82dKhaTSZDSX8G6m1X2uG/R2DEfXXOtGR1tPK?=
 =?us-ascii?Q?fVerXr/U9VYnb08Lyu5t3Zpu/KhQhPiIhf/ErC4OlyJKIlgYqH/Q73b0VKCJ?=
 =?us-ascii?Q?L7mTKNnBqhK07xGRljvWxB7hfMAGotI0SgtEy7jKY7n1PtaXKPfm/ofxzfi/?=
 =?us-ascii?Q?EfhvMx0qi+sF9B1nwuTTgGGWxKggiMWj4GFZY4emhjg329HPs0YJnONWFif5?=
 =?us-ascii?Q?b4jpyhGrTvDe2OKRBgTzJdVbH7vVypmFrz5ke9q/+CqGcOqK3O88IRosPJNH?=
 =?us-ascii?Q?Jw1l1ZMhsnHkZdsYMqM6IvZ0e9RTbMmig/CEBS3hY5v3dDPKA91R52yh0sOF?=
 =?us-ascii?Q?SbueTPHwqGmrJt7SM4RpOaPBWzIlHjZLg3h6M0nx4ARM9+d/ABIdxpZzqUYN?=
 =?us-ascii?Q?0Fi9Rn3fDZyp9a0SPiAtDDsQZAvTALFfDeu8qorDxiU/aePieY594sPKZC9w?=
 =?us-ascii?Q?cwqYY7vM6LUDbSR0ZH/ZXlnbUhQUhFFXwgNJatF4unsVvSaR5jSAWnz/flxL?=
 =?us-ascii?Q?kLQfZ480Ll9297GH2tYakIYXXmjlAUSOKJpmDphvzlVs6PCMYgvnqKi6+wCB?=
 =?us-ascii?Q?X7+Q7SDttiU9M3dDNEkilH4A0yEHdFCeNN6Q+s8UfmkzhhKNMYAB9WAMMIx+?=
 =?us-ascii?Q?yba0QrzujHZmduQXXbfQ8QLv5E1IIl2b8w2Zu+/fX/oEunYmLk6Sr4ao6C0F?=
 =?us-ascii?Q?PfaJoSwCRz1zdy//TSkydaBmMBKkokRmd/F8t7fSlM3EB4cJHnsa065WE16h?=
 =?us-ascii?Q?e7MBwzVvzmeqiiCVv1+T1Ax7c1lYDeKkaSJQUpr5hc/RlbiJ8C+VVngixz4P?=
 =?us-ascii?Q?MxCbG8sWh/PAYAxyNKc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 18:30:11.9080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a4c4c7-729a-4992-54d4-08de10cfdf09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_113020_185585_A40724ED 
X-CRM114-Status: GOOD (  13.04  )
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

When device tree lacks optional "xlnx,addrwidth" property, the addr_width
variable remained uninitialized with garbage values, causing incorrect
DMA mask configuration and subsequent probe failure. The fix ensures a
fallback to the default 32-bit address width when this property is missing.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Fixes: b72db4005fe4 ("dmaengine: vdma: Add 64 bit addressing support to the driver")
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Reviewed-by: Folker Schwesinger <dev@folker-schwesinger.de>
---
 drivers/dma/xilinx/xilinx_dma.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index fabff602065f..89a8254d9cdc 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -131,6 +131,7 @@
 #define XILINX_MCDMA_MAX_CHANS_PER_DEVICE	0x20
 #define XILINX_DMA_MAX_CHANS_PER_DEVICE		0x2
 #define XILINX_CDMA_MAX_CHANS_PER_DEVICE	0x1
+#define XILINX_DMA_DFAULT_ADDRWIDTH		0x20
 
 #define XILINX_DMA_DMAXR_ALL_IRQ_MASK	\
 		(XILINX_DMA_DMASR_FRM_CNT_IRQ | \
@@ -3159,7 +3160,7 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct xilinx_dma_device *xdev;
 	struct device_node *child, *np = pdev->dev.of_node;
-	u32 num_frames, addr_width, len_width;
+	u32 num_frames, addr_width = XILINX_DMA_DFAULT_ADDRWIDTH, len_width;
 	int i, err;
 
 	/* Allocate and initialize the DMA engine structure */
@@ -3235,7 +3236,9 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 
 	err = of_property_read_u32(node, "xlnx,addrwidth", &addr_width);
 	if (err < 0)
-		dev_warn(xdev->dev, "missing xlnx,addrwidth property\n");
+		dev_warn(xdev->dev,
+			 "missing xlnx,addrwidth property, using default value %d\n",
+			 XILINX_DMA_DFAULT_ADDRWIDTH);
 
 	if (addr_width > 32)
 		xdev->ext_addr = true;
-- 
2.25.1


