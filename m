Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46725CD484D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=25jzmG25SCXTL0pz8VgR1oAPdI2C1bYE05Myd7yvfIQ=; b=qmyylLwPvOjXI0+tqo5TRLzZuV
	xZx+RwAgETDBXv8hGKR8Gm9ixJ7sDt3UyWcEDS543LlnvrTP8x182HnxFm40/OKPtC4QKC2fFvmXC
	aBroVElPtnHjP3EUFmWU8BgHM0JYxgSZg7EOl5/VhRBnYRVsxAg2EdtH+ryPVCZIvzw9UgyBGQyVq
	+qt88PAf3Jv/9dt5kVF1/N1seaqqR88aNevLz6WcZPToL2/MByZV+hovM95VtzlEXPtmei7Ls7KvA
	3ZPfhlH3AEgmQfSdRmLJ4m51mzy2kA0mBZQBZ2nG/SqW9OH3oLRKtNNiew6/pk8ielVFqU/9Sm+w0
	9y/x694g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTZ5-0000000EDYT-3Bhu;
	Mon, 11 May 2026 16:33:07 +0000
Received: from mail-westus2azon11012056.outbound.protection.outlook.com ([52.101.48.56] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTZ1-0000000EDVU-2FnG;
	Mon, 11 May 2026 16:33:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxMGOUEvz1Wv1cnTC9Z24HdyRCldHPJkUId86AIRudFJVay2rCnb59XXKXJTCw13o08gHyDnHKNjhRbb+wP31h+65eoGv4RBhEIxd4yiJl3/4NdpQENe0U4Naq1towSra4FV1Oo2ByIUVEyiEDA/VQ5Mndy49fkfqohyJfkO/ItAc0SDZ7+rYSrhvFUp54+7kzobEq4p3rCi3UwbNH4vSpV8+GwzGaoDZL6ST37yHTvRomdJy1czefeeOAz/VJtHcLJHrMCIu3e01mr/m1QpFneDQMnaVnNOhacdodTScUee90HFBCVWtodwme45sX0hNQK+F2NO09KeXFjJMmildw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25jzmG25SCXTL0pz8VgR1oAPdI2C1bYE05Myd7yvfIQ=;
 b=Wzom4x/6MAKOyz8fKYTqGR5gGxcF86bFRyBJCmsNFzIUa9MJAoXNOohdQxkT9pFdyWUrXtALiqaUlFEjl6PQ3o1fZjC495TeL181DWDzYGV2ZfwL7vlmm75Ev+I7W/69XKYUXU935yKOBnP7FRg2mP8pQUZjRPtJV5tmeJxwHaOOIyGsuVY7mPVOZqdLJaEMP/rqw2wwGPXKS+aHlAvC1XhT4qSfz2RJPG4xM0wU3MDRR6+t60MG8JKLAVcfFqwDuXPXhp44sh467DNFUb5Zqg6PrImpK6X1SlvMcNJd4/PT5lwyUV+GuAnZ9ij83x0GkY0dywXXRXBaABiLO6XTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25jzmG25SCXTL0pz8VgR1oAPdI2C1bYE05Myd7yvfIQ=;
 b=Wr4NfhmSwA44GdfLCFrlLzkO0lmgZufmCA9YFK9JzYM0G3KbcIOG3N0iifw7jVHoSxmrhR40iDghKPSAZxo0wEjFc3JzosPNfuONxaPCex0emofXGq70xQU6g4q+GcBMQUvRFoOeOKArFbMjHzadjeRy/9wcUoF9mTmXlTdbqLs=
Received: from BN9PR03CA0035.namprd03.prod.outlook.com (2603:10b6:408:fb::10)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 16:32:58 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::94) by BN9PR03CA0035.outlook.office365.com
 (2603:10b6:408:fb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 16:32:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 16:32:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 11 May
 2026 11:32:31 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 May
 2026 11:32:05 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:32:02 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 0/3] phy: zynqmp: fix SERDES scrambler register handling and enable for USB
