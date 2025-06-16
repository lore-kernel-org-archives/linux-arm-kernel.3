Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE9CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s34jR7BN70TyhzKKSpwlNhDug10QseFFXG+vHKOMuKA=; b=3W+cvF9dNX5ReooIBCB3t76A6p
	SylRxMioHTGcB9IVnR9R8WcXZ2jzgnEBClKkJmgU8B++uv9RsHMknBtslp8uIhDfixftPBLQk9fNO
	FHApba8kxtg+0HV+Ci8W44bPXGdjCSfNzRIZBBiucD2/bLShZr33C4yagx22IoT6Xz+EtNz/RE3s8
	qP4q1HjhN9gnEfMVdn6mdDIjfir6XutNE3lK0ucXw5N/hspzJup6p+Ejm4Rrk1drjbvXrQPrlDhy5
	/A9+06mOMJAEHR0X5ulb3R/gC3tUWt8wvgl1zVJFtAQlDfEixQi89JsagWkt+CaPfiXYhua0pBn3P
	coK1fv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6Ob-00000003wyD-0eqa;
	Mon, 16 Jun 2025 09:44:53 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5gp-00000003rdq-1vA6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 08:59:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+UyVKIhrXowmPqwwaIP+9Ul5bhv5r583KxIeN0xzpsl6koiceOqSLYPxMsYtlU/lfU1O1sMG5ltZ5R0F3WZBUYKCsYYIlXwX6vhQScGAkUlnPQOQsXmIxpcdU64QC9R7U5UgnfqEmgu2q6I9iZHkrv7mVP+JfMRJfoAVwvb43Q6SlifZvz5RCNjChZ/8YnUmaFGe38gqKjbHdcILkX0u9UacpbzAIsfJbPbqhsp+CLwP9GEHPzCE+SLVcqZ1WJqw4gZiF/4W5GmJgfgBIM/UkFr51VSHntdlGyHDzI6mhXT1wLV+BO1nhNmoYYOyIeJzSf+8IdS2b9GDXmFOvkMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s34jR7BN70TyhzKKSpwlNhDug10QseFFXG+vHKOMuKA=;
 b=UWxLTOPLYkof7MqJaJNvYRQXLcTps18I06LaGZ6d1QfSzmcze1bmuUbzJyPXQe9VnoVFfp5zE0VKSE+ecn2LHtK7CZbT0wYu4uWqXPtodb9TTaQ6F0ZfJmhlY9Hen6Q514PzWblvhfZwFlRkd8euRYmDf6uRz51uFj+j94COhH0AGmvz/UouSPkGBFkqamtZnWhupDIonCHMDhL8lfOB8TKStRXqpx4lNnLWXaT4Gv8HTZ6D6cCWWQ/MPsoOKMbRRT6klGNjeF4xZYxkXKo4MS3ry52CWEi6NGRNiuXJwIwTKEVAuik0TOLINp8ffQjnMXXxwq7CCp2XtgzwrcNCSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s34jR7BN70TyhzKKSpwlNhDug10QseFFXG+vHKOMuKA=;
 b=DacO7aCdEUSteoJfHNO1k1bcRxuURhJCPe72ZUCcGg1ss/4OIqIkNQYPYE1l2kLO9YWD2zCxD2XJ3TjkQXiiNA99GazhmMAGMTu23J/ikntDZTBBu8lbC4snNrnWZv0FIQAQhnPq9NMC71dH6nBAmNbfKWemUQu0pZAffcKL26IOsbMeaFm1NcoNUjVTfscbbrWDg6a2JCtQI1+xsiuqHbeOHeic9n7GUDzutEKaZlPv0uMZAUCuoECFZkh6aBPw8htJaCrl7MrXCWVb/ENnNMsVJDfiAVNm+1P+hYXXu8mJZDhxUX3oARqrI/2+ErwjK18bUXOR+R90hHzN3H6tfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by PA4PR04MB7712.eurprd04.prod.outlook.com (2603:10a6:102:ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 08:59:35 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 08:59:35 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [v3 0/2] PCI: imx6: Refine apps_reset and EP link behavior
Date: Mon, 16 Jun 2025 16:57:40 +0800
Message-Id: <20250616085742.2684742-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|PA4PR04MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: b9675c5c-722b-4ff2-29c8-08ddacb41ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXRPUmtxR3JRQlVHeDhRRm43aWJPQ3luOGtKOU5HUEUyTVFuWWdHaWhaekNB?=
 =?utf-8?B?SUxta242d05VREVRTHFib0FNcEFCTG5heWs0cjVGb1U5WHplY2sveUc3Vlg4?=
 =?utf-8?B?NFZPdlRZaldvNU53cTVmMm5rbS8vNkQ1bDg5U0tmbHRtdU5JcUlxVDBCeS9K?=
 =?utf-8?B?TDZReGFGZjl6MEh3WGhOaUZVcTYvTXg2dHRISEk3ZzVPYXBidGkyaXliUHlx?=
 =?utf-8?B?TnRmUDlXZ2JHYVFhVUp4UFN4Ni9xTzE5UzlqSEpKeDZTbnFhTFQyaHB0OVpV?=
 =?utf-8?B?V0Zwbkt3cmI0elBxdzVDb1l6Y0NQMElTUVlIZm1JcldqbVBvUURRZ0orRTRQ?=
 =?utf-8?B?aitUT3YwNVhGMGtpc1kza0xWRDA5aE9lemh3UFFHcmgrU0N6RnVleEZXckwr?=
 =?utf-8?B?YU1CYkNuVk1nZ1JTWnFXWHhRays2S1RYUktWYXdUZkFxY0h4V2JJUU5zblFt?=
 =?utf-8?B?NWQ2NnNxT2o4M1laVXNHQUpzVHM3Wm9ZakdnalJpM1h6Q2tjOWdZUXBmcjNR?=
 =?utf-8?B?L3NDSHR4K2M1UnExdmNscnRQcGJVRHp4MG5HWWtlcXR3eG1BUHF1cmdGaXhs?=
 =?utf-8?B?ZUNxdmg4WmtGQUVaTE41TXJ0bFBzaVV3MzBuQk5icHZ0dlNYYTVUdEd2RnRp?=
 =?utf-8?B?U2FOT2RnL2c3KzBFRnRkT1AzOGhpQmQxYzUrMW1UUFRKTWZJcGRwcU0wekNW?=
 =?utf-8?B?alNzRUZmdWs4M3VoR0w2VkRKTnhWRlp0VmFidS95NVVYVklaMVNJVDlBcy9J?=
 =?utf-8?B?S1ZwQ01YN1l3OG0zcjZtT1BrRXNiVDVqVnlkaTQvaExuUlZiaEZNZjhuK3lK?=
 =?utf-8?B?eEtPa2xhNXY2MlRyaU0rN1o1ZFcwUmZhRFlwUXBjSXZZRTBJcU5YM0tUWUt0?=
 =?utf-8?B?NEM5OW5HS1R2VzFnMkhMNmo3dDBtVTBVdDVud2ZnL3V1ekNxUjJ2WW5Wd2Ix?=
 =?utf-8?B?enh4akxZcUE2ZUZ3ZTkrUTRJUDZSM0xxWEhWenVSaU9xbWhPem5RREhNWjJl?=
 =?utf-8?B?WVNiMHpKTXBXR1FZVTZZOVhsa0F4TExBdm10c0RCWnhsTUVSM3RRMDJIckgv?=
 =?utf-8?B?TFR2SXNSbFdzYUxkbEJXTmJQa1M1RmlDcDdhRjh0S25iTEcrbU0rWS9FY1Vv?=
 =?utf-8?B?S0RRY0VBWTIydGVMc0VGWkpHTUhLNkdTZTRYTU0zcVMyMGJlUVB1V20zY3RC?=
 =?utf-8?B?VWNwRFU1NTYvN2JhTDQreGZxWjF3TnFkTERwWXRBdllXQURlR3M2S29YQ2NH?=
 =?utf-8?B?d0RUTzdtQUlsc3BkcWhxdG5EREdaY2xLcDdQMThPVjYvTEpLMVNhNUQvUjhO?=
 =?utf-8?B?S1ljMDVveTNIbFIrRmRRR01TR3RzWERLSTVsK0M0ZjQvU0VZNmU0RTVtSnBl?=
 =?utf-8?B?UUhGT1kzZ2FpZFMzVGNmQThCRWRBaE9pbkM1K2VBR2ZqbGlSNXpaOUJ3ZWhO?=
 =?utf-8?B?aDUxdDNPdzZaakFIbFI0cEs0L1pjWXNFYi9IRmxFNHZENUQ1WjNXOWhaWmFZ?=
 =?utf-8?B?bWpmZ250MDBWQU9zY29FeDZUZGZldW1NTDA0NHlJRitLWk1DQ1lKU0pGbVZR?=
 =?utf-8?B?dFN6TWVlZmQxUlY1SVdiQzJZbzZ0NzlsTEVQN1dFYzdrcU95Z3V5ZUgvV1FZ?=
 =?utf-8?B?UXFLMkk1UXJ5Ylpzd1NmSHhHR21Xb2FiTUhsY001NFZHMHBLcDhralptQWNC?=
 =?utf-8?B?UFI2RlNQQk4xYm5mdkNGSW5KNXptZGgwMkNPaEZSLy9sNXRRRXFqdkZKekFy?=
 =?utf-8?B?cjF4WDErRjc2dmtSM21BUm94T2lxNzJhRVlYVXZqRkdGYVhSZkZ1alhkOGZM?=
 =?utf-8?B?VGk5bC9VbGpoZ1M0KzNlSGNVUE9RMEUzN01iYm9GQ3ZHQTJqYWJuR29ZWDdz?=
 =?utf-8?B?NGx6SWlBVHNIcjk3cWY5bDR2c2tvYzB3OWdQUDdGeklHMFNXOXRTVjErdzBW?=
 =?utf-8?Q?Fi6DV3MR8aWurOKCfYnR3QGMkvd2g0MK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGNUNks4RlE5ZFZQSFVJbDdxbHJ3cnJIeGZEejk1U2pHMDBxSEtPbjArRTdZ?=
 =?utf-8?B?S3pFKzlwUm02UXZsK3Z4TGpOMUE2UERCV1g3KzZmSm1Md3lKSUgxbEtndkJa?=
 =?utf-8?B?bWVKVG9kVjZBd1dCOVJ0ZDVkNTRuQVdUSkpkTUE1NE4wcEhDeSs1Rlpyb25u?=
 =?utf-8?B?NXA5N3FGOHFaQkg1VXBXZ1FLb0ZwM3JGT2RCYlVoOXV0dVIwQWZja25sSi9k?=
 =?utf-8?B?UlV5cWJPT2ozemVxd3U1eTlWajc3WTVxWVpESS95QXQvM3NrcEJOTXZZVEpP?=
 =?utf-8?B?c1c2elB4WG5oemROa04xYVNkRTFqK0hzSVcya21DNDkya1pVbW44QS9FeFov?=
 =?utf-8?B?SHlIeWFkc3BIRFo1eWsyT045RzJVQS8rbWRqM0UyTFVJMVdaU3NjTUxtOXhi?=
 =?utf-8?B?Wit6Y3ZhcWlLMGo5QXVoaGxleFRHL3A3QW1lL1ZSek1xVGFkZCtWZXF3enZN?=
 =?utf-8?B?VHpWbGRURVRXcCs1UkhlTm11RnRwcEhuQ3B5T1FuWXhkL083OXo0Qk04WVdG?=
 =?utf-8?B?Q2JGWC9wZmZqUnZFdFNsYnYvdDZ4NkhKNlhaZnFJdkFuWDJIaW03ZGxndk1I?=
 =?utf-8?B?clNBdFozZlk3d2V6N2dPc1RSd2pXaXdqZmZpZnJBNmpKYTlXUTJiRTVnR2lW?=
 =?utf-8?B?QnVlM29DUE1RZWtjWlozOFRIVll6NXFhc29SN2N0dnI5SmZuSmtwNzBvUkpL?=
 =?utf-8?B?Ti9LTUd2K1A1bjh3UWQ2S2h0YnZnZ2V6ZU4zZTdTOUVuWHdLVUdYV084b1Yy?=
 =?utf-8?B?Vk0yaVhyeEplWUxvWmdTTmdYbUpWbDRMTlVUM0NDc1lQSjJHMSs3dXFsdHBE?=
 =?utf-8?B?dnQ4WnZvSHNqb2FENm5SS1lRL2R6VDhxZFFrYmNCMlhQYjhZQXdjK3l6MHk5?=
 =?utf-8?B?RmJhR1QzTlYzQm80bkh6emR0WTFVM0lNTktlNlo3NkJKeHVOeTA5U1dRM24x?=
 =?utf-8?B?cWE4dDVJdkdtclpURmk4U0VZa2JEZEhZSm1hUzNjSm8wN3lXY1BscGpPTGJ6?=
 =?utf-8?B?NTBGWTNIVXlTMUNtODl5a2YyT21UODQvU1d6V09OdG1WakZZQTJlNGYxWmgx?=
 =?utf-8?B?Nk5zdDJmNjN6aEJvWk5kLzRyd0o1UW5hNXZnWmZKS211VktJRUQ3RitVYnRY?=
 =?utf-8?B?RThTTmxVdHFBbWVHZzhjNzdudnE3RG5za0JreU0wNGZFajVMVXZZZDRlbmxs?=
 =?utf-8?B?V2hyaVV0d2NHSWNORG9La2ZNeUpoS1p3ZlBJcVFSSUxJaFBhQm5SSUN0bCtM?=
 =?utf-8?B?dlE4WmdTaVFqb0R6anFVeDM1QkM0Y0F5YXZzYTVlcDBzUHkzbWQrZHBLRU5Z?=
 =?utf-8?B?a2c1N2J5Q09uVVRmZy9iR3FGNUQrRE1WMW8rSWhza2QxNmxlNThyQ2N5RG1h?=
 =?utf-8?B?QTY1enFmQkdrL2g1NU1xclcreW44aGt3bEhsZ3RLY285V3Z6S3YwS09TQ29Q?=
 =?utf-8?B?dHBpenB4cm9SUkNkWnNZWU1UT1ZpK2JFN0RFTGVqRWt4WThhaWY4NzlsU04x?=
 =?utf-8?B?L3djcWJESk95N3FMVHdjdjdDd1FUS0Z6NWhvRzcvZDFGcjFHb1p5Z05USFdl?=
 =?utf-8?B?ZDNIazF0MVcyRzE3KzBlTUhra1VpZnBxOGdqVUNJdVhmOHUwejR1eTRzQzVL?=
 =?utf-8?B?c2NoU0JhS28vbmxaWGlmZzM3Z3J2dDVRK2djMzlBOVhqWkxKN1lvd2o2c2lR?=
 =?utf-8?B?V1puS09sRFVHQXZMSmdhTDd1N2hWY2xRTXhIcFUvVnlkOUhic1JOTjFuUi9i?=
 =?utf-8?B?eGo3Tm5kTzY0RVJhU1JMNnpMZmZiZWNhS2FlVXBhUWFXUG10TjlQWW9wOUo5?=
 =?utf-8?B?VGppelFldTNBWTdGcFZINkdQZnRHZzJNdGVtZTR3SWxybytLb3RnTXV3aEFW?=
 =?utf-8?B?TUxXZDVUS2tadHB1eTEzRkZBTjBrTCtXYUU4UExqQ25RR1BGbyt3RkxCakRk?=
 =?utf-8?B?Vm1qR0ZvajVUeHJMbXk2bjVQWlJBRGRmUzBRamJBWEJFbXoxY0YvZ0RYeU5D?=
 =?utf-8?B?bEwzSnJvQXpESkRzbW9WdkxkTk1CR21kWjJOQ2s3aFVjOUM0UjJQTVZJRHdR?=
 =?utf-8?B?dkhPMWJDaTkrMVE5WExiVGJLem1OK3h3NmVNVzh6bXR5bXpTOVFDR1lZem1t?=
 =?utf-8?Q?bdsxIYY+Hl6iH8UYgHPPjB82A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9675c5c-722b-4ff2-29c8-08ddacb41ddf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:59:35.5792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2oewhSRfmqWonEFz711M5CaISL9habXM4PwID8iadASLOa0JNTYqECp47S9WTTONRRP4IpqAM2dbzCff0UCVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_015939_510028_B59976AA 
X-CRM114-Status: UNSURE (   7.24  )
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

  apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms.
Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();

Remove apps_reset toggle in imx_pcie_assert_core_reset() and
imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
and imx_pcie_ltssm_disable() to configure apps_reset directly.

Fix fail[1] to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM,
which reported By Tim.

Main changes in v3:
- Correct the email address of Mani and Krzysztof Wilczyński.
- Add "Reviewed-by: Frank Li <Frank.Li@nxp.com>" tag, and rebase to v6.16-rc2
v2:https://patchwork.kernel.org/project/linux-pci/cover/20250612022747.1206053-1-hongxing.zhu@nxp.com/

Main changes in v2:
- Respin "PCI: imx6: Align EP link start behavior with" patch.
- Add the apps_reset refine patch into this patch-set.
v1:https://patchwork.kernel.org/project/linux-pci/patch/20250606075729.3855815-1-hongxing.zhu@nxp.com/

[1]https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcMHDy+poj9=jSy+w@mail.gmail.com/

[PATCH v3 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset
[PATCH v3 2/2] PCI: imx6: Align EP link start behavior with

drivers/pci/controller/dwc/pci-imx6.c | 8 +++-----
1 file changed, 3 insertions(+), 5 deletions(-)


