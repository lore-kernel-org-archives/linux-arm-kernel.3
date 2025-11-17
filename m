Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05140CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GW6uehlJfXK7PDMg2gsZRJskexGCnsPY+0oWCW3VFw0=; b=Xn1z3c6eRVZmLTEIJ4YpbBqgxv
	huYSgljPulAVrDWJZhC//MCgnxsMS+wj0+rLNTAWzNItnQgq0Tdg1BRK0YTGnKkMHqT3pC+du7QE9
	wDIdwowJsJOE7GBEjyBOkX+ADOEoUlyN2vASwCWjou6OEPOthMb2quGkpPsER0ilZwoFUhBvRDNMx
	WLVrdi6JkdPdI8QBbzKrp2HFLYlImwJHQz0bXOinDXaGWiClleRO7ZI+961ow2R4Iw1WIDCPKwCgO
	4MXmIoFTJ2yKkuDxdYqNRlwIcUtIHSLSoMGpCQBRXRBnDBOEl+h9oPXr3LhwiwicNrxBTXIxKoF/+
	vUZgEx1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxTS-0000000FyfO-08G8;
	Mon, 17 Nov 2025 11:32:46 +0000
Received: from mail-westcentralusazon11010010.outbound.protection.outlook.com ([40.93.198.10] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxTN-0000000Fyec-3N5o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfozVVFTsMS2TTMKPoV5lCjez5RYoy0QHfRfyFeQO17Q3+xlKQQYbxnPvYQRrGRxMFYw6srUFEUPTbrPCvFUI5Mr3/aGo/CMtWVP0Bo8AlkjFgbACJx0gfW88I7l8uLAnQp0+9WKT+s6mqhjFP1ZYt3r6MLPPeIWsGCqQIEkcx3LU4CRxddlYEIWCunNq0F5/51tRdS+Et+eC8sVOjDYf36WF0etbr3hRYFXp6LA6li9OauPwtZgTIOmcaOQekuxd/kZ2LQlmWCY9SArsSkC6aI2d+3xzNkmLHHS3/zqI+nYWROlYR0OsXZtOtSYtFb/UB9WgLQy+mf7beFxNGZlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GW6uehlJfXK7PDMg2gsZRJskexGCnsPY+0oWCW3VFw0=;
 b=jjd6/gyQkC+Y3GMcyBdrWS91S9RzFZzjCiA7QFkrh8sTtApKBOVfr+YViBr4rSFP4DZ152JV0SaTIoMXePDnIp1VAfezta9u9+2epOzwJ0VGph5jjZ9UvujDqtQYEaXsPWu4++Mzfq1bIoRxCD5I3ehuz63nk0fcX0WuLfki6dj+HUx6rVHZ7Cr8LmlMdigRmk4CfFzNj2FQfrQY3TqpE5R4fiDDHZKintTjC+CxFEbxuhTOPXrX3OHeeYNlSh7P5ggmYta5gtTBFmVYuZd/9bf/5hXvP3B4g+d/SP5+v8s909C5dIbKzCVHZVj26pEkpkXMslq5i3HeOAKc7XTzNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GW6uehlJfXK7PDMg2gsZRJskexGCnsPY+0oWCW3VFw0=;
 b=H40CwdI5hLSL9DfZyjBLxLdinP/0zy6N1kUw3Z9EqlTWqeGsOpGt3PmVMtrd8HZH4RX+cLT7AeF5Yzlxy6Q7DvXgAK6Esn3jes9PqLlH24HQKzIZpZD3eLF+38IzVaKqjsJqHfUh2S+N5YQ31p1kUi1+722ZzipGF6xuAm25iAI=
Received: from SJ0PR03CA0090.namprd03.prod.outlook.com (2603:10b6:a03:331::35)
 by IA1PR10MB6760.namprd10.prod.outlook.com (2603:10b6:208:42c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 11:32:36 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::6f) by SJ0PR03CA0090.outlook.office365.com
 (2603:10b6:a03:331::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 11:32:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 11:32:34 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 05:32:33 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 05:32:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 05:32:33 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHBWTTg2422814;
	Mon, 17 Nov 2025 05:32:29 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vigneshr@ti.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>
CC: <arnd@arndb.de>, <kishon@kernel.org>, <stable@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH] PCI: j721e: Add config guards for Cadence Host and Endpoint library APIs
Date: Mon, 17 Nov 2025 17:02:06 +0530
Message-ID: <20251117113246.1460644-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|IA1PR10MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 51664a0f-81dd-4fd0-f03a-08de25cd00c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4QcRN9Dgln3XrkH+I1rBywsLJBJiRTb6CRaV03XtDsQSGKSNXuk82CHssw6y?=
 =?us-ascii?Q?5D186D7UTudgQQ1unOSt1sycw8wyXQR1B+wgLYWpCU0Mjez96cESEBSCVooE?=
 =?us-ascii?Q?4vb64BW0RJDz3Ws25+ozSkKuBU6OCs8u7Dhy/WVYWH8+UoBe0ZQ04NOmW3tc?=
 =?us-ascii?Q?4QWVCKaVBFaudSOzyR5oW9ycI7FKKzZdlDKM9v9+N4B3SnsueWep2QPZ5YGQ?=
 =?us-ascii?Q?iY4SQtaFs3bsBTERknYwsIJnMD6C5akAav2S0xEIkP/tQ5j/bQT4XqXmApxu?=
 =?us-ascii?Q?j/3foclRFtIVjlJzQQPf4e5AbyGm+hc7Hu/GNzdGOT+QJQpU2PDMy7OkZjpC?=
 =?us-ascii?Q?cne/NYsKK5QLBvgEDXsH2Ti+IclrU0e4F562lixYuZJPKrUtUrj+cL3hOdYW?=
 =?us-ascii?Q?42RzmYx4yF4OluNQ8I1tHI/krT8RDyPFw4biGaMdCX6KfFzk5ch6he73fd0M?=
 =?us-ascii?Q?2V7YHzJlz4EgVAZuLLLqUw5V9M1x+yVQw1bKSHu9wPm/HOFRmh4ZfmqyWyuk?=
 =?us-ascii?Q?7czOW6ThW+ez8pKgFwCQkAU6egn3LMeTLjACBhHyqGCIFd3Qa6rBw1xC4Zxj?=
 =?us-ascii?Q?+DXHGF5Cg7ZIKPSorFvpFI/BX5HWqEI7JdjhJAtMQg5UcpPlZZaEY81afHlY?=
 =?us-ascii?Q?Ypq2bZYGJNYg8cT7qE6G85huGp+lBpNuCvI2kd86v6CbUCc/GC8RsHMjelJ2?=
 =?us-ascii?Q?iGHR6S5FJOkKa0n6py9iXrHFiIH7Dyt5U0XsdiW55SdkBb9RZ09mXuCAQlCY?=
 =?us-ascii?Q?UlmZzBGPW1bg5W89tF2TNRzdCrmuK7UPOIdxk9HYQfBzM9G6/6Mkxj3BugBt?=
 =?us-ascii?Q?8GKjeOcgiLvLpUgvAjr8PMnFuiSI34JZB2u6EKlixPmYmHfPRNZ3eSTh5SAC?=
 =?us-ascii?Q?4S8cmedlCSo+DdS8J0ZTApBAmB4qhvt2gqWqajG5VQR97EYWwdVHTkx6BdoF?=
 =?us-ascii?Q?MNArQgOFDXk1J55cj2zlghBgE3yCXE9qrH4NWSfQxb9sAFEYDzJWEg/TPBuL?=
 =?us-ascii?Q?N1zedpRDPYJTtU7gRB3Yr4mdYtG3OGk1u/7HgjcXrJhLteiYrIR5P+E+83cP?=
 =?us-ascii?Q?4ykLGOyXlNZt1eEmlL0i0BMKr3qN01Sa+lDZsLvQ4ZGCq+0kgE6phLo66FB/?=
 =?us-ascii?Q?gjGWxXflOUct1XrVYgYyiXgeNsksO6+OIQA3nLYFXcWNOK7ZPMYw1SzIsh+/?=
 =?us-ascii?Q?U1EfblPrF2CjdA6d9gQ0FZiE8EGzRvU4xWYtkVEOGIZ4c9lyUj2Hu54z1JBu?=
 =?us-ascii?Q?pb80QslJbAH3hNF6FT1cPJ0b11Z+uy34RcdaXKB7pfeDGCA7qc4u3IpKLXgE?=
 =?us-ascii?Q?jFVF33wnIfizwtGB9Bk0/0zg3l/xWBhwzMcoue+s4Os5XUeBETFwiiZ8RWW9?=
 =?us-ascii?Q?sgyrydVRQc+DQ0CwrC6nx0iqnPo03gbgdVmo9uPQRoqRYKY7GpFL5NeSZoms?=
 =?us-ascii?Q?FbaRs7aqmxO9DOrXbwcuwNjpVH+CApYjHaz+WFu+OooJ68a4NhTUnPkmHtDk?=
 =?us-ascii?Q?jP9qnMvqH7Y4g4EHhddvQfAmJrarNRJV3YP6fbuvZosp57+D2v38H7kacl//?=
 =?us-ascii?Q?hJqfflQyMusC1BlSBps=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 11:32:34.3479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51664a0f-81dd-4fd0-f03a-08de25cd00c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_033241_924088_5D0360A5 
X-CRM114-Status: GOOD (  18.99  )
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

Commit under Fixes enabled loadable module support for the driver under
the assumption that it shall be the sole user of the Cadence Host and
Endpoint library APIs. This assumption guarantees that we won't end up
in a case where the driver is built-in and the library support is built
as a loadable module.

With the introduction of [1], this assumption is no longer valid. The
SG2042 driver could be built as a loadable module, implying that the
Cadence Host library is also selected as a loadable module. However, the
pci-j721e.c driver could be built-in as indicated by CONFIG_PCI_J721E=y
due to which the Cadence Endpoint library is built-in. Despite the
library drivers being built as specified by their respective consumers,
since the 'pci-j721e.c' driver has references to the Cadence Host
library APIs as well, we run into a build error as reported at [0].

Fix this by adding config guards as a temporary workaround. The proper
fix is to split the 'pci-j721e.c' driver into independent Host and
Endpoint drivers as aligned at [2].

Fixes: a2790bf81f0f ("PCI: j721e: Add support to build as a loadable module")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511111705.MZ7ls8Hm-lkp@intel.com/
Cc: <stable@vger.kernel.org>
[0]: https://lore.kernel.org/r/202511111705.MZ7ls8Hm-lkp@intel.com/
[1]: commit 1c72774df028 ("PCI: sg2042: Add Sophgo SG2042 PCIe driver")
[2]: https://lore.kernel.org/r/37f6f8ce-12b2-44ee-a94c-f21b29c98821@app.fastmail.com/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 43 +++++++++++++---------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 5bc5ab20aa6d..67c5e02afccf 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -628,10 +628,12 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 			gpiod_set_value_cansleep(gpiod, 1);
 		}
 
