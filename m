Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23F0EE57D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkvTpJ+chN7xGRGNAGGwU4aXZjmSF9QIGJgSIdaqA9s=; b=hWejX+Mx9CIVGQPlbAw2FfEoYu
	Q4hMHxaVKsVk3pIcH50/BcVGjzSZwoqQM0CFMYmKbNi79jQqdF2ylk/DmVOlIEHKXzT+BZZgIwUgN
	3Zl9Ew+GR+H4to2Cqode7FUoGRTNZbKnzWrSp0Zv9H+O7rWIhvziGuUFj9Rkxl+2GVZ7ecBuKXEIl
	fIUAwYfR3FxbZDj0h6E4H/q5T4g9TcCQmQ2IwbJGWqebByLEI+2aUhA2KlNanBz57E9D4KTaywUcP
	fyIbiUdv1O06kpm6PN3qCghg8r8HZWNZeCOjIZmVUOuL6w/rIbV19zrP3h8oX39EkXUNJMC3jAfJe
	U+T6dRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamJh-00000005awl-3glI;
	Wed, 31 Dec 2025 02:52:05 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamJd-00000005avC-0oz6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:52:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyHkVG7o4gdRLbGNMOmRLj9ptS1cjXhqpRSHwUQYuNPHvmebb2yqASPXX44WHuSRd2jJsAxA62d/P8UiyTfQBhgbKM7kBxsdlczYnvmJrpCNKTsgutTaFiMQevTOfC/og3Gl3aFdXZfR8ITcZ1fZDLd7dy7EStFkg06d+aYuJcDX7U0rVZvNgRpt7ImERMp0q+pTO2EPQOsMHdeVyvY1PbJmuAjhcJFITtlBIa2a4Yrqr4hdR+atBPhLSVXyLVSrcI0WS3+EUZZJ2ZA91ANAOAujiH2Sc2KIU43VuBNPhgPwbINQ/VkB63MudcxwSigkQn4rP9WT089wdcXif897ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkvTpJ+chN7xGRGNAGGwU4aXZjmSF9QIGJgSIdaqA9s=;
 b=G4NYKIHILkBVL417FzQmDy54zYkobhGgMD3DEJI7Y3k5Plcp8z3WBBpe1MPX4jbhASoTFJw2T+5RIn0eSomCZaQHeZENWa6rA2ZyoF1cVzzuDRYvFrjPbC2+YnKmsyeNfMBFjwpmSaYXV/ZOC51zrADRtfDQFw6Wv5GZvYyFIwHM8OWiQHChGi6Cs9bTiDeXruQblcKx9uCgAQhfzm0lU7JFWFYtQjJzC7P4NWKDgM3kU/W2onX1enEzIWo+WG97kCmevZ7RtnMeVkVk+mxU3Bio9BSipXZayKnKT8UdFI/PnQZJLhUrseHqpb6ea1nfsiWbU2oQKcRJBhYDAWcDPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkvTpJ+chN7xGRGNAGGwU4aXZjmSF9QIGJgSIdaqA9s=;
 b=dAweWR76Lm2d1dG6CSimJRLaGrBpReMCHVLgc14g3oChdbUW2QoBkeEEEYOQz3EolecIfKh5VTfJBgjHrVdMHE1TOO4NGqYkf9DQdUTCzWxBj+JzmwVfH1429tzt7BYA3d+T8fSWQ629zwCXxrp6N0qeAUCj07e3Lg5oDkjGbTA=
