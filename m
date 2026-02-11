Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09B9E9E30A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3dgy7O5a0OdTjKYpPJmW1YU+0bdtG7QI4v+nJqEDeY=; b=0fvbGCbeMq24Y6JZqcMsc8BMTD
	LyBqDia277C3J8pRrVW5tiOM+aoKqsQThSXjsQbsywNVTf0ieaGPohCBBMwNerAbU4a6ZsPU23VF5
	8CaZ8C0HTipQxQRwRPvDPiTluOUiRU+FSGxWO0l8xgI0VqkrRLQVyU98RhW/iEFvNHsKnPqkeZSmf
	M4MEQ7obIspFOjfVjnZ5yXeKEPwRlfKZdcE/NOUizJQllDLHlxWiqyO/0FCLKdR+HMQntNIQq+w0C
	GQtSV4g5bWVVaywproFYX9u6skHMQfN3K1VpjI/qZQurOzTYco/at4nIpMh+vnfDhT8sSxOAHbBUG
	nYojAxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqAgU-00000000hVq-1oEn;
	Wed, 11 Feb 2026 13:55:14 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqAgP-00000000hUK-0aMP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 13:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o41ozgsAj2k5kB6kxwyQjj0CfyP1jF/M93Y7NlhI3hBzsUTmrBEvn6DqUvPd93gRhzhfiC9y3L8qLFWtmck5WS5dV03fxYJ9sRCJENUY56asoF80ckw1k1RKnSnFgew4Ovn2s8PZ+1+XuVR/OahSih+vyhfAtIMwVX8Yi7Kxa8AsVX0PnEz1/ndQLM1tvRxTLmidHkXt9CbatIWhTvBxnusNBASoz3PpljRYlV8Yy+au8+9HnLHuT33M6HZ3V++uSRUk53a4K+GV6kaL8VA7cAc1RkqwL1yiphaAndE8qzwDbXAoo1w71B84C5yDaSxCsSmkbBn23vo/nhll8mmTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3dgy7O5a0OdTjKYpPJmW1YU+0bdtG7QI4v+nJqEDeY=;
 b=jsJ3MVMh49J42k27misyzSTcBso9+hpjQ9YwygZlAsLhyb0veMQpmS1IpkkxlucvuIs3IqPgj9+TNNYh/FP+cmCactZ2NoXYueQVkPTvV5ZjIZzt6/5qaJ6HOmetzMYcLdD06F2C5UPz2N9oGe7a6JI29zME71cGC6wiM+1p4WPxjrBg7W2wVlWcbDkZEpfTyLTDhcSzFH3RqWQZ1cJbR+MUMyWw+Ao51G6SYiRy1JhJRlkdxEmsB7Ks0zTZa0RzeNWfsKrus8O3jy8vQ0ZNbgCcjObmRv4noRHYhpZUJ6ZT0TDO1IglTU+vt5g4svd6NezuzxzGO9d6AkXrsWYJ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3dgy7O5a0OdTjKYpPJmW1YU+0bdtG7QI4v+nJqEDeY=;
 b=gqXxRPK1I52N76/w+RpDkLjCLEDDWmSoGkdeT++cghREjtJjzvEsiZe/ZbWDmAFlLucp1fKTyqU22fWEMyUnC1zN0E9l5Oz7V8U7XHRVVIkljXTVAV1f/+TPoVBg/m9J8rc890kI0LWEp9+MHFCBfMdn3aewge8r8xr7WRDuvkU3cnRSi0RyCQmicxRLNMD2QqhnQG1T1dxAY4QBSub5G5L+AzrzrJLH6ul0Ny+JXYaazplYSCSFOpUncq24fr6bj4Fo9QDyKENJE326YLGb8st5HQgcIsoqkfK3kYSTCTVCPUeIJroB2/jbasdeCCqz1lOxvZkLLZ2CTvB63Dx2rQ==
