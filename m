Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750EDD358C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 07:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=obF9wKd55xzp32Pjvz9NZ6c5yJfMdESSGonk1VyCUEw=; b=AxcaXZIcRPxeKrZj5rDS20KmQH
	vHsfhoZc14WUNS2EgBY6iWEHETim6APBf+Grev9QQv7773j/EtpknxF2Jgk53RbcgPeg5g9toDZeQ
	vXuijMB2LguCBSPSLN0lcIjQzjQrAfBV3VK5+i1G61valUtKLpbjJgldb7XA9uRObcfn2yideii5U
	ec4NruOPO5VSTb/v2WHBx/Ptg8t2D8BwuKHNmXqIojubwmLu2qe3UnB7f1q7iOGOwypgT1Zv3+mmw
	Zfhh1fJ5HwnWFD7KcatEHsn66v0TNdZ2RLPy5+FCnI+fmfJzkudsz1D6dsitP4wa617tjAJxPci+/
	cbyz44DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlM1a-0000000HLhl-0nJ1;
	Thu, 29 Jan 2026 07:01:06 +0000
Received: from mail-koreacentralazon11023081.outbound.protection.outlook.com ([40.107.44.81] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlM1S-0000000HLeP-179o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 07:00:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKKhEh60CWmKwz68FPrYVTVYtjTLm0fuK8fh3AUxl2PgxUAQEZ9xnHSWdm1jPJ9nOMTC90DqxBPp5KIVsHp9k0D7BThf8as3TFPQ3qBYcNqz23hNv82Mem3RY+fp/SAipY1MwU90pFjxjye3fa3kgSxjtSFK/GE6AbSDRXUmZvulCdYX6HD40P99NQuUqtLaMpTkpHnu5o+dZLIjwoRFMCpk6T8R0bIrZ+m+qT8BPiXvqPsSeFe+tlozjtgwy5qNWZ/PVsH2gyNJUJay24JCkD9lNqRhNTmAPzYDVs5Mgmg3g5CzQVc6X+Z5/30hLfVEwo5EzwaWS660OuOKK8ea+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obF9wKd55xzp32Pjvz9NZ6c5yJfMdESSGonk1VyCUEw=;
 b=KBvXtUteeziUQ5bLezPkOmSJJbz7ELndlUu86t6awbVZFx6VvdF214TuLEb6PRco+zx+Wsvgd0U73mdmkcftEYDXpYqlEiEbPDZ+uNg16jWDGUaztpHuWAf4fKRFjQJNpOS+DW/AJYzvXFwmD4gFO0NrzzdPjPc5gUooOjkU011QI/mb9LlnWLDeTsBb55GTpwF+2/Fh1RyEP3avcDI6DcMg6+KkHXjk6ujkyEU3DwTOidQRpxZfRd/EDeQSGqThrxvctz88/Yctj1/Dkcdf0l2970j9KxfcFKEglDrSxiiMS/V93rWAFVIguKboW1vcYHei1hhjYsJD+0kT4LMpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2P216CA0136.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1::15) by
 TYZPR06MB6857.apcprd06.prod.outlook.com (2603:1096:405:1e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Thu, 29 Jan 2026 07:00:49 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:101:1:cafe::20) by SL2P216CA0136.outlook.office365.com
 (2603:1096:101:1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.9 via Frontend Transport; Thu,
 29 Jan 2026 07:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 07:00:48 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CB0754350705;
	Thu, 29 Jan 2026 15:00:46 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v5 0/3] Add support for Cix Sky1 resets
