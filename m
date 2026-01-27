Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D65FD2FEF4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MD5LVJEHo0/6TUFh2SRUlT/sKBXMNwEVesa7vYpex3k=; b=Z1gWSBRGujFpjICULqSpdF7Cp8
	cJjHCUdugnzFvU1/3IooWL2gizFROeFToYmCxSSaZARyDIxz3AP0nHJKdPN0A7kVtArRGdPFEy1NQ
	ziBCtMIwJ1CQ3YGB1mgFvpaQd+EbWtNgemJuI5yxgRFIujCVplMZjbuHL1IY0F1trfOi+Ai+sdscR
	hKfSGNE1ZnbTYktM4/p1+EqdU9DzV3s/SI6HiVPS1No701mbzEl7CNBIX91eLZ8PFfgsRv95hERGP
	9+zch7aPQsSb70hOl6NJbovz16QJIxpEK8ixwhDrnZgT4xMp3ijyOY91oHry1jkSz5p/cqa11WETv
	G35MWqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrj7-0000000F7fb-015r;
	Tue, 27 Jan 2026 22:40:01 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrj3-0000000F7cq-0Dsb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 22:39:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkXUxtpY1Vzl9VOCdRbHMi5DhMjFwRpm3mE+z92gQjdpQmRclMsbOqCd8jm+JYyVf1l5DR86TTML1mea04kydlOxpC+FjyffCvsL2+3mvfUe1ToWuQhNlq+aiIwGFUf7GwmM5Q3gjOCULgJwJAMmapdqGn3Tgmypuzcb8sTB+WAAEA+3xQQ4AZNFUkdANJi6GTs1ihjCWksGgTfhbXgZzpbiVzCvBGOr2OwDJ9l8g/1Oazbdpw1DygQ5P+wsn66vUuSfQsA4ynq8SAEHFJVoIC1LzNHcRdoRUa4BRmoQHwfxNfV2L/29i4drETh8fmF3LeOjwc7ST3yOcrqQ+GAzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD5LVJEHo0/6TUFh2SRUlT/sKBXMNwEVesa7vYpex3k=;
 b=GNcOX7GtjwiyytSYzUz+Blcz0KfkoEB2HnO3fb6LLOnfrrBSgWO3voGShkwGhvbiJBAPOpeRj/ueIHwZ4i275HSzxO2Til4TuhF/ucxZIb+dTTJpKDACE1UN9XuJupZ/xqTsdjE64E01pBPQ0go2fUQmJwVrVTUiRi1BKtgK2d/d53GMEQXVQcwejGVgC5lBNvW+C0ABGJVswFhAFOWMLx+HuidL5Us1N3+WpKjM7lQllL/uebUyOPF1px3b4Jxelec/TXgamT5qsderJB9bI+VznRcYaZVXGJcurTeLtWSiMhSHbdwMyIA1cveVQBw91QfBHzXF/rupRF18ikXMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MD5LVJEHo0/6TUFh2SRUlT/sKBXMNwEVesa7vYpex3k=;
 b=w/i9pDb85eQJOR4KOJkfoWM+4sP4oSCgBFN4vWCcnEkqLwgDAUz1TwrXAIgf81xPObdKk0NJ2QHwiy8XuQW3QgT2rHE/MysxXwgV4egKJef1vXNksNm3PhVK92GsiJlwJUIZ+7dHDfVDgNRSL4mnAlWJZVThySHh5FDmKQmQaZE=
