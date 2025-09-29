Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C8ECAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwcI28FOY4kN3OQcGrrreoo3w9LFqikCXLdja2G61WM=; b=JKC0Y6S8Ai1aF2ke9wQVQMDgBn
	NKMzfQRmvRFZjI7sXMxxhpWj/9D7PPFis16JhibTLM3uB4y3tVA+w4ZV6mvwfK8bsmFVokyqxJNQ2
	hGNnP2XMr7t9h6ra80dL2f4ZMW5QuXR/ltFY/rUCHBn4JOIr/c4rWnLKkBGdCxSpZ9CSc/67y97Fu
	4B0llQR3Quc03QMDPfGx8LY3EsX6oyJz4SX3M0auVFzqQ86YSEbEnKBD3pvz5hRRY7sh+fZH5EcpC
	gdjUoKzYfMWMsa7wt4eeO7bXXU5uIgJK/XbfitoPKcksa6/J+FKp0yk1KNao9JRSegj7vZwq9CAbB
	e47pOzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38TD-00000001dhg-3hyL;
	Mon, 29 Sep 2025 07:38:51 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38T5-00000001dbK-1Rnh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 07:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLhdf+ypBqUkivfnOORGf7kSBRqX2vS/EumFsYdW/z7fmYuLuAII9avcgraaRXzKdPzyKnF/TEtbspwyVyv+1WN5TIDHhIjuy0H/j/+J3OjV9KuKblkcG5ZGBYVpZIPyKiOQDrUlXyF9C5WFUwliq3PQqDxiErUsdW/z68qoiZsrHjCpewBjzkOm7ILOqOThzsMHvI/g+eLCXgPk1x0RndJ+fnk82rwPMpVROGJSegRdEvFX9TdhkHvFF62ZKMvHD4MpYsw2FK5uUOFk3ikqU2rVzwcDgK8IpbWNTzm0FsqobdySydiW6ZcLBLBbYNBCyeqjeiKIJRec481jSENJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwcI28FOY4kN3OQcGrrreoo3w9LFqikCXLdja2G61WM=;
 b=QE51vCxFMo2R9uEn4ktdWA8IRngWFaQ5/c/hLqHNhBFVkEw29VFNEzXNGdFKpzvkElXIc7cYrOU4rdSDGJvAyBoliKXtwfeMHZT0mmQopDj4W59ilqpWWJy2DcUC4PCRI88Rs3bVCClmGDNx+FKSfClqAv/ykZic4F9QJqHuYHE0dGZzh2Ug7G2y0F+ZZCaKlvaKVLZNOyG4dUF50wJ9lrEfjEkMGiLipiJ3UOUUVbmC36IYWDU+ddGecj7UbpP53jN0NWWnF+oDzUeXW49/CU794w6RTrjgiH2Fq9Q9rugEA3UJx1JbSHAGbaz/OPJH5EGENeL91oSsoE04438IjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwcI28FOY4kN3OQcGrrreoo3w9LFqikCXLdja2G61WM=;
 b=Fxcr+NqWNWa5znACdzC/u/NJ9tAzL0+HvIUZbCtf4bXlytsXpezodJES2DTmfCNJL80ekZPZYPU4LJPE9cF1b01v88654eJP5UKmzivpWsY89BsC6G0hgKlMsyXEBaxAnMhGzO7koyfgqT39Y02utk7gXPYcC9cRicd/WOGXZHA=
