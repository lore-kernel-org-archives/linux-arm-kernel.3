Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EB0EC01DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zKDB0jdoKZi39X8HPp068xWyfksBFW34kbhM9caEeH0=; b=mSb1I6SON9nrbj6kwkEPlz/Mo/
	53SLY83SnEcewMtZ7nqJ/RzydQ1Jg5jV2Ra2FmMSUS+ejEpY0xVAv7H48vbKv5Ic6pFjMWYVazjw5
	hNLm5vWjuemmCkhctCBEhxEPEpuvjmO0SFiQMo55S+LtDifVAb2wMtTcoq9FF3GvhTu41DFq+snzz
	t58SsJLPH6qdrt5AvtFWCNfRFsByEeps16+vRNu4Xn11ayQwkCuWAq4cBJDuuaESvBP7GX2a6KjOx
	N+neV4NjVrAWOGToEfXBjR1dBvNGbQ90QFuj1GATbyJiGK7YwAvhzCQfJybO2XufdZ1wYXQrkr+UW
	mMdpX4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dlt-0000000GeAe-1aEe;
	Mon, 23 Mar 2026 11:48:37 +0000
Received: from mail-japanwestazon11022102.outbound.protection.outlook.com ([40.107.75.102] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dlq-0000000Ge98-26GC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgOBIZ2O42eHpzUac7gA29SwuK9FxR77OaQA2VEsI7iHjZomVoEKdqVOqIB2mwZmIye7w1LGydqzi7gNKfUBd8MU24lGU833JbpXW4zHhGpVO4aBrdJOJ/O7Ilx4heZuPYZhh42aADFpLF4q7Ntd+h1WtDXDAM/txbUVwXgFz1s6h45KrUXyLtiHBD5I4wsapJ2a1Zsn2AbhHYMnuUyM683ZKLvXuQH6NfzDzdbrcUIyS/EvJfJvDixboS9Hqn+32M+0nSZh7a9yT7FRiGk/sFPlDTRASYLe6/oNowNKPKaNKbTuTn2fa49CuA9PwUxW4mZmPUfB5kmRUjVxnmGvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKDB0jdoKZi39X8HPp068xWyfksBFW34kbhM9caEeH0=;
 b=k8v4nku1v3aOFQfBm6lh9PjFn6mPSTKWGZiVeA7TEKRJVKt2lUXkYs5hBA1H2NN8G5Gvox+aljXgEHFxlx5W5N28/jf3HJhOaIEArUS7+gb6Kvq4o9PLCe8FX88bFjse5UwKOrLHAfWYOJ8BcojdxSxYTvvohB6fa12wHFPqjpF8t6vOS3cMLYufXR4DRkS2bWZ49hSd2isHqK439gHlcJjD4jROMD9hJuK6ae3SPlSLyGH/FqumJOc5RDzLshUdOB6cdmz0lnHQMbwuTb0VhviEOpAq/SSgn90zHIThGoSjxSeeduf/JHBz7juxEnFrfgBPxw9fF986nyWwKPpEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS0P286CA0155.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:16a::6)
 by KL1PR06MB6906.apcprd06.prod.outlook.com (2603:1096:820:128::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 11:48:27 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:604:16a:cafe::37) by OS0P286CA0155.outlook.office365.com
 (2603:1096:604:16a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Mon,
 23 Mar 2026 11:48:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 11:48:26 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id ADB444126F83;
	Mon, 23 Mar 2026 19:48:22 +0800 (CST)
From: Jun Guo <jun.guo@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	robin.murphy@arm.com,
	Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	Jun Guo <jun.guo@cixtech.com>
Subject: [PATCH v4 0/3] dmaengine: arm-dma350: support combined IRQ topology
Date: Mon, 23 Mar 2026 19:48:19 +0800
Message-Id: <20260323114822.1925869-1-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|KL1PR06MB6906:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c6144477-9882-433f-8ba7-08de88d21829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: hoXNjqyFEsr0LXO8FGGf52Y0Wxajmht4ruX9bxa0UpMz0hXgaJUj2w+iHlaadfJL689trNqIc4LPvmsbcIdnluLVCKuZokkbpFgKcjdX40iJ57VDKDCfEx+iI2Nu2DGKF7hjGZLYTmX0hqTWEtN1XC/CI8auGGuzarCBROtFMPj/fWCaa6lKFH6ReTH8YwtmJB6qDeFK7E2rdhqXt8XSRMdC6IG2t3zFap/yEZjmxA4Yi2tHNksPBOzLSflyZPtHrUUwynycN/dh2fOZfoubjBOjlwgBJZll6R0n57eN3gFjWhKza2Ofn8uk4LnPjrOZ0q21hSMVeAB9LVb9ov0wkFvg1jTkAjRyG6xxfRo+1NsAbyE4/WCSmO2y3Fl6Cy2GFyRnl9LA7+lw+y67WF11Pjfj4cs6m/pkzFQasEsHP5QTy6isfaiJh+T6zvsM7q+TzPa7B5oqUcqR6hVAx585J9oVzCR6pS6FNB58w9TshrJjPoZwH5j1739HDZO45HW1opHLYDV2+YlLZpwZQ235eH/LFL+NovBQsrPEBfPzqN28heSH96dO+giO42+4/srKRVaEaWfyOu8Hg1nEA/qANk3FTqc00dpNTrSUnsNIRQuQH4El1o6cQxRaovW62y83AW9fCdrNvYRxlIgFjW5KIGNSlWIuDM3qc7b2LCsRzNtuiQSTRSyW99F3hESYp/79nvrK9+0njvbWTNyl3jTUfJmxKGTg+/wAJHphkkCSJ3C51Azx16Qzudw0WdYP3UwF3/ZcCxwDviBtLhGyOqApqFyLOwl0/cpQ5QKn4B75pCWMllgdZql6OyQGkvf/BUd0
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D5YiKiYWqXAXpxFgEKYm3kWhk8cecbcSKfVxqnzhTsleQmylT1A/Omexzmul8KJsIvc29RVTi4nkWJYxQD7AYnO7GrVFwhnD4ujepgQM0j3jQrG9eY4J4gN/0rua0FdY2bJ0sdj8d6xRI0Y2bNc5y/jCASm4U0EOB12kxqOJQx2z6FCcGRd/nZELjdJxv5TrdvaIwNqCj6Y1iU8hNNPSKg1Nys1yII12z98vLGMrpxnuSuoFDGEDmzZT72Hr2ys0a28kVKU6N/KLhQELVZiCUuW7FKpZBVntwoE0uAoBlKJxKSvDtJLtIYzs1G6YpES9jFzQzpHj5QeZFg2g0P5WKB9QYIkKeNtGp/AjxjWqFjGHUqqr/ClQjmG/blvpAQUbZ6sTnxSMXbrW/NSS+Vs8iZvYCidn8eFk/uNpqmK1dauYdRP3xNuO7YVvEUzxhrP+
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:48:26.0483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6144477-9882-433f-8ba7-08de88d21829
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6906
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_044834_544651_A55983EF 
X-CRM114-Status: GOOD (  11.47  )
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

DMA-350 can be integrated with either one interrupt per channel or a
single combined interrupt for all channels. This series adds support
for the combined IRQ topology while keeping compatibility with the
per-channel topology.

Patch 1 updates the DT binding to describe both interrupt topologies
(1 combined IRQ or 8 per-channel IRQs) and keeps "arm,dma-350" as the
generic compatible, with optional SoC-specific fallback compatible.

Patch 2 updates the driver to detect IRQ topology at runtime using
platform_irq_count(), handles both modes in one code path, and enables
DMANSECCTRL.INTREN_ANYCHINTR only when combined IRQ mode is used.

Patch 3 adds the Sky1 DMA DT node using the combined IRQ topology.

Tested on CIX SKY1 with dmatest:
  % echo 2000 > /sys/module/dmatest/parameters/timeout
  % echo 1 > /sys/module/dmatest/parameters/iterations
  % echo "" > /sys/module/dmatest/parameters/channel
  % echo 1 > /sys/module/dmatest/parameters/run

Changes in v4:
- Reword binding text to align with kernel style.
- Revise the AI attribution to the standard format.
- Remove redundant links from the commit log.

Changes in v3:
- Rework binding compatible description to match generic-first model.
- Keep interrupts schema support for both 1-IRQ and 8-IRQ topologies.
- Drop SoC match-data dependency for IRQ mode selection.
- Detect IRQ topology via platform_irq_count() in probe path.
- Refactor IRQ handling into a shared channel handler.
- Enable DMANSECCTRL.INTREN_ANYCHINTR only in combined IRQ mode.

Changes in v2:
- Update to kernel standards, enhance patch description, and refactor
 driver to use match data for hardware differentiation instead of
 compatible strings.

Jun Guo (3):
  dt-bindings: dma: arm-dma350: document generic and combined IRQ
    topologies
  dma: arm-dma350: support combined IRQ mode with runtime IRQ topology
    detection
  arm64: dts: cix: add DT nodes for DMA

 .../devicetree/bindings/dma/arm,dma-350.yaml  |  34 ++--
 arch/arm64/boot/dts/cix/sky1.dtsi             |   7 +
 drivers/dma/arm-dma350.c                      | 165 +++++++++++++++---
 3 files changed, 170 insertions(+), 36 deletions(-)

-- 
2.34.1


