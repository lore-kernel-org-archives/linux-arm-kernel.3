Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10D8CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/2X9jjg1BUyyGKt6cYrctPfsGUYfEv8nQjSyxhg/18=; b=EH+iU9OPfSNZb4LoKq2338EQeE
	V29HbzkJnl9jOqKYyVlB2iHUnAFYY+Tx2Fwip9o9v1vCvRaEhUfjroc9Wi0PoJas+DUNyNyJoyTzD
	ph22yCelmEJsKQDD+S76VPOb1cHjdMr+U2gXpLvy5ytqfClOLk5JNsnvV1m/DxEtqY50wyLwyGUoo
	tFsRJE+quvGhjLSfLUG4L4IUF6v1ry1trTU83ITqeUwFKCGZfnuJ97FCvp2jljnUIJ4HtJqhyV7xk
	tOEnIu/cfcfQJvM6WEnRNFp/JY6TFIaTl3lM6K51DJ86fPnJW0707atTke/74Xm/7hULF2Ko9/xFt
	vO56v/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62ok-00000001VUx-2Lva;
	Tue, 07 Oct 2025 08:13:06 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62oe-00000001VRL-0Bsb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:13:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BX2Z1Fpdzm21EzqhZwGjR74SFKwkx+4aeePayk7vnjiZzu+18g1Ru6VJCqYeCt6MN2UWzq09R6SZpIaOpzalukCqKekuu49F9HIMTo7PzU64jO5jnpVdQg5ho9MVc1t5TSgx/OxpH4dXaTqQULcBQhmQnUS3rAAwBHZrO9O5hKdVKBOG731ZayNVUVrp6tyUk+qoBRYQsIXVav3tlvLH62Dx8tIlBmXav9imKF8fLaJmYL5A3bPzTugFhVBnFWok7JEiprguNq/qP6Cbted+qp4NsEhh/PanBAgRsxykQibAzYBQY7ojcGIPIY8M3JPIYCOMiEasbnzAGLtvI+R1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/2X9jjg1BUyyGKt6cYrctPfsGUYfEv8nQjSyxhg/18=;
 b=VhtC7o5UxSockayJ8Ja6WzZmVEnP4kLsLtVNgN4dwHyk6p324AyALZmPvl23i/uMpsRqvWh+vIbgRpAarF1EXL49gkIvbPqATVebiYJ20xtAUqXnirGyh9xNWBBFT76Uyg8ztoKwtYx4LsubvWsd700aVik9gcGmNOA/F3dPkO6KqPEzkVKBmshAtNGE0gHsmCf+GJcPdgBjiCDXwffYg9OBcJNA6gsGSgjBqWDHn743LsZx/5tN9G1swd+i8WNt8iVDkJ8snIR62tmMIHTSYc5xkl0fncL7RQ0zBUIUlMloPiIo+C1UpjRDainqpP6kVzZtXKI/FVaFuKLrDHU6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/2X9jjg1BUyyGKt6cYrctPfsGUYfEv8nQjSyxhg/18=;
 b=ev4dNVcukghuoCYaCFBoANRDg0nTG0MdqdvUDFzHfcM2jGeHfGmhUF0Deyga6dG6GEcQQMaMWVCZ2hM1qZ7eurB6/7eqGm+q7Rb6QFX/cRcphLtt3oyIE4qRMkKAZ+/z8+fPHb3YDpgTdB3xUnPhxBEZRG7PK/d+4aifZUpgtEWHuEZl1bYoQb/SJzGtsH6g3sMyp8y08JDymypLltbUr4nZjCmGM5RKbyYGRyw3gGOOiLDPwNWKGkTBFt5iolSJecvM/waUx/F9u8s5Y4Pb5uuPmqwsfY/T9zvRdnNxTv6/SR7DT/OWrmIu2kqwypk/va+scIK7S0lopaCUSEqVwg==
