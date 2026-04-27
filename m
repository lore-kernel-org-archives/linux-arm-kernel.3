Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723D1FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 05:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=as+edK73VsLXgIETJ3PSym/WBTb2D4OlzPfwwfBcAOM=; b=gXbP8NxKpprHJYHfr0hVqpbFU6
	q1E5731XK/XxZ00uoiaijL9ydx4FF/q3HB+eUwYD1DPU+CNPzH6bJufJmiZgN93vFTv2KIGEX2VP3
	NctaWfsiUKJaKGZxx0HnewEXKuynW+rV4Y8dEmMtAy7BW/J/n8doKP1bGdFizvpVlGoDhZK46Sx1G
	9F6QKYPI5KeK/gbiEfALNPLgnURU+TJfuV9G8S0LS0z2SeEOmxXhJhN/aHB88ijt/IjaqPWd/Zctv
	zV5UvdlxmzSqxPNlEu3TPnXfk2VExif4nnbZqpqH2aPb8y9+8rV1P/ejQjH135U0h/LTyW1b9bb1E
	Pp7BknkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHELs-0000000GARh-0PFZ;
	Mon, 27 Apr 2026 05:17:48 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHELp-0000000GAQy-1HKy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 05:17:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJTnrtEmC9mGKLwkqDQuJyIQu32xkzgTGRt9PbAfCwjJCQrh99W2TixkrqCBu4LiaKdR9tpZgDEc9FesCogFPJuDArfPBwR6HIc8HWRpb3gdQgiBeJ0d+VhWDJXFm6buBDRtv2CdSu/e1FeR5j8LkGPWit2G41P3koWEqo4OM3xPAJxDu2cN6KtgD6NK+wyrNYhDFi51KI+xx9RMY+j0H8jMDjkPKIs9T/ccHGpNeVj8/R8cJ2Y8CO3tnDT/FzILHbIkTRuA1qLVcvRqbzsBilNDG5SftrWmJY25v8ez672Uk7Mq74S2wU3WL66ijrcsT04eBX2288+46jXgs8GLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=as+edK73VsLXgIETJ3PSym/WBTb2D4OlzPfwwfBcAOM=;
 b=H4n1pmPOv1Ymi9qIVjSlEhuLz/R/Cy6sl5CB14LunKLBdcgiX/9EKO4cQGH9ID4Dj6fA8ZgRF/p7Ta5160dVViMkuQ6TsD2SI7k4hQ7TWeY5D6LSK6WRUe5mdP2drY5XWpgwRE2rp58I8OlRHYq6ljwhnJXX9H/KHZVkun+X/mpkjgpOcTjgBGRuWTAID5uK5xpwhTLJnz7hssJ6YEZ61m0mWGcgNSLAuEaNcHnU5+j2TI3eR72CXOjcnbTzLvbf/Ot2HTYTK7A2GCT8L9Qe+N7JFGgzXzwgoAef76nAdGN2o4ZpQ6w9QHI9whGTNI/GXgDhtBG6mpMXYha/oEo6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=as+edK73VsLXgIETJ3PSym/WBTb2D4OlzPfwwfBcAOM=;
 b=O4mOn3NCBn6Wd6Y8f5RQdgPo5C0QhM6FEsYj2wAexCQPxl+21GL32Hb/ixKqWUv+E7YpBca7OgXQ/LKCAJkdH1Kl9IcMtLgeKmGsudGYQaF8AWp+dupF0Bz8FKXLvLDssoJeI8+OaDtuUypw7sqodZDbMJQgOaLdu4xjxmE9Ecw=