Received: from MN2PR03CA0016.namprd03.prod.outlook.com (2603:10b6:208:23a::21)
 by IA1PR10MB6121.namprd10.prod.outlook.com (2603:10b6:208:3ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 02:51:55 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::b5) by MN2PR03CA0016.outlook.office365.com
 (2603:10b6:208:23a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Wed,
 31 Dec 2025 02:51:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 02:51:54 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:51:50 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:51:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 20:51:50 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BV2pn4v1608844;
	Tue, 30 Dec 2025 20:51:49 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 30 Dec 2025 20:51:40 -0600
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62l: include WKUP_UART0 in wakeup
 peripheral window
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251230-wkup-uart-wakeup-v1-1-cd6e15f8d956@ti.com>
References: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
In-Reply-To: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767149509; l=1874;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=MHtaqsv9/AJGQ+hY2NIFiS6V7+MEqPbGIkHY+Ro+Mss=;
 b=rwYPHAwOs6qTJV8B5oSghzMZUn0nutnN0VCqsf17Vui0FtrN2XGtcXr8FHPRwvh0QVoWEZna8
 Kbpzt2icxeHDSbYdVnyYN0JpEjzLFbwrTG8Cj9+9bZE+IAMkYYD743R
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|IA1PR10MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: e02c85c9-909a-49bb-24dd-08de48178e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVJrNHZkWnVzY2ZsZzhnWkpNUHo3OEZsN0plbXpLT0hCNjVhYkFaWXFNbXRQ?=
 =?utf-8?B?QTAyMktnZW96a3VsVFBwZHVuejJvTXJqUHdBcHdaWWNuR0NiMmp1aUpqWjg0?=
 =?utf-8?B?OG9SeGNCc3NKbkUvSis5QVBMYnNIMllIdjdaK253OVp0ZkQreFVvc29pc01V?=
 =?utf-8?B?MnpKZlRRV2VDLzJWUXNWVU9Pd0hoaW1IU0lTYUszbEh5ZTQwaEVaYURkUE1s?=
 =?utf-8?B?aS9xdXBMdHhUejNUaXZGbXhsU0swWEFpQ0JwOEMyNTZhRFZLZHRUbU9uTFJY?=
 =?utf-8?B?NkY5L0FFRDRUeWl5L3diWW5qQkxmZ2ZTMzhvbU02OFJ3Ull4R1FKRHJnWFBR?=
 =?utf-8?B?WmlSbGhnQ0VSUUQvc09nNGdlb25JMjl6aFZPZUFSTGl6dEVjY0w4TXlVckN1?=
 =?utf-8?B?Tmp1WFplb0EwNEtYQ1hmOUlBVjE0eC9WWFJSNFRFb2Y5Mk9QQ3lETmNIZ09L?=
 =?utf-8?B?R2dkeW9EVStIcnpZVTh4TGZMZmNhQSt6SFRvdFExcEtBUEhnOVR6R1I1Uitz?=
 =?utf-8?B?eUdObFN5ZlZNZGpRVFp3U0wyM2oyN29hNjMrL3JmZml5bk5RUmxpeEVRRHRi?=
 =?utf-8?B?eUZxbnVjc1Z2U1VYalpObUYzYks5WFViS0U4OS9xM3ZpQkY3NTAxV0VLVWVv?=
 =?utf-8?B?cEFKK1d1ZW0xUW9FbVhtN2NHb0oyd1JvOFA1cmtCL3hvWUJsR1YwYkxqb2c1?=
 =?utf-8?B?WlVSaWNwTUhTRVJ4N2ROaE9jMkk0QVJPVDJCd2h5VWVodzlIM1VRSzlQZHAz?=
 =?utf-8?B?QWdlQXl5OEM0dlJoRHZXMEZndEQ4SmZEdjUzYXplSGthbmVpZlNlRE5pM0tO?=
 =?utf-8?B?SzNGdlFjWTBiZmM4U0FBQ0hrc3diUEplT1BOdXY4eUsyRmhrY0VwSEJzaFNO?=
 =?utf-8?B?UnNXd1lUeWFoWlM4SVQ1Y2FuTjFkUTZjNm9rOUhPVWgrWWRZWVdLMTFNYkVR?=
 =?utf-8?B?VDVqa09GRWlOK3FKY2pVeFJIUzBDYitSRXd1anExSGE4ZnE5Sm96ZHZWNFlw?=
 =?utf-8?B?aWpFTmhKNFY1L0lQUHM4QXF0MTNvVStacyt3WEZkZ1A0cWlRSzdTSVFuWVVa?=
 =?utf-8?B?ZEp5SDNhMnE5VWRRVDRHdTB5MmV6cTlMZG40ZnJWZkVSRjlMcHJHNjZMWlN0?=
 =?utf-8?B?VUwxL0NDTEczb2lhTkVPQTBoRCtLWEdhZzVqOUJlc2ppVHlCU2FHYUtVRUN1?=
 =?utf-8?B?K3BaV2p0LzkzNjZwYmg3YWtZbEgvcitKbGNMYXFtaVI1Nk9FNGNqZDArZnFk?=
 =?utf-8?B?LzN6a0pXLzhUNWhhVU5iY1h0Ym5iVmhNaUhDRi91MFRXT0lXT1IvdVJKYnhU?=
 =?utf-8?B?UnQxd3ljR1NUMjlHZmpTOFIyVDVSU2Z6S2dIWHB4MGd1MnNhdFFvNkFpTHZt?=
 =?utf-8?B?M1pidmcvZjAzNHU2bjZYVUFsVTJtNGpmOWxDWDBxbmdlQ3IvOFV1NFhRSXV4?=
 =?utf-8?B?QTB2cXo0ZnJvYnBvWnFIdTE5cWxtNUdvMUdjUVVHY3VXYmN2Rm4rZW51Qmpk?=
 =?utf-8?B?N2tjQ3UxQUw2S0dSME11KzEySWN6S2tIUmUyK2tvK1hRc0Uwa2R2T2lyUFdq?=
 =?utf-8?B?L2ZKMno3cHFDTnNGSHJvamZoVnRuSDBLT21GZTc3bGhheWZYV291TFM2a2xS?=
 =?utf-8?B?RVZKNytJclVSOFNvNTR4SE9GNnpFdXpNK0F5VFptNjd6M0hRUlk2cFl5NUMw?=
 =?utf-8?B?bmQ3b0pYM0t3Z1o4am11ekprc2U2c29KcTVKblJOYk9FSmdmWU9yWHN4SzFt?=
 =?utf-8?B?Z2Y4cEJCU2JtL0pYS3lMa1VXaE1pd2p4TXY2MmhOVkc1N1Z3aGMxTXVrREdz?=
 =?utf-8?B?ZW5EZDNjcFh3T29Kc2JpdDBpU0JmanhrRmJVS3VFaXh4WExkVGNIZ2YrUUpy?=
 =?utf-8?B?R082UWFmNFRGWklBWTJScS9BZnFYak9ZMCtpMkR5dEFPUDJXTmhRYmlTN3Rs?=
 =?utf-8?B?eERXYzgvK2UvVi9UZUkwYmFpZU1PSW1icnBTRDVpM295ZlRNMkhtcGVZeW9r?=
 =?utf-8?B?QUJuY0UzV0VDNTFEYll6S2Fma1lkRi9FeVUvVHcwd2ZnSk00Ny83eXBFNmMz?=
 =?utf-8?B?WUNDRjQ3UHJzOG05amswNmxZd0hab3hvanZ4UGxmcnIxdElMcEF4QkNzazBn?=
 =?utf-8?Q?z2Gw=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:51:54.2604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e02c85c9-909a-49bb-24dd-08de48178e65
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185201_245184_3E7A8DB2 
X-CRM114-Status: GOOD (  10.16  )
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


