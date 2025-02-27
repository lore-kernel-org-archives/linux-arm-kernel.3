Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DFDC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gIctAosM0FHAL2lrsPDZJsgydsMBBLaQN0rTC6oieAI=; b=4JsyI8boUtF2RlTPc6Cj/crTXb
	CMhhJlxexujhuZV3zRRBaOJ3knPaAmKJtSuFaVa6nCKgHA3HyrjEoUN00o5M/iYEXmiPs/bd6xIPa
	klg+Q/uu9KFswZ07VR5mYLvE9vZ7B9yYBDeWFDdrib7gS+sbwNVEMcYnkn5ftar3BEaRfES8vyQaR
	2Zlh+rt/iu0EJEPhqRfwEG/B9Wn6GbLaJlWIs0i5TKtO7hVOj3Ch/yJ18EwT+dXvHP8II4AKMCCL2
	yHjRPT5MdRrpn3x6zH/E1uDOJip3JulhaVFKZ9ddQGWE8ssncAI0fMlWioL7Or374OU9zSDeVdqSi
	7d2qdBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd6y-00000007Nq1-3wXW;
	Thu, 27 Feb 2025 12:35:32 +0000
Received: from mail-tyzapc01on2070c.outbound.protection.outlook.com ([2a01:111:f403:2011::70c] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncew-00000007I4e-19Bl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:06:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUCmvqtK1r4pZjxq1rzy9NyVvAVvAmyOsMbQuiPfgVaxfeYDtxdkNJscZTLHZ03wq8Th1QNPCNDSYPbsiZ5rtv07/lzpk4dqy8zf8qwPOkNw739supIwWaqOLocPj+eiNgdwSmvM17K/6hFuSumYih1m7dZWn9w5M7bj3I7fuy5md8WruQIFMFp9loLwkYUuho9zZllpM88y8iUKlimBVOxef3Sqowf5YO1r10Qi6i0fv26hMBxzZVO9mkmhiNGLOhpbvqUtS3L8MXSqYCdvqYRv8+SPwSkhAZ1BbW8qHMKxn6bCW8W0R+mKjLPZE4umsxnFgaWVhIxXGK0opX56eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIctAosM0FHAL2lrsPDZJsgydsMBBLaQN0rTC6oieAI=;
 b=bX5at//DXaNwcjC+lKUyTNoBSXrhK6ThSwOp98SlZxJnidTK4zIL7cBeL2UMC9jpBJYLLwL5DPWDCMyrXo7njLxRXJbBn1G8XIWplT2x8m32kuJYTVoLKWX7+v7tDOefEnVDLidgwf3CApMZuhGj6SWXOHecpmka52ng5uhyQ/+BwU7r+2iwrJYTb+EseWdhsF1LpoCFSu7Xbm3nTCeTr+Myd6P8cW1MzOSzrmFu+FTKp1OXAQtQRDapNFl+W15SbEGxWiGUOYzItPBRn3v/oK6OJg/tGHCG0oEOF1fsZxstB/OEP+hZXs/EEXL/BeUHKYliE7sUCyMMaBENbUXHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG3P274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::31) by
 SEZPR06MB6744.apcprd06.prod.outlook.com (2603:1096:101:17f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.20; Thu, 27 Feb 2025 12:06:21 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:be:cafe::12) by SG3P274CA0019.outlook.office365.com
 (2603:1096:4:be::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Thu,
 27 Feb 2025 12:06:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 12:06:20 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8F1F941604E4;
	Thu, 27 Feb 2025 20:06:19 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v3 0/6] arm64: Introduce CIX P1 (SKY1) SoC
Date: Thu, 27 Feb 2025 20:06:13 +0800
Message-Id: <20250227120619.1741431-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|SEZPR06MB6744:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5c289c89-46e3-48c0-4161-08dd572725b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q0KPmqssaIsx3x4TA5eG9hLE8rexJzZivcPSuEXBC35rBZyzMBYza5jXS1i4?=
 =?us-ascii?Q?W/1APyGL3ChQF/5vmo9FMqd5J8hAFryF5374JuYFrp+ppqTaQx3NHJwe5Uap?=
 =?us-ascii?Q?0tlcrEQQqAGzGuZDII6AN+572JmneYF3e8b7NzuENFaT1+XKPlQKIFf1/tAX?=
 =?us-ascii?Q?2RTQu7IZ6KivaFweOY12pCh7mtFPp4LbNadKuAOxqHtkDSIY5v1Ze8m7OzRs?=
 =?us-ascii?Q?mM/e6aDKrJ5vnSQH70YgfKtSR5khAmTSTGCXh+16NgOolp8PvOAU/eg7b91M?=
 =?us-ascii?Q?N6vqkmmyVCrd8UsyFD/gDZPtVdpu7sD1mE3xxPyMO+O84a9bFWcxXaTqFol2?=
 =?us-ascii?Q?0fz8sOIrY5gsIK8ScyF2ZoGRx0Kn0FDjH0RBEkaKoNAUXgGdybIhExC3i6I4?=
 =?us-ascii?Q?inkyTf5hefMsL8Nul0CBPBmXjGlc7nShbqlAjSh1/SkZqzawY6fSXXKdnxBA?=
 =?us-ascii?Q?SznT3Knf3fbP4V8dU946f+u+SS0ZtSR+OUD3LEMQi3HWt0MDRJYBy8LjBQRE?=
 =?us-ascii?Q?Ba1S77oIUhxuDicbmrLYad/YTjzWebD8EHu/1nYtJGu42/t7D8L/gI6sTCPF?=
 =?us-ascii?Q?tRJMYjCM0KASMA1tTzJ1VZmjIDttiqELlWg+Xo9bpbR0f5LUxr7JK+KZDL3W?=
 =?us-ascii?Q?GmSJrGrWPgoKlEcGrhvo8NyMCiAvF6gEz+ynSKqryIX66t+iPE0jr5/im8cd?=
 =?us-ascii?Q?gj5Hu2oESgsfVTkHrngtDvl1APnhID0Ntnf7DQxue3louPZRuLj2y8wzh3IG?=
 =?us-ascii?Q?ceMqB6QUYkerQse5MO/eOii1QpylTXNnifm8kjxbyULfm8fQehbZC5Xld35W?=
 =?us-ascii?Q?9M5BhYqjg/SRjMUVSMV8Hd6qjPtObq3WRCTgjMN73vjAaBr8KEe1MkUMWzPI?=
 =?us-ascii?Q?FgLoAvVY5JtIw5aVTuIBHtzh12W1KEeH39/qx2iAs2gNedTuL9se+8cb96QV?=
 =?us-ascii?Q?iQTVDDPxemFOdiM/gHE2bn9YBG1ZU4ZDhueHadNimZsd/d1B5C8tInmTchEX?=
 =?us-ascii?Q?5+v+vIOGgZli3NRyYAkmtX0h7Yfn/yF7UP8+Y303KSKQM9Kdt69abDxTRkz8?=
 =?us-ascii?Q?iDJKhZmY19bXoUjQd/lah7hlHjUag6nd/bgqOvfO8ZApJPRc1zxL3As3Ay+f?=
 =?us-ascii?Q?agciuhnWKlTvF4IoI8eIAKPND30f/IiluWlc6OQeaBZKjnhzxtXKpnBS+BTj?=
 =?us-ascii?Q?vyVnN1vAh+VZkYuS0RReCdjl+CvEuH9g7aMY+d+RlLqH7gIDuiMv4qZl1/Ba?=
 =?us-ascii?Q?0TE1hmAWxcJ7V8BHEgbuzeCZdHw3LcyATV/f88FDx1Nlzjt92lArrLqLpKfK?=
 =?us-ascii?Q?wic21o+ZFW8ziu8//mnPJmNU6xULHw3jHVVRKOKLbisoEOoZJ04KR5fj1MNT?=
 =?us-ascii?Q?POKGqv6OYi3eSovWGRaJCSCB3waaORZgqbxwNy5SuIQkLHvvuw2B4CzrxACY?=
 =?us-ascii?Q?67q4mPLdBluh751v5RdpRrtZ2rU5ZL4C?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 12:06:20.2670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c289c89-46e3-48c0-4161-08dd572725b4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040634_313105_0F606461 
X-CRM114-Status: GOOD (  11.13  )
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

Cixtech P1 (internal name sky1) is high performance generic Armv9 SoC.
Orion O6 is the world's first open source Arm V9 Motherboard built by
Radxa. You could find brief introduction for SoC and related boards at:
https://radxa.com/products/orion/o6#overview

In this series, we add initial SoC and board support for Kernel building.
Patch 1-2: Add dt-binding doc for CIX and its sky1 SoC
Patch 3: add related maintainter entry
Patch 4-5: add Arm64 build support
Patch 6: add initial dts support for SoC and Orion O6 board

To run upstream kernel at Orion O6 board, you need to use BIOS
released by Radxa:
https://docs.radxa.com/en/orion/o6/bios/install-bios

Changes for v3:
- Patch 1: Add Krzysztof Kozlowski's Acked-by Tag
- Patch 2: Add Krzysztof Kozlowski's Reviewed-by Tag
- Patch 6: Fix two dts coding sytle issues

Changes for v2:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=vendor-prefixes.yaml
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=arm/cix.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- Re-order the patch set, and move vendor-perfixes to the 1st patch.
- Patch 4: Ordered Kconfig config entry by alpha-numerically
- Patch 5: Corrects the Ack tag's name
- Patch 6: see below.
1) Corrects the SoF tag's name
2) Fix several coding sytle issues
3) move linux,cma node to dts file
4) delete memory node, memory size is passed by firmware
5) delete uart2 node which will be added in future patches
6) Improve for pmu and cpu node to stands for more specific cpu model
7) Improve the timer node and add hypervisor virtual timer irq

Fugang Duan (1):
  arm64: Kconfig: add ARCH_CIX for cix silicons

Peter Chen (5):
  dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
  dt-bindings: arm: add CIX P1 (SKY1) SoC
  MAINTAINERS: Add CIX SoC maintainer entry
  arm64: defconfig: Enable CIX SoC
  arm64: dts: cix: add initial CIX P1(SKY1) dts support

 .../devicetree/bindings/arm/cix.yaml          |  26 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cix/Makefile              |   2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  26 +++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 216 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 9 files changed, 288 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml
 create mode 100644 arch/arm64/boot/dts/cix/Makefile
 create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
 create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi

-- 
2.25.1


