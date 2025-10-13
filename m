Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BE9CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SK1u1gbah3OaZk0/Wonh6DeD27+ELfnmWu/rUA7JJDY=; b=SWLP4gbJzyUsV50/pCrKah077h
	jkACJtKa3RmCZvu7HboXpokGHDnnCrI4KGH202ni+0LuHnb0BcdBOaHVhDFewAaHC1N/QVsC7zU5G
	Te57exLzkwnUB9YWyMwj5yWworCto0Dr9n/i4pEG5FQcTzhQDdWoQK5srrYcdoM2AZZGlf//yCNrD
	RTdd2WplLp9s0/muX3J/lbnFJRff6yQB4wkIhyiDQgji4t0flSP2MDSION8sZAxdVL/aZVTvLS7Q3
	ICTCiKAX69noq/bXwQjZ23xyQBA+DzAg4rWeUiySzRWb9Rvh7RM1Pu6E0hOrpH/LyoO8KL7onRCZs
	QIXSwm3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8C00-0000000CNLd-0VcX;
	Mon, 13 Oct 2025 06:25:36 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Bzw-0000000CNHs-3W4p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:25:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/HH8E4A5/24kVG/Gqhk+Jcm6kpikT+S1IXAMPTaXxS6lf9eg7Kigm9OUQdaFj7LEQ1SV6IKHKamCXETgw0MCWOCnZiAEoT0pGBhbA6p62FBIdlbxctmjuhz9Vhtk/ma3kStOu9Wx8n0jTcqJqRg84wiiNkUsi4fmjXueOlA0V+OI9mTPj0n/2zMtuEpaha+tzShGOMlFzWH42U/PgN4sa2dgt5YSmBp5vyICrxpiAUUdZ5/yTREZRZ1+DDm6muMGhlJQd4pcU/IGTBuAIk8GU788lEl1jRm+4ROYJh52qQSIc1xqJ3GNZnkW/RtuGDf1P1+4/9JYCy5tVRGzrqxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SK1u1gbah3OaZk0/Wonh6DeD27+ELfnmWu/rUA7JJDY=;
 b=fei1OUXiGXA8y9OppOeP67RaGiH2DjYJO2C9SH0VZjZKDRMTNk2cnm/U+RdpOF5xsgSTyoNK12gEdqm7xPnoY07/4hkmZL1Zu/x294AFNxvhW4Ct0A7LZl7I1wyhVJhdWqmltycRMCVxVX37iod0hn6O1niw5Eq6xuSMc18juszY+9v5hNJM7lR+CWQFYf1/e8DDyp2Wm5+F5NyGMSHoyhRjX9bOxrlKfInWJI+4KgWuwZHzMVw22Qqa+JyqlZlBbTkP7kNeKpH+8SEvlLELK3hSTEyZgT2PXXPf8BdDW52LtqqVnFnrCcg7B3T6sg4GUlKG3gytVV4ZK+seZSJZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SK1u1gbah3OaZk0/Wonh6DeD27+ELfnmWu/rUA7JJDY=;
 b=nStlyeLpCcobm41fVO2JPummtm2byNeiEOZoCKM9QO5whcq6WFQaLuELxJ9iPUuIlWSwUhEhQdgddXMaN02CzkMfUDIyYr2piEnVhvoRZYUtr0tHrdrxodD55vzxTvwDKRz8x8tVyC81gMHZ+hGLlzrGk027PawfKfMnNucS8N70tYASpOuOMjaUMNOZgVwK8o9/ydRW67C6QM+z7wW4GlAnPQxYfUxtlDXnZUTz16twpEjlqE6ssgYh1zoQ4wlbpLEO8lKOBQHIdlZ4wb21oK4wmRUG2QrDlbEFM5lXTy1dQresjCa1le3RgbD0X0EGc50NMQZ7uKKPrPgzMjPH3Q==
