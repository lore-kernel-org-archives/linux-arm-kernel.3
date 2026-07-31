Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5175FC55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 08:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4C8Dr6co95YKaw+iElhyqdjsa/e9Ta/1esicflyM3s=; b=zN1wXDyh5gswk8sNK66SEZ2iHv
	i6nYgwYjE2E6IAnGaCo3gaBOeW363vN5wHedKMGCyw5mlNtGS8BiJ9jUJ/apiuj4AcQliA1OaaJJl
	HBM6jCtdtw5dly7pIncG52eyqsTZB5oBQhizw/YJAjSVKWlm8GoEtIskAYWgUj5rh/rr3NwdohO4m
	A14YchPhMfdKY2UEArRkT6a1IsuU99Onr4TNYQZaHVxCVVy698RSIlLQmSKgRVL013Z6SF/0EPAO7
	Zs5b5ckk9PpSVYFy/WvbSBy73Yziu5Tuu2tVEJfscm3GOmtPCkxBUR97l4tV1vVeVVhS6cbigyNsE
	2NHVBqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiIN-0000000C1SK-2iUh;
	Fri, 31 Jul 2026 08:08:43 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiHw-0000000C1DD-3B9E;
	Fri, 31 Jul 2026 08:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AE/M32HOsAFI+b+IoATM17SB2wzW7kt6u9+qvkm4lZqNpyOEQ4JFtEXXliWRpLc6u/cL/naJtVVBDn4VmV0ktENAi+JhebRqWAmibxSp3VwG8y1mBASSQ64wWZhQWhq3tEO10oyWcz+ngDJdYzXp2J2E13YtzRbccJSt/6NewgTQoqaWo0GyRyF+z6mvyG88+4H/uZhRETo5EWKid8jk3PJDajcGfs+V44rMF3843uruJFJUJ1RzmCDRpcwbhZB1tnhDq3rZCwX67x0a8hS8Y1Q9u8wJi5ALRfRnyWJtHfZ1mQav1F7gfCvthlK270LkDSOmazFesZ7buSS5yMZ8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4C8Dr6co95YKaw+iElhyqdjsa/e9Ta/1esicflyM3s=;
 b=hNT5m/9SlfcS/IhT4D6+GzONMiNHhYo1uJiXnjTa8A/VWCuq2eLMbRugE+ZBVx/X2Fa04IafWGIZjpr7HrG3aNiOOf4tYnkBW58wnDhIj700APEl1phC4VJaxWcHW4HIXAQfFJFoCRF3CoeEVxaLwS3DcFl+qRtrRDwJlWUlVbp25SqLS4HWdGWL8dtAa4EtYXqk1dIT00vZw3TiI/vNbZhW0RVX+SUpiXnmUKXcdL2G52BpJNxDWCP4c0yi6RiEAXMNoCcAniDjfrkLRRLp4YZhLkDD+fR9DNs9jDtPfQY8qqiGq9Gk6RgKwBiWE6rzq2oAx/48w2Bbq3/ria/iIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4C8Dr6co95YKaw+iElhyqdjsa/e9Ta/1esicflyM3s=;
 b=V535Bu46bSj81B1taf8Zksi9rN7hvVAy5F2lK7tiiZ4zOE/BX1+eeTOnN8ljzvncSQfhiI7DoOWQLghAhU2y8UMxWloXFSRV1WIuXSg5CskY4qSYM7xQKJPj9w7CpTB3kBRCFFZFdw9ikaMy75twlnL6siexONiaynhk9UWa+yUWqxada32QC+Ajqznhjp6KLPl/D5Fd/GABrdaEsHmYz3bQ3XULWihCRvS0lI2e3WN974sr61CPKeAwbHa2uHGbFkkKqeC0YQDifbjOYTy0nL9NI2oePDY/4Q1nLa6Coxkxa59U7eA69mTldVVIHkCmBQ+sNX49ZxuiXWgWgp2BOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8657.eurprd04.prod.outlook.com (2603:10a6:20b:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:08:12 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:08:12 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 31 Jul 2026 16:11:24 +0800
Subject: [PATCH v8 6/6] phy: fsl-imx8mq-usb: keep PHY power domain runtime
 always-on for i.MX8MP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-imx8mp-usb-phy-improvement-v8-6-2ec8d6b3854d@nxp.com>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
In-Reply-To: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785485487; l=2319;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=g43getvMDQHHUdjqYvtI0dmM60kcgh5E0zSC+VvDa5g=;
 b=HOV5mMEBVjLxjohNwoV12+BaUYCH7hCM3fdVxkraEQarnK47Ci9x9nOy8KYP9ilOL9KOBmn4L
 8dVR5bPHTa1C1NTn11geAFmu1Z4wFLyD2iq8sD6yRCNqAvoGIqe+9NL
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 07edffca-078a-458f-ab64-08deeedadd56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: swvkFtiYfl9RgRkLUvHPefWeRZOFGFtY/vThK3XQvurlWng8Y2/YxdZHPU9w0HfL2mXMX8NEaizTCUxb7DKAzWKjau/usuNpZeEVOwJyTKvXJpHmYCEQbTzE3nxFyix/QSPW2P2Y7CuUgk/F7WN2j+KoIQXijQSdct1uelisCbFmyoQUIho0rSDsOKvW63rQJTMeyO51vai4kuNsJEYlrDU9a3Bp0apqHBqXJ6xg6m1ahVvwAMop5xPt73yQoEvnI7pvKfWrGDV5jRuDjEngmFxB5u5mcI5IyqkleMr0YcbOZoC1BrLjIrdEjHpodWonG2ilzf4udjGa1Dex5QHtFIQIRU/ylhG2JhfAWAMgYU1hHycozU9ivVwKmRJZ7mk1L8kCCOab9TOuHVuUUXvznREVo/efFaN0uksMsCFLxXJceCOhb3tSJg6T/QJpcnWo6/zamaZ1ufN5Eu4OHOBI8LNUgOSiRS5SpWQ15gYN+BLPLWirZlZkRlHd2ZVXZo7Iqd3JKsHRlC1MQzFgwtvFvwRm6jR+KOAktL9TiWCKGXWk/V7bKLa/Jas49VrbuQ/TfXRME8OZl2ke/o1ak+P5CqwPsPfYo9LTRL4LBCtYM5UHXPO/YMOwjdN//xRFB0glotdEory7qjiAV4mouuDp0522Ha+DEJFvvOT8iJHSUx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZmbGJQa3RPZEMyaTFxdEtBbUtTRHFWSUxVVVpGbUJFTEdyT2RJQlNxd29G?=
 =?utf-8?B?QjRxMHQyelB0ZWw4Y0VXczJIWjZTWlEzQVN2VmFETDljM3puYThOVDFoSGRm?=
 =?utf-8?B?QTJZWFlLSVM4QVlKcjBOZldIRUFNSG1wcStsdTdHWHJhNDgxWHlSSTN6NHE2?=
 =?utf-8?B?d0hpVEF0ZlRwdmM5K0dFMHI4ZkZ5WHl6RmY3N3l1eXB6Zi9IeWVNOUNOelVk?=
 =?utf-8?B?KzRuaWVVWnozcU5la0xOUG96ejlxcE5IMXdMWW5nTmVteDc1N1VsQmUvYWhJ?=
 =?utf-8?B?SmFPdTFuVEhHem1TdE9SYjNEY1FzeU9OV0JEcFF6MFFvaVFBbmVDc0V3dkh2?=
 =?utf-8?B?dGRuZis3THY5VVp2ckxkK3NhMHJjNk93M3FHRDFFeUhPTXJvaE1tVVFrVkdo?=
 =?utf-8?B?c0pQb2l5Y2w3LzdrUU1kS05aYnQwVzYyK2FjWk54RDV1RVB6QlRaSURwclAr?=
 =?utf-8?B?QXR4SE5DeGN6WXJXZFA2ZEFneCt4ZGsraG9tblhFU0RIakY3K1hqWm43R1E2?=
 =?utf-8?B?cTR6Mi9qaFlUdEJxc2JvSFJMV0dlb3RDeHhRNTdrNzl3b01QL0NpWTNLMGQr?=
 =?utf-8?B?VTc4K21PVEl0RStjWFlBM29RWkZtc0hzeHM2Q2cyYWVSR2tBMXkwOTduaitO?=
 =?utf-8?B?aDVtcDFOZ1ZvV3Z1cDdqQjV1cDhjY1VLVzJpSzd4NVl1OENqci95cytmU2hn?=
 =?utf-8?B?SGNEcWZZeDM0d3hXc203R3ppUXZGZDBtekY3U2x3OUtRdTF6czVhamRoYnhr?=
 =?utf-8?B?M01wczRFRG1ZM3V5V0tLeGlQcUh6UjFFYzBsWXpNTEF0K0haOHlLeW05UXlO?=
 =?utf-8?B?WndCUXl3aE1TejJyMFIyUXBHWStmczNDOHVOdUgzQjg3ZVJIS1BkV3EvSmpT?=
 =?utf-8?B?VStQcWZVTVNJYmI5b3Q4Z25LSTl3QnovVFNvaWZyRXBIQm1iNTE4U3Y4UGs3?=
 =?utf-8?B?UUx6R0tmMmVBTFB3NHg3NVdSWFRpdThxSmc0eTNsNUtKM2NuaVRtY09LUktw?=
 =?utf-8?B?Ry9zKzlrK1hNVEZiNXJ3MllPVURlMzl6NzhsWFUyWFpBWW1jUG4yOEZiYStR?=
 =?utf-8?B?RjNoekhpMHNyZUEzY2VwUHZReThNb25vaHVpVmhISGE0R1M0YXdRN1BOUzll?=
 =?utf-8?B?a2JDYkJ4OW9JTjQ5UmlKQ3BXVFFFdk5lZ2QwOFZQZnFGYjg5UDlTTHpPTkYv?=
 =?utf-8?B?N1E4MUxkcmdWSnlVTlZxRjZOWmdzd2d4M2xSRThvb243ZmVhM0Jvci93ek1h?=
 =?utf-8?B?UUgrVHF5a2FLdzNEZFh0Z3NtVzhFM2t3S1MzenE1ellVQnZmOUZrbDJDd0t6?=
 =?utf-8?B?c2tKdHZmL3NOMDhKZUoyaXIyM0VVamcxZlBaL0FFdHZiNnVNVWFHSzBxUWF6?=
 =?utf-8?B?djJQSFE3a2xReTJ2c1pHM0Iwa3djSVRNN2Yxdi9kTGxoWit1d1RaRGRtbE02?=
 =?utf-8?B?Y09KY1M3S2FrM091SnhIRUpTL21IcmtKUEVOdjRHaWFzVjIzRElVUjRNQ0Fh?=
 =?utf-8?B?REhLSHAzTHN6RlF4dlRCU2ExWmlaazkya3ZmeE84SkNzMzV4U3BZdjA3YVk0?=
 =?utf-8?B?UEVHb2FkQ0hncFgxcGxkZXdyQlA4ZXQ5eG1mdzA5ZWJSODBVaExnbTlPV2Na?=
 =?utf-8?B?TEpOa2dLZjZZaUJkM0dUWUkwdW9QNWc0OEs4ZXpsWDl6M0VvbE5tZEthTmMx?=
 =?utf-8?B?Y1djdUROQk52c3lZOXNPL1d6d1N1MEdtUFF3VHlkbUFZSSt3M2FYU0xMcE9s?=
 =?utf-8?B?ZXhQNkh5QnZhNDlaWFNISk9ieHRPd0luNVJtVlRzRVNPY2dSYU9KT0l4NXkr?=
 =?utf-8?B?OXpIZXBZVFBISFlXQ010aGw1Tk5vTWZhQzRoWi8vL1RESXFEN1JxajYwR2Nn?=
 =?utf-8?B?LzM4dlgvUGYxK0k2ancrbVZJbUcwQkhsaGdkWDExZ2U3U0ljenJ4ZitVNjlX?=
 =?utf-8?B?aW9FZkcyYmh3MEVUOFV2YVdGanpycDJYQ2FTYmE1eTByMXBpUC9FRCticGZz?=
 =?utf-8?B?dkx0cEE3d1ZiTS9XcmdGQVk0L21qNUJtZnFDSEJoS1A0Vm9Xd3AwSm0xTHZq?=
 =?utf-8?B?K3F4am50VjlLdFRkdkkxekdDUWUzaWxENm9INWVPaFZFMzFYK2VSOFptbFB1?=
 =?utf-8?B?czFpUjJIcXhyVHdwQVRTd3NRYU04UitZUkpVS1gwU3R6eFpMWUF6cUtUR0pn?=
 =?utf-8?B?bWpTbURlV0N0eGNvcEZSZURjOVA5cTY0ZkprYTQzSzhRMHZHQzFBTzJwYWxC?=
 =?utf-8?B?bFVhd0pGdHR4SEFUQ1FUcU5tcS9DYzdLeGFmTXA4WWlOYUFMWUtwUW5FQkxt?=
 =?utf-8?B?bjVzRHhZWUROZnR6cTZjeEdUYkNyejhSRDA3QVMrRUxvRGU2VzZsT3JBREo5?=
 =?utf-8?Q?5rnpg+J2Hxt2LbSquD7NwgPv/QKpv0dfwg4+B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07edffca-078a-458f-ab64-08deeedadd56
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:08:11.9566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boDUgPwWL7CsJZMXdz7Q7i9NFw+Mw/UCMb1sJTNDhvYKwtHPCtuHOn8CAXKp/5q2muVOIbxBovf7ynZCynbcSOsU2oDX1MUuz43alDzhaSElIPunGNeX6+mU/412/Td+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_010816_804012_77159313 
X-CRM114-Status: GOOD (  14.43  )
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

From: Xu Yang <xu.yang_2@nxp.com>

On i.MX8MP, the USB PHY has a dedicated power domain that was previously
never powered off at runtime. With the introduction of runtime PM support,
the power domain will be powered off if the device is runtime suspended,
which breaks USB wakeup functionality.

To preserve wakeup functionality, mark the PHY power domain as runtime
always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
need_genpd_rpm_on to imx8mq_usb_phy_drvdata and set it as true for i.MX8MP.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v8:
 - no changes
Changes in v7:
 - replace dev_err_probe() with dev_warn()
Changes in v6:
 - set need_genpd_rpm_on flag for i.MX8MP and call dev_pm_genpd_rpm_always_on()
   if the flag is true
Changes in v5:
 - no changes
Changes in v4:
 - no changes
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index ba7603a008d8..8859835541b1 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
@@ -134,6 +135,7 @@ struct imx8mq_usb_phy {
 
 struct imx8mq_usb_phy_drvdata {
 	const struct phy_ops *ops;
+	bool need_genpd_rpm_on;
 };
 
 static void tca_blk_orientation_set(struct tca_blk *tca,
@@ -669,6 +671,7 @@ static const struct imx8mq_usb_phy_drvdata imx8mq_usb_phy_data = {
 
 static const struct imx8mq_usb_phy_drvdata imx8mp_usb_phy_data = {
 	.ops = &imx8mp_usb_phy_ops,
+	.need_genpd_rpm_on = true,
 };
 
 static const struct imx8mq_usb_phy_drvdata imx95_usb_phy_data = {
@@ -738,6 +741,12 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (!phy_data)
 		return -EINVAL;
 
+	if (phy_data->need_genpd_rpm_on) {
+		ret = dev_pm_genpd_rpm_always_on(dev, true);
+		if (ret && ret != -EOPNOTSUPP)
+			dev_warn(dev, "failed to set genpd rpm always on\n");
+	}
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 

-- 
2.34.1


