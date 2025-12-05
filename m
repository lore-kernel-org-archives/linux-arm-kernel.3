Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67979D2E031
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 08:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSouyr7fZy6u6sj6TAe1utK+lQ7+d8Tt2340iX4aWhg=; b=q50sVFHz7RqCKGlZ0w7dHd0V98
	0i8DNxqC/EFB2ddisCqBXah6jxE6FXyEijjACHRo5EFNbW4KYXg4UH1zd6H7RJP58BRwLLuECP2Dr
	H2ttjui5Tt9XvI8O7U0ivhexvxLu8QGREW6XL6bBkivM4JbETWSzgngHVDPU9VC8Hqh+k8bqAF7IC
	gdWr1N3HkhOjJfruqWzl2qm6pNr3P+cjreA7NJzNKr9CCyLHhbeTWm4eGFmJioRC/7MGrDu70Tb87
	XR9I9Fzq8ECaWSQfQky1NDbXG6KHea4FuwqgV5OJQSXYwuB8Bog/jvz5cmaEhge0VZFndUaHmotG0
	PsyDDkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRR1u-00000009DO4-3YWO;
	Fri, 05 Dec 2025 08:19:06 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRR1s-00000009DNc-3NZS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 08:19:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrkrAqqvOkNkjwWKeYKCLCSPkZqKxt6H8Im74y1XD79AQerzo07QxWyqvdue/FyansTdZr2d3beNr6x/QulaobLhA0dVxS5u+TSxY3jgj2GWsTjm9TgtSA0TyLNv1BqZjC8rKkgIDDpa8AJsBa1cLDFoLHies7rqtEqvhZVd8jynt3J/XM9DDwuBq3leZczSDWpYoene911B7kIqxeJWI8uhC6VpVAUcQez2wnvnN2jj4sgGxdhZJPRrzSwQRXH61Hs0XHqBIenuvEmlcxabfybz756wSq11mUR74kt40oTpKyKI8rX9MHVUPVscnSs7VFG44vBxGJcpeLN90L8N4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSouyr7fZy6u6sj6TAe1utK+lQ7+d8Tt2340iX4aWhg=;
 b=xGAkCFkoA2eb3yMQWlmKIZoD/gIDcivuqt7dXRiJt+hBJZr4ribHL75uB4akx6pQU15fDhM12024nLIilfQAeU+5EgI7CLGuXWsRp28IgyB9Cqg3WsKao4Iy9XHVoqisdr+TUfqOcFaiuPkReZ7cVdTcPr4EEhi6wGUrGKnJc4egqyvvySILs01VlzUdRILu+tv5DxzOSe19EbO0JA935DF/xFFx2RMLVLXS3cKiLKJh/PdnEWeM0vdQY2M43Ta8Ra+nmKng1bb2BE+z1wvz+D2MW0KBGmjeDa6Roa50UuW6IbLEGbU/aFNPwf9lV/4aJD3FKpe5aV93D/GUZMxIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSouyr7fZy6u6sj6TAe1utK+lQ7+d8Tt2340iX4aWhg=;
 b=GVyj+k/5FCWC/qUz7kbMYh5temaCLt8VhXSF8KmDNfgQseaIxf91sDQzw4BPILTcHhsmKkmS9cWj3FXSv6VWrIXA6vAZnGntwAaaB3kXlmiGE+ATCY6kgdc5YSPpVqsHJxOPeneGoNCGP8KAwqYdkzJPOMZ8AiDuC3HXq//uGBAMmStv+YhU5BDNKav5GmtzD7BPZmRMOpmheyl5zX7BoW/DkvUlXHkRPkzsIejifL4h7svKRGqmIOFMgAG5up3duQOHEKLp2ZJn7YXHPC/JF54hmIXbwnTc+dST4OUTQI2ndI5mMBsGVZlaG2p4Gy8wdxRcTrDZ7jT6qKYm98M2VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9074.eurprd04.prod.outlook.com (2603:10a6:102:227::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 08:18:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 08:18:57 +0000
