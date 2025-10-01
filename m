Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122E2CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 12:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qb4fiDmivPN+lhrMNBf3LZoOLQ/mlggGBIbi1HNOft0=; b=BasNeGIcaJKXpAyWRF4s/+wQiY
	FSzLqc3qea/08MGmd/fUbpc0nc6fHECuKFic9kVLX5BA2EjwTHoeyYq7+Bo+VzJ8WslgY22SFVDDQ
	gZEpGPg/riKHdudfVmEwpzPicTUhi7hQWKybMNd45ML2HMKihMrkP3jg1f3JkKP3hDmMCFLwd62v2
	EVeFir9gkRd1O+NI/WqWffZfAVV5qSv/7VxStxKJIROMBvhHYvV5bJTWworZ5v15LpUv2OM1wzPOw
	c/pHQ3tsQ3L6cg67c+kTd/e2OjpmSeBHtMPWogBeDgCtlok9rPIVXmp2DA1joD0JaG+/OOS7qSxal
	rcj5lVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3w2F-00000007uan-3p5q;
	Wed, 01 Oct 2025 12:34:19 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3w2C-00000007uYd-3e0m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 12:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipGm35pYPfkVEOK+kArq6825Th66NPeIBPr+17KTH2wf5CKbEZ8NjHpMGpKbtMtqcunsTZ8+zOO4gqu3ZFoJUeWWZ9GrSxllZyosxxAAh8UKZAyxo5DcHUt6ZnUrOKde+I/1CDwEDbb/cYVWNemIzp46Kc9pdIbWsORw8tGaUNQfiTMucHB+A6iqGDTU/t9G9/fkB1CHEPKC/XYghLftk/cBsxMRq7KejQ7+tEBey9OcJaDYqe+xuiwFG06RKkwep4CgEld60YZkkaUaqZpF7SR92bQsDmX1pLzXvpFKOpRPiyM7fR92SLzI9ZwGtp3pqzwOXdUzUBaT3/WDFwm0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb4fiDmivPN+lhrMNBf3LZoOLQ/mlggGBIbi1HNOft0=;
 b=eYDeQInRlaE/f56v0R/drwf2Dpur/rAVWciycoFGKTT1fraBPg8DManEfN3ycHKqSEomwMhUijVXEORepZoYGiEnSziv+P4VTC0D+M6g0oHPlPIwLb9E9CaSWBBoVszzYW6xsSyqGmnj5haEQjTa/LS6idF01ftb5AEhBoCSEsRkkLNb45hiujSbafhD8secbJJtUka82WRF0CC4ANc9mgGC2CZSB9SR0Fd1Qdyw/21vHqvPzhAq/BM685TKs8HkY8MQd0NK9N9YnOWWLo8th9VboC+QnKqtOUE/im6PIB8nQ7rxKCMxMgZtZEdlq6HRnvT71S7SNfZhhSOSslmQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb4fiDmivPN+lhrMNBf3LZoOLQ/mlggGBIbi1HNOft0=;
 b=APzUPUAHItmfJ/y7xMPO9in9rgXgZKfVbwcwJ/l38+hsypYiykC8u0aNk1D0gYusPNHjgrBRCqSzjqZ2EC+eIhWumo6+SEEuxGj4hyj6ZI6h+S79f2rj89VL6y9DHYbEOkPKt+EsIzjOI+TWGRjE5FlMRFmwHp3wD2ehhUqm41UwI+PQRUomVRTbhloDllsFWYKGpZZj8RPpAAgVZx0jsg5lsBBMATaPFjU0b0oDns0LQY+K0fc1t7aqCHKmqAvqqpo6HooObNHVOHXLQJoMGW8cVEADljnUbdesua6y/A8mcXPdrYkoAPfrrpa0zJgShwhLISP4DgQ3GlIDLNx/dA==
