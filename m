Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC086C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2v3dLiYD6an0fDYWVVCs7eGZl8kILwD/oLGMz8Q4a1g=; b=jUnVCJJlhtbYePQTRLFbbHnVWJ
	pUdhfydgwy3zoxYn27UAA5HBxKfOWTKVekcSyPaRNa2QSXWw/HOVicEPoqHzDagavTj78muLw9+2V
	vQq66JfszjztI+1PkuIaECOaIei2KHmeZKSMuYPUwpQX2IEas7hdml9uFOUU6yeNoasXmozEjnH99
	lLwx5fHqw1XM8vwhKiQq2bycZDPrMfBWOl5pHyUyOTeJzRksUGO+uoLfuViucawc8L12KbSD8NpMe
	anJXbPLR1Fmi8yRbIQPaCRsLZT4l5zFf/+1jnBKgGZ3ccA2hedc3SM+rZetLhX+T/SOgunPBiToIN
	66Vz++/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfELu-0000000HXIK-1vUq;
	Tue, 04 Feb 2025 08:32:14 +0000
Received: from mail-bn8nam12on20629.outbound.protection.outlook.com ([2a01:111:f403:2418::629] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEKY-0000000HX7v-1t0Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 08:30:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4we+Y9feBe8rgXzg/1PBlNVTZYzOWeQs/bj2fINZ4+qwK0+40Wwm3OUYX6ol4/XPqT4e3vHnabh3YtXSSOBdp8pwN5m+Bd9UCAPfEIsoNLfXkhqhXSBDtjFfn2a5tSspdtpT1UFLsUU0RNzhSnnJmWxEIdtPKuu8j/s4p+weDAihu1bEZ3CKmAak2FteacD3JhyTMO3h/sJvOxGytW9xMOgebJuwtZ5Vzp/xe980OABffZDkISXnhZHpMcgtkEPGSXR3DWoXN3Wbjdi+AMgDCuLpsJo9DZYIvegWpYE09oyfz6kMhLipHqnmIkVBMCwIDivcFW1dDDLMlsofry+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2v3dLiYD6an0fDYWVVCs7eGZl8kILwD/oLGMz8Q4a1g=;
 b=NZaL3f8ke5JQf6S4tkhVC16W3FN1zIODxEgbON3JzbLIiq9tdjLW+kNjq6R3LtBYpO34AUbNFt0e+GjXkF1Odwz0l5ERo39fDV8gxpQrHr7loQEQ+gS3DrEcHeeqGMMYPZlvFoW6BSXrkKY5zAIag8rjS5D2f9aSWEav+oGcgApBxm/mUsxxwQVC5yrDubkLNYQXwPIZtie8qPPyjuaiQ8E6gBr8KGzApsxsigiIXoQ6n8OiiMXZlgBAOueb2eUIP6m3CRMJ40VKApyKifOQ94Utk10uH8OymCXxZ3EevnC6jPgu2mbNTYH0HI+xzIHaJsfAFJ/Y7g5cCK6Bd9PFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2v3dLiYD6an0fDYWVVCs7eGZl8kILwD/oLGMz8Q4a1g=;
 b=ut9NOAtYN1JwCtud5CB+ITUEonzQ0TPgXYCiTQ75Thj9i2gS9oJOi9NvpJJqjtVLh82u29MUofA2Mkh7Pk4qB7ZNsEchKLllVGbYKZoVtzVIby7aJ40IUbaeVbASL19PJlKTdMswxrgOKFJosW9o9E+Gf76+RwV18ilyIFG/OZM=
Received: from SN4PR0501CA0011.namprd05.prod.outlook.com
 (2603:10b6:803:40::24) by MN2PR12MB4125.namprd12.prod.outlook.com
 (2603:10b6:208:1d9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 08:30:44 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:803:40:cafe::10) by SN4PR0501CA0011.outlook.office365.com
 (2603:10b6:803:40::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.26 via Frontend Transport; Tue,
 4 Feb 2025 08:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 08:30:43 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 02:30:40 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/2] arm64: versal-net: Add description for VN-X board
Date: Tue, 4 Feb 2025 09:30:31 +0100
Message-ID: <cover.1738657826.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=michal.simek@amd.com; h=from:subject:message-id; bh=zcUd6ZGAK5lceQCkrXB4KHd4SzFnEBp5Y2OOPlYKA2E=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvSFFzQu83yO/LO4OOKc1VRL1T3XHrdEBAevkw3fe/Dwq 8gnkz5ldMSyMAgyMciKKbJI21w5s7dyxhThi4flYOawMoEMYeDiFICJmO1mWNA+b6LOt8QvPLfW KO4+7vj+zh4e3TcM87Tv2n0z6LuY3ZQ+X8NjsudDrcgVugA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|MN2PR12MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4be0c1-25fa-4b03-32ea-08dd44f63762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Cl2v7gkAJmwCQKLsOzDk68cpE5QTh89XS5k9+m0exvSKeAUREt+VL/NmV3l?=
 =?us-ascii?Q?MXHHozG9pFdrPo5vKHj34ROffJgeiV0f6OnLvl1jorva4X70XMP47qUaCDVs?=
 =?us-ascii?Q?qsRV/ePkXY07RWWNwxiJKA3z2OK4EPNzZQ9Dlc9cCjm9xCqDYSXsiIcFD3KZ?=
 =?us-ascii?Q?d9JRrgf1ZN5yK8FC5BnZC7rOzAWf2KQea2lWE52I/1hTXe1SkbleH8fzhgIQ?=
 =?us-ascii?Q?TUPe8JEjXTSumZ2uWdH70yoA2j3YavQWIUkci4HUCYpXHbKD25z3DvmNZFwP?=
 =?us-ascii?Q?gq4dKKURrRUQ0UEcfu2TGCkMeLLJbi70ldaTIA/hJ4hZkr8jK/YHqHZemaMx?=
 =?us-ascii?Q?hw++f0D0me0doshSP2AaJDYBqC9aREeGkUIp4v3sCYfEHiC21oXLc1PjYAv/?=
 =?us-ascii?Q?CKqmquEEAM/Hi2K7d2XihXe4naPMnF5VCZX/93rOAOn6eM7eBTF8hX6uFZqA?=
 =?us-ascii?Q?y7ToWdWlkFZ+HyigbWVzt1JaTxvwgL9gTVaHeSt/7VlmphWmnDBpd9tMacys?=
 =?us-ascii?Q?h4AkDjGx0vZDQS08klSGw8uZV4PYp/novrl3yrxxPYS9zwQQymZtITDDhRP/?=
 =?us-ascii?Q?uLrRkugLl2s89RZ9to8HZCeC7hUTnplAoOuu0wWjmrNLM+KzfOez10HrcVog?=
 =?us-ascii?Q?X3L2jORQT834Vm+53v9tBwjPbLZBn7LvavAY5oSal7Rd7499JK2q2IJKMdU4?=
 =?us-ascii?Q?0XQJBPXwE1fMhB1Fjr8OyRUIdsd1HEKVxsJtW+XABxhGTR6Z3U3XWXIFCJ0z?=
 =?us-ascii?Q?wuNDl6LFttDj6elMbcu3XnopSCLJmAUFwjlVN/xFpepCDjqNbk2NPCpLlzN2?=
 =?us-ascii?Q?FIeckXqIRG1P1++pU/no+fn8VBkzsSChC4e5AZNwcUGLuUh4rIY/zeEOXA7H?=
 =?us-ascii?Q?psu0RoXS/kGhMqaQ0KHmqWfrFdtxcKBTylmR5bjE0xZLuVbCWG4Nv0nz5u+8?=
 =?us-ascii?Q?a+UiVdE4itSGLXCuAiylbzmaSIWRa+HYa0CXHnZji+zhKZp60DLvKC+tma+V?=
 =?us-ascii?Q?Gp7RuiwneexiMp36/y4JyNSWUaYYwCx0hWkLQF3bUiK8DcxqUDPIKhrZn88v?=
 =?us-ascii?Q?QMJcZYOGaSqGiKeFbU32kbH6ncNG4cSawAyEF9yITNT/1cDUZRDYvOuj1ro8?=
 =?us-ascii?Q?N7dS7yNj/borCvcBfJHA2zG2WOTgo1kN0/fXTy+e/kFYArtpAnkZ8gotq55B?=
 =?us-ascii?Q?WEvnNTqnL/GSziF97GJWqMPSX1YR3LSqT78twUjnjr8kZ9d06CSGmb7PBgOG?=
 =?us-ascii?Q?V+Uso7MmmwGfgRtgYE1t3TUPMIkjqjLfm5/mWNod5Uh/uPb6SSkIk2iSEkf4?=
 =?us-ascii?Q?g2Jes9gP9UgNIgzGPAlq0c5RuzejSm9SmaFfWLML37SVt3Vw1npVi7zBB0qD?=
 =?us-ascii?Q?b+4D/vn4PynhrfVq0o04zuVAFjZpisbu9HF5WS9Daq8GYAn2M/AdYXy7RcPs?=
 =?us-ascii?Q?08K65PAMEgNEInC9VBwoBT7UzAwEn1+z3ybm/5thA6O/wNqccBLHnnJgcQcD?=
 =?us-ascii?Q?nnFVvjYvk+x6kpc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 08:30:43.7523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4be0c1-25fa-4b03-32ea-08dd44f63762
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_003050_570710_2AE3FE9C 
X-CRM114-Status: GOOD (  14.41  )
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

Hi,

add description for VN-X board with Versal NET SoC to see how that SoC look
like. DT binding patch was sent already as v1 but make more sense to send
it together also with board description to see full description.

v1 of DT binding patch is at
https://lore.kernel.org/all/20250108113338.20289-1-shubhrajyoti.datta@amd.com/

That's why this series is sent as v2.

Thanks,
Michal

Changes in v2:
- Remove | from description
- Change description
- Update subject to match VN-X
- Add description for VN-X
- New patch in series

Michal Simek (1):
  arm64: versal-net: Add description for b2197-00 revA board

Shubhrajyoti Datta (1):
  dt-bindings: soc: Add new VN-X board description based on Versal NET

 .../bindings/soc/xilinx/xilinx.yaml           |  11 +-
 arch/arm64/boot/dts/xilinx/Makefile           |   2 +
 .../arm64/boot/dts/xilinx/versal-net-clk.dtsi | 231 ++++++
 .../xilinx/versal-net-vn-x-b2197-01-revA.dts  | 116 +++
 arch/arm64/boot/dts/xilinx/versal-net.dtsi    | 752 ++++++++++++++++++
 5 files changed, 1110 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net.dtsi

-- 
2.43.0


