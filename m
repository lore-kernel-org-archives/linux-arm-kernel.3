Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9B8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b2Y45i/RbcAAzMU11PEJZYNZzNCuWeRpfDzY7DpC3Xw=; b=NGHnYKUGEGqjPTl/PDVDJ86OfQ
	MO6NZNn9E8qf2D32blltWsQxZgz28+Xp3u6nrT6ryDxUHSyReK5Okzp/jVWaw6K1ttY6p0RmVbyFi
	/jy3zlbjGYa+JhE8y49JtjeGoBIVrDIObEzHfRIqN2wvn/ogjU2y2FlQN1r/fINjHeT1FVZkQgnOH
	zcxLoTv9+F+s2cJN8tuU5t0uKIDx3jGCoGAW3II01Gdzv4pjmAYGbWHLi9j0PEIzP66HthpupyF3E
	Ka0PVf1tr0rPvjsajR0G09H9/RrgBiccibSQ5AfZdHxrFFro9v36QinwTnlE7kv2VdadjxIFX6jnB
	jboH4jIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi47Y-00000004Dfp-2cGI;
	Fri, 10 Jul 2026 05:49:56 +0000
Received: from mail-southcentralusazon11013020.outbound.protection.outlook.com ([40.93.196.20] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi47W-00000004Df4-1YN6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:49:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhEQ+fnmUXvQQcTVcs3GWmNzMgwP1n3eYhJSPsrYBC9c8PBvRqBuGar2jEkeQoDoNVAULxHJpmWwmJA7Z0Rto1fy0I+/FFjCrCkg6nZdRqY7rfbpUIUlSfiQlc2wL0PG0dXFfNipjRvMv1F1VcRf8VFHHgH2PwcsXuRVwvdvJZts3y756LVuzsgrKzu9fhFRTCRWHZKyB3g7iUi3AlIIRI4kkUFfzq4bscGVzgOyy7CEHB/rAgTFWnG3qjAQ52MGm1riXvkXBjOPKiJr4kHUOYX0ddWztwugNr43aDnQTeiqb3f79Dbw9FjHVYwuub6wejKIObWntAD46jPMUSQiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2Y45i/RbcAAzMU11PEJZYNZzNCuWeRpfDzY7DpC3Xw=;
 b=F/TQtVMfZImH83fLcwbEEw7mfkt/5F+K5HvDMS0ja2ghk51rSHf9QnIn2OvWm4LZ1gw0W9+nXKrZlRTotJTZtxzwirDTcwmrauzAhjLUC26gNL4bKkDJ0Xp1HQ70RiKlydbLWI9W4zbqRcpRT0kDOxkxih4CW2vE8+WoQd1PZcfLXWLqRpwj/RIJg2jcpfcoxx8fsZbvN5Xg5vRrb0jY9tVZLwj8fVlxTCHnWCDTAruvOpEeNLbUeOWOWsqsL7ejI0w7Du15+WcWc4Nd5Ochyt6uDBv4fRC4xC1fZoGJJNxIY1kdnUhWdaSZrxczag6pH6yeFpzqd8vLkE3Xtoxbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2Y45i/RbcAAzMU11PEJZYNZzNCuWeRpfDzY7DpC3Xw=;
 b=tCnKLcRxIx3wvtvAT1PJyHv1yYTL9xwYNxaQiixIdbXsvIgkiDRcE0FN3M9H3mTRaEkODBFroEc0THcptN9KxgX8y7r9sgUzDRSfICJbvsV82yFtioXhYtdAO2/qywJcj+jz/0Og2gtJr+8gOUFSNu8GxXl1kNP3ZdHZZkDz44REML/ZYFyUkrYTUeH04+wZ6W1a/Ba9iR2TrPvPzfXjm6xIjq49xnx1bIGrfafuDLN0HUu3q3eNwEHFSfhf4o0XmX5+N7/pWPGVjfGQ1y7tcexOq+rhRI8sKNy8S+1D98B5jZMsrOylLBo3A5ZKBbc45IgXFIefOJr/kINNw5zPww==
Received: from DSSP221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::9) by
 IA1PR12MB8555.namprd12.prod.outlook.com (2603:10b6:208:44f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 05:49:42 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:8:3d5:cafe::41) by DSSP221CA0013.outlook.office365.com
 (2603:10b6:8:3d5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 05:49:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.0 via Frontend Transport; Fri, 10 Jul 2026 05:49:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 22:49:30 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 22:49:28 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <andrew@codeconstruct.com.au>, <joel@jms.id.au>, <robh@kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<andrew@lunn.ch>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>
Subject: [PATCH v3 0/2] Add device tree for NVIDIA VR-NVL BMC
Date: Fri, 10 Jul 2026 14:46:54 +0900
Message-ID: <20260710054849.3178747-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|IA1PR12MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b771590-a04b-4863-6104-08dede4709bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|13003099007|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: mnSUMlkcptb3pcjuYolHtxQK6HNyelp96suuitkOEGtTohE9yw8BhH+FQ1/6ZJW3Bfj/oYOw6F6ScFQknbLP1xia+uT9htcwd+d2tReR1OdDVwFbhdeUl01JA8VDL1+bULBWql0t36ZeqCw4ZvU4KxW0xRKfrLxJniWLikvwenIFffki+D25H2P6dhLj3cwKC/UWFVJe9QNN7oKAjWxO7E1a16iBmK8fuLIZqti11+ws0UEhBhR+FNSmCpiz2iGeXgnh92HVTF9GeLw3zoPZMNSN2hnm9wlECluMUtyOUxJhADiUB0Gk7K1OkSso7O0RBUQBYDkKLaZaOkHG0ApXngrB2T+Jc53llOKtnyH/4eqk6ZcNMCbS1AdW0Nkb2qE79imd7ryGVQxVMFVwxaITQCDNeLkBZbexaapsS08eEwYd91zXnh6OyCHbsY/NDOfGV87La6HlIDJdpRN6LilRRZYkCEZwdBZsVsXiCGD+KUzByTQLV/aIFHFeDPqdFsEmzmiQujHqGntI3bFR2r/D4kxoqE4zmoBb1CwFAzFukCt4xmvobgdEpavXy1MbB+2Kkvan86i9GEgcAMDp1O7FQjZJdhiomMzf3x868EjkkiaCtc8aImKZQYtLq8LLUrK8mqqhlRw5iC9wtWvEOhwslqmEFIPE+HqNvLnLwnD7ZSPnImQQPUu2Hd/jrWuVExWgpDENBsK4S7tck2KYMipdXg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(13003099007)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 51fBqc5TpzV4o4uYyKelKS9N6hws9qywvuUDUVFjimD/ZSs5FQKvi+FNH+9ahzUrVeddss+Dl/6ZZRounUOriX/m+R4JNitvCKld6JdKsPV7zourNp0bylHK6Vg8iBqchUtK6kcBtP2VO1qLLLE/BRYoyybxSVjqLQb35oBXBA5C+4+uyNdZC2aUUPfFKcMSDEahACCcm8upFCwgTYX7vJyBjEHdjMimhb93ZVtgdAeRNmSECBMsH1NlNBv5Lz7j99C5H9HMOFdBJbLQhiMBiYyOiFqnS7VXQyKEWKbw+Rpjf03NFvzU7p4tfFh9Agk2IrszkWQzAxR7p3NvcvGrQtAK8td1JAHwgOetJjkdzoazNq6zLyaUz6wv+d4BtAFQMOZ5o4hCg5l1XJJu3hrYgxngYm8B2tfQuMYRlictMExTXIeJuvgUqF+nnTE8l0b5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 05:49:41.8848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b771590-a04b-4863-6104-08dede4709bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8555
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_224954_421992_1672BC85 
X-CRM114-Status: GOOD (  11.37  )
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

Changes in v3:
- dts: reword the &mac0 comment per Andrew Lunn's feedback.

Changes in v2:
- dts: correct the compatible of the PDB I/O expander at 0x75 from
  nxp,pca9555 to nxp,pca9539 to match the actual part.
- Pick up Acked-by from Krzysztof Kozlowski on the binding.
- Pick up Reviewed-by from Andrew Lunn on the &mac0 and &mdio0 nodes.

v2: https://lore.kernel.org/all/20260706101526.2556226-1-jackyhuang@nvidia.com/
v1: https://lore.kernel.org/all/20260702165524.2168091-1-jackyhuang@nvidia.com/

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


