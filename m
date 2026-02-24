Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3517EF5862
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIJsStau9g4Y/kuzGDk3tMzM3HM6IOiF6ZwIh+Seqhw=; b=FeHgtg5GfarQDRnUhsTjfk0ZEp
	dMocQpQfswCia1pz6dbFLw69KRDLKhBwshLWi1BmDNTCrJ+S71VbPFERtVP7aZ8KLjNqlCb9HaHdx
	0qxYDFLkRrS/TMlCLLl48bj4ck6A5PnQSgFr/aXytP588ubl0rTKtKHE1heqxOGhBgkd+RhEP9wyI
	F3kiiEjR7F35ZHrtidozAKu8X12Pwurxl/da1BDMJiTjCW1tg00LR2kl18PRRssX6ehMS4Uka0ZBY
	2zkdxCcHJ+FdDEf1LECWrEyjc2LJQUGno9hk0H12LKivV2RPj+HOAtUOXSGm/E3XfM4U5p2UyTRil
	DiE5tOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvj6-00000002R1t-2ZGv;
	Tue, 24 Feb 2026 16:57:36 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvj4-00000002R1M-3FLp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 16:57:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpE3H5JB5B7ddxur9eeFhskYdqzhkowREeKpXb16uoe2xl08GcxrUAHdzkQBTiKIchRBUup8yKfD/20yJjPQRQAWfHWt+fqtxl+AIfCNaKV6k91ralfXgzdPTkqh4QnLHjmtAYQ5ObtW0bbyM0tQG5Ji2svFFjZAP8JvA+x8GgWetRJs64uhymuMot3HVrttl8VEJy3PRuB1TciLYAdQJAE0aa+Wka7qw9OZTANNWIfx1PWcphzsxH75pp5D1QtkHOBrtcOu3A09MTtgviSn1Yg3TyiiwbgN5aQA8yMxj8HeIfEaPe90LL5IuKilz1WrLa56VA/wtDnqXmM1CuAaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIJsStau9g4Y/kuzGDk3tMzM3HM6IOiF6ZwIh+Seqhw=;
 b=cyR5ZmRPMkIVKM3APSTTUoYPCOF+xceCxV4sZ9D+bWjPLEP4BLNFB0vYftU7IK3k8+F7RgRWqMSUVM4kKy8n8sisCti9LT+ytQHiO3KdkfhZQAyTifnmed4a9a3H9I4py/lfCLG2VVef8HJ+nEoUDVgJFBe3IkqywkjkWjslbBWIKOoegS+w+ZJUl+zemm6b4GoOXTWgEyQiYi3XF2EB06q2IoYba3KTtylySMQAaEnZcap2ahYHLKxvCZgi2EDaCB3lW1Yprl99HIYUh9KZfrr12L2yFdTyZvySArotDXzD6HyQmQhmYrIK5tFedfIALR5LrRMrzeb6Z2O7gL/Fdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIJsStau9g4Y/kuzGDk3tMzM3HM6IOiF6ZwIh+Seqhw=;
 b=T1tqWPdvnZe1SfpJYCOzfgc0C0oR+DHnkXHDECCZCImRwOcaMyojI0XeUMw92NWfjKMRak/3HSqHGqZTm4nbxa7QXnyCOeDwoz3PN1lGbaze7/TwCu2FYrLIBIqaoj/bfkUvG7sM1Dy7aRRiLr+0CEecMMIAlTzmuCxDBpKUSlr4twZGES6k7UwabLahmnPdpMQOmNpp3YqkDJs7Io5fWl0soio+0O6HwwM4zdU7n5qDV1cJ1BsYE4DUTMdC1l8iKrirmR6sivnQBy6vUlEx4lGO2RKRIdGtwhK1/DWVLKdUlU6MjthHUb1xPMrnn61uFCJXitCXtRmYZx/PA3K9BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DUZPR04MB10061.eurprd04.prod.outlook.com (2603:10a6:10:4df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:57:28 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:57:26 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx943-evk: enable lpuart6 for Bluetooth
Date: Tue, 24 Feb 2026 11:57:11 -0500
Message-ID: <177195221172.2913040.7999267138102333455.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119105215.1238855-1-sherry.sun@nxp.com>
References: <20260119105215.1238855-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR18CA0011.namprd18.prod.outlook.com
 (2603:10b6:806:f3::19) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DUZPR04MB10061:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f85f97b-34e6-46f7-dcc0-08de73c5c9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHErbXFWTkp0QkJpNzVVZFExbDV2UlAvdTBXN1VNRWV6UndVZGowVld5QVBi?=
 =?utf-8?B?VFhIcDBVUTJzZGpDd21NNkhuYnNRT1RWS2dpK2l3cXEwMURSbDMzRUJZVHpL?=
 =?utf-8?B?T0h0b2FjOXBtTk9Jak93Y1ZzWGlRVkxyR21jRFFFY01nWkNabDVEbDRZMXZ1?=
 =?utf-8?B?eVVjZTFIVlVPSWxiRHQ3NjFpb2RiUE9nSm5iTU9VZzdIdndhNTNUOUFsWEQr?=
 =?utf-8?B?VUYrSVAvQWtPd25EZjR6YS9CVld5bjROK1Q1OHpoeGxrcXdNdm42OGFVZmd5?=
 =?utf-8?B?Q3BNZVBuSWtxanFTdG4rWFhCKzdEL3lrWFJYaVpyU3VhZm5PaUtKZWkxbjVv?=
 =?utf-8?B?RGV2OFptdXlteHNEMEdFdDBFSVUyMVl1OHBQRUE1ZUEzNlI1WnI2MnU2K1hX?=
 =?utf-8?B?bWFoZnhyRXJSZitKUHdBTCtMbkFmR25pRFdnTjVmN1JnQlEzWlg1ekNzR0M4?=
 =?utf-8?B?RW9MOFMwMjNDQjI1ZjI5b2t1ZEovTWRtYzVleWorOWduZEE0VWh5TUhNdWlw?=
 =?utf-8?B?NUtZS2NnMWEzMnlqbGNQV0lySmEvQTVQRWI0aTNVNk95TlRsam5NR0VJRldl?=
 =?utf-8?B?TWhJdGwxMDllZ29wWkU4VWNFRnFRRDR0bTM5ODZDWjdRRFdVMDNuak1QOVpy?=
 =?utf-8?B?TUcrZGZ1MEwwWFFIUUZySWE1NUcrRThNUFBxenZjc1lBR0dzc0hRc3lqZVdI?=
 =?utf-8?B?endsOGRzTGx6cW5PZE1YMHpxNjd3UHJHbnhVRTdJb0dOem5JWmJiU2NDSWcy?=
 =?utf-8?B?b3VPQnoyT0xvcVpMeVl0QWxaSEU3V2YzVDdaSmFEV052WGpuL0dlL2krRkNz?=
 =?utf-8?B?SkI1Rk9UckpnM0RoajRXNlZacloxejBQWG05M3lJYlRyT09TcGxGb3kvSmw3?=
 =?utf-8?B?UC83NjVQN0lDMXBxbXBVYkhOQWNnVE5pREV2dUc3MmJNSVY2dE1uWGdUNUVt?=
 =?utf-8?B?bDRCQytVOWh3b2NZMG9NaTdQUC9jQmZOdHRXdmtYTVRkd0NMdGdWM2UvbWFO?=
 =?utf-8?B?VlNaLyt6dnd6aW9GdzJZT3VlaFNjWkFFZFg3b29BRTlFbnJ6RTZWUll6ZWZH?=
 =?utf-8?B?V1V0YjNidjVQaUs2b1ZmdWtyWVpNMDZZSFFueUV6TS9LSXg0UE03RWt4em9a?=
 =?utf-8?B?MjA1UTFDSHoyekQ3bEVySE1aMDBVbXp5dUlJZGRiVTZJajRORDh0WXpwT3lF?=
 =?utf-8?B?cGp5ZzlNcXFPcnh3RnJ3WXNSL0tUWkNGaUkxTjhRVzBGQmJvY2FWKzMwdWwy?=
 =?utf-8?B?REc1blIwbzh2ckFEQVpTeXJzN2pKYU5aZXZvMzBQRG5oR0RSWWptSUthbTIz?=
 =?utf-8?B?akNZdTBaZDF0WUV2Tk9VNkgvTFRDUThLbEZROTNUbk9uK1FWZ09ZdnlnZXpT?=
 =?utf-8?B?V0prcW9pZGtGNUFSVFFNSkFxZE9UQloyOFBtdWdSSkdIaWdJSi8weUFBeVFI?=
 =?utf-8?B?NzRQTWttY0hnVHM5c3dXbWxtbGY4K1JpYmU0OHRoNER2UElZdVBSRk1NcHBy?=
 =?utf-8?B?dG9TT0dRTnZmNG80MzhyWld4bmt4Rmkrc01tWk82RisySzcwRXVTRGJ0RjFP?=
 =?utf-8?B?d0tpTVZmUjRGQ2N2Mmg3dS9lbU01TVhNZW16ckVOZldIVkY2K3J6STZjUEZH?=
 =?utf-8?B?V25YUm81eWsxOU5iWDZtaEpwUUJ1RUZsU3lVUHIyL1hwTWI0cWF2UUErVDRl?=
 =?utf-8?B?OXJITzJaeHRyM0xiaGdsaWppaEhUZ2huczFXNnNwbGhXb1Zya1ExK3ZFbjRh?=
 =?utf-8?B?di9NSnlTMFBPOFR4MFJ1WWgxK0N6K2ZQWWdvamlrVVo5VG54NTBJejlkUTVW?=
 =?utf-8?B?bDZSck0vRHB2SlNCcS8wc3VQSDloS2FCR00zb3I1UFRoOC9DNXdvRm1LU0lk?=
 =?utf-8?B?VnhYbXltOSt1U2ppZk9vdUg1eWdvZ0k0eXpHRlNzdE05Zy9QNDdaZk9WMXpH?=
 =?utf-8?B?elJNTEsrdkc1QVdXK2dJMFJ0ek5sa2U1TDIyamtMTGJVOTEveWFqTUU5VDQ5?=
 =?utf-8?B?ek5QZGR0d3VjK3c3K3FZNG1nZTAzNHIwUC9GUER2NWhPdDJjODhOUTVRQkJC?=
 =?utf-8?B?L2dlZDJoTmRlTnlWOGNhZUJPVVZWcE11VUs3N3VmRnY2MDVFc1Y5VW9BRmF2?=
 =?utf-8?B?ZUZhQlhHdUdqTEEvdGZrQ1NJVldmVDIzNHFscmpqMkVPdk1xN3lTT3gxS3Y3?=
 =?utf-8?Q?GmcgiRbsVnBFry2Q52PGOsU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGxJUmtaWVZ5NG9sU1AzMTF3dWNHbHNIM2JMVXlXcmhhU1UweUtZWXZRaVhP?=
 =?utf-8?B?R2NTQ0ZwVnBGbHlJUW1lWTdiRXk3dGRSSE85d0dVaG50ZG1SOWUwZmRCbDhJ?=
 =?utf-8?B?aklLUEVuS2FTNk8xK0pmRlFkSVFpbTMxU0JUWW1jZjFmRDRPT2ZRQzBkQUJQ?=
 =?utf-8?B?UlorbHdwYmd4ZTJiSXR0L1NXRHhWR3ZJNUFmVWdob1FUcm9NS1BVR1o1TURD?=
 =?utf-8?B?OTB6SHZzOXVxOTNaMSt4UFZWRmZKdFhoVzlsL2E1SWdQODNtOGZjVWs3YSt1?=
 =?utf-8?B?UnQrSW8wL0xtQWU1VEc4YzEwT0loYjdZQTE1VEVyK1ZSRU9mdFplTlp5R1o1?=
 =?utf-8?B?QjZENXcyRXlUU1IwN2tsU0swYUcrRE9ZZytkNjVJQWV0QVdXWEM1cmVvdU42?=
 =?utf-8?B?dUhVQkp2NXkxOFBqby9TUjlMWE53TE9qb3IzVmNBeVFMM0h0YjA1QVVKdWVH?=
 =?utf-8?B?aEFWUENJYkRmUTFGcnd0Q1htZGo0ZzFLcll4VkFNdzdyb0ZFa2ZzRVY1YlU4?=
 =?utf-8?B?N3NQemZONm5yS3lKdHp0Z2lmVXY5b054UHdOcDBseDQrSjlEU2NNVThGZUl5?=
 =?utf-8?B?eEljL1ZsWHI2VzNEK0FkelQxWFk4VjBZVElXdTVid0hQSUVlczRDOW1NS0I5?=
 =?utf-8?B?SCtZN3ZjcGgxNmErVWRiaUQvTEtZRnJpbnFrOG84T21CbUcyRG15Q2hhZ0lK?=
 =?utf-8?B?WUMzV085ZUVoYWRiRGpJRi9RejJFVHVpQksyK1V5cExOdmZHdjRPMThGRnVl?=
 =?utf-8?B?YWtUNUtjV0NONDRUMWdkQjJCVDlERFVkK05TZlNRcE5TWnNYVHorRXV1SmRZ?=
 =?utf-8?B?eGRiSlN4Wm96ODZyVGNJWmhoTjR5QVBUb0kwYURpVmxLTjlMdTAxYVczUFRl?=
 =?utf-8?B?aG81clBnbW9vS3lVd3RySnBOWXRhSlFVeWkvTGg4aE9HeW0raEtVU2JKV1ox?=
 =?utf-8?B?MldNaXdIUldMWEFibmQyV2lNVjgvaFdWTjBqWGpxSDFrdnhQMUxvT00rMGFN?=
 =?utf-8?B?LzNIL2xxY1UzbXl0b2ttVWJGTlRqV1NOWUU1UGNUckdsTkROendVQkRmQk1p?=
 =?utf-8?B?L0FNQm9YUityVjJXL1hGdDVqWlBZaVpnZ2I0d1grVEF2cW1LejNQNWJ4VVUx?=
 =?utf-8?B?ZHhmd1MrOC82VFVyam9JaGV3b0NweTB0RFVlT0E4QjdJcHEyTTFzT2lUV1hm?=
 =?utf-8?B?aC9ienY5MlE3YkRORE1YYU45TTlnaVZBbll3M3hOc3lySERHUW82L0JsQzFD?=
 =?utf-8?B?NTJXeEFMUUcvMm9nRDlybk1VRCtCU0pGUUdBQm1zR2pqbUZWZlZIaEl6UUJw?=
 =?utf-8?B?ZnE4TTdKemE4TVpyaXVxNHJWSjNkaXc5NWs3bHR3M1JGOUlVcXAxa2hPVkQw?=
 =?utf-8?B?dkJwcStoZER1cXI4aUpOdldsZ09wU3R6U3M5eHpuNWMzKzlTNFlRL3hVRGJ5?=
 =?utf-8?B?ZTFySTUyRTV6UTlWRzhWaDAvN3ovQXZqQ3RKN0hIRDhvNmhHTG9lRi9UWFE3?=
 =?utf-8?B?VmRMSTFieUVuZCt2WFpDNUVWSmxIbUUwRGRBMm4zUElobjh3QWliNkZnV1d1?=
 =?utf-8?B?NGljZUJYVkZFdy9IRzFkUmlvSUR2Tkpxb0htN1BvMjcyZVg2M242ZnBkbDVZ?=
 =?utf-8?B?MXkwbWE4dkxtaUIvV0hNZWFxZE1NN084eDF1TFBuQ1pHQ1phbkRETUtGMlVz?=
 =?utf-8?B?NnZVaWFiV0VabHF1enlJbWplV2ZoSkx5Q1BLYlJEY0lLWUl5YXZBM0xnRE42?=
 =?utf-8?B?K052MXRwTDNHaVIyMmU0U015QTBKd05mcFEzNDFYMk5SR2o3ck5zVkhzVEw3?=
 =?utf-8?B?WVdpTm9LMTRDRjZQdERmL1drZUVxVnVrVGZXZFhuei9Wb3poVHFlU2IxbmJF?=
 =?utf-8?B?TXN2cFZrUGpZOGVFQTdZYmpYVW5MWks0NHNwaVU2Q0Z3aWI4WlFyMGNkeVJN?=
 =?utf-8?B?dTRZRXdzYklWaDFodE43SDEydVp5TGtqdmovRWd5NytGeW5KaW1yeTg1Vmpq?=
 =?utf-8?B?WmpUQTkzU2lhajVUZmUvRHdVQnljQ1RJcGd1bUE2dHVTMnBWNnQxd0NwUzlG?=
 =?utf-8?B?RmJ1ZmNKMmJ6MjVCTTdOWHpWSWJaWXg3NEZCUkdNNDFRblAySjhSVDVBOWs4?=
 =?utf-8?B?ZFkvSk9WUG0rTVpkejBSYkhaWmt1dTlkZSs1bVdjc0R3QnlRSlZLVDd6bVE3?=
 =?utf-8?B?RHE1eUxIK1dvQ0hVTVYwZ1hWYXNlOTdpUVNXaXR1cDg0bHN5TU8xTi9zakFx?=
 =?utf-8?B?NmpuZW1ZYlpMM2VIT0JPeFFhNHJoN1N6RkNDWmovR1lLc0ordkFTR1dMbGpJ?=
 =?utf-8?Q?GakksNhuloDoBctt5h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f85f97b-34e6-46f7-dcc0-08de73c5c9fe
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:57:26.9183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miyUrRuWcMXhngG5nmZnaCG7pnIrKKlZnWSOjPmZk/Rnr0hz98iP5giyMLc4I8K7J2NaseZvw8By7bU53gRskQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_085734_809471_701E12BC 
X-CRM114-Status: UNSURE (   7.59  )
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


On Mon, 19 Jan 2026 18:52:15 +0800, Sherry Sun wrote:
> Enable lpuart6 for Bluetooth support.
>
>

Applied, thanks!

[1/1] arm64: dts: imx943-evk: enable lpuart6 for Bluetooth

Best regards,
--
Frank Li <Frank.Li@nxp.com>

