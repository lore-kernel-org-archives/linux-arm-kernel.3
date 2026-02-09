Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CF6E81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoXw3e3XuRxREgIkBKGaF4OApL4DnZ7gPbcX1Wta/AU=; b=RvOLFfBpjG+otbsTgP1A4mhgpi
	TDeKzOB3AwCtsswQPlvAdXjSi/6lVH3Nc+xrPv1H4xURSS/+rgOMJLDIL3KpZuEH0TOKRq0eigmw2
	Ebl7eWP3Jjnl+6aFvzgpqODMMIUq0soGAMw+sebh1EBE4Qdg1aQwH97LuJqSZzOlc0D5965UGfMDm
	GE+xGqBoLcBTq/cjUG+yc8nQGks5iJvW25WGvBVg+E5R/RQe8xwfvdYcl5pyTlkbW36NG7G6xa/Pq
	xipJ+7y2jbiXQknZcjDphiyWKLl1adYUUOsidKC3a2pJpMvd9VUOpnEsv2tfZnMjSkH+N9th46Ex+
	Tktr0W3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSko-0000000FZLG-0slO;
	Mon, 09 Feb 2026 15:00:46 +0000
Received: from mail-northeuropeazon11012066.outbound.protection.outlook.com ([52.101.66.66] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSkl-0000000FZIo-3i98
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:00:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRMvFh2WP12Q/ZJrld2+6/et+xjS7OyXSzQeSsL60cgRMBlJchxpbb3NiVAOpvP0aPs4J/nnPG/GRSFWx7kuv1DHhUzamRoDyMn/3AURNlHJWhmUZM6D8cMftMXNkhpxFbGj45BJUQwKiYVfQktphypSkF3BAi6x0WGSQZBn/OdcM/XcIbnoJgn06Bg/MY0whPYxRWrP7oqGrCFw0RyAKW8/FmNP3X19uYCACD+rc4rOOdbeoJzzxRnsgxA1cztnTjzGES9vSgRRHTtMBY2BxOFJEwnu60NKz4ZKCeQdgZa6btIVQ/mgwtmvgH5MthH6lt74GTOKRtbinT3IaO34Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoXw3e3XuRxREgIkBKGaF4OApL4DnZ7gPbcX1Wta/AU=;
 b=SAYpFLpSVGimgRCfwxJGMLxLD4khMrNKYfrL84+iwQoGla22isSY24ThoYXpxfGW2TajH0nQkNMnHn4HFTZD7Lz4WvgFM6fU43L6dT52ztJ44EgPyIuveBvapeKryyRn+1ECjSGTXf3t3AQoRxOMPPNQPgiEs9V9Hxrw/L3mkfgn6SNGYH1ipI8mkHpU+axVQYbK6j438p7sZq2aci1hK6kk3puLM2wbErUbPkySAsOh2tmOsqBemcMqqVNVnCnp5BqTbeNLtnq/CBsvUmeYEr5B/jAYVTkP8cCcQEhhsFn3EETs+gvsg9WPeCLIDKYbOp8q+uEFExqMmP95q5G02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoXw3e3XuRxREgIkBKGaF4OApL4DnZ7gPbcX1Wta/AU=;
 b=LgxcXkBCQtvXbSMZreUeeIqS3cc6ynLe+gdnYmR8iWuEnbjKqNFxAKJ0LdSzz/eBkjQnYper0hZSsAqtzmQPX00um3pXYoaouYdCPU+AkCpn+eo1Igi0nT3iik2a/H3B3QiWoGCAMF1ZNCkOtwvXKvD10SKMsUr/HZVwTiwqrJRkJ3tMUMbw/3bE9PdxyfJxW97x39IBS+a7aGE04aBvManR43oRCx+dw0CF5GaAH+CnpN+vOBRmC5Rd+s3TpxOL1b/pVW9YZ0u0G8+wU3P6bOZ/Y/+O8CmFla+bSJJYZuscjdADrEwmCrh6um8xJoAQLdt/uQ/EqG1EFEfAZUt4RA==
Received: from AM0P309CA0018.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::11)
 by DU0PR10MB6033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:00:37 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::2f) by AM0P309CA0018.outlook.office365.com
 (2603:10a6:20b:28f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Mon,
 9 Feb 2026 15:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:00:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:02:26 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:00:35 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 9 Feb 2026 15:59:34 +0100
Subject: [PATCH 4/7] arm64: dts: st: add RISAB1/2/3/4/5/6 nodes to
 stm32mp231.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260209-stm32_risab-v1-4-ef0b2b6a7e0a@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
In-Reply-To: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000046:EE_|DU0PR10MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: db4d0d84-e32f-4c25-483a-08de67ebfb66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1VyaWFXMVJaalVrNnkvaENacGZkbjh1Z0hDVUZjTElWRUxFNWJ0WDAyaHFL?=
 =?utf-8?B?UW5seXhqRG04STN6TUFWS2NqVlIzbmlnWEdzcnNRUjltbWRaSmF5QnVpSG5J?=
 =?utf-8?B?a2pLeVBsS21QYVBPZDVyYnVqWWl1TVFlaVo2WGtmWlU0cEFwNngxVVJHUWJ0?=
 =?utf-8?B?cGE4VWlSQTFiWDN1UW5mbEI4WWhKRU9ic0pFbmQ3dGUrT3JNMGlZQnJhOFk4?=
 =?utf-8?B?M01Mb1NSS1llQ3paNnFvUkhrUUh1SzRBTlhwMldnYklPa2treUphdThtVXdL?=
 =?utf-8?B?NGdqNlRMMURMTkxUMzJoOFpaOTFtRThWS0t4d2xZYnRHRVBCNnh5akZ4cVRD?=
 =?utf-8?B?KzVEcXF0dlZyUy81TWhUTEVqTHlkSCt6VFE3dWhDb1g2YVo3UFd4aWdLVWdj?=
 =?utf-8?B?eDRYTjcybEhGTmNTY1B2UzVucDVrS1RvWUNQTjRvQzYvdTRXSWc0TFhKWWUz?=
 =?utf-8?B?M3NGa090Z2FvZ2dGbXEyRnRDdGUyZmJQUEx6eTV2SG4wbTZ4UHBZV081Sm1H?=
 =?utf-8?B?bGw4UXI2YU5CdXoyTTZHUVhKVEFhNndCeDAzb3NOd0FUem8ycTZRSG9KNTZr?=
 =?utf-8?B?VmJEQXhMUUtOaWIzQUdGa1I2K0ovYk1ma0JTZEtNMFdFMzZrWElTb3lJWS9v?=
 =?utf-8?B?SEd2UThSWGF2TXhxS2VXbmFmaDZWSXFSSFpWV3VtZTZRZkp1SkZVRWQ4c1o4?=
 =?utf-8?B?K2lucjhrN3ZKYUZmMkY2bDdibXJvTVdMb0l4cG0vYWpua2Flc2tvVWs3bC9G?=
 =?utf-8?B?bFJtRWtHajlpcXV0QWlHeGJZOFNCZjRxMm1aMW9iRms2eUF0S3pzZW1zVndW?=
 =?utf-8?B?MUVHM3hHb3FSaitkSFdJc3pyS2YrUTB0bk1BenZ3dWZicVBzZlRRZDlYVlRB?=
 =?utf-8?B?VGU4RmJianJiTFNXbnJMUnNGVzB2UFR3RVJ4UjZyNGh4eXBIaXVROVlvV255?=
 =?utf-8?B?RHBnZTNYZXhCSE9NQWJjU1ovdVNnRnZTYkxGeWlGbGVVeGQwSHpReUhXc093?=
 =?utf-8?B?SFVMMVFSaXhsemgxR1RLSDNYNXpJWGVQc0VMTEZadWNSNTJ4bDREUUtoWUoy?=
 =?utf-8?B?YzhoQkp2SDNoc3JhMXZKd3FZM29HRFZDNEhXN0hmNEZ6QUJVanhGOUJGdnFU?=
 =?utf-8?B?QkZtaEVoamRpKzJJSC92eGVFS2FOdlZZY2lzUjRWQ2wrcWQ4Z2FNM1pqWGlM?=
 =?utf-8?B?NjdFRGVPd1FobW8yU3pGQmYza1JrQWxYWkpmYlZNVlF2RXZQRmsyNmFTY0dz?=
 =?utf-8?B?ZlRmY3FCN0xBNExxMmFYQ1dnK3dLU0tFR3oySS8xMVYvMTN6eU54YkNtYUNt?=
 =?utf-8?B?U0RhZGtSVThTQW5LSTN1QlN6QWE5Q2Q0WlpwZ0VqaGxoK29vZUhxckUxTWpX?=
 =?utf-8?B?Qms1b2xNSlJVVlB2cDl4KzF6ZEljV3FsdDNuTldKSGlQS0NGUENnZGhzeEJV?=
 =?utf-8?B?Q0EyVTI0Q0pqM2tySFNGVjJGMkNsRXlIc1pIU1FFbWc1UVV3WWlHQ3krdGll?=
 =?utf-8?B?Vm5BY2ZRUXF4YzgxekRsV0gxL1FtSXk2a2RjOXE5Qk00UVRUWHNab3NVZ04z?=
 =?utf-8?B?dlY5eVQyaEJOaURwd3FScWI1NEdvUFkyYVB2TjVwTUg0dkZhTUJCN2lYcTc2?=
 =?utf-8?B?VndycDIyOUtlSFVsTjNUeTlTRGVSMFJ3dlRRSE5XelZkd1gycHJVbWJxUGlm?=
 =?utf-8?B?OWlOeUNBc2NkY2t5OVQ3MXhhTE5nYnQ4UVpYdmx4MjNFNmhsQ01EazdQUlpJ?=
 =?utf-8?B?aVdIT2F3bWJCQ3pVUytxZWdSVlJyT3pHNk12TVJEQU5mYmJqWkZRSGtXVnBO?=
 =?utf-8?B?T085NW9QWUZ3Z0Fxemk3S2lnWUU4cE1ncnFVa1IrNVlubVgyWUFEZGVEQzh2?=
 =?utf-8?B?Z0owODFHVnFmN0Q3Z0tBQzVuVVg2a0g5c0FvVk5tM2haNkl0NkRIcVEybGp1?=
 =?utf-8?B?MFBueTBxRytoaG5tWExQbUxwRUUxVEVhL0ZkMTM1dEN4a3pFTzArYVJEQ2x0?=
 =?utf-8?B?ZXE4RER0bDJRVE01VmtWSHZ2ZFdwQWQwUUJNY1g1SjZBSkJFbWpwNy9NLzAr?=
 =?utf-8?B?U1dSQ3BuL3o2OHpZRGxva2gyRmtyRmNwU3VpYndNbmtOejhremIydTBRVW92?=
 =?utf-8?B?a3BUOThZUFhoMlhyWVQ1QlMvbDdiS3BUZzFMUjNXVU8vRkhtdTZyb0c5Q1pw?=
 =?utf-8?B?bVZkYXk5YVloaWVuaW1pMzVTdlZDb1p3eXJDbHhlazRxUG9wU2Y3VjhaWm1k?=
 =?utf-8?B?L0lrMlBJcnZuUVJKUGhHNkdET0ZBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VCR4J0AYVtrKfM4Sx5rLIVpPHRAWyWlK3MtjCbimozdR8U1bGBJhxaxN9J6k+A8RO5rCrg6GUSza1TEm7MFwyLslyWT9PG8sZJt/epDWoMzqmq7Wnu/foLZayGu4x9tTHMBAWqYKDTkAvx/3Z/jwV+H6xQVpc1coEhPm7f8SuF2bsamBkpH0gM+BiSLyPyQZ3N4+7MDDsf8oXCLO261DScBOTEjIrURggKxPngHNcAJv1P/XuwY2DxuWkZLmnB3HyeQoWHTIZVEciy/mraXkHUl/InXrLDayEU1mZ8QqtEbC/cHMP+RZ/ylJEYAK/sGsCQalgNKo8Kyz3JzXt8rJgZ/0rbyGLRn23d6T5R2xPc5/szD72z3QvT7jEV3R30RjF8VvdiduANTcv0LeMy7i3vvDVgZKcUv/Yb8Rp5vEbq5jrVp1EEPl4r0CLycCi/SP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:00:36.5131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db4d0d84-e32f-4c25-483a-08de67ebfb66
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_070043_935629_EBEC1424 
X-CRM114-Status: UNSURE (   8.24  )
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

Add RISAB1/2/3/4/5/6 nodes to the stm32mp231.dtsi device tree SoC
file.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 48 ++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..1376d506f372 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -755,6 +755,54 @@ stmmac_axi_config_1: stmmac-axi-config {
 			};
 		};
 
+		risab1: risab@420f0000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x420f0000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa000000 0x20000>;
+			status = "disabled";
+		};
+
+		risab2: risab@42100000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42100000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa020000 0x20000>;
+			status = "disabled";
+		};
+
+		risab3: risab@42110000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42110000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa040000 0x20000>;
+			status = "disabled";
+		};
+
+		risab4: risab@42120000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42120000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa060000 0x20000>;
+			status = "disabled";
+		};
+
+		risab5: risab@42130000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42130000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa080000 0x20000>;
+			status = "disabled";
+		};
+
+		risab6: risab@42140000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42140000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa0a0000 0x20000>;
+			status = "disabled";
+		};
+
 		bsec: efuse@44000000 {
 			compatible = "st,stm32mp25-bsec";
 			reg = <0x44000000 0x1000>;

-- 
2.43.0


