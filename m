Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0CCFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 04:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKsOeFa2u9K7uS5reA+FbNV/yiBopvTnVNARTk+L34U=; b=pqIYVpHHZr9KzWpvi+OCdB4zgh
	xDDlMMYiTO6WVgiDfpMDoIG1QjrnRhQRILrkeVPEVvsuSNYb35uVyAHVL2Pks2In9bFpoH9UOvtE+
	QDufoHedmS32+NgCgcpPMjq7Egb1VhywVACgkTH/VjbGQGnlBB/2HF33f9lzDznVNVVKS0RpfPDTN
	5aQBqYedgyuECYFZVQSNLM5tHHXsSvmJqub3Si/U+V7EmRJ/WQrV0jUD70raWr3b7ItVrCCfjKDhC
	YMvlC8WD5g9qTpm1peleiE9IlXSyr2yESZiYQBhLeg34m96gf/5XRv3GNNjOisZf6DV5W3SQv32td
	68p1sVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHDpe-0000000G9V9-2HAl;
	Mon, 27 Apr 2026 04:44:30 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHDpa-0000000G9Up-3lRL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 04:44:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F124gQOk1Yz2kpRoYKzq8Q1LX+tS2ZcYUHO3qGoSzIpJ3KU6TXAJ1I0d/VkOLYaQ58AmS7wNUbpwqpPRgTJ70Tr+ookJb5/qNVORc3DQNZ2sS0euvoa8ktoFPATuIjGVVI4lU4OK3pXMdcXssvz4lwz9NFJV5hd7QA/xh4eOIQI+x72KO2ryutH9Tn7DL/mjI+S9aCozucyw917C/45xGDcti6FOrLiCv84F9iVcv2T9iHTtQLKJxY6aLMAqqQAo95qvA3r5do51g+ts1uMROLMJg0n2DPI7OqY1OpT/dRJ64wuKsYvxE6jL3cCm6qAny/mtEXAutHKSXK/NL5LMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKsOeFa2u9K7uS5reA+FbNV/yiBopvTnVNARTk+L34U=;
 b=P3A9ZVlCrshLjlicQ5JVqefYif/CWy3Izb5QuSBKt0PX6zoPqYHBVcSyjEQqWCcBeFyEUBpw8qfNyHL/X/Z+M18Yq2s7StLI9bZKcQyqCboR2qJQV/O5DCGDoIMufiAucnhepJUZfStG/bMuYjf5/c7vfDZQVsEv8wOY1LeuAD4BtQgfpVhRy6FbkFXjvqBiLVJDLVUiAcF+Tn034YnFPRajtWdd73TjenJ6YcsuX1WuzFG4SsH3Qdidn/saPCUee8+A9VhzwX6At/QUwTsA+D1lAwJqgZ95VhhEjvAXTJ6FfrUEHCObdjIlC8WQoZq3dIYfX6P7OyrX6eEJjOs+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKsOeFa2u9K7uS5reA+FbNV/yiBopvTnVNARTk+L34U=;
 b=NeYvbW4DceIpCOtIVV5ikRjoVJ9jgWzk8Q8nXIRV71IvRPsq5W2XeIxVQBx1WU1RBBwMuPLcnCpRb+PhrQkE48SKheiVkX4w3hWn5xo7JFMLDyp2p4AbPGggx8ba9PlNamALM5iCc/UQ+1f0SRhw9SYfaJa/OJ8cFoALfQqvNDc=