Received: from CY5PR22CA0084.namprd22.prod.outlook.com (2603:10b6:930:80::28)
 by CH2PR10MB4312.namprd10.prod.outlook.com (2603:10b6:610:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Mon, 27 Apr
 2026 05:17:39 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:930:80:cafe::1b) by CY5PR22CA0084.outlook.office365.com
 (2603:10b6:930:80::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 05:17:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 05:17:37 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 00:17:32 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 00:17:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Apr 2026 00:17:31 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63R5HQUn2543740;
	Mon, 27 Apr 2026 00:17:26 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mani@kernel.org>, <kwilczynski@kernel.org>, <bhelgaas@google.com>,
	<corbet@lwn.net>, <kishon@kernel.org>, <skhan@linuxfoundation.org>,
	<lukas@wunner.de>, <cassel@kernel.org>, <alistair@alistair23.me>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>, <a-garg7@ti.com>
Subject: [PATCH v3 0/4] PCI: Add DOE support for endpoint
Date: Mon, 27 Apr 2026 10:47:21 +0530
Message-ID: <20260427051725.223704-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|CH2PR10MB4312:EE_
X-MS-Office365-Filtering-Correlation-Id: 63194f2b-44fb-4f8f-41fd-08dea41c4c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: vgPi8CAxO6XVQ9fVEBdmVUQv1Ic+N+RpxkFvQbnqDzfkZORa1sNAs2cT8hQL+wMWwYMXTksi0HNswmnzHTu6j+XmWnECTi1ebdWHwEv2Ok72rHSUBfxkRJgnvm/o81ZUQd4CSeVdZPru2ZeU+VxQ1pq12iCphOsJbjENSisw5Yo3xIM9D7CoewSmzIG8FknKA+yv7PAQbzTs/KjE/3ml5l/jEkswH+rwhdtTJnSGv0GcPoE1xN9magfO9VM2U5WMQuWIBgYC4ys7r+DGnWYZ8a6hE8aHPXUOqg2Uu6FGpsMJHaLv0K1xTSEs1J7v/EPHmaxR9PSpcX+QRCmOdGSdO1ilEziHabEYNUVBDj2NzO7QeZA1pCwL0eJC9ptZkyYHGbKXCHTngLnSzFm9D6Nj0WB/n54LHp51limNxD6Bzns9ifwR5BrjLGCclrosydLOzYfq9CQ59AkxJ5Hg9ozMkkvrWaXBIDaENRa0DQ8ApsTMkI/cUx3CsTw8avFhOy/aoWbosObedMr5kPqU2ZqHU/gPgBlG4Ce9JqKCfiahU0NV6v6V6aGZkObEpCLMKKOm+7+XMAqsrfLB5ojD9onDb3dFvYeTY4bBvcA988bVFpgx1l0Rk1e1VqIVUEcAC0uncqlKuD2CGMpXsT3VeB+rMU/bdRIup5pM58hPMJ/d5oxjvZRNvkRw+Cq96NFHS+UwMs5Y/tOBmotcxYJ1HrJSP1sPpeWy2/+cp2jXLiOemDypzcVRrL4a7di0BCmfg6OhW//YVt5RbJDKzc9+r3yl8H+2m99nCy3MZqMIIXRMxvHQiaT+4sjjYPbk3hZXgl9PKtXEAJX+hcBlIfnRBG0jrw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9O1BmixbrDonHE4ezIvP3IHoBYWKp35XpjTQK5DIuL4zzORsK3M7GNMX883ITAMskPqKEuyhAibaa/16dy62BFpsig0JZe9nfUxVV+QzP1xC1Wl+zjXdWwbGCCA2zsrzP/EIeJaKZ5eAietAVay0LRMe4YUnOUBvjAmou+9MQKu5Jgces+UlA3jrG3tCNG769ajFFcURn8Hw9waLuOcHjvFa0H3Es3gqVhfCO6y1tBnkzan9RLj9mEpS79w0PVTeeOKIXyHmZXrvXQZI0A+fk/70kIFv/6G5RK3MWYem7/d+6hrTkg9qHy0AFgP5E4darw3A95AGRbZdIVSMTe7vcLKiCjQtsgxEtnGZSwBZuSwv4BbVFpEuyxyidFFYUl7s5WpdHBfyWDVSX2SQQTbujQAIOYO1wPC12+cF1EUfU0xePUsdzJQdNim1HB3M0jJt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:17:37.7480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63194f2b-44fb-4f8f-41fd-08dea41c4c3e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_221745_365643_CBAE87AC 
X-CRM114-Status: GOOD (  12.45  )
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

Changes from v2 to v3:
- Rebased on 7.1-rc1.

v2: https://lore.kernel.org/all/20260401073022.215805-1-a-garg7@ti.com/

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


