Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B987BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sW+z01Gtpwb/2mqrid4Y8qcEjub3Wkvn2hLahGAskD4=; b=cX6C2yo88NON4f5B0bw0C+0Nka
	DDU6GNyioA3Y7Fs8sPIr2qdxzTbUeG8Wa1cFC3pVcCMWnD8uw6vvmCIzCoZBfIHLpOyfHmXzvOtQ7
	xDcOwE8bW9jHXkf4I0tVffptLbEEFTLYzkz0MlOU+0M1P81CRwJePsGDdV4C+9vgh5L9PlNepnVoP
	ltWc8aB4Fpc6wDoe0Oji3Qs0utalMvi5ax6ILTCrCzQOE94giT8K8tDb4ryj0z9A884NBCD58NffM
	lwUoSYQEyzCGheZaT4FiDJOEN+gFY55S4PVZUYHZxLPsTaAjV1zTziKc/OK4IoF41RjhTZihfM8yf
	X48NLMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vioul-00000006WlD-2IAY;
	Thu, 22 Jan 2026 07:15:35 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vioui-00000006Wko-2F2O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:15:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fclG4YEAzvhLZXDuoGiePNXkPa0DD34cAkK16d0CaBoAcDcNPIwFSve9F8Ht7gl/S4GqigC2mdGoyOcy7pnw6DqP2n9fWpXTCKYcZFxNGN9kdR/N6gsyy/NNETq+2AA/wC1to51DYVtnWhdOrqXXW9HTenxeWLb+dEw5sJv76OTv9GCbVywwZ5l9w6QSGy5/pcY2ulYVszxB64W6zpGNg7ceOOW6DPVd1oxJ8a9NU/S74hDBj3sZAAJEAHmBklxf7NVgMvb2+79yywJ5JclMfnXb0VJUBHGkJpfGZu4hCTc7JZ+/h15UjUJJRvNkUvudcQ2zFAbK6CNqshAmIgaxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sW+z01Gtpwb/2mqrid4Y8qcEjub3Wkvn2hLahGAskD4=;
 b=iYm+AmOs08/jdKbqMJ08rihRr51jL7GtGBpgCo8CeIxDJFCeUf3oIU7GDrBwiLIZpImonbB5sNAqttrb+0Alyc4OXaV69MQCA2JVIn6XDBaOSqJbMYoqdeotubOk20kcSISEQZzLKAWgGkpb7MzXleg8Rl//VGYrKLsQizmoAiYV6TNpYcB3uUihVzbcZsNT52Vz6Pv+xyrYi/M0m+BeQD+X/PT4Vd2Id1LnzKuyVQfqp4NUafSJTaLHU++8cpuEAJDbKHo25cuXaFptMmGao2SOCqLfWpD/88JnGbyCkORJJ3sxbNAaWoA0AkSEvtCoxhd+lykKshh5IFsxdTUZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sW+z01Gtpwb/2mqrid4Y8qcEjub3Wkvn2hLahGAskD4=;
 b=oVSd3dxdWIUZ8XK1xJVBo9sm6D2/MXY5fzd3+nnNYD3S/nZ+KCoHfsiPig5fkLma9vQ1F28wriCDUmYQ3h1UgfXfCmHVM5yPdQmLV3F3KSCYmZBygfOnQfpAKkh9w9C6H75bTWV/KzaC/vggnOt8iMgLv90o9dzP6RCqA94vSSxRYToAQb0pUm5a5hHqtyDRcAIbubmqZhqptfW6EPg9XoIxrXVYmiaGhkn7wad4GTn96+vBR08KMTIHZCKA1jKVA6eebqGvZRm+8UZPDhfUlpwSb5n0n/EcwqbUs6v76TjeJes+hZGW04maojwtk/qViCwLr+vytDBzaWpRJm9gpQ==