Date: Thu, 29 Jan 2026 15:00:43 +0800
Message-ID: <20260129070046.2601503-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|TYZPR06MB6857:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5d5486d3-d565-48f2-237f-08de5f042200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ENhbJ8Thoo7N0+FuMxmc4MLefT7fwIE8pp/zOAn7MTxF637C9/a7FfFGAL89?=
 =?us-ascii?Q?hWixUpksvZXsSzH4k5y7Ix0YN4JiobLXSLaC7Zek4gmwpMjA9EXXgEW6RhXb?=
 =?us-ascii?Q?prg3ipUA17Dsm+BLDYrOrjMUEJxur4sZbYUZV+bgmhp30jFK1tFetBrLA45k?=
 =?us-ascii?Q?dH5GONqQVZlDvXoof8ONJs0AiZKmROuKSMgj33QMUqZ22TBZe581q6+RHuGu?=
 =?us-ascii?Q?gCQsbUV6Sy5cOEeobd6eGtLwQc8hDwfR1w5aPF7yefNgDV86ioHvnUd4nhZe?=
 =?us-ascii?Q?f6bzR5HwPmXmRSYQYcqE6CXUQog3w58Lhjh3xsUL6CVzbr3bXM0UQvhI4jSM?=
 =?us-ascii?Q?ARsTZHM4IVKmq97Wi+sYIHR9Y1yG0YgHwfd5DngdfS8fCSICvNCauU4ygXRn?=
 =?us-ascii?Q?giDjdTCEX3pzSjd5jjx93eqF4fGkxuxi305DQUkcmYnjK4OyJqpfoQIP1zH3?=
 =?us-ascii?Q?DXqKRCQVfhPxNsNXiiiXmtf2EQQKKGY0fWFxJc8ckyuwJXpe0boY71EZ8ChZ?=
 =?us-ascii?Q?CkgWTBLDRZtozkuUi6YtUlw5sTAd8Z2IF1hCw1LMvLFSyO1NtNz6/aw+4YT9?=
 =?us-ascii?Q?NGdpcKZpyzJVwM66he/7tfInqcK+LrK8XB+BjEeiuth+2ef4cQfs0hL4FlQ+?=
 =?us-ascii?Q?vxYAj/pY/JDasaj1nNYT7dAjQfripYkHbI9FNDWTkVc75k3MSG2BL7Xzrm2D?=
 =?us-ascii?Q?XWg+AnjxAFR03AZAcvF1k6AtS+K4DAod7CUNY3K9Ljfc7BgGqB/N73rr//mg?=
 =?us-ascii?Q?GEFSJ4WWNXWUzrwJly7pLrL2oKfQBVzF2jJYVtn/vIAalPeNdvLne8hqNPb4?=
 =?us-ascii?Q?M/a2qvu8BmLO03MalU1z3oASrYz5tJm3Cd+FqV1TP0knshm+2e4OWdkVgoT6?=
 =?us-ascii?Q?bcKid7Nc6NAOy8Z6g5jXxVLub8ILu9dNXF2oHsRhUNppqdB0hqJLqtY1a/55?=
 =?us-ascii?Q?IXLgQYc6RpJ/8eqxyziXeifqybHM7pLygYz48UG+KffC76z0x050xLBKSxM6?=
 =?us-ascii?Q?SpLzFo7JumS5s+Oy2OS+k3IebTj4thdH7qLljbskl1JGca06+hhKGeAaG2rd?=
 =?us-ascii?Q?znkrPmmjZBfDwzJoXbtryYP7nN/x54mRD6Hka4V0FOsy/98AL+HeoTF+oFTU?=
 =?us-ascii?Q?IPaPe2uexqGtR8Gc/ziGE3X6Az0ALRlJIgrk8A1+3xlVAw5m89GiykTF5Mdo?=
 =?us-ascii?Q?wx726Apuropj62ec9WAbl2FX21V+UHwDaNCmKrqfNJuzGjvEXhhOo+blYBP5?=
 =?us-ascii?Q?ho5pwfpR5hr9puBrfjizxwl//+DBdF+w9deZBLtpaMROYDHaoUD2W2Bo7vID?=
 =?us-ascii?Q?Ec5LVODDH6B7o7pTWWaQ1vGDfVDkuKZIcwM1H3s0Ba9gqeo6EmVRf6WO5b4G?=
 =?us-ascii?Q?0iS5xHbc7XyfqlLSysqRwjx4SM7P02+uYxQEkC2B+7OTSr/9octrmTFwYZ+K?=
 =?us-ascii?Q?rbsMrMQienDvcAIvx20Nj0kDvdSQw2tLYk4xRInPoxgw8A/JtTMHwUgF1f1C?=
 =?us-ascii?Q?Hw+F5dFZFr/zHcn/dD/ZnG2HT/mvHjzxKfmZsT/uYKwacrLB/zJ6RnAcbCQI?=
 =?us-ascii?Q?lgmDpYp3AuY8vzzHgmozJVk38uzCm60eecxcOhdTjSZcrWxMsyNEM70j82uh?=
 =?us-ascii?Q?sXs2QGih6yJbj2KcQj+wPgr0DA2VlFVXrG9RNtUlUGjzA4xryz6L/hV9lSE0?=
 =?us-ascii?Q?H2qv7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:00:48.3954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5486d3-d565-48f2-237f-08de5f042200
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_230058_308300_12FC1B3C 
X-CRM114-Status: UNSURE (   9.94  )
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

Patch 1: Add yaml file for Cix Sky1 resets
Patch 2: Add driver codes for Cix Sky1 resets
Patch 3: Add dts nodes for Cix Sky1 resets

v5 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-controller.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine reset driver
- fix dt-bindings style

v4 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- add syscon
- refine reset driver
- fix dt-bindings style

v3 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- remove syscon

v2 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- fix dt-bindings style
- refine reset driver

Gary Yang (3):
  dt-bindings: reset: add sky1 reset controller
  reset: cix: add support for cix sky1 resets
  arm64: dts: cix: add support for cix sky1 resets

 .../bindings/reset/cix,sky1-rst.yaml          |  41 ++
 .../soc/cix/cix,sky1-system-controller.yaml   |  48 +++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  22 ++
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sky1.c                    | 367 ++++++++++++++++++
 include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 ++
 include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++
 8 files changed, 692 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml
 create mode 100644 drivers/reset/reset-sky1.c
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h

-- 
2.49.0