-		ret = cdns_pcie_host_setup(rc);
-		if (ret < 0) {
-			clk_disable_unprepare(pcie->refclk);
-			goto err_pcie_setup;
+		if (IS_ENABLED(CONFIG_PCI_J721E_HOST)) {
+			ret = cdns_pcie_host_setup(rc);
+			if (ret < 0) {
+				clk_disable_unprepare(pcie->refclk);
+				goto err_pcie_setup;
+			}
 		}
 
 		break;
@@ -642,9 +644,11 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 			goto err_get_sync;
 		}
 
-		ret = cdns_pcie_ep_setup(ep);
-		if (ret < 0)
-			goto err_pcie_setup;
+		if (IS_ENABLED(CONFIG_PCI_J721E_EP)) {
+			ret = cdns_pcie_ep_setup(ep);
+			if (ret < 0)
+				goto err_pcie_setup;
+		}
 
 		break;
 	}
@@ -669,10 +673,11 @@ static void j721e_pcie_remove(struct platform_device *pdev)
 	struct cdns_pcie_ep *ep;
 	struct cdns_pcie_rc *rc;
 
-	if (pcie->mode == PCI_MODE_RC) {
+	if (IS_ENABLED(CONFIG_PCI_J721E_HOST) &&
+	    pcie->mode == PCI_MODE_RC) {
 		rc = container_of(cdns_pcie, struct cdns_pcie_rc, pcie);
 		cdns_pcie_host_disable(rc);
-	} else {
+	} else if (IS_ENABLED(CONFIG_PCI_J721E_EP)) {
 		ep = container_of(cdns_pcie, struct cdns_pcie_ep, pcie);
 		cdns_pcie_ep_disable(ep);
 	}
@@ -739,10 +744,12 @@ static int j721e_pcie_resume_noirq(struct device *dev)
 			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
 		}
 
-		ret = cdns_pcie_host_link_setup(rc);
-		if (ret < 0) {
-			clk_disable_unprepare(pcie->refclk);
-			return ret;
+		if (IS_ENABLED(CONFIG_PCI_J721E_HOST)) {
+			ret = cdns_pcie_host_link_setup(rc);
+			if (ret < 0) {
+				clk_disable_unprepare(pcie->refclk);
+				return ret;
+			}
 		}
 
 		/*
@@ -752,10 +759,12 @@ static int j721e_pcie_resume_noirq(struct device *dev)
 		for (enum cdns_pcie_rp_bar bar = RP_BAR0; bar <= RP_NO_BAR; bar++)
 			rc->avail_ib_bar[bar] = true;
 
-		ret = cdns_pcie_host_init(rc);
-		if (ret) {
-			clk_disable_unprepare(pcie->refclk);
-			return ret;
+		if (IS_ENABLED(CONFIG_PCI_J721E_HOST)) {
+			ret = cdns_pcie_host_init(rc);
+			if (ret) {
+				clk_disable_unprepare(pcie->refclk);
+				return ret;
+			}
 		}
 	}
 
-- 
2.51.1


