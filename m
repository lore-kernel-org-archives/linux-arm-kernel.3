Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBE6E98E1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gqfU6KFc/E63LQs8tqm2olT5etaW6LRyIdpx/aEgl0w=; b=nd6BBaLdp4KsdaFJX5NoL9dIWE
	JTo+CjBh+G9YnBhZuyd6vSFVfFrubZ3ssBrO4q+QUO1U1Umhohz75IWnOWkY5ANlPnZSSVc0NCxEk
	zQ7B4gTjcEU96IgNOjAmahBisL22cG8/exnIijTk/Xh6q+vbaOYqe/d59DT7zbprV625iVxdABSIp
	bBtog3Taw4U/I10ZTjpHs8pdRul6tg+nDJsGwjH+riGSHfBd15YIWPkyXdvE3KUzFMtWBzcxPs+wC
	Igvsne+bm6fTbSJW0Y//QOQm5JslNWvVT/CvCAziFqngLxf8+PksMHcge53JZMwH+Yd0Ci6FEH4Oq
	K0twZNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTSI-000000005Kp-1x92;
	Mon, 23 Feb 2026 10:46:22 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTSF-000000005KQ-2KN0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:46:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUTzlrrUlXLSi3TK1LQv0RyQWVKoMSLmQoT8uYR1CTtnys+Xlbf9N8WCBYTukSWWXxzc+q2ilD/geHdwpY5HYsLc43KPgUMu/ojlVzjXz+ZJRcaq8SHrq98RRZn9p2QyrlJmWDq9+5YcLAPu4LB3Zeb1UX2KyD9Hlqp3ZoT4HdiZgk3qGvrG4IGua/Oq5GVF5+SCK8Fx3vJdmIvxOhuRnjXkNG4G9YIosO1JxNWk+klibrMegQP7XsFuSgpr/tfP/+I3F8BRPHHbl09/1Z3sZpurvo1Am6uTuEk68cmQwmRv7m0NAIKD7M7yHaWeuWCOadPcpwMcDzXjd/ippa0FuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqfU6KFc/E63LQs8tqm2olT5etaW6LRyIdpx/aEgl0w=;
 b=u0Jtl6r5Qq1C8ZwDg2XtFdCFnNZzaplZ+2nCdorXbwyHmVXk9KbQ2aAdzF6UocKFHlqW3RDJ43NOV1EIWnAPdKHMKfIragE9P+UpWOMWUGzBThQ3kHaKvDOtMMXq9HOkqC48Xy8UqXMo9mykSYw7ATEf4Eqc+BnOzRxZya0xGwcTvRdpe8qkOm9z1zoalIKkDy6avssM9Y6agC7EyK0lHO7CC4bxfSywqOtXotZRahhalZ4kERYRCXS5ChCbFjmGHJkdGD9uHzEPWZIm/CEFsUdN87aquMNz29yHd9PaVuRfUT80KSG5vAZ38FjY5hsjQ+UX9hEUspzVeWPPWiku/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqfU6KFc/E63LQs8tqm2olT5etaW6LRyIdpx/aEgl0w=;
 b=KTLqFXfOg8Ib7POnzHG4WAmRpl22BJsz9hmDi03NhxXE63rgSMQq7su8e9oadbyx/PhBlE7yVg+cUibdyA7GIjz6y5SwGqvDalcGfQsDMexY6fuxWb3OMLoQNRqz02wWNwhkyHSvzuRRWyZ/zaQY9g/0XtMy65WQiCyPg5CF8r4=
Received: from BN9PR03CA0388.namprd03.prod.outlook.com (2603:10b6:408:f7::33)
 by MN2PR10MB4336.namprd10.prod.outlook.com (2603:10b6:208:15f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:46:17 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::ab) by BN9PR03CA0388.outlook.office365.com
 (2603:10b6:408:f7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 10:46:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Mon, 23 Feb 2026 10:46:16 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:46:15 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:46:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 04:46:15 -0600
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [172.24.231.225])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NAkAv8643920;
	Mon, 23 Feb 2026 04:46:11 -0600
