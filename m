Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08595CEFD1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SamU2zU/E2VFC0+OFF45Fs4+nHaBK64joLuaLigrfHk=; b=syHVvGQWF98zDfVsG7yPv2O+1O
	I82okk8myjiIE//UmkvhmXcRwOaadKuY/ZlSqLzyNRUem4n0HoX0a1F3wBk9RXQ39fZpqdbCFhyL6
	MnIlVYjBmbDREwtUCQV+P3cJbZhcrKN6RoBLRdssf9vrnN14OKzbIwcOfH/yWbBevwQEKgy+lGoNQ
	n3bN4fNk8NBhA5AVWCQpZr20UkfC7sSQGfTQf0sbnpPsIxVLGvr4sPBNdq0+adK5JxMHED0LBZDz1
	E4XYbp8KyYqm4bz1Mq4E3fC/YjctVbfYNRCUg/N1D3u10iBe/IvCcHVaK0zjGyQ+toE5TK6LhGsws
	dn6oGLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdFiX-0000000Duj9-42WE;
	Tue, 06 Jan 2026 22:39:57 +0000
Received: from mail-centralusazon11011037.outbound.protection.outlook.com ([52.101.62.37] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdFiU-0000000Dui8-0nNC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 22:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcN67i7puQbgNePJNKHT49sRVmSm8wTS+bEmQx35SdGz14BxvmLLKe+01DGn1DJ1MMCjoR8M0TT4H8jgf0mZx9cw+w64vXYvpDF2yrGGVvk5TWSg4RRKcxH8I63YiLqvdme0Q4yWQjuQhj+1Ef6RY859+O3FtPtros6Insedt/lsypvFUSUCv3+asAgBdDGT355XgNPzq0F1sayjWXXDw4K6v6NX+cPU8MlqF2AXbBhC4rAyLOveR1sJHsKJmZmeXAYI90wmJ68ZdeIGayLan4mOZcBchazklz6KtclnY4x/EUUcCVwFR6YFAkc15bcc1EU9bg7kmeyeIykvmzj8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SamU2zU/E2VFC0+OFF45Fs4+nHaBK64joLuaLigrfHk=;
 b=o2Ovkc2OZaLrYYOq9uyE4D1imCBK7ouo/Kirg0lq5Kz7ewYlmehVAWqKuju9WABLMBIwipkpz4U2jJJUjDK6mfIFg+OYyZSgithCZ2jXdhWAgcy1hsVbK/jldg1Rs/Z4F3H2nEdWkkkzkzVKk9cxo+Ap3YFa6fb8rLdq7Sxla8LwJRBQG3ROmmru8uVoSYbuTVL3LxYOWOZt+fxOdxc0ngI6UsHq1Fj0xj05H25MqNIUGnZWbrL7TZlJ2V/JJ7IPisJ+d7cIdfCsnlJk4CUSrPPwyjjG1gYpq0Z4jMGKaGloEz0r2VV6QK2MYEtsNtoU/1I5c2m8tkz3tlxVKzRaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SamU2zU/E2VFC0+OFF45Fs4+nHaBK64joLuaLigrfHk=;
 b=AOtETcpeIiMEIXQGD7qvkAg5RaboM//ZHz/FfKZqcApZuml5Mn1uBZG3MfYIHUrQRlDQMQWKlcVHGhJH9v4DBjA/qq0ZRtB7vJAwY3AwUa1+cHGy6ZM8sBMaMP0Ha6Rt6TNwVD6DIb0QputWdqpqegpY4fQt7fRnpo+WWRGfVtQ=
Received: from BL0PR02CA0093.namprd02.prod.outlook.com (2603:10b6:208:51::34)
 by SA2PR10MB4649.namprd10.prod.outlook.com (2603:10b6:806:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 22:39:48 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:51:cafe::2a) by BL0PR02CA0093.outlook.office365.com
 (2603:10b6:208:51::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 22:39:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 22:39:48 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 16:39:44 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 16:39:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 16:39:43 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606MdhS53586904;
	Tue, 6 Jan 2026 16:39:43 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 6 Jan 2026 16:39:21 -0600
Subject: [PATCH v2 1/3] arm64: dts: ti: k3-am62l: include WKUP_UART0 in
 wakeup peripheral window
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-wkup-uart-wakeup-v2-1-fb4cbd56c827@ti.com>
References: <20260106-wkup-uart-wakeup-v2-0-fb4cbd56c827@ti.com>
In-Reply-To: <20260106-wkup-uart-wakeup-v2-0-fb4cbd56c827@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767739183; l=1916;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=tk098XTfssSPtY7jBh1/YqYku8gyjoYr1+zcywvW9Mc=;
 b=VemWCbe5s9Vh7ivMQ6e/Sq788TA1uJk44oKvaimmg4FZL+JrOsO6bXaJ1KRotXPluqmwjDMBi
 j/s1NxUqCCYBL7adYneFoDTCVgHWIg5/3qaSSm1zK9tGKYN5SpV13bH
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SA2PR10MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e79dc72-888a-4722-3e5d-08de4d747f61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkdsYjlvbU9QVEpLWnd2Z1BEdDAyb2lGRDdMN0R5S0h2WkI0WUwvb29pOFhL?=
 =?utf-8?B?YUJ2QTlpZ0dIQUsrRTQ0RWN1K2RlOXYwaS9iWFlYOFhxYklJb1R3RldtTTN0?=
 =?utf-8?B?ajlvM2szdUlxc0JOdmFmR0lyaHJXWStNOTBEakpJUnVUL2Zjc2tZUTJsN2Fs?=
 =?utf-8?B?b1MyeUhlL3V5MjN4QmgxTFIrZHI3WkJLdXFkSWlET3pLVndYNE5vRzNCR3c1?=
 =?utf-8?B?YXNLbDJ4ZHFuMnVWU2NEMXVML0pUbWd4T0piaHBzL29wZXJNTDBENnJBKzY3?=
 =?utf-8?B?ZDFZcDBEbThQRWM0N0FLaUJDK3g2K1d6MnNKK0R3OU1tS2R3K3QxWWxSMzlr?=
 =?utf-8?B?TGpmcXlEazY5MnVZTkpxVVFGd2QxK1cwVDErcHhDb2cwWUF3WGhXMEFjY1VN?=
 =?utf-8?B?TkRKZkRLT3U3eHdTQm9nSTlYWXpqUURIZldwQnNRMk1YcWc0UnZFd0VMTkZ6?=
 =?utf-8?B?Qzk0NThOeWo5M3B1UHZUSGRKMTlVRklmUURsaTJrekpFNlhkQWw5UU95K29P?=
 =?utf-8?B?Z3VRT0twMkMrdVJFZkdJZUV1M0R5L0Fjejl6WUFoSFZUV1l5eXdDN2xQWmRS?=
 =?utf-8?B?THlmWFc1Uk8yTndtNHQrNUhYMmswL2tzTHR6NjM2YkJQZ29jbHJRK3M4UTJH?=
 =?utf-8?B?VnVkTmFGSmU2YUppbEpyY3l1M1p3V3pvajBoZUxYanpqUXVJeU5MaVFmSVNX?=
 =?utf-8?B?Y2d4MWZtMUlmR3ZybjB1L1VNODBQZVpteDRxbUJvYnNhY3JiZHFicjZSaXpB?=
 =?utf-8?B?T01DSEpWeFZtelhkY3VoNllQT0RsRWxNazhHNU5BSEczRWNnQUhka2VWRits?=
 =?utf-8?B?QjFXSHc2L3BjS1gvTjU3ek1Ba2k5VDZsdjBCTW5pMHZVS0NnTGR3WFZ4Y3Z6?=
 =?utf-8?B?WTNVM1NMb3JWdmdta0p0SGYxamxEV25OYnFaSnR3dkNqd3pFMUw3ZzJvQnQz?=
 =?utf-8?B?WTNhUXBRM2dWY3BxTHo2TE9sRHh3ZTRZcWhERWlha21aM2E0Zm5BL0dXcTEx?=
 =?utf-8?B?eEJLYUVQY0dKNUF2cWVpT2NGdW5xSVZKZVR1S0FLQTFjSFBLbkNXakYzNUd5?=
 =?utf-8?B?WXFCUWQrcWFBcTUzMlJJNEc5cEJwc01MbTJaY2RzZGJKOFJiNFZFMXJBVzhQ?=
 =?utf-8?B?b1ZJbDRaZ3JJQnl4RXhDTUtpSHQ0ZEQvSTZqWmFUUCsxNGd3MWpnSnVtekFK?=
 =?utf-8?B?c0lENjFkb0VycmtORnMwVW9hanJlVVg0bzd5VmlLYnpXZkg5TldSMXpVcjcz?=
 =?utf-8?B?dnpuLy9zYjhBaEorR0lzOURyTlk2STZMS1lMREw2aVVmVUxMRDIzeUdOelh4?=
 =?utf-8?B?dG5PUmRxSnJybC9WU0JyVjRGSGwvWlNSU3MrMzlRNllBdDJLM3hGRG9YdUhP?=
 =?utf-8?B?aDhQRTNRb2dHWWFrVlB4UUVkRVlVa21XUjZJN2tndnVkQmFHcHpIUFZrWXd0?=
 =?utf-8?B?YzRHSjh0TGhSQm9kOHZTR3NXTmlseGxodlZLdnlvV0JaMGkxRnIxQkdTVkJD?=
 =?utf-8?B?b090b2RNbmVGbFk1RVBqUUQ3azR1Y1IwcWQ0eThVSXI3cEJFV2dtY2NBdDdu?=
 =?utf-8?B?ellCVGd4VWdTQ1h0OEpkZUdoazZHN2g3Y052Y1A1QzlKdjlOa2tNcmI1UE9s?=
 =?utf-8?B?UEk3Rnk4ODdFUEFDS3NRaThvd1NXdnBCRnkyL05ldENwdHAzNWZVUFdsbkdM?=
 =?utf-8?B?Q0hNSFhDbmp0U1ZyR2NtSk1ISWVJY3R2VWt2YmJmOE8wRTFFaFdQSnI0VHRk?=
 =?utf-8?B?UllRMzFDQkJUS1MvZ1cyUUUzNW1MbDBKcWFiU21GWFBrMXNObXdxRDdpN3Ri?=
 =?utf-8?B?VHpXZHc3dkR6cTBzeHliaE9IZEM2QUduWHZycFBPZkVuUUNieDFIMGl1dW8r?=
 =?utf-8?B?Q01QemFLRnp5U2d6SExDNE1reFUwRnVjMG9CbTN0N1Z6K2l1R2k2Q3hqNVp1?=
 =?utf-8?B?RjkvREJWYXJZNHZUckEzVGNraFg2YUQ0aWpkSW40SjhZTVFMN1JWMjJTcWgx?=
 =?utf-8?B?SnRCZmFHRFhCYjQ0YWJtN01DN1BGUmNqR1lUNHIyYjJKMWsrUU1CU2lBcDBN?=
 =?utf-8?B?VHBYZk5LSDQ2b3VZOVFIQjZJMlZ1U24rMnhLUXdzMDVjWUtNZC9Wb2NUbXBC?=
 =?utf-8?Q?8WF4=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 22:39:48.0638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e79dc72-888a-4722-3e5d-08de4d747f61
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4649
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_143954_273714_D71D6C7C 
X-CRM114-Status: GOOD (  10.55  )
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

WKUP_UART0 is apart of the wakeup peripherals and has a range from
0x002B300000 to 0x002B3001FF. Expand the wakeup peripheral window to
include WKUP_UART0.

Fixes: 5f016758b0ab ("arm64: dts: ti: k3-am62l: add initial infrastructure")
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l.dtsi b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
index 23acdbb301fe38e6045c0ef3ae340196009ed217..e01e342c26daaa06a72036cc3a9a7b13a60e6738 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
@@ -92,7 +92,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
 			 <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
 			 <0x00 0x04201000 0x00 0x04201000 0x00 0x00000100>, /* GPIO */
-			 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00100100>, /* Wakeup Peripheral Window */
+			 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00200200>, /* Wakeup Peripheral Window */
 			 <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
 			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
 		#address-cells = <2>;
@@ -104,7 +104,7 @@ cbass_wakeup: bus@a80000 {
 				 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
 				 <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
 				 <0x00 0x04201000 0x00 0x04201000 0x00 0x00000100>, /* GPIO */
-				 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00100100>, /* Wakeup Peripheral Window */
+				 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00200200>, /* Wakeup Peripheral Window */
 				 <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
 				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
 			#address-cells = <2>;

-- 
2.34.1


