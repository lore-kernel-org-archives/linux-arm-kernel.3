Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3238ACD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UA8faNJ+jbLjZX5+aubp3Y/PiTHGJFAE1tEY/ve2LKc=; b=hCK1N2CI/CB/m7DYWkoYRSgfAl
	ZdBbeD/50y2O9UG3ArWTLbJh99n6vqAMAnmJnQIqMZvqZF+WaDerlNJsOVdSlkLideoTrCnNv19k3
	/GoTSno2wyIoVqOjr2cpL8BYePaQVMsLkLxSh8JxA1iF/bb22AkimcC3wyXs4hKpkcXX8sJs7WNkH
	MjACcSB1ds69ss6w7CaBCo3CqnguCUNeRbjONaeuQxSe2DRj3yAsBDOjlEss9mGlAVQmQjAmBk+E1
	LzA8jwsG4A3+y/EXpkB/DOV3vkmisncxcs93qBXVBGWolr07PkZZ6pHSoSy8r+VQPalnA+TIFTlW0
	hUaBaRqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpsj-00000004qvC-3XVT;
	Tue, 09 Jun 2026 06:24:13 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpsh-00000004qtr-41aj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:24:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGH+sF7L7S2Gts3AvpOxr6/3sVroJuxmWj4bOZiHcbJ8/vLDA82dqdg24QOTephb8+AXNzaauT+cpOUNjRKUXIK92OMH9yZhykN5T7Gd6ecR/qP6KnA3x1mqx1H93g+eYddoCD1vydndddZ5GbtdLjXH5BrYgo5Xn/KQX9ILpnNe5ug4U4LWVSCxzLmWtZJwy8c6qPRf5bBLmmDSKXhTeVn238DYtZEAUtywFCZ6be00+TuJSa3msk2y+SfCkQCyjI2T0xD+ea2WGysuqPXGOftlC8f18k82RFhVM9M759vKh82Xcla3BHbwXr11BBqjO8L3pZAdf148KnM+v13FFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UA8faNJ+jbLjZX5+aubp3Y/PiTHGJFAE1tEY/ve2LKc=;
 b=e3dd+3o1LmJmfxocg+18HWMLq+bJri5NhqmrdyzPD9ckDCoUOtfOIaRXhGrKpvM3T/brSHnZnETs+Niz+KlMYrO8/0HQHhUvhG9iXKD9JlhYL1r4GI6xO3917IEm4gnEwXdC+98OV+azrgmTRca6lP85ZynXxGAtwT3AVMYSxJLuO7EbA2sYkVahYBBNZO7j3okVTAGH3+lytcLd/dOPYNX4HvGHZx90JiSOLrOOeTWla7Z9rSqm7vmnu/VUN8Cs8pttVvYtFDC78LIONRn1A7LYtrsHGy4MPofZywJzlAXT6GuDWzTGQtiq/uZvF5vrg/lW1W0aqs2b8a/LwGM+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UA8faNJ+jbLjZX5+aubp3Y/PiTHGJFAE1tEY/ve2LKc=;
 b=WenveXdOusGnlaWm9FS1a/trUrsaM5b7zVYmiTJEo6bN6xnxS/B/HJPLPPR99ToBt7ScmTiEOn/5AOQYxyQnQKJzIZ3EFaRHaVD/mUxgiAkuYXqTMuXuQKJBMTFQHPD/3cWt8FGpcqdmjOSQdEZGqlVnwKI6Ax3XWvUuU0Rno5OVFmj+jqlKa/Dd6ND7UJBT3p8krjakEknu2oQIFPakqbRa7xORYFKCrioajG4rUQMkJX5kOJj4s67BZJ6Ut/Hei1SRRayAPJehq68ieTajmVgZPboXliO4IaAJCBu6AYusoDqfefLt23F4rbhKte3CbXy/+r54nK2naZJXiDeayg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB11670.eurprd04.prod.outlook.com (2603:10a6:800:2fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 06:24:06 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:24:05 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 09 Jun 2026 14:26:40 +0800
Subject: [PATCH 1/2] dt-bindings: power: imx93: Add MIPI PHY power domain
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-pm_imx93-v1-1-d06c004b0f51@oss.nxp.com>
References: <20260609-pm_imx93-v1-0-d06c004b0f51@oss.nxp.com>
In-Reply-To: <20260609-pm_imx93-v1-0-d06c004b0f51@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780986431; l=682;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=NyosVvmCGUTAuM6gs7MySq6U+5pOcgVQ5zawIw3AdMM=;
 b=ARBcQU1+IsaMfsefJZypAFlovSUbUktoy+WQIX6wUJYUIDqtcUWZ48MJqVmElc0GY1rZapCu5
 jnBc/yuPWmDAkf4tZI/yBxiHpjBFgnReHg3AZdiWNkT9qHGaMD2KBly
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI0PR04MB11670:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1b3beb-1185-47cd-16c2-08dec5efb4f8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: r5W4fTME9Fp8FVSLleMz7SDPZPiU8vRHJiUodus0vtQMK4i4oI30sycWrVmhZUjI13sXceQuv14Sczko6uaqBDaCb/fpu2NtZQQZqdUf2fIUyChW6gQgrVgDJ59swX+6TZQlVlGpGHLIyNv6UU/yXS9fYhYV1AEgHHMUohdOA7ku/L+M9uQk1PKQSaVU4jv61oqo1prrOqN2WIq/BzSxzXO0RUTD6pW5l6Kaq/tQA0ZPHVB/Zhf1ISGtp9OvEWsOfE8A8uTX6xPinrbZt/RRgiKNQ+vaW+GA4PIEH1yV1TtHazOeDJEBgGAZC33qc6HQM1ZgXugXF7eM1Dcm4j99Vdjr0IEXlui+MV3A0k83NxYlB6w3CCoO4gP23FPJCQdcN1d7meIlJQ02zz2VzLYV4OjPMgRBUafmjn8TJom1WoJh82QYOYNShuIBM/vRddFIETaC0hBZ9dSZv/2jXIzbL1+u/2C+CkKUN3wVlmmRIMiPPdEd3slg0LVuBkKUHQ4Nk2edUTGq2HajGCzSzEgP1wt/tMXEdAAdUz62I9OeT2ma46JGsSqVnMCfgQ30nwxxKe60FOHpJQzAGQb7d48sCSjTGc5Q7B78pSx6GgUAxpdeK+bVK0p1RXxgsc7A+RTDnQIXE9/KcmcLSk7wfI09qIwq2I/mlAZw6Q2SIfUvnwAk/3ag5cwoV5SnakAKP8zsxvpale4T3CEstw5G9qjsRtQ5uedvxfWbUKSYcNrcE8Z91yL1MpgJxIlJMZZPNJkB2WVwIFtSkFgLMkZgJMwu9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3RWb0xRUGsrdmZydG5mTmtlZlpjeE8vQ1V1aGlENjM0UWtxWm05SUp2Uml2?=
 =?utf-8?B?ekh5S3FmUndmMEdVSXNTWGgwOEFRbWlxWmtFNUdqM1JqdmhqaWJjbHRUbThm?=
 =?utf-8?B?aGkzdE91OTRaUlpYZGNScWtYa3owTnl3N3dqOW5NaTd4RVNWdmVZTHBFRUV1?=
 =?utf-8?B?a2QwVEJ5MlFTN3ZFMCtRcWtNMFhNR21scTNDUmJUMUM3TTlwYit0SDB4eW1o?=
 =?utf-8?B?VVBTdmg4NHY4aFpBTHdQRW9hc3FDUitVN2xkY1NTeDl5V3Y5bUs3V285M2hS?=
 =?utf-8?B?WVFnTnppZnhxejFTVzYrMUxRK1pYQktQTlBqL2VaZHRpTWF4UVk0ZlhUeE9J?=
 =?utf-8?B?WHZzbk42OU5Qc0dxS0gvWDkwaC8zTWtKeVN1ZENjRm5GUlNUSVQ2WFJIblNn?=
 =?utf-8?B?TUZHZUlXbnhjTVNOaUFicTByNHMzdnNuSGhNSmlKUVI1QXJhaE0zS3NMWVdB?=
 =?utf-8?B?TDNiclNudnA0Vit0WTA1QVVMYTMxR3E1SGVFczFwUGFXYU9SQ3ViclRjWEhH?=
 =?utf-8?B?M3dGSGdpYTl5NTRtMkk0RlBRc2tBOVNwVXNYTktzMWQ0VUMxOXZhSEhISWdG?=
 =?utf-8?B?QWpPVEZtcGpuNTJPT1RDZDBWaGFwL0YzZjg1QnZNdjhtalNPWGpIU3FHVzMw?=
 =?utf-8?B?REtvUENvMytmY2pwTGtwWFArS3JidjYyMkVDaFkwVTlMUlRETkVBV1FSblV3?=
 =?utf-8?B?L09BLzRxVXdCMFdwTzVYQ3Iya3h4dG5oZkxzZ09vVDcwbmVQaXBVVGsvMjZW?=
 =?utf-8?B?ZXFLY2hsZlFCaEJXWXBhUVgvRitSVllqdWswOStWZE4wL1JUU003OW5yZGZM?=
 =?utf-8?B?VC9kWGo5OXduSHcySU5EVEVaL3dqVEl0NE9xUTd1Vzl6NHpGNjcvV3JTNnRn?=
 =?utf-8?B?bmN6YWF4b21LRDhKaGlmRFFpTVM0ZHRBNC82MEJ3REcweVhycjR1Vm0vQmV2?=
 =?utf-8?B?YnkvSnpRRUd6dVBkN0ptTTF2cEdJYTVKQ1d6TnhnZUpoVFhrelQ3eEphUTBn?=
 =?utf-8?B?SVdXcVVaYzM3WTdwRVNhQUdVVXZkL1lwVExHK1VlT0dOZ2xIbmFRUUhJczJa?=
 =?utf-8?B?R1lDQUY4b3FsNXhKanQySHdHajh3YWhiQitQVTlZcUZGZHUrWmV6SUFFV2tT?=
 =?utf-8?B?QlFTb2IrZU5pTytCQnVOVWEyUDUvVXR5L1hWY2p5c3dBSW5zUkd2dEdCUmUz?=
 =?utf-8?B?c0tqUFYrWnVvbm1hWGJFbzVCUWZhc3NEc0x6a0pEQktBeDhsTVZXejZ3ODAr?=
 =?utf-8?B?TjRrcU1xaFBZVEp3RUVodUx6MkcrenYrc2Z4YkdKWlRQMUl3M1RvZ0VPWDlx?=
 =?utf-8?B?Q2UzSDJ6a2lDUVhFc3Ixc2F2MS9OYzJEYlJadjF1V0tFUmxqb1F5QVhQNmg2?=
 =?utf-8?B?azJoTkt1TG51UW5raUYyckMwQ25qaGY2L0lpdkFPdjIzQndJQ0RtbUluUUhZ?=
 =?utf-8?B?RnBZVGFuWTYwNVNraTkyeUc3UXBQdzJneTRDMzdlOUxlMFhZMjJuM2h4NUV2?=
 =?utf-8?B?eTFRaDhKRkxEQlZpdXR3SFVId3E4K3VJYkkraTJMSGo0cGpPaFZiUTJhbTBy?=
 =?utf-8?B?NFRzS0tNbUNLSGZKc2p1T2l0bjFaczAwTkp6WXd4UElRc25lSlk1cVFKRDJn?=
 =?utf-8?B?ZFlUdkcwc3dlRlNySyt4ek1QWTlUdVo3ajN4VjVkMndrNHM5Sk4zYUhrUnFL?=
 =?utf-8?B?TjE3d0czV3AyTlZwbWMrbFA5YU1RdFNVbkYrM3dNQVJZakZRZTNBN0dOeEdW?=
 =?utf-8?B?VmROZ2o1enBRSXgvR2s2ZSswYjhGNDExTGlzemZmZThNeTB2R3lwdmpsY0RI?=
 =?utf-8?B?TXdtK1dmUzZybklmZkltN2M1N2ZGTVR3NmMydjBaUEMrUDZVcXJtV3lLbEx4?=
 =?utf-8?B?czhNNDdZcXdaNWIwWVRPM3FWSENMdjZJZFVRT2Jjd2QvNkpKM0R0SGp1dkdU?=
 =?utf-8?B?MmFqTWxQZ3BONm9sMEh5dDViZkVnUURSV0JsRGRGUVlIRk9qRDJ4VXJ2YmQx?=
 =?utf-8?B?L1BsWGRGTHN0b29nQ2lOZDJ5WHFoTVNNM3RVbk5DR09NaThsUFJSTDlKRVB6?=
 =?utf-8?B?UjNsNUVrakE0SGdXeVFSY0I3Y08zRXBSbTcwUE5SRDROeXRFalQrQ2U0b0xO?=
 =?utf-8?B?Njk5SHdwKzRNRUVyUHYwM2xneFJxOUVNcHhxbmZlNGdqL2tWVlRqMWhDVEM2?=
 =?utf-8?B?TXR4MU91WTJFWHl2amU2VmExalVzbDZXSmpOOW10R0kwRHhYckptMGo2d3dQ?=
 =?utf-8?B?SHpEeTVyZHUxRWZtcEpxNEM3akp6SjY1S1YxQXk1U0xpczlYWlY5Y2t3ajhj?=
 =?utf-8?B?eHFHYnhXYTRqVnlaUXNFNFpnTjlONTRmeEFDbmxBSUJla0ZPUG1JUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1b3beb-1185-47cd-16c2-08dec5efb4f8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 06:24:05.8519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToIP/abx1DxURhMhkhaz83bRGDba71DrwD4qHrpQc/xDQOsnfpexmwKY08QhurnjXb6n1XivN43sxZWZZPnoww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11670
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_232412_014528_4214EDB6 
X-CRM114-Status: UNSURE (   8.68  )
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

Add MIPI PHY power domain for shared PHY resources used by both
MIPI DSI and CSI blocks.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 include/dt-bindings/power/fsl,imx93-power.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/fsl,imx93-power.h b/include/dt-bindings/power/fsl,imx93-power.h
index 17f9f015bf7d..071221fe5c57 100644
--- a/include/dt-bindings/power/fsl,imx93-power.h
+++ b/include/dt-bindings/power/fsl,imx93-power.h
@@ -11,5 +11,6 @@
 #define IMX93_MEDIABLK_PD_PXP			2
 #define IMX93_MEDIABLK_PD_LCDIF			3
 #define IMX93_MEDIABLK_PD_ISI			4
+#define IMX93_MEDIABLK_PD_MIPI_PHY		5
 
 #endif

-- 
2.34.1