Date: Mon, 11 May 2026 22:01:32 +0530
Message-ID: <20260511163135.2924642-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 74867a53-34e4-4499-f7b6-08deaf7af631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: E7H8GKWCV92iTd4BzErmmAOfqJsyJY5M/M1xTxRI1EUxeiKjIdE0O3+baYtDrea49w9hltZ/B4vNP8+yf/i2A2vmXt61ZE1zfJQtTZwCfU9RCn9grbpinTET67puVLQDnf+uZ50sPhc2I/5YyHkl95T1MPSjvkZxvOmPYrPCwZAG3u8g6hK9tc0pBfl0SgwhD8Tgv6KoXth/NqBp3g+NKdy0KLtCF5ZoC+ETJ8DT9/8Kr73BORVrU1dvi2KC9y64RBanN6N9j2/EqDA27b0EdLqBwcoud4JQBQh8d6Qkd66Caa99v/XpKDMA2GL6m+YLmiHOxFpMZ+MgWvf2b/5GoLtemz047EocKyrHD59Nw/1RlpRbIIW5rJ3heVPvvtRRQBX1ezL1/YZczKh0pU3jhbtgSCbnsHcBV0gQQE7IAp5JUg+phcyJiYDzh1V1wKc7hRSXkOvBXIiCXEY7sm38yHaeCiano2mZqHxW5A4uhluYhQ7D3SGFAX6YW7fqcCxC+qX9zepYLFG9hKVW2Sly1MYVEAjNnAwcpuNkk5X4mTiZlpfOCQhUbEoxR9IYvnhxg0XKYZW87A2yNtLedgLcuWSrshfC7fcsyuOxItliVAaFg2Xk83UJMQuWLhiX+xy4aQlzwVpmO8WGHa7ukpZiuK21KCosXgp6BPDcwmyQYDYZDZIl+fjIXps04XLQZQC99g5ibMu/jxOdqp41BFbJ/l5SEimuz22KNt9APuRPbgU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PKRz3SzIx/C1bUYtUaNMEQYYpvkSCOVxHcYA0e0voE3sEEf+7kReSS31BSFBysgxvy1m+pvpiABP6HnQG7BXdWTCHudMHTjV+Ns6MFi/qzfZercdMSFvCo/l9idEjUHwy8KFScUIwV7BSlIG1q9AX+LyyKYhSBEfqht7aE3ggE+N/RsB1KyHYsE+aszQiwUOkrfNscbnKfQ0j495u6SLGrwyJ+Q4TQJDohQ4+tYrDjAunHnIHXvRapJkHTOCmsWjuVq/W8SbJmOSVH+SNqPdhqSCER/ZSvqeiO4ZpOKs3UwmcP9Uf7T3V0zOuCKtgUK337cosPko9t5pcDQQhl5IVIDNm2qSLntdbgRmGSJjIPGuEM64QtxlXzlVAlMT+gBUITjUmW97NskXkx8aqvm6RtCMSpbZZxJsr47HvKNaJl7S/s414yaDDUqmN/QrnYlP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:32:58.4017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74867a53-34e4-4499-f7b6-08deaf7af631
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_093303_575962_2FD9F933 
X-CRM114-Status: UNSURE (   7.61  )
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

This series fixes three related issues in the ZynqMP SERDES PHY
scrambler/encoder bypass path:

1. The L0_TM_DISABLE_SCRAMBLE_ENCODER mask incorrectly included bit 2
   of L0_TX_DIG_61, which is a reserved read-only field. Correct the
   mask to (BIT(3) | GENMASK(1, 0)).

2. xpsgtr_bypass_scrambler_8b10b() used xpsgtr_write_phy() which
   performs a full register write, clobbering unrelated bits. Switch
   to xpsgtr_clr_set_phy() with clr=mask, set=mask to preserve other
   register fields.

3. USB Gen1 requires PHY-side scrambling and 8b/10b encoding as
   mandated by the USB 3.x specification. The driver was incorrectly
   bypassing these for USB, the same as SATA and SGMII where encoding
   is handled in the controller.

Nava kishore Manne (3):
  phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
  phy: zynqmp: use read-modify-write for SERDES scrambler bypass
  phy: zynqmp: keep SERDES scrambler and 8b/10b enabled for USB

 drivers/phy/xilinx/phy-zynqmp.c | 37 ++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.44.4