Received: from DUZP191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::24)
 by VI2P195MB3004.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:2df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 7 Oct
 2025 08:12:53 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::c8) by DUZP191CA0001.outlook.office365.com
 (2603:10a6:10:4f9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 08:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Tue, 7 Oct 2025 08:12:46 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 10:12:45 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 7 Oct 2025 10:12:26 +0200
Subject: [PATCH v2 1/6] arm64: dts: imx8mm-phyboard-polis: Use
 GPL-2.0-or-later OR MIT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-1-7e5de62c79bf@phytec.de>
References: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
In-Reply-To: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|VI2P195MB3004:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d0af6a-4ab2-40c3-4a3d-08de05794c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTkrdTdPM3UxL3IzZTJDbkZ5MUVYdzRyWTlKdVJZZ213SGg1UkJ0UHRtamxR?=
 =?utf-8?B?aWk5VkZ0RXZVS3NhbHFORHptMXJqYThNNlZGMWJHYkhoVlhXdHhRelZPM3VW?=
 =?utf-8?B?NTNUaUxUTjdTcGhNMjFraGxBNkFCRms5UEpMSVBLY3ZMNnhWOWFjczRVWTFB?=
 =?utf-8?B?a20renZaYUxpT1JHSGVwY3lqVHR5MlpBb25vbU4yMzY5WFF4UXJKSXk0Yjdn?=
 =?utf-8?B?MlVPRVVBOXduMGJ2cHR4TmtrOVM3a3o4akE3VTgvMGVSejJuRE1EK3ViWFdt?=
 =?utf-8?B?MzAyRlBzdEtDeWNhUXVlTGN6OFVQM3BrRkVMRXlrb1poYUJjQ3RzZkJsNmNa?=
 =?utf-8?B?bDZ0ZzdpNmhhTGNUMHVvcHRHeGdBZGc4MGJ6Rm5qVDA1akpNMFB6WndycVlu?=
 =?utf-8?B?dTlQWnIrVCtDTGdBMzhLMFE2SnBsY25vQjVVYzBzZHdORDE3ZDZDckFxREQx?=
 =?utf-8?B?NVBmMEJnOEVxUjRYVUw5R01xWnYyRmI3enp1YStwZVJmaG9Ba0xJWC9QeTJm?=
 =?utf-8?B?STFOY0tWck5YTUJCZ3VnWCtCUEdVaWl4d0ZtRXlrMGxPNGxsek4wQ0FaTFFU?=
 =?utf-8?B?dlFoVldSaVJyMGdPQXNiUGhaWEVuZnkrUVUzWHNKUkM1WXZ4MzczMUthaG9Z?=
 =?utf-8?B?T0hwWEtLZWhESUVzQWtFNnNTMDR6VzJ6WGVZenM5Q2p0Q2ZIbGZ2TmVLb0U5?=
 =?utf-8?B?cGV2S1pHQnZMSFBGM2dPUXBmdDZGOWFlUW5uT3U3V3RKcm9NbmlOaXhXMHJ3?=
 =?utf-8?B?c1BUejByTFM0NWh0TllRdEJzTzcvMVRVN1ZxOW92bStpNExVTVNZTTJVUDY0?=
 =?utf-8?B?bTBUNHpxajhqTUxoMi81dUl3ZTk5aWtzbEVYQ0tTWVZ0TkRhWVovSDR0UWxl?=
 =?utf-8?B?bi9hN2JsRGU3bU5ZaCtFNVhsWithMG9iUGNMYllLbldhdTFLNU4wbWZNeVF4?=
 =?utf-8?B?dnNRdDFrSHZqWTdmQnJhK0dZS1EwSW5qYWlYWS9JVkNBODhQS2RRQWtnYWh0?=
 =?utf-8?B?TWxqdW9UN2gyV2M0eHRFYkgzUFN3MnRJTktCQ01TVkJkcU9lNmpUTG9aMGxt?=
 =?utf-8?B?Q2RKZ2xWWnRLc2JnR2ZhZW9OTWY2REVoV2xnRlJNVFFldTBJeFVzS1BwVEhF?=
 =?utf-8?B?N081WmlUVnJnV3BYNzBSdkZDYTJnNGFWSzN1SUloRkRXZ3pOMnhIZ2d0OG9m?=
 =?utf-8?B?MVg4Wk0rUWwzNjJaV1RWQUp5YzBZaklVelJ0cXBHKzFsNHBhTnVsS1E1cURW?=
 =?utf-8?B?TlExa0VUWndLYXVMOHdCMDlBWVBqQmpMYldNdTd3eC9XRnZCdW1xKzVWMmVH?=
 =?utf-8?B?Z09RNFBiZkFvVlo3b2FTd1d3R0Q1OTVPbVRJQmc5WjRCT1FqK0NKTTk3cWxk?=
 =?utf-8?B?UTZJVVZWM0pyVmJkTVRLb0x1RTFRU0piK0I1YzdYRnVSTWIvRWduWXp6QllR?=
 =?utf-8?B?Z1ZwdUhDOHJ5bkFHWjI5Z2tXWEI0U01jNWFZcmQ4ZGw5NGwzUE42UHVyWWx3?=
 =?utf-8?B?bnpWQWY0YjRUTDRPN0JWSGJQQXZ4d3dSSkNxZ2dBeFhxNkJNVXQ5M2NOWmZh?=
 =?utf-8?B?amNHM3lGTWJDUis4eVkvSlFTVTh4SlM1SmRWdksrRCtNSjR1OFJ1bXkvN2Nx?=
 =?utf-8?B?ZkR2aG9TbW8ram5kU2JWZjI5dUNaWEhaZ3JUQ2NvNmlFVnFJdkx6Wk44bzZD?=
 =?utf-8?B?RHF4TWZGcXVyNVFpSjdWL1IweHR0NEI0VnVBa0V3ei9JYk1JRkw0L3pNNXI0?=
 =?utf-8?B?NmJUMTBnMHdySFZzSStIWTRESndkeW9jOGF4U24wTDVGaDd4RlRBcW5PeXZ2?=
 =?utf-8?B?azNwN0hCQ3dSYjE1VWdSTnhCZFkzdkg4YS9ELzl0SG9icGphOVdzaUlNT24w?=
 =?utf-8?B?RTRlZE5FakYxUm1tOUtFRnlHc2RMSUduRThmVm9qYjNwbW1VWnJOVWxTTHMw?=
 =?utf-8?B?TUZ5QmNUS0laUzRHT2NSaFIyNWdKMjJ2eG13R3lWN2k2Tlh5emZPenNWeXR1?=
 =?utf-8?B?Q2kzRGpIUmZLODdxOHpKZS96N1ZhQ0J1Q1h1b2c2cTcwN0hhdHJzZjY2TWo2?=
 =?utf-8?B?bURSSDcwWFp0NmxiTEd0bTA5WVdIdnFUN2tJaWVwWWdVNXNXUXF4WDJ3MTEz?=
 =?utf-8?Q?S77Y=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:12:46.0271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d0af6a-4ab2-40c3-4a3d-08de05794c36
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P195MB3004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_011300_722171_FD108AB8 
X-CRM114-Status: UNSURE (   8.70  )
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

Update license and remove individual authorship.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso   | 3 +--
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso | 3 +--
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts          | 3 +--
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi                | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index e5ca5a664b61e20e9c30c9e5ca01a6ae6da57596..5955d48e19ad0035038ea4ad7838b3e09d10b2ec 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright (C) 2025 PHYTEC Messtechnik GmbH
- * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso
index a28f51ece93ba62a7a9991826cca2ec74f704ba2..1059c26990fe6eb0d7acdad4d3386944f46ea99b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright (C) 2025 PHYTEC Messtechnik GmbH
- * Author: Janine Hagemann <j.hagemann@phytec.de>
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index be470cfb03d75de7d6d3fbb1add65c71fbe8f286..ccbfd697376968e49057f102571a0f06cb19e702 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright (C) 2022 PHYTEC Messtechnik GmbH
- * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 672baba4c8d0527f2de002d49aa96d30a6ae2373..1c472e9012c3ad3445fc0b17e0393a9c0e243329 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright (C) 2022 PHYTEC Messtechnik GmbH
- * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
 #include "imx8mm.dtsi"

-- 
2.43.0