Date: Fri, 5 Dec 2025 16:17:52 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@oss.nxp.com,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Message-ID: <aTKVMAMQ6v_BwD6R@oss.nxp.com>
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
 <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d5fc13-5b2f-445b-d42e-08de33d6efbe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGp0RUxIc1RFdUF4SExMZlQrQjVteEVvc2NFdCtkSzd3VmtRMys5VXZLcm0x?=
 =?utf-8?B?bFJ2R2t2eTRqMVJKbi9xM1llWnpFeUd2Qzgxdlk3MFVuc2dEU2NmNFlFZi9U?=
 =?utf-8?B?OE9zRmozNURjWGFRQmZyaDFOMFV1QnNJdmczSFJkdWQwM2FPV0VmN3pERkdP?=
 =?utf-8?B?Y1pqVGhRalF0bktjTExkRjlEQlFDcTVTLzc4cFhURzJiQlg3RFZBOGdIYnR2?=
 =?utf-8?B?TWh6N3dKQkJVVzgvMlpzb1ZTWEVSN0x4cnBPMW9BREdoWWhoVjAweUhpT25i?=
 =?utf-8?B?TUVXTTE1c0l6N2FrRW02Ti9VejNuZ1N3RlR3ampqcXVVOUdQcUxnNDdIWXRN?=
 =?utf-8?B?WDQzK0RVVXBhMXpaYkM5Y3pxNklBWFN2UDdlN3JmN01BTk83dW95LzYwYzBQ?=
 =?utf-8?B?My9iRXdNNHAyU2pmYlFFU3VodXprcFEvLzZ0TFJBR25mY05qK0RhamRXZ2lp?=
 =?utf-8?B?dGpuQVJ3dFIybEhzbVBmalVnTE53YXVZMVBUWXZLYUswcGNhWVNQbFV1Z0NP?=
 =?utf-8?B?Z2tKR3NocnlVUVNEOFRZWU9oK3ZVZE0xUWZaYTNnczdYSGdlOW9JQmxoYVQy?=
 =?utf-8?B?SHJ2eWtraUtnWEVQMVE0RllQT3pHSmNzaDRiSVZHQ04vN0tKL3l1NjVrcS9x?=
 =?utf-8?B?TUZvUGUvNENtbWxzNkVNTGl1QkYydkNQU3hhbWtDdG9aQ2VtcmJFUDM5S3Aw?=
 =?utf-8?B?M1Q1cXIrQ09IOHlpazZYWTlsZUpNTURFVkR6Y3dUWTdTRmdta28wS0t3SDhi?=
 =?utf-8?B?YWhSeXdBZndwMXdlN0wrR1J0eGdrcHM3Rjl1OENwdGRKVVFtaldaYlZscjlG?=
 =?utf-8?B?YWR1RlFPajMyUlJWTkMzR2IvTDErMGVlMHF5MGFqUU9mcjJtZXFxMXN3WjdS?=
 =?utf-8?B?RnJIMDJNczRoS3RKZDdWQmlLSTNMR2x3c0hBV1diMlNCTEo0VnZHY01pdG54?=
 =?utf-8?B?MFVhQ1ZvUkduYjFQNUE1VXZxeGxXcDc5WkVqU01BbDQ1V3E4TnBhbDdBTEFF?=
 =?utf-8?B?TlBwUFQ3UnRvRnZkcG8xWEN5UnhCaXFna2RjVDE3UmpTTlBJUEtDTHhvQ1RC?=
 =?utf-8?B?bzgxdUlsQXhMVnE2SHVQZzZMbXFQUEt5MitWczdjY2hITkIvOGtSdnN0ZGZX?=
 =?utf-8?B?bzFlVXExNnpWV2tqdTYzb0ZhUVdzSFpySTR1K3huZUhjakN0UmY0Qmoramh2?=
 =?utf-8?B?R1ZHc01RMUZWSUZ4N0V6aUFmbGhrMU1WVGx1azQ4SjYzaVUrcEtueGpDTHFI?=
 =?utf-8?B?S2lWUnZVZlZraHFkakdZRXUwWHpBaUZOQ0FYY3oyWEJGejFidGxvS2R6NXZn?=
 =?utf-8?B?YzNaWjFMbFRXcEo2S3FBbWRlS29ZRlQ4U0VQd1ZwRXNLbFpUMFdOUHd4dnBB?=
 =?utf-8?B?RzdIZDZOdklwaTB2OXpEL010aFNwZ25Iay9DTlZCNzEyRGlsdktJbzBZRnRy?=
 =?utf-8?B?VEgzaHJVYmQ0bEJHSkJEY1MwMjhDMGI5YzlVZlJGNXlNNjJkZHhvOE44bEs0?=
 =?utf-8?B?b05wT1pHS1lYUTZTR1FoNlprbnl6blZjc08xWmovYnoxR0pOMzdvOHBYa1Zo?=
 =?utf-8?B?T1dCRnBrTE1wWml4WGh1NTdVVXV3Q3R1Z2VkeTZQTytuUE95cjRWSVhCT3dE?=
 =?utf-8?B?cXJ6V1RhQUxQZGRCSG1CMGpQWlhuVFIxOHFPbWI3UEhMQnNUUDRoT0RLN091?=
 =?utf-8?B?Y0JWWEFNNTlwNUM4cU1sMndOWkxoRFZwL0xrU2V3alhRWVk5T1FsYkYzTWlx?=
 =?utf-8?B?K2NpR3F3OE1Ya095QVhBY1VLbGtxbUoyR0szSklyYkdnTkZUNWdib0FXNXlT?=
 =?utf-8?B?bnlyRFR0ZngvTUdyZlVEbTJJNFZiZVVrN3dLNFMvYWNIZFNiSkV3d2NCeUZs?=
 =?utf-8?B?TU00UXBXcnZMRnZBQWVNck5lcWlqRUZSZWhRS3VMQSt1bGtvM05EQmE1MHU0?=
 =?utf-8?B?SnpCVzYrYWxMeXY2LzdvLzRTS2NGRE9Kb3FxbVlyZlZmSHJuWEtmR0V3TVZP?=
 =?utf-8?B?a2M0aWYySEdIWmNOZFRYYUlzUjV5SXZLT2M2TUE5ZEUvNml4R0ZLTzVYT3BL?=
 =?utf-8?Q?Q9CrlU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak8xbGVtM1pVMW9EZGxHRWJ6YmJlM1FtSEZmMENHV214c0lkUjV6TkVteUQ5?=
 =?utf-8?B?aWJCMTVPMEVUWVhkYXdGZVVpQ0xPb1NBWDQ2alh5RE1LbVlTVVp1RSt1TWZZ?=
 =?utf-8?B?MTl3MjkwT2tGNHdHNWQvOC81VjFkeVpxZW5BNTdRMUcyK20vVTcvSTRBTTNT?=
 =?utf-8?B?T1lKMzllYzdFV1R6MEE0U3dHZXNoQkNNMmI4MHN2Q1BCZkh1N2Nsc1M0N0s1?=
 =?utf-8?B?UGtSc3kxbVBhZndYNkpqNDBCQTJTaXdwa3Q3Um9JOFRZNzZpZzJoeDlTdWRU?=
 =?utf-8?B?ZkNmaXFSN1VvNmw4cWZORVBiYTFTN213TU5zVElyY2loVVVMeVhSNUorcnNS?=
 =?utf-8?B?RzI0aHo3ZTNCNFdjY1hnYWdwLzB6QmxacURtL2Z3Y1h2a0IrcUJjVXZMcGpn?=
 =?utf-8?B?OG1Qc0luUTR2eE1mZTBoSXFpK0xsdytqdnBBU0NYRmNvcXRSS0wyY3VScnE5?=
 =?utf-8?B?VlY3MzRjQlRpWVdjWFp0d0p4T2IxdDA0Z2NwSnRYcGNkelRJcXluR3k5RStU?=
 =?utf-8?B?R01mNm9SYUF6SkdlTHJUQW1JNlFkVHoyZzZnMkdjTTF1V0ZkVFMrMDMzaU95?=
 =?utf-8?B?ODhUc09zUzlVVks4OUJFM1dMQThqNkVvQ3VPT3RhOHpoOGo1czFaR1NLc1dt?=
 =?utf-8?B?cDdIOTB6RHIybXZCVmYzU1lScVBWMEQwZGovcU9oMk5jWDZjR0xBL0YwVVFC?=
 =?utf-8?B?YWt6SVptWXVRMkNHcFE2NVc2L1VZUkVkWlU2TDB2UDR5RG00SkhLaHU0K0pw?=
 =?utf-8?B?YUNHVURkVjcvbkUxM2VIWDQ0OEZzRmtLZVg5b2VOd3R4Y3lWbkI1aUtXUHlr?=
 =?utf-8?B?Q2M4WXJKV3JadytGeWY4Zk5ncHpKa2cxcHk1WUE2VFJ1Qjg0VUpidGlJU3NN?=
 =?utf-8?B?S2tzaUJNSXdwemlFSkFaNDBmSnczdW54TXpPZS9aRkhZYW1yM0o0QmFHVkxJ?=
 =?utf-8?B?UUNFLzBUT2phZTRLT1pETXlVRU5XdFZwWVlUNGx1ZndBUlp4NHFYeWgrbEhM?=
 =?utf-8?B?MVlPZmp1d1gxWVdYcWJhVk1BTjJZVEtyU2FWY3N0SExQVzJPR1lpbEVSdXVx?=
 =?utf-8?B?N2hoc1IyU3orT1U0bmozR3FuMENkNmV1cUhzaklnWHNSSWx3dlZQTTMxcy9H?=
 =?utf-8?B?N1c2WXpvTHYvekpPaFdBc0lIVlpxci9XbUdjUUd4QW5oZWNxMmRzeFcyRmM5?=
 =?utf-8?B?dW1nZGtYa2tma2dKVEt0bTNrWUNyZDZpbGxrR2kzeHlTVHdWL3lHVFMzZG5O?=
 =?utf-8?B?Nk9zNm8xZkhhRE1qNm1HNThXVkMycncxTWtoSnN2bGJ3UEJ1ejFuUko0OU9j?=
 =?utf-8?B?TUpqSnNVM1g2VjZmRG9nNi94Ty85dmR2dVBqZmc1dmZIb25WeTdvZ3ZuZnUw?=
 =?utf-8?B?VDVyb0tWdUM1RDNDdDZ0TS9aa01Yc1F6em1PeVBLZHM0RmVDbUdydFVQb1Nz?=
 =?utf-8?B?TzN4eTBKM2lnTzQ5eVBiNEVzSDl2dlJteW9qaExIdGlSaW01cy9TdVBnN0hq?=
 =?utf-8?B?UHFMalY4MWZ6c24yQzR6TUZ5TldGVDdSVXdQZk9xMXVwL3ZseWNTcVV6aXB1?=
 =?utf-8?B?SWtwU20rWVRYMWlXVmVjZFhiTjdnSWRHZzBaNDFuZlU4alZ4bmNBN3JYRUsv?=
 =?utf-8?B?Q3JVbTlzQnhPYzgrYVVMeGZrSkpOVU9BbUJCM3dBZnUyMmsyMlRBL2FYYWcx?=
 =?utf-8?B?UlNTM1ZyY1lsVVlxODBuOXplVkpFVzJDeWF0MzBPaXlLYm94R3YyM0NMTEQw?=
 =?utf-8?B?Q0s1MDl1T3k5YnVOY0xKQi9veEwrVFFWODNJR0E0RWdiRWpicERXY282WFlw?=
 =?utf-8?B?TTVFZU8rZlY1blZ1ZXJBdkc4Y1pTak1SQmR0dDZiNC9jbCtpQjhFa0w0QkxY?=
 =?utf-8?B?WFp1OXF3eElDdm1kTnpVYlpqV0xXdWJXTTY5ZWtVclBMRFNRaDZDTUpzcUM1?=
 =?utf-8?B?NURaZkx2ZGtCODk3UWtLcUZrdGNleGo5eFJtZ1NXcjJyRE5NdWRpY1RFQlpB?=
 =?utf-8?B?OTRhdnFkeGtYWDB3MlRsRFZFV0xEMVNMaGVXVUVMKzM2ZXAwNjNBelJCWTlO?=
 =?utf-8?B?ZXc4cnZvQTdxMnFDU1VwK2NFM3lGWmNnckR2SXBmZlpSQlJRRnMrVE5sUU9H?=
 =?utf-8?Q?XO7w+Jctj3n2dpwGZuH17Th0P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d5fc13-5b2f-445b-d42e-08de33d6efbe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 08:18:57.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnKyU+FAmm7kNi9I2xXB471iPTl4EW7DQs33LnQ/+MTgnDbFURjNDa4y4RVWExXZNb2LjbJhSxaQrikZFyOFgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_001904_918525_A6145CD6 
