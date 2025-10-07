Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA21CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qb4fiDmivPN+lhrMNBf3LZoOLQ/mlggGBIbi1HNOft0=; b=m1NjQn1KUQbGFyftyu+UrTZA2e
	dmnIRA2Z7+lJLMKsVHNiIVwZnbQtQ6zPxiSMc54SByDDVVkDwIrjHl7XJEc8Pb4+yWUvLVrEZky2z
	j0FQYksuu9fRdQCpYk6K74oLWWPkVzH01XKWCQ04X5NyA8hexzrOTuGVrJnhWC/TsXIFxSu7+q2/p
	dpfALi5sL2C4nG9yaKAQsdcLWyxBDthJfU05dMl+REcjBt1qNbexAZx+Z9QrJ1mty+GsezO+ZBVv3
	pG7162VOd59n06NvqhW3D2b4CZkxOF3NHRwjJXCBBT6bX9erQ1dvPaBAFFu0ln7Pl4fcIs43rDb8Y
	hLil+M4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62pb-00000001W0K-2IaY;
	Tue, 07 Oct 2025 08:13:59 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62pZ-00000001Vx3-0Lzr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncQMRzEjHCemV0WhDW1ILRQAjUiAceIQccXNL6e/grBJlhyWf0SQSRpH65amqgVCRs/5/bvBD+/e3iWui3LwRFikVs88b6IYdvPn2kDLwPScHppi7XBM5o12X/IEJfXAsSr7clBO6yzg0VP15T4Ud7WYnRwrVcePJhtX98wMASqt04N/zdWoJlNk847l1NieiMzzo+NTp6fTUMk1aID0GpZb9KATNySMLR9jkQHWvGaHhx5sGocxg+E3AnKI9ZmWW5ojbZFVqRRdEHhL3a///zHgCjCiTEH9G1VNg6fFm8Ch9lo+myEA6/urRwlNxjXC0hYABJFu8+7NeB3XAy4FyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb4fiDmivPN+lhrMNBf3LZoOLQ/mlggGBIbi1HNOft0=;
 b=FQJksv8qCguWRxnr5z6XiQcUX9veIXmQcCpzgq0QfrlNS3er9Bsg5cSi6Afzy7QUnZrwhuZIDgGs03dGV1EHjE+VHbN99nSariqFUV/X4u19FdpY30rXYkZjOZ93cQZX3cLH7jdEmfr4HWu/rC/vHZnLrjopJeqljS8pp1Lq4eMQ5CAqVVOBdYiE+dczsGVJOOYqZRCL+WJp6MbhghBdgnrZxR/ipN3j5XgZvLkBTmM0yyxpwyxbsLpAXVDlaibfpdoW6ygq3nYOIeea8+cnX2vdGpw01bmsem3Be7Pm8G7LmzVapk1FY31eRqVzKFsRyLvoCtBW4esX5HmXccuvWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb4fiDmivPN+lhrMNBf3LZoOLQ/mlggGBIbi1HNOft0=;
 b=L1jg0JTe/BtCHZQIac8TvRXxEam4uSn2IxO7R1xwrP1nY/T4xjbxlVGB4cLzFA3VKQ25MAxkdXNE1X3p7TsYlDnZ6wLP6rVP08DYCuqBn5xbd5wF1HT+RWeYTjn8qXyeL0VfHOjAViKT+zvKcx7D4NF/cb9ZUE0W7l8zTexeYj9mg3EGYY7s+7F/TW3tDZqOWZFl11axeOGmdX4nUuI4nQhB9JoGo3v4Ga6JtjWZPGxDENWBElrPSj1nAmQC5Cl3FdA3vIpV8GrdQ4Uf3fsdp6cjanKAO8J/fB5JzFAQvlKiY7pLbGbezi8TtHLfePbMAID1cxljAWJ7Ny4f/c/sPA==
