Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43440EB594B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 01:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdocGvGPFvA4JTeQ4z+AxqeRFWcyGebACmQEVArPeak=; b=X6z1ZRnJvLSW4rY9KZVMsv+jjs
	PPOis2+pLYmsM9wb/KjjGp6xZh35H6/Vq5CQwKwkiVj7+GdhNLrWGLER+JGZmObpb+4FXY5ddE21L
	wLZtQLqDut4aLuEr34RNrWK2hAfrrWg4PvS8zhOlirdpUWq/b8FvZ5n83sBgMjtjdwxo4Y2M6M3qI
	kivlVGuqEqZYhBxA5T6zlBa0W/INBi/a2qHAisg26cmjf4q3VjzhAbm7VYn8E/hysAgw3jrd8IHGl
	xapB+NLDpbGzPu1Rp94h54kZEk3mrVUU+d6dE4OAelI3oDVIroj1VL3hcF84NkcuJEiLJZTfDB39f
	DUDZHtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpzRq-000000006ZJ-2TA9;
	Wed, 11 Feb 2026 01:55:22 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpzRo-000000006Ya-10BL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 01:55:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1VIP+sAEhM7yaFOj7H3HRp2OOhyq6g+qPbnxoSLZlTWJ63SI2PAGaZX9g6LwqyCrOkhgNvYJibzlt3n/BKPQm3nRhnIo8j6djNks2lNAnYgZSzR4Ac/ue/bqMmMMC3ywkPV3KPjM66ZunXl7ulD2FhEJcPviyXZ5hzgN7lwmGd6f4V/sihSN2a9c79I+hTGp+N2DIZ7Gt1TWmvVna3SNuX2tQ/wX99oAoE+IE9IGi6MIGGhZwpR2wRA4U6JSA00D4jo8sOXiQoS/uNvwuP1BP8C3/BnP5srB/+vVKImvXdKdrAtk39tdsjSae1Z3d2a/omvMfnbOGFGwCMvGjROQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdocGvGPFvA4JTeQ4z+AxqeRFWcyGebACmQEVArPeak=;
 b=S9qNHoZXpjtY2G3MtGT71rA7av53NzH1x9Seus0tPlVIIPrxGhCEjR7PW6O8dSOLaZ0FgDdCGrYnl3iY4r4g305Rj79282yAWO+mUZkAqBbxHWDpKOONIbL2c/OuZygTYhRojB6Ub/WTIqy/7FAomAhGg9L4kS7GhZt5QXcG1veXJxUaXLPZCWUuAQArSrfA8VHwNMT66apCaNaq8wA1ORJIeTStbRXhMSK8m1N3c8KzHyd1wAi5bzVZp6vV0phaf0FT4gnEBJsW8BUKh+66CXXViu0HoGfWyq5zHdqsNHvr6ahTx1NJuBvKV5i2fKD7W644w62QKQkF+DKQ3UCdlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdocGvGPFvA4JTeQ4z+AxqeRFWcyGebACmQEVArPeak=;
 b=LUfNwxs8VyvFX1VBTBIPK2rphjQx09S0kavGMpj1m/wPQyEyJQYJJHa9fgFU1QR1gIg/jGVBlwA+1EkU+tNei6Sv0EfbEqI1jxT/fgQPLjk/ZD4t3UWuO1CNcblUnEbV+MsBOxZ4jkqtRVUUy7muODWfLYfgJbQPthZ4PqrFnn1Y1KSFG/BdHd6q6xN9I8aiOPVi0y0q91VddoWlsTvkeDHczDWzL4MHKKB2PCtfI60FqLo1P+SS0UZW5FU4E/IsWYbnXUD5qsLR6u9Sv+SPcA3S8hQ4CkBIVYVVm4Z2mmcIWu4dIsE2oD7ZLuoZ1DhpjVFIfDlB3eHV921QkyJVWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by PAXPR04MB8175.eurprd04.prod.outlook.com (2603:10a6:102:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 01:55:13 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 01:55:13 +0000
Message-ID: <9b223407-9218-4382-9968-6541cf485b9d@nxp.com>
Date: Wed, 11 Feb 2026 09:54:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
To: Frank Li <Frank.li@nxp.com>, Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
 Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
References: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
 <20260210-imx91s-frdm-v5-2-b3e9a67d2285@nxp.com>
 <aYtT9vOAYTYuTsC6@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Joseph Guo <qijian.guo@nxp.com>
In-Reply-To: <aYtT9vOAYTYuTsC6@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|PAXPR04MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e554a2-a339-498f-4430-08de69109850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2dCWk8ySnkxckRyMWphSFlQcnlpTk9qbGNobnU4TGZKTjA0VUgzTHBRUXVJ?=
 =?utf-8?B?T1Y2SmtQSjBOekxNN0JTSmNtVmQ3UDFQQUxDTkMyNDhIVTNRdzRSYk42aWF6?=
 =?utf-8?B?eXpQemhiL1ZrSmpxRmpsb09QSjVJTmJNbE01WWo2S1QrOVdBUmNHaEhaa0Fp?=
 =?utf-8?B?VW1IOWpLcUZsSjg0a0pwL0UxaDh0TlFFb3NENWRTak1tRXFYYWVkV3QwdVFV?=
 =?utf-8?B?aHN3b2w1MVFjUkh6VmFjL1hLdzcrWUpQRUYyczBzSGR3NktIMVk3cWJJVnVq?=
 =?utf-8?B?M3BlL2VNSVJMUVJTY0VYOG1WRHBQdFBOMUtRQUdTVjh4OFp4c0dGbXhQbE5U?=
 =?utf-8?B?QlFTc3NMQTh0cHpncUl6a2Rlcm5qSWF6M2U3UkhnR2JnSW1GSThla3Y4MHZt?=
 =?utf-8?B?bWRUblQ1S2tJeWdQb1ZtZnBpSisrTGpEaGlidmQ3UkcybHlOSXl4WmFXZi9z?=
 =?utf-8?B?UHRwYXByWWxQcE9xZWh3QkhIeEE1L0J6QzkzL3VYNmQxaTc4bDVXcHBlUVI2?=
 =?utf-8?B?cWd3UG44anN3TCtkU0p6ZFhHQ2hRWit0b0FZMUhvY25aOTY3T3pjZDdTc01K?=
 =?utf-8?B?UHZVc21hVm9QTzAzdHoyUFROU29mK2hCaWhwaVBpTWxaMFUrbUlmbzFrUjhs?=
 =?utf-8?B?UGpQMjhVY09PUVYyb0Q0alFhOTBFOGZUY2lpNXN6UTdndzNWM0FDd3hYWFJI?=
 =?utf-8?B?OXlSL0M1by95azM4QlhmR2o0eFRrWGFYUHlZMUJJMEdibjFwTUs1TVh6ZXNI?=
 =?utf-8?B?a1NheURSaXB0Qk5uaVlMZVdobE9pazJzM2k3Q3NDN2JDQUlEM2loSk5TaGRn?=
 =?utf-8?B?SlJvTW9RYmZrcDNYNGhEdndSZ0lqVWRQSGNHeHMwQW93NElSUTVVa1c4SUd3?=
 =?utf-8?B?amJBcDdDbHpVem0vWWFPeVV3ZFdOTUlCblJxdk9nU1ErT0hHQlZGOFY2SE42?=
 =?utf-8?B?dmR5TnJDa3ozR2h3NFQvbDJFRnlDU2gwQ1c0MC9GUm9jazVicnBEUXRBM2tW?=
 =?utf-8?B?eVBlNTVGaUZiWVdVb1RBOUVjbjNtamFKL1NscG9mSlhRL0MwR0oxd2pEbDF5?=
 =?utf-8?B?K3RWUUxpYk9hMm5IMFRrMER1UE0vUjcyc0hSVW1HQTZmcytmYU1Mb1FYZ0Rj?=
 =?utf-8?B?dmNzSTdBbFVmaGdPc1pSbkVnNFVxSXFjN2xnU1VoQUZrOWlNOWhZNTlxSWtl?=
 =?utf-8?B?bkUxZzA5VjYzam1XeFJ3TzN5WFNSaGZLRHZXeFB3NlArcTBvVU1QTDdTQVFU?=
 =?utf-8?B?Rk82QVpNSFo0ZFN1d3NSQU9saW5yQlZiWjQybjhpSlNLUXZQeDNSU0NiWGVY?=
 =?utf-8?B?TWFWTzVVREFoOWFEUnEvY0dyQ3BPQlREdlptRnBSeUloVTFzTElvb2JhWnho?=
 =?utf-8?B?K21TM2RNc1ZZQThTNktxekwxdFVvUlZjRjFucU4xZ3F3aEtYTjZqK2FOWXpU?=
 =?utf-8?B?RzREVUdwVlkzTVZ6eHNMMm1iVkE3U0dUREdNSGpmSEE2WVFRVXZQVjA2Wldp?=
 =?utf-8?B?eThsNFdxQisrNklCMkwxd0k1UmFQSXhJem1kTG1JN3dqMElYSTQzZ2tPL1NI?=
 =?utf-8?B?NmJmSmFpR3VkWUpYSWlxQmYrY25nOWFxLzV3a3ZEajhDaGZPY2lPTXA0R1U2?=
 =?utf-8?B?N084QW5jYXh0ZUdVS1J5RVV4M1NRRjhzUlYyeElkSlFhWWs3Z2hhMHlZRGIr?=
 =?utf-8?B?c3ZxVDNmTnBmVTkxbm1DNVNkNDAwTWx4U1dEK1lnRGJjcWZQb3dOQ09kN1Zp?=
 =?utf-8?B?QXIvUDB6Zm9CYUp3MTMxYXZKT3dHWUs4dTcrZXRqd0VyTy9WMlZTaTBoOVhv?=
 =?utf-8?B?clR6b1lTYm1tSktTRUFZZ2FQZm5ZdkMxSzl2MTRVOWNNWHViNC9OaGlUZFpm?=
 =?utf-8?B?US9YblQ5MFNPY000bGVIRDR0eUs5YlU5M0RHLzBDN2g3ODhqaTJwL3l4NEJB?=
 =?utf-8?B?alZMNG13NjJsSEgvSy9xajVaZzhVMGt0UkFKWUhSTzV3SjM2TEJxMGF0dGgr?=
 =?utf-8?B?aktmUGZVNkpOTWZ0ZERGMmdObGZ3NE1IS1d3NmxJdUZpOGNPTktEenhhYmFi?=
 =?utf-8?B?OERnS1M2UEhzRzExcllqOE9ZVjFLekRoYy8xWEduYjJpVGxPeE5YN0R3eEs4?=
 =?utf-8?Q?G5bc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2M1ZXJ1Y0R6TWtwcHhpOUFjOEUvNk1XVm5rVWNRNkUvSGNlODdHWTdJK2FN?=
 =?utf-8?B?MXk1UTZrTy9ST2Fmd3dtWlkvd3hWZ0ppT3ZTYmF2TjZOUW41NFdPNEtsaFpz?=
 =?utf-8?B?T3NZR2h4bG13RWxKVVkwR1RaRWtJQStEN0VpaEhoNzVwcEpESEFYVmJIMGJV?=
 =?utf-8?B?dGFaOU5NR1pJbGxNMGl1NnN5UlVEQmdsSHZEaW8rK2lPY2sxWTBsbkdTZFZG?=
 =?utf-8?B?VnZxS1VUaGpza1ZiSXl3R25mNzJYdnFoa1k1dlJxWlU1SWpoT0FKclFwV1dE?=
 =?utf-8?B?dVZUZEE2NzE2bVNidENLVkZreTFQT2VrVGZBdFpJRDNuTm01anBQNEc2dGUr?=
 =?utf-8?B?empkRUV1aUZaRkpZWGVZeWt5cUFDeDlHcE40cEZXTXpyVUhNL0E1OEtLNDF3?=
 =?utf-8?B?cnR1ZmcvZjMzVThMR0c5T2premplbnFyd3FramZqTlFlNm52cnFUZzdvNFd2?=
 =?utf-8?B?a2t3bUtYWjJaVUFka3RMMVJ3TUZWc0R6ZXhaNzMwZ0prN0NFd1RKU1FGVklF?=
 =?utf-8?B?bEhudTlVVUhUbmVSQVFRQ2lPWkxiNGFCMStQSXkwdFoxRWlFRm1tTGVnaGM0?=
 =?utf-8?B?WFFveDFlakh6V0t6RFRIKzVMcmZiUFdZMVppS3U5KysvWGlBcWVUTFg2VmZi?=
 =?utf-8?B?cGlEVm1JWXc2Z09oM0lyRzRoSkpibXZxTHR6UW92V015M3p1K1dKZklZWU94?=
 =?utf-8?B?c3NlNDZ2OGxUU0NHWGEzbU1lcHozZDJHWE1RUUIrMXRoUnlNclFSY0hGalhQ?=
 =?utf-8?B?VGliUlpsbjJHejU3OU44dmdGQklkTFhBNnNyMDF5NXEzOFRqYmtud2tiWGVi?=
 =?utf-8?B?SDFsZ3pVaklhdnpkQkw1ZS9xbUQzMlgyeXVhbVdhWmQwcDFYdGFmQ3BQZzMx?=
 =?utf-8?B?czAreFJMSS9kczE5dTdLRFhsSDNIVzI0VjNKbTF0NmNaaTV0bmhDb3lsMnlT?=
 =?utf-8?B?Q1pNY3QrR2swZHVUS0dEU3Jqek9BOG1teHQ4ZHI3bHZKK2Y1MzlEcFBwaXRn?=
 =?utf-8?B?NzNIN0RRd1FLSnFOTzErNDZ1Zm5NeUFLcDVrZ2N5SDUvTEMwOGFnWk9xV1hO?=
 =?utf-8?B?SjBUa0czOUhrb1ViN1p5TThzcVZkNXVyUHF1N0p2U280TU5IZWNRclA1MkpO?=
 =?utf-8?B?SkhXVlVOa1VnVzlBVVNLanV3UVNjVTBBRUdJUWpLQ093N3UwNWZVd0J2MHdY?=
 =?utf-8?B?dDU5STJTT1NVMm0rMS8rTzEwSnZTbGNEZTFHL2lzckJWUEFPNGVlNkpYcllo?=
 =?utf-8?B?Rk1FZ0RkNitMampYZjl2elhyV0lqbzV2aHhYNW43dXEvVE9rcW56cEF0V2FU?=
 =?utf-8?B?MmpDMEtjSFBod3d4NzA5LzNQN0FJZ0QwL001d2RzT2o4VWxjTldOMzV1MXNa?=
 =?utf-8?B?d3JGSUM5SmVYZXpDcy9uNExVUGpUME4rcTBuZVRnV1V4OGovWkgvUkMrcXM2?=
 =?utf-8?B?TTdVYklweHJKKzVvWE9ETG9VWHlrTHZoY3RnTk02YWNMZWxKMWF3Q1p1YU5L?=
 =?utf-8?B?THV2d0RCbzlXd1paWGVnUGhiaDVKSWFBMFMwcGNnT2swaHpnUWF6TFg2N0Ro?=
 =?utf-8?B?RENzWHFacVdGY1RWS1pyUEtMdFgrQVZFREdsN21Id2tFRmNVbmlpR09Ua1Nu?=
 =?utf-8?B?SFBrQlhJc0dsYXg3MTI5NW56NWdYYmhyQ0R4Z3ZxL3Jhbnh6SWhkaXhnRVdy?=
 =?utf-8?B?M2k1UVc3bWgzeU5zYTY5MWFsZzFFRXo5VFVwKzdaQlRtYUFlUmdJSUowRXJU?=
 =?utf-8?B?STNRMmpOQWFkL1BtWkQ2cnpxOW43a1V1RmJMVjVMNHNiZTFVUm1wUnkvNERJ?=
 =?utf-8?B?SDhGMWhhUXdwVnY3ZkhPd2ZuU0dlVldtSHFoMVBoaGZPU0lGbHJVcUxDTVFn?=
 =?utf-8?B?QzBWd2VBZnp1dGxyTm5Bc0xNNlpac2xReUFaUDJMdUY2VkFteVY1THJZd1Rz?=
 =?utf-8?B?Q20razR6MEFvVWd0eW0vTXVFOXk2TFdlMU1HOWdCbno1aXdzSXNMa3UzR2l5?=
 =?utf-8?B?czlka0lmdjBDTGo3WWRsUldyVVFmTndVU3hweDJoYUxVMmpRZHdvRWRxb2pE?=
 =?utf-8?B?aFVhOEhtdm9Hb0p5UHZPQ1ZqMjNIMlE5eEQyWEkvUWwzV2JmZmU4aEJWVm40?=
 =?utf-8?B?dWs4TEhEcHM1aXZURldyTlBPYzBJVmM2bUhHOWtmbERyUVA2QTJwZytXWlpl?=
 =?utf-8?B?c3ZKUzVvT3EwTzEwMmZMaEs0S2tKV3BGR3BkY3dqSEZVUXlNZDdjd1FMaTJZ?=
 =?utf-8?B?L2tMRW5ZbC9yVDRaZ1Qrb2VRSVorSDFsMVlYOCsxOHJMUUptWGdmSVBEWHJX?=
 =?utf-8?B?SWkwQ3oxb3R1OFRGWVN1ckdDOWNuVVVrWCtRbGdzVVY3T05WbVg0dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e554a2-a339-498f-4430-08de69109850
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 01:55:13.1613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaPAgDgAkfMmenfTRT7T1B1Hz+NzppgnS9NgcG6rPOTua6c9JsnuEu/TE3ZcY7abj7Ljxa6pk4sAN+eVGek89g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_175520_300558_989C16D0 
X-CRM114-Status: GOOD (  13.67  )
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

On 2/10/2026 11:51 PM, Frank Li wrote:
> On Tue, Feb 10, 2026 at 07:47:55PM +0900, Yanan Yang wrote:
>> Add DeviceTree support for the NXP FRDM-IMX91S development board based
>> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
>> and differs in memory, storage, Ethernet, and PMIC configuration:
>>
>> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
>> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
>> - Single GbE port (FRDM-IMX91 has dual GbE)
>> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> 
> Look like it is very similar with imx91-11x11-frdm boards.
> 
> Can you create common dtsi for both boards
> 
> imx91-11x11-fdrm-common.dtsi
> 
> then imx91-11x11-fdrm-s.dts and imx91-11x11-frdm.dts included
> imx91-11x11-fdrm-common.dtsi.
> 
> You can refer below method
> https://lore.kernel.org/imx/20260204083551.2867263-1-sherry.sun@nxp.com/
> 
> Frank

Hi Frank,

I think the two boards are totally different.
They have different PMIC, no EMMC for FRDM-IMX91S and totally different pin assignment.
So if we create a common dtsi, there will be not much duplicate code can put in.

Regards,
Joseph

