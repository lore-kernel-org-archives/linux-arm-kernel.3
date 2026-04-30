Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46ACCD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjubAROBIdA4ooc6t2vqEcMxB9gmKCpSJHkfZccMmpg=; b=WPpVTziClgZgWL2ZEaiwHoy2sP
	fLuNsEa+EN987D4b45alzP2bt14Tl7AKux9fgjIzB5Y1cmCXpiEKNo0cjN/U91gOOY+fWG7ZdmWKk
	egQEoyr2PWorhIyG1K3KQs58/BzwcXtBcZHWszIJWwTUqUWiPyKJIF0v8DAm2EYmphxn1sOp3ODGM
	hwnD+GIaVoSEIlBf302DZVH3jAm72WcACTrtAFHNbEPK5Y/pBkID5G75Hty/U6q2KW5NTJH7cTgLK
	Ces7vk06ANMrgpAzjZMaZ2F96hCFVyDCj2pfx44wiba/GAS9BhvlEyPQzaPGXJ1HXE8wVtg/MS5NM
	upG8J2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILsq-00000004tKf-0VlC;
	Thu, 30 Apr 2026 07:32:28 +0000
Received: from mail-westeuropeazon11013013.outbound.protection.outlook.com ([52.101.72.13] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILsm-00000004tIc-3jC4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:32:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WA3xfsnaYWH/bYB/IjjbkjkafG/ReQHFnnRDPXEHiq7BGM0KvvvTtjtpn0C5GbAZt2jGv+DaQeSBcJx3wiJ6L+5/6iU64Xpbkzda2iwlTmS/SAREK6XZQAiwb4GNCTUPWu2NZwOEAaZqpI31ZYnDp2AXvZZocMRi+4G5DY1wFwiDsEN0gvgkWXQtbE+BdiX34/yPvOov8z+ie33Vn2M+gZfqPs8wJR+B/QEfgnHGNQe+C+xOcA4j6/z1pzd7jQw7TEBfQH5g5VFh4rLM4bYKowypk92zWzL1SLoRhdQk3vVkqBHLEl/ORixZIvfdAeM7oQ9Rd/mdYY1AL/REHusSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjubAROBIdA4ooc6t2vqEcMxB9gmKCpSJHkfZccMmpg=;
 b=ok9yv3IvGg8xSAPImJBaJ50vQQf9RY2yd1CGju5ItKxRYJC98jIE3JdBebbkCVimXSprNubEub1pAvim5zUbPjR22w0ajJY8auu29ASBE80+VwKlNM5mbznseEa4+u2uVUOFzQayklkgu48sc4525b+mMrkp8CBUviQqJy+7So9riZNpWAmyXw3JYaHFpaYUAOg9jA57CeO/rR25JB2ZLid5yigY2A7IoiKp7qW3PCD/W1IX+PKtNsgLRyv4SarBWXNKYZ/vQh/2gz32cXkpDUiVgj5zJKtN6FX0EHqs8URLyVyhNzcrjbsHlMZwwOdTJwUH8nO32UxUKwmXkO3X4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjubAROBIdA4ooc6t2vqEcMxB9gmKCpSJHkfZccMmpg=;
 b=EPvUL4ouPJPUOdO2Q2OPh4JVDYZmNUaI2QGS2G0xOMQAeUm83IG05UtFr99ysgkw1uhCe14NoJTRbYNgBYHvOkWsa3D5AHtU6dUqBn/mNuC+7z/6YlkHtwuYicBEV0WtmGn4dwTf2QBZyjYKzn7+3ppIezqXbcyvvCD/xFCDq1NmaR7nGw7+S5wukPYnvnNhjQo4dNtbBUnHYOaITr6sT+jhx5yq7HdGiIptGHMzxrpqAwuc8AG3m3gN1tYq2qCbNFcWUfe20OU3LpoZkfnPQnhW6bZmICP6dE4HuuG9FaNhqvnuS5Yi2nNhdg71vOYpAUoxiCMaQAYzBU1bwA6+VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by AS8PR04MB8279.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 07:32:17 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 07:32:17 +0000
Date: Thu, 30 Apr 2026 15:34:29 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	shawnguo@kernel.org, martin.kepplinger@puri.sm,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Correct MIPI CSI clocks
Message-ID: <20260430073429.GA3539031@shlinux88>
References: <20260417110200.753678-1-robby.cai@nxp.com>
 <20260417110200.753678-2-robby.cai@nxp.com>
 <5956186.LvFx2qVVIh@pliszka>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5956186.LvFx2qVVIh@pliszka>
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|AS8PR04MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee8e0ed-d70e-4e03-be39-08dea68a9af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: WLPLRKlddIGYoSwPqpbMMSJUD7zE8HO//xmi3l70gPEndgRtsO3favy7kml9OAvfKxJcgmRMCV8PyuCYEG11BvITNEEwYkHyatejwukRJmvKXcke7RP1C/nk3DAtTegtFazW284mpWtmrvOdxqB1xZen7ZHS8yfhZDGq+gdpRMsJHV+9t+77rNxJhfdjFZKg0Tqgh9Qpd5eGbHbiBs3iI6zF0UDy7sOU4KjT3g8OpXKdVOya0O/qIyH1hUUHI6/3Tr9fySogifc/6/YczWUXGlSd75mz0j6yq6cnAMdTuiYNNtYyOBCFsQ2zaDm1IJJqqQ5RNTM+fGs7bjBvkkLsJyM2k8TprIoY3BBPUW24UbT6ewdXaLwChSgDzDZhthuSnT5jP/c41Y9xQD03f+99DTaLETqGKk/YCOsLA7+h22YUQMvIIEmcMA5WoU4k4OI7u7cC5lBaF+wKkBtklVDXu5Bej1eiGHmT/DAzTQ5tACUrzbblIEKrle6J7ATZlXSr4/DFXPqcdhJFh44JB3YgUItp4lBr2WYSirB0g/bOBShJfF2YY0EosjT9npbKXR8fvyWWF/ZVD7LboXjahjAWFhBOUMoSvKqBSkXtmPn5/q5tSO877nPVW9eFTB/ZS9/YRQPOA1Hu+u5+P//SNa6FvgQBwKYvztoYwSJR8wS1M+39CU9tyUsigJ3fElOCJPgsm6eVx8KtvOXBceeD64w1laif9F5x5aTikVtrYl1XaA1pwuG5BCdjkuEIm0nvIH6ccdMptFqKKb5V+E6eNxawiTdA5hNrAVDtdNwNSSHvrP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNXSkpzN1FCWjdFbXYrUFhKMXM0cXk2UENBblVhQXZuRU5MTmVzbFlFbTZr?=
 =?utf-8?B?cDRlV05Rbk1KWWp2di9udWs2NzFkbDRPVFZyZlYrTFdsQ0lPTStvU0p0eXJM?=
 =?utf-8?B?a2ZZZCt3VjA0bDVzMCt4eCthN1dWVFBrMTNybFNRak1xM1FjdTlIOUVxRys1?=
 =?utf-8?B?czRrMHlyL1ViK1FvTlFneXllWUR1aGpTL2tXMy8xVVdYMzBPRVUrWUNGUTZ1?=
 =?utf-8?B?ZWRZMllmOXZqWFc3d1R2ejJmMk1sRlRMeUZraGJXdlpOcXFXRDFVSS9VUWtY?=
 =?utf-8?B?bzh4alVzbDFreWcvQ3p1VjFvOEo0WVh6TitydjNBL2g3S2RvNFZiUlV5T2FQ?=
 =?utf-8?B?eVN2ZWNHdXM1OWFKdklYQTZCUFNqcnQzMTk5aWJyeXh1RHUwWWhPZEMzUklF?=
 =?utf-8?B?NFN2ZzhjYmF2SW5CaFRvVHZIV2tIZjhKK0wxSUxzb1Z2eVBiOWtFN1Bjd0V5?=
 =?utf-8?B?S3Q0OTBUTE15UDNiS21xdWZReU9WYWlXT3BsWE9jb0NZUnJsN1ROZmlMQlBC?=
 =?utf-8?B?cE5wNFdxUUlnWTQwd1dMUnlZYTBwUzNYQjBaM3J6UUpsc1A4dFBBWkZDd3Nh?=
 =?utf-8?B?RnlVcTJJTTFSQW9VOUlJbzcxRnYyL0xlbTVFMkV6QzhJTkNNL1h1bE5NWjZW?=
 =?utf-8?B?VUZpUUQ5RVBEZnBVdUlFMW9FS2dFZ1B5bkgyZEhtNnZ5UGQ5WThIMzdsN2da?=
 =?utf-8?B?cjE1SkwwVTFTaEo1b3Q3Z3F2dFQvU0VBYklyVExWYktoN2ZENXRLYWRlSmR6?=
 =?utf-8?B?SUpEMG56THdKd245NHJiTVdnRGQyMnFZTnNtU0xmcG9HbkhzUEFYRzNVaWhC?=
 =?utf-8?B?NVFNYXlnZVJEeWJWNVVCMHpuTGlSK2pnVzJINDhPUG5OMGNRbVRyRGVmMVJ2?=
 =?utf-8?B?aUlieTJMUkxZY25KM204ZlppbllIazdHWDkybG94S3lIcmJIRFZBVjB1aldO?=
 =?utf-8?B?Z0R0SjB6WllkbDVHUk1SbzY0OS9zNlpDei8wSjBkalRHcmhwbVp2N2QrZXRU?=
 =?utf-8?B?d3FkNkFIcGhMVGU0Nm9xbHAvdERQVHl3RUNSRDFvWnBOSTdiTWQ5RForc2dY?=
 =?utf-8?B?MEJETE9GODRUcjVQaVA0akIycU96SzEwenBuUkt6REhvQndaMlRmakEydnJp?=
 =?utf-8?B?b21PTTNlS2ZyMGY1Z25LT0dCUlRyOFdaa1JUNEdtbEhEQVdCSXlhNU01ayth?=
 =?utf-8?B?cFMwMms2d0tKWENydmhsZVc5aHNaam9EcnJnZmpsa3ZVQjg3QnJuMkdycWpa?=
 =?utf-8?B?TTIwVndJRTQxdTZsWTRyejRrWkVERXIxVXlOTUordlAxOEZOT0h3MllRWVZl?=
 =?utf-8?B?QWtSbEs0SkVlQTIvdEdBcVZqc2wzTlpZTGI3NmRwenpnQXB6Y2hWeHc5OC82?=
 =?utf-8?B?UnF3TTAwajg3NEg4VWg1M2Y5WGxWNHZuQnV3T3AvVTJMcVdQZnhyU0ZjMGV2?=
 =?utf-8?B?c29hMUJTSnZMV2ljZzIvZU5kNGpzemlCU1BPcXhWSjVaVkNSOFdMYjh3U3pM?=
 =?utf-8?B?MUh1N0xHMHFkOW9DcXVnZnViaXYxQlBRWEhvMjdEV2Z6bVRRTDBtcTd5OHpj?=
 =?utf-8?B?RlUvVFZjY00vbHI3RU5sQ1ZSQ01HVTRRdFZOVnZ2ejk1OEw1M0lKcjZvcWF6?=
 =?utf-8?B?eVZNRSt2dnp4bWxZRnJNRHdJVFBFYk82Q3dkbytjdnVGanpUTGZXU0tPdktQ?=
 =?utf-8?B?QldKcDZ5UHVpM2hvVmQ1aVVJSm1Yd2FzZ0l4Zk1QTzFOWEx0aXhRNDVyTldz?=
 =?utf-8?B?S1YvU0lPcFl6ZjkrdE1WQVVBbGpaZWUrako2a2ExSWFSeFY1U2dzS2IyZjhl?=
 =?utf-8?B?ZkUxdWFwNVJLcFMwb2xGY3kzdTV0L3hadURCaCtCU09CSHR3eVVNVWo0bk50?=
 =?utf-8?B?SHRQNlZ0SmxwK2p0b3A2TGZobjk2M0FaVDNwT2d1NHFBbWhkQy92U2UreURr?=
 =?utf-8?B?NmVXZEZhQUd1WUpQSThjcWx2aU5FdFdadTIrSVlLYjBTS1NFUVZna1UzSmJq?=
 =?utf-8?B?K0lVUHhhamVZd2I3TG9hOVNrYlFhMkVMODgwbHNmUEY1TjZIL0EvZWM2UDR1?=
 =?utf-8?B?NVRUN0Jna3h0OVoyWkd6QnN2VEp5eU5HaWZvRW5Lc2NBYjVXUFNNL090cjUx?=
 =?utf-8?B?YzZDbXBBTGNBcnNPd1dSM25xZ2RmZUQxTTZiZHpGOTFhb0hBb1Rab25mZnR1?=
 =?utf-8?B?cGdUNHh2VTlMTGs5M2xhSDNLcVBja3NmWGxpQWJhTnJRSkxkUk9iMEJPRUdy?=
 =?utf-8?B?c09NZTJqaU5wbjRqZCtDMkFoai92ZEZkN3hGM0dES0tvRk5uUDZ0Tk1Mc2dy?=
 =?utf-8?B?eVBzbFI2NGVFaUJXL2tERU52eExSSnkybWxJKzhiU2dqaGhGSnpudz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee8e0ed-d70e-4e03-be39-08dea68a9af9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:32:17.2631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zw3QO6BdpBnDILOLCHhiZVU4y4kT+HK5KzZxxDDVoYYkX6852oXyn4c9l58haUcOCKPFmNnQ7jvXqCJz4e9pjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_003224_939552_D129236B 
X-CRM114-Status: GOOD (  18.55  )
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

On Sat, Apr 18, 2026 at 03:12:24AM +0200, Sebastian Krzyszkowiak wrote:
> On piątek, 17 kwietnia 2026 13:01:59 czas środkowoeuropejski letni Robby Cai 
> wrote:
> > CSI capture may intermittently fail due to mismatched clock rates. The
> > previous configuration violated the timing requirement stated in the
> > i.MX8MQ Reference Manual:
> > 
> >   "The frequency of clk must be exactly equal to or greater than the RX
> >    byte clock coming from the RX DPHY."
> > 
> > Update the clock configuration to ensure that the CSI core clock rate is
> > equal to or greater than the incoming DPHY byte clock. The updated clock
> > ratios are consistent with those used in NXP's downstream BSP.
> 
> I believe this is a misreading of the docs.
> 
> IMX8MQ_CLK_CSIX_PHY_REF refers to the UI pixel clock (clk_ui), not the RX DPHY 
> byte clock. All this change would do is to break streaming with more than 100 
> Mpixels per second / 1064 Mbps per MIPI lane.
> 
> As mentioned in the reference manual:
> 
> "The frequency of clk_ui must be such that the data received on the data_out 
> output is greater than or equal to the total bandwidth of the physical MIPI 
> interface. Clk_ui has no relationship requirement with regards to ‘clk’ other 
> than the bandwidth requirement mentioned previously."
> 

You are right — thank you for the detailed clarification.

Given this, the commit message and the rationale behind this change are
incorrect, and the current patch could indeed break higher-bandwidth streaming
use cases. Thank you for catching this.

I will revisit the clock assumptions and drop or rework this change based
strictly on the documented bandwidth requirements in the next revision.

Regards,
Robby

[...]

