Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BD0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 12:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AWzsZ3c+BQsBP6vU2BWhSiHdiu8djKZyN5N0Sl1fbzI=; b=1yRKwMWdymUBeXzkGDILPNPCcY
	vRyMGPmHwCBx2UWcNFV1ro5VWeDThe8i5ddGep96MYcv5rYAjj00vTLWIhDjszZhiW7RZWjjjCpmK
	UGvCNkjgEuyqgpedD1kjIrTAGhsiQzcaF8Gak6aN36deFRlcdgDZiJQlVr2msGmQYq/kn80VoWeV6
	Y/XHqRdslbosC3T953Ri1ABch1Aywmj9KIH80k4ZFKmETK6W9a0YLaoRu1njj+Xos/HPB3aINsRFN
	AjGXq16VSkOMm/QwFa153PrCrSF0m9goxoEBSqoatsPUNagnCfqSQeVvQ6wQwjt32ELM2hIdQcXEj
	m0ljZTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmsF-0000000Fkgk-2GXS;
	Thu, 26 Dec 2024 12:21:55 +0000
Received: from mail-bn1nam02on20624.outbound.protection.outlook.com ([2a01:111:f403:2407::624] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmr1-0000000FkVA-2KN1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 12:20:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJgIXzk2SYMxRkOMVRqTtNRhsyl+9eRpDZiMyA1hP6rPcZEhc576jzN9lCrYWzFsucFxxfRg0W1YRAbKsGYVjYxPnz1S4cX2e7yPjrWi1jUURZ2f5wST3JC9tWlmLhomUCZJ5VbLJb9e/Mnv7u+uEKW5f5HBcJE2fl7zEv0h27jKMs1alH3TVNQewf9LHC7G41v4jhTEXgEPmgeX9mJHULUL3drRwT6vENfSRfq3/BhafGHFDMl5E5w6qpP3Fx6ytTXp8TrBecHs1dKc0OFTfzANOdDxnUQr9VmOB1jK1kTQ5R/995lg5Q9Cu0E8kUrvOwTAVFh4Z8xrUbczvyky4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWzsZ3c+BQsBP6vU2BWhSiHdiu8djKZyN5N0Sl1fbzI=;
 b=RYGFcFQXAlAKZdo/HdUHJ2q0vBoX/YpwYn633uCbGvdBYBQM1GIXSK4TLFiu7t2HeM6mKUT2ktH/eT8arokgnKPtm78OjU7K0gzUXp1TivI2lQNKIhRcQvz1oMhK9qEQXegIHj/83PxcTocipqAGhGzIHoQf3AMk9gLC/MOJD8oL3n7+fLpbt66kBC2tI6k+NVjlHttMLwQE4yyZj9YwdeTrZ2VIuJVTG2Q6EstkgwhZR3kvIdRlBjcpVsYL4a61+JNjQ3feruTRtbiG7gibAeAStySiuFNK0dKmExN/T0MNU28GfnaGsddbVe29w9WRpKQFaT8MG1wIROQD86TKag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWzsZ3c+BQsBP6vU2BWhSiHdiu8djKZyN5N0Sl1fbzI=;
 b=A1cWbDId6H3AfKSSpeuLvHiMZ2BFZCUFE8irDPFAfY3Fk8t8nmyZ6k2jnOmIOfGd/iXaop1M/Wbige/w0HVrZ4I352ud1MvoLI9JDtGbWEDH/EYflvUA+aOKR73wbl0MNbrrv8Tpf4lUoR/Z+vXdinIDCrfB7ZhkBAGmPhKkBsU=
Received: from MW4PR03CA0247.namprd03.prod.outlook.com (2603:10b6:303:b4::12)
 by PH7PR12MB6953.namprd12.prod.outlook.com (2603:10b6:510:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 12:20:28 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::cb) by MW4PR03CA0247.outlook.office365.com
 (2603:10b6:303:b4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.14 via Frontend Transport; Thu,
 26 Dec 2024 12:20:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Thu, 26 Dec 2024 12:20:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Dec
 2024 06:20:27 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Dec
 2024 06:20:26 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 26 Dec 2024 06:20:26 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Rohit
 Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH 0/3] clk: xilinx: vcu: Sequence update and couple of fixes
Date: Thu, 26 Dec 2024 04:20:20 -0800
Message-ID: <20241226122023.3439559-1-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: rohit.visavalia@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|PH7PR12MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: bab6ee73-fdd3-4d7d-ad0d-08dd25a7aef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v7rAfSu2eabLWTxfKDMGqOdyvwRDE4BqRB/BT9rU/jpmiDZYIE2C71v8sDL6?=
 =?us-ascii?Q?HIkOa1abO8pb3y7mokjM3knUU6YigP0PKgJyZ0DvN9TT3QyNVqeYdq9x8Z3w?=
 =?us-ascii?Q?+QSIDpQxxLIgP/6VO7xBA5qaj/DQzwg8s0Uhmx5b9KRSCFngpN2bpgsAJWhk?=
 =?us-ascii?Q?HY4NG6N/ZnS1PfQrUoqOJ2hO77bphrrLB2MjffqT5OVEgLzmppizgaQWbktq?=
 =?us-ascii?Q?rlydEbHYRHQ9W7Mkny0sgjmgkMUWOBhubQia9hXmp1OFN3jKH6bdexfRyxE/?=
 =?us-ascii?Q?aUAWZqklT8YDqEhcvlqRUC/dj1Chx5Rn5IztpBugIaJW98gQnjiskDTxkvNr?=
 =?us-ascii?Q?Z3V2kPD9bQgQ2l+cSvcJDUtTUubtS7/Yjau0u/eYBex1s9ntVq4TCcMHPdV5?=
 =?us-ascii?Q?3LIN0NB6arZagwrg6kNqQdDOT5HQFYcig77lAdjjxTJkqcZ0QMAvrfY1AUkd?=
 =?us-ascii?Q?ajDlO4F/RYp1DwKLKh+45gQUHNqBrX68+q2Ow9Dsu5vn9WXMMZ19WByKFAXE?=
 =?us-ascii?Q?S0IdMasQ0+QpdjMt+I18vup76Qe9HaCw4+KYuZb92TXznxmuvqvCXkVIJ8Cr?=
 =?us-ascii?Q?/dudexPikENcRa0DIEjllTwZTpyGS8k3MOYyoSs6pp7JMQoIwPBs00BbZOT+?=
 =?us-ascii?Q?Wz9GBkwBJC0C9yB7/mRP6C8G1iF+ib2Ma1gyKESE+TR59Ke2itmHU7Epc3Dh?=
 =?us-ascii?Q?Zjtka5JEnPRqnSOsEGfoA4R8qwMZu3Ly5iSb98sMH+AjI4L1xWCxdGmnzLAd?=
 =?us-ascii?Q?o/aVqU1P2i5A6agmdC2+i7OxHED9fVmnWkgt3ApCH/5+dkUheHr6kNnH9FIf?=
 =?us-ascii?Q?1p5q/TioelMUvy+1yP+Rr0jg4hw00+bMwQEIFR/h2CH0Z7PhMJyOQ0MV3GxT?=
 =?us-ascii?Q?XEqVVbMumtSKeeuoMK8y8oakSDA2A/ofio2aXmZ87j7+qAn8/AMnWMxyyHsK?=
 =?us-ascii?Q?WhqpXY9btVMfIX8I1HIegXFZOlGiiEe7Vu1LZTJr67eO7hXiQzhMimlol21Q?=
 =?us-ascii?Q?t3SOtrQhV8Sc5FTkNlndGHD2Ubg9N8LqeuB/zpzjYyP9vpDxB0C3Pg5sjuqy?=
 =?us-ascii?Q?uLlJ3DiiFTdlRa2ep6dkG7rmvL51MLCV9hwv6UbpipXjslQF8sWAlMAaoJRg?=
 =?us-ascii?Q?xQs/rn3vQQGheSX/pgSflqbaUtsBMw/joEZLJHvfB/FamKsrRagUEhOQo7ZK?=
 =?us-ascii?Q?Y88QtpZdP7WSVaG1cMIsY/Qt2N5RyoaHMwUn6fbK3emhy3Pl2CQ/o58K10rP?=
 =?us-ascii?Q?R6BPfMu734sKwheeYGtUdSzg7LA4sAtQfDwizAVaouBJSvR8e3MB54S897nV?=
 =?us-ascii?Q?WQo8hbqLM3KOj2TRvncEYKtR4oOBvCwtjaKB0PuKPNq94vi3wxoebAfRq4xR?=
 =?us-ascii?Q?Unx2ouufM7pD02Kjs5SP6ubJvn9OODPAjO35sLbHPVfzOQ13IVKFyv9XqolZ?=
 =?us-ascii?Q?FnaK8FwNWgSHb4AXBEXkmfDb2FaKLKuvqE5H4tP9s8lvNYeNeRgh+fu02gEw?=
 =?us-ascii?Q?wJlVf2v9C+dhq/A=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 12:20:27.9952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab6ee73-fdd3-4d7d-ad0d-08dd25a7aef4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_042039_768103_6E2A120D 
X-CRM114-Status: UNSURE (   7.40  )
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

This patch series updates VCU init/reset sequence and does 2 driver fixes.
Patch1 adds optional reset-gpio support.
Patch2 fixes VCU parent clock issue by preventing pll_ref to be changed.
patch3 fixes call trace related to pll_post clk.

Rohit Visavalia (3):
  clk: xilinx: vcu: Update vcu init/reset sequence
  clk: xilinx: vcu: don't set pll_ref as parent of VCU(enc/dec) clocks
  clk: xilinx: vcu: unregister pll_post only if registered correctly

 drivers/clk/xilinx/xlnx_vcu.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

-- 
2.25.1


