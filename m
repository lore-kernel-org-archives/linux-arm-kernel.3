Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED7FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3+7ZeJFG07kXs5vE1piXlg6V2Uz+jJT7zIdNIu8kKuE=; b=mRjCxFZivbs5dq40Ns17SgyEbr
	zLf+WlqiWQnItndzb4xzFtF4j5pH9St3pUf7KJiQrsKXcxlMRWbCct17nnCqZxIo1eifozdCVFFx3
	JZ9h/u/QVD2nRKZSRNW8FscetQOXZho8pz9V9pH7B8o27DbbH+OZ+4pBodKQ/+oiJ3ytWvQzKk0Eo
	VyltmYtH/sqephs8WefQ0Zr4GOrYsd2f6zs8aWu/OW8ycvqAehC2nnPWL4WYjTYSTpaazrCDZRj70
	1M5YGdohVt85O9eMAhPTdUoEc4wY/QpuI6lry4BRCZZRy6NuxpVEoQWYgn24seD7gL60uq56igvAA
	9BGecV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKiA-000000054P0-1dXY;
	Thu, 02 Jul 2026 16:56:26 +0000
Received: from mail-eastus2azon11010007.outbound.protection.outlook.com ([52.101.56.7] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKi7-000000054OX-2Aqq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djNdPhtpnl+VjkYn7tu6gzsO9errXw9+zykvAlNSESgTcrU87/LHfzqHSePl7bE0TCQLX5O4+0K36Bmdm3XzlVBw7c1c44+sNvxQrgxfRxoi9hDEq9rrNgUJXn73eVNFyYhNDxzZ2AbooWtlZuVKjSWRRrEg/jz0Gcb+Q/N47P5s1NSP+hkNU3WH3aoqotHRgI7wXS4STWBx22ZcW74svQF3T14FlAFZXCSqZquNZbfRR0xJcPNH+W9NXnPcfBBOss87pCL6YuFb13T6cgm4oZU99QY/BX+pPtDPGBEsfqo65QaHJ7BWLDR1neLVMz1B2IPtc7tsz26eXwr42vC9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+7ZeJFG07kXs5vE1piXlg6V2Uz+jJT7zIdNIu8kKuE=;
 b=lt36Pz2qR9Pkm/0aKzsIWCEca6KQ9jqYY807Cxiii98afjhXPK6unEFJztp1JeMHAUVyGEAwdWf/fGbZcfGKIuaBktuIv4SWDxbASdIXmj7wAZPM9dDPlxK1owPjAtfJj5H3ICAD6HiKcEfanTxsYuX2ZjngylvNN3iTzpDPQ2bFiQw24qY64yhvdKE3+tX4KIwMP5o9yXXEy+CFYb3r5kBaAL3C4/r9Mr45G4umBaPsVNLJuuUvgYiQA/h4BPi40tGKFYtB4RNAn27DNsmPvcbY/HAFM/swN1WadXa4tUHsYBxfoRwnhvsqnvdt6PSrdcNzrZwFSpES5HfWm++wFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+7ZeJFG07kXs5vE1piXlg6V2Uz+jJT7zIdNIu8kKuE=;
 b=CgJIPISGeCrgCVp4KslTp9CSCh6uAfieK1Z4N1bIVCUO/dEHtF2r1EBC/MXL2y5KwBEoeakm7TVT4FY/tEcL7HnjYdKxJQKtcjgRtaO3F3HxoSteqvzOzhkcEA7HWNfXNIEV3mq8+FT3VmvVqGgjhFStT5Rya+/oPaMe8Fip4aPEubNmbT24paOM4ltJ5p2r58JyJ9huXknUFYWh2WTjAaFPmiQLwK+cL+YqA2HquMHjnd8nbziyfHW5fSyuWc8ydXhu/N8dYYqtp5vBD/aN5tJIB8hlDTS7rWsWqQVT3OJP/FGVJxwbmpz10MdHLQ5WEohqlS3fG45rL2zRIxOWoA==
Received: from SA1P222CA0148.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::14)
 by SN7PR12MB8818.namprd12.prod.outlook.com (2603:10b6:806:34b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:56:11 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:3c2:cafe::1b) by SA1P222CA0148.outlook.office365.com
 (2603:10b6:806:3c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 16:56:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 16:56:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 09:55:52 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 09:55:50 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Jacky Huang" <jackyhuang@nvidia.com>
Subject: [PATCH 0/2] Add device tree for NVIDIA VR-NVL BMC
Date: Fri, 3 Jul 2026 01:55:22 +0900
Message-ID: <20260702165524.2168091-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|SN7PR12MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 089e3772-7d67-4da2-4b8a-08ded85ad18a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ybWPqF1xwaIpNfl7VEsD2/sJMAAOjcS4hQBYr85aemumLHAizGVQ7/DGwxA1EF4sjfTbJHkhPTXyMtgxBCFLCVrj830gMZHWRD82ZY6VVlH1h7//8q7+syk8wnSU1hrGVn0HZdj0MsHNzWpvcQZkWHMubyTLL/wsE4UnAxTA8KL9mQYUs+zvDx2CysNJsxD7BqNZsml3zwUysJMix9idQkkvlFfTv+DkGH9sCO3MA/Qqy3fTIHZyB+xlyzJlN2M01eZUKUdRALZrZWOCuDv3Wp8b7rHviJBf59779jSismkivThZ6UntiQGXzd5yC6OeIJ1O3LbDTGoodJ0yKZkxk2vMAdeBiyEmxRetAVxUATeQCI81V5N0u98XW8qgNjSBiSNRnapnjdfzhuAyDjKf6Sr/o4gj5JUUsP5/8ijnvlwIbZspEYmoM4aKJWNA1cANKSUj7AEQhbUzh4PUwUvFI3XzoqFDWp/fmhiv8ZTP5fYyAY49HriB0rXJ7GvPcsTtfYxAXDlbvRqRIEtfY4k3FJ0JIJrXcjEFm8d1QQtXNtN6fKz/CoLEtIfePsHM6ZdE1VahpZ+tH86LeNkrR8dmKmX2ovI0fBfcDvMo+zIeK6r7mfbbGOA86U7twwde5h5AsYC9823bOMZoit0IFYABWSaaky0pZ/Fx/PUULKicq31VsVLc8jrSi8OirnPRUCmTKP5o2/sWeO05g5UcS0jHsA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vZvGol0N4OqVG+PXg9Igtx7E0CrUOGuB4krBPF1i+hSI0nF7be6H/UQ4IT3XJddPQ36iOgEfZbWUAx2HmSw0ws4g3sseo5J+LMQ5SxnCJSlz8b6hlsdqKcvYhUPAKj6/0GKusx1sYa1SQ0A9V+FYYeBEXob6useYc3t+Sqiur9gwJEZ0g6HCkWLt3qINPNqgRk/eOri5UpnhkUBLPQyq/UnlIJujVPpt939GX2dqIAXLeqlqdwLWpDGZzYo69MgDsOCH8GyGZqUUE5mShju4b6gGGvHmJ3NgFl24pSRNRf6RfmKm0du6vN0queTVBmeU9hin2H0H7mTxDgXW1lvTaE2n6L4WUFdNjEJGc6rP+uOBc+JilzhYKL3DfJkn4gggI/sugoenJhWipIudK98KgZeo2yLywwgqbj2NLYku2vRZfwAlDybOGR8/l5LCfCww
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:56:10.5809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 089e3772-7d67-4da2-4b8a-08ded85ad18a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_095623_562198_427E4418 
X-CRM114-Status: UNSURE (   9.25  )
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

This series adds the DT binding compatible and the device tree for
the NVIDIA VR-NVL BMC, an Aspeed AST2600-based BMC for the Vera
Rubin NVL compute platform.

Jacky Huang (2):
  dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
  ARM: dts: aspeed: Add NVIDIA VR-NVL BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts   | 901 ++++++++++++++++++
 3 files changed, 903 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts

-- 
2.43.0


