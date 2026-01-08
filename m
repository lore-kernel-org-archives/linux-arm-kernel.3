Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23731D1D484
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=; b=vt341IF6yXOu+RHdEswtUSRSSY
	+JeDbVzaEoo9nfeR5T4y44ZDBQgVwFU0U0EFfuatuv8Ql8BMFTa/k/Lq3opJN/shVbAMtMa9R9hX3
	WmEmQWG2cPwkXpZgAsploONP1BP39XwIr5UyNO/lUFoDJ60SmkJjBcGKUUIWeiXTYMEaZT8PVa5Nr
	UYU1LhM2fZh/NCpsZNnfGb13uTmhNYJEZzlBm949eM1i3VqioNWzViCa45zTinKQi1vZXun6XHGgc
	12sjEm9J2K3C6maoVgEc2DSpDoKQBybRTnFgFvHvr2tRnbhdcE8e2zoORXCHSXBl0TKFsjDRTJzGk
	6b8LnCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcT-00000000LLq-2vY5;
	Thu, 08 Jan 2026 17:16:21 +0000
Received: from mail-francecentralazon11013035.outbound.protection.outlook.com ([40.107.162.35] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcK-00000000L9t-1GHn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQpWVPi1KT2Oc3BpYMLGos/PmwFIGTMMU9L3bYzM01QOZnkxG+7LdbkPGUZF2hCqOBX5Gm7CdjVVNWS1JCWNkIcuSmz5MfXO6NryVB9cmAWS7bxLlHV2t95elESOj7FsHpZ6Kwi07gVE9lMQ+ARwEyBxgcNgOUvOtHNmsyvunvQ6ov4GIJspnqr9MYzSvTHSdi3zlU2hR13FF7jioAi9rv4Tz8+FPXjpGxKPgyZTVvq0HIgZpOmKpq94lpyQz0zukdEMDeDQQo5FiKAHXsuvJjaYxvYoSDtqMH5Rb9hvvVUemErM7phIbir7lq90xOLxXn5pUp6geKncW5cU63dQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=;
 b=dYpirR414OLQH19dnCAP1OCiv59mEEtNYBksjLljCzzpEKusSN17p7mqY5GJ+XFC1ArG9Pe4vKEpfQkb0dR6WHTZpqWoHEtenS+IWg5rerZGrgRnzv73+qLVBExturq/Zw0xL612xjEpZgNE+l/oLIOnbSVyWpi3y4XdXpYcJU8OqG7cUup0m1NT6E5JFwZmyW4U3AArvYP/qyRzUqYaAZXLff3alJxLL9SwajU17dalfsUoftc1gO8wcA4By+m87TyOwFLFDCTXprgdiehkiN8qxKh6+U75PKJMqozLhiJpgxU7Ab3QhA7Kquf+iPBAXFyqG5OEA/UN+6kdBydpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=;
 b=JrEokWJbTkF7k4USIBcRzLrbjRtepNUqnCPfeeiKlPFQYAUUOMQ3FDgAJl8UEpAH9A2gBX2nSCrMnAKlc0DCueWCvSnWMu4GwygHJvDVRohn7bNdrXUG0l1HqE9ARYmYS6FPv1d3iHo0MjmrvieR3GdXCwEyWqaTlp1XZKxPrA3RhUDAz+pF7ENo9zIwI+AgP/KH90Zm4mDnKX4ydfrs7ciJ+3m7f9APFgbaH/EJjp9d6TIjlldTcMRD6oNF5nj1Ril/ToBjWqw+PhaNzgk+DsBzqiQAH9c13KXxS7bnRPlYIQKe3epUWXxy8+p2dN29/sZqyCQjcum170qWn1Vdww==
Received: from AS4P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::7)
 by AS2PR10MB7456.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:593::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:16:06 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::e3) by AS4P195CA0020.outlook.office365.com
 (2603:10a6:20b:5d6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:16:06 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:17:22 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:16:05 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 8 Jan 2026 18:16:03 +0100
Subject: [PATCH v3 4/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp13 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260108-upstream_uboot_properties-v3-4-c1b9d4f2ce8d@foss.st.com>
References: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
In-Reply-To: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|AS2PR10MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 49dc38d8-9010-4f9a-869b-08de4ed99bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STVuUzhDQ280SlEzTkJOeEN2M1Y4QWtLWTllWWZOckhwT0UrS01ab09xQkpG?=
 =?utf-8?B?TUlLL2FrejJWb2x0NHZxMTRlZGkxaWU1eG9QNjJLVFd1NnliZW4zSWJKRWZw?=
 =?utf-8?B?K2pYRjQwdjh5UW1OSHE4NExUaEFZZDlXaDdlNVVUQkdINEhZRHkvNEJ5YXBH?=
 =?utf-8?B?YTBPalpYMzR5WnZFZzVBQ05BbGRxNFNDaUh4RWJMZmVsZXRHb2xzUHEzNjZU?=
 =?utf-8?B?UDJ5TkQ4cXFuNHBpQ2RsQU9HZlVnM3dQbG5PdFNaVEhqTXFoR0RFak1nYkMz?=
 =?utf-8?B?Z09wVWtJNERCZ3FMb1Rpd2RiREJmcEVNUGN6S2VTc05KcmhVdTNUeDhhRTQ0?=
 =?utf-8?B?U2NacjBTQWtRZXljZHpIbjBXcHhCV2xzV0RLWS9XZGllbGxNWW53a1lkc3Rn?=
 =?utf-8?B?eVlhVlZLdUIzRlk4UHJFOERkQWtkY29pVHNwbDlzc01vWEN6d2I1WVhnVzMr?=
 =?utf-8?B?c2U2SVFnL2lTdjhMMCt2KzMzUW1KbWRaM2d0akhLakVrM3F1MzVjMjk0bTdz?=
 =?utf-8?B?ZHVwSFNBM3RDVTVjOGlFL3ZCVjBvNDZzUW1aMnVzY1dpY21KOFI3elVteUtI?=
 =?utf-8?B?S3g5OStNSThzTllpZFphUysyUkJHOEs4dVhGTHViZFI5WlgyWG9ORzRvdExU?=
 =?utf-8?B?ZzNKb1NaT3YreEczc1BnbUVXTlM5cmVjcTZ3a0V3ZTRnenhHdjltWjh2amh1?=
 =?utf-8?B?ZmhLTUhVUlFpZDZyZkdIM1lzMXM3WjgzbVRYUTZvZnlQQnhiaU8vYm1xbzY0?=
 =?utf-8?B?ZzFtOEplSThoVmpSeTFJV2xlT1RBZnVIeGVJQkpMTXA0YW5GNFRsbDdLb1dI?=
 =?utf-8?B?KzRpaUJVTC8ydU1hUms2bzRrTUZYa3lHL1dvQVBSSFJ6c0o2MW5uUDNtR0pR?=
 =?utf-8?B?blVVbzZTRGI2cTVnWlR1aFNCdmNPM0ErOGg3M0hYd3pqZ0xWOU84MFAwYU5I?=
 =?utf-8?B?aEhPNm9rRlFmaGhROE1uQVFLeDJPdHBCRi9iL2JJOHBvTS9uaUhqWG5ORHRr?=
 =?utf-8?B?d3lpMWtFY0J4c3E2UExZR2hkT09CWUNpMXhpSUpEMFpPMjgwRERTMDB2endn?=
 =?utf-8?B?Z1ZjR1kwVTU4K2V6VUw3MjB6YkxZV3lpRHhmMmRlRUlXOFk4dE05a3QvOEtu?=
 =?utf-8?B?VEU4WVZ3R0dmd24zRFBvZ3NwSyt3YTdlbFRkNGdsUERHWG81RXpKeDh1WUpm?=
 =?utf-8?B?YTVMckF2MWtqcDhrY0dBN1FSM01yNzRFSFVoZWZUdFQzek1OakltR3FVRE9T?=
 =?utf-8?B?ZFlER0ZHMXIrNjU4TjVKcDBmTkVacS9HRi9KdFdXTFpGOERQcUpNZHNpUjBD?=
 =?utf-8?B?WDB3bWlSWXJWc09iVERsVW96Z1NIVHdkYmZTVXB5WXNDUjA4bkpaQTBuZUhH?=
 =?utf-8?B?UUxZTHhUdy9tRXJyVzVTU0oxcGJJcUlzbEUzSUJERHVFcDlVWElxWFhNOVpG?=
 =?utf-8?B?d2s2a3NNTzZwb0JsTFNTV1BDUk5qZUI5bXdwaGN6dCszVWczSVZ4d1ZGRlNC?=
 =?utf-8?B?S0MrUmtVR2Q4WEI0NWVCMzJEcHlvN1YrZTgzS0xkTzJOZUE4Y0x5NGF1bFNY?=
 =?utf-8?B?bTU5djR5azBPRGk1enlJdHJnZlJuelo1QVE0YVVFZWtyK09TMW4wNmxGM3pr?=
 =?utf-8?B?QVhjZm9FS093cnQ0c0l1SWZ5WHdpbmZFWm13bjdDT3VQOE1YVEExNHdxVHRR?=
 =?utf-8?B?TC9mWUd5b0hNWmo5K3ZHd09vaExsUG9QbC9jTFh5cXZaNW00aXBlOUZqMFlH?=
 =?utf-8?B?SnBIbTNmTndqdDJ0VkZQTy90Zkk0cG5qcS8zMW1xbTB5RkNWbG9hd0VqdEx1?=
 =?utf-8?B?OGh4SzNHTGNjZ0ZQWVJMVzhweXhVTzkxMmxOR1ZHbW9Bbmk0bTlsSjcrU3My?=
 =?utf-8?B?QTVGTlU5SGFmSXNGNi96bFJYY240SURwZUZkRmFpZkpDR0hKenRYdWNBT0RX?=
 =?utf-8?B?YzYyMWtMNUtNYm1RNW8ySWpqekp6K0RwaWhYdU9LSkdSelBTUmhIaElhcWVS?=
 =?utf-8?B?NXRKaXhBVjZaK2hnalNHeDk1YWRaWmdjUmZxMnJub3VRTlE5UW9WQ2FLNERm?=
 =?utf-8?B?eUNVL2YrbDdrVk5CR2syY1dQcEd3dDNTTTR1aWVOSDRPclR3Z1ZySklGVE1r?=
 =?utf-8?Q?jCDo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3Qt5onLvYWTk9GslIYhaKfoVQSlj1EaaWrywg+wSWxPpguShY3pLjR/5uD6xAzRan5V1FzhZtJS67JUaKdpmiPVZEzZWXnz3cEMrc8493/RzTMmpEiXYHjmBW9GX9pDS/Jzfgne+W2uBl+MD1PxVyf/UBC45F7dXDmlXeq6MWdw3m1ozUfuW5JcnOLvmf8XvrEAvt6UVNU1Nw6CUdROOHwNcvl0Yt/K5cub/luaFbqVrLuM4512gz6HTRe/h+CDxR6zpbCi02ngZfioPScn/rztql6Lean7tcl/4y2R0NRNs17MvwV4VP9/6hw5H966FY+eKSdYWi0IX3dn/Ny/fVZihSZiydrUAlRjzP5IxYF/djKBMc8/SAqKeMYy8EwGdY9OpOp+bie5hern6Q8Hy9QEC2sllEcKFHZkVtcGaD3HOsGx1wo1n9IMQPfU+8Zrf01tdkYYv60jNx+YaXE2UK6L5/NfdyCCUO1WkApHud1DHFUkBViQ4KQaepuz26SN6NtzkO+AN9VaiePhnc4862P7+7Gpb4k4ETUJXUFF5PB0yUzwo+1mMAzch97uPCRe1P+YpMxBTqYQRDIX6RY6fYY7cLqBIL+2qgGINR5HA13BALwwOqF+mmK1YDdW61bYWS/8DUuoRZvyaoZz+0CnIQ+Yd3Mt9HF5nxVE6tUiN++cAo18ydfJghZO2F/ntcQQ7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:16:06.0336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dc38d8-9010-4f9a-869b-08de4ed99bc1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7456
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091612_532247_F4851224 
X-CRM114-Status: UNSURE (   9.94  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi    | 21 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 11 +++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index fd730aa37c22..26c3b5529582 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -35,6 +35,7 @@ optee {
 			compatible = "linaro,optee-tz";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-all;
 		};
 
 		scmi: scmi {
@@ -42,15 +43,18 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_voltd: protocol@17 {
@@ -88,6 +92,7 @@ intc: interrupt-controller@a0021000 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-some-ram;
 	};
 
 	timer {
@@ -131,6 +136,7 @@ soc {
 		#size-cells = <1>;
 		interrupt-parent = <&intc>;
 		ranges;
+		bootph-all;
 
 		timers2: timer@40000000 {
 			#address-cells = <1>;
@@ -791,6 +797,7 @@ rcc: rcc@50000000 {
 				 <&scmi_clk CK_SCMI_CSI>,
 				 <&scmi_clk CK_SCMI_LSE>,
 				 <&scmi_clk CK_SCMI_LSI>;
+			bootph-all;
 		};
 
 		pwr_regulators: pwr@50001000 {
@@ -900,6 +907,7 @@ syscfg: syscon@50020000 {
 			compatible = "st,stm32mp157-syscfg", "syscon";
 			reg = <0x50020000 0x400>;
 			clocks = <&rcc SYSCFG>;
+			bootph-all;
 		};
 
 		lptimer4: timer@50023000 {
@@ -1003,6 +1011,7 @@ iwdg2: watchdog@5a002000 {
 			clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 			clock-names = "pclk", "lsi";
 			status = "disabled";
+			bootph-all;
 		};
 
 		rtc: rtc@5c004000 {
@@ -1020,6 +1029,7 @@ bsec: efuse@5c005000 {
 			reg = <0x5c005000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
 
 			part_number_otp: part_number_otp@4 {
 				reg = <0x4 0x2>;
@@ -1646,6 +1656,7 @@ usbphyc: usbphyc@5a006000 {
 				vdda1v8-supply = <&scmi_reg18>;
 				access-controllers = <&etzpc 5>;
 				status = "disabled";
+				bootph-all;
 
 				usbphyc_port0: usb-phy@0 {
 					#phy-cells = <0>;
@@ -1670,6 +1681,7 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0x8400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			bootph-all;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
@@ -1681,6 +1693,7 @@ gpioa: gpio@50002000 {
 				st,bank-name = "GPIOA";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 0 16>;
+				bootph-all;
 			};
 
 			gpiob: gpio@50003000 {
@@ -1693,6 +1706,7 @@ gpiob: gpio@50003000 {
 				st,bank-name = "GPIOB";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 16 16>;
+				bootph-all;
 			};
 
 			gpioc: gpio@50004000 {
@@ -1705,6 +1719,7 @@ gpioc: gpio@50004000 {
 				st,bank-name = "GPIOC";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 32 16>;
+				bootph-all;
 			};
 
 			gpiod: gpio@50005000 {
@@ -1717,6 +1732,7 @@ gpiod: gpio@50005000 {
 				st,bank-name = "GPIOD";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 48 16>;
+				bootph-all;
 			};
 
 			gpioe: gpio@50006000 {
@@ -1729,6 +1745,7 @@ gpioe: gpio@50006000 {
 				st,bank-name = "GPIOE";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 64 16>;
+				bootph-all;
 			};
 
 			gpiof: gpio@50007000 {
@@ -1741,6 +1758,7 @@ gpiof: gpio@50007000 {
 				st,bank-name = "GPIOF";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 80 16>;
+				bootph-all;
 			};
 
 			gpiog: gpio@50008000 {
@@ -1753,6 +1771,7 @@ gpiog: gpio@50008000 {
 				st,bank-name = "GPIOG";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 96 16>;
+				bootph-all;
 			};
 
 			gpioh: gpio@50009000 {
@@ -1765,6 +1784,7 @@ gpioh: gpio@50009000 {
 				st,bank-name = "GPIOH";
 				ngpios = <15>;
 				gpio-ranges = <&pinctrl 0 112 15>;
+				bootph-all;
 			};
 
 			gpioi: gpio@5000a000 {
@@ -1777,6 +1797,7 @@ gpioi: gpio@5000a000 {
 				st,bank-name = "GPIOI";
 				ngpios = <8>;
 				gpio-ranges = <&pinctrl 0 128 8>;
+				bootph-all;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 9764a6bfa5b4..a05d458c9b37 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -517,9 +517,20 @@ &uart4 {
 	pinctrl-2 = <&uart4_idle_pins_a>;
 	/delete-property/dmas;
 	/delete-property/dma-names;
+	bootph-all;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart8 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart8_pins_a>;

-- 
2.43.0


