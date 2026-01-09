Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9368CD232FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dbe+C4JL0UZOJb7yQU/zoG/1X1vfGQr24dk72l+paQ=; b=gsuN/ci6fgeb6AiCOyHhoCvES9
	H5M8pbt5Z6NDLWHBrp+If7EkqLtbmrmAIFVuejfSr3YeAXcb3uB0gJNgujFPz++HOryKnqvImSD/5
	RULGdR16vfa9r6AjZjzQdsODpj/iydNO9jxZ92Cu3R5/1PM6kreCNtLcsXrO/AUJWClITC9pzsGRH
	Fp/hcRG6o/KCTM5U/lSdp7HGmpl8EpOufN4+kgAVX2QbTshWX78v6d+NqYrnq27cm5djH3Bh70318
	zL4PK/krRC+y6UHX2CmIGC5Vk3weIIEI6oDk4CXvfGcniqHEnIwEkprqwFlnjsGzPavCkP8VZLKNi
	Ob3V08fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hs-00000001zsk-3kP6;
	Fri, 09 Jan 2026 09:22:56 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hq-00000001zrM-0LxC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXTCRq3B1CB0weA87NGGBNRlFKYNYoNYb2+Gw220tNYKbW99fEKjD37BUJLnK7GWE5tEQWfWEI/uzLZ7x/Ta0SOvQl9W6tbOtYMDakwbI+uPy+AeRjEAlW/kCHFV0nD5RpzpkwWfIi2zQ1G1dDI/QoscQ/8A9amlcIuu7U/zlJ/HwQD38YeJ9KmbBHuO4f5K6EFdthHL0Nvui6HwWUWf+e2Z3OWylS6GDNYGQHrObBmgBH3a6EDJktylMPT68OZfk/bh5u2cCm1q0xb7ezMuFCtSN3afKirI/ou2Nk2D7XYtkZ+VGWcWj2C1Lo/6/HDEfC/wwcEEI+VKqf5DUD4sgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dbe+C4JL0UZOJb7yQU/zoG/1X1vfGQr24dk72l+paQ=;
 b=YRdsTICP+cNf8Me+K+2rsTsApvugcjZTZlR5JsMHFqLLcwPFydoEYaKA5GomOG/zTLEmQJ+BdJV9bmbwrvZ92H8Pkz9cXivttLmfLn1dWmsJh1cUonAEzjp1ZDqos0hxmNh9Erxj8/xGa2FOs4hQbJsNILr+cCqEcGkmW9WaJTULLw1R2PGHtD1B4bQosr4a+LYYwmKT/iika8YNP1yVPdoIbIkgWBKps8rK/ig7G6f19JnehU7lq3+r1832drOvPdPUHwVcXO3LqMcsnKA8CcIt+IaKAJfuZvus+HQAjS1+/aQYNzAcZXWOAlZhue9VU1lzY6ZwdJJiqXuphUPHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dbe+C4JL0UZOJb7yQU/zoG/1X1vfGQr24dk72l+paQ=;
 b=a8ex5qfGPtoedOQgtWfaHBeyjKSKSMgnKLX0CSy6QyprEElGWGJKCDffXyoR6J3bl3NJdHEM0hQUVCK0qyavx257UoR1px8OzF3WUSN28E5B32mEISZWxsWS97Y4qk9uloBOXMZtE2p3+AKDcGsgGNRqaPoWcjdz5o0ef6FazoanMNH93+JlS7ebIiQGbqcbSM5RoFFOG7HvUNT27fXiHuemm8YuDs9B3Y9e40mfhv6y8z8Wmsv2UXgqExR6kKURXBljJIM4bjOtoHpUyLxvVahpSb+8M9otYOgnMb3TVCskfSEHmgYKZkTfOAviel7DFgrI2tfbQfT7HuDzl6ediw==