Received: from BYAPR03CA0016.namprd03.prod.outlook.com (2603:10b6:a02:a8::29)
 by CH3PR10MB6882.namprd10.prod.outlook.com (2603:10b6:610:14e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 04:44:12 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a02:a8:cafe::68) by BYAPR03CA0016.outlook.office365.com
 (2603:10b6:a02:a8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 04:44:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 04:44:11 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Apr
 2026 23:44:10 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Apr
 2026 23:44:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 26 Apr 2026 23:44:10 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63R4i5uB2493746;
	Sun, 26 Apr 2026 23:44:06 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <krzysztof.kozlowski@oss.qualcomm.com>,
	<bjorn.andersson@oss.qualcomm.com>, <geert@linux-m68k.org>,
	<dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>, <ebiggers@kernel.org>,
	<michal.simek@amd.com>, <luca.weiss@fairphone.com>, <sven@kernel.org>,
	<kuninori.morimoto.gx@renesas.com>, <shijie@os.amperecomputing.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>, <danishanwar@ti.com>
Subject: [PATCH v3] arm64: defconfig: Enable J721E and Keystone PCIe drivers for TI SoCs
Date: Mon, 27 Apr 2026 10:14:04 +0530
Message-ID: <20260427044404.222396-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|CH3PR10MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f079283-7635-418d-0bf0-08dea417a074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6TnQl2hJWj8CVYz95Do2KdEa5UJKSGEQy42hiclDcoagpJlgT4nSOwLHpWEB20EM0D5IntSmODPqCv/I9KVeAvYRmfxI9QWo9GtbiFeuSTrMX7RWxh4v95ou5y++n+UNgDz/YKR4YuTJ552D5Rujmh3jYu5MARsq54jGXj/4a+kVYLzCuVVlm4dX9KjYoKBVKRcxHOqjow6fW8sfU3wUY6huYFNdQkceQDFICiqnMHyrm4UlKAft406Zmq7/b1eXMnt2pjFouLJSerx3kGr4fhAnoqzvbXpU2y4f1MDYOfUy4PKrEFfm9QtLjwf8f+0oBkwzFaVWp/I+JwY9t3x4EyxGRAMOzOXywAnpHryEAQmoGp12JWGB+6Ryx3AUS0t6p0Hw6Wmw1FJKkIGz2Y8q23wYMR/M863FewtY6f6nBAGUFlqDuvN++jhEGZYnDRF/8p1aqBcjyuIEgB1/ORhmGVgzMhggkrJKvs3CKootckTqATa63i4FZAK9uCeVcs1YHT2EhMof1FBmERvNcFO7MgN+twMV1iAcIA4Z0ESL+AXf6Sf8WKtn9HDi3r7f2Wbmn9+vKea0uhOpTBzlpYTVWGLc5qsVMtxAAq3McJ2xfQG+/K3XUp18ogY2Ocwn6kWhG5aoytSQWKnmVZWXI5t0bIFiVvjkebka0jrqBo35rjUaGqrnG8cCYnH0NO+hHFMVcbH2mqrbHWUaHUMG3Rd+O6GjbrEZSpQ3MpOhhLYAri9RN4tf+Kzg+ldnwIzR+01zcTWKx8VuhNIJMAY3k/TFmJ45YJWA8Nji/EHaReFm6L6j9bgPy5Nav3IH2aYzN/hcKtRqPLuV6plAY9D48KBm6g==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YY5EEd/KOVPOTne6xk4irO6rhjiUG7krCelpTn7l+/kuKpjFGv9WBSeyEfFYBiTbWQS+SK+cF7IpSzBXivhy1aPz/POxZjlkumaiPe16vaY31xIQ/DfmAaVtdMKXSO1vOjgnKX6yA8s65R37Gk9DeM4VM9u63whp2mov+I+bvJcKMFAxQA6rLbJn2OAFwp2D12VRq/hAowMAfOAqoPhUokIXAB186aCcJwr4oSnwkISGpQgqunCQN6lWzGIRLKA2dMJTfWtD6odlq0Ls4iaC5hJ5vndUaZrF24cyvY/CUlm5cQwgGV/kh5gCd1aZ5nWCcamasumcPIZM/z3xdTE1S95f3JC8odv0aZMsr2GSe9qsvCMHIZJxu8amPlN5VV1qsRxtgeIaPIPUOW0ysjm7b58WjzDMCeJGh80EysC9mG0MmaVpuDESzIvDek6yvbQ+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 04:44:11.4982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f079283-7635-418d-0bf0-08dea417a074
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_214427_444683_86508CD2 
X-CRM114-Status: UNSURE (   8.34  )
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

Enable the J721E PCIe endpoint driver used by TI's J721E, J7200, J721S2,
J722S, J742S2, J784S4, AM64, AM68, and AM69 SoCs.

Enable the Keystone PCIe driver for host and endpoint mode used by TI's
AM65 SoC.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Changes from v2 to v3:
- Rebased on 7.1-rc1.

Changes from v1 to v2:
- Squashed the individial patches [1] and [2].

Link to v2: https://lore.kernel.org/all/20260317063902.262392-1-a-garg7@ti.com/
[1] - https://lore.kernel.org/all/20260223104609.876613-1-a-garg7@ti.com/
[2] - https://lore.kernel.org/all/20260223104650.876632-1-a-garg7@ti.com/

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..d22a6bcbdaaf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -230,6 +230,8 @@ CONFIG_PCIE_BRCMSTB=m
 CONFIG_PCI_HOST_THUNDER_PEM=y
 CONFIG_PCI_HOST_THUNDER_ECAM=y
 CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCI_KEYSTONE_HOST=m
+CONFIG_PCI_KEYSTONE_EP=m
 CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
@@ -242,6 +244,7 @@ CONFIG_PCIE_XILINX_DMA_PL=y
 CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
 CONFIG_PCI_J721E_HOST=m
+CONFIG_PCI_J721E_EP=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
-- 
2.34.1


