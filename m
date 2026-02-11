Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879C8EA3F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOF325JRxpprVW1RvHtQsgTq6lX5grr2hfPUcHLt2ZA=; b=juNtCisWgM20yjIWZ7wvkr4UuW
	bfuTYEDQ+aW9SiMkgTlK0yA+TfAJOEX67KyVl3OvlIx7qgx1W8URwYq5thPtkCbGsUbzYjPTg3OxG
	3K/PAX6ovIoHL4BmAMoH9S7744zsjtICJRTflBBJgoSyLTD9G0FG4jBltO0CZFdwiN2n8ya5k3m1g
	0298QLc4UpQeTst+c6yt+aqV+2x70B9LD4oGdJYf1x9nockkPtOFQJgxJVVSAyt9NJIhfWoq4uVaR
	/xv+4oGsZX0Je4tPRPeVGrbv6lXsSh1F//mNr6kMyGRlaFEsYo52CPAKw0IPiEwVqQ+ALR1q/q+lo
	oFAlUvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq6Vy-00000000R0l-25J0;
	Wed, 11 Feb 2026 09:28:06 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq6Vu-00000000QzQ-233q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 09:28:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFyb36pBGq7BZbcpcRAZ3fvyB93tPhXKcQMkZgimffGZhKVC3WX71xjx3KeW724JWC3hyPYaB3ng979ucT8y0CuQvjs9DirQsu3gEqiOfibSlADCEem7ZfDJBK7CdvLOKXzEoYVAiBqN/lvLEuJYC+wDk97uRWMDXpG9m5saQYrceTs4l2GcTmeS3S9zJwM2I5qfPK0fT0VG1pMsEro8Nv6B2lluRrsROxhyV0w7xjfy7OHdlKRong7F/bDnUIKQ4ZOOLpbktP1qGhgenBsrOLXohr4kT7XV1b5/5U1SHsTC1VYOO+2RunZOwT6bZ+P3qhsxsXmy1gG4QQmGcISWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOF325JRxpprVW1RvHtQsgTq6lX5grr2hfPUcHLt2ZA=;
 b=N4nXWNAtx4O27vDix1kyQVxdM5MCpgao5lb349wUanagrxajtEbA8vqn1+tlKUxETwzQhLR3hTa2hdDoprao5Eus9ch2vvSzZ1bVQi6qQ/5GYMXfwWQNd0OtZGPinlPHlvOxq5eAiZD7JNQaMcloDB57oMjVxweIbt2Wks//BV3Etc7PAexDR2fydrglf9Kpydau8X//mGAzcR4xIS4wvH3FLr2EbLqk7SfA5bq7tlhZ8Zd1XNT1V1jXUYAZPF9kSNkDfjRvYXkjPohSDr7mtGanAE3mXIVAsCjCHmziuO/pkqJkRxKEqSBVzEtsvLBFdhIBamGlTsTGVcu7mK0/zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOF325JRxpprVW1RvHtQsgTq6lX5grr2hfPUcHLt2ZA=;
 b=RHMHZrNxnwLceMjdSyv9z1C/oFls/tMPu5ajva7I4IW9EkiK5QjhHNzZFBIUSgVT/s4+K5WzwYCXHX8wOJ0La41SW3ydLjOOWJ5mzw6ph34lf6ckFQHZoQuQruV6PkKaYAPZaXpKk5R6E+q9iyvvv3qCitqyMWrHRkH+z+AeM24IWRLg146b4Qa7SRZVh+O2cYig1Ju6yDi/goEPUJGeMezn5Cxr9/fhp+dHdr5bcKKwLGz7ZvrNifQJaMacifl49a85kEYh0+JjJ4mrSpA9jR4y/N3mXdsTI/AEMgPMwlr+C+FZp3ACslvnhFOcWvIfhbuHbte3w+kxdH2QgAIR3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by AS8PR04MB8737.eurprd04.prod.outlook.com (2603:10a6:20b:42a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 09:27:58 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9564.016; Wed, 11 Feb 2026
 09:27:58 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Wed, 11 Feb 2026 17:28:26 +0800
Subject: [PATCH v4 3/3] arm64: dts: imx95-evk: update the dma-channel-mask
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-b4-imx95-v2x-v4-3-10852754b267@nxp.com>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
In-Reply-To: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|AS8PR04MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf4e3ab-f9f4-4c91-6398-08de694fd75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|7142099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cE1OU1loT0JGZkw2bWp1MzlKUSs4TXdMeGRHTHdUM1NZVHk0UzBTQzByK2FC?=
 =?utf-8?B?MVRUQ0hWRmZ4RkgzcFo0cUp1WjFHdHd1SkR6OUprd3pFNm9NRDRGdFgydDd5?=
 =?utf-8?B?bXFhS21CcDhVTE9qM3ZSVlF4dWFTSzBXcUNrSmxvMlJVRkQ5a3RCSWRKK0Vr?=
 =?utf-8?B?OHhzTjF4RndUR3hJRGU4QjdDY283RGVGYW1aVU5uRU9id3FJemJPL0FkemRu?=
 =?utf-8?B?cXovRDc0VUloVVRFUWpLb0lUQW9MNGxRMFIrQWhSSlFGSWdGajhiUlh3bXRG?=
 =?utf-8?B?VlM5Ull3eXZXZ2xpVzZ6aVR2TFR2eHdPWHpWV1BuNDF2MFR1SjN5V29zTkNO?=
 =?utf-8?B?TUt4dkV1clNGcXZvaFNaUFdoTlUyWmtDMGdhNGliVXphQW1tcTlMUUdhOGJC?=
 =?utf-8?B?ZDVDRW95YUFDZEhqT1FmN0ZsQ3ozekM1aFFydHF3d08xK0prUlJhUDJZYWpJ?=
 =?utf-8?B?K052cUNReFVrb1VRUFdFRmo5QnRBMjFWaVBVNU5uYkM3QmozNmJqTE1MSGN4?=
 =?utf-8?B?Z3RoN2VnTW1IU3d2b1pwanlDaEZKcU5TRHlxODdubUczd2p3ZWRJdWMwNGly?=
 =?utf-8?B?QXFlZjR1UWt0RGcxVU1iQlE0dzFwNkltQkVCTncvNmRtMmZOdzhHWjZJbHhR?=
 =?utf-8?B?YjZMcHZpRVYrL0dzZ0lQYkkwb0NvdXFFYTJteWlQQWFoZ1lYZkpDTnhpUnhP?=
 =?utf-8?B?RDh4dC80R1k0TkNLc2lPN3ZNZkd5bitHYmZUdnlMZTBKK1hTaytxZ2V6YXFY?=
 =?utf-8?B?MEdOZXNQbEVJK1lDYkFodGJIc2JIOGxRaUtGL3A0OC8rN1BIYVpXR3YySExj?=
 =?utf-8?B?a0RERFQzVDRNRjYwOTBkUk5JbFRHL1NWVzk3VGdCVXVmaWlobHQrNnJtczJK?=
 =?utf-8?B?OWV2YnEyeVczeU95cEhQVlU4UWEwb1NDRDFwUms3ZzhoNTFPd2d3QnNDMDg4?=
 =?utf-8?B?VmFhUnA3dWxGM0lEMHlqM1Fycnc3SzJ3U3hTUkJjQVh3TVJjemhTYS81UnZj?=
 =?utf-8?B?eE9GMHhuT0tZKzJZV2g4TGNYTDZ5SU9Xdkhsc1FQcHQxTG9kMFhpV242MUtn?=
 =?utf-8?B?MWRMeWg5MDF6NnZLUnV2eERVQng0V2xTWWdzRmlFSWR2SXdqY0Q0MysyUWpB?=
 =?utf-8?B?MVF2OFgxdSsrdS8rWDRSSDBxV2tGc1ZPdnRxTjQ1bTc1amNIekRRYjVEclVp?=
 =?utf-8?B?SU4wVUt5SUlyTm82U3pCdzJTMG85THZQZDRxbC96T3dlZ0JNTmJLUEMrKzRI?=
 =?utf-8?B?dFlBTlQrRGMzcVJYazJmWGdiYm05MVcya0NmZzRWUThRNWNOaFppSUVFTlRs?=
 =?utf-8?B?OFlXemd0dkpMUlprNk1qZ0Z0aytVeFRZcllubkFMaUtWTGU5dEE4ODRUdENB?=
 =?utf-8?B?RjhydDJBdHVUN3VpUU92T2dtMVQxRG5UYVZocDh6Vnd3bGhmTFNjU0UyRWJh?=
 =?utf-8?B?dHJab0FlSThQVG9ZN3NIU25ocGhXWTRGdzBwWngwNHZaNGcvR2N2dWE4d1dl?=
 =?utf-8?B?TmNDc1RjMG05L0hLN29VdjBCd1BjaVgyMHVaYWpyM2VLdTJ3L1NIbmRHWXdR?=
 =?utf-8?B?S1g2UDk5bTZkY2pETEhTbFI2TmdrTVRTRTBzM0ZWd2M2eC9VdG8zdVl6Mnpz?=
 =?utf-8?B?MVU4eGZodEYxTlhxYVRWQUtoQmxmdFNhUDZCOFc0TW9ZYzJaTkhxcFEzYVN2?=
 =?utf-8?B?UXlDdnhoYjBjdVpnTTRDZ3h6dDl3aTBsdFJyVlR1THlERTRScDhnWmFzWWxS?=
 =?utf-8?B?OHZENGEvdHIyWkxiTHc5UStucUM5TDB0WVdJYlMyRWlicDI1RDFFelQrWkdC?=
 =?utf-8?B?T0ZEcEhmYXpFK0kwWTRFZ3BoT0N3V1hOK1UvaVQ3UVNpb3J5V2lsVkl0Rm9i?=
 =?utf-8?B?TElvcDFOWkpEYURJRTBSOVF4TUorUWpia0syK2xzbWM4V3JQNitGQWRXaXRu?=
 =?utf-8?B?TzRGUnllTVJhQ3NjZWg3Ymt0Z2FNWnRuVTMyRWpTQ3RtQXJoZkNQVi9HY3gw?=
 =?utf-8?B?VTR2emNwZERNakFPV25hWk5FVmdpMmxrR0ZDVElEYmZkbnpVd0d1czltWkxQ?=
 =?utf-8?B?R29xZ01QNlRpVlZNUkJSaEFlWFJ6bUx6VFYxTm1URXhXMnpiem1paTV3UG4v?=
 =?utf-8?B?eHpmcXpERWpTVkJWcWsxZThwWnlCdTM3c2ZuOEpmcHF3bUIwQktmakdaVkdW?=
 =?utf-8?Q?px+qknAXgo8X22GfihCSLaUyOdyTftERqT+PJp+ZJY60?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(7142099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHdQWXkvQXRmZlUvd2VTVWZreUNKK3RLbnRyVGVFZ0VCMHNSVDNuWStua3ZY?=
 =?utf-8?B?NFd6R2htekk2MEpGbzBndnJPWWI5cGNBVUp3QlVtV0NyQXlVWDRMSU1LMnZa?=
 =?utf-8?B?NTZXeDcyL0JBZlUyVW01eC9zV0dBQ2VtMjJjZllBdzE3M3JTWGFQdk83cG4x?=
 =?utf-8?B?MCtuTjBRamZ4RWR0ZldkODZmMU1UTjN3TTZ3L0xCNWtpdFlqeXF5UmlDSkpo?=
 =?utf-8?B?dEpUVkw0cW4wQ1Y1QWpqaU1id1dhZjF0b1FqM1hFYzgyUWZpSXdvQ2tkZ1FL?=
 =?utf-8?B?UlFud2NubFNlN3IxWkdZL1lTUTJ2Wm1rKzRmNnlheXREVFZoLzdsN1FRMk55?=
 =?utf-8?B?Y0NqZk5uRVU5VVF5eWtHUG1odGY3Rm5jdC9yVzVlUkk1dnYrQm1lbFkrUXRR?=
 =?utf-8?B?eXhkSjY0S0JYcE8zNjZ2VWowNmtYdHd4YkR1d0lyTXZ6V28wZ3A2bHl6TVRM?=
 =?utf-8?B?ck9CZGJxZGlNSktxVm8wRlRtSk85T3J4MHMwZ2dtaWFMd1RTNXA0QXJXTHhL?=
 =?utf-8?B?Q1ZBYUR0NnIzZ05PUUR1b1loelIzdHFrUGFDOUpTSy9SL2F5SUNMMWp6aVdk?=
 =?utf-8?B?NC9laEh2VitOYmFWMi9XazQ5THZkNU53REZ6V2t2V2l3NUxzRVhIOVA5dlVm?=
 =?utf-8?B?a0VIbmhOZFFvQk4zWG9uTnJDNGVwNnE2MGtQY1hUc3lJVzlacDhja3hMN1M0?=
 =?utf-8?B?bmpYZldUaHFOaHNsOVBPNGFDUDlQUTA5NU4rMGtHS1RkVllIVndHdGkzRDRY?=
 =?utf-8?B?dkxYYlhHWDRHNWpMcDljWUNjdHU1Y2huYmRRSElZSEdsQW9EdS9LTlhJRGc1?=
 =?utf-8?B?ZmhVRWQwbzVycnJhNW5vUHhON3dsbnRKazRuRVR4cUNvQjNLZ2Q3bGhQeHc4?=
 =?utf-8?B?VFp2ZFdkcFNZTVMwQWhMa0xtUXUvdVlwM2dZeXZLWWVOOEVWODVLVFlYZDcx?=
 =?utf-8?B?QkpNTnRDRlhQeTNwZnBXd0Zwamc0ZFpNYXNoaVc4VS9HaTkzRGd5VDhMVzdB?=
 =?utf-8?B?bkh4Y1VpNSs2TDFuZlcrNHFuaUx5WnQyQnV5TWY5VkVFSFhCaEI4cXpVYzZy?=
 =?utf-8?B?SExPL2xBejdhMjRrbHVDLzJmWHRLR1BuOW93NW8rSWd3eU1IY1lEWTlWcDZD?=
 =?utf-8?B?eVpRTGdJNmZwNXJWZi9OWEt1c21ZbkxCK1E0SUZhamJaUDkvWVFtVFR5MGpz?=
 =?utf-8?B?alFHUkJkKzY2Vk56d3FibnBTQ1JVUHQ4aTdpRFNDcFAyVU5Yd1dmMjhCMm5Z?=
 =?utf-8?B?aUVWclNEMkJuR1lnTWQ1dWJtUU9qOVBITktTc2hmT01Hck1iRlZVNTFKQk02?=
 =?utf-8?B?Q3FkZk83TFpuVVlhYXN6NmtUdHJyL3Q5UmdEcG5TSFFQejEvR0swWm5zRVpq?=
 =?utf-8?B?L1F6WUNid3RLSFNuM3lyaitxbFhzWGwxQnpMN0hDWm0ycEl4OTEwakhvQWk5?=
 =?utf-8?B?UmxkMFd5eGMyTFdrbHM4WldDcG1QTHl2TTdvc2FDc0xYbkRpaEd2Z0dLYk5B?=
 =?utf-8?B?WVpiSlFqTFJXUkhpc0JTUUxMOHM1dmw3M2o2UHdmQnFZTGMxN1Faamp4aG1y?=
 =?utf-8?B?SUUrM1hGdlhtczNSM3JXak9jSXpMNTdDQnFmclNVQk55Q1hrM085MEJhajMz?=
 =?utf-8?B?YUJCQkcwQnoyM21yeHgyOUtNZTVGQ0I4ZytveVUybTlmcVkvaHRyK1hjejJS?=
 =?utf-8?B?NEltTjZSdjZCU0ZBWURlQk1KWHFtSFdUVzBnL085clpmN2JSek9Rd0NMbWJ4?=
 =?utf-8?B?b1JuQXhVMThDS0VNSFoyNDFwNzA5WVErVG90ekVKZ3ZkdXJTZFFTaExBSjl4?=
 =?utf-8?B?K0JJekZXVjAya01QS3EvUHhDcHFGQnptNG1GQmJXdW9rdHpuS0czUnBvRTAy?=
 =?utf-8?B?K2s3Mk5xZFlTTkZGKzRPMk5uU2Q4WHNHdDQveVlDWUl3d2Y2NUpOZjZyNURr?=
 =?utf-8?B?Rlg2cVErWHRPVk9VQWFuN1k3dkNYODJrNFJzcVR6OGZVUWU1M29zYTJJU2xX?=
 =?utf-8?B?TDBsUnFFd3FVczBISEJURDB5Q2FZRVBveTVwbDlLZDFmOW9leklPT3FpdUh0?=
 =?utf-8?B?UVdhZjYyUXUvaC9vZGFlV2VlbngwZGQyR3JFdnN5WmozT3BjNWZRSWJ5Zllm?=
 =?utf-8?B?cmZVNW05S2dXczMxZFg4Z1M5Ti9jOUFNU0QvVEVnQ2RvdmZYOE1OMEtIbUUr?=
 =?utf-8?B?T21ROWlXZ0U0dWpDMTl4QmtGSVZ3Y3B3SEJMeFkyOXplekxKQXpmNWNhYVN1?=
 =?utf-8?B?L3FIenJZU1hRbXZPYkg5aWtyOVNyZUR2cWF2bTJHbDdqWDlWeHE4WFRJa1JY?=
 =?utf-8?Q?COGewrk4Ln65124UkP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf4e3ab-f9f4-4c91-6398-08de694fd75a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 09:27:58.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OuWhHX3D0fLd6XHEl0RlmR6TFTuFykGR/tJ2bvU+2FwdMWl85uDU9MKiEdbx4+s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8737
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_012802_535048_A0F32C22 
X-CRM114-Status: GOOD (  11.45  )
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

Have reserved eDMA2 channels 0 and 1 for V2X fast hash in imx95.dtsi.
So update the dma-channel-mask from 0xc0000000 to 0xc0000003 to mark
channels 0, 1, 30, and 31 as reserved.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
index 808a9fe3ebb2b9557be9e428583e76c32517de08..264703f6eef64813d64fe07713cf92fd02fa0778 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -55,8 +55,11 @@ sound-wm8962 {
 };
 
 &edma2 {
-	/* channels 30 and 31 reserved for FW usage */
-	dma-channel-mask = <0xc0000000>, <0x0>;
+	/*
+	 * channels 0 and 1 reserved for V2X fast hash,
+	 * channels 30 and 31 reserved for FW usage
+	 */
+	dma-channel-mask = <0xc0000003>, <0x0>;
 };
 
 &sai3 {

-- 
2.37.1


