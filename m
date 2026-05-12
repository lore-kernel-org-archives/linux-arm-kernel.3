Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57394CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPg6qH4/S3jLwlwSseoHr7Ert6I777rtwCJZ38+hbj4=; b=M+CJqGU5Cpb+YzJuWl7KuN3VMi
	JD5lCjW849pX0AsVpzz7J09HotePVM2MHUIw/zSValrI/dWOcy4CWm4ZJaeCl/r4enlov7kPJURrM
	KmKj0penQzZoX2FRbTBpCo4wPtQbgFFPpM6IzMpFZOi70+wfcuzpR9ickhOSqflVDTKMVjRQI29dT
	do66Z6pvhwtYn4ZL8eQrEvdoVQJv/mzfO5nIsPIzfNfvWebOZSKUmO0S9c2vLET74RizN9J3ZBPyy
	l61NCfPY/sePqoCN3cZeWNcgFH8627Z2kZGmfGJR3hs/gI07/d3KG6f4/VlmR/fEITdpbAnyGzR4z
	b78TG9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZB-0000000HU2c-0zNs;
	Tue, 12 May 2026 17:06:45 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZ7-0000000HTyG-2YaX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:06:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0VWhyvsm7xBjXP8SmlNf0sK6simpmbniBWjd1L+XYoB+GaupkquViT6xYfIqGvbVHMz6CNNl4AI7lQBfzJJMowDD8UTx9T4F/cgym2WNYncEod8S5P3lhA7WpEIViW4pkJD1OHVidaggrfBPPOMMRPAVjBXL5bYJcjC4/mlkpixKFx85nPzC4cO35oY2f1xNrVN5e6bk5HvMU4qKrNMctLsqedfZ0DuRzTmQvHp70Q0b6/ctnbhTkurPPXyUJvwL6QheLaL9dd+fEYe51aGD6kH72aDBM9FrLop4am99LbvsnmdEc+p4kFQbgGQ9iy+kckBs+ovAHBMzWHdQmwZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPg6qH4/S3jLwlwSseoHr7Ert6I777rtwCJZ38+hbj4=;
 b=RMAKGD1W7Gb6wIjiLQyd2nyiHhq1CCoL1zPd8WLUrN7z5wqNAr/iVtiSrz4zfkml9C4G5cLiEJhCOkIyHEHp9eOdcdUS18+QA9EVwoTv2QOLFV5K7MlkRaa6sYXppzYZ89BMZDYnT/j+Lgrp8QtdqG9k9VRPv2jSRUje26kG+uxmzcKxfkHbeX0F4/Bx+YV6GCiJW2lN2fdIEhupfygnuo/Yr3hzBl+rruqXWtTAfLLf6T7C0hkvc7cEbV0cgFzTysfskySW1UmzZUFleQfPiy5LTWmgpUaM1K7Ap9jGQb1OGSDLQan4bE5r1jTyE2CGk5JE5ruQBFl4Yv3FZZOnzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPg6qH4/S3jLwlwSseoHr7Ert6I777rtwCJZ38+hbj4=;
 b=KVZnO0OxxwoGvfgGUH/P+RN//NXKZ/bVvoPFhMXep6CLL6TrKKBuQdISAjKI4XLbL3mxAwVztRLmTH4tusYLvDZL5RqSKuCQB9gT5etRrVPncmHDbFZwF6w/VnbLDVHguduj/biL3VWvPz7ahfu6UG5Fh52KHX+MAahbonZ3h4U=
Received: from DM6PR11CA0007.namprd11.prod.outlook.com (2603:10b6:5:190::20)
 by BLAPR10MB4962.namprd10.prod.outlook.com (2603:10b6:208:327::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 17:06:36 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::f4) by DM6PR11CA0007.outlook.office365.com
 (2603:10b6:5:190::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 17:06:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:06:35 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:26 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6QYK2235153;
	Tue, 12 May 2026 12:06:26 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 11/11] soc: ti: k3-ringacc: Use str_enabled_disabled() helper
Date: Tue, 12 May 2026 12:06:23 -0500
Message-ID: <20260512170623.3174416-12-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
References: <20260512170623.3174416-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|BLAPR10MB4962:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ec5c37-281b-4e04-4baa-08deb048d2b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: A6CfGTaoJZpcRLZoVYqrL0DnlH69t6Ty4PC/hf6aqq4KU0r05JADDHeBnY9Mm2icLYKyPOfhM9xMRSHqYKhnBswT57ghk9jBglR9PSX9fEC0W1tVIhyN/lOhdrobZ9dXK++fCoNvA4SQLqUWpKu4SWaE91IT1dRzN2UZzJrIgZDGSSPOAZrDp/cPPXKplhd/yenOcGJX6q68Gh40TVyHHEHL7S1BuqZrQclrelzuPJa7iUESMgKqNAtri/bZ7c+d7LMOYljatRAdkOiheDBrhhIpn570NscDFzVNE9MYeFuL7bjERmJB0AM2gNqsD+ngexXOtojvtaXkTQQdW7fs87rfssUC4KjvDVxlh6SBsS0hYEtvHqUl8o7C+roLcYbHHC8gyM14EdCqoy0SsKtBAQGPXDTA5d3kQtnCM7lKMYf93XwpN/122gJr0ubEFVQPqT4ltjg7hftObWhVm/FI/gwWBm/Vr0/BhKOedNhqbCDIxsO5WrjZqbK5q5NidC2wyeGRSpyhGwjkyN5l5B0x1T1wjiULBK7SQsAQW/OuTRGjgXKZ7wEFKKgXzQhLdQUQ1EiEChrxVGdXmD1va8EzcwdWw3QS2sgEcvxT9m885/Lrtdm0GEC2Reb6nPWLa7dOrTZoNcpl662Jjqsca09X9IbiRq6gMMhpwxnWOcpPnwuc6CL7QzHhvEi1JcMShJrxUyYJd97OEmOHbtgsWnVOM3DatAaqSJYPu8845sNxWvU=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8QFMzHDbl4RV6VWHENS+xrz4VkqRhODDz+1NPPTQVAe1PEO1AaImKzGeCEPgS96hjdJV1IwR5JEjg9iSHy3A2Cm2MfgOxtC6KS6+fBrhPSN8HqLK76m7YnUXgHH7694dc3BcQBtXrgU4o4fT25C/qygmf4lSimSR8Dvfin2QMBItLgupxqVCyeXHScUdeQjqWu9FDxPZgHozdOBpAboaMGtoe4F4k1jrT1KBru8C3OUpmyEsoXfHb3cJAiT5tPC0ldbJL83FAcTcBRaFKpoU5NhB/FnkrZ1wzVN7evF9wXipB0M06HvjRIl8JzvE4xitGBGYv03M0WHrs8gRC2oqOaOlmsITvXQFgdq1lnd6NqMcWivTGJpfdLURz1B+XEnVyF8avw3K2LVlNaT1kiImL56k4QcZ7ZwZE7XpFes7bAxZgfGUJa8Q3WRQZ5C1B6ie
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:35.1075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ec5c37-281b-4e04-4baa-08deb048d2b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4962
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100641_659956_FDFB85CB 
X-CRM114-Status: GOOD (  10.24  )
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
Changes since V1:
- None.

V1: https://lore.kernel.org/all/20260508153211.3688277-12-nm@ti.com/

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