Received: from AM0PR03CA0029.eurprd03.prod.outlook.com (2603:10a6:208:14::42)
 by DB4P195MB2693.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:5e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 12:34:08 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::f) by AM0PR03CA0029.outlook.office365.com
 (2603:10a6:208:14::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 12:34:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 12:34:08 +0000
Received: from llp-moog.phytec.de (172.25.32.44) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 14:34:07 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Wed, 1 Oct 2025 14:33:54 +0200
Subject: [PATCH v3 4/4] arm64: dts: imx8mp pollux: add displays for
 expansion board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251001-imx8mp-pollux-display-overlays-v3-4-87f843f6bed6@phytec.de>
References: <20251001-imx8mp-pollux-display-overlays-v3-0-87f843f6bed6@phytec.de>
In-Reply-To: <20251001-imx8mp-pollux-display-overlays-v3-0-87f843f6bed6@phytec.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759322046; l=5278;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=E2qrqZHUQ4Ygs+r/lhCdrCTyQpjjp7YBwJ440TscYFI=;
 b=F4BH2ogCp5tiUm/DzdrPsV/DghEIQzjyEfxrD7GZSpDZuB7KmTSWHpj7nnaAduntXknw0zVIe
 SLJScNht/WFDl5vN2kQXZEoyWG1hEf3xBqA6y+4Moowqh8MfBGQLfR5
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.44]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA1:EE_|DB4P195MB2693:EE_
X-MS-Office365-Filtering-Correlation-Id: 4217c634-9c17-48fd-c923-08de00e6d171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlJZRG51bW5oNFIvNm5JUys4UDN1bkJhOVBiT1RkS1FGNTFDdk45MnlJUEdG?=
 =?utf-8?B?RTBENGtML1llclQrYk91TEZVd0xwdjlwNlNDNlBpdFlGd0VlQmg0cTBJbU1O?=
 =?utf-8?B?a0owWi9EL2xZOEp2ck5wTTFqRlN2MmQ5R2o5VVRDMEJWeGVGb1RIOXZkVzNo?=
 =?utf-8?B?clp1Z1MyR1ZLbFJweDVKYUtiNUp2ZTB3ek40S213Uk1jQ0hFUWRpamVDVGZ2?=
 =?utf-8?B?WnZVa3I0cDdpazFGNGcrV3ZJcnJsMXFtenFkaFlyWWh2czhQbHZBbU0zdHk4?=
 =?utf-8?B?TTdaTjNDL1RjdTdhU3Bud2YybHFUdmlsblJQV0pLMEVINHA5ZXBVb09oYTFm?=
 =?utf-8?B?eU5qa1A5MTFWT2oycnhvdGdnK2dxNGpuSkw0MklDRnFrM1d4SytQcnN1dDln?=
 =?utf-8?B?NzRrVDkxbmdtcklzQ2FNaTByQXd4QzhxYVJWejBYaXc1WGh6NjhxM2ZLVmh4?=
 =?utf-8?B?eDhtM1VodEE4STJJcEJ6YW0xOVFnV3FYbE8rbjMwLzkwUVV3QmExQ2VNY3lr?=
 =?utf-8?B?bGxmcE13TDF2cVJ0UGk3Y1I2cTg3R3BYeG96eVVRYldHeFhBSWFPVzZDVWRy?=
 =?utf-8?B?RG1GV3B3WE84T1ZERlUzN1pDSkk2MUNPOHVuNlo3alJmWEloaTVrNWNYend6?=
 =?utf-8?B?UGcrTE9MVmt2US8zUTdkVFlFWEhqRFVRaURickxVaDV2bGJpZFZTVlN2OFZD?=
 =?utf-8?B?N0o1M2pJU3BUTERUeHFuQnArd0dPemdzVTZwRExGb1BQMGZNSTdKNmM5QjFl?=
 =?utf-8?B?MGpsQUxwcGFLOWpBYi9Ed2pnRlZBd3kzaEpNVWN2SWhZRkhmWE8rZVk5cGVO?=
 =?utf-8?B?aXNBSHAvb1IxWGVGMFk0NGlFckFSa0JYeldoUFFhRUNBM0Vta0NwdFBhbGVx?=
 =?utf-8?B?UWJ6bHNkNmtHQXMxcm5PL0VaVEZZaVpxT0U5Y0s1SnE4NWpjZlRGSk9DTi8z?=
 =?utf-8?B?Q0R2NUJ1NmtxMFRta2tQU1pOS2RSN21kY3BaY1FmWGVCMWxTcHNUbWR3bWZl?=
 =?utf-8?B?OStnblJOcmFFOTBzQWtnMHZmY3hVbCtLYktRaXZMRjZPUUg3TUZmY0VoclNK?=
 =?utf-8?B?dU1TNm5XVXpwbmJFdTJYb2YrZ1kyYmpnZGpCZjBCTkkycTNJRXVITGR1cnEy?=
 =?utf-8?B?WVg1UXZpYk5KSFBPSTgzM1BnR3BFQ0tMQ0NVOEdRUkRmQjRLKzlJSlhROXFR?=
 =?utf-8?B?R0YyeENhOVBCSkVYaVhoMGdIN3pzNFBiV0x4K0ZBZDRuYkFRNEI3SXM4aUE4?=
 =?utf-8?B?MlJVeWR4S2hYMzk3SFBVZ3IycCtKWUFHZlJUcFFYTDZzN0gvVkdhWGN5K0pW?=
 =?utf-8?B?N2F5TlAxRUs3NmdibHYzNHh5NmJBa3loTE1zTHZPRHJ2RFk3TUdENGF2QXQ4?=
 =?utf-8?B?M3o4bGZKZ3lDOUJOcnhHSjAwWVhnZDBnWVpBZGdPRUYrSGpBK1BETVJPYVVS?=
 =?utf-8?B?Ukh1ZzMzaUdKb3hVdk5XNW9UbWtmUGhXcGlrRE0va3piaWZMLzFhR1RvNzZJ?=
 =?utf-8?B?OWkxTzdDZlZZakM4bjR3SFU3Ly9QcFV5MVluTGp4WjhhUnoycU9qQlBjRGJU?=
 =?utf-8?B?aXExZEZPc0g4VnpwRXJnZ3F1K2ZwMkFMSnByYm5YcTlMbEpzdEk0NExJSkJk?=
 =?utf-8?B?WkhIYzdOclpWb3NRd3VzTkY5bWd1UUxBQk5LTlpNN29xZzVsbGVucE5SaGFO?=
 =?utf-8?B?ZWQ3RVhNaDdNdnVkejFFQ0JnZGpVcVQ0WnBwMXFBVy9ZZTdWdUxXR0xobUMr?=
 =?utf-8?B?OVh2b1QrU0cxbmI1VXFBQlpiVTdOK2UxU2xueE5qcmNNbXh2bCtneGMreWpT?=
 =?utf-8?B?MmpJc1dQa2dUZncxQVovZWR0U2FPVFVsWjJ0bXdUWHQxQnZKYm9lZzFpNmtD?=
 =?utf-8?B?S2pDczdlY21RcGZ1bEVVcVFkL2tIdlB4akdRUGExRDluQTRCWUlxd0t2VGJG?=
 =?utf-8?B?MHp6TFNPYUYyNVNHQ1Q3dyt1N3NWbWVWRVZWWUh2MlVGSU9NbFd6WmoyaSts?=
 =?utf-8?B?bGZ1bWhURHNHQ2YyaUdZVXZ0RmN0YU1wa3Y1Mm9DVlgwczlvbTN3TEcwM1Jp?=
 =?utf-8?B?ai96Y3Z4dm1lQThoTnBQRS9DUHNtL1lBL2RpeFB5NVFhQktoa2ljQ2JJVkda?=
 =?utf-8?Q?+3Pc=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 12:34:08.9107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4217c634-9c17-48fd-c923-08de00e6d171
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB2693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_053416_916967_4D55D69E 
X-CRM114-Status: GOOD (  13.42  )
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


