Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EB7CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RIWBYJzqVt/By7HVVzCOz+N2LhCquAVMLebsrFB0lag=; b=cbPsyCHAS3t1uAH3470fzx53wx
	yZ+hf1AAVjdjK7NjP0Xa3a+GIq2G0mfJIrC6Ohg8DK1UZk+fCc4BGl72cbja0P5bmfFqJp27pzsMv
	wkXPK1igtQvY866Y4y/G4jNx3VcHmcZ/LwNk0eWdya2zODv1M1eAMu9vkLnXkIaNIBbmdXDWs2TZV
	+SLn3YU8rZT0DR+8ZlBnP1IcpVIRgK3evynsLJLssBddD/cBcbR6FHDKB8KLlYCwZd0m7Ray1DM4n
	ZmNq/wJobpkNrk3QF3zovhhSob9Ea5XmL8nZmIyCJxbzVfP0fZLzRHKr3eR8kyad20xwu7wLtczC/
	bHWNlzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN3A-00000006oa2-2MFA;
	Fri, 08 May 2026 15:23:36 +0000
Received: from mail-westus3azon11010026.outbound.protection.outlook.com ([52.101.201.26] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN36-00000006oZE-0oO3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:23:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiEbd3r6twoQxDfScDbFFTA6RWZZu/Cd8ZwmYx8rDfC/OTu0zrRNsJ14MwNwF3/lzKqTanBL6vYdnNTDusxkY9MLyUngDEkL+B6A/TrMhihO4dbyYypy1rwbrb7DhbTGg1PsM0nIeOieOTTX33bfELtw8psiCpqC1SDNkQxWLrei0W/zrCoS5a/4fR+jBqv2hVAGgb2l6Z73fJFTUKuzTD/Z797c4Anqo702cLx5txiK5Dp73ALajXe8T2q76AfeJcVr2SkEvvMaVLhp51tdNI96a6eKMGkTw6kP2qRf4UJaaD2t0HqcETMNVf6StFrZAEYSJZ9bzFKlWFz2roT05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIWBYJzqVt/By7HVVzCOz+N2LhCquAVMLebsrFB0lag=;
 b=IXDl6ILHtFIitPtZ7dZm8l+fOAWOGVyq60EOhx/PhY0UcFXs2bfhnOscSczO0P2YhiY4tp7GgRKjJEDRcqIt0Ol5qmyNgNt+utciTnIe3Nxg5FT4xqK6RfhPNWOSw6ifFsucS55uqo1OVstoggVQv/mDh/8fWFF57prCgKenlGktokZXWL64Y+T3oTNDy8MvlShxB7AQqFg4FMACNOkh/LrMR1x8KsDsMUVUqcGfrcOyNQse+JKyWZ4XeR8QUDD71AiZs25fop6/R462l+9ChTTLYQY/dwhMgvoABtZyI4S60JkvrFzUBUBhYqztkgl6PrWMLtcy2MDIUYMcULkVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=208suo.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIWBYJzqVt/By7HVVzCOz+N2LhCquAVMLebsrFB0lag=;
 b=FWxPBuExbQ/4wIb5+34yJWrTcZ/JbttSea1MlM3/fdU22QWIv9UAk7CYWjHhGhZDosiWN7BIYwLQmKeFIhNOfoLcA1Snb+3iFwG20xQhvxkKEQI6DHm6NE7csSpkRvreI+nsgesNGrgXfvgcZMcEhyieprcmrs46HWp0gxw8k3o=
Received: from CH2PR12CA0012.namprd12.prod.outlook.com (2603:10b6:610:57::22)
 by CH2PR10MB4198.namprd10.prod.outlook.com (2603:10b6:610:ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:23:24 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::3a) by CH2PR12CA0012.outlook.office365.com
 (2603:10b6:610:57::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 15:23:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:23:23 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:23:22 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:23:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:23:22 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FNMB41942919;
	Fri, 8 May 2026 10:23:22 -0500
From: Nishanth Menon <nm@ti.com>
To: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Santosh Shilimkar
	<ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jing Yangyang
	<jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, kernel test robot
	<lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>, David Yang
	<davidcomponentone@gmail.com>, Jing Yangyang <cgel.zte@gmail.com>, Ran Sun
	<sunran001@208suo.com>
Subject: [PATCH] clk: keystone: sci-clk: fix application of sizeof to pointer
Date: Fri, 8 May 2026 10:23:21 -0500
Message-ID: <20260508152321.3683799-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|CH2PR10MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: d6384777-1c29-4172-1c76-08dead15be79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 04kw1yXsLEjlVFnIp9lh1SNklk2iYA+I6Cx9AHe5GCtBIev3EMIFZul/9lzG0Pq7zGIMIbEJb89EkObPlGf+2E1QJy7aaViAED0LvtGgaWPgaseJ+8g5sKhBNRwzUlVt5Ps8tI4F0ibbbgyi5eRWnPMF6Ae8OW0HKw1x7Xo0RfjyeorIGCV8wWhWOiMlwamoo3QI8gzBS+MIFCa03a32Iu4tXjohhKn4sBX3tC28xfXqt857svy/RWuWET0J5RP+4m6mqL7gXrWm3LgIb0BStLDbyhgB+8JHX/5zvU+Eh4fimovK8qR8DT9kHPlxtKvBLVlvqJ92j8jKR/x0ThZeHYc44l0lfUwC/YuS0eDgPh+WsKYCUhk30mCJsVEHPZXEdLLjIdFoEsG/+7k5GLjsgG6aBeTgHfu/mE1RIDpvnZyWgY/IAuYriSAeKWRvfxNjBjCNegSCVQj24iPnB0b8LezASBZG4PN4ShcTmeLoaQ2fSbpfVqyM9HLLCVjPu3W9Y2l1r+fUXnn3H24axRHfx8CU1ex6cyjOCKHch6L02+Fln4VhEn5l5t3pdVDbBgh497JJlkOH8p0u69b8IWmS3oCecI/nUgQCay+yGKxIaxTbAL7100bZyUYW7MQim6RUvItuuole7cAA8Lv66wKV0CteF/wlODodBoW1NQeEqLIjnjGFCaH8vXR5J9Yo9Riu
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EtLHLtX/NObJ+k/ulPdqdIz4K+fQlED7pfADh620eVF6awt4HUsqMbgutOQv5JluS+8OiDeLVucyrD9sO2/+/qRCeRBP3qPXheogMft8v6kLZwpIKlqlgRg+vRr92CwaYbHYXKvyzecMYzHESTnRw0SkJkwlrcgi4t5EF5mMxB5KMD61WJXWVi0ZXTCh2ze9OozEX4I9aET3NJv28yA6uGsUItBrPrEMNCrc3ROPeWW6wBE19a+yPiJTEYc6m5z/PBpNA2AbrCL8EEX8qkbU0SBO2Scxjqw39TC2j9D4GcJIgabcbGDPAQo7juYqFu46BRVWbAXYnbRTB9XBTMWS4J9sjCLCuRZ/Bg0ursD56z9SF0Y9z3MQRFcGfVI02WdFzksj8NWpT1PWzQajiHRjbg8hli3VQmLYuN5fhYt9ATnmE2XBDnZfQgeHcS+j1uSQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:23:23.3661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6384777-1c29-4172-1c76-08dead15be79
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_082332_347527_6E10DC12 
X-CRM114-Status: GOOD (  12.60  )
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

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Coccinelle (scripts/coccinelle/misc/noderef.cocci) reports:

  drivers/clk/keystone/sci-clk.c:391:8-14: ERROR: application of
  sizeof to pointer

provider->clocks is an array of struct sci_clk *, so bsearch()
expects the size of each element (struct sci_clk *). However,
sizeof(clk) evaluates to the size of a pointer-to-pointer.

Use sizeof(*clk) to pass the correct element size.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Closes: https://lore.kernel.org/all/84a6ba16686347099a3dab2e5161a930e792eb6e.1629198281.git.jing.yangyang@zte.com.cn/
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/all/202512040525.zrHSDl5h-lkp@intel.com/
Link: https://lore.kernel.org/linux-clk/20211012021931.176727-1-davidcomponentone@gmail.com/
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
Signed-off-by: David Yang <davidcomponentone@gmail.com>
[nm@ti.com: Improved commit message]
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Cc: Jing Yangyang <cgel.zte@gmail.com>
Cc: Ran Sun <sunran001@208suo.com>

 - Functionality: No impact (on Linux architectures), thus no Fixes/Stable tag.
 - History: This patch has long-standing history; I have attributed it to the
  earliest valid author found during a recent scrub.
 - Reports: Retained chronological attribution even where public reports (Zeal
  Robot) are unavailable.
 - Checkpatch: Acknowledging minor warning regarding tag ordering (Reported-by
  / Closes sequence); chosen to maintain link integrity for automated tools.
 - Testing: Verified on available K3 SoCs against 2026-05-07:
  https://gist.github.com/nmenon/afa9ac915e189334f048c177f16fe54f

 drivers/clk/keystone/sci-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d5071223f4c..2fc1f050779b 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -388,7 +388,7 @@ static struct clk_hw *sci_clk_get(struct of_phandle_args *clkspec, void *data)
 	key.clk_id = clkspec->args[1];
 
 	clk = bsearch(&key, provider->clocks, provider->num_clocks,
-		      sizeof(clk), _cmp_sci_clk);
+		      sizeof(*clk), _cmp_sci_clk);
 
 	if (!clk)
 		return ERR_PTR(-ENODEV);
-- 
2.47.0


