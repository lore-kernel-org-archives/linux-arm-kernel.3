Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96923CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjCIyFtFHi0GvlKPxsqA+2/T7h9cBoLwjmbGkPRIDN0=; b=XOgeojRl5yykG63RXcexxCRMf9
	/aq2VcUqtWsRXjHnDO4A//6ll3WiXbZVHlQexF4OnHVHwNlUSz0CfjNuT5gzPHUcfjbCeERYvBNQH
	M44OZgo02mjpSVhTe/sz1f6pO1BhnU7E20IILYIWAWW74FeujmNi6xUssxWmYiO77TLAU73Qgtl7y
	CLybfYee54souKDHQADfJkxfnOWOlMLP19XwsrZ+qLcFazyfCzJcI0nogIlqPCV40HMNETU2a7YTF
	JRPbWwhalWvsmTRkEUaCdym+oYH25svuSkeBU3ILBu+nHYjJsWYADKR0cImeIg91o8b33ux2wNYJC
	oS0sCuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3w2E-00000007uZd-01PX;
	Wed, 01 Oct 2025 12:34:18 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3w2A-00000007uY3-0CvM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 12:34:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oj13o822oPQhRjoOPUKx8EGKXhoSbkUzSel+Wzs5Q31gHQ9qqPwAUVtWiVfQPHXMBj73oPWOxVIoB9Y7MzQuFFwT+W5AdgYlNxWIZiqk7vGnqpAliBb6co6Nzwll5ThSBeXte/i+BHnBeIPX2WbvEJEB48QRLdIgKfNke2c0U3f3QF2pxNgYfNvfu4ZUy2ahoVXyhK5lfrjhbI97rfDFXk0tEcuhBlltkiFFmZh2SCnuvrAdm9pING8tfI/Bx00C2NM71aEuQbBHouib22wzDJMAAAmAuz+bW0CcSjwcv8diwF+76s6KH5zZHef4Q0WOvhzfUov/FX6LZATHz4+6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjCIyFtFHi0GvlKPxsqA+2/T7h9cBoLwjmbGkPRIDN0=;
 b=De5HmsWl6IyVkSxurGpEqdxM4Fvv3N24QsNU3iJHrTsb+g+h+EQReT+ixE8Z4wyf7Xn9t9PGb3evKingCXhrRQlMEBCGZRAoq+vDRizru6auZsaTrfiXIG1rVybg/n/3d+zsLptmfsL1LLyXP+yt4sjQp8zy99VbZZLU01XWNJk6U2QRhugdXZz4qSWwuf8X2Noc+4/jwtzrgj4nvO3O+d2TnA+C1WKm3Edr81EqJBjFlK+tjbrdtFcnx29El4HXYvLkWNrRkRdoZCjn31ROdOQWsPjg0VdZ5R4cPXDr/C5Qo3+VuBrsyub8Ql/sq2tkrzb4kjZBbJRoQ6pdI77RPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjCIyFtFHi0GvlKPxsqA+2/T7h9cBoLwjmbGkPRIDN0=;
 b=NvIrx1MMi/xNeLcVJephaVxjslXUksGRj3M9+sAbUSZ9OHmdjcetaYbK7OTVa4J8yEwXCVpK/74Mk3C7ljWodCodPkW4YtlbI/vsH3FRAWq/DoE936WVfoAzoHVC6E2YbmXztbjgdVjqfgkaTrJ4y1S6QdR4orR88QLB209ZHIIdg4vyAdiYavikEEwJBtd1NmpbZKUkwF9AuqM/I3IPWkvrrys35F2pOHSKMo0mrATYQ7J0qfxB+CblhWwdCnTiDnjyD7EaSOmqJF7+aMKvX7h+7IYBpFmtZvAww0z1ui4A0T85P5PkYE4MbMcIan0DEplxTVpnRL3fcP/o8oKLPg==
