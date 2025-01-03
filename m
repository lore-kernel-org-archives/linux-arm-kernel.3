Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0D8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFg5y3TrIOn9VH/jNSFVTNtUnnNsK5iZCxLymVMVirI=; b=XqqRFBL5Of2jE2otpurmOA1JSi
	mW39m1DDCeJSsno4WolQSGwyV0oOsQlFWkZCUnuEDnibFe3FyLWOsfgQhm0+nBqrcv5gMUfrLIoa4
	SVfEGJK699qx3vp9AcjkLwg2jE4XWY3rJqxj8mtqFLi2Xwc69gI1GnCjrsHMmfyhRc7QmEvqNyYPy
	24mIkI9MgeFMKDkQ415LSef0FqPMxubiglX54WQDYg1NvgVWfWM4RLK7JqTStCBKV4S6Hx/BQoPAC
	X45Fold2P8zE486OfJLaY7OiVimRLvQgNz+bjkEbNZum6SybJhJvA/UATK4pYIk5UFdeKbqQmvzpl
	0/e32/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdQN-0000000CWC1-24ZJ;
	Fri, 03 Jan 2025 08:52:55 +0000
Received: from mail-db8eur05on2060f.outbound.protection.outlook.com ([2a01:111:f403:2614::60f] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdGU-0000000CTtt-17JK;
	Fri, 03 Jan 2025 08:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOPYu/jF9/SCCeRnvhLOfOGctYxsmO7WXa9ShemzMzqeuwTaUhhzk/w1stNS5xQ2DZ/dtFzmOwzmnxflT0ELXjgPKpsqASyo8vyvmcl2lZgNsviObWQ/Qalp4i1SAGm0pUfTKVW/yqYR7Q87rU8eUy4Nb1JVVz9UIPqmfP4lOuSsM67F1DVZWuTvqZ55P+/xJNC02495uqKaKJhDkZUmMfaw33GgitvBfwZ/Wb2a6j3ULvwAFoCThkD5rHD/T15YdpZmloDsOGNGKKXSiufOXpcSON0ZRULkLJyT0lKRI6xnvyCc+TCjFGfTD/fZMoBIQX5PhGJaMhxHGjL0+1VGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFg5y3TrIOn9VH/jNSFVTNtUnnNsK5iZCxLymVMVirI=;
 b=n7+9FX+e85Ek1w2uOgOWwpxZkery+EJHyUqFuiOSGJPCqTI5U0vqE3HdryBsAgn4uLp4AlxlPxEUuj7bJ2fHxS1/vdy0s36OQKnEsjbfxGqGtcePTVGtFPgu2oKJ98BrqE8srZzdh3dzrqeVEfxAaeoh7dEPAXnZeuJH/UHP1XpT4V/ydaOEYWRwo6kDFfBPsBSQHg/pQxTVwzQdMyWD3g3wHyEGJyPJl5HhLv2fUoZnNIhLIsbcaL7+Ch9EABXutYOgi0AwaieO3xe+7Iw8sPlcR4WSi5lzU++kqpx4cLYmriypwSpdg96nrnkcwaC3v43/Qa3OyYmAnwi2J1fwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFg5y3TrIOn9VH/jNSFVTNtUnnNsK5iZCxLymVMVirI=;
 b=wCGHfmJkhq7G5hMBmyhLCziZKfqotmzL7S2spd2FQB0hf9saaSEZUUiwITRzMv1YXA30FIdzx/L2zJg0V2pbieM7SwL7c+iomeuQjVh5EZzD3/bSE5oLMvAcmc3GK22QRhHIZ0fh5+T6Qb5UcA2B9chWU49xAwbWZCYDlFEGYt68gtKEZE1pFBp1COOSzpNx/uS5f6pr7M1W8xqYm4VcA+tAp7ycJqp3JonC9tIvIkbyvSdTJPHEb/8L84SeFZ+bzzYyNOTfAUr5s+gcD4DqLJX4U17hiolDAHZlcgL61Qkl9wE4oTsAsSQ/Xf3eP3RxBHr1lBhn14vCHPoKq67LCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 08:42:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 08:42:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 03 Jan 2025 16:41:19 +0800
Subject: [PATCH v2 07/12] rtc: nxp-bbnsm: Use resource managed API to
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-wake_irq-v2-7-e3aeff5e9966@nxp.com>
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735893689; l=2071;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=VAulaoWVPhHtzgpO1nG1u9VR+bogAGzfLBxhdt2/l0I=;
 b=SJnE6nTcSAS4I1d291x5RNISbMdR92Y3bdxMVEhj1npS25/awsjbGzI0msy/0HB1ZZ6MKzP/4
 7OsAdosToQ/CU+1nt5kyf4smIDYXBQh0LTFZYtNiILaJ7E8DONqwLFc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8242c8-3877-4214-7a14-08dd2bd291ee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1E0ZnppS0tvRHZ2eGdKL2dGOVhGNk4wSTJEMkpJSFZGMUw1OVN5YytqVzRj?=
 =?utf-8?B?dzJwWjhmQUpraG91SUNCSE9laFVFMFR3T3JTNlZ1TzlEMWEwaTIyc2l2TWZM?=
 =?utf-8?B?a3F3dUlCcnk1aDVNclVJeVdqc0xsUlR4U3NYL29tcUNOWDFzTlAyWXlFOVkw?=
 =?utf-8?B?cWxyRnNtdFFLL2FYeER5QlBSMXBIZUNFZWg3R3BiVmRXSGRiZmlML3VadnF1?=
 =?utf-8?B?K0Z6WVpsd29UcGhoR3l5MGUyZldNWTZ3aSswaWhaYXlNSERJMkJWYnV5ZVNS?=
 =?utf-8?B?NzdjcjlRSjhVZ280ZlJsSEN3THBUZXlXY1VpenNwWTZKbk1BdWF2blZpblFS?=
 =?utf-8?B?bTFGVlN4RFFxL3FvalJSSjNUbThhZXhIYm1WWGtMSHRrTWFjVnhrb04xRCtT?=
 =?utf-8?B?OEJQMWlPRW84bEt1aWFPUDVVNFJ2Vk01cjREWVUyOXRSUm9pVGdKeGdlQUJG?=
 =?utf-8?B?SUpwcXo4Slg4bWlOLzZGL0RMakRxTGNlL3lBaEZqakFNVWFzTmJ1bEF5N3c2?=
 =?utf-8?B?WXFVUU9mbVN0QmhxcHkrbFhMdWJtTEhVZEVXVVVQNVJKbVpXVkdHK0loRlFi?=
 =?utf-8?B?eWsrVmpsRFNCR295SU9sbmo0ZjdsOWkrd0YrRnlvd0FIby9BM3o5Y3NVZ09P?=
 =?utf-8?B?djRPOEpPVkoyQ0FwVU1HMHVUYjR2NGVLR0o1N3dLeE44bXhVN25yOUphekhT?=
 =?utf-8?B?bk1NK1NvTzVyUmU2bHN2YlVjRnpFcmxZd0wzQmJ6ek96Z3JNU3FMTHcybFhW?=
 =?utf-8?B?akRnczY4UWthbVVuVGVVaThER0JBdEhOWVBqdnlKZ1RRVWZUa3hNeERRdTNY?=
 =?utf-8?B?R1V2VzFhNjhYMmd3VnBXazhKeHZBR1BNalVQNitJY0JtS0tvOTBIU1ltNVJ6?=
 =?utf-8?B?a3hvOHhPUEhvV3Y0NFpGQUJZWXAvQXNldWkwTWs3REJpaWR0RzNlNUo5V2Ny?=
 =?utf-8?B?YTBlZFE5TXhNeXU0eUtiWTVZWUl6YkJMVjlmMTg4czRiZ1RNQ1hlelZaTnll?=
 =?utf-8?B?VkpUTWQxWnA1a1JtUU1xY0g0YjhzdHhGMDA4WE9xbEcwNHVJZGdKcVg2ckR3?=
 =?utf-8?B?ZVJyNThBT09OS05CdnhjZTd6NlRmSnNESnRhQlZXZ1pkOUJGV2JoRXVmcWox?=
 =?utf-8?B?bkF3Qy91L0pURVRRanNNN3ZIU2FEVjJpeG9FUXhrRThpTDgxRnVvdC9oOER3?=
 =?utf-8?B?a0UrQkZDYzBSakIzQ3BJM0drMEd2UDV2bVp4L3lQQzBQNjJWU2ZKbEY4QmZZ?=
 =?utf-8?B?RHdNcDdDRUNybEFwQnRYeUp0elBqbW13UUdLV2FoeEtSMHBlNjhZS2FpS0hO?=
 =?utf-8?B?RHNVeE9Wd2JMa1d1eEJ6ajdrQUhuU0dMUkh3U3MvTEVjOTlGS1NnQVNBRi8r?=
 =?utf-8?B?ZVFwMXdUQnJuZHg3TTdFaWJpMC81L05nbGxxYWpRM3YvK2d1WlB3SjdBenRI?=
 =?utf-8?B?VHUxSHZZUG5FcUN5N2NtenBXRjg2RHNrb3FPL1VQNEUwV2hOdDY3azU5cGFt?=
 =?utf-8?B?YWJFUUtTZ0RGczFRNm01WFNRUmdLT2JOUFp1L2w2N1M2M1BnWXR3cTl4TXVV?=
 =?utf-8?B?TlljTEZYWWxiM2hhZ2drVHVwbnlOMGhYV09kNGVOVDBna1g3RElSOTVtdVMy?=
 =?utf-8?B?ZFhOb1pFbWFKUjlUQTBWTk1ZQWdQTThPU1Z6dTlUSVJaZ0xLL016dDFtSlBi?=
 =?utf-8?B?a3BJTFBlMWo0N25YcHFaN2wrdW1SV3FYRlNrSVp2ZkEwN1VVU3M3WmV4YzNT?=
 =?utf-8?B?ZnpSa1FIWjhEbGt6YmRJMlNBamZpbmpBUkdLS3pqREV2QndnY3hiRGlYNUxJ?=
 =?utf-8?B?dlFZWkNhNGxheURURElnMzJ3K1ZSRHNhNW5EQmM4bCtMV21LSDJZdGNHTE5E?=
 =?utf-8?B?QXRsN1grc05UTWlwZk9JVUduZjFkODRQZFN5M2w2WGpZYis5SUpoSEJ1bXpS?=
 =?utf-8?Q?7lpMhp/95P3yQMfpjJVmuDAPcb56wc4t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU01UW16MmNzTkNnWWQxTjZza0JUWERic3B4cTBxK3lTUHYvZ2lFTUdZMWh1?=
 =?utf-8?B?NHhwTlpQdndDRTNjY0E0eTBxMWdoQ09ZaEJ2SEZRYUdXa0FpcFVkc2dHeVJ4?=
 =?utf-8?B?TFFRRGZmR0hoVDc5YTVGZXhkZjVzRkU5K0VhZDI5Wko2REdBcU5LZFdESWxK?=
 =?utf-8?B?WnljRzZaM1A4TjVsNVBUdTRuR2NZdUoxbGxzdWZsa3ZFMlpmWEd3UjZESXZt?=
 =?utf-8?B?b2pyUGFqWFAzUUora00ybFVOU0dkRjFSYVhEWk5pL2lIY2M3YnRLYzJWR0ky?=
 =?utf-8?B?QTZUZS9qcW0rc2Flb2RqSTF2MXY0NWQvTGgzSFJXaHVjZWZwUCtMVGtIdUdF?=
 =?utf-8?B?U3J2U0J1cDRDZWdWUjhwMDRsNTR2bnZHOVArdGdBcUQzajdpZTBGTk1nUzQv?=
 =?utf-8?B?WmVSNFprbUIvT21XL05jMkNYeFVqcVZhdkxJbFFwMndUZndLbXV4SSs3Yis4?=
 =?utf-8?B?Qlc3ZHlwZ0t1Umw4bzVMM1NmUUhFRDFsbkF6S0taZFFvUlc4NFJyMkx6NFJr?=
 =?utf-8?B?UFB1VUU4WVVKVW1GVityQTJaUnNNM1k1eFBtKzBHQzdrdy9WUDNoSW5NZDJt?=
 =?utf-8?B?RWxoeExBRUNkUldpbTVtS3htWndHZkVFVGFaM3MwWTYwalRYNzE0V0o1ZEFv?=
 =?utf-8?B?dDRIcXozSU9aTmZHVDFidVRwZTFrYktIVURTZlNtcmFHcFlxQ0cvZzJ6Z0FX?=
 =?utf-8?B?NEZNVDJpYXdRcVlacnhSYXdXVStGTFh6bXhCeHFNTlptVnZ6aDkvUGJXUXZH?=
 =?utf-8?B?NitjV243L2tSYk4yR1hXMjFEazFBYmtyRWxpWWdLVGlUWUpIYnZiWkJDYmpn?=
 =?utf-8?B?eDlmbDFod0paRVN0VFdsMS9vcVZxN0VBc0hMa2RFdVFFRlFzL1lWbFN6cXZB?=
 =?utf-8?B?VlcyQldkWGZjZS9ZZEFRUEs5QWlpWXJaNmh1eDRZWit5bFUvUTQ5OXFnaFV1?=
 =?utf-8?B?N3ZDcXVkQ3lFdDQ3L2RRUnhia2l4VnE0TkZhOU9HSmR4dGYyY05JcEpiVzlz?=
 =?utf-8?B?U284MitTTWg3b29ka3g0anFvdnhqQUM0WWxxWWFSK0Jicmk1eGtNbGk2OFJZ?=
 =?utf-8?B?OW5rdmRKWHhwTENGZk83bzdiV0EzWWxpSml6T2ZiV1AwbURVZU5ndmRaNUhr?=
 =?utf-8?B?VWM5a3NhV1hMVDVkL1N4TUJNWWdUVTd2YWUvM2ZMVTA3Q1RLUW1TRHQzKy9y?=
 =?utf-8?B?dW1UaytEYTN0L01JQkExRGhIVnhjT1pXVzdoNGdGSE8rU3R5OUYzeCtMZGNS?=
 =?utf-8?B?SzZPaDVrMEVwQTZMZzlKZlFCbVpwdEdiYk54Z3hmcjZ0UjdRR0hVMFFKcld0?=
 =?utf-8?B?bmJQMU1mKy9weDdtRTduYnN1eHVmeXM5azNaTUNlS0VyWHdwczREQnZjcDF6?=
 =?utf-8?B?ZWw3YVhZblMzQytXUnJwUEwvUnY4YjZJMzQxbDhlTGhNR2NzWFJ0UzRwNVRX?=
 =?utf-8?B?Z3BUOGVlV2ZnVE5LM3JIOFhZaUl5bW5mNDFsVVdCV0RDVGZkZG95NXhJNG9N?=
 =?utf-8?B?OERDZm12QzNCampMWGsrRTN3d2VSL1FYS29hazZmdkVSeW5sdzZEZ3kvK29J?=
 =?utf-8?B?R2JlMXRTR3JRajVhNVplKzlDWENOV3RvVlhtNFR5SUhjRllsUUg0UkVXSUVI?=
 =?utf-8?B?UncwNWwvY0lhRndqd1RZRnA4M2M1dkQrMDlyajBPeUxFVlozSkl0V1lRWmtW?=
 =?utf-8?B?aFFUTnZmTWlvUnEzUFNUVWtBdFZIdVk1NGtiR1Npd1k4NkpIc28yWGF6b1Rq?=
 =?utf-8?B?TUEzbExMYzFZdXZ1YjFvRzVnUmpHMXZ1NFdWOXU1U1dWUmU1bTM1ZlFMUjhm?=
 =?utf-8?B?dGNSSFBHN09SR0hncEV1cDhnSThFaTZxUExxQVhSbHNSR3FDR2JiVjBvVzNM?=
 =?utf-8?B?OWtRTWlyaVl5c1BLWHdNZGo2WU9Gem9qS1BlU0s5Rm9QcHNsSitDTHVEdW9i?=
 =?utf-8?B?MWxtYnk2S1lzVklKaUh1VWh0RHVTQjNDeXRKK1FvYWppK2tnRm40UWdSR3NP?=
 =?utf-8?B?elRwL0x5OUJrbzVWaCtRUDZBV0VJZzNGd25ZZ3EvRTNydG1PY2prYmlpdmZq?=
 =?utf-8?B?alpVRjZaWlFleGdFY1NuOEJkQUd5Nld4bEZvanBBOG9UY2hDVTZ3V1dwTytY?=
 =?utf-8?Q?IfMuTVNxdWfV6lWtfVxGZgLjB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8242c8-3877-4214-7a14-08dd2bd291ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 08:42:34.9490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/KVS2/gkm2jJ4aI02MLeFct2jN6RdHkYRfkgON8K/K0gvWLm3qOhZzt32hIVf9Wv2ZJowH24RKxaGE84so19w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_004242_308251_FC7A1E75 
X-CRM114-Status: GOOD (  12.88  )
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

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
error handling code and 'driver.remove()' hook.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/rtc-nxp-bbnsm.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
index fa3b0328c7a255ff8a902a58d61a4b0e59eac493..d4fc9dc583d317d4852b7d897a6c45cfff6961a2 100644
--- a/drivers/rtc/rtc-nxp-bbnsm.c
+++ b/drivers/rtc/rtc-nxp-bbnsm.c
@@ -189,36 +189,26 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
 	/* clear all the pending events */
 	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
 
-	device_init_wakeup(&pdev->dev, true);
-	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
+	ret = devm_device_init_wakeup(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "failed to init wakeup, %d\n", ret);
+
+	ret = devm_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
+	if (ret)
+		dev_err(&pdev->dev, "failed to set wake irq, %d\n", ret);
 
 	ret = devm_request_irq(&pdev->dev, bbnsm->irq, bbnsm_rtc_irq_handler,
 			       IRQF_SHARED, "rtc alarm", &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
 			bbnsm->irq, ret);
-		goto err;
+		return ret;
 	}
 
 	bbnsm->rtc->ops = &bbnsm_rtc_ops;
 	bbnsm->rtc->range_max = U32_MAX;
 
-	ret = devm_rtc_register_device(bbnsm->rtc);
-	if (ret)
-		goto err;
-
-	return 0;
-
-err:
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
-	return ret;
-}
-
-static void bbnsm_rtc_remove(struct platform_device *pdev)
-{
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
+	return devm_rtc_register_device(bbnsm->rtc);
 }
 
 static const struct of_device_id bbnsm_dt_ids[] = {
@@ -233,7 +223,6 @@ static struct platform_driver bbnsm_rtc_driver = {
 		.of_match_table = bbnsm_dt_ids,
 	},
 	.probe = bbnsm_rtc_probe,
-	.remove = bbnsm_rtc_remove,
 };
 module_platform_driver(bbnsm_rtc_driver);
 

-- 
2.37.1


