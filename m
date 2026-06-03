Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63980CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 05:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UivgvCCqccs/5kdWJnU9L8m4eX+264iU6Fg5Te36S2c=; b=awGC/p1vgTomQNUJlBRK0HutVD
	wqpGR1ddhCWTSLiB1xAuZMA4A9uckcXvA/i0lzguhBmMBdEsedZwTpHJkjbCwAOQGIiwXqwKAjTsh
	jDWmdNnZO2/5hJT3rCH0OXLARbI7ro3lMlOE+mITEwCx/vcdJrD/AkZJBbeHkfJB9Fdyn2hU287mZ
	RWmEkQJv80fewG0ab6ZB2R1NUiYSqUrpPOVvBapN29WJUiDZTb9rURktx8u/+880+fWKh38ybVQNh
	VtJCwS5eVFp7SD/V0pp0y+1TeHEPxu5i4CCsxB0oOpNlOc7h7DvrCNZGrrg8ZKmrR7/ufWMZU8t5a
	KsCDSqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeFL-0000000EHmM-2M2K;
	Wed, 03 Jun 2026 05:34:31 +0000
Received: from mail-francecentralazon11013043.outbound.protection.outlook.com ([40.107.162.43] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeFH-0000000EHkm-34wZ;
	Wed, 03 Jun 2026 05:34:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTh39KJFUN8XB25EGl/KhVfPUC2ojNKrLLPPDiW198Ub/HTwLjH+eaPr/t4fqelD8TTo35c7q7FbfZElwrLtRwQNSNtpMvEyQGbrlUxqjzTUDLKXkxl7Yey7OCjK2Aivo4pi+ud8coqFVb/LZ/RZaSxQcPXjyPD4WUdzaFl0i38ffL4Zmztoev34Gjqrn2exML19YkLnY/gT6dKj8UX4CKnKJkyfOMGdThMV6jllUV9pspiZoFqV7ACcEZ11iBhR4T3DSJu23KxTnXoR/8MdUlx3sDZgFKQ5ZIaGooHpL894liRoMihAFG7voFuHvxvEo1pZVpt+1JLpluoVBsvwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UivgvCCqccs/5kdWJnU9L8m4eX+264iU6Fg5Te36S2c=;
 b=O6XlPXkKP25kBLIoYrGAJWKwJh6TUxo0aDtTZmTRUgCJe3Vo77TX9nKDnT/xeRJ1auyRyeNQAzRyQe1RxbbEGl5LKbimDtUuQDn8MRwM07sSizTn7RqIX/i+w/+sJPBcGUuMTHHus0esNgvknKs/kqG03KHxyMOtBf3SSLi46H5TPPMhQ1DgmEgDyzQQNbiJvdSMcPQX1fjk4nR7gqRpmxLlCRkJDtPa7Dzz6zl08E816zHq/YpDbCkl3kcth+FdmLZJhOdEooIQVPQpe7GtdcJOSdNK5QgiQoG4r+QBP71DQ376XOZ5TUdUGcwS9ktlOy/fPKAmsEh8ktLC7yvKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UivgvCCqccs/5kdWJnU9L8m4eX+264iU6Fg5Te36S2c=;
 b=KI0PXPHJcSOehurYefh5ooiwmoua8Zjz9UOlN215JYdUGGI+9n80psiKATcIXL/lmZO5xu4Q8rprDKwSszH4wkDaWD+dsQ2zwU/iUig7iN8UDBsXj5mlgPz92i3j27tj1wjeqdMcrolcdlXkUBl+D4SWHuSqxxh83U7z/O3lIIk4CWpS+EwnqjfZqpElsvRD1JyozlQtDob+giRBKsvZRQsRv0J50JRbLGkY504cJlhkg7LGW3eNFnCg/YzMDqqvwjd024LRpWajvyJ3tvR2ZIjYylAQs1VtVSFKqZhLygzWEMQd4MyrsI8S8UkTSwljoJGrl5mMRGrc6Wq0XemWKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:34:24 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 05:34:24 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 03 Jun 2026 13:37:15 +0800
Subject: [PATCH v3 2/5] phy: fsl-imx8mq-usb: set usb phy to be wakeup
 capable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-imx8mp-usb-phy-improvement-v3-2-7afb8f89abc6@nxp.com>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780465041; l=816;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=gmaRyDvzZ1FJnRyPBnMJ9+F5cb0r2KeZpK2ckmm9rEA=;
 b=EiVQAemeZIRRB3sMHviTpZcX3yWMROBuj7ZKFSmQxi8fg5qxAzigBdEhIQpfpbWOFZjwDwRFi
 QyHNVQlIhKOD/LkQIMvejIBIq/iPlzWvCmyyRudcgP+RBRrSO6vDLtS
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d442e37-906f-4156-e979-08dec131c583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|18002099003|22082099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: zN6B4BuI/DV7z/0SRvA17gJOb+swJYkm391pA1ktEbbLCGAZqQGFmzrk5gjb2H3gGTIVImLdnPIc8oCIHqg4rWyJzzhK3NiyATIRysH1jTIs5TKU0ZDIhae2GKbefuZ7D3K0kT19tnFBMdURtMz1OgujOmBxxEcw9kmHiQIZRc6+acIAQXVQ0YXSGvZgIDe3YK8AJuEtUG5DqH/G3YWwYgF2SFoZkVFSJDtXGp1o5Oh0YOUhYppntbJ2te9xi7wwnnTLtxsNwJoum4jATtCQ4pnzPnDGUgAJBY/470pP+3t2VsQfxiqPrkawl0KoEXfl+163tt4NFb9wFNX94Up5JlkDz0xeA2tZDGGEwci7itxY+zRPvNVOEyPZQTwd1NEKeLlFs44bjYmkv2TU5K/1ifi8WfwLAELQd3h/CnZsIEghp+Ux1+Yrs9F8Y+YNKELDfoPzvQJyRHpUgrRg86nh35DQoGt8T9FnpPLMJrFvOyFLXGFjy4Inie8rT9XTbv9XczvaaUnPIbMHiuP0v0N6/KlVkM4kVRY1ZAjKNMACvD7x0NXLJeN5GBFHiQGv9lTmxzVld4JVILE4xYzSPM8tIha0aMnr6PVghiaWBQKu5VuX8VJEsPW+AyXSlnx6IKXjwPDPHdfdmt3mj5kkinHzXKX4TDRfMizZKcrVf0c+U14ODS++CuzHGw0icebeKPXt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M08ySWhxc1hzd3NvVXBRTlhsZHJaY1YyQlYvNVg1a3FxeXp3R0pPMnprZENN?=
 =?utf-8?B?QjgvMUIvMXhhRlJIYTJBRnErNy9zRDBIZ3hoMStmNkNYMEtUTnpCKzR6aExF?=
 =?utf-8?B?eTNKNXBoa1E4dHNzVWVNbUI1TUdobVhROUFCUFRIbUY4cVhPSTJ5SDdPaEps?=
 =?utf-8?B?dThvNmhKc2hvVGd3MHlBaFdyQTBvQ1JFeXJINmJoWEVFVFdreG5uMVhVZ0Q4?=
 =?utf-8?B?bnlBQ0xxbFppRDZUT0NvU0RMTUJaSUJScThSbEpzMkkwS0tONE53Qy93cnZJ?=
 =?utf-8?B?UzRUV3dYdWtLMllkZlVNNk1CaFUxTk4rK0JUSGJrYzNPT0I2TmIvRk9vc05k?=
 =?utf-8?B?ZTh0RzVkQlZlMFltNHNlQWpNQmFGODVFamE3MEZ4aTkyUnJ5WnEyQ2NiaVVk?=
 =?utf-8?B?OVBBWFpFOU1HSVFsR3BaLzBBbzNUY09GbmU2QU1yZXdxakhta3oxMXFkekUr?=
 =?utf-8?B?VzkzelhkNERiUmJuK2ZjYXhJbG5WSVVQMStKa0FaanZ0a2VrU0lnK04zdVBZ?=
 =?utf-8?B?MlRkalhDOEx2TjhEN3dKVWQzY2lUL2I4MUY0bXlzcWZldVBqMDdjTGRXOEF0?=
 =?utf-8?B?cTdFK0NkNkI2T3U0OFBjakVWcnprVGtWbVR1a0hhNGRJZ1hnRUpTa2l5ZCtt?=
 =?utf-8?B?UnAyNTVlNTM0MEhkU3NRSDBGczQxSC9KOFlvYTdmbVFEY09yalhwckQwdVZU?=
 =?utf-8?B?NmptZjdQWDI2TldoUThXdUYxWWhxLzJUc2x0ZmZ2YXRSVUJaVHRSMVVuY1RY?=
 =?utf-8?B?VTc1a1JoZjA1RlpBS1VoU2dnbHR2QjRQWlRQL0F5RnRmM2tzRUJ3dTBjVnE3?=
 =?utf-8?B?MmtPT1poREpJVzFYaXBHMnBNTW52NWVpU2RFT01kSVJPcllMTjVMbE5QZ2ZS?=
 =?utf-8?B?a0p2dkN0SmRvWmcyV2RicXNOVEplZmRlc0pUQ0oreUhEVDQyMFJVckhFUCt2?=
 =?utf-8?B?MDRrT21WZmlINCtGS2Joamwyc2EwM2lBVk54N0NTMGV3RXU2aW95WXltN0ZE?=
 =?utf-8?B?dGVIcWVrNzBCQ1RQYzdIaGM3aXRCVGlDYkU5UVB2ZW5OYjd3NndCM3JUSFZX?=
 =?utf-8?B?Nm1GOTFkeTNDa1prSGFmWGR6dFFwNGk4dWY5WDBmZTBlSmFXVzM2V2pNaTVm?=
 =?utf-8?B?ZEJpbUYrR2tMQlVCTURDb29UaldSdjMyMUllVVZxaUF4MVIvcDlldHp3aXVv?=
 =?utf-8?B?aU0zcmp5Z3NIenpEQitwdFpaMlloR200RHV4b0M5WUdMQ3VDaVhGK3UyNXVL?=
 =?utf-8?B?MUZBdUM1c29URFhvbm4xN1ZDUEdSb0dKOHdZUnBvSmpRbURFU0F3S2VZaUpV?=
 =?utf-8?B?Z2lCOGxBaHRIQUNmZkJGU0xnLzJ0UjQra3NnVlhGL2o4Z1ZGYStaVzJrMFZr?=
 =?utf-8?B?T2oxVkY2WUJNMHFlUTZ4M05HTkNsbnhtOUJJWEZMaDB2cXhVNExpenUwYVY0?=
 =?utf-8?B?aXpvcjd2RGdSeG9JYjNHbHJibmlGUXo5TkRMSG9LdGxLdEpGeE9YMFZ3NDBO?=
 =?utf-8?B?NExpQ1UvcHNkYVd2NU00ZlpMNXlUVUExcUVYeFZlVklDUFRnVUFsbVMwb01m?=
 =?utf-8?B?VUpsdHZZN3didC85K0JLc2FCeTQwWEsyMldNZldiUUFNckw1cW9qRnQ1OXNU?=
 =?utf-8?B?SVhMdDFHZUlZTmFIajVhVEhJbWJXUHBRZitoVUFyaVdxdXNUamNMd3VNeVlG?=
 =?utf-8?B?WlN6YnZ6bWc5TzMwU2dSQTVHVlQxaGsxcjgvQmxxTVJPeUY4dkhwTmF4VStN?=
 =?utf-8?B?WlBoUGlWVzdpZDAvdEFqN1NnYUxwZ1NDbm9JMDJCekFWdlB0RnZtNTdVRlA2?=
 =?utf-8?B?NUxxOGtxV3RTeDIvdXArVS95SWNlK1IrWGRCNzUrTEJyWUV4U2FNcUw1NXJ6?=
 =?utf-8?B?UkFCNmpiOTQwb2NIMkYxdng4aUNxd2VVYlBKandHVGJKYjF1Yy9zRm9mck02?=
 =?utf-8?B?YkNlV2pWb1I1dE9tQmlHdisrUjdkTWppUHdTcCs0SDk4ekhOanRiLzNxSE8v?=
 =?utf-8?B?K0Z6K3dESGRNYWpwOUc5MURqczNqb0JvOGZRYUNWVWJqVytRbU14NUxicmRa?=
 =?utf-8?B?RVF1K1hiUTFMWGdzVjdzcEVla1NKaFdyWEF3bkxDQ0s3enRqeVZOMUt3Q1RT?=
 =?utf-8?B?L1Z2aG9idVhTdTZpajl3YVNUY3pNOE5OZ3RaZHNaWEdxYStvQnRKMjZtTmJH?=
 =?utf-8?B?ZEh0ZGl5NDdmMDJZT2VscFN5R2NKaGJQeTFWSnZlckZyYkhQZjB3QzNzRlhH?=
 =?utf-8?B?c0ZSeFVEMU1ManRhbEZkZGJzdFR6dS9CVE5vVFptT3FGNVZvdCtNdW42ZFpx?=
 =?utf-8?B?SEM3OS9tTEJDeFQ3bjFqbW1CVVVDTFowcVBkWWNCcitEZVIzSGljM0xQNnRG?=
 =?utf-8?Q?NV2tIomaNoeJRpK/PReC9uyEJvd16y1sQAX+j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d442e37-906f-4156-e979-08dec131c583
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:34:24.5443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrZaixBMspTJYsUJywWePaS7YB+0Lo6s8LakB01MOogVhHjCr7S8kAlFR+8Bxmd2a6MMUyuPDtODSVveLRy69vjArYEfHBXz1sM1cIdFzw+NGqSQyoT12utgIlC+cmVb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_223427_784909_7459122E 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Xu Yang <xu.yang_2@nxp.com>

Set PHY wakeup capable because this PHY supports remote wakeup function.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
Changes in v2:
 - no changes
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 88b804b2c982..591ddf346061 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -728,6 +728,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	device_set_wakeup_capable(dev, true);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 

-- 
2.34.1


