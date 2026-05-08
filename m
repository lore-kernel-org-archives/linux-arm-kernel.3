Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D74CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5PJ1VSrduBuJa3wnyDTp7zozofHoLMm3/EylpqUYaMM=; b=TROH51VE16kKRMUx6WtiLpkJ1L
	DHZzuOLbL1n4y1Lzmbs3eIK9ta5FeHujud/4J/OnhowMw8/BjvMPstOvnsGcHqteenyKPzYptLrN9
	TVsQR00Xl029uA0xAKOfE7Q0NfK/e68LbA3T91DWtZSjaXu9IQx0ZddKGUS4XmqIa2peTPQ5Wzz8D
	VWuY1uOxRi3Ko0+qmLjqzqM2/v7ZEhQau8n3UquFp8JldD0Zc1LccOHg9mg80QHcV8/JxJlYb+LkD
	KvhZIPIZmqn4aKMkFXIlPqeOeak5XjoOmjc1KwIBqYfkOEu6yKhSM59XJeTnQIoT75uSbiRFiHxIC
	83CItQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNC7-00000006qQU-25Wj;
	Fri, 08 May 2026 15:32:51 +0000
Received: from mail-eastusazon11012071.outbound.protection.outlook.com ([52.101.53.71] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNC3-00000006qJh-0dnd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHJQfvvg7LcB251Vv+isN9GAxfzVSP39HGEGw3HZeli4FzBziRm2UksjpcQFpICKk+siKd9SqeM/hIQPUO09PzoDHTUidcbZAaZkThTwSjupwTybMbj8iKD9jZUPrz1wPPByFhlzV6v3CP3cys1ThNGHkYJ9uSWKq8XWFPk08scYKaohRtD8QS6kv1IbuImHfaleY+sOoHREkkV0Bp8HKEMBRLam06UzXPjIpGSX4lZrLcKN37+aqFtRzj8xE9QlIeBu7YrIuwpkiASzp7Nh/1XfaM0wui93IjBAaZpz66litfTrHfAeih9WzRNqaEHJz97998I4miggaFkEuYYkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PJ1VSrduBuJa3wnyDTp7zozofHoLMm3/EylpqUYaMM=;
 b=TxBUsQ7iXuddB4yKFm0z3NpMVOAKwpDMuwZbmJADtr4saukdJFivhcHNMHLBh2TAQARJ2oUd7NNP2Xvqt4zOkjLWtTD+EH3/oEg7CyO+6hOhTk9QhsiOg7BMiGdy7tNen+9skV1hAXUD3W3aUWsDRPUdBa0gBfC3SZ9Xvsd6Fq8XaY4YXwFMiuUMDCudym7D6QBJnbSqRqqtGTDEZdMD3w/1zLj5add6tNO40a7eoLf4riqjk2RHlZg292ep7sRDqekGPE2L8mbrjpu4HE5+dzrLYbaAn4o726CPKn6Vn3qHUUHrrvyANqyoygEkeNbNWJ9f80rUdxRj3POjV6JVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PJ1VSrduBuJa3wnyDTp7zozofHoLMm3/EylpqUYaMM=;
 b=dn7S/K5WMjylbOnqJzZPJvH9pA4VFTUAKHd5J5gZBNefczBvoA7ZGPqiVgIXlF+FFcZpkaNhoAodZMU7lZnbgM1sNylxOKhSvxzPOGIilA391spUyvsgiSVhQirqcu5FtouBhxePYhB8XWJz7bzfY23c2Oxge5pvtu9vJu4nmc4=
Received: from CY5PR13CA0029.namprd13.prod.outlook.com (2603:10b6:930::6) by
 BLAPR10MB5140.namprd10.prod.outlook.com (2603:10b6:208:320::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 15:32:42 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:930:0:cafe::9a) by CY5PR13CA0029.outlook.office365.com
 (2603:10b6:930::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.12 via Frontend Transport; Fri, 8
 May 2026 15:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:40 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWEFF1961972;
	Fri, 8 May 2026 10:32:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 00/11] soc: ti: keystone/k3 navigator queue/dma/ringacc cleanups
Date: Fri, 8 May 2026 10:32:00 -0500
Message-ID: <20260508153211.3688277-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|BLAPR10MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3019d5-fddb-45e3-3460-08dead170a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ex2tLDX1BN1vDyBeLP3akfnW9hJAkNqg+Vs53SIUhnclNA6/Jef9y6vwxBTyub65ButwIto5+VFQDFbvGJvBnJD7jUm131mMYUuBPtAvCS+jAdGtlp4sFDtw9fWeCxwy1Q8Qpu3Pni2XrL2/6en0HZu+MuRHUz1eHlLc2Lh6KySd72TD/tfmlDYytXlZ/hTFpW3+doZRGzIKNqhyordrRn5ywdneH5R39qDukZuYE4Hw6D4b0OHGcLSo4Fy6u+Wa/IpEzMzQ+HapvIaoCArsmaIJ1CPgp0hmxn+5rBBdm0Ggx0Nmt4hmRcZC0ElmBZ4yCkoU7qN2+FqdBdb4LlaugBc6xwD59ZGtS8hFOuqwxIc+6uO7rM48dgDqApJS9Lp24JuMbdJIqAVN9goR3i89JoFcJ6WRoWxf0IyItg5Dh564IgU1E16s/znbchJ0S9xMTwQ0e1Nj6YuQ3XsyPhygoMb6p9Vx6C6gXWDVb1RoADYpFBT+0AY72XROBa9ryZeMqpNQetxwZRqz/ENDRe0a/f6okeAjeq0NSla7QW4yKjlHrk2GbWVsV47MNKaVNOEkU+PdFyrVgBefyzpPfJ893fYOENDn15gwuua/taVEg9uo3wd8wMr6IAbIxwdzHagmhcvPsTn2xUrvmJ4MRXp24v80CoywzASE7o7sj7PXIacZQ6lq9IldCu7ApYaeuWO/
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7qXhyLI7H89SDUnNtYnkVZn2YHDWTJtPrTjcEZfffnXfCggaoJQQI/fQxBt6RFCoshNRwCIzfPzRld6eaBsbFW8os5bFK3/Z0tmqraXI3CUnY1l5IayxHxw2kTZxGtMCS53EID+Mbe32cPUKD/DilULWKOGwzVp/lAu+1m2pxcA6FhGAdnFOK60ohJBNQijrYMwNErs61fxwOkVCz9bTnxMRY0MblMmNlzbuVkKJNhFDZhU2Tj6Tb7oQPu3jeYMuj7zSvFU9kqOrhT3C37/rWZJhIhvOuO6Tt0af/bN6IM8ngIZKS7S12YDlRwwbu+ymPRsZGM3Q2WyXcopTNvSdXvUdVxzsoRpqgEu5d/yRB0Ubi3UIBiDSusOIrhsAtEdq+pv2MMTVDXcPGq6S4ia4jbxgQdLoFQh/6qdu3xlDitw0FS62TKjvarO/B1wapeYb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:40.4952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3019d5-fddb-45e3-3460-08dead170a8b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083247_419614_BCD4F6F7 
X-CRM114-Status: UNSURE (   6.07  )
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

Fix W=2 (clang/gcc), sparse, smatch and coccinelle warnings.
No functional changes.

Tested: NFS boot (via nav subsystem) on k2l-evm, k2hk-evm and k2g-evm
based on next-20260507:
  https://gist.github.com/nmenon/6c4a4cae646462f2d3856fac5846098b

Nishanth Menon (11):
  soc: ti: knav_qmss: Remove remaining redundant ENOMEM printks
  soc: ti: knav_qmss: Rename global kdev to knav_qdev to fix -Wshadow
  soc: ti: knav_qmss: Inline lockdep condition in for_each_handle_rcu
  soc: ti: knav_qmss: Fix kernel-doc Return: tags
  soc: ti: knav_qmss: Use %pe to print PTR_ERR()
  soc: ti: knav_qmss: Fix __iomem annotations and __be32 type
  soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
  soc: ti: knav_dma: Remove unused DMA_PRIO_MASK macro
  soc: ti: knav_dma: Remove dead check on unsigned args.args[0]
  soc: ti: knav_dma: Use IOMEM_ERR_PTR() in pktdma_get_regs()
  soc: ti: k3-ringacc: Use str_enabled_disabled() helper

 drivers/soc/ti/k3-ringacc.c      |   3 +-
 drivers/soc/ti/knav_dma.c        |   8 +-
 drivers/soc/ti/knav_qmss_acc.c   |   2 +-
 drivers/soc/ti/knav_qmss_queue.c | 148 +++++++++++++++----------------
 4 files changed, 74 insertions(+), 87 deletions(-)

-- 
2.47.0