From: Aksh Garg <a-garg7@ti.com>
To: <krzysztof.kozlowski@oss.qualcomm.com>, <geert+renesas@glider.be>,
	<bjorn.andersson@oss.qualcomm.com>, <arnd@arndb.de>, <nm@ti.com>,
	<ebiggers@kernel.org>, <michal.simek@amd.com>, <luca.weiss@fairphone.com>,
	<sven@kernel.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<kuninori.morimoto.gx@renesas.com>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>,
	<danishanwar@ti.com>, <a-garg7@ti.com>
Subject: [PATCH] arm64: defconfig: Enable the J721E PCIe endpoint driver
Date: Mon, 23 Feb 2026 16:16:09 +0530
Message-ID: <20260223104609.876613-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|MN2PR10MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: ebad3c4a-b3cd-4b55-eab1-08de72c8c5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nMFC5a2hWAIc9ESBjSRUnvGJNsz6OiD7UrcXZMys+YblFUpI/z83l+Mdo+8z?=
 =?us-ascii?Q?7USN+82FMTPyv0n5GVPvvhAT++tIoNor1KyPyB7BtzAjNc+5ZURFmzaDpz+0?=
 =?us-ascii?Q?Vc/Nyi2VaiXtfDuonbYxqnzRiA6zQ9Z0I0jUA25Sm+mnLbLm1uk05nsl7hhw?=
 =?us-ascii?Q?03zrB7bHPL3nZnLg4zq80Jb/qTiavLB4p6sCL8hsEcKWmbK56snlj+B+25ln?=
 =?us-ascii?Q?E57orcx7zpPtFF7PyvtsK/y94N1JwL+L8CLJcj7Lth976o1mk44fepuPgUHu?=
 =?us-ascii?Q?68EUzdTIGNzkLRrz+a0vgs1g7NXzMDRSeXdt5U02PKTozN3qUK7JrMeMVoUp?=
 =?us-ascii?Q?5w6OZk8FWTJK/oy9mwYQ3PVlnJCX5bvlh0Lyxbb4dQKgHY5wJ9sdol3Bgcvr?=
 =?us-ascii?Q?CnF7va6+EkC00jOkr4HMjmtsWzelt3ucwpQQaSMwYF6+G9IF37+J+klA218/?=
 =?us-ascii?Q?PhAJfNm2GTShs5ak3nJpV8t8oGsFzzTkzrXQ7aSVy5wDbUGWLrHu47anEbEi?=
 =?us-ascii?Q?IP9TrgFXC70II2UgxwvjVP3/pIN5FofNPWRWddVGCX6lbykAXm8qF+mLsYOe?=
 =?us-ascii?Q?aB+LR8yo/3aeV8bauWhGJAv7F8qR6UKPGK36xArBpBYmaKAzEz2fy423Ljni?=
 =?us-ascii?Q?JCiQ4e70kFNcXO73CyhDo2xhS7tPQNsSn4I5iynukBR8Vhl6ARtFKzHTmAkr?=
 =?us-ascii?Q?C3y1xRTWmrn7/I08PzzWfMpmrofDrfkKYetQ0mZsqRn9oV8emyA0c3m+SEhC?=
 =?us-ascii?Q?db7vtToYz7Cvd0v0TZO7FR2pXTFa1+njEmBA7P02+ANe7h14HsD6QFIH0Ut8?=
 =?us-ascii?Q?73CvhqdABFdeZrekN58RuN1gNhln1b9Lk5DYHupnFARkIxDjb6kDgRrmygYS?=
 =?us-ascii?Q?NRWKcFx3oN4Byev/TQ90EIu1Rwm9A5FJGHdYLQSYmjnKNlA/86BA8Zo4jusb?=
 =?us-ascii?Q?2maGELc8aVwtS/sdU8UHVXP+tmM031ZyOG1OOYHBzF4CHIn3I8PgNBPzxqpI?=
 =?us-ascii?Q?GJz2B5h2On82Mdl1hcDGucEyUfQxehXJLQiVb/S62yeg+DS3suIEH3R2XSp3?=
 =?us-ascii?Q?KJJO2slD9nJpEJ5GdIGXRHpX+rbLOhiRAImLOPKiu0K29RYc0RUIVSiaY8wJ?=
 =?us-ascii?Q?Azb+Zrxz1FcKPYBoSa4vuTY9hYekvNDA0CrZlrDHgAi8Bj59UEyS/tAxhdPQ?=
 =?us-ascii?Q?MQ3zIdVt+BIGPmWaw93u7HzQD6dX+QQCpIQkQ3mqMqOJDcYXwol0LNOQ9HPV?=
 =?us-ascii?Q?Y7RpeLn5cMFHiivd6MoDLQ7jeLaGMYUn+xGT/mCAxwiO/SCNuj6o9DG2oZSX?=
 =?us-ascii?Q?Y8pcG0UXpP4eY7Kig5OLfqGvwQqeVn/tqI00nuAN1ziXoAfXJ5jcyftA51mD?=
 =?us-ascii?Q?yJi4MCyHSrSfbYRFvB7j1lDpgS4JUrOEa02HHQ8/Kfr9XTsFkMkfDdnXe86R?=
 =?us-ascii?Q?Zi1qEOOFVB7/Y8RPUovjf9HXDYK1uw9hS/7MYeCRCrN7obGoAVauNrSDqb+o?=
 =?us-ascii?Q?2dJgTYexg3avscbRY//U8em1c/pn8Hyq/Q0S4gAufWo8fvHRDmvmFVtV133R?=
 =?us-ascii?Q?yd3vU+6IjuWPuZPqlWQhOY8v2LZGF5iY2cyhRfMPOL97TJkiSVd0iziXN2P9?=
 =?us-ascii?Q?hiOkwHhxAcbLD08mnxWzwIFF3Gt/Z/zDqg6rMqXRxvU/io6Pq+9Z/sqA1IVR?=
 =?us-ascii?Q?zXXXjuV4/WJJklan0thD7e1HekY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: c5pTHPXdB3KA/+8iOMFeZZ5bkgNibfKdmZ3Aunpw+5E4TLyfnDr+stn0xIaBZ8Zh8jTf/OVsP/Hw1WhlJCMozGFECfpYVQM3lJZQ/5x3A/TM1Z4l0KNs7N9V+PUtTeSS1Ero24s/HXAV4RLOjq8MjAgneTZcOdix2aEICfLSucjHutkB+o1nXLBnYa4b/xLhe1BiJLDhEzukUiIfJ3nHgv5pTKRWO/DnQa33BMlvvr9UhGCwEofucLecox3cM15VU34JNzQ6hsK5YPk87Pp69Arnrh5nol+9UqAWJHFZjmRMgcoud9iDE6S6tgsIW3zmOKcxTrxf+cMI6VWdm5w/SQ5cZ3TAL2HWdgtmkZ34v78rsKVdIybKHZy67fnqtnc+c/lGwOOpX1uWwX3vTmnecPwE1NTRyHcknSG3zPSHcSPm/JCeOAlUnYbYd5anhKTQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:46:16.9746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebad3c4a-b3cd-4b55-eab1-08de72c8c5cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_024619_596533_6AD190B0 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
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

Enable the PCIe Endpoint Glue driver for the Cadence PCIe controller
present in the AM64, AM68, AM69, J721E, J7200, J721S2, J722S, J742S2,
and J784S4 Texas Instruments SoCs.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..103f4763b88f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -241,6 +241,7 @@ CONFIG_PCIE_XILINX_DMA_PL=y
 CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
 CONFIG_PCI_J721E_HOST=m
+CONFIG_PCI_J721E_EP=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
-- 
2.34.1