Received: from AS4P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::7)
 by PR3PR10MB3883.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:40::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Thu, 22 Jan
 2026 07:15:24 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::6) by AS4P190CA0036.outlook.office365.com
 (2603:10a6:20b:5d1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 07:15:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 07:15:23 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 08:16:43 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 08:15:22 +0100
Message-ID: <7ee1a963-4e55-4499-b316-0d352683c6c1@foss.st.com>
Date: Thu, 22 Jan 2026 08:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add boot phase tags for STMicroelectronics boards
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A69:EE_|PR3PR10MB3883:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e2e7432-c320-4289-4d1e-08de598602ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjNISExrRk9tbUs5ZUJaZVpsMHJWTTdUT243TDFzQlRZY2FSZi9aTFkxS2ZW?=
 =?utf-8?B?TWpFWExZU0VySkdsSHFuS0xva3ZvWkhHVkV2ZDJNbE50S0tlY2RmRkErZG9t?=
 =?utf-8?B?YWl3RExDTnFWd3d0Q29LUDVBY2tMRm11QldRSnhVMFNrRXEzaHlCMHdzYzgx?=
 =?utf-8?B?cXZSQkJlN3VBekF5S1pSNWFJN3FxM1RXYUFneWFjNzdWaUFxNTkwT3Fabnl3?=
 =?utf-8?B?YkVLWHVMeVhqUGY3KzJaOVEyamJnWHA2c2kvTGtMVmEyK1FmWFl2SEhrUUdL?=
 =?utf-8?B?TWE2SnZTVi9IN2RMM2dzS0FoaklqalJsS3kxdTUxWUpWd3FXM1BTQVcycHJK?=
 =?utf-8?B?SzlaZFkvVE0ySVZHZVh0d0E1ejFMbHUwRzBPNHZ2dzJQRDBrSFkxWEZ5dGcx?=
 =?utf-8?B?SW1saHBBd0JWN2VoaHVkOStDQ0pMWUJiSTFkOXJSZ09KRXQ3cDZDaEV6N1dL?=
 =?utf-8?B?aWtmaVdic3pFV1YwaUNmNDJGVkZYeDRjMTB2NlFuSmFITUR5UFpMVVJCbndY?=
 =?utf-8?B?MVRBNlBCQThTUFZ6Z2NJa2hWVlRnOFA0MzJCMlVvZkphZGZFSHpBYW1RV04v?=
 =?utf-8?B?WUVqdjlreXZTRStWbjZldE9rK1lic2lvalpTdjlGaWJ1N3NVYnZBaGgwV3BJ?=
 =?utf-8?B?QTBXSnBwbUpEN2ZOeUlvd0RQL1NzOGh0bzl2NEdVY1ZkdlpRUXN4STVnSnZX?=
 =?utf-8?B?TmpuVWJ6RUpZR2lLSktpUmVRUnh6RzhWa0lLTHMwbld6R1dhSmdPRnhYT2RX?=
 =?utf-8?B?QnlNMmpGTXIzVHpVRjJWcWJud2VoSDdlSHQxREZpdzU4VmJka0c5Y2ZXWHMv?=
 =?utf-8?B?ME9pMVpsN3NSSWsvelJQelRNL0lQWnk2dTVvNHN0KzVtR3Z4NWlDeDdIRlNx?=
 =?utf-8?B?RnFxQkg1QVpMR0VMaDNGeWNkdUZrS0V5czBjRWNaWVk3Y1ZBQ1VnZEhMT2lh?=
 =?utf-8?B?MG1GZlJMdkRMUUpielhqem9yQnpPenA1N2NyL2JYZjcwMVpQUlhHMForclRa?=
 =?utf-8?B?K092UndZM2N1b1p0MnZUWHN1N3RXZE1zOWM3SjJsRUw1dTF2dXloREV4VHd1?=
 =?utf-8?B?Uko5bDU5S0xOR0MvTm9ZRlNubzMrY1A5TldBb0Vwa2d2a0NJRG9pYXRNcEcr?=
 =?utf-8?B?Znc1cTZtSnFIRHF1eG1rL2ZlVlJ0d1RTKzN0OVQ5eHhtaDFLeHRBUk5VOE9z?=
 =?utf-8?B?TjJHTG50NWZOSWRMc2xvTXc5WG83enlhYlVoZ2tZa1JJTWh4bWlDOG9LU3FV?=
 =?utf-8?B?MVlEYUQ3eVY4VkkvNFZvb0s5aVFidU02VE1kbVQ4L1pISk4wL3pEMTRGMmFU?=
 =?utf-8?B?NXF0N1M2a3lqb24vRWJTUGJtR2tNSmFGcWFxVGIwY2IyRXAxb3ZsSXZmanNz?=
 =?utf-8?B?SG1nZng1SitVckR3eUFxN3ljbEhCUnU0ei9aNHRuZVhvMHprNW8zbHRKeTcz?=
 =?utf-8?B?cHhoOXppM2dvdXU5cnpjMlZNQVEzQ3NHSFFUS1QrRG55Y0ZzYUFDSVBEMUF4?=
 =?utf-8?B?VHNMTzEwOEZCeXpRVlMxQ2RvbXBFdE5pYW9oRi9WM3BxOTQvWEdaYndXQW12?=
 =?utf-8?B?dTFXdzJIQjdGRFVTZ1BmMGZJOUNyZUJVRzU2SXl5Q1JuQTlGVDJzR25HVVVE?=
 =?utf-8?B?aWlQR243TFlSOGlxL1orWU02NFlYNUtSUU1oRkoxcm5rVnBuVUxjcUYrVzI5?=
 =?utf-8?B?R0VuLzF2ckY2S0tqb1JIUnF3UEFDYXUwd3NkN0ZjMFk4TTFKY2l0YXE5VXkx?=
 =?utf-8?B?Vmg4SlZZdXc5emNSNld3ZFYyZjJFcC9abnY0Ym8waEtOMm5FaVlMZ0lqNE9G?=
 =?utf-8?B?dXdxVyt1ZHQ2aCtBNFc3NWdsaXdkek1CdGxyQ3RFWEtzTEVUaExGK3NLNWZN?=
 =?utf-8?B?RUQyaTVyNTc3MkF2L1RSMWxBM2VweDVqYmw2ZG95amVkVTQ3YjA3YTR4WC9w?=
 =?utf-8?B?cmthdjIxV3YxdVpzdG5meEZsZ2xaMDR3Zjg5UlZZaldCZVlvOUZWZUxnaWVS?=
 =?utf-8?B?NENlVTdsK1R4d2poYUJWZVNmcmh4VHorYy9oMVdoOW43NWpwNFBmWHNLTlBN?=
 =?utf-8?B?Mnd1b3U4MWEwUGEyNE04MkNNUDE1cTNxOC9tNUs1MW1HVVllYjAwR3hGemN0?=
 =?utf-8?B?dDgxRDc5Znd2YVZRTEU4YWVBUng3SHFIZHQ0cXBxSDZySFRQVFB2Mm9YQUN4?=
 =?utf-8?B?akV2dENlZWF3Mm9jNlR6WlBoNE4zcmdiS2FuL1BZSmpDWndPTGdjR0ptK0xo?=
 =?utf-8?Q?HS+MWYNfXI1Btg+y0MtBhOvHABxY40V63fc8k+urOU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: VovF8RatRRekLrovR7P9Uff0rRD6EW0OPsXm8gLkdFE6TSpqgMrJ09Q3Crqu0gm72JNOzxpFMnW3w7EjJ4GG9ZVT0yurk9i3U0XePNY7Jw4LYNpbgiMArUJUXjUuPHW9CsJvutvEEarEVJjG369PHdvd2fRXiMw6tsOnDNvJ5cuQfMkT+po/xu0/gqApuI9DhbPofx46rVOl1kr5UFLoYsiV/FR1aIwQrayR4Boij1hd4GNaRYhtK3i0lxl+xc+gr++sAlbHpZkj7LqP/jto33tZd313nsox3q1zgaohtJE9GkDzNlGqsF+fHeaSpkG5amU1qnMiU92hS9THa3S7RlVTIWlZyAekzCqMIvl5zKe2Nndx7zx009+ish/hOC5mUGq/LsBYnELvb+lTXv6T5XG+CxDMDRdYYFcxVZzbZhaNTwIQGe05nXDS6o7mNpMqsMoXZoERLfhaw1pbmF2Hb6DPReRP3Q0Gzkt5uMuCq8LWvTtvdbvFA8gXwUEaeikQ38vB2Smfru+5IJvgUjWcKZRxskJzPfg+chtnsM+Z+5qAxGdDqFBGyYJmA7F2FN/yvImFgOi/bz5EvkhmlFcce7uLNWRfMBfbclXl76KqQr6ze56/JiF5DL77gn0n1zyy2v64Vc/nKquXZyDH+XpnQy6Q+hekt9y9xpXLlW+VOldisaBXSZjje6BWlizxWxIQ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 07:15:23.7759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2e7432-c320-4289-4d1e-08de598602ac
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_231532_996739_58EF4F3A 
X-CRM114-Status: GOOD (  15.77  )
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



On 1/9/26 10:22, Patrice Chotard wrote:
> The bootph-all flag was introduced in dt-schema
> (dtschema/schemas/bootph.yaml) to define node usage across
> different boot phases.
>     
> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
> present in all boot stages, so add missing bootph-all phase flag
> to these nodes to support SD boot.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Changes in v4:
> - Remove useless nodes in stm32mp15-scmi.dtsi
> - Link to v3: https://lore.kernel.org/r/20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com
> 
> Changes in v3:
> - Remove duplicate bootph-all property in ltdc node
> - Link to v2: https://lore.kernel.org/r/20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com
> 
> Changes in v2:
> - Fix 'pinmux' is a required property for arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb
> - Add bootph-all property for lvds and ltdc nodes for stm32mp2
> 
> ---

Initial implementation allows to factorize and add bootph-* properties in a limited number of DT files.

But after internal discussion with Alexandre, choice has been done to add bootph-* properties in board 
DT files only instead of SoCs/pinctrl/boards DT files. 

This impacts a greater number of DT boards files.
A new series revision will be send to match this requirement.

Patrice


> Patrice Chotard (6):
>       ARM: dts: stm32: Add boot phase tags for STMicroelectronics f4 boards
>       ARM: dts: stm32: Add boot phase tags for STMicroelectronics f7 boards
>       ARM: dts: stm32: Add boot phase tags for STMicroelectronics h7 boards
>       ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp13 boards
>       ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp15 boards
>       arm64: dts: st: Add boot phase tags for STMicroelectronics mp2 boards
> 
>  arch/arm/boot/dts/st/stm32429i-eval.dts       | 11 +++++
>  arch/arm/boot/dts/st/stm32746g-eval.dts       | 10 +++++
>  arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi     | 12 ++++++
>  arch/arm/boot/dts/st/stm32f429-disco.dts      | 11 +++++
>  arch/arm/boot/dts/st/stm32f429.dtsi           |  9 ++++
>  arch/arm/boot/dts/st/stm32f469-disco.dts      | 12 ++++++
>  arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi     | 11 +++++
>  arch/arm/boot/dts/st/stm32f746-disco.dts      | 12 ++++++
>  arch/arm/boot/dts/st/stm32f746.dtsi           |  5 +++
>  arch/arm/boot/dts/st/stm32f769-disco.dts      | 12 ++++++
>  arch/arm/boot/dts/st/stm32h743.dtsi           | 19 +++++++++
>  arch/arm/boot/dts/st/stm32mp131.dtsi          | 21 ++++++++++
>  arch/arm/boot/dts/st/stm32mp135f-dk.dts       | 11 +++++
>  arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      |  2 +
>  arch/arm/boot/dts/st/stm32mp151.dtsi          | 29 +++++++++++++
>  arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 14 +++++++
>  arch/arm/boot/dts/st/stm32mp157a-dk1.dts      | 43 +++++++++++++++++++
>  arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 43 +++++++++++++++++++
>  arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 14 +++++++
>  arch/arm/boot/dts/st/stm32mp157c-ed1.dts      | 60 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 25 +++++++++++
>  arch/arm/boot/dts/st/stm32mp157c-ev1.dts      | 36 ++++++++++++++++
>  arch/arm64/boot/dts/st/stm32mp211.dtsi        |  7 ++++
>  arch/arm64/boot/dts/st/stm32mp215f-dk.dts     |  1 +
>  arch/arm64/boot/dts/st/stm32mp231.dtsi        | 22 ++++++++++
>  arch/arm64/boot/dts/st/stm32mp235f-dk.dts     | 11 +++++
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 25 +++++++++++
>  arch/arm64/boot/dts/st/stm32mp255.dtsi        |  3 +-
>  arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 11 +++++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 11 +++++
>  30 files changed, 512 insertions(+), 1 deletion(-)
> ---
> base-commit: 53c18dc078bb6d9e9dfe2cc0671ab78588c44723
> change-id: 20251112-upstream_uboot_properties-22480b0b4b1c
> 
> Best regards,