Received: from DB9PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:10:1db::16)
 by FRWP195MB2941.EURP195.PROD.OUTLOOK.COM (2603:10a6:d10:17c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 06:25:21 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::9b) by DB9PR06CA0011.outlook.office365.com
 (2603:10a6:10:1db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 06:25:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 06:25:21 +0000
Received: from llp-moog.phytec.de (172.25.32.44) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 13 Oct
 2025 08:25:20 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Mon, 13 Oct 2025 08:25:06 +0200
Subject: [PATCH v5 1/4] arm64: dts: im8mp-phy{board,core}: update license
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251013-imx8mp-pollux-display-overlays-v5-1-fb1df187e5a5@phytec.de>
References: <20251013-imx8mp-pollux-display-overlays-v5-0-fb1df187e5a5@phytec.de>
In-Reply-To: <20251013-imx8mp-pollux-display-overlays-v5-0-fb1df187e5a5@phytec.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, Teresa Remmet <t.remmet@phytec.de>, Yannic Moog
	<y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760336720; l=1654;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=hYioKB93wmnt46asxencKSgY7NVCDWtT/78QKQmXo0c=;
 b=sDqDVumbzjek1QGBfPO2xrF7mykl1ArOhV0uL0wOZy+T8rcvJlJ5+Fy9vQrTkIuH/Sweskdj+
 WIOOIie4dRdBt7jmOpzy+rwvTok58a9vsidt9fxri7SLGn4wKkzTiMD
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.44]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|FRWP195MB2941:EE_
X-MS-Office365-Filtering-Correlation-Id: e80578e3-d0d8-40cf-e888-08de0a21496e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk9wV1dFMVNrUnJrVmlIaE00bDUrcSsvWmlTQTdxU0RVbWVsai85dVE1bHlz?=
 =?utf-8?B?UWtYT3JOaVErNHJFNTcvZ1QwcW41a1hEUTY0M1Z3NFFhVzBBSFhnSkUydmhK?=
 =?utf-8?B?OEx1SWRGM3JqVFoyV21VcWQyMUFSLzlxN1daa1pVWldnazVsSnJ5aTdQRWhk?=
 =?utf-8?B?RTJwOGxPRzdnaEV0UkJxMWROMngwaktsKzFzOStIM25yajFZVDlwL0JnZDZF?=
 =?utf-8?B?Qm1pOVBnZXRSYW5pbFZPdjMzdzZOU281NWJuRjU2WmxkNm1mYUFLQ2lIVFpI?=
 =?utf-8?B?aVRqdkxYNm04SDRIbW1rSTJpa3lSYXdja2JzZk52RnI1a2JtaUpHaHZqQm5I?=
 =?utf-8?B?SnNMTVlZME1KT2Y5OE9MZE5TdmI5YTlHbWVBVmdLNmlaWG1IT3Fraklwb3Fm?=
 =?utf-8?B?UUM4ZUZkYWtMSCt3WFBOODVtWVYvS2dCSjFtRVQvYTBSYlZrQk4yWGNYMktP?=
 =?utf-8?B?WS91ZzNTL05uVFYrZWlqd0diY0x2QUZnVHdlTWxCL1FMTzE0SjF3TU9PQW5J?=
 =?utf-8?B?Rjd3V0svc3Y4L2ErV0RZSENZbGlxcVloUWF1R0tyTS8yOFdmeVkybEVzbXV2?=
 =?utf-8?B?dFZvbE1NcEROM0o1K1VZSzRwd3RSRzRkNFFlNGorNk1LVEJMb2ZlZUswZERR?=
 =?utf-8?B?SkVjVXVCK3BHQ2pGMWdDaXczY0JidmNGRm0wWkU1WFJlSnY5SnE4S3kvQ09D?=
 =?utf-8?B?NWRVMndQTVVKWFc5eXN1S01pOThFa2FyVC9MZzVFN0R1ODRtMlhlVCs3bGNL?=
 =?utf-8?B?Z2VDTjJHSGZiSHRvZG1VRkMxY3ZxZktQRnJGM1VzK0M4cmsrSUlmOFdPcE5x?=
 =?utf-8?B?WHdEMk1EbE5vS1pVcURqeHJLZktaSTllUGZVTlZhWS9MVmg5K3RNQ2tBenJT?=
 =?utf-8?B?NE0vZ3F6M1VKV2xTbXJqR0M4UElXSSt4OHNreVFLR2NreWJTSmdkSHd0Q0Q1?=
 =?utf-8?B?Qy9ueUNZMFUrM3ZGNmhJSkExRldaS3JCVDlnRmc2MGtHR1lhdVlIUkhibTFS?=
 =?utf-8?B?VklUVHRiNjRsTXV4Um52Z2VFTGtldzE3aFVRbW9IVkF4Qk4zaTM1MEZlYmw4?=
 =?utf-8?B?OTRkdlNCaW9BSHl2eHNJQ09WU1FCK01aNFI5MGwrQTFlTE9sOFBGT0daSWZO?=
 =?utf-8?B?dCt3aXo0anBjRnFqLzNpNmJTN2c2T1grTDFYVU5yeDhNNFN6MW95Y1BLeTlH?=
 =?utf-8?B?RU1iYk1oTzdSamo2R2Q5MUxiV3VMaVVZZlVjNXNnNFk1TTlyRGFsT0IzMStP?=
 =?utf-8?B?Vld1RjFrak1NM3JQZVh4c3lxTTlHTDA1T0RBTVZEVktiSmM4ZUhFeHZxckM0?=
 =?utf-8?B?eEZ5QWxCeHVUZ0JZL2d1YVR1aVZTZVIyYjE4RllwdzFsTm9TYWp0UlllVDR2?=
 =?utf-8?B?UlMrN3ZiTGp0TmRtdEZjSHM5dThuWmRsRUNkdHRrWDU1QmdoZEIvMUhEYlM1?=
 =?utf-8?B?RUsyU2hwNGV0cmgwSTl1UE91aHh1dEpzNTRjYVlIalBBczQ3YmhMUUEzUnhu?=
 =?utf-8?B?REh4OEVPSHpLTTFqZDFvb1YxVXoxZEgvMVlGMEVQM2pPRnlPcWIzaFVaZmdh?=
 =?utf-8?B?eG1SOTZ5bXZFV3FkTCtzSXVyU1lLVCtYRkl6WENvQUpoVVB3TUxYcWQ2U3Rm?=
 =?utf-8?B?cURqWGRUR0djZThiZ3lQdU5aSFUzcHA0eklXaVpSeDZXSzJOR1Z1KyszdEZG?=
 =?utf-8?B?RWZkb1RwbUh2dWtmZG9nRWw1VGp0TGxoQlY4WlduV2FpZzhEZkh6SkNYemlj?=
 =?utf-8?B?TUZvQStBSEM4aU1nbjdzaEJTVkFBZThJRXMyeXBSUzlVeTQrTUtObHMrZnVq?=
 =?utf-8?B?NGlrNmNBRDhDMjNrcUg0dXVxVkxteUxqS1RndXFBL2VmQmZLcUpOTVF2MFVE?=
 =?utf-8?B?aWZ2K2w4QUdGSzY3T3pGOFBCVHpvZW51c2Q4bzNBRWtPL0o1bXNRbmJBK0Vj?=
 =?utf-8?B?dUhyU1BoKzBWWWdCTDcwYm5qcG9GQ2toalgvTmNpdUdKUTZCaUNOS3hsYVZi?=
 =?utf-8?B?MlRZREprbElQS3JCVE5YUFF1VXZQY2RESVQ2LytkTlFzMFdvcU4zcnNxL0V1?=
 =?utf-8?B?TThDOXR6UTlMVFpWbmU0YnBOZWZoU0lORjNoNGQ3cEhTN05jMU84ckg3ZGls?=
 =?utf-8?Q?vXPE=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:25:21.4677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e80578e3-d0d8-40cf-e888-08de0a21496e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP195MB2941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_232532_893013_39CC7462 
X-CRM114-Status: UNSURE (   8.88  )
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

Change license from GPL-2.0 to GPL-2.0-or-later OR MIT.
Use syntax as defined in the SPDX standard. Also remove individual
authorship.

Acked-by: Teresa Remmet <t.remmet@phytec.de>
Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 3 +--
 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi        | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 436152308642270c320e3ae3b21b9e46b923c043..e97d1d7c629b7fc4b52931868e35cb2d98434513 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
  * Copyright (C) 2020 PHYTEC Messtechnik GmbH
- * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
index 04f724c6ec210bc2f382e6b9e2b13fe85d3926de..88831c0fbb7be3db18910385e4e15691b1c74ef2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
  * Copyright (C) 2020 PHYTEC Messtechnik GmbH
- * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
 #include <dt-bindings/net/ti-dp83867.h>

-- 
2.43.0


