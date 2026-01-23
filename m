Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF17D6CFB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 02:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYgRvvO/+cltPCZGk3T72d1EKBU1d77mv1jxnbTSFQk=; b=cOIXeKTfP05YnZVgC0wusLlMDL
	1wWgpUFsEmFXU5BKjAwhKmuPPAqYBzFXNNycghKhAiMpG8mTXpkHgvCooVyZCzt8IhuCmBDIni1r1
	HbyeUv5c5U/Ln4Cg2kHW4Ee/FE1VqVBfQl72yDTGhvPZmijcSIZEn51PGKbYs6jjYpMK2yjQ2rYP0
	/M91gi1glDVPfJDpFiOZ+tawebPs6kh09BpTwft/gpSFFzgn3yjv+E3iylU0k/kA4SEHZzu9CP3H7
	LTbpkbW518mkPCWCzynEAl8+sULyyyjZuKW7Uth2gmQFwhAteJOvKs+HFZdHGUEUg07QbvZP06UZx
	vbLdsO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj74g-000000083FS-1AYz;
	Fri, 23 Jan 2026 02:39:02 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj74c-000000083A4-26bY;
	Fri, 23 Jan 2026 02:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWi0SSsWtCFmIhrMCO6gy3+hSShJDCVJndJ1C9NQZbWXMEQsXKTv5mlCLOh4VYUlE4+57aDzA5euKsxjDpYQn1ui6TAGBSAIXi/zLzQar1lEmebFkkYKwu6HQunUZL404cc2Jbsh8X1AtuL6tqwQzDUfmlI8SDJ/viyI3OFpJeqe00qYcY4vgzAgl5ee/bQpxwf3PfM3zvA/vdzK3BNf/6CUsCgwq1N8muvXEYc4VBaHICvPu9o6Gh470zCX11bhvwztApx7d5TWQecJM3KU8hFWl2UE6euJg0S48Ojq4GJqEKQCPWAXocPdUGgKfj04DgKIZ3UeIzK7eROnE6yJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYgRvvO/+cltPCZGk3T72d1EKBU1d77mv1jxnbTSFQk=;
 b=GR7jCYfWByJ6OGDOGmzFObHFg6jZMpk3KaW1FbLTC084g5TnXpssY2ZSRrXPNwsFaHkl8Xb3txzZSzhb+mQZqQgAqfHQX+XsbJ9JcS0FrMrVIRijgw2tTlucWFWgyRS6V1tQn1c+nl+ybzPjWAh4qtKBgILu2jYXa0IKpUKnJSTuXci33NyrGirTrgnifHyEL6BDLSQmNTAA2SyFGWA1azV2uTHOwvFU4Zr9AvwPPj2WTZF3ZCs5/03pvAHuK15f2ptqVBizOEzTNs6WVCpw1PfDHhyaoji2VnFiwjOa1LIJInnKZYuyrmg7H2NLp2RG8auCii6HztVPOPUppBhztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by JH0PR03MB7558.apcprd03.prod.outlook.com (2603:1096:990:a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 02:23:17 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 02:23:17 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	xieqinick@gmail.com,
	Nick Xie <nick@khadas.com>
Subject: [PATCH 1/6] arm64: dts: amlogic: meson-s4: add UART_A node
Date: Fri, 23 Jan 2026 10:22:53 +0800
Message-Id: <20260123022258.136448-2-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123022258.136448-1-nick@khadas.com>
References: <20260123022258.136448-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|JH0PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a92700-05b8-42b0-2d62-08de5a265e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q7lNaBiabUR7sbovnGhjpv1es9fm/Sry3qSgm+tGuFQTA64Qq2lxjcZ3jWW/?=
 =?us-ascii?Q?enH63ytXEi0sVzM6uKjKe2QZq51QxddVj9jKAhCLyycUla6UNJs2Ci9RElhm?=
 =?us-ascii?Q?Lcju8nzQ05E928wSo4gvfHKbl87T2VDb9c5GTojlSC9aa43uT1Zl4RSao4nS?=
 =?us-ascii?Q?oEqUa7EtpshoXeg6YEYFrV/wN962w5pRFaLjEbjW94IPnb5XtIHusURhJ8sF?=
 =?us-ascii?Q?D9y7fWJJXHSMxDDrZVs+Ihlk6dXoZcaP7ojhKfPd3JbOsbx0EV6NyIMkEo8V?=
 =?us-ascii?Q?y7iVxzAIig1ssw0TZmEaxooOEzgs+g1ETYQj0bffNHzQWbhQOhK6LnU6/Jp6?=
 =?us-ascii?Q?IgrdL7+4MCwdUGeX8dMfFVwxsr3j1JcnfjozRjjNQlpf0UVSy39oT7JwzjRK?=
 =?us-ascii?Q?2v4Ky2BLr5LmTsPFOJ+v87ipz+65SMyoFbXW1Dh0M62RDZNNbDtvbI3c752r?=
 =?us-ascii?Q?8vQnlco+gWem7Bz8qF4Cdt7tVZk+9mAHJnrJd4zQ8T5oJF/SaAmxd/BrrHHI?=
 =?us-ascii?Q?No6uO/P6Z139yQexQ8Syljm5K1CM9OdyC4I+llEjpsjdBDNpahSRepflc7Cd?=
 =?us-ascii?Q?2Y8azaZCaFUr9aNTBSkhktwiNxFSk8RhqNvuOsHcMD2M3SAXQhDBAlIh2DjS?=
 =?us-ascii?Q?SI3gFvsZw4eC8xMmAmt8R3g84eBtq6tOSwYtQew1bDclvbUUVAakwlUmgNcz?=
 =?us-ascii?Q?ilR1cdwYL/m31aG03mVDGeaA3qFXljHT6EPMvvOob7w/yz8A36h+xjxF3zqJ?=
 =?us-ascii?Q?55Mjrt8WXlYxppLisOGLoUYraiA/mymIjDFhRIFSRVjCpIbs6JcRTpDmVI0V?=
 =?us-ascii?Q?JY6EOqGm9DQp7VXKzgDSfVgPh64zwO7osUJ0GdsTMgb9//FjuABVeyCvSrrj?=
 =?us-ascii?Q?72uSnB64dX72Y5md1ap+wreEf6x/oDP9CuoUGlJcGlg4i0CnTQddg+ZQInOj?=
 =?us-ascii?Q?p5sza9o7a5LM9FIUSDt0QH1rvvF/sx8/hWbWGyDpcn/aCV0PRdOXtuOxkb16?=
 =?us-ascii?Q?pUOka+y4tOvI/2M53vcK8we2N38U4tpxX4KyPtkFk+eTCGrfcOY78IpSSmE4?=
 =?us-ascii?Q?w6+cvX2aI4uQ4PlXLOqhOxrIR8m/Ai3vuR9/EAVr8AZN7AA9ZXvFdDRMECaH?=
 =?us-ascii?Q?weTAz4Uh4dsyCi2WRkv7KPFFYAAFscfCRkl/8sZV9F3sgmDXuWE56bOVqm+Y?=
 =?us-ascii?Q?7n4aTyhpDevpIGoSvmNrno5irp2oxn/VhxB7zupADIgGtLNrjPjNm5ElZWXr?=
 =?us-ascii?Q?cQFVOPcsWy2O5Tlnl3piV/mwIUC9Ogw/xNcyYlQLaFKbQiqoPSM+a6Odu/GU?=
 =?us-ascii?Q?dmUCCN6WbcpF5Cz80Cs8sBKkIfdci69KKCRt/Smk4ZTA/3ICunwwLh9C/DNq?=
 =?us-ascii?Q?YR6qsIHrpz36T68WY9yxJ8g3x85y+JFVOVDDlCx3g+nENhx89vli2Yttwhlp?=
 =?us-ascii?Q?ZHQPlY3UTQf6Vv3kiyd4hiAI6Kkov3zJZAIzDzTbcW9I/dYlWLYssZlflp2E?=
 =?us-ascii?Q?R5aXXgbEO6uJbvcE0ceSHQfaZeurcap1C0vWAlCxz5uUq1z95ZcmD86JGK0b?=
 =?us-ascii?Q?Cw9z5nIOHU3Xol56iLijoIDUpBX3jIdqYukDaNhfQwlPaxL0X9wcVtbNwRSg?=
 =?us-ascii?Q?TiVwVznhgyCwaCLH0T2wFu0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tx6MRWXu2O/DFp/YkQ6SaVHAwZ0tAZQTLpK8aOOsqsoMM1mzwjJAqgTr10si?=
 =?us-ascii?Q?Tx4PoHhsLEYQZVSvrikJhDqt0ldSbVIV+TWCZfMBocdJfXb7wnlq8szzOCNM?=
 =?us-ascii?Q?SDQWYX/YY0gSFPfWOwSSHtN0GUSUDQWnzdbInaREj40kD6u28M2E4f3/gkNW?=
 =?us-ascii?Q?nxFQvyeZcSujn7Oe5q63OyqUrk7u6r8ATgEIYWtIGEx6sdr9kuK40Najho9w?=
 =?us-ascii?Q?K9dFTWtU5DYnJnwBo2u6Oh0CKgSEDL4M9RWk3lQZuPi4xRAUeGTRgBPqATE6?=
 =?us-ascii?Q?He5IUOeVHUMiz2Bf3DmzzO8yCcSZdBZki3H0rvHT+JrNTKLnx4rjjnGnm++F?=
 =?us-ascii?Q?5wE2HhuHXnP/w6URzTmzkyxUehJKLmnTXwTFIfxTIvSKAS47KuLsDQjx9z0/?=
 =?us-ascii?Q?yP/QmvU/9ix/hudNVrmzjby4aIYU4z29x9xYssyPi0cdILzrg+gDMIzezemj?=
 =?us-ascii?Q?pp3Cv+vlmOkKBQuYrGhQERGqD8eR0vfWjHD1AR8ywECTHodW1i3fDkJnqS1Y?=
 =?us-ascii?Q?+rxOtGHFBdUF4C7VuRl3acdwpDvClKhJTaTZ/wh1Rz4uqiXBzkk2O6IzeAJ2?=
 =?us-ascii?Q?9YgfkqrVV3jZvA/eI04HWROY6j/r9d3N4HwkzsWDhwLyMWC36DQSDLL0lTOX?=
 =?us-ascii?Q?Bcc2bUn0iD/swZp0NqdFKyk3iBxWCJReOxLDWOjVTTzxNohvjXGhqLZnftc0?=
 =?us-ascii?Q?bfXMGYs5EfR/g1jBX7jsCQctMqYjyyugH1mYRNp/ne7CohnrZca3a/p35XO/?=
 =?us-ascii?Q?/gcAif6Rq2NdoxDgjR3x/hwBxbuVsdEcj0BLlBxKnHQZpCYqvLHKp6/E/9jk?=
 =?us-ascii?Q?79ar+g0ty7zlOKDMn5680cUCmbvBNj46rk/e0yhsT1qLO00MfTBYf80y5oHO?=
 =?us-ascii?Q?mz2lc/B1U16WM5TfXamsArZRGH/ZmsimHYWXtsfR51tDAYV/VeL8sIyo70rC?=
 =?us-ascii?Q?6+te2F9T0L7v9hy8ca0qA/Aa4SZYwO8Kmx7uukF+075Qhd8gXb0G5eDU4CPd?=
 =?us-ascii?Q?vthl38uxl4ZScwl0kxqG6qhlrb6F/Hr2owYDxfdvJj3Z5Ppxn7idu+s/pBwC?=
 =?us-ascii?Q?p4hyAOJHOxC6BB2nNLueQUJpNuPBrplndJ08G3P5uCEFYfhaeIGx6Z7rdFUd?=
 =?us-ascii?Q?SnYWZMp3LnTRJFOjUAmGTJpMv9Z+g79Jc5z563IiUpEKLYUHmk9VejJANVIT?=
 =?us-ascii?Q?ZAfrMyq6gVcq13RjiCgwRYYcbrve1pS7eIfJlSjYA3OtMPRAt6sLAC/en1RZ?=
 =?us-ascii?Q?Q3NAHGQLYMABMqe4AoRHT4Iiq6jrH6IlF1nWlbQliutbFI7heY2UlAp4kmzx?=
 =?us-ascii?Q?yBTKDqGWLY6UFkNjelSiBmVgLXjLMpElrNTOwDdnPrY9EO5pVwK/H/CrjxaQ?=
 =?us-ascii?Q?wyGXnOu/6qqu4+Q+kOalJQcY6+20BEJia8V6vM+7s3FcM13cRRyvTWr6lSih?=
 =?us-ascii?Q?XJUWy0JE07UdgWhgikv7faIHlKEN9Q8OS4T7eCMgdqHsATCskpg1jlduL8DZ?=
 =?us-ascii?Q?yjiHB1XEPku1n1JjY80pYDo5h+Lw02BbZtVYq61bgM919qwBsQxPaXYegBXx?=
 =?us-ascii?Q?Re2p3vwn0SCes/Y5gqeiK/LedKtizfDuAcdquJcq2ENyNIvzPOqTASZgniMQ?=
 =?us-ascii?Q?OyM4hQBa0/NZdtLqeE9FCjnxOGSeZxD0kR6mMu8v8xeTwNsIHnHKyvDsC9kT?=
 =?us-ascii?Q?pf7KKlw2YeSP4kGH+RC7LkCXp/tGbdEEHEjmHXTQUOkDSUn2?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a92700-05b8-42b0-2d62-08de5a265e90
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:23:17.7364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcdxmJCFvRt+mLXBoP/MNIgIf8pFwqEIEOHIvwJmBPWYm/R8z5QM5X04tBztISDE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_183858_547210_5E76B453 
X-CRM114-Status: UNSURE (   7.96  )
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

Add the UART_A node and its related pinctrl definitions to the
Meson S4 SoC dtsi.

This interface is typically used for Bluetooth communication on
boards like the Khadas VIM1S.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index dfc0a30a6e61b..b1d66054a6e87 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -163,6 +163,16 @@ mux {
 					};
 				};
 
+				a_uart_pins: a_uart {
+					mux {
+						groups = "uart_a_tx",
+						       "uart_a_rx",
+						       "uart_a_cts",
+						       "uart_a_rts";
+						function = "uart_a";
+					};
+				};
+
 				i2c0_pins1: i2c0-pins1 {
 					mux {
 						groups = "i2c0_sda",
@@ -814,6 +824,18 @@ mdio0: mdio {
 			};
 		};
 
+		uart_a: serial@fe078000 {
+			compatible = "amlogic,meson-s4-uart",
+				     "amlogic,meson-ao-uart";
+			reg = <0x0 0xfe078000 0x0 0x18>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&xtal>, <&clkc_periphs CLKID_UART_A>, <&xtal>;
+			clock-names = "xtal", "pclk", "baud";
+			pinctrl-names = "default";
+			pinctrl-0 = <&a_uart_pins>;
+			status = "disabled";
+		};
+
 		sdio: mmc@fe088000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xfe088000 0x0 0x800>;
-- 
2.34.1


