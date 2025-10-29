Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F5FCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FySFmbwoC4NvRz8AKlKQCcwcSNZbL+Kmkb0n90DF7Ds=; b=FSsMx3EHLw3u7AGEPIzKJb3y2B
	G/WtH7mq2X7WIkDEBc2sEfWarVxv/gxGKRasp1UM/ukLUYEi5LslwGcohgXeqQ0E35Ogw9mpRHWFK
	FqaiG2k8lLUU5ZsYItvx02cunQ7Lttnikozx7K4km46zWGnWNtdbFq5Yx2V1+3gbPu1LhX1DHSneB
	8RhInLKEzIOnZRe+1zLoJQHyja8hJgDtecfPFfzolfT2XtYwH8FFgf6/ICueFcjm8gK+diLo1J61F
	7FQJqyRN+1iHGZ7QDh33xL0kBdsOToB8pqRxqcQKEbFFXzQ3pixF0vKCZ4YJY4OVTlEy/6XU4m9K0
	SwN7UDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1C9-00000000CX5-0yWy;
	Wed, 29 Oct 2025 08:06:13 +0000
Received: from mail-westus3azhn15012023.outbound.protection.outlook.com ([52.102.149.23] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1C3-00000000CTG-05yW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 08:06:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+3cLxhwSL5Lun2JLQN7srQ1r+4nbBt720cGbdJs/E4PcJdmcra0dKLhZRNLNVjIt6MPss4cqZS/CmPEz6OpN4SzOid0ZcNeW26H0z/fGvMyxNUaJXa0vZbTBOJmA767o+9nzNkp/pNk16dJwvV9vajXaO6qwo+kn2uqki1NQQhORKI+Fu+xMfrN16soeMFR4PoZVVoCb9RLqc82hzWJqhDsbnWN09AqYaAEazxhyDkVvJhYSYqJIZ9VR+vCa/uU+WkB9DEz86uyjFFUqG++URMrVsBGkoLZ1CVYlukGEG8ECVFhdfHn6+D4B3lFgvDeHzTRfBIDaOjy+H8yL6hDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FySFmbwoC4NvRz8AKlKQCcwcSNZbL+Kmkb0n90DF7Ds=;
 b=ixvJE8nSAihpXvP5rUJ5/FGG09Fx8BTHX021pLgU0exo3iz+SNsfCBF6DSJXl9p9vOmhh0v8KNH4FayZDlA1Gnx0I5G1bh1v0IfMJGVlyv2WJFdJbCEP6NArbXLXlkzzvBIrIGT2XaOoN5/zSphHrDyuRCQvzRFiBNW0kGp6zkpA//WBGCLyKBJ8AJjldn4kzMH+suT9xBUruN1evpfR5Vo96KzdHzxqLxzN40xlXnOOh4RBgdYdztRT9PYax44ctrJxWd2ryUdtLBwUV/bBoTRdeaMVHaie2diAX/Q/g6PzDPfeZx8YFHDhvbN7jQmDlIBhb/1YYq5ktW573bRTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FySFmbwoC4NvRz8AKlKQCcwcSNZbL+Kmkb0n90DF7Ds=;
 b=pm2stAdRMzdnt7fAiqRnQvmkzucxDR2njaUFnhpkq2y2Ds1bc9tXMPQMxaL4/UTBJRosM0za5sA7GActXpnrbKXykuZ/T+uCk5Z9VmSws/CPJJGeIQWMxvjM0bMBVP4BZnOphdYdgaPL2z026yvMhf/xHzeeN/dNx9uqCGNht04=
Received: from SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33)
 by PH0PR10MB4710.namprd10.prod.outlook.com (2603:10b6:510:3e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Wed, 29 Oct
 2025 08:06:04 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::17) by SJ0PR13CA0088.outlook.office365.com
 (2603:10b6:a03:2c4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Wed,
 29 Oct 2025 08:06:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 08:06:02 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 03:05:55 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 03:05:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 03:05:54 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T85aXg3704660;
	Wed, 29 Oct 2025 03:05:49 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
	<christian.bruel@foss.st.com>, <krishna.chundru@oss.qualcomm.com>,
	<qiang.yu@oss.qualcomm.com>, <shradha.t@samsung.com>,
	<thippeswamy.havalige@amd.com>, <inochiama@gmail.com>, <fan.ni@samsung.com>,
	<cassel@kernel.org>, <kishon@kernel.org>, <18255117159@163.com>,
	<rongqianfeng@vivo.com>, <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v5 2/4] PCI: dwc: Export dw_pcie_allocate_domains() and dw_pcie_ep_raise_msix_irq()
