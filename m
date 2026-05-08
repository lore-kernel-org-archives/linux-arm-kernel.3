Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72372CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRvvHLFAv8WkD3F/k9Ia+f1bCEKqsQ4AkB7jp1bqlXc=; b=izHwm6Ad6HE8JAkcq8OtZ+BKVB
	yRP4C16biVH6bpg7soS8aPUvSPrT32U41LyrgnVrF+u0DB/6xUZrjab+sblO/MTGUlUO2aQavrUnw
	b0XjC0o4GrnK0lDS5462P+CQNtKOo5upZoUa26tVQiUctG/1Ey7RnjGIrY0c5DJZH5VhkWVyFRNTN
	4wZSBDksxorS5COw5LRLVlcHIKSBPNfE0ESkBsv4BOMbwC0+UpWH//sn/uVNuZWiviADIC/ZYfPEx
	3h+g69SvTN6GYxzeD0qR9D++ykVoN0r2mClxNdLOWEb55oVpCIht8z22H3NFMCUpTK2FImftLZvQf
	0Cfy1Ekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNBz-00000006qIM-0ZkY;
	Fri, 08 May 2026 15:32:43 +0000
Received: from mail-westus3azon11012016.outbound.protection.outlook.com ([40.107.209.16] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNBt-00000006qCh-1sBw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFpWZj05wP2hsHko/BnuhS9hvLp4LIF6hM3B5ZRliY3arAngQQgra+77UwqBeCdJBgC44dAS2HWDg7zDMjlhKvhrVp9iZYY9T+ifegqPieJrdMUxy3qPuhFkSJTRWuTssib2eeO3D07sVSUB5/aI2/di6ZYJWnSZEKvwDGj550reRRlHN2/G8moQf4uCLKPMUrlbqfRqYgZ/NLXJSH1cuqpend9++F1Mw94aSHEEx0q1TpRqhdzBV659kHLjK2605IhcpglAQVC/kjLdM9Uyj0TzU06t/Df2uk+ailf121f1x7fGhk2ENrs5BK0xYQsVqk4Qc3UTvcHa8eZE3f5NJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRvvHLFAv8WkD3F/k9Ia+f1bCEKqsQ4AkB7jp1bqlXc=;
 b=eOxPqfdyECgOwsOvhb5fXPJWoKa+98RzDInIJaTdh7plYkmDeFGP8tHD4SNdgAOsSdg4fEfH2LzbROtYs5mtxRJTIIz0dgFh0Oa3Tjcsr+XEgrGZPznUDxXuNl/E4rmcFCaH40uDUTet4h3XJc0CXTG+VYC5mnjN/p1gdvAcoP886Z03FMGerzuGiASX+PL+01Zr5bxW0I7xTM/UMgdVzmgLw2cRV22EGuyv0fOTIB1XFnx3aCliA276vqflYNHQdaELXoD8UvzrSTIRXk0pBiMESE8a3nDmpGLR4dlJa+qI75hRP3glw3tC4t52mIpq+PSzpMbuUoqsujy+Ng2zXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRvvHLFAv8WkD3F/k9Ia+f1bCEKqsQ4AkB7jp1bqlXc=;
 b=fGrWsuA3cf/hcOC9hEDqXdni8dlxq4StFbMAedx04WmiO3ySnd49Z/TGR7Nxk9IoedpKSgFiDbqbI0b69pfDgyBEp9GQt+9KKsL4FJbtWrSemL1PMh5b69hXyNO9QCYyIV7eCjH8Ro6eNbhHf+6mFIaRYyY8p+aKoA51d275CTU=
Received: from CY5PR20CA0028.namprd20.prod.outlook.com (2603:10b6:930:3::7) by
 IA0PR10MB7232.namprd10.prod.outlook.com (2603:10b6:208:406::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:32:31 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:930:3:cafe::da) by CY5PR20CA0028.outlook.office365.com
 (2603:10b6:930:3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:32:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:30 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:15 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWFWv1647305;
	Fri, 8 May 2026 10:32:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 11/11] soc: ti: k3-ringacc: Use str_enabled_disabled() helper
Date: Fri, 8 May 2026 10:32:11 -0500
Message-ID: <20260508153211.3688277-12-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508153211.3688277-1-nm@ti.com>
References: <20260508153211.3688277-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|IA0PR10MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: f5428267-90e2-43fa-bf2c-08dead1704de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: ZJQnDW4iuFT9FHl7PSomimx0MeCUSo+vEnp4F4F5kuJ+YrhfuFJ3f74iRN3D6A9UWm/o90a3YSqQviRMoKmKYtamoEw+LmHzeYmhKiH3dQhVSeboKr3UB+EtNm3WjO3wdDMMuBUa0kWUibKXiMJOZR9ym0ReVJXQKeDi5V14nGVUzcbR74WD0AK1JZEFWV/omfgZ/Okl/nfUkvJdY+gqzN/nGIykSH2lwnXM+s7Yry0TfI8928n8WCCEzRgSVQSEEDybAMBy6kUZ4W1/0HyCRRz7PMfuBCoTxUnzk0yp0V2PW2cmURf1VTsTZmS544VXyqCXHqFVW3h1yvY4GNSpjMj3jTUvfFDM/v0K64ZwE1fAm9IfGlTp8RccCKdvkJsauPY6sHJqNWzaiIDVj1EFqYDa0ybzaaIrE6ODsRza/dkuMK2zCHCcPrELlxYkGCjqmSPYYz9PDZWHV4bqsp9seU730T3r/8lomFtGIr1YGt2wS8mx/9nio6TdduLVg+y57LXYtElCUxgNNBzwYtlphOmh9tr8tDE95ZZBGF8SifRm7YvhdDsTmiSc6DozqaXAvxXUVxqFno9V7TybcUzO3JmHNYIOGT81C3Sh6AD18z35MuTsb4zatDe3H+UPUDBg+lq4EAy6Tz1WmQd1WXBYv+n8qT19Gzt4tRzdKKcEt1nX9mwavau+1g+GUFfc2i2eLx5ybQROD5zGCc5kPYhk0c6wdtyP6N9PzBnHACHRUp4=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bmhzCo3pcq1pkmxs4gFHajiwKAuMszU8xV9/vawDkWWexVATJSC7mlO4AdkQehcQe9+1qmCqvrOsCOqLKp8f3PwLXBzJaQtyAQSucYuadGH8tVSvDWJjJ3zgoXWROB73H+MR30ZCi/jfBdnlGsAXanLkEoAqN/G3qstusYHvECfKHhZAAqM/1aCsRiMKEl1FM/W72evLW6msJQ3K4xqLWbjek9HLWzSjg9qA5c7rr1N6oenDXEVq8au5qGgW7mA6WsZ7w5sPKCkNNKcqvQvBLc8SBK4j0g/nvKHpD7Ac0MC9l+gRs7q6jDGYberRibZbdNkaL7EBwnhMprWf8Lm6aWg9oQL/6szxxZye12GgZU9aMqqB8s/xhlDFwDGSeGnPhn4tM54TObhKX4Ui18TQ2vgsBJygLff4XtOToLxeZTwR01uDGB6eretFpGvstv4o
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:30.9836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5428267-90e2-43fa-bf2c-08dead1704de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083238_673730_C2C3334A 
X-CRM114-Status: GOOD (  10.31  )
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

Coccinelle (scripts/coccinelle/api/string_choices.cocci) flags an
opportunity to replace the open-coded ternary expression in the probe
dev_info() call:
  k3-ringacc.c:1439:3-32: opportunity for
  str_enabled_disabled(ringacc->dma_ring_reset_quirk)

Replace the ternary with str_enabled_disabled() and add the required
include for <linux/string_choices.h>.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/k3-ringacc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 7602b8a909b0..ec4207d98dca 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <linux/sys_soc.h>
 #include <linux/dma/ti-cppi5.h>
 #include <linux/soc/ti/k3-ringacc.h>
@@ -1436,7 +1437,7 @@ static int k3_ringacc_init(struct platform_device *pdev,
 		 ringacc->rm_gp_range->desc[0].num,
 		 ringacc->tisci_dev_id);
 	dev_info(dev, "dma-ring-reset-quirk: %s\n",
-		 ringacc->dma_ring_reset_quirk ? "enabled" : "disabled");
+		 str_enabled_disabled(ringacc->dma_ring_reset_quirk));
 	dev_info(dev, "RA Proxy rev. %08x, num_proxies:%u\n",
 		 readl(&ringacc->proxy_gcfg->revision), ringacc->num_proxies);
 
-- 
2.47.0