Received: from PA7P264CA0336.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:39a::16)
 by PAXPR10MB5711.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:247::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 09:22:48 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:39a:cafe::e7) by PA7P264CA0336.outlook.office365.com
 (2603:10a6:102:39a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 09:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Fri, 9 Jan 2026 09:22:47 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 9 Jan
 2026 10:24:02 +0100
Received: from localhost (10.252.25.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:22:47 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 9 Jan 2026 10:22:45 +0100
Subject: [PATCH v4 1/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f4 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-upstream_uboot_properties-v4-1-75e06657c600@foss.st.com>
References: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
In-Reply-To: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.25.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|PAXPR10MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: 859e6ef0-6daa-4f6b-37ba-08de4f60a76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3NBSTJ0VG9FNVBYWEs5Q0lDTXhockh0aTRkMUpxTU9tWFhBbXYrd1hVQTlF?=
 =?utf-8?B?MzBBK2VyTllhbFdQRld1K1ZwVnNIVkFGZUtYWEtWM1RnT0hlVXhRbmQ1YWdr?=
 =?utf-8?B?RG9Xa0ZrMVpqNmpadUZ3aUFFUmdMNWllb1VpNk1DcG54V0xiS1diYVRNRkt3?=
 =?utf-8?B?MFE5ZlRMbkJWNmc5b2NJSUVOcVN6UHcxb3Q3VXZxdXFFUGlIcjVtN2tiY1JN?=
 =?utf-8?B?RnlWbUpGZGxiYU1tV1g2OVZvNGpZeGhndElzZVhEQWZIRWM4M3U1Q0s1dy9o?=
 =?utf-8?B?Zlc2c2ovR0lKK3BIY21wT1crN3pkR0Zic1VuV2lPVGZlOTNTVlRQWk9nMnZ0?=
 =?utf-8?B?TVdnTEJObi82MlB1TzVzRFMvN1R0OUZXWkpDZW9pMTkxT2VLSFFnelZCbndw?=
 =?utf-8?B?M3RIQjdnbmozcytvaXdsYSt0eWtKbkFMNzdISitXb1hvaTRIZXBHU3ZrRHZZ?=
 =?utf-8?B?OTNIU09hVFJhUmJKWENPeTZxVEZPRWtoOVVZZlB2SGRQMlprZUk4MjBqcklr?=
 =?utf-8?B?MTJBdzN5U1NwbWxFU2hyVjdHUjNDWHJPemZJblZWOGRtRUxnNFR2ejBRdmxp?=
 =?utf-8?B?RjRQQmRMUTQzcTdIWW0xNDdydFBaM1NydlpGUEFQcWZQTkRDbWpFS1JFdm9m?=
 =?utf-8?B?OWV6eGR3amp0UEhZRUt3cjF2enZzZGRsWklKa3M2SFFyRFI0SWY3K0VDeVpw?=
 =?utf-8?B?MU9zaDRqUGdaYWVTL2ZHMjk4Z2NuZExubWltU2tjMUNkVWtDNXcrdHhSWXpu?=
 =?utf-8?B?VGl6bmROTWlsNGQ0QWkyUE5zeG5zNlR0b1NzZ1oxOTZkaEMzcVhUVzN1SmM2?=
 =?utf-8?B?MGdOUDdGTFByU2xYdm1FQm45R2lOTElNTlFKMmd4UlovcTVPRXk3eEVhUnFU?=
 =?utf-8?B?ZjJZOFZhOWJJZVRrVmVSc0M2eWRpZ002Tm5qVXJPc1U5THlmTjBBMHk0TzZt?=
 =?utf-8?B?QmpmTVpxb2gyNkxFTm9SZzdqOHhnL0ZrYThjWHhhc005S2Qwd25lV3FLNjhs?=
 =?utf-8?B?L2ZwQXRQdjRnOUJNVStoZFJobTIvQ2h0c2Jub1NvZjhtOU9meVJGcDI0R0kw?=
 =?utf-8?B?VFRQRmJQV3ZWTmtmc01EV1piaDBHK0FkUit3d2l0MytIUDgwRGl5djlsVXV5?=
 =?utf-8?B?Qm5WeDNNZnpJYnorMXpHMGVWRm5HY1AyUHE1dzhnSUc3SlpiRWlWOGJrNkZi?=
 =?utf-8?B?SjlTekhmbXorNHZ4bE52UjdpUHZma0s2cnJPTkkyVjlCcmVQTXJvOE5leExn?=
 =?utf-8?B?L3dlVDVNakhvblp2Q3ltc0tRTGd4SGNDMWJScGVzK0tEa2FTQ2R6ZmFqMHl3?=
 =?utf-8?B?Z3hWUXdabjk0VTBKWTlrUk44NjVhb3hzbnlhTzlqWU1qa0xqczRrRTBSU2N2?=
 =?utf-8?B?MS9YazJXNTBvalAwN1VVWFBsNk9jL0lJcUxFSG5WUDBqTDd4bGNjOTUxeVZ0?=
 =?utf-8?B?VXQyRmJSZk5lRzRaZzV2amo1ZERyNFpnbVJBcXJaVEZWMi9PVjhHcDFIbXZq?=
 =?utf-8?B?MmlrWDhPUDFXTjlLNlBtSEVEQTVFb0cyYy8zd2doa3piQ0NPZVowVzJQenhT?=
 =?utf-8?B?azdKbGo4dEJXcDNrTk1jWXBzemtTUER6ZmI1QkdBTU52eFYraUpPcXVna1pj?=
 =?utf-8?B?L2l4ZDAxRG1pYjRBaVpRK253MmR5bi9TNmNKbGgvdEN2bFFRdnVFVFNuMVp4?=
 =?utf-8?B?ZkVCdm01Wm82c1dqN2h6ZFcxaVJ2OXcraExZTFAyaFJTeElRaWQwUkUrdUVR?=
 =?utf-8?B?NU96a3Y0dG1MQ0w5WVdXdlFlVzJ4WUdPUzhtckJKV2RRNkN4dnZFVDZMWCtY?=
 =?utf-8?B?S05aZHJOWnpWSkV5elFZYmRUbHZYVjNGeEVGd3hzbjQ3SHFFOVVmTGxkKytv?=
 =?utf-8?B?ZDdGWFdwU3hPc0U1a3M0ekFjZk15eW5ZV2V5OWhaZVkxdzhJaktQTkR3QmFz?=
 =?utf-8?B?VURscnlGcExnUzUwcHViNXR5YmVjWHl2d1ROR2I3aXF5NW5GdmRXM0hsdnFQ?=
 =?utf-8?B?cEJHRDdYejRQL0Q0WDhuWHNJZDdBVHlmWlpFSTdnNlZac1A4a3NQYTJrelhm?=
 =?utf-8?B?WXdVY242ZVJ1ZC9RT0xBMURZa3RjWmdhN1duUHZobDd5SWZNSW9hREJabkRT?=
 =?utf-8?Q?BFiY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: RjwaV6lK/iFhVQM3Z86rUAeOJFBufmwpVR2lSdzCaQEivE6wS5JscXp2C2yjqBxWspwWXnINPu+gIrAGRaJ6OhBy9NATYb98H+HGdW0spbIUmEron5IYHCu8iOmJDFHeVjKw76EnK4xDcMOVlaT2ktuub5K1gKDSC7mX9BZyyr/RvG10ypoogIiZSJsVscn2glyo8Ftkegcn3emGhK+yRoqPUt5QHrgfZ0RQEF2geFwxFYEyDCpT9y24Df7+XjBbMBFY2hjhtlAUaybNXLEWYLbuamwXyEFaXg+Ci7AsieP3oWKFYGBdAbMGQ+hN5p3xpb3XzkhXWFJ7FjcnGVsg9Xa9FIpgDhu84vdVD2rOTsqDSkg0Q1kApJwgmCsqo+1JRpM3r0j6qz8AbaijROEyKbPkkpxpsO4h8SJELO1umew0gtar0S2igR/HoQykLm3W7MO6hvA+FcqAWGNxWomrMxrkknJFigHuM+FbADrpkQ9GI0p/Tj3rG+m0+U8ExG4rQpG/hmZtEeq8pCKFAY+vvAJvcXVQ2Kg03unQGFsknkAB0+yKLT5Fy9JCIJPznaBhAYR77vEZ9jZK2Tx5MBy5ViO6Chh2dpV1aJEw5SdtdtqGk228/uV8wwQhnSkmtJneCgZce22dwouyi8mCrbjPXDQD3kXuSmyCkpgZtJeNaJWB07nlTC1cD+rDV1MSqwG5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:22:47.6927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 859e6ef0-6daa-4f6b-37ba-08de4f60a76f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_012254_261042_69D2ED54 
X-CRM114-Status: UNSURE (   9.76  )
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
 arch/arm/boot/dts/st/stm32429i-eval.dts   | 11 +++++++++++
 arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/st/stm32f429-disco.dts  | 11 +++++++++++
 arch/arm/boot/dts/st/stm32f429.dtsi       |  9 +++++++++
 arch/arm/boot/dts/st/stm32f469-disco.dts  | 12 ++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32429i-eval.dts b/arch/arm/boot/dts/st/stm32429i-eval.dts
index afa417b34b25..3b6151fcb070 100644
--- a/arch/arm/boot/dts/st/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32429i-eval.dts
@@ -312,6 +312,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -326,6 +327,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "host";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi
index 3bb812d6399e..bcaed4618738 100644
--- a/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi
@@ -51,6 +51,7 @@ pinctrl: pinctrl@40020000 {
 			ranges = <0 0x40020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
+			bootph-all;
 
 			gpioa: gpio@40020000 {
 				gpio-controller;
@@ -60,6 +61,7 @@ gpioa: gpio@40020000 {
 				reg = <0x0 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOA)>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 			};
 
 			gpiob: gpio@40020400 {
@@ -70,6 +72,7 @@ gpiob: gpio@40020400 {
 				reg = <0x400 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOB)>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 			};
 
 			gpioc: gpio@40020800 {
@@ -80,6 +83,7 @@ gpioc: gpio@40020800 {
 				reg = <0x800 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOC)>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 			};
 
 			gpiod: gpio@40020c00 {
@@ -90,6 +94,7 @@ gpiod: gpio@40020c00 {
 				reg = <0xc00 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOD)>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 			};
 
 			gpioe: gpio@40021000 {
@@ -100,6 +105,7 @@ gpioe: gpio@40021000 {
 				reg = <0x1000 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOE)>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 			};
 
 			gpiof: gpio@40021400 {
@@ -110,6 +116,7 @@ gpiof: gpio@40021400 {
 				reg = <0x1400 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOF)>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 			};
 
 			gpiog: gpio@40021800 {
@@ -120,6 +127,7 @@ gpiog: gpio@40021800 {
 				reg = <0x1800 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOG)>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 			};
 
 			gpioh: gpio@40021c00 {
@@ -130,6 +138,7 @@ gpioh: gpio@40021c00 {
 				reg = <0x1c00 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOH)>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 			};
 
 			gpioi: gpio@40022000 {
@@ -140,6 +149,7 @@ gpioi: gpio@40022000 {
 				reg = <0x2000 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOI)>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 			};
 
 			gpioj: gpio@40022400 {
@@ -150,6 +160,7 @@ gpioj: gpio@40022400 {
 				reg = <0x2400 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOJ)>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 			};
 
 			gpiok: gpio@40022800 {
@@ -160,6 +171,7 @@ gpiok: gpio@40022800 {
 				reg = <0x2800 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOK)>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 			};
 
 			usart1_pins_a: usart1-0 {
diff --git a/arch/arm/boot/dts/st/stm32f429-disco.dts b/arch/arm/boot/dts/st/stm32f429-disco.dts
index a3cb4aabdd5a..39a80a9caa5f 100644
--- a/arch/arm/boot/dts/st/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f429-disco.dts
@@ -209,6 +209,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -223,6 +224,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	compatible = "st,stm32f4x9-fsotg";
 	dr_mode = "host";
diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st/stm32f429.dtsi
index ad91b74ddd0d..51c931f7b9d5 100644
--- a/arch/arm/boot/dts/st/stm32f429.dtsi
+++ b/arch/arm/boot/dts/st/stm32f429.dtsi
@@ -54,16 +54,20 @@ / {
 	#size-cells = <1>;
 
 	clocks {
+		bootph-all;
+
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
 
 		clk_lsi: clk-lsi {
@@ -76,10 +80,12 @@ clk_i2s_ckin: i2s-ckin {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 	};
 
 	soc {
+		bootph-all;
 		romem: efuse@1fff7800 {
 			compatible = "st,stm32f4-otp";
 			reg = <0x1fff7800 0x400>;
@@ -580,6 +586,7 @@ syscfg: syscon@40013800 {
 			compatible = "st,stm32-syscfg", "syscon";
 			reg = <0x40013800 0x400>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SYSCFG)>;
+			bootph-all;
 		};
 
 		exti: interrupt-controller@40013c00 {
@@ -666,6 +673,7 @@ spi6: spi@40015400 {
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
+			bootph-all;
 		};
 
 		ltdc: display-controller@40016800 {
@@ -694,6 +702,7 @@ rcc: rcc@40023800 {
 			st,syscfg = <&pwrcfg>;
 			assigned-clocks = <&rcc 1 CLK_HSE_RTC>;
 			assigned-clock-rates = <1000000>;
+			bootph-all;
 		};
 
 		dma1: dma-controller@40026000 {
diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
index 8a4f8ddd083d..de025a385e9e 100644
--- a/arch/arm/boot/dts/st/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
@@ -169,6 +169,7 @@ dsi_panel_in: endpoint {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -225,6 +226,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -239,6 +241,16 @@ &usart3 {
 	status = "okay";
 };
 
+&usart3_pins_a	{
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;

-- 
2.43.0