Received: from BY3PR10CA0008.namprd10.prod.outlook.com (2603:10b6:a03:255::13)
 by CY5PR12MB6106.namprd12.prod.outlook.com (2603:10b6:930:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 07:38:25 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::27) by BY3PR10CA0008.outlook.office365.com
 (2603:10b6:a03:255::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Mon,
 29 Sep 2025 07:38:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 07:38:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 00:38:01 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 00:38:00 -0700
Received: from xhdharinit40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Sep 2025 00:37:58 -0700
From: Harini T <harini.t@amd.com>
To: <jassisinghbrar@gmail.com>, <michal.simek@amd.com>, <peng.fan@nxp.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH V2 2/4] mailbox: zynqmp-ipi: Remove dev.parent check in zynqmp_ipi_free_mboxes
Date: Mon, 29 Sep 2025 13:07:21 +0530
Message-ID: <20250929073723.139130-3-harini.t@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929073723.139130-1-harini.t@amd.com>
References: <20250929073723.139130-1-harini.t@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|CY5PR12MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ae417f-ecf4-437a-86fd-08ddff2b2ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8PuEjr9wtL3hLwjAlQTMNZdvV+qEeyOt3iEmeTdwion++JNdc/PmSzXpSg4U?=
 =?us-ascii?Q?aa5yHTzTYjlqqLONgGr+L2nwxiXd6kAFOYNF+valIFHZyd4UiYWaBKNIL+F5?=
 =?us-ascii?Q?EbJNi1iyuaVSeDYhIHDruFmPl4j83A4uK7lY4Iroxq8oT36BTfUUtzrGx7Un?=
 =?us-ascii?Q?kJ7m0SOp6CHV7toRueoO8NmVZc47Tt6at4JASI0a2olZqRjSHiYvu8k/mKWv?=
 =?us-ascii?Q?lXkoZs4jPeIy3+6L2moKRrMe0GuQB2pgB829FdEPjO2Tu5bPMhT7csk9Sa7Y?=
 =?us-ascii?Q?hktwqBmerVLdOv8tKCXE6XgQTF/lwWGPX8d1hxr2Bt4Qwi0ALsC3gEqkqDmE?=
 =?us-ascii?Q?Tc9LxNe3r8JMPQfi3JHZp6j4qeIfsm9Z6qPWNEcwUV0AdtKLlJCXUHE5eGIs?=
 =?us-ascii?Q?t/CpQnqlbDIReQqUVhPXKDM17xlpH546LzhPpb3QpuLLU5Svnzj5gvc9jtyA?=
 =?us-ascii?Q?LS7+wrNXvG21UbLJXykR9oGto1CWNkWh0Vd45X4LwGGh8IzPE8VZZtPkyBBG?=
 =?us-ascii?Q?K7nBmvnmPJg/WzwNPuWuvZCzwfNyM3k4qHsEePGsO202/LBuBKp8wSlQB6a8?=
 =?us-ascii?Q?RcgXsk0KpNu8OsfVEN5pls/dzwkxJyk/2ZEh72ytZHmEhXT05iCy/uMJtj6I?=
 =?us-ascii?Q?DB4Vp8I+us1IBX0FDZd/UVLrg/uhpM9+Pooa0kwFCaETRzwAJPP4UhVm2rPq?=
 =?us-ascii?Q?sE4g3UJIBz1jqXI7HNGDcBCDMzMqM4HaxmU0VdOjSMjxkK092dbrj8WysOjz?=
 =?us-ascii?Q?QRfskMS8WBMcSYI5PB6F3+UMryXI5y5zWph5qqEq57LD2/DnMmf37X/sKqxH?=
 =?us-ascii?Q?5fQkhHoCoHrdn1AaY8qF5NgaUsc1cv+IQYGV+Vrdx9+PCW3ONSCp2aefY8Ac?=
 =?us-ascii?Q?hQjWTqdiKer39vjft0/M1nZYtglMyAbrJQVQPCBmSRyoKZTrLiv8bAcgneSM?=
 =?us-ascii?Q?Xph3iRBbCC2NJa+c0w7WGa8YSZCmJG0A0cFvFiRrR729gJmv08JqWO8ayOKD?=
 =?us-ascii?Q?Gsrzk2MlppMKQVNznMIues/JVCFXMLqlaEzA+l5vIE/iMofDK170zyem2JOe?=
 =?us-ascii?Q?91U7B353B8/pZbKgivexDiaKT7q6TSiD/wqO/Ni8y3Z0vJWocbPAklHkC5+b?=
 =?us-ascii?Q?jASeOzNKF8eti6R0nCYTkBmlm1swWVuhuF1d6sEU5ZfU9zZl2pePaWL/fA0I?=
 =?us-ascii?Q?/9l8A66EMBwx4cm/vjLA9zOkmTpLyBymVml8F3dWn4LCkWadFPwfddzhwCwC?=
 =?us-ascii?Q?Fq8aHSiTJx7QhITXnrVEs0PXkvOlycLjn9seR2Ix1xTGfOSHjtSObhz77460?=
 =?us-ascii?Q?kEZwH1e4s2+A/EzX8h1KdxdTMy7nnHMRDTJZ5gc+4+VHRBclfQZVlZCTxk99?=
 =?us-ascii?Q?sRxVqLD+G9W4ZSRuFeA2UPPexYvL4f34MNBu/dUa4C2JVlmPXlM0leg5qaLj?=
 =?us-ascii?Q?GnGga4sa9so5mjGLXpD5wrbLvrBjTdYYNfCunuaoGTlpHIq4Tc56L7G7s7AQ?=
 =?us-ascii?Q?6iquYi0TbN8EALUFS3RUvKW7dZcnSdzKGmk8/x0mXInaZLFO51NPJW8oiBDz?=
 =?us-ascii?Q?zDpjQ5cjuAtjjJq49gQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:38:25.7053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ae417f-ecf4-437a-86fd-08ddff2b2ce4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_003843_406286_9E6D7552 
X-CRM114-Status: GOOD (  12.08  )
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

The ipi_mbox->dev.parent check is unreliable proxy for registration
status as it fails to protect against probe failures that occur after
the parent is assigned but before device_register() completes.

device_is_registered() is the canonical and robust method to verify the
registration status.

Remove ipi_mbox->dev.parent check in zynqmp_ipi_free_mboxes().

Fixes: 4981b82ba2ff ("mailbox: ZynqMP IPI mailbox controller")
Signed-off-by: Harini T <harini.t@amd.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 263a3413a8c7..bdcc6937ee30 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -893,10 +893,8 @@ static void zynqmp_ipi_free_mboxes(struct zynqmp_ipi_pdata *pdata)
 	i = pdata->num_mboxes;
 	for (; i >= 0; i--) {
 		ipi_mbox = &pdata->ipi_mboxes[i];
-		if (ipi_mbox->dev.parent) {
-			if (device_is_registered(&ipi_mbox->dev))
-				device_unregister(&ipi_mbox->dev);
-		}
+		if (device_is_registered(&ipi_mbox->dev))
+			device_unregister(&ipi_mbox->dev);
 	}
 }
 
-- 
2.43.0


