Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED8CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jBP0pVPxiyAdOds3IG7AjgbQI5Veking0yRKpLFLBCg=; b=481RzciHVMuNAJMURhz6tBQTqm
	GGNxsKRds21bVW7VcGg7Qc5EADmTXASsKuIvIlbcT1iFfDQfCJARve0YdkKOar9NAv486TLYBhS/b
	8h9UIqcwVMxHdF/x6gGXtaH7jvhRSwufkqMVFz9wS5uXyRoNovmC9i8Th0T0XDDFnUV83DyQehSCz
	6Uh6snL12ogVVe0q955zEJ2rzmK4IIQCReIwiIRMeWOe+JqRNuJb58Rdf2MM3nCVuMxLKPrkk7kUF
	VkJcYUnhte418vJrGMJYCJO4SqG7vPe44ajOQAu/TVGYb4goj7RNxq7ZyuIIOmK+i99JZbYWmbE+p
	6jUhXwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8mE-00000003yOP-2d7R;
	Wed, 29 Apr 2026 17:32:46 +0000
Received: from mail-northcentralusazon11010050.outbound.protection.outlook.com ([52.101.193.50] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8m7-00000003yLp-3st6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knZSia8ygAlb6SYncaKamonOY4WVgBvXZ3Tj9rlxWtlP46nii9UXhMN62PrRm5H93EpuynAAOhqNUUUjB0qKYHEEaM/BjLIYqrshtktmqBfVJ9qEsBirSIXa/pPvWAH2M+aoKonlFlJi3qyFLrW3iMTkGJHPrjIKG1X93T70T1bRWNJnRlrU11G1Fz6yvAwKY2e7vqm4GJVTLNQs//F6kkVY9GTQvz6BGz5hgJ3H/UKeiTyPq5ER93pQDB5G8kTUJLd2LaNyCacCLZlojAwJ8l6SDnyEp0LVc1jh/ebdvIiWi6djVx7ZHX5nENgAxgMigpjNHkmSEgUACTAGdGWRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBP0pVPxiyAdOds3IG7AjgbQI5Veking0yRKpLFLBCg=;
 b=WGl87VIw30Md27WUB7ir8a93Qhubg0m3GIqKYBgYkga2F0CgsILcFry9J30JRreQENtolzp2ADeGzaKHtJQVF6m84amVW3em1bV6bnWXfdYVW/1ru+6kLgMbs8GtItTO5uO7SVYktBwtV6y8hTWMokpUP5ju7GTOL4ReoZtDMnqrDJl6ZG/jCpNwCBt4PUB8QUZSPAPLQOd7N7aHHrr/n3pznJuErhnF7CckgnrEK2xDpapbrqLZO3/27Ps1pPfmkc6vjZ5agx25t9NKpfISzTPfrXDm7t8nK9tLzW7EkWUgXzQXjEmFsMUNnoRMgmLoXoVR2k/S9ptBLoNerLCMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBP0pVPxiyAdOds3IG7AjgbQI5Veking0yRKpLFLBCg=;
 b=X3Za39LIPb1d6RB2wk7Nrao8V0SQcb4Fq+7RiouN+uvct4iMWJgqJSBN90Z3obQr0/X4WS2sqZ+sPU4F6e/RW2SJbBj2V+rDeyE+mDWXELbSbRLk2+WGfaVurku7Sk7VCV+HPZjDHWkjMub6fajhO46dNu/pX6VU3pkoXeB5aM4=
Received: from SJ0PR03CA0191.namprd03.prod.outlook.com (2603:10b6:a03:2ef::16)
 by CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 17:32:29 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::89) by SJ0PR03CA0191.outlook.office365.com
 (2603:10b6:a03:2ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 17:32:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 17:32:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Apr
 2026 12:31:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Apr
 2026 12:31:09 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 12:31:06 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 0/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
Date: Wed, 29 Apr 2026 23:00:46 +0530
Message-ID: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|CY5PR12MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 634d1579-70a4-4e05-d19a-08dea61549b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: gL423kqDB8An9UrqHLEePA+QwRmz9NHvyK2atae4qhuryQtAUp7fhWlh+apFKaptKges3xxkU3vRJM+Bk8Soh+sMFppQmtODQWSggPQIZAWR/sU+toHFIXNHqTqbtCypeCpzPjg8pkXYZI4BnIBwLaf7oYhNfrF7xT0roEsATyp4zKzmicf75NATVBFfbWY438hZNKRNa7OrFystdLpBg06LXOKOVACCbV/YkVvQymzLWbIDtbPXP/D8lWO/p6idQsM2Leh9XN3XOIeiNgUhAR87BS52JUkHL8zRtsWL/qbZ3G+fUTeDgNIkDlLLDqNUxpkCpbZBuoOcBG96jqv6mgAvWyj6l6ykaLXNc6zI922LH3GpF7awJVtEjp2D+j3PnBoRmjsntRyxBQhhdUuAweGq9CCIGGu+iQ0xs570srNlfdWYpyPS1tlVS/9gHNiv9SZ8djK5uUBF3wb/ZMpBWuXkxSNKSSv73LBo5uNsHi+znjAwbDnCnX4znthK2s/k1t9mVZsSsXrLymmZaJxQ/7+4XSAAmlZzn6L6Wn/hmwCY0dg+6rZR8SddWTVfrAHixtizVUvv1IACwIWearfeNWnhbNhslyOKxXrVcOkdehjBAP1kFx354686cEmsgftaCqcoGFTA80TzYbXM7P9S3VKSbVb2dVTmBfxBekF1PA8kpKxRI/U6i4P9vrZNcNpsoCUYV480TKuP/TFNLYGcw+ePx2aVhaStLMKjqjzfDkuGgYqtO085bxJbiknX7o1XmeArCjbGJi7MdeUbzWJZhA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fZGN+3COI72QKWDGXuWRvMFpos4h3QXGHMivq0HTunP+nqTtiNVX7sfkmg0SdmqptjWdYjMWUSNhMmJceXITrFncgoWmWMTkhzfZPteNwEauC8b+PLkBr69enCmBAgsIRTWJEB84/vKIpoPWFmrj8gAjjnFksUuvDBFPOoKVJHHVGECjw9qjXj+PItotrsJ99PxLBxr5oPbDyQMOuIcN2sJCs8DYaeCC5uuSCg2tmMj7KMwTrkme2O0zT5J/GwO0YOfix2M5px0LT3AlfJEbz3SkmDR9aOWLfVxyJEVqRiWipZrNx3DiAuBoh5fXgiREEVEprCCJfqIb83UO3X0u6QY5JWxan6wVMR1eZd4jd/yqtYunIBhaGVzbgNQcWPhQ/yKBJm5FMNOtmVU03Mv4NIgwH2Mo4ct6d61Hi6JixiP1zySVCJBJj1QtwThkcZx2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:32:29.3730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 634d1579-70a4-4e05-d19a-08dea61549b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_103239_966827_BC6DA973 
X-CRM114-Status: GOOD (  12.42  )
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

This series introduces support for the Multimedia Integrated (MMI) USB
3.2 Dual-Role Device (DRD) controller on Xilinx Versal2 platforms.

The controller supports SSP(10-Gbps), SuperSpeed, high-speed, full-speed
and low-speed operation modes.

USB2 and USB3 PHY support Physical connectivity via the Type-C
connectivity. DWC3 wrapper IP IO space is in SLCR so reg is made
optional.

The driver is required for the clock, reset and platform specific
initialization (coherency/TX_DEEMPH etc). In this initial version typec
reversibility is not implemented and it is assumed that USB3 PHY TCA mux
programming is done by MMI configuration data object (CDOs) and TI PD
controller is configured using external tiva programmer on VEK385
evaluation board.

Changes for v3:
- Return -ENODEV from probe if device_get_match_data() is NULL.
- Replace map_resource with no_mem_map (Versal2 MMI only; others default
  MMIO map).
- Add PHY warm-reset assert delay.
- Loop all num_usb3_ports with one de-emphasis value.
- Set default as DWC3_LCSR_TX_DEEMPH_UNSPECIFIED default and only set
  snps,lcsr-tx-deemph when not unspecified.

Changes for v2:
- DT binding: fix MHz spacing (SI convention), reorder description
  before $ref in xlnx,usb-syscon, restore zynqmp-dwc3 example and add
  versal2-mmi-dwc3 example, fix node name for no-reg case, use 1/1
  address/size configuration and lowercase hex in syscon offsets.
- Split config struct refactoring (device_get_match_data,dwc3_xlnx_config)
  into a separate preparatory patch.
- Fix error message capitalization to lowercase per kernel convention.
- Rename property snps,lcsr_tx_deemph to snps,lcsr-tx-deemph (hyphens).
- Fix double space in comment and missing blank line in core.h.
- Use platform data instead of of_device_is_compatible() check for
  deemphasis support.

Link: https://lore.kernel.org/all/20251119193036.2666877-1-radhey.shyam.pandey@amd.com/ [v1]

Radhey Shyam Pandey (4):
  dt-bindings: usb: dwc3-xilinx: Add MMI USB support on Versal Gen2
    platform
  usb: dwc3: xilinx: Introduce dwc3_xlnx_config for per-platform data
  usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
  usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis

 .../devicetree/bindings/usb/dwc3-xilinx.yaml  |  70 +++++++++++-
 drivers/usb/dwc3/core.c                       |  24 ++++
 drivers/usb/dwc3/core.h                       |  14 +++
 drivers/usb/dwc3/dwc3-xilinx.c                | 103 +++++++++++++++---
 4 files changed, 193 insertions(+), 18 deletions(-)


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.43.0