Received: from DUZP191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::17)
 by GV1P195MB1810.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 08:13:44 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::7e) by DUZP191CA0009.outlook.office365.com
 (2603:10a6:10:4f9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 08:13:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Tue, 7 Oct 2025 08:13:44 +0000
Received: from llp-moog.phytec.de (172.25.32.44) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 10:13:41 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Tue, 7 Oct 2025 10:13:30 +0200
Subject: [PATCH v4 4/4] arm64: dts: imx8mp pollux: add displays for
 expansion board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251007-imx8mp-pollux-display-overlays-v4-4-778c61a4495c@phytec.de>
References: <20251007-imx8mp-pollux-display-overlays-v4-0-778c61a4495c@phytec.de>
In-Reply-To: <20251007-imx8mp-pollux-display-overlays-v4-0-778c61a4495c@phytec.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759824821; l=5278;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=E2qrqZHUQ4Ygs+r/lhCdrCTyQpjjp7YBwJ440TscYFI=;
 b=Fn4pZynaw/ZrtFIM6V/6QA1lPnZZpQsvnYJ7dfIAlWE7z+8CCT/b8mMvGhEQDo/dF0UV9G1X5
 oIV+9vIA9O8CTmdAdm68Bm3sGsMQNzFmjsKDXbnjv7dEy0vtvEm8iAC
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.44]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|GV1P195MB1810:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d278145-9449-4bd9-0ac9-08de05796f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U25KOG5VNzZaNzY5ZHQ4aGxpM01GbGhDNmRZWE5HN083WUFJM1M5aFAwSDN5?=
 =?utf-8?B?VFIwM2dsbUQ5aXV4WjZBeVpRRDNkVzlURlY2NEJJREFkZjI2VHJRVEVsOFQ3?=
 =?utf-8?B?WEhDVWloVjFaaXFTTTUyQkdlN1VGNStPR1dJSmdnQytIMy92cFJTZ3kzbDR3?=
 =?utf-8?B?UFpaOGd4Vnpnckx6amlBaCt0bTI1NTBvYjEyWUQyR3d2RFg2cXhYTUo2M0hU?=
 =?utf-8?B?ek1HY3dIQU5kdDBvd1VxcGwvR0tSV2ZyOFltMDhoMlF6cnZCc05jVG9zbjQ1?=
 =?utf-8?B?UDdEdU5MaWxyQWR2cXAxUWFadFRhazNjYlNRNXlWZy8wV3R1L0FoS0taZDlY?=
 =?utf-8?B?bHkvWmR0YUR5ZGpkdjhWYTJVWjhPUG9FVGxyNHN2a1JuTGwyTkhXOXRoaHIw?=
 =?utf-8?B?N3c0bGxQZXVSUHBmU0xKdVd6Q2dDc0lSZmVnb3FTbFYyT0VCV01WMEdYM3JR?=
 =?utf-8?B?QWViakJnWS81RngvNkFEQ256WW1raG9pTnNGd3ozN2tkaUJWWFBWZHpvWXNC?=
 =?utf-8?B?bks0TjVHNllJd054U0lNYlFxMkNRRTd3ZXRWVGYrN0dZZHJPcGVpZlM4NDJo?=
 =?utf-8?B?K0dyUFhFWjR4eVp6eHZ5Uk9PTlhYTkdNVHpSZEx0eGUrR2NlZGRhajhHU3Np?=
 =?utf-8?B?V3cwclhPMDY2YllzY2c2VWllN3I1WlpDZTFyK1gxdmRHK1UyRmxNQ2VyQU1a?=
 =?utf-8?B?NmgzN2EwZnFyZUczQVdOUnZmUDh1MFVjOFZyR0Mzdmg2ZkhtSGRwZXQ3M0ZY?=
 =?utf-8?B?bEhSdDNKWXlEbFZkMjY0OTVtblBVcThXNmlId3JMQ3NDSXZ6QnNGMmFqZG9l?=
 =?utf-8?B?aDlhTkZSZUhxR3Y0WXRiNExraDQvNnB2RmlBK0R6cDB4bVgxZGZnSkhNSjRH?=
 =?utf-8?B?UkUzWkt1VjJpMFQrSXhQb2lGUW1IZ0ZIYW9RUDJUckQ2Z2FhM2dmRk4wOHVY?=
 =?utf-8?B?MVorSDhCMW5YbU1Qdnk0L1BvZ2FmR1pFcnhrbVdWVlEzNWFBT1RQc0lVRzJw?=
 =?utf-8?B?cVhvOEJSNkpzVGN2YnVRS3Q3dTFVWWtXT0YxMWtZK2Z4clhnNjdVSlRLR0ZH?=
 =?utf-8?B?T0pKcGp1OUl2RUxJdzFJRXl5aUJVYjlOMm13cGJWSXA2TFpabVVkbzBXMWg3?=
 =?utf-8?B?cmpaNC9JUURSejNZVi90OG1aa1F1blJrRDJ6eVNPaWRyOU1waHg5Uk1aR1pp?=
 =?utf-8?B?NVBZN0lqL3hKTWJrRzJ2SjQvNE5mSmdtTnZZVm9pTTBFZmRXUnBsRzFrMk40?=
 =?utf-8?B?UEkxL0lBUHVPWlNHVkYrY2c0Si92NnpTcExrSzM0N0V5ZlpVTUJOQkhiYTJU?=
 =?utf-8?B?NVVscWlZdndsdEZYVFJ4dDQ1M2tHNXJTU1ROeGRWc1ZvSUZxRGJqdDg3MHZ0?=
 =?utf-8?B?empZTmtyelk5Z1R3WVpuMERtdFN1RmUvYzVGWXE0MUpidXF3U081anZ3NDlx?=
 =?utf-8?B?Wk4rVi81U2lsVGpKd3ZNTHI3Um1JZHZYU3BxN1RxRi9rL3lmYWNxMjdaSmlV?=
 =?utf-8?B?V1k0c0J6a2ZKVTYxaWpVTCtabzR6VDVaNHBjOTBEYzhHVG8wQ1E4NXN1OXRk?=
 =?utf-8?B?K2p2dGx2T2hoRTZtVHJCaXZrSDFzbVBtVmhhcEpPOVMvYnJhVUdrczk4MmYv?=
 =?utf-8?B?M3BzSEJKcWo4Zi9MZVhRY0hXRVBkK0I1cGtzWW5rVVlOMEZISXJoNW1ZVktN?=
 =?utf-8?B?ekdUV08xQjZ1Z2pFUlpKNG1XekpFSklka0FLOUdmTElocFhUVWwyWkZ6THg5?=
 =?utf-8?B?bmJZR2o5blRXY3ZvVXo2c2NhczJXY0tENXVOS2YzTTRaWFB2bWtXRUdUUGVU?=
 =?utf-8?B?VTc0b1R6bjBpb3F1R1JpU2pWSkJSUGdVSTFRZE9TaU1YaytHaVY4QTFJYXJn?=
 =?utf-8?B?eXFVV0FOVmV2bHB2em0zbXd4UjJ2VWNwTHVpUnBNb2RnQkZONFN2eE50QW5I?=
 =?utf-8?B?c2xpaWo3enVDRnBOa0lwNVQ2WmpCdXFCT0FibUYwZnhPQmVueXp2N0RZUk55?=
 =?utf-8?B?c3dOWGxtWlNnQjdiK3prcTRLZjZLVDBQZXR5S1ZwTXhlajRyU0kxZC9US0Uy?=
 =?utf-8?B?VzhmRThkREtMSFhjS1B5alQvSk5lMFdOV3NJZXFCdnRDV1puUFBDRGN5U29j?=
 =?utf-8?Q?mhsA=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:13:44.4705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d278145-9449-4bd9-0ac9-08de05796f0c
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_011357_174538_D197C591 
X-CRM114-Status: GOOD (  12.84  )
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

