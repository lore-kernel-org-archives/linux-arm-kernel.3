Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C202EE3698
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woQXMcUK+Qkkn2ThjJ8i/8CBzgfTNuLnQgkfQ9PoKEk=; b=3Eh04mjVDkWvHUcNH0ghzkEd4a
	GZoySfe9GnhcMarOpQp2hdzAF7WQ1z4wjJ5f8yptYkvyQvsa4inaT9Hht921dBnEsPh0KhEidC0bD
	GD+8KmQfGdGSWOEN7VVE2sWOcYHn6k044QxBToVPHDJYjxzSO51n4ZHEwGRii0w9RLKN8lEc7iBDT
	Fa691xvJUUzFOx5D/l1CZk0vcXBo2qoddL1Qa2C31WjojuPFE8s8//VG5qb3GjHGII36dV19LSflu
	5xDWINX1ISAdfTtbTlogXt5yr9/vyy4YfGEKvdOR8cPUALxzlyWN5n5MNbvCKaAjN6FpyPv8ajOoU
	Ac5uJ+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZQa-00000002KC7-1Hay;
	Thu, 12 Feb 2026 16:20:28 +0000
Received: from mail-westeuropeazon11013018.outbound.protection.outlook.com ([52.101.72.18] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZQV-00000002K6E-3INg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 16:20:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0rbOZhFPXqOBf23TUT0W/Bhi1O1jz65bc1GCSJfURRmCpeZHaoYhIqMLN0FmLgWy7o597w9sKPXFSNaCNWfd2+bShyr6XUci/IXerbGVeMoKvlAvrU+PtyH/9JSCZBOtx4rFdNQFwe6kjqf24PY3EOMp9jeuRrGc4nq+/A3G4B4bw6+4ydaYP3YwvLS7f0/OtoiBnrLiTBzTJlXdvfXx5ylg/hFnuOEuWAlw+sf7NyfolKDYfuheOP82UbgieBnLZdqwH8DfXrVV3WAx7lSlZwzR6T392Qxo1DyEObLkTCr+WkkEekbIGGjozuRPdw0Dcx3vBSbkLWqRsdVA28PUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woQXMcUK+Qkkn2ThjJ8i/8CBzgfTNuLnQgkfQ9PoKEk=;
 b=WcF4WS3JzocREbqdKO8XjMpmIHncRvme961O/BVnRxIUWC/Ng7tZsJzpIRwQw/zpEJIUToUXQ30qOiQQ/eyASPz0XU5MizA6PA4N6FmRKDR471fsTA76Pc2oj3ZLTKFv5mwhpOUjVB8MnluXK0jg8ixc6e/nlY6pFZmziv0DGX+vHK/sO4MNWVk9dPd7hj5kFp9p9nuxhzFdcjqIc15uH9nPWYzwhel1NKX1Uw1aTKcA5nTdT4xfrNrt9C79WYSqTqFRPZCn74e8KArdvUkuKJYtIzo5TImK1fLy2/UT+oufAxOJ8d0vTY84ehigW4q90z7JJ9ritnapa7CWbEiFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woQXMcUK+Qkkn2ThjJ8i/8CBzgfTNuLnQgkfQ9PoKEk=;
 b=emrw0EA7MVSz6FYeHNlOW1/RRpL45xX/oeUYvhdHsKB7kUT5o31Q5wKOibDVkP5ucuRkvEvUwhf70NrxmLeDoNwMl/lw/aQSYEjN04GF/+3/2lGn68vujN5yEyKckUAL5MJeFoMkuIT8zy7Rfn3iKtmmfW16jHXEoJwgFfLNBnA0wBWy+SESANCWNDxUUBS8x8isRUpHvgpvQMn3pzgvABMO+zo1N20sa8SsD9axUNCecmGsf3pma7mY2Nh2bvmWZSsZ7/WyvQCT0SwwHB2FBGocEToNvcrdN+XdyQpns/8EClYaKWvc3BrB6F8E9F1AmiiWyHc6fUxPLLrsInUNig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:20:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 16:20:20 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 12 Feb 2026 11:19:48 -0500
Subject: [PATCH 6/8] ARM: dts: imx28-sps1: remove undocumented fallback
 compatible "mr25h256"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-imx28_dtb_warning-v1-6-696bcf1a992a@nxp.com>
References: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
In-Reply-To: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770913203; l=1018;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=pj2JesFEsvCUpL0v27RsOVyPZJRMhJL9+6kGbWYvO8I=;
 b=Kskc08SyYmREUOUJyCMmOqhMh2clAluz5cftpDoIuDWM74w/NyrbHtpZZxthvueNcLpilmdGh
 b0orAa4gPE2CoB/hBWQULqNIKdhTBz9OIJmCZAOddGLU5pTOVclYEU+
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 790d3f46-bc8f-49e4-dfc2-08de6a529dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2RJUnROQ3B5aFlsMFRNdzUwdTN1RVBMaU9ST1Z3eS9FVStTektCVmxCdG1y?=
 =?utf-8?B?YmVVZG5qcnp6UUhPMloyZkdvQm5qUmVENndLbUtIVmFreVFYZUIwc3RGMmI2?=
 =?utf-8?B?QUZnMmdpMjI5NitmdVdxMjR0alNOWkhSdDJzL1o3OURKeWszeTA0cEk0Y25v?=
 =?utf-8?B?bWRpdy91ZWhoajJTNmJ6djFDZ0lDOUIvdkIzZWgrdUExQ1Y1eWdpYVk1RWov?=
 =?utf-8?B?aVNqalhWdHN1dDZVdnhNMW5pa2ZTRW4yaXpVLzUxTmNrbU9HSU0wV0t4YXdY?=
 =?utf-8?B?MjBPVnQ2ZjFVWGs0cjBTNzRpSW9NNkQ2NDVUU2lyQzA1dHZ0eXE2NFVNVUVW?=
 =?utf-8?B?QkVYaTBSM1o2c2poWWtVUFk4Uy9nS0lISWUwRU9KY3VzSFJRTGwvYTBTdllW?=
 =?utf-8?B?bktsYUdwNDRDMm5xUkZkb24zN1p0R2dHM29GWitHWW45UGl2emFwSDdDclRn?=
 =?utf-8?B?ZFEyZU5UQ2NpeWFHRnJVUUhFRm9wb1VLaEh3RVk0WlFKTHp0K2NBM3d3b0Rq?=
 =?utf-8?B?K2xaaUdRNkNrRHdZTk1oMldlM1NITGt2cS93TmhYUndKemVxcWJEd2JpWENy?=
 =?utf-8?B?WjJxQy9RbUJYRGsxUEhkY0NlMGpEeXZabkJWd01leFZrMGVmbllRY2VIT2xw?=
 =?utf-8?B?bnNubnJGdjVBdzZHS2s4UUhvY2hFMWR2c0doSFEvNkg1QlQ3aTVnOHAvbWJj?=
 =?utf-8?B?TGg3SXF6YmFTNXZLdndNbW9LKzBmMWRqU0U4T0FlUWdoQk1hY2RjRnovd1JL?=
 =?utf-8?B?YTZITUNRN2dJT0F5elUwc3FFUXBiSmFaejZxY3c4eWdJNURySzRUcFFJQllx?=
 =?utf-8?B?VitVNVVPSEdzMmlsZ2x0cXJsNXd0U042TGtrT3R1YW5FUW5IUWdET3lVK25W?=
 =?utf-8?B?elo1bm9kRVNaMDQzeDEyRWt0eC9qRGI3UVJHcWxHQ2MxK0Z1eDBXZjM2aGpD?=
 =?utf-8?B?cHUxZU9MMS9EQjltQklhYmxPZGdmNitySDZPOHdyYWlkQ2hER3JBQUJWTHFG?=
 =?utf-8?B?WFlYdnV0eGs1cHh6T1MrMnV6SnFiY3llV2ExQk1lVHBJZmM4MkdaMkRMaXBG?=
 =?utf-8?B?VkRVQmF5MDNkbDNFR042VEdhQTlBLytGTU8zWStDcGR6U3R1NTUrdTNYUkRF?=
 =?utf-8?B?L1NveG5KbkNNTjdNOEc3Mnh6aUYwSE1HLzZWeDZnYklVbmtQTnNmSW9XQ2V1?=
 =?utf-8?B?TFYyZERmSWZNNWRsdWQ4Si9BT1picVU1V2JGaTA5MktFcTV4ZlZOMDRLR096?=
 =?utf-8?B?aGpMY0Q1NFRYOG5BdFpSbGIzWDNDR2lsVFYrbDBpRkE5UnNrZWMyTVg2eEpZ?=
 =?utf-8?B?K0ZOTnpVaklzL0JCVDJ4QkxxV3pId1M5WWpnVHI3dXE3UGNxWFU0THh4TVR5?=
 =?utf-8?B?OHg5UXNpekQvUk5waVd6YjhNV3lkS25ZK29oMHoxcGdEUlJEKy8zTGl4SjRk?=
 =?utf-8?B?WWpjczJ6MUtCWFN5Q0QwZUtqWXNUV2RVazNUQS9qV2xlR3NsV21RKzJwbVFF?=
 =?utf-8?B?bTNuRm5LWWVEUExtdTUxK24yS0pRbkN0dmV6cTBUNW52d1FUODdqZTVES2Uw?=
 =?utf-8?B?d24yeXN4RUc1ekZRZG5jS2RpUVBTZkpGdWIzRGlqSENleEFIWnlYY1VteDhT?=
 =?utf-8?B?QitlcXpTaCs5VmRoSGdqL1ZBRkd3d0JJdFAzeGxGUXFQc3RITzVrNTJsM1Rv?=
 =?utf-8?B?Q3NHZ3BVOGo5dXpPTlNNMUttbmlwRGZhTXZWeThmZUZQZmZORUJzaWd3Y2VW?=
 =?utf-8?B?eWx6U04wb2p4Y0FDa2xPTXhtajhKazF1cFVoQ2lUVW10V1QxcUtzS3A4Q3Vk?=
 =?utf-8?B?WDVlRURmWTVBTDJ0RnU4c1hXWStGVHZiK0tMQ0dScnZCb29aSm4reU5yQmdQ?=
 =?utf-8?B?NTVWem90RnBGT0wvUGNmWkF3YmRrYTNZQkp2ZnNqaEdadXd2SjlGUlNxdTVF?=
 =?utf-8?B?VUhqYmROWmU4c0doM0s2dnlWMk10RXltT3lRTi9OYnJGRC9qT2ppZ2d3Y1lr?=
 =?utf-8?B?TkJVNEgvS3VXTTRKMjdWQWhnTXhjNWRyaUc5bkdnNEI0cjFaRzhGb0ZOci91?=
 =?utf-8?B?Y1FocDR1dlJEQXZzcFhnSGZwZFQxOGRMaTR4VE40K204RFRUbVpSVW5CS2Ja?=
 =?utf-8?B?NUFZYUxyS0FlUFgwaHJoM3JtYXRaUEdsajNESEc1ejhBTEdYd3lLbzd3ZDN0?=
 =?utf-8?B?Y2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFc1WUkwczhZcEFmSFBmQ1l6eXFLc2lucHlGQ0JoeW1uQlRwU0NaZEg3MVI0?=
 =?utf-8?B?bWpFZTUrSlN5SkhKcGJmV28yTlRjNnpRUm9MU24rbWkrSEJxSnhacndhcUVK?=
 =?utf-8?B?b1JrNVdyalpYYXg0TVBtVEI1OEtHdytCaXdyaFkwMnVaM1YwYitNbjkybUsv?=
 =?utf-8?B?VWkzTldJaitFejBwRTc4eG1BZXhuR2hHMFl2RHRBVDhWV25VNHlZOGp4aHlw?=
 =?utf-8?B?KzhKZTBMUUh2VllzS1RvdkhiRXhRWmpXb25MVi94QVlnY3k2UUtXL0tyL013?=
 =?utf-8?B?NWdUOVRDTFh2YmRlMU9qaUVHQnQ2b0FPNHBGMUNuVVVPNFVBS2ZoVmQ5VkJk?=
 =?utf-8?B?QjByS0RRdFJYVlRuMHQzYzAxdnBzaEd6Q21GMHl6Zkt6RHkxL05rQjZCVjdC?=
 =?utf-8?B?ZGNMYkphSjBqSHRZekY3bHRLZWhzNzU4UDFMamlSZkZPd3M3bXVOMmN6L3c4?=
 =?utf-8?B?V3VyWm5JeVJTaFlpdHFkOWQwdStMWFJWTk03eHZjT0ZiRTdpZm03SkM0MWcz?=
 =?utf-8?B?YXoraHVraklEOFFHQ2hKVjA0ZGN3ZWI4WkkxdXNUNDdsQ2ZrbnZ5TksyVGpr?=
 =?utf-8?B?UmlITkN5QUZEZTZuUTA1LzJWTzZJV3F0U3JleGNPdXpsQ2d6WGh2WVRYZ3Uv?=
 =?utf-8?B?cFRKQU5vOThYZG5NTFBTQ0xWNGFwYnZsZ045TExKMmp0bXdCSEZUY2haajQz?=
 =?utf-8?B?dktacnZZYXpJQXhxRlFOWkxvczA0WHZQam9YZ21SNldNOXltdHJ3QlMrSWRy?=
 =?utf-8?B?NEkydmx4WU1VM0h6bWoza1R5N0NHalZ4ZzRuVHFicjdUZG9sdktOOVRhZlA5?=
 =?utf-8?B?S2w5UFlhWXB5UVdydktSMzVNcGhITjYwK2M5dHZQOWtpd1AyaGdpMTA5MURm?=
 =?utf-8?B?R0tVeW5oQ24xODBJS1VOLzd4ZTNRa0JVMmV5VVF3QzR2aXdBN05WVG81S3Nu?=
 =?utf-8?B?OWxsNmRmaDNKQ0lBQ2VaSjI0a1oxMHJqbGs4M2dSUWVGd1lYMEhJUlF3UEF1?=
 =?utf-8?B?MWNtN3NqVVYxb0owS0djSTU0Q0owWTZXTnZub3dRTG5xMXdWYi9BNkFOd2R0?=
 =?utf-8?B?V1RrbUZyeVVacjk5RHBTK1RBT25IVjVKS2tCV1NOUnVaYTZvMDhlUklrMmNt?=
 =?utf-8?B?V0t0U2hwMEJqK0NWN0NycGJNYWplaGJXRm1JVkhHYWl1Vi8veWN1dTluU1Bs?=
 =?utf-8?B?L09hYjZXYkFqamw2b0xER0ZUV1ZrSUVSN05TQXZSMjhNWVRYZmFJR1dPcmhw?=
 =?utf-8?B?SmZPUjBlN2ovK3J3YzgxT1ViUTJiNmZSK2tMVnp5SWVYcklYcEc0TFpYc3FN?=
 =?utf-8?B?ZFRSdUsrbGl6eHpnYlltYUNTVG03QUZwOFdDMncwcm0vR0Zhck1XTVN4VFVV?=
 =?utf-8?B?TllhSmxhRmNZd2krWmdXbkhWeE9HaTRZaXg0NnZQaXVPVzhQVCs4dlEvbUpX?=
 =?utf-8?B?aHBTZmRhekg3OFNLVTR2QmZFN1NpU3Nta01lQ0FoVjZCU0J5UTd5SDRJS1BM?=
 =?utf-8?B?Z0VNOTRLeGVMVUo4Z0VWa0tqYzdTYk5jZjYvRWpKV0ljWm1kVTQzQnlrZEYr?=
 =?utf-8?B?MGNsS3Nrd2JxV2NXRDFVdzFPU1BDNnN4bXRHTXdsWEYzeGFSdm1sZTFXaUxt?=
 =?utf-8?B?TDZ5cXdDY1RZZk1RZHlKdGFIRldtVllwV0dlK0FLS3NlcXkydFFnWFdWVFN2?=
 =?utf-8?B?QlNveHlCRk9IYWtFT3ViZ050TFBOV1JtTzUycHZmcUVTZ2dzY3p1dnhjUVNq?=
 =?utf-8?B?Z1FvM2Q0dnFaTlNWV056aUwvUjJGblVSY2lhUFd3MDhWejBwUEVrSjhPVm1W?=
 =?utf-8?B?eWx6cGh6em8rNnp5UjNWdDVoQm4rcmMwUUtzMGQ2Qy8xeFpXK3p4NUNwaTJ3?=
 =?utf-8?B?cU5Fc1dvVHpzMXN4QnNEeDNaQ2Y1dy9CMzZhS1N2akxOb1AwQVRDU0QrRFE2?=
 =?utf-8?B?c3dvZlRRd2lHV2NpTU5mLzErUmdUeXRpdC9NeEpGVnl5ayt0TThTbXQxQ3BL?=
 =?utf-8?B?T1ptamlkaklFM1hobzdZdUlSSWNTQXd6L2Mzb0pad2RsQ0V4SlVPTEtlRy9r?=
 =?utf-8?B?Tmt1d0dzSW56TWdRSDNNL3hvalBEblI4WmJmcUJxRnV6Sjd6K2M5UU1ZVnZ4?=
 =?utf-8?B?MkJETlFVMENDd0s2OVJjdk0yNHpLYzBucGtmbE1LYTY0bkp0NWZhRy80Sm5r?=
 =?utf-8?B?LzFoaGJxWi9hZWRFZ1VrNmpGTnRPcUd4dmZzVEV0RytJaytqTjd5aGIwMk9Y?=
 =?utf-8?B?NkFyN2U4aTYxV0E4S3JaaWFlOHprS1UvaVNEbWJKV1VvRXhGeC9mZXNQTkgr?=
 =?utf-8?Q?8ryQGbUfZhnJaU8HZO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790d3f46-bc8f-49e4-dfc2-08de6a529dbd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:20:20.0649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NafoBtPVpTsSqiDTW3rBI4szgF3fiyODV+7sKjXMYTydzKufOthIrMu5Uh0rExGBzfkqdd3ui1b7cDsjtlVbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_082023_833604_FDE80F6D 
X-CRM114-Status: GOOD (  11.87  )
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

Remove the undocumented fallback compatible string "mr25h256", as the
SPI core strips the vendor prefix.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/mxs/imx28-sps1.dtb: /apb@80000000/apbh-bus@80000000/spi@80014000/flash@0: failed to match any schema with compatible: ['everspin,mr25h256', 'mr25h256']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts b/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
index ca62e7933116b0573ad459a9e55828c7051fda4d..9e19c63a4d511e7d9131368ba011069ac506289b 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
@@ -127,7 +127,7 @@ &ssp2 {
 	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "everspin,mr25h256", "mr25h256";
+		compatible = "everspin,mr25h256";
 		spi-max-frequency = <40000000>;
 		reg = <0>;
 	};

-- 
2.43.0