Date: Wed, 29 Oct 2025 13:34:50 +0530
Message-ID: <20251029080547.1253757-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029080547.1253757-1-s-vadapalli@ti.com>
References: <20251029080547.1253757-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|PH0PR10MB4710:EE_
X-MS-Office365-Filtering-Correlation-Id: 2afb029d-036f-41fa-22b0-08de16c200e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|34020700016|1800799024|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rulv/Pv6/1aRHYO7Bu4Yl6D8IxgZW+39VXRSWyzImPM0mLV98qkjuSKSQ4l6?=
 =?us-ascii?Q?TF1LFfx1KXZeoVA4UMCUomPEmniqqiwnnFcKz8CQNsQbzo3ccMJuKrH0CjnW?=
 =?us-ascii?Q?wgprdFRE0VAVSJ22z8JlSJ/dIo5pVQc6lEQVHd00CnpU+uVli1JNtqL9KWJi?=
 =?us-ascii?Q?X55+olTk92MVDbVAaxM4sdSbiCG9tjJt3eAvCued8hgy/gAcGVhK21xEz4dv?=
 =?us-ascii?Q?b7rt5x0hjEk/t5sfanNpeHbORzxeWkEHPnIy5HSkjF23OGgvYcu48hfjvRCf?=
 =?us-ascii?Q?yAOtT2VM+QGw1zD3JJLW3RuQJl1sc39IqlXiB1l9AJFxg2lFyXGAzNU9jfWg?=
 =?us-ascii?Q?v52OldiCFvxCmxgbX031upwBr7QmfNzsMkIHVDGAVAbssh9ryQtROlnkPCKp?=
 =?us-ascii?Q?OcqMnfwYxOOmLmw9K3ZqS6Ij9N9hhIlajUyIhXVyzsw3iKqli7aRl0GpdKJi?=
 =?us-ascii?Q?UyCcrLr9o2pYHhalcKwTKC40tkWUL1WbIOy+38kB6FuC6vxPo8iCb1U6kee9?=
 =?us-ascii?Q?qYgAKopN78k3CYkjM4d0kuh/WRuOrli5Bdiai6hM06mP74HcUamIAlG232wO?=
 =?us-ascii?Q?4xRBS93PcJT1VWZ/xFxlo4bGOj5UIGFSqL7DQA/c7lZ9YmDwcDf/9owYDgRW?=
 =?us-ascii?Q?rtjJVWBQBReDqXvZmaXzEHdElPnzwZL0HvisfqCB4ZP+7Fu+56hUEHtPGUP8?=
 =?us-ascii?Q?pSKXtFI284R4qHiP1FbJzcYYli9fUGQBVyu3r6ZGNk2Tka7w8u5P6Yf0O3AN?=
 =?us-ascii?Q?6bp+XECd6dl/uNyGAruxLXBBMP9NGxhbluAANn01f+Cy5Eynq0lVMFXEJ2SS?=
 =?us-ascii?Q?/pwaxVDM1mFObzMjZUy1L1hnhXtShEGjhiINi/zuTqsuEj5vgdRaNe64BptK?=
 =?us-ascii?Q?fVsW7/Ze8YbS+hzolgEmVkA5pqfu7ymtHrt5mf/FESy0emZIv/Muaz+Ao/HW?=
 =?us-ascii?Q?EkDpRC0ZeKTnPJHtkai56f1wSoOZYpAIpYcnwr2Es9PmHopnFlc8N+qm+BkC?=
 =?us-ascii?Q?fySN3EfTguroeZq0F1I6ZuTcUKnp4uh/+2BOdcFD95o0hDpj2H5GEM2brmCq?=
 =?us-ascii?Q?ggUR6BWTBKt2M/TcEwYrMMckFZ5I0F1P0PD3rNJQ+C9UNDBfcKhnMbS7q5Co?=
 =?us-ascii?Q?EBBbenBVuA3br/QYETr/m68xh6bwVr4j4r3+KSIN57MCDK8sg50QEaXNuOdo?=
 =?us-ascii?Q?naZH4bxR+621VZ985Jqw5Uq/sNJoMVeWdzsFe3enW6Qdi7UNThiTOZAVDBZn?=
 =?us-ascii?Q?qdZwCnl7n97pntrDxJuNp86Ai/pEYun+ftpslEVWWWJrEkE/7/ggWimnA8Mm?=
 =?us-ascii?Q?XEygMwep97pqxT+2sQg8Sww5KkVOJW0w1rr1cK2E7DCG0pUjk41jhmZVh37U?=
 =?us-ascii?Q?WJ5ss1lUpb7bTgd0358H8nGvwgsep084UAjErMYgHI542tceInVvskptYDmN?=
 =?us-ascii?Q?i2FIf+cALc5SZ4ijStijtwseKUeDPSSkjumJBP//819RAieGUADE2rNkIXip?=
 =?us-ascii?Q?W+VV3s5daOd/BhRnc2gWjp66sQ8pxNQSfCE8?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(34020700016)(1800799024)(921020)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:06:02.6518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afb029d-036f-41fa-22b0-08de16c200e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4710
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_010607_062383_EFDAD5A3 
X-CRM114-Status: UNSURE (   9.69  )
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

The pci-keystone.c driver uses the functions 'dw_pcie_allocate_domains()'
and 'dw_pcie_ep_raise_msix_irq()'. In preparation for enabling the
pci-keystone.c driver to be built as a loadable module, export them.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v4:
https://lore.kernel.org/r/20251022095724.997218-3-s-vadapalli@ti.com/
No Changes since v4.

Regards,
Siddharth.

 drivers/pci/controller/dwc/pcie-designware-ep.c   | 1 +
 drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 7f2112c2fb21..19571ac2b961 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -797,6 +797,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_msix_irq);
 
 /**
  * dw_pcie_ep_cleanup - Cleanup DWC EP resources after fundamental reset
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index e92513c5bda5..39fda91db27b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -233,6 +233,7 @@ int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dw_pcie_allocate_domains);
 
 void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 {
-- 
2.51.0