The same displays that can be connected directly to the
imx8mp-phyboard-pollux can also be connected to the expansion board
PEB-AV-10. For displays connected to the expansion board, a second LVDS
channel of the i.MX 8M Plus SoC is used and only a single display
connected to the SoC LVDS display bridge at a given time is supported.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  6 +++
 ...mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso | 45 ++++++++++++++++++++++
 ...8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso | 45 ++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 9c121041128972d2239e2cc74df98b0bf7de1ac2..e4b097446440f41785dd1a0e5d354796e800ee76 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -222,11 +222,17 @@ imx8mp-phyboard-pollux-etml1010g3dra-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
 	imx8mp-phyboard-pollux-etml1010g3dra.dtbo
 imx8mp-phyboard-pollux-peb-av-10-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
 	imx8mp-phyboard-pollux-peb-av-10.dtbo
+imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
+	imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo
+imx8mp-phyboard-pollux-peb-av-10-ph128800t006-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
+	imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo
 imx8mp-phyboard-pollux-ph128800t006-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
 	imx8mp-phyboard-pollux-ph128800t006.dtbo
 imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-etml1010g3dra.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-eth.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-basic.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..aceb5b6056ef1298ad9e105e673c7ab403411ab0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include "imx8mp-phyboard-pollux-peb-av-10.dtsi"
+
+&backlight_lvds0 {
+	brightness-levels = <0 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+	num-interpolated-steps = <2>;
+	pwms = <&pwm4 0 50000 0>;
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/*
+	 * The LVDS panel uses 72.4 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
+	 * 72.4 * 7 = 506.8 MHz so the LDB serializer and LCDIFv3 scanout
+	 * engine can reach accurate pixel clock of exactly 72.4 MHz.
+	 */
+	assigned-clock-rates = <0>, <506800000>;
+	status = "okay";
+};
+
+&panel_lvds0 {
+	compatible = "edt,etml1010g3dra";
+	status = "okay";
+};
+
+&pwm4 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..559286f384be452f1c953689e03249fbea24fac5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include "imx8mp-phyboard-pollux-peb-av-10.dtsi"
+
+&backlight_lvds0 {
+	brightness-levels = <0 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+	num-interpolated-steps = <2>;
+	pwms = <&pwm4 0 66667 0>;
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/*
+	 * The LVDS panel uses 66.5 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
+	 * 66.5 * 7 = 465.5 MHz so the LDB serializer and LCDIFv3 scanout
+	 * engine can reach accurate pixel clock of exactly 66.5 MHz.
+	 */
+	assigned-clock-rates = <0>, <465500000>;
+	status = "okay";
+};
+
+&panel_lvds0 {
+	compatible = "powertip,ph128800t006-zhc01";
+	status = "okay";
+};
+
+&pwm4 {
+	status = "okay";
+};

-- 
2.43.0


