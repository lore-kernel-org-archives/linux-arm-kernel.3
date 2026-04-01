Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97067D3514C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VlF6efqO94EOn+exWK7nCLhphKh5ZtiuSGL0d03ELm0=; b=itZLhTBOJEmt1Zm/4sZXcTUbSe
	Ywh+3beawUd6ptBXhgRBj547Y/taKzGTeVq3ZL2E3kJsBQ//Mccb3s67o1FqzyqonDh5G1TuQZ8uQ
	vm5sZUCYgssGljQDU6FWdvAKJ+B6s/q1P/JDbhcVh4f0CxuSnoP9jLnh9wDhHKR/ZakASU3BygBdB
	g8/PeN+3DjRKtt2Qe8IyP1XemXFYxhW0YK/o0sOHXk1Rx5SDGAWIbMHmDuP34Njp3SrPGGOLjTpAo
	Tn1Q6Qtc4Ykt8hrfkdwGvroogIHUDVkiBD1cMrUnqSghFntLeO1trwaguQ9BfdaH0Q2bAfbcoucyE
	9YPvHeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7q2K-0000000EDlZ-2z7V;
	Wed, 01 Apr 2026 07:30:48 +0000
Received: from mail-southcentralusazon11012013.outbound.protection.outlook.com ([40.93.195.13] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7q2F-0000000EDkh-11Ly
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClDq4NOSVMFP6D/LrzJ/vygwk7HwXPZ7scD+HUxbpPsqoDZ7JbiF5R/TyuP0t/dgzE3OacdUFJ7ybYOZcAqxoQtFq2SutvawKH6qol4XmjHuIbx5vLl7AzZkQcMnptzg2GwFXUzscaLLUB0Ea2LLV/YN8N1SFHTz4ojdTU6i+EBzZXoTq2A81VE9O57FyBP/kUwl2tU8Ly2vuqHvg0UBVmlDnuaWaoiuv1rHDSFOY/FGE4Sfd6mrwf4uNGzzXf2Z17D3YlIrNADwQ0IdKaJIISJNb0xPEjc16VQEf0IIutw8acvNIZJrxF3Pm++2iW2kbFbxcvaa6j/Wt7PqxFJtgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlF6efqO94EOn+exWK7nCLhphKh5ZtiuSGL0d03ELm0=;
 b=r33uQsxtYJ1xDEgDZEQcTlsd5crraLhb00u15YskMR3jimbQg0anJpI2Q2h6FhgJLP4OFpXKQ2OLun7/KwKPBSF5YnW5exe80b5/oADcRC4QOm3xvhaICiZhOgn/G8Fz7E53NdLeNr4B6gjRUJHwr8SXLZXNN55XGOdr2hg3+g2pTicUaTszVsAvUjBlCgZGK5EGmVH+v2nnPaUoYUAfqfDrsKnj8Tgp9iQIEykj7bTaLUk7F6Wg/g8xFWAd0ZO6PP5D88lnW2PjFVJZEBzO2Q59yDjEsdiRtiswH46+5rZAgxWcDW2boqwIlymv/167aPOyVkAoBLKxD1vO8NHq1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlF6efqO94EOn+exWK7nCLhphKh5ZtiuSGL0d03ELm0=;
 b=tfbMmd0zSunwWJdP0WdGyYF/U7a29NlxxY+09cOs/5z92VcdpHz1pfJU2+Uer0XeZiMbr9GM+HeSEU7pC3DYfYnLzu/NLuCBiDbIZqN16QX1b4x9AZ+a27jRM6XGF/kNuwknBQLjHeCIq6bNiTqH/S0kbBfUoWfq5S0rnG2QtRs=
Received: from BYAPR03CA0030.namprd03.prod.outlook.com (2603:10b6:a02:a8::43)
 by DM3PR10MB7969.namprd10.prod.outlook.com (2603:10b6:0:45::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 07:30:38 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::9b) by BYAPR03CA0030.outlook.office365.com
 (2603:10b6:a02:a8::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 07:30:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 07:30:37 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 02:30:28 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 02:30:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 02:30:28 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [172.24.231.225])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6317UN3P3832504;
	Wed, 1 Apr 2026 02:30:24 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mani@kernel.org>, <kwilczynski@kernel.org>, <bhelgaas@google.com>,
	<corbet@lwn.net>, <kishon@kernel.org>, <skhan@linuxfoundation.org>,
	<lukas@wunner.de>, <cassel@kernel.org>, <alistair@alistair23.me>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>, <a-garg7@ti.com>
Subject: [PATCH v2 0/4] PCI: Add DOE support for endpoint
Date: Wed, 1 Apr 2026 13:00:18 +0530
Message-ID: <20260401073022.215805-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|DM3PR10MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: e9afb874-e26a-44c4-317f-08de8fc091a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|7416014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: m4Fj1ssFLzs7t0t9oPzZLv+OCD3ydz/YVizA01zjzSfRCNCWmjNV+q+X3DeC6ZoGTLkJ29rWX3fcwq8WFh1mtZGEKxusT+U14hmS9ac1nwDCxmcf5E2uiqXq47ZLD3MI4sfIXhPFtthWc1VykZdlq99+XeDPrWB+0bI1jyNbO9yQ0JqhZJxn2MlULvUA/zLAMXe6LWyTTg9BHZR8kSzUc1/X6yME0aRQlY5KkJ2TaH6FZ9dpUxKJdlccP5R715+wTY5Cs/h/htryAorZE3rM1VyTo7Ly9aLwMLwSPty7wT6A0A8ygx5LkbO1zD5Mvmfn20oL94cELs+vn11fiA8Fii2VS9OOYzO2b5X2rK7IqcTQ15jkv9rKXlctYbM+pjMGmAWilzsxpNSvNYgxPHNaUI0dvQqXE3nCxkYUY6HeFlkwbJso5qyNlWUQVt8Ajqw8YdeF0YGk/yvVsn2elrUn+uN+mCL615thFgjuFgc0GkBWtB373eMKrxLnfnf9GT9yEorXWsi3hfV8nRorH2s15xD8vKodvCtMtKZhAjKe1+2WYJaJycR0FiU2w703PsDEFLLNt5oxvlIJuCJZ3GSmjILFnwPHd4szBUO6eWYyg9SejZh4ogV4ghLVSU2W7hFhdVWBLm0hJXLSbvUtdkOdbdKZxg0tVew3b1jynopfCVK2yaZ9gIGwQRm1RPkRwREPrCkvHI9ysfkPRg32rvWI2s/OawyIVMkpPEnAM8Q7anelT++J4HcTRHU0d/btBWtL98aUpLqsp+f2ghg0V6k6pEGHAp2WsGlhHzp+9TUGt249qaDH9E2lIKVwEQTr8jVk
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(7416014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +Tg+jzM+dpEDt6Tjz0eoH8ZkCuNuNOwnu2G/uPgnT0OCzV8Jg41lYf0ayZw37LkBV2twhiBjvw1Ase/8wfvTKDLVaccZlUlppj77iAqgECgRV3sD/prrD1DuicNnp361DkSFYiVCpcl4hOdDiibR6n2S57ouJJlwb4joZ5mOX3YisgZ/9uuna6Y4ExbCh9WIwvSDsRf1x0OA6Y2HSbazSemoFBRq0C2mXUaYFANewwZN+288yZV7VZ9TYhco2GUSEA+M4BNteA9NneQYtft/zfPHY902ntiSQRj9Y8iCIRYwLNZHZ+WsLGzfTeRS1kty8sA8b657nWjmZZTr7YWpLgvJsEChJNdnJSgxDn5F8yTkBJZWAKI6kEVst409NAIJ1BaYlGfLPG/Hn5mAKSi2HBam/ohp6L2kLNPLEyWqOqvOIvfmIOM0+9O/eZnbatjq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 07:30:37.2091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9afb874-e26a-44c4-317f-08de8fc091a7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_003043_373426_80F2095F 
X-CRM114-Status: GOOD (  15.57  )
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

This patch series introduces the framework for supporting the Data
Object Exchange (DOE) feature for PCIe endpoint devices. Please refer
to the documentation added in patch 4 for details on the feature and
implementation architecture.

The implementation provides a common framework for all PCIe endpoint
controllers, not specific to any particular SoC vendor.

This patch series is the non-RFC version of the RFC series at 
https://lore.kernel.org/all/20260213123603.420941-1-a-garg7@ti.com/

The changes since v1 are documented in the respective patch description.

A new patch (patch 3) have been introduced in the series. This patch
moves the burden of initializing and setting-up the DOE mailbox from
controller driver to EPC core driver, avoiding the duplication of code
across the controller drivers. This patch adds APIs to the EPC core
driver, which simply needs to be called by the controller driver during
probe/cleanup if it supports DOE capability.

Aksh Garg (4):
  PCI/DOE: Move common definitions to the header file
  PCI: endpoint: Add DOE mailbox support for endpoint functions
  PCI: endpoint: Add API for DOE initialization and setup in EPC core
  Documentation: PCI: Add documentation for DOE endpoint support

 Documentation/PCI/endpoint/index.rst          |   1 +
 .../PCI/endpoint/pci-endpoint-doe.rst         | 318 ++++++++++
 drivers/pci/doe.c                             |  11 -
 drivers/pci/endpoint/Kconfig                  |  14 +
 drivers/pci/endpoint/Makefile                 |   1 +
 drivers/pci/endpoint/pci-ep-doe.c             | 552 ++++++++++++++++++
 drivers/pci/endpoint/pci-epc-core.c           |  71 +++
 drivers/pci/pci.h                             |  47 ++
 include/linux/pci-doe.h                       |   8 +
 include/linux/pci-epc.h                       |  24 +
 10 files changed, 1036 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/PCI/endpoint/pci-endpoint-doe.rst
 create mode 100644 drivers/pci/endpoint/pci-ep-doe.c

-- 
2.34.1