X-CRM114-Status: GOOD (  17.46  )
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

On Thu, Dec 04, 2025 at 04:25:38AM +0100, Marek Vasut wrote:
>On 12/4/25 4:01 AM, Rain Yang wrote:
>
>[...]
>> > > For the Linux working environment,
>> > > CLK_GPU and CLK_GPUAPB are always-on, while CLK_GPU_CGC can be gated off.
>> > > 
>> > > Regarding the IMX95_CLK_GPUAPB handle, my suggestion was based on the absence
>> > > of its frequency in any OPP entry within the frequency table. Removing it
>> > > could simplify the OPP handling logic and reduce unnecessary complexity.
>> > 
>> > If the clock can be disabled by SM, Linux has to make sure they are NOT
>> > disabled, so they must be described in DT, right ?
>> > 
>> > > [1] https://github.com/nxp-imx/linux-imx/commit/695f2bdc57b869ca5189313e4b5fa7eb5a12f622
>> Currently, only CLK_GPU_CGC shall be described in the Device Tree[1], as it can be gated.
>> The other clocks (CLK_GPU and CLK_GPUAPB) are always-on in the Linux environment,
>> so describing any of them in DT is not necessary and would not be proper in this context.
>
>Since this discussion is in fact unrelated to this bugfix, I would propose to
>fork the discussion into a separate patch. Can you please submit a patch for
>the GPUAPB clock ? Note that I believe GPUAPB clock have to be described in
>DT, if only because DT is a hardware description, and to make sure the GPUAPB
>clock are correctly enabled by the driver.

Okay, I’ll submit a patch later.
The commit message should reflect that only CLK_GPU_CGC is enabled.