Received: from AM0PR03CA0029.eurprd03.prod.outlook.com (2603:10a6:208:14::42)
 by DU4P195MB3201.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:621::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 12:34:08 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::79) by AM0PR03CA0029.outlook.office365.com
 (2603:10a6:208:14::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 12:34:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 12:34:07 +0000
Received: from llp-moog.phytec.de (172.25.32.44) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 14:34:07 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Wed, 1 Oct 2025 14:33:51 +0200
Subject: [PATCH v3 1/4] arm64: dts: im8mp-phy{board,core}: update license
 and copyright
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251001-imx8mp-pollux-display-overlays-v3-1-87f843f6bed6@phytec.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759322046; l=1642;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=8jnO68Eifbctux7NsdIUq8+ZBpq1aT1VEQPLxxZRBlA=;
 b=Gfa7HWoOX3Pfmo3nHxfWWN4L3q0C4fd1RuPTn0uIa56wEiivA9JajdpVJdJEDZysH3Rc2a1LY
 24bpoNd0mUrCikzOztIfQlJ5MYtPolHxWwzLs3aeJlT7VCdmAHdzR6C
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.44]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA1:EE_|DU4P195MB3201:EE_
X-MS-Office365-Filtering-Correlation-Id: beaf96a5-3114-49ea-7e81-08de00e6d0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHdCTnJtSTNDU1NMUjNwMnRLU3VJb2pxV3BHUWkxaE1yRFJPMWVpVzUyOU93?=
 =?utf-8?B?b3NKWFJVSExLaVFYL3NtNi8zT1E4VGNFOEdkSE9tRjBlY1BvcFlaWlo5eVYx?=
 =?utf-8?B?cnhidG9BTDJOYnM1bjdXa29SeXZjNi9BS3ZmaHljVXRnalc3RzdhT0xscWds?=
 =?utf-8?B?Z0YrM0p1aXQ1WGQwS0dEZ0Nlc1BqazZndVZibnJ4dnRBUU0rdWUxczdSYzdN?=
 =?utf-8?B?Nit1QWpYWHZ2N2lFZVl6RHAwQUxFcWtmaE5ncm04K1IzckYyeEVUVWh1TWFL?=
 =?utf-8?B?NVpKK1NkSDcvbitOd3FYK01CTm0zbHZHMksvamVTeHdxWTUrL0J6K29iOGpI?=
 =?utf-8?B?L0VFMEpkeGUvUDZjbjZjTDJnQmpTMWdwUGxSM1Nnc2FGVEVxVHZUWW54NWdw?=
 =?utf-8?B?cndUQnZWSHVhSnBGcjFybzJBdjBPeWNiL1pZaTJid0FRbllFZ21VVjdxWk1l?=
 =?utf-8?B?UmtKTUdpdTR1QWFtaHRESmZPc25ES1czd3dPcVQvUVI1SVZUUTZQSldCK21k?=
 =?utf-8?B?bHNoK3FtSHp6N21QRjZVeTFZUVRJYnVlVmM0UTh5ZUNDdmVuRTlNVUdRd2ZB?=
 =?utf-8?B?NEJRTlY0MXZNY2FBNzN3RzRKTURRRDluM3REa25FOEI2N3A5eGFIeEhHeWha?=
 =?utf-8?B?akhENlpWUXlzWHc3U0Y1UnVQSFdDZHFCa0VQZFMxOWVhNDFHcTNIakZwd044?=
 =?utf-8?B?R2dzVThMblgzdGI0a2p0V3hUWHNiM1E3M2trWnFtVytHUFVQQVF4R1dObmJM?=
 =?utf-8?B?NUFzdFR6eW13b3JPUFpOTHVmOCt3VzlHdkszd2NIQm9DaTV1cHVUZnd1NVdT?=
 =?utf-8?B?bGhKbWR2SFcvTHVCNG9BNEtpSXV2bjVJQU5GS24yOE5TRU5iOTlMQTJPZms5?=
 =?utf-8?B?RnZ0RzdaOVdiK2loVVN0VmkzdysrQlAvd0NJQzNwRVZjTkRWTm4xUmhRQVA2?=
 =?utf-8?B?bU9IRmx1SCtnVUJ4dmFtZUxLOURBZmF0Ly92MGg4ajdHRG85MWhwT0kwYzMr?=
 =?utf-8?B?aTFKaXc3Zmd2dHRoQzZqa0FsUW9yeG5qbHRKMW9IcFowNm9RRU9qbGVuTnpj?=
 =?utf-8?B?Rk5YaFRtMVk1K2lQVWtWSXlKSDlBRjRDbDJQQlF2MlBvQUZWbS9mYnhrbjNZ?=
 =?utf-8?B?WUdlbVNoTTFHMHRIVUlpbW5QdW9vbW1xTllETGNaV0NuREYrQ3ZiSktoK1ha?=
 =?utf-8?B?VVdZa09OdGtybFZjS05hcm9Cb2NmcWUzWXdsOTg5YVlRdWhmNjRmNG9QRnlM?=
 =?utf-8?B?end1TGJlMEhWSzVYMkNhazJBNi9NMGZCN0NIeUJCREFXUmpaSlRBZzgramZS?=
 =?utf-8?B?cy9RRW4zVHVkUXNCR0FRc3U0YVZRendEU3FmV2ROUm5YR2RLVWRwc2RJWW51?=
 =?utf-8?B?TGk2c2NNYzVzOUUwSUUyOUJTM0M3aXkxdzRucWoxb1dORDFWWnRTK0hrZFFH?=
 =?utf-8?B?SThiZ2dFN3I3YTNvOGEyNEd1VG15Rkg2OUpUV0xVWTVuTS92ZUg3SkFqdDJD?=
 =?utf-8?B?Nmw1MmVxVDJDUE0zek5qbnNOZ2tOUXdsZGNFdDhHVG5rVytZU3pNNGRaeEJl?=
 =?utf-8?B?T3VtbjFyMVVGbDg5c0hCRjcvb21VRE9HRE5nL3k5eEhnU0tOc29uUTVGaWlr?=
 =?utf-8?B?T05LMUFBSlRCY1h4cEFoVGtJUjhqRWtSaWJRcUNIRmUvUHBuVEN5clFLdWo2?=
 =?utf-8?B?SHBXdHpYVFJOTy9pcUhwZ1YweU14Y2lWdnpMcjlOUEpmNlRpdFNsKzVYcWVG?=
 =?utf-8?B?SkJSNjNWQzRQMzArSHByNVNxbkN2d3dYQkh1RjVBcUhtTGpicEd4Uy8zRkZi?=
 =?utf-8?B?RVdVUXhZc1JZN1N3WTA4c2hENE9PV05hTTgwdE13MThIdXBSMHF2dThoYkd2?=
 =?utf-8?B?cGJDTFhDcTZSSjFkZDhKU2hGeGFzUGtpQTFOck1jZFh4eUNlY3RBNGdjQk5m?=
 =?utf-8?B?Uk1mUS82TjBvOXEwN1VISHFPdEQxSjY5cHNiL2VSeXIzd1g2OSt2aUlaVkhB?=
 =?utf-8?B?dFRaMWtSelBuVmpDM0IzbTJ3MExrSGRjM3loNnFBTm1vaUd5eVNET1I3NFBD?=
 =?utf-8?B?eVZaYmRYV3RKU0MyNGFzU2hXaHpMQjlFeVkwTUdEc0RmYXNSR3VGZTlSREwz?=
 =?utf-8?Q?JqII=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 12:34:07.9170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beaf96a5-3114-49ea-7e81-08de00e6d0da
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P195MB3201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_053414_149884_35A9916F 
X-CRM114-Status: UNSURE (   9.79  )
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

Update Copyright year and change license from GPL-2.0 to
GPL-2.0-or-later OR MIT. Use syntax as defined in the SPDX standard.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 436152308642270c320e3ae3b21b9e46b923c043..6110c6a484d3f0b427ad372e1bd16063d1ce165f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -1,6 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
- * Copyright (C) 2020 PHYTEC Messtechnik GmbH
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
  * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
index 04f724c6ec210bc2f382e6b9e2b13fe85d3926de..f6168984a31cca2b97344805c9474db900e3af3a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
@@ -1,6 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
- * Copyright (C) 2020 PHYTEC Messtechnik GmbH
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
  * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 

-- 
2.43.0


