Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7FCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJUFEqm3bRN/HRGbs3CpErmu5dSNYWAcCQnBa7nsPJ4=; b=JqoRHzNefwm7fOhGgca6F6elAZ
	YzCwihQtNeW0zvnHlfRFqPzh7BPVGdFc/gMmMcCd5c4ehJeCQSsjboOEPHgTo10Mtzrzu8+2UtEi/
	RdDku5KlKR0aqogE+5NtUAqX9dI5cR25slCXfUUdaB/RXWe4+mPUqOjV4naRrrFol/qZbuJWcN/x8
	zlZVfEypgNe7Wdmd2kijB13az9CbiOUer3b/7eIGuWqIXeBWKSzTbreoDfD4/GgRhCtCeemNDOO6V
	nuvsp5NjDo+O1bRHoYHijYJuc/Ev0InEFN+/radz7/ed4BAHYID6Sx5hwl3FquQcnUgw0pMYQJxya
	712efLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIvy-0000000BTSE-3FtX;
	Mon, 16 Dec 2024 21:47:22 +0000
Received: from mail-dm6nam04on2062f.outbound.protection.outlook.com ([2a01:111:f403:2409::62f] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIsb-0000000BSjJ-0T7f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 21:43:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CK+33Qy53sJQ/NE2uDXy8M7C5Zde2y67L8sN0Lu4G5C+O1tRksSuKliM6Gdr11DYX8WsepKNsT+UHhAF1pqz5O2nx0/R1q0wu8BQ34ihxvaXlOVV0I6pKmnV4Mvnp5ldOny0JMsKTFP/fvOu+xFCLOkaHdrovoGZvpZqikJg9BVZdashLwCuPKELFXkwi9wTT5k9trXKVfJq+AvVcgGU2lHPmZwuHa8WSEIjJOUb172KcEF6nBPGKxAvKjPZl9rwFPBmuaU3vuNuIeM5uYDgEhDuISvxRyKdBhtmsIvwzvln5qc2GTyPKzCSZZEhSfN8Y5fHCEySmaxWaeh1Iq56sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJUFEqm3bRN/HRGbs3CpErmu5dSNYWAcCQnBa7nsPJ4=;
 b=cYlZuOh44iEl21ztvOJafGyVhXMeshZl+c8/v3vlObLomSQ4aiiKZQCRYTOnQPV9RRQTKM162OggPoPZs0GU2U6HNwan+w8tYChZ7x+oJgcrG2yGexIQ+xjhZf2mT6RI4vKCcBHwZiLGkcGtq840UduRbAYEEfPGV7a789zRUyCJDYXDCYRsOoE8XEU//bgMn8rNYhJfk0EhVuFek1M7msZpE/RlAx5sGo56q74YbXiKhzya3IbyK7okIAGOHb3d2ndgPr7OF4CISAMF5xxwgo4egbv9gTzB5QCN5t2t1BXUmqrdgFWQm/t4I1XHrhrJNmJJtAhM8RtlLeYVo59Skg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJUFEqm3bRN/HRGbs3CpErmu5dSNYWAcCQnBa7nsPJ4=;
 b=dBuJ8FUCCPEZ3o1LMXXeQDQl++nnwXffzhlxqfeXS2n4CkTbrHd1ovPJ46//aI2+keEkBi8SNRxkz3kU1epbuXviRUC9Z/nr7c+kv+IXyUdDrlvSyX8aCzBRPTwWClYaJgvPxw/L/pgYjheinvVOvFrQLAi6YJEChBN8V9tvz6k=
Received: from MW4PR03CA0301.namprd03.prod.outlook.com (2603:10b6:303:dd::6)
 by IA0PR12MB8328.namprd12.prod.outlook.com (2603:10b6:208:3dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 21:43:44 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:303:dd:cafe::6b) by MW4PR03CA0301.outlook.office365.com
 (2603:10b6:303:dd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.18 via Frontend Transport; Mon,
 16 Dec 2024 21:43:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Mon, 16 Dec 2024 21:43:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 15:43:42 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 15:43:42 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Dec 2024 15:43:41 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <michal.simek@amd.com>, <ben.levinsky@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Tanmay Shah <tanmay.shah@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] mailbox: zynqmp: setup IPI for each valid child node
Date: Mon, 16 Dec 2024 13:42:58 -0800
Message-ID: <20241216214257.3924162-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|IA0PR12MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ebe1b9-0fbf-4ba8-ba92-08dd1e1ab68f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xMyGP6FgaNqI3dtqtxXQitvdevB1NIy6EoV84WFAMUcdoSnKgg5I+3be0xLQ?=
 =?us-ascii?Q?9Ujx7N7b1njIY5lcjAokl/PS+iqRs4DfSecADCE/+uz/CGeyMJcpQRoo8iPU?=
 =?us-ascii?Q?y/8ON0vgH6bdQNXFRAlUPsrIUAD3ln0gybAWGtVywdwdq2/qKgaaHDxdq+4+?=
 =?us-ascii?Q?kYMuEZRmMZY2M2eFo96YoKRLknqZm+zzauo1v8Z3AIxwcrcGm0u82RMiWijK?=
 =?us-ascii?Q?MsILN1fn3VY+nRmpuonBcmgGUzzFT2E77VX/O4WKgHYRhcSDeZ90Fz6yLC8G?=
 =?us-ascii?Q?h02PLNdLiPZJr9U+Fypf0KJ3LR1wev+twRE3GbBy0P2l91DZhJTAbueX0+Xe?=
 =?us-ascii?Q?GBBiwzaovprJak1shXQJtwXOwT207xtz3rrF8tyzD9JqT3jPm/UED6iKD9FQ?=
 =?us-ascii?Q?6dUdMiJb2sWMUjNSJ0tuzoQ+kDPD/7KPbBJkGUrQnTdM8dxZlRrbbCUx3bMj?=
 =?us-ascii?Q?nINpS4kGRMQB77om7yivpycKEJsFo02i7UgfVbi1+iuZhvclyfEoQgvsaicK?=
 =?us-ascii?Q?zDmP31cyEkn/fjrdeT0TqlHm3H8bVkA7Cb4rNR51nh6awRHlRHyAHjj5fQk3?=
 =?us-ascii?Q?PnZ5Wam9SdHZc/bMytb74/fOZrwNtsASKXu2Gsi5hHqeiDQqCNLgb1kdOEJ+?=
 =?us-ascii?Q?3EU2P46/O9xNQQzJ8hwfmqDDC1lKqpcrr0NRq4HirLvwP4s20RwTwIS8yM2k?=
 =?us-ascii?Q?I49z31HbpubmXaA7AswG3PbbBxYiKuM9U3ugvIOKHK1DR3raKvJ22E3IgrRt?=
 =?us-ascii?Q?uosBUZTIeYGGUJwux1WGmTmAhx6b4lupfpyWYnnOm3Op9asas8/lIANmZ3LL?=
 =?us-ascii?Q?8ygUSYF6mfarzDIlv6mEoeJDOEA91hIDzma4/xRwXISpElRiryo04XwPO53m?=
 =?us-ascii?Q?O4FS40v/oQlBtDgbjc4UnM/vNI4sFEO9HNfx8BRWm/iLwHtWCHZosfpftOy5?=
 =?us-ascii?Q?R0fMkJArHXwe1+ZWtqzA4O4gMeH1ZIJUCTqD/6l3LuAHQyURGnxsWb0y/MQ0?=
 =?us-ascii?Q?GGOaw2b6+/YBhn1dLn41UCcrE7q+PF/10+AY1vA/Qs8MPnbO4aJJBYO3y14Q?=
 =?us-ascii?Q?bjeG95Ra+Q6jfoNZy7B2i4ZNMvwNzIiAjI8R1etUx9gZuihsi3U7H4M3Y+If?=
 =?us-ascii?Q?EjpjnITtJLtATsKOZ7W1M/o1zNQl9FMuwyQGJ+D9GRoKFen4nPwONAxlUe5P?=
 =?us-ascii?Q?u+QwJqJKju5X4zxDxMIF7Cxj5E4HcePH02qbIbZ+qgAoXUzZG7ExN91FpFhM?=
 =?us-ascii?Q?sr5uIzzY7lqvHCWqfobnCPMctjngac1jRRMjmO1lwANRgyIzxS2//R1aenDF?=
 =?us-ascii?Q?UIgka42P2ApZKNjdLXZk79l8Z51fZVtkNhfFqTgKS8NppWxQZDsiej+S5Jwh?=
 =?us-ascii?Q?8A40kUuIT/rhl6zJqGPlquJByVCkC4/ikvMbxQgOD3Uy4OA/OqkMV2p4RsqM?=
 =?us-ascii?Q?Wqe0MWDqjEEyrE7FiNgW+sTXQEN+2Iwn/G6B88fvPqvnmf/5eno5Jw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 21:43:43.5615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ebe1b9-0fbf-4ba8-ba92-08dd1e1ab68f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_134353_382654_EA38A4F9 
X-CRM114-Status: GOOD (  11.35  )
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

As per zynqmp-ipi bindings, zynqmp IPI node can have multiple child nodes.
Current IPI setup function is set only for first child node. If IPI node
has multiple child nodes in the device-tree, then IPI setup fails for
child nodes other than first child node. In such case kernel will crash.
Fix this crash by registering IPI setup function for each available child
node.

Cc: stable@vger.kernel.org
Fixes: 41bcf30100c5 (mailbox: zynqmp: Move buffered IPI setup)
Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
Reviewed-by: Michal Simek <michal.simek@amd.com>
---

Changes in v2:
  - Add Fixes tag

 drivers/mailbox/zynqmp-ipi-mailbox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 521d08b9ab47..815e0492f029 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -940,10 +940,10 @@ static int zynqmp_ipi_probe(struct platform_device *pdev)
 	pdata->num_mboxes = num_mboxes;
 
 	mbox = pdata->ipi_mboxes;
-	mbox->setup_ipi_fn = ipi_fn;
-
 	for_each_available_child_of_node(np, nc) {
 		mbox->pdata = pdata;
+		mbox->setup_ipi_fn = ipi_fn;
+
 		ret = zynqmp_ipi_mbox_probe(mbox, nc);
 		if (ret) {
 			of_node_put(nc);

base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
-- 
2.34.1


