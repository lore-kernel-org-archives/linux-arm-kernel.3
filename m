Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DE7D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 02:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMKoLdIIzTeeyB7x3vX2pTswlywQkTkH+IwHephPAyY=; b=1ZZ1HF694C7CxeCyt0aaqD7qc8
	sE3tH314ovooRmsFD4sJz2p4brIQ9KE89pogddj8IFz5Nctu87bLe0iICBo30XPZwZyvDJdaG++CI
	hPJmjZmXRIkRLqoqKf+YQTGRllPUbdksA/mNrYcHiJMqJC+V4Jn8Vgi1tZImGL8E+NRstqMYcEuIk
	4NCh9LL48gVGlz9b4cYJSFQC+oeukS+oSzMQ9L/Qzvt0Wh57RpGSkDg3SoPb3l4YweiCqk3BBdwso
	iPjcTDtaiFpb9hMmAnUCq4EsmQvCrUQBRfwqQ+WNmiVtwWzVQVTzozbw+UN9cMq84E2nHyxRB1j7Z
	FEygrXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUySS-00000002x1N-0AKy;
	Mon, 15 Dec 2025 02:37:08 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUySP-00000002x0y-3j8l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 02:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXyDKFIuIKBkoFGzIRjTwoi802TXbHV3cJLmpMwcEQMtNfdy3fsmXxiEZH0srDaPBWDm0DeElOUjtY1iP0jjlGusd/ZjJh5D+xr1kYtB2rbm1SDXYCFaV8sjVycfgg0Y+w2p33DALE9Wdi4MR1ifxeYj5w5FfOsU8o2EjM/TZsjgDOv8OuGxY0NMxbmppuXEyozHAiYiLiMi303VMhRSnCXiAMi0hb5TRPspTyzXJfPAbK6HWelln7Tu/QIm4X8YSpNX+vzjVahvFo7UCzyqSQ6q7yvLDyLLU0BtnTVoUDhEDx/Kn2TxgMhoMbFVPq06DvsGe/fi9JrN1t/ASaNtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMKoLdIIzTeeyB7x3vX2pTswlywQkTkH+IwHephPAyY=;
 b=IXgavwZdbqPNf/KHWMe/gaccs/cY4CvzCYZeUQb6/VYmxpGBUBcGOcNQhv4apKBzF4yipDpWKpEYBGhdFl37qBf/DGM0/aGl53WvM7fjXbnTERRFEd1xmC0EuCNj1dEK55FMCs+AVHjL9Jp3mlciAwoo/ynGXc4uakUJnw+39fhVtNEHyCb39EbRxcXKytvboPU9yVojreeOncIpI9ar14epwApyJdtDhIduRhJ8d/NXEn5I4/WCJTaAFZ8OMymt49c4zaU4GXrm37Gng7pMP4SibLFhgJ2Zs6u3jYw+YxxEe1wYHbHNF+QJ/G40gEESmgb66eW+7xPVIWEAKKuAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMKoLdIIzTeeyB7x3vX2pTswlywQkTkH+IwHephPAyY=;
 b=ossL5U7gz6OBa0Z6gOC+krhRySfLLxx+7AJhHFJDHILgMnQiKUzs/kI+zpdxMKUzqzLA6OJZSYfTIAOJ+hmnBxmMOvC9SjdoagCfYUYWyr1cXP6fg4sZLhFDlUznvblE14f/Kv+7R8MqlUtLH17ATwnyLkUOT9+K0eowRxKh2Zt/I6k2hdezoOsRZQKFG66yPQt03I90Dfu76/e5VfwRi8tHljMB/JxKfcjRbHuJu5bfMcJaKsEmX1ijTT5D0G0kacRzG2XMyCU+mRlAusEdLgwQP/WHUOeOMasvs1O065/3i3AVZ9CNQSiZAiFPSITv3DWmIfabizEP/nvGpu6liw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by VI1PR04MB6960.eurprd04.prod.outlook.com (2603:10a6:803:12d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 02:36:59 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 02:36:59 +0000
Message-ID: <6cd03c93-1a6d-4766-86e2-1a74d49c4789@oss.nxp.com>
Date: Mon, 15 Dec 2025 10:36:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add FRDM i.MX 91 Development board support
To: Francesco Valla <francesco@valla.it>, Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Justin Jiang <justin.jiang@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Tom Zheng <haidong.zheng@nxp.com>, Steven Yang <steven.yang@nxp.com>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
 <aT18yj7c27_buJSe@bywater>
Content-Language: en-US
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
In-Reply-To: <aT18yj7c27_buJSe@bywater>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|VI1PR04MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: 68953e4f-d06e-447a-4b5c-08de3b82d228
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW5MRnlNZzFaTjVFRHF1YkY0NTNzdlRPSUREYlcrcmhsWERNVHFwRGpobUYx?=
 =?utf-8?B?T3RzSlhxRWpRMVpoZjBxdW8xaHQrTFFDSWhFWTVvTjJwZkUzSFByYnllckl0?=
 =?utf-8?B?eXpZSld1akRpbEF2UWplM25vWG9aR2R4Z0JnSGhyZ25CT2xMUjY2a2V4bDRE?=
 =?utf-8?B?dmNTVnlQZDA1N0ZvdDVFbXhiRGRFRlhDNDhMZjIxQmxOblBKVWhlRE56MXpz?=
 =?utf-8?B?c01GWEptNFRCWlBhbFlHd0tXMDNLWUpNeXR3ZkYzdHowc3hBWUNxMmNJY2VW?=
 =?utf-8?B?S0J4YmREMW11ZUFPU1Jnd2tuVTYwN0tNazRDM3FQRHF5cnhXRE5odThHSG1u?=
 =?utf-8?B?c2VUN3kwWnZwbzVldDVvVU84ZFF2cHVrWlN2c0hyUzByd3J2WTZocHZseXc0?=
 =?utf-8?B?R0NyVTNpTkt2OXpHY0JSajI4THdxZWw5cm9wZnZ1Z2dndDkza1pMZ1BVWXZI?=
 =?utf-8?B?c0lkZVdxWWJ2VXpSTUJsTjlrYjNYMU1IeHE1dW9MSVdWNDRvR2dncC9mQmxH?=
 =?utf-8?B?QXpBMWlkZ3pGc25Pc1VsWm95T2ZxbTZkMjMxRllKbS93VjhnNzhEQ1FuOHVF?=
 =?utf-8?B?dFJhbmNUNHBIdTJMSW9lOXljRjhQMjc2dGJKK0lQcGlHWVcvYmlycU0yaWVV?=
 =?utf-8?B?NmpaOURGSHZ4Z2FPNTZBVkp5cWU0Qkx2T2xQSldBaUlSSm9nOVMrTGlLR2x1?=
 =?utf-8?B?VzM0Z0xranA2aHUxYUhrN1NoUEhWZ25KbjRQa1ArY21EZ005ZkxhTHRNWHEy?=
 =?utf-8?B?YmVxL0tkdDFXVjV4ZStRaWozUzVoNEVUeWgya0ZXMHhmY2Y5NWdEMGNyNGF6?=
 =?utf-8?B?R3BteFppays3VmE2MFY5VUVWNGNwZDhjYVF4RWQ2QUlPdTd6REc2YllLS0hJ?=
 =?utf-8?B?cHhrSEF4Y2FKaXZuYTQwaFNCWkpVN2JtaVY4RUw3bWRGcFZuTzVWdXBqbWpT?=
 =?utf-8?B?ZEJSTnQvYm9wV055cTk4QmI2Sys4L1dmbEM2YUNVUzA5Nk5qUnB0Zkd1TGtM?=
 =?utf-8?B?N0ZFTFFobkdHR1prMHlWMENYSVVWenhxTnZ2TWxVNUNBN0dEeVNnNlU0QURu?=
 =?utf-8?B?cjhZZVY1aEc5Q3RtK3Q1REk0SmtHMDUxbjFDNmhpVTQ2RXorYW94OG82YU1m?=
 =?utf-8?B?M00vQzVqS0c1eFloYXIwNHRvZldWaWkwZlpKbHJqSTNpenk1eTRtR292bGZI?=
 =?utf-8?B?eUx6K3E0c1dGbTRORTB3SU5xOC9wM255V2lEZXpaQm05dTdQeFRLays0WHhP?=
 =?utf-8?B?NE04MlpXcE1RQUtGNnVnSEhieUI0WXF3WXIvWVZKb2FVWjBuc0Z1Z3VocmlI?=
 =?utf-8?B?Z0VLanNLclp2dURRNGZLTGwvempJa0sza05aZVZxOGJnalpVRjE0V0I0dDRN?=
 =?utf-8?B?UkR3dDIxSmp1R3hmbzhseHVKS3pvYWljZWlLaWNuN0M3Rk15YUlibzVtZ21N?=
 =?utf-8?B?a3Jkbkk2MzlBajJQc2xEamhzcklGc3FRM0o1a3RMWGFBVFlzNTFSOFY1dm9E?=
 =?utf-8?B?eFBhclFXdnhaQU1vcitxM1grNyt4eERZK0VBajcvYTVJbEQyajJnd2ZYU3BS?=
 =?utf-8?B?TmNIc2NWWFAvS09YZzNWdkZiN3RXdFlyUCtCeWtHQWVnVHd6ZXljb09HZllk?=
 =?utf-8?B?a1ozNGV2SlJSeFRjcXBJTENLRTZ2Y3E3VldOc2dEb2R6VGtTaldBRTNlOUs1?=
 =?utf-8?B?d3NabjhlNDF0azU4eG9XTFNkTE91dlN1alJyUXpPMmhMRFhZRmgzcDV4NStT?=
 =?utf-8?B?WEsrVlBINFFCOEYrUHo4ME5BWlJmM1RRK05vTWtwYjl4YnJpNVlRSkhCb1ZK?=
 =?utf-8?B?T2VOQmVaZk9xNnNWaDA0VXhYdHp4U0ovTUtvOFpsakd6cUdhZjZZNUhqcnZY?=
 =?utf-8?B?M3JNcnl0L1VDaDdLWXUweXcvdjdRRG5Zck5sdGQwOG5nQUZncE16TGF3dVVO?=
 =?utf-8?B?VWdtdnMrRFd2NzFFdU9nbGZWTGtBMkwwdUUvWlhodTZCeWNXK1h3ZkorUWlB?=
 =?utf-8?B?ZWlRQXdnYXFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THF5UEJRdVhINnlDcU1vQWJWQlBkT21aVVpzRUZGbXpzOXE1YUZWLy96RVFy?=
 =?utf-8?B?dnBKbjhtditQM3VNcHZaRGFIL0RobStISkxmSUlXWHoyTGNnMmhvTzhTK1ZT?=
 =?utf-8?B?aFY0VEw4YnBXQmRMYmk2Y0xWR1F3RXFzcjhCUkxma2dwVExaRk91RGVhN0pR?=
 =?utf-8?B?Unprdld6S3FiL2p5Y3dXS0FLTXNxMThCTWdGUFRGMlB2VUt1cXovbWR5bWJC?=
 =?utf-8?B?eUd4eEw0QVBpYzl0VTNyZkZIL3JDNDB1YVRNRFBXbEc3SDVLZWFWejVDbzJ1?=
 =?utf-8?B?dGhhL05xbGdYQVFRaktOSmJZbVVaeHJOZFFSQlZEb3ZYa3FRdGNQdGt1NmJR?=
 =?utf-8?B?WDNLTHlTQkdUdVdmK2VTMG1UaW5jcUY1MjhEUVgrbWkwdjF4VXgxaWFEMVZ4?=
 =?utf-8?B?ZUgzTW5rdllNVVRCTWY5d1JzWEpHWGZwZFNQelVFa3dhYmdldHRLZHI4YzB0?=
 =?utf-8?B?OUcxbVlyR0E3aTQxeXdpdnJDY0pMcVhjSW5vNHBsTTNwSGdIUGdoR0N1TUI2?=
 =?utf-8?B?Q0ZDSnN5MGFleW0vckkzSjljRW9KS2ZJeDVhL1dOZi8rRHhyM0cyM1Izdld1?=
 =?utf-8?B?dkJISXk2dStIWEZxTCtLdHdBaGkrVFAwZUVXa0o4bEdsRkRZWmIxWEJpeWtv?=
 =?utf-8?B?TkVMUWEvSmdIVnFPRTlCcVhjSm9kbm9ZM1FCNjhMeFhwOFZiVEcwaWp1Yktv?=
 =?utf-8?B?M2NWSTBFdk40V0g1ckQ3cEVsTEx2YmpxSzRoVENxM3BuQzlnNHh2dk80UGpj?=
 =?utf-8?B?YTMxYVQzMlVIZFpCNmxIbXU4bTBoZUN2UzA0RmtReWZEdkNqQ2JSSVh2d3Ns?=
 =?utf-8?B?blBGdkt2ZzQ4K2FXbkF0RHFqMTE4YThYdmlCM1hGYXZRbjU4anFwNEFjaGxW?=
 =?utf-8?B?SEpkY05WQ1hzY1hQWk5SNGdEUHE1ZXhKWlMyR2ExL2phaERmUTErTlZKNHJk?=
 =?utf-8?B?UUliaCtqbnhPeGJObUpiamJmZEtGczVTR1JCZXlWYXdRaXc3QVFBVUtKc3U3?=
 =?utf-8?B?NkhuYldFdE52dHJmZnVkUnROYjFPOVVpZkIxdExqa243aG1IVHVjVThUcnQz?=
 =?utf-8?B?WjV1ckZnM20yb2VIbDBmeFh6MmtwN0NsamNyRDFYZXpEK254Z3ZzT21DZGNt?=
 =?utf-8?B?ampwemZ3WTJRdE9udTl6YUFOQzFac2pJYWdZanRZLzF4ODlyOUpxSnpramo5?=
 =?utf-8?B?NUtSckdreHplRmtDUzZqbURMa3N6cTBRUmN2WDl1S28xdVBBWTJRODVBa1FY?=
 =?utf-8?B?VVJDMUk1ZU1GRGlIQjU5MEwvUmYxVDVoenM4RnFkWHBlZW9oMjZTSDdKUk9B?=
 =?utf-8?B?SlNITnVFT2pOdzM1NjJqWUh4SUpVTUxSVTVPcE5TZVBVOG9URUlqQVFROEZn?=
 =?utf-8?B?VnBOS2dYUWZRcFlZTnVLM0NxSURPU1Vxb3E0R0tUMHVlaWJXZEh2ajVEdTIw?=
 =?utf-8?B?K2FhQnJYUzhHN3BYT2xNYVoxY2xuWVNrTmVtZHBldHU3VXBVWkVwTmprM3RV?=
 =?utf-8?B?SlJ3VW9ic2pOd2l5bkJqZW9Vak5DTDJSYzNvWm5FT0dJSlErSDZKOENiNm5x?=
 =?utf-8?B?VitZeWVYN3ZtV05RTG95NzZEa3FkSlJBZVdXWHczMGdDWWc3R1JvMjFqRHdZ?=
 =?utf-8?B?c084U3Bwbi8zVEw0ampUbGdSbGZWcEROeUQyc1A0N1lGenJnQ0Npd0FDcHVK?=
 =?utf-8?B?N1ArN05SaHVadDJKRWxyaU8waCsyeFV3TEZLcS9QdUNVbVlFNUpZallWdDhn?=
 =?utf-8?B?b2gyY1VJRnZxRXdscVN3SGYrUHQ5QTg4MDFvTnNaQkVHZzVQY1Z0TWhISWth?=
 =?utf-8?B?dVd2WU5ra0c2V3lHSmlhbGhiU3hYSEdQayt5cGVYTk40V1B2K3dVWmZ1Q3VO?=
 =?utf-8?B?NHR0bys4aXRuMzJ6SUFiQkt6cXZSSUVyMzEzZ2gxYXB1QUdzcnVzNE5ZTHB6?=
 =?utf-8?B?cjIybGFkc1ZPeUdlVXJvaFdUZVQxOXlGV3FucmtOM1Exd1M2clgzMmJSOFlw?=
 =?utf-8?B?cFo4VnlvbmErN2JUdnE2a0oxK001VVRpTmpBUFFUdTllR01aaXlaTlZnVzhx?=
 =?utf-8?B?VGdqUytjOW1oSDh2YUlUYUdIVTJHNkRRdnJKdnBZOFpHSUh1ZTVkSmFPN04z?=
 =?utf-8?Q?ALVGe4lXbbD/5U4ZwPaZjMz56?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68953e4f-d06e-447a-4b5c-08de3b82d228
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 02:36:59.3671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVGwvEiaUrLztULJNTRMva8tD6UaSVLGET+vznhcy4+AWOBdnePwzk7OzUF+3oftCFLi3CUmHEuPVrwFEX+ALg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_183705_942015_741C3350 
X-CRM114-Status: GOOD (  16.62  )
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



On 12/13/2025 10:48 PM, Francesco Valla wrote:
> On Fri, Dec 12, 2025 at 11:31:32AM +0900, Joseph Guo wrote:
>> FRDM-IMX91 board is a low cost development platform based on i.MX91 SoC:
>> https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
>>
>> Add device tree and dt-binding for FRDM-IMX91.
>>
>> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
>> ---
>> Changes in v2:
>> - rename compatible 'frdm-imx91' to 'imx91-11x11-frdm'
>> - rename 'sw-keys' to 'gpio-keys'
>> - rename 'user_btn' to 'button-k'
>> - drop lpspi3 node
>> - rename iomuxc 'grpsleep' to 'sleepgrp'
>> - move dt-binding patch before the dts patch
>> - add board page link in cover letter
>> - use CAN PHY to manage the stby gpio of flexcan2
>> - drop realtek property
>> - add pcf2131 aliase
>> - add bootph- property for nodes should be kept in bootloader phase
>> - add reset-gpio and assert for eqos and fec
>> - delete unused alias
>> - Link to v1: https://lore.kernel.org/r/20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com
>>
>> ---
>> Joseph Guo (2):
>>        dt-bindings: arm: imx Add FRDM-IMX91 board
>>        arm64: dts: freescale: Add FRDM-IMX91 basic support
>>
>>   Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
>>   arch/arm64/boot/dts/freescale/Makefile             |   1 +
>>   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 904 +++++++++++++++++++++
>>   3 files changed, 906 insertions(+)
>> ---
>> base-commit: 73f1e611b076de705c2f1c26cfdfc5b8e96f4733
>> change-id: 20251114-imx91_frdm-add2b2c07e78
>>
>> Best regards,
>> -- 
>> Joseph Guo <qijian.guo@nxp.com>
>>
>>
> 
> Everything is in good shape, the only non-working thing is button-k3
> (but that was expected, as a small hardware modification is required
> to reroute the phisical button from system reset to user function).
> Not a real issue, at least from my point of view.
> 
> Reviewed-by: Francesco Valla <francesco@valla.it>
> Tested-by: Francesco Valla <francesco@valla.it>
> 

Hi Francesco,

Thank you for your review and test.

Regards,
Joseph

> 
> Regards,
> Francesco
> 


