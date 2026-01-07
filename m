Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74121CF6BE2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 00:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wesr2RZ2EUP/kkwM8kXYOwfl2oFJCrsZ2dlyB/ht9+E=; b=OeZenlW7OREnIlvZLBZHTGlOXt
	+FVcDO23wYaxjhn07TNaTS4Ez+PeeQUuyritegI0keUF+RZFOl9/Lvn2QTHKBZuDDyybi4GQf3STh
	XUh9GYpkr0xxnmvFOyUgkld/FVHLBkECxpDR7tBW7bMHbIWvwRqIV0sMPcUy5l8bGehoBJrwc9mpb
	kIZ8TKBIznAHzLxt6ciUuq6Nc0G7Eb/mJqD2SFqmOrIwqsQ+cTtqI3b8SlS1iaO6Mhk1jQrD1aODg
	aibWm2AybDZYZDJgllOJt9S8rIwGciGhri66JqtDLOlMilcwJx04DnaCHC3yGZaeJnV2yRf6BV6VH
	50rAp0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdHdJ-0000000DyRw-2Wtr;
	Wed, 07 Jan 2026 00:42:41 +0000
Received: from mail-westus2azon11012046.outbound.protection.outlook.com ([52.101.48.46] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdHdF-0000000DyQc-39P1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 00:42:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nicl8zgWVUsZ2KFTsqpQngoTMPjualSVs+40j5+w9ZJBgNqv4hKcUm8m4SkVQFUjyONVwnUqQlqHDoPrZlyrwgBO6HcD7tXCPC2JkCQE89B2MRf2ldGuIwky78FWydrdMu1/Kmax+TDEC3HS6FyAwjdsld7VSOcweUQFv2LBnKRB2hSCxS8Xd7zsrqY8/Lp1ZY/8ATSOqgboHpJgHlykCzLB8pYs0udaXVERyrTPe3MXGhbkofkhbBJhvlxiuU1txmVYxytGSdeZyhtHJ1+WWU2Bao24XHmJARsSyrlE7rsfIrmg+vjiMbU76NrqwPNmFleik9S+fGo4gs8Xs4nmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wesr2RZ2EUP/kkwM8kXYOwfl2oFJCrsZ2dlyB/ht9+E=;
 b=NrEOdGeM53df1Ec5Fy9tOkFcFcV2386BwsO9nLLvzIUyjVdVoy/brXSQ3Ly3bbqojV5AL8Oj2xpJHnmHsVm/eHjQ2iHLq7KdPANNhvtsAcwAZbPRMYxW3GWLmjktR36s5lKw0x51h2A4THs+TcVRuMnfcpBOCJS8+W8HI8MJ48WEIp3wF46qMj+71eanHgHmk8ICW3t0kV09qGfowNPCEL7/XirpgF/X7cp2qlgxBEiSMsdMQu1cWtA/ljHKi30pZPEUy43LH/BM1RRDd529HI5ohbRKaW7uTr5lZdXrIJUWh3Ck1YnvJ2UWl9PnoODxYrFl1Ws6n+hgGnXx43Xh0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wesr2RZ2EUP/kkwM8kXYOwfl2oFJCrsZ2dlyB/ht9+E=;
 b=sW2sgmjC53wvIkWSdymFn4zYaEdYQLe+cBfYRaXmAHPwBhqmoQcMxmCrWuManArtoV5vjosP/q4314cm8gW2trCH6NEFiC6eomKwUw/aaZHKMT/f7fkR0/Au3KQ9cc7sOd5LG2c9Xr1aMyAHmHszQ/WlxDR3efp/NMsxR/zmw3g=
Received: from BN9PR03CA0066.namprd03.prod.outlook.com (2603:10b6:408:fc::11)
 by DS0PR10MB7341.namprd10.prod.outlook.com (2603:10b6:8:f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Wed, 7 Jan
 2026 00:42:32 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::c8) by BN9PR03CA0066.outlook.office365.com
 (2603:10b6:408:fc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 00:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 00:42:31 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 18:42:26 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 18:42:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 18:42:25 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6070gPrL3856461;
	Tue, 6 Jan 2026 18:42:25 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 6 Jan 2026 18:42:20 -0600
Subject: [PATCH v3 3/5] arm64: dts: ti: k3-am62a7-sk: Enable Main UART
 wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-b4-uart-daisy-chain-dts-v3-3-398a66258f2c@ti.com>
References: <20260106-b4-uart-daisy-chain-dts-v3-0-398a66258f2c@ti.com>
In-Reply-To: <20260106-b4-uart-daisy-chain-dts-v3-0-398a66258f2c@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<d-gole@ti.com>, <msp@baylibre.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <khilman@baylibre.com>,
	<a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767746545; l=1898;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=J1q247fmp/yjxkmpD0mCxbuHEfNJBYjhRwV5KoKaNdE=;
 b=1lxW9r8mGCZrjpAN9TgpDdn9qhVbl5b3e8USFGI9uUDUwb/VEUO4s8yDPeqmEASmXOzCGLxnJ
 8c41EUzM+IsAE+X8nk45mspagR11mKjclsBOpGUcXqfngNwXh9H+dCS
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DS0PR10MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe0df6b-cb25-47dd-2c5e-08de4d85a40a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ry9MNVVvangvOWxHc3M2UGlpTXpkY0xsaW5jWHJuT1RjQ3l0ejErc2w3Mkg2?=
 =?utf-8?B?UE12ZGg2YUxYNFRjWmRvTnh4bFpjZm1iMmhmRUJLVHpUOGJ5THI2ZjR0UGFw?=
 =?utf-8?B?RVlGOHczTTYvNDF4WHhmL0dHaVdDN3RzcGMzcVVzOEZ5dFVmQlIzUmJ2QVhW?=
 =?utf-8?B?SVV6SG5GNTRIZDlaTml6QU5lMThSU2hoSndhNlJUK2M0Qm42MUVMK3hCZUNh?=
 =?utf-8?B?ZElGZWRlZjNUUVJSZVdweXExUHFMeWFsNzVPeFo1RWRyb2VIMnloWFJBRFdV?=
 =?utf-8?B?S1JvYkpmbGxiU3dxVTNlci9YdDVFV2VQUitIdHZiMFRqd0RpM1p4MjdzUm9R?=
 =?utf-8?B?Rnh0S0RJbmVra2JwazZHTHRYdHp2THVjbTNlNWRzVmxvMlMwQkVQSGRYRU5p?=
 =?utf-8?B?TEFRd2MzdUhZeFNzM3NDMy8raUovWU9WL2RDNW5MMm1wY1A3WHROMVZCcStR?=
 =?utf-8?B?eFZvNUlXU0w5Z2MyT1V6dXBwSXcyUXpwbkNodkVobHlMTnRaT001NHBhZUtR?=
 =?utf-8?B?NklVT25YbFRoSy9OWjRoL0kxdjZnRWRsQXhjVTdycnNobVVJMWhBNFFHNWRm?=
 =?utf-8?B?cnJDQjk5S0ljTGZDQW5HYkxTdnhHTmZQVVdLd2RzT1hmSUtFOEtpOGRab0VS?=
 =?utf-8?B?ZS9YbVIwdlk0d1M1bTVweGRyOXM1S0RPNWtGOFEzdU1GcUp5Rndja1hTODJK?=
 =?utf-8?B?aG54WXZWQklrY2RIMnN0czE2TzdSQmY1TE00TjltN1ZYbEFNbEJ1cmhiN3VI?=
 =?utf-8?B?Um9adjZ3NFFFRDdWS2VLWlBHUU5ORGJBZW9vOXlxYmhQem9yVFIybkhXUE0y?=
 =?utf-8?B?a25lOVgxaEdtVlBlR2syQStGa25XMjFUZVZKWlA1bVVJRkoxc1l0dnRNdGg4?=
 =?utf-8?B?MkJlTXE2SHZMbi9UcUplNy92YkVmWjN2dEJVWkxwdDdnRzN6Rlh2NitIQzB3?=
 =?utf-8?B?eFVBNlBRdUlwUTFLeTV3eWN0WFFPRFptRlRzbE5tcnc4aEFaNUNXTVJ4MVdv?=
 =?utf-8?B?Wk53QVN2Y2Qzc2p3QVQxbk82WHh4OTZBZDBuYnF5ZjZPK1lDUDhzOHArODJW?=
 =?utf-8?B?WTV1d3Y0LzdqcEFBMExuKzlRY0hpRW9CVjJVRC9FY3BaRmd0NzUxenhuTUZM?=
 =?utf-8?B?SHhLQmFhbDl2blQrb3VCQzNKS1V6UjJrSFlLdndBQlI0WW5BMHFZeW5UVDZJ?=
 =?utf-8?B?ckZ1Ky9lWmdoaEJjOTFxNFBQT2ZoUHJVb3Nvc2JNc3RLOWpBOUoyM3NvVW5u?=
 =?utf-8?B?OTBQcUVSZkxxNDhtUEhZVThLVkt2eE9ZNE5XZlVCbGUyRDNLMzVVMDMzWkF5?=
 =?utf-8?B?ZDBKNW5VKzY5dDNyZlZnazE3UnpxcEpqTnUyU2JWQ2dtamhSWEcyUHdYVFVF?=
 =?utf-8?B?KzVjaVNXNENHZ2FzL1RiV2FaOFh0cGo5Qi92ZlRlakExb29meGMySFBWUS9X?=
 =?utf-8?B?UXcwa09ERWhTUmVUV1RTQWRsYktRTzRyQmZMWWlzS3lXQTV5TGFUYnpmdFB0?=
 =?utf-8?B?RHpCb010VU5mREZteW5waXl3YlMrbW9keGVtUHNzNE1Mb1U5TlVRMEZiKzJh?=
 =?utf-8?B?WlpJY3cxZHgzVG51bmVxRDJKUU9ZeG45aFd4dm80eVdRNEp1SENuUkhlM1Bo?=
 =?utf-8?B?OFJVVUZWdkdZZDg5elh3dDdSQTduRXQ3eVNwWGRycWVPWXJmYTlvZElEdTNy?=
 =?utf-8?B?THNIcmc5QUZnVmpvK0lWNGdOYWdZS0JPWGpoK0hDWnhKREM3Uzd1L0ZzS0I1?=
 =?utf-8?B?bjJlS3YzazRwWWVUcjgrTXdsRVBqbnExMjkrUk9xYmhQMTg2NWdYME1HVmMy?=
 =?utf-8?B?UjJ1VU5NVW9XZ1I4RUU2V1pYd2hKdnRGYVhpeVAyb3pjU3dvcTNEWEJ0Ynk2?=
 =?utf-8?B?ZFFzZDZHUW5tVmROTGhqa1R0dmFaTlBicDJqWWdCRWR3SVVzK09yeVBnZ3Fa?=
 =?utf-8?B?cTMzdWdIM2xlQ3Z4d2RleEh4MFJBbzA0dGZyZXFjN3lJQnNpd2RSbTRMZjU5?=
 =?utf-8?B?WHk5Q2tvV3JmcFNzWStoVE42MkZUcGdNTEZoMmtqTks2UWNBcVNXcjVxaGZj?=
 =?utf-8?B?VGZjaGsxYkpxSVMxQXd5L2NTZWJQblp6dGdBb0JnWWVRMHI0NTBsVjdsRUls?=
 =?utf-8?Q?1eKs=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:42:31.0236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe0df6b-cb25-47dd-2c5e-08de4d85a40a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_164238_020715_830BB18A 
X-CRM114-Status: GOOD (  12.70  )
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

The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
is enabled. Add the necessary pins needed to wakeup the system. Add the
system idle states that the Main UART can wakeup the system from.

The UART driver uses the "default" pinctrl state when the system is
active. In the suspend hook, if the UART is wakeup enabled, the "wakeup"
pinctrl state is selected by the UART driver in order to allow wakeup.
Upon resume, the default pinctrl state is selected again.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..112f0f2a3d449b324d479c0e2a7d07d0ee57caf6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -282,6 +282,13 @@ AM62AX_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
 		bootph-all;
 	};
 
+	main_uart0_pins_wakeup: main-uart0-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62AX_IOPAD(0x1c8, PIN_INPUT | PIN_WKUP_EN, 0) /* (E14) UART0_RXD */
+			AM62AX_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
+		>;
+	};
+
 	main_uart1_pins_default: main-uart1-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x01ac, PIN_INPUT, 2) /* (B21) MCASP0_AFSR.UART1_RXD */
@@ -717,8 +724,12 @@ &main_gpio_intr {
 
 &main_uart0 {
 	status = "okay";
-	pinctrl-names = "default";
+	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&main_uart0_pins_default>;
+	pinctrl-1 = <&main_uart0_pins_wakeup>;
+	wakeup-source = <&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	bootph-all;
 };
 

-- 
2.34.1


