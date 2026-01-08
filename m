Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3BAD1D480
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YExCqRFrfDEsaunpy04sLQ8JOdIM85t5EPyjuyqYBAU=; b=vgmoMHn1Os63kPL5J7p5Fzs9mg
	6O3v/q5aozZpVs9DmwFFvAPOdRsWGHmMcJz3IJVqRff2BvefdlqiO6fo4HBhmz+H8sW4kk7B17edm
	VG+5fLuf7VO5i09k/W4tVlDnnw/Put1Qr/SkitheveojbIeA1xuwtpr0e3OOP0aovcPsX2xvMU4O9
	yBCbjUEQcLrdNDe3rb7QmHQlQ/F1VVFaVEeV+kB40lIYw7D6AkL/Cg0KPAIDmxHy19H/rraNPtdPb
	qTqde2lwsqLlZumpUlw4lQvsh057sdnilHHXtoZEZKrKNaGQPJsJs4QrLvXm2AMMf5h+e8xaV+Nlo
	VGOUQkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcN-00000000LFH-0D2l;
	Thu, 08 Jan 2026 17:16:15 +0000
Received: from mail-northeuropeazon11011047.outbound.protection.outlook.com ([52.101.65.47] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcI-00000000L8D-3845
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:16:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdDkGdhW6YXLHRg+lPEHF52qh99fJiQfvpwTmXA6P215fFaBjVWmg3KSgioAYGs1GrA1mkiLktp7vpJo3+7OLHTVEIq2qPhnfTVUuhMDx7o25NtDLJQKvrSBTEU6sowcFK3AUsXFwpgfWwa5A1yhqo7Ew30JA2fD7ZP+sbLWK21EKVxeCRlmzPZpeRVZhhf7XN5pZhLbiAXllVw0AtEHhOiJCxiQVy5CjzO6nzvhw19Z2DCk5oG0xiooTqJMnZUD4JCA/bWPPK74aki9wuItogZHpfGSDZod1F9bk5hCseKh5Bb3SdGlfapYX1IBdzmaRL5dJ+BzzZnRh1WPF3AZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YExCqRFrfDEsaunpy04sLQ8JOdIM85t5EPyjuyqYBAU=;
 b=bR3ODFb8Dj3XKisyM/Vp0HoKeJxNr4mflmJd7cc4FUiYJHJC24SLpxq8gsLejxfy0yatgTtTcfbF2tc0C9FWiffEs7yDjPgihp8uOCmulmoh5DxJFnhnM5rEd+pNpP+vvfN/1JXR5JWe0NC0H4R6L+WtSeqSET5FnF4Td3sKW4A2Ys5ExGQTuLR4VZW4LcYo1kskkqj5n/sYg6cUPnS7vEqXzC1zjxzqmuAyHNfFlgMFa2I360zUTUOwYAadJzK6KVKgKmoYDuJVSnpqyAojrn9w67xyedNSYIS03lB7VJ+zE47yVXNmNNr3Nc90m+ltk0NPDhJIdtGcKGRuglEaNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YExCqRFrfDEsaunpy04sLQ8JOdIM85t5EPyjuyqYBAU=;
 b=S2it9M9a0JPLrXyVTmUECi2SRfSgGgwQxjNtRGABXMq3pReOJLvjF8THDJ0XqbcP9VLwV9YmVuniNKa5KE2fAlr9hWjT6dr2bHujxyJ4mNjCSSeflEi13MuWXvslwaKQirNoHn0h9IvpNMnyiKi+qCuuUHiLfALUPFIwH4S3UjRAFiQzLuttA+vATqUofaZDg/wAQXsD8Sdqk/LcBfRA1Fa0oDK6lHNLm/k7axLFIDlDXa+WnuVsxJyLNU8RPRI3TMhAOmMFYYBw7yAj3UUjB/w3s1omHvqwTPqrin8UksN23bm74vINqdLvvLnuqFZSZM1ElftxjJLMNLbm1g8EeA==
Received: from AS4P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::16)
 by VI1PR10MB3981.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 17:16:05 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::bb) by AS4P189CA0027.outlook.office365.com
 (2603:10a6:20b:5db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:16:05 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 8 Jan
 2026 18:17:19 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:16:04 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 8 Jan 2026 18:16:02 +0100
Subject: [PATCH v3 3/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics h7 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260108-upstream_uboot_properties-v3-3-c1b9d4f2ce8d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|VI1PR10MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 9581570e-defe-404a-5522-08de4ed99b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTFUdUp1WHpNeHB0SFRieDUxZzJsQllCeWYreHZ1VzZ1VmdFUnA3WHY1TmRZ?=
 =?utf-8?B?MTRvRDhzOC9IL0ZpQ2J1bXVyRUFIN2t6UjNDNm16SGgweW92b3R1VzhnL3Qz?=
 =?utf-8?B?Qm0yWU9aSlFzeDVsRFk1dXBWbGlQamczOTM0V3BsUkJEQ2UyUG5Zd3NCR241?=
 =?utf-8?B?cWNuZVlWNkNmZGRSWS8yc0F4Vmpqd0hjQUdqTWVGM3U3UTlhSlJONmVjRkRI?=
 =?utf-8?B?QVROQmVVSkI1dTZxZndscDNVellqcHQvbmtBS2N2WE9hZG9jSlpjOVRnNWV0?=
 =?utf-8?B?WkVNcXJVSE9FbFpwZHZNNlB5RWRxUDRzODlmS21KUWFiY3FoOUltUXZMdGlH?=
 =?utf-8?B?MkVOQjV5Y3k2T2ltWUZQNzdnWHprTWR0UzZGNnFUWUM0TERNYlUwckJzRFVS?=
 =?utf-8?B?WnFua1QrVjI0a0MvM1YyR01EWVhua2dTcFRzVy9KS1JRdDlTa1IrSDdTTTQ2?=
 =?utf-8?B?a0czMVpMZ0RFYWFZbzMzVURRWlVDY0hiZlArMzJUWVMrZWZ3RnZKNERwRnNq?=
 =?utf-8?B?MlNJT0x4ZVZvZjdHNithMTIzNy9tUTNrbWw0M0VjMis0ZUhBaU1iVjlMalJq?=
 =?utf-8?B?MktPWkZYaWErYWtvWmVOaXhvQ3lPMVhlb2d3R2RtUEQrcThKWXVqek41Wkto?=
 =?utf-8?B?eFI3b01XTk5qNmZDbktIQzdJWGdHZkRUSWxYVVNlZ1U1NFNxK0RBRHY3azdV?=
 =?utf-8?B?WHRaT0FFRkRTQkw5QU9lZDQrVmtyZWphTUNldHc4R011bS9WazdVMHp0ZHhp?=
 =?utf-8?B?TzhNWllOL0FsRFhXeVZNOVZuU3lYeklmaDl6Qi9INldmcit0TlhDQTJvelMv?=
 =?utf-8?B?eXVpRjFWTkFweWVrUFY4YkZidG5LeHJHeVFzUkYxUXcxK3Bham1wRDZKeGdM?=
 =?utf-8?B?SmYrU0l0SHpjUjlKSldEeUc5MlNQWmtaRWNzYWczVGl3bExtUSt5cnhJOEhM?=
 =?utf-8?B?ZE1vTWtwckZNK2tWU1V1cjlkYzczMno3S1Zhd25nRm9XN25CS2M5NDQrVGdi?=
 =?utf-8?B?SHBmSWFKUDc2LzdzMGhTa1hJM3N3K2pGNUl6NGNkZkdaNW9reEdiZW44OWZx?=
 =?utf-8?B?K2VGZkFONkdJR0JaRHkvdjE5b3hPUCtlcllrR3BkTjd3ZitvQmhJUDZ3N1N6?=
 =?utf-8?B?Q1FmZm1ZM0YxRkFjekd3bldkNkpyZ2xrVzdxRUxMMHBUWms3RG5nZG5UeTZ0?=
 =?utf-8?B?UWRpakgxNUxIS285RTZCZmoyNmZSNEpoTkk4WUxFUERVOU95ZmxReWFiUG04?=
 =?utf-8?B?aCtHTnZ2YW11eXFQNHJuZCtseGJhbWExQmFCbDBMQ0twa1Rya0hWd245U01m?=
 =?utf-8?B?ZEF6YllQTVJOTmRhQnFMRDEya3UwQ1NSUG15UnAwdnQ3YXUrcnZ5Y1Fpc0xu?=
 =?utf-8?B?bUx1dDVER1MwMzFLZ2JTL1dkYm9SVGxNWWlCdFl6ZnVTekh5NmdWblFlN0NX?=
 =?utf-8?B?dldyL1g5aThWN3Y4Q0E5dkozL1pUSWUrZWxOOFl2Vm90ZUVyS2wyU0NVUG9q?=
 =?utf-8?B?L2p1T2ZwTndMeEZnWUgySG9nMzJiWTI1VXhqbWQyNkk2K2ZROU5BZ1M4cHNP?=
 =?utf-8?B?N2g3eEt2cCtaaERsakQyMlJDMXoyVHpGcFRMbVVycjlRTWFuaU5Wd0NyRzJy?=
 =?utf-8?B?OTJmUmVXWmEyT2JGWndReWZaUmVQZkxkTkFER1Eyd1QrbTNWUFFGNWNzR1ZY?=
 =?utf-8?B?eU41QzRHVVFXMDZDclkyQm9pM09iNWlwMWw3VVZQZVAvMHhlZjNjYUdraE1J?=
 =?utf-8?B?eUpRZi9VNFpwT1ZseU1rOUNpM3JJY04zbFJiZnVxSzdsNm1pS1ZpTWNvbURI?=
 =?utf-8?B?Y0dDcmlaSTBCdnROQStOQ3FuQ0xGT2sycm9YNDV6dTJBd1oyS0FjRUhab0Fn?=
 =?utf-8?B?L0xadnE2M0ZjQVBkVzBUS3RTMVJiNHlJNDE0eEh0N2k2Q09PN2tpeTN1T0o3?=
 =?utf-8?B?TTJvTDJ4L3NMY2VuMzZmQW9RbklOUEpPWDlIQWdVeDVmRDRRN3hmZEg4bHA5?=
 =?utf-8?B?cTVEemtuSjd4SG80cVB5QllLMEhVOE95WWF1TzJRYTJ6em1sNjFNLzV4aEVX?=
 =?utf-8?B?ZU9rSFF5eTBKL1dYaGhuaFhRV3dsRmRCL25CNkRFV2YwUkkybGR3OEhjOHVQ?=
 =?utf-8?Q?9+g8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: yhbPr3S48zluCwnibSiUTeKm2S4g1c5yKLMmH2jZmeQME06qlKbyN2pOs4OLOCaCWGOHDu0HmhSKrxWEn/Fp34uiY9atjqV7Er7tLK1Qp0rxywXkxZ0NWKOd+9xxB7hoPj6zNkmEMPNdLIb7uc4E2/CG130e6+gx8TdwoH9fg6b2aocko+kNejCVW3D/xLqP21mooz5YzovImVnQZZ2VZjlDJQ2f3DT2U0MQzIhXh8RHPUIlcdA+PFs2UTDQj1IIy/Dd/gIzl5KOfNlHTX/fgomzl6/jD2v2bgf2yGz06qFzKDxkHTIky9D1YTtT2IBRO08Uqd5YY67Vh708QPL6XkLAWJYWP9AqGFEoVm9DaRSsVypIbvF6KsmF/UGAccmq7vukALWsN568uKybc44YY/r7k2KWwHC4+n0MMigppSxFvoiwSuKD4X6YKqbbbq/EUotZe+jahJHzk0EAnB8pgmLjpL7ifriquXHf0EFv+oAzznjvlM9NmOhTEJe3H/ZfGSjCG6fuG8yMqdR/svVmuj5XtsC+Hx9yYlFjpRJJfk5JldsHjX+3HbGcY/XLc/+E/qWjfsYT/YXgk/fwlZ+HFAMhZ0rNJcw67sJmauzww7ephGbiQcjGwZOLi8nS45m09aBU2iB3e7zZ3/zJY80LN3EyUQVjVIUbTxE2eTY2hkcc5sVUpa0zAdQ0cuBQ+GlZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:16:05.3040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9581570e-defe-404a-5522-08de4ed99b51
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091610_817967_84E2BB20 
X-CRM114-Status: UNSURE (   8.73  )
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
 arch/arm/boot/dts/st/stm32h743.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index 2f19cfbc57ad..790e4558c905 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -50,22 +50,26 @@ / {
 	#size-cells = <1>;
 
 	clocks {
+		bootph-all;
 		clk_hse: clk-hse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 
 		clk_lse: clk-lse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
+			bootph-all;
 		};
 
 		clk_i2s: i2s_ckin {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 	};
 
@@ -75,6 +79,7 @@ timer5: timer@40000c00 {
 			reg = <0x40000c00 0x400>;
 			interrupts = <50>;
 			clocks = <&rcc TIM5_CK>;
+			bootph-all;
 		};
 
 		lptimer1: timer@40002400 {
@@ -547,11 +552,13 @@ rcc: reset-clock-controller@58024400 {
 			#reset-cells = <1>;
 			clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s>;
 			st,syscfg = <&pwrcfg>;
+			bootph-all;
 		};
 
 		pwrcfg: power-config@58024800 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x58024800 0x400>;
+			bootph-all;
 		};
 
 		adc_3: adc@58026000 {
@@ -596,6 +603,7 @@ pinctrl: pinctrl@58020000 {
 			ranges = <0 0x58020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
+			bootph-all;
 
 			gpioa: gpio@58020000 {
 				gpio-controller;
@@ -607,6 +615,7 @@ gpioa: gpio@58020000 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 0 16>;
+				bootph-all;
 			};
 
 			gpiob: gpio@58020400 {
@@ -619,6 +628,7 @@ gpiob: gpio@58020400 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 16 16>;
+				bootph-all;
 			};
 
 			gpioc: gpio@58020800 {
@@ -631,6 +641,7 @@ gpioc: gpio@58020800 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 32 16>;
+				bootph-all;
 			};
 
 			gpiod: gpio@58020c00 {
@@ -643,6 +654,7 @@ gpiod: gpio@58020c00 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 48 16>;
+				bootph-all;
 			};
 
 			gpioe: gpio@58021000 {
@@ -655,6 +667,7 @@ gpioe: gpio@58021000 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 64 16>;
+				bootph-all;
 			};
 
 			gpiof: gpio@58021400 {
@@ -667,6 +680,7 @@ gpiof: gpio@58021400 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 80 16>;
+				bootph-all;
 			};
 
 			gpiog: gpio@58021800 {
@@ -679,6 +693,7 @@ gpiog: gpio@58021800 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 96 16>;
+				bootph-all;
 			};
 
 			gpioh: gpio@58021c00 {
@@ -691,6 +706,7 @@ gpioh: gpio@58021c00 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 112 16>;
+				bootph-all;
 			};
 
 			gpioi: gpio@58022000 {
@@ -703,6 +719,7 @@ gpioi: gpio@58022000 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 128 16>;
+				bootph-all;
 			};
 
 			gpioj: gpio@58022400 {
@@ -715,6 +732,7 @@ gpioj: gpio@58022400 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 144 16>;
+				bootph-all;
 			};
 
 			gpiok: gpio@58022800 {
@@ -727,6 +745,7 @@ gpiok: gpio@58022800 {
 				#interrupt-cells = <2>;
 				ngpios = <8>;
 				gpio-ranges = <&pinctrl 0 160 8>;
+				bootph-all;
 			};
 		};
 	};

-- 
2.43.0