Received: from SJ0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:a03:3a1::11)
 by CY5PR10MB5985.namprd10.prod.outlook.com (2603:10b6:930:2b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 22:39:52 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::96) by SJ0PR03CA0366.outlook.office365.com
 (2603:10b6:a03:3a1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 22:39:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 22:39:50 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:39:46 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:39:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 16:39:46 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RMdjvF1270209;
	Tue, 27 Jan 2026 16:39:46 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 27 Jan 2026 16:39:38 -0600
Subject: [PATCH v3 3/4] arm64: boot: dts: ti: k3-am62l3-evm: define
 WKUP_UART0 pins
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260127-v6-19-wkup-uart-wakeup-v3-3-e7ccac761f3a@ti.com>
References: <20260127-v6-19-wkup-uart-wakeup-v3-0-e7ccac761f3a@ti.com>
In-Reply-To: <20260127-v6-19-wkup-uart-wakeup-v3-0-e7ccac761f3a@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Kendall Willis
	<k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769553585; l=1063;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=60D6F5QFF5hd8YtZ7M5iDXWtsrqckkinDkUHwBhXCwA=;
 b=LA/fyBQzZWvWpjbOH9Frg4hx5VVwyTmAT5EI/gbYUDclesGV5vaeQoKGGPG+Sol4TxYEqfQ7N
 C+vOUP6aGuFAFjFCnRz24b/fQo9r5vbPcczmJBItnb3Zl2cBtnhy4A4
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|CY5PR10MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 8656d70b-dc13-4017-1e2c-08de5df4fbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2krd0Z5VUVnMUdCbmN4TGlLQWZ6NlFaWkNNVGVkNGR3VkpVcEhhb3JOQnJP?=
 =?utf-8?B?Z2pweXJ3RGUrdEpvMHZoUlVJekJLeUFQbnVFdVNWWTlzSzhWZlBDOTYyejgx?=
 =?utf-8?B?akpoK1duSmZnL3pvU0Y3SCtPT2s2eFJuWEdHdWNGVGJFVFp0SjY5dW1pWlAr?=
 =?utf-8?B?NkN1Kzd5MnNldEpzYVBSakdSajBuL3Yxd2I4UkRtalZYK2ZnWjk2bkpOL3VU?=
 =?utf-8?B?K3dxK2JIeFF2bWtWRWY1SExURERXdFpiOWhvOVVzdWF1ekp6ODBQUk15Z1U4?=
 =?utf-8?B?dVRMUGtMOE1PVlVyY01Wa0NSTEdtcjFxSktTRHNmNlVYci85cHBSbS9mM2xi?=
 =?utf-8?B?Z2gwOHZsOU5oODdpU1NXaVRGSTdSVmlHcTNvQVVYQ0MxbWVKbmYyaTVhNWlm?=
 =?utf-8?B?MHorcUU2aTd5N3E3R0FTWEdOY0N6V2tVQ1VpTjM2N2hNMDdnRnBsVnROT0g5?=
 =?utf-8?B?bWtPWERKWDByamJBcU0zVW1UM2NPbHM5dThQaDdFMjIvR0ZmNHhDaXJZVm5G?=
 =?utf-8?B?aG4xQnNHNGJ3Ung1eHBtL3U5cHV1a1VFczkvckEwUm9GZ1VTd3luWmgwREVF?=
 =?utf-8?B?N0tZSG9LY3FmVHNUWFl6OUpSTUV2aDBhN1NDdGh5Q3dPblJaU1oxKzM0MWNT?=
 =?utf-8?B?R0lTTzZJMkRINldLRjVqU2ZWc1FLWG1uNzhMZlFNM2xTU3NvTFIrRmZhNjVH?=
 =?utf-8?B?dkFONzk1dnk0UG12UnI2bzBhMlRXQzZkbG5qZ3Noalp3L01yRmptMnlrQk04?=
 =?utf-8?B?bnBrV1pSQkFiYjd4aDF1QTJ0NDBxZVh1Y2NLYkJheEpuS1VDekJTWDFscFFU?=
 =?utf-8?B?aUx5Zm44UFI4TzJpR2twdG5YbVZqQU1xRFhpZHc5VHZ1d1N0bHA1UDlnQnlI?=
 =?utf-8?B?aHA1SGpDRjFpa05aa0hEc2pZTm83ZmVEYm82QjdRbWY4S2J1cE1OR2o5ZDNr?=
 =?utf-8?B?c0lUSHJLTm9IVmk2T3g1VjJnalBhd243dU9jZFJVeWI1OXJYbnVQVjk2Yjdp?=
 =?utf-8?B?dEVFRWNFT0t2ZllkQ3QvYURGbGNZbGMyMXZPaXpJZUNKNFNIVDlDQnJXM1gx?=
 =?utf-8?B?a0dCeGdvTG5tR2d1eDBvdEI4TlB3aFNCVDZWZS9FRmtqeEF6SmkwNnl5RmdP?=
 =?utf-8?B?enBic3dDTWdYNjVNU0RoK1JmY21keUs0Rk90VGxmQURuMUd5Q0t4VnY0bWlO?=
 =?utf-8?B?TWU5ZzRyUy9vY2laSXNnWEx3QTZteC9GQU15UHE1WDFxYWdPRzRKQUpsWDZJ?=
 =?utf-8?B?bFlrZjJmNCttcGlzWmlLNUFZL3N5UzVrb1VoelhxTFRJTVdXb1h2NlZ4bVpS?=
 =?utf-8?B?VUFnbjRUMUh5cXBwYmlkQ0xwaTgreWswQUZkVUdITzNlYWd4eFZJekY5WnM5?=
 =?utf-8?B?VVVxbnEyLzZhUEFQUkJ6dG5iZmpZNUpnN05CK3VKeHNjK28xQkcvRVI1Zkc4?=
 =?utf-8?B?bmlWM3JWQThXTGhwdy91eHZHcVVsaXc0ZTJLWEp1L2FNWjBqMEJMM0pXOVQr?=
 =?utf-8?B?T05ObDBCT0p4WHl6TjFtZkVmMVRhMnNGYVdEUFZrWWY1NEtzNWpTNW9FM3pG?=
 =?utf-8?B?UlNaVWwraDRCa2tpTnFma1ZpWDR6SmpJOXp2SDhwSmxUMXhYU2V0MnR4dk5C?=
 =?utf-8?B?QnBtQUFPamlGSE5CWXdLTXpsYXN5bjlhcjZpUi9lYVp4WTQ4Q1FyMHlvNWx6?=
 =?utf-8?B?V2lOdjhSay93WktRVGI4MnFXYjFEd3RTNms5RlhsK05NS0RGWUx5b3JSaUVj?=
 =?utf-8?B?a05XVnVzVHdZVmJNc2ZmL2VCVkN6VVd1d0VKMUtQM3VHVFZoODJob1BRejhU?=
 =?utf-8?B?Z29YT3BsZHFNNm5qUGh0dWNwMkxGUnpZMHgzNE91ZmY1dzc0ZERQNjcwbldu?=
 =?utf-8?B?N3NNRWJ4bDVqbE91K1RJZWVIMDN0Ly9NelAwazltR1BlV0VEM1loVHJXNTE3?=
 =?utf-8?B?ZlRjK3FFRlFvWmt5ZlVocFMycmtqMjJEMmZ2cFVNbHAvWXNINlRZN1UvOVhx?=
 =?utf-8?B?SEU5UENTa3IxSm4zcjJ2eFJvZ1pFNGhZWkxlV2xnUWllSW1QcnBKZHp0dlMy?=
 =?utf-8?B?OHdTbHpFc2dacWkyajNZcy80Ty91Y1kwdDlkTElHQy9kTzVXMnhaMCtEdlJV?=
 =?utf-8?B?WEhBazRPanJOV04zRFpZQy84TTBkWHhncHpSK0VSZ1hERWxIeFVCM1hYaFpR?=
 =?utf-8?B?MmtRM210RzQ5SWFEd0k2TkdFK0FpL016ZWxnSkVOcTZ4Y3dXL3BZdkpoVXp6?=
 =?utf-8?B?QlladytqVG12K2NEU3NsTGE3bVhRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 22:39:50.7784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8656d70b-dc13-4017-1e2c-08de5df4fbae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5985
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_143957_109738_71FF2098 
X-CRM114-Status: GOOD (  10.06  )
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

Add the pin definition for the WKUP_UART0 node.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index cae04cce337366b50928d39b0c888550b14e43d3..3ac9a2d0d9cb78d87479c4a8aed5c0b1f1cb3faa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -306,6 +306,12 @@ AM62LX_IOPAD(0x0238, PIN_OUTPUT, 7) /* (D24) MMC1_SDWP.GPIO0_123 */
 		>;
 	};
 
+	wkup_uart0_pins_default: wkup-uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x0000, PIN_INPUT, 0) /* (Y22) WKUP_UART0_RXD */
+			AM62LX_IOPAD(0x0004, PIN_OUTPUT, 0) /* (AA23) WKUP_UART0_TXD */
+		>;
+	};
 };
 
 &sdhci0 {
@@ -359,3 +365,8 @@ &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_default_pins>;
 };
+
+&wkup_uart0 {
+	pinctrl-0 = <&wkup_uart0_pins_default>;
+	pinctrl-names = "default";
+};

-- 
2.34.1