Received: from DUZP191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::25)
 by FRWPR10MB9355.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:186::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 13:55:03 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::f1) by DUZP191CA0021.outlook.office365.com
 (2603:10a6:10:4f9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 13:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 11 Feb 2026 13:55:02 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 14:56:53 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 14:55:01 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 11 Feb 2026 14:55:01 +0100
Subject: [PATCH 1/2] arm64: dts: st: add bsec support to stm32mp21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260211-upstream_stm32mp21_bsec_nodes-v1-1-8379bf97b0bc@foss.st.com>
References: <20260211-upstream_stm32mp21_bsec_nodes-v1-0-8379bf97b0bc@foss.st.com>
In-Reply-To: <20260211-upstream_stm32mp21_bsec_nodes-v1-0-8379bf97b0bc@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|FRWPR10MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: 53bd0bed-d474-4fc2-3c84-08de69752749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzhtMDd6M24xb3MyVkg3ZXVDNmxydU1hQ0MwTkRTdlo4U1EyQkEzdDk3SFZx?=
 =?utf-8?B?TjMwV2lsWHZJZDk2d3V5MUJmR1FkanBwR0ZuL3JmNzBXSGFIaExUdDZmRVZ3?=
 =?utf-8?B?WlNhUUhMQnJiWWNCTnVDcXM0VEhKcVhXQ0VxcTZndEF6VGQyc1EwdEYrYVlO?=
 =?utf-8?B?M2t2NjJuQzBpc1lYWm9TKytxSlJnSDk1ZWF4UjdJTSthdkljQ3ZhMUJhVXpL?=
 =?utf-8?B?K0psVVYrMnAwWktUMm9zQXFyMG5QeFlRQ1VNM2RxN0JjZUUydjN6VnhZZUJy?=
 =?utf-8?B?MlFQUXRnWGhYSThINGFLWmtrcitTU1JBelgwUmc3cEw3aXFMYUsraml4Mmty?=
 =?utf-8?B?SkZ1YytGOTZwVFRYK0ZKZEhBbHF4ZmEzRmZuc1J1Yi81UGkvbXVXeDRPNFda?=
 =?utf-8?B?RXo4amcxZkJ0enozV3Q5bFpDMjhJRHJhdnltMGgyNis0R2VXa3lTMzZ5ZFpl?=
 =?utf-8?B?M2p3RUpwVDRuMVZJVnpsdjlieWlpYWE2OWw2OEpKUE9SM1dhbkRwT1NFRHdu?=
 =?utf-8?B?emZ1NzloTXYzaXY3ejJsbEs0UXRhSzJURGpZdFJqYnA4VmZjeE05Wk56RnBX?=
 =?utf-8?B?TEoyMzdPcUtCNDBTbEtpVUE4dzlHc2w0NHd6VWlUUVE3Qm9UdWlZOFk0M0Zq?=
 =?utf-8?B?d21WTVZZWUdycEk5NENzczcyTno2K3hYc3NNV3BKUjhCRzB1U2s1UDZzQXRG?=
 =?utf-8?B?L0JaSnlKV1JkUEFFQWJhMC9Idk5maFgzNVpEdThwS1BHaUVldTNGTzVhcXVn?=
 =?utf-8?B?VUd0QlFxTThZallKNWNjaGhyaENjVjk2dDZRei9kOExSVUpmTlJRNTJFY2t4?=
 =?utf-8?B?SitKTTZXZjZzNDJMRmg5d2FjUFNwb3VFeE0vU0ZJWUxqUk8wd3VBTFYrekQy?=
 =?utf-8?B?akRmbVJkVkVxMlFnQzBQaUliUmRhRGtiOWlPTzBIZUExSVAxeldqY0ltN2l4?=
 =?utf-8?B?WmxQODNhM0RXdTR3cFlEbEk5Z0JpZUpjSXRLb3FRQnZKUTJIVndMUUxDMGlO?=
 =?utf-8?B?MGdSNkdGYWEwSEUzblVDMjIxeDNqc0NsTlcxb2p6YWQ5czlLYUxubWwrcVFs?=
 =?utf-8?B?dmFLWEZIQTFaWW1rU1JlMjFiQ285YitsV0V5TyszU05oV3BtRHR4dlFubFdt?=
 =?utf-8?B?bW9ZRXhpcDVNVEkxTnhLWDFuckQ2K3B0bUQyM1dRaENud0FOWVBtMGFuWWlM?=
 =?utf-8?B?QUxvc2FFMGhjUm9tdFA0d2JtNUFhaWN3Nkp1NXk1OFJsejJLNDZqbzd2YjdS?=
 =?utf-8?B?ejQ1RFBLcEpQdU9lZm41R2t2dTF1akZ5ZlBTYTBVRmlmVjN1a3hOTWU1bzBq?=
 =?utf-8?B?enZ0czFKbEFsWTVTeUhPS1hMMmthcGVieDNybVZVclhIT002NExrNUwzUWVK?=
 =?utf-8?B?YzRNMGVEOTR6UzdIVFFZRXFmdUY2MDRkUkh4SFZRS3BvR1pJQ3d0UVdHOHpv?=
 =?utf-8?B?bmJndVlJVWNGbWord0o5bXh0VzQ5d3V4M3pNeittRkV0UmkzdmtxN0Rkc3I4?=
 =?utf-8?B?Q0hvM05XTnkya1VNbHRjTG5ReTI5MHl2T0JIREY3V2ZOQ0Y5ZU1VcU1TZXIv?=
 =?utf-8?B?TlBnZlNGaXI4d1JjcTVtVTVMVHdnelV3cm1nQTZFdjM3WWNqUjJ0RXV2SG9r?=
 =?utf-8?B?M0VTN1FMNVRneFE4VFlqQXpLL1N6RTZhemdzczNUK3JqYzJDNUU0anZ3eExt?=
 =?utf-8?B?aCtMSkcydFIyQUVkRzVtUllUbFdiaFBrWUhxUDRlK3Z6WSs3dktzYVVpcXJX?=
 =?utf-8?B?ZFlEVG1ya1l4dWRmelZ2eWtRc29vVkZ6RjVPdklRWTlxVDEvMEo0bEdiSFhy?=
 =?utf-8?B?R29EcmdoZHQwMWFKdmJMK0lmb3Fxd0dOckNoT3c0ajU2WTdqbytZc21jT1hT?=
 =?utf-8?B?eDF4OWNtRURYSklDZnQxQS9oSkwrV0UzMW5LZ2N1akt6SGcxOCtoUm4xMk1S?=
 =?utf-8?B?UkpmK2hWRXRTNlZ2RHpRT2p5ZE1VNys3elBleDdTL2doVmR0QkdTMFJmbk0v?=
 =?utf-8?B?N1d1UWxOdk9XeXBoWXNwdTFsVWJJRjlFY3VmMU4yOVhKSUZGNldidnJvdXFY?=
 =?utf-8?B?OERPcWNGekd3RzVQYlVGblQ4Nk9JekZCbVo4NDFVQ2YyU0RqNlQvMy8yUEhp?=
 =?utf-8?B?Ui9GVWJabmdwSG5vcllsZ1BIczI2ZlRtWkNDM2lSTjBsUno0MnYvck1sS3JP?=
 =?utf-8?B?dnVUNG5WVFhqNCtQUlFQTEV3aHdjVXRPQ0FxL2xvbkxtR3ZLS1VsdDBWeCtm?=
 =?utf-8?B?SFZhbUl0cktmR2NoMXI2Q1pvcEF3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VKRp7ZMg/P2VSGMEElKEZAj4uMBX/Xmwu4eNzbaBFZE7hRstXWmg+rpNnkH6JMQUE0kKH/sEEx8rWpPc3E4YlF8ULqAPAuPaAYcF4fapcBOA1eXdUntmq+XhPEWEGZ8BAJG4Eccgo8R/SGq4xhKo54mxXfWQrwaFb79RyX1Ank6nIqqJrZBqG+hISLr94ZdtDYoPX0H6QN3mq711Id1ielr7ntlIBBJz9fbG50r1x4BRlvYxDoMxZNv1QgypHEApEtZlc90j3ZIoiIyW3wuUHU1TeuYcxqMsYHogh4OB2SErLeY0YID1CDYdsHCQVyUV2jmiW8WsiF/dQi+UlUlBCUBndFyw9oxif1EI/SdUtNMJiKoZJlwKvb9wtpnArX3W7Aw8vv0G8Qvbpfmy+TnbaH6QwcOl6eFYtZmNpJg7ad+lo0Qvyup9WS/m2PP9IinX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:55:02.3242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bd0bed-d474-4fc2-3c84-08de69752749
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_055509_436382_A89F06B5 
X-CRM114-Status: UNSURE (   8.35  )
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

Add BSEC support to STM32MP21 SoC family with SoC information:
- RPN = Device part number (BSEC_OTP_DATA9)
- PKG = package data register (Bits 2:0 of BSEC_OTP_DATA122)

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index cd078a16065e..4bfd58b26b51 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -112,6 +112,22 @@ usart2: serial@400e0000 {
 			};
 		};
 
+		bsec: efuse@44000000 {
+			compatible = "st,stm32mp25-bsec";
+			reg = <0x44000000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			part_number_otp@24 {
+				reg = <0x24 0x4>;
+			};
+
+			package_otp@1e8 {
+				reg = <0x1e8 0x1>;
+				bits = <0 3>;
+			};
+		};
+
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp21-syscfg", "syscon";
 			reg = <0x44230000 0x0 0x10000>;

-- 
2.43.0


