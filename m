Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C70E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2KRd0nJSKE8l7o+zVFcjWw2esmorCsSCXvpaWjzdA0=; b=tsw/646t+vnJkco5wXu7yARhOO
	EJ+FfDaem8joE7JQWfQN7f3jLb92aszXhalXa7jCjZlR6RBQCyLmQkS9MSad4TYYMtmZy06MRsnFc
	tDzqYNUxmExgUE2a1wpKEkfqQZqasC9w+1Qx9aWW5asOAW+BwtmroFsd4Aa+sDU5oN9ddvUOEJJif
	CpMKzwkBxLz9uo8lj7eu8WQY/bYxL5ZlnBfUU5k79LS3r2dr23XfuI5SYPizNsaolgk8iXYjflKdO
	O/8BVa0RqKN5iLb7ggBwU2UmFlKBGJNDZXDMzL4xZ5B5lXmmAOpTiqbvQG823heFJ4PflQR4PUhJF
	z1IivsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2JS-0000000Bxzo-47WO;
	Tue, 10 Dec 2024 15:38:14 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2IL-0000000BxqM-45dF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdlX8pXV+9qQRIFjTteqqfqb7NKXfj1RGCJZQfzKQk6bCMPms+yxqAc6dtLKH0iGHu4Vom8EoFMX2rfnsrewNWyUyhbXLwcTP2yHgaQaAdN4IVJMR9UxsnQjDmvIoJOkXM4P/7iVH6D4G9dLQeXgtCYK8pnXmW8oxnNEWa2+ykotTsstdDF/1VWmQeqU52mlg8MXv36ECCrhNPmP8KPBltNk+Khbb1KtAqJsk8+QTAnyY075FOeZV720W3okCqmS57tsF0y3lrw0f456wZ+iRA3VrhPiI8ZZHxFCmoOcxY3nwyE+e6eEVKEJZiG8XQ2baaTvFURYZ3B24ot+5OqgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2KRd0nJSKE8l7o+zVFcjWw2esmorCsSCXvpaWjzdA0=;
 b=aSs8SZNkFwWSva9359oYDqsdw+2S21LYMmPUhchGeqKNvWjDjlYNvlsmLvRHO0zznuwBcmHzTUuOlD/IaBRXkDbemF8DWENX6roMdK3lkWPRPNG9EPgx/GJKqVbtN5RS0wuao1z6c9NX0Jq8bbQjHhdGShshcG1JUmktL3uyaI0NiXOXpg5koWHyrL/k8CaiP2eV9Xs1JYQWfkVoH+/w7mbLZl8/2p5K4iaYa/lHjGIkHGU36wfnjViLtCtU8rfuFFGwqOfqUBdRvxQ3cWwhUkwOoIuwYnjcVVsvMnpLBu7kSA1/wUcFCPu5SHKQJYss4n8nKuUzzdiPxqjP4iXZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2KRd0nJSKE8l7o+zVFcjWw2esmorCsSCXvpaWjzdA0=;
 b=PLXc57qdV1OGPBFQGbfd1ccwsI1alclsUb/ahYu+kaTTklOz4czYwQ3mhXECBC0ZiT3D1GR6Dqqb+V11lrgoIiZ46QOpM/ZrgXxKglURzVhFVCJh1Kkci2go6pxVNEjSscmkWG65zl9keohkEWf9x84bUB0QOHTN2gUeJWtgdks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU4PR10MB8516.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:560::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.12; Tue, 10 Dec
 2024 15:36:43 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%5]) with mapi id 15.20.8251.008; Tue, 10 Dec 2024
 15:36:42 +0000
Message-ID: <9276fad1-0e3c-4935-a62a-1580af2e0a4b@kontron.de>
Date: Tue, 10 Dec 2024 16:36:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] dt-bindings: regulator: pca9450: Document
 nxp,sd-vsel-fixed-low property for LDO5
To: Conor Dooley <conor@kernel.org>, Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Robin Gong <yibin.gong@nxp.com>, Joy Zou <joy.zou@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241127164337.613915-1-frieder@fris.de>
 <20241127164337.613915-4-frieder@fris.de>
 <20241128-endanger-envy-d1b19f650b38@spud>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20241128-endanger-envy-d1b19f650b38@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU4PR10MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 92058750-4468-4e68-f292-08dd1930725f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ukh2OVMvNThWSlhoQWNESVVQQURZRGU0WFEwelQ0UDJsQVMzc1FRa2xHVVJa?=
 =?utf-8?B?UzBOOEdFMU1sTGs1L05jWWhYRGUzWnVnOU5tekcveTJBMjZJOExYeGl2MXZS?=
 =?utf-8?B?NlpacEVkdWFDQ0lrSW1wSndqMHJidHBEY3dSMURrekkyUjdWVXVIdUtIZTU1?=
 =?utf-8?B?RUo3eGxuRE1oZTlwV3lMOGJRU052ZmJzaHg4MnBjNjAzU28vdGFCckcrY3M1?=
 =?utf-8?B?Vlg2RnJKZk93cTl0TWJYR0lZb05aU0tjMEtUazB3RG16QkZuRXJTR2dJMTlZ?=
 =?utf-8?B?ODZUbGsyUkl5TWg4ZkZhV08zaG5ncXVmNDQxTkVxdEhhSnFYQTZnMEsxMXY3?=
 =?utf-8?B?U0dJNUcxZjhWUFZiRUdYS01BZnphZVV4SW82ZTd4aHhqZHY2cmtPRHoyNmhO?=
 =?utf-8?B?Sm9tVjJCT0ZGOTdCNDFiMmJzcnpXVHRHYmN3d1FOS0p4a00wQklSZ1lWZDU3?=
 =?utf-8?B?ZG1tRnB1SmE0Q0ZmVERGc2JIZXZSVUx2bllwVXhOUklKdXJXelFvblNwYnlP?=
 =?utf-8?B?QWRaS1ZEMS8wM0Y5NVg0MlVndVY4azc5bXE2ZWhPbk9xdThOQ290bkpJaVE2?=
 =?utf-8?B?dXI0TFNBRktUeVhVSEpHWWlUNGhRWk9kZlpTNGVldXRHekJJZG1RbGkrTDJV?=
 =?utf-8?B?c3JKMUhPd2FxRXMxNmkwdVpIUUc1WVNDN0pxVzdGYlhtdWs2REkvaExKemxY?=
 =?utf-8?B?WUErOHR4S3MxMk15VVI2VkVySDNCek9JeHFYZHE2b2F5bS9taDRvZEVldDM4?=
 =?utf-8?B?bm5UV1YzR1I1SzVYWGpKNGVjaXNodms3MWdwS2tuaVVPL3Btd0NQYTdxV3NL?=
 =?utf-8?B?VEE4SWNGZU1FT0dCaTZ5eWNoaG5GeXgrRGxXd05ua3d3cnY0bnFEcmZFMlNB?=
 =?utf-8?B?eDZVNHpid2xqZGVudXhLS2JaQ21HYXM0VXd2dzVRQmZMUEYrMjJDaEZZcVRp?=
 =?utf-8?B?L1pNbEprRSswMi9ZdkJPdURGY0ZtODUwclRqN2pkakMySXROTWFjZ3E3MHhK?=
 =?utf-8?B?cEV0QmZiZHFSRHBOUllTRmFTSHMwdXFyZzYvZmZ1eWVtOUFXL01pLzExZjN1?=
 =?utf-8?B?WXQ1Wktmc3VEMlZra2sxanlpK2dQaWl4b2ZLaEx1S0RBOWI3Ykc0SGlpS01j?=
 =?utf-8?B?bW5YTTFnYkt6aE8yVXpiby9wZ0s4c0l5c2pOVnhiVitldTJwZG9XTytkVWhy?=
 =?utf-8?B?SzVkWE9SY1pIZ1lpNVJDQ0pVaVpadjVIWUxiN0lUcTNsdkZubTBsVkN6YUFp?=
 =?utf-8?B?SDF0aEpyVWI5NkpwelZFc0E0OWoyUENwclMzZmtFMEtLVzBiL2cvMmREZ0dM?=
 =?utf-8?B?T1h5Z2tMbDIwUDQxRTJncVdkbXFJZGh4V3kwN0lFc1NHa2t1M2FDbUxmbVI0?=
 =?utf-8?B?ZVAxYTBvZXNkdW1FVUJBcDliL05iN1ptNE80Yy85UVUwQUdUUnBzeDUvQXZG?=
 =?utf-8?B?c2tVMndPM3drV1R1K3ZGZU9DUlBUSWhRQmlYd0NOUm9XZ2xBOG5kTk8yT2ox?=
 =?utf-8?B?a2MvcmdRNVcvb3phQTJVaUJ2Rm1aV3lOWmdRamNhUWhYK2lCTU5icmxDdFpF?=
 =?utf-8?B?Zm5HK1JieFl0cHk3bFBLQk1NSisycFRHbVRRT1ZjT0I4bWptY2RWdHpyRDZk?=
 =?utf-8?B?WUE3SlZCR2U2Z2VjeE9lMHRpNWE2WmpzQS9tdlkwMXlqOElJTnUrTldwSEhH?=
 =?utf-8?B?L3Z5em1ZcWxleXNISSsybTdlYWgwME9qbzE1UTFSRUVQSUx2L3dYZWtnT1Vm?=
 =?utf-8?B?dFVVOFBMQ0FCdktrWU1Bd05xL1hoNHBacHhMcFFsMll3dUduT3dXbGJWWnNo?=
 =?utf-8?B?c0tYb1RpNnNtUS93T0kxZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0Q5cjJ3ZlgwYVRGSzBCTkxQcDU1WnMzS3FIRTI1WERmQktQYkR6TFBCWXFy?=
 =?utf-8?B?eVpwMmc5SzFDV1ozbGErVDFZUXc0WFZIeFFhYXo3Q3ZhZDNRVGJTRFNlbnoz?=
 =?utf-8?B?NURHRGttd0JTbWQxNDNzK3IwcHRIT3c1R0pjM0VhSjZOcG84REhDSGYxOStO?=
 =?utf-8?B?SU9KSG9XSEdHSDJlRFo4TnhQWTY1ZzQvR1N3VGp0U1ZlSGl6N0FiTHFyb212?=
 =?utf-8?B?cWZCUzg2eFBMSVhuQkVTZmN2L3pkaWFsQWE0YkR3amxHVDNvSGZVZkh3dGpE?=
 =?utf-8?B?WUpmVTRLa01zNEVRbFJGUUZydTl4VVEvOVBWamo1V2Ryd3VjN0grbFJndzRK?=
 =?utf-8?B?Nlk5L1ZVU204WVc5NytLN0huSzZBN3BERzd3VTlKVldVbCtOV2lxQWlSRDln?=
 =?utf-8?B?dm9MRk9VbzhvL3BmTFo4Tm4vNXlqYzdKSVpRbmlKa0IxaW1BVWZwOU5nOGo1?=
 =?utf-8?B?Vm1BZVN3eEtnUTIvTkV4WW8vRXBtMzQvYzIzOU5mVEozdXFKcElMamJLQzgr?=
 =?utf-8?B?cGRLRmYvRmN5V3kxUXllUHFlblVQNjdRVC9KeWpHY20yaHpncm4yVmp0VHVu?=
 =?utf-8?B?SHZkYkR0Zjhya2JlN1JhZzUvZHlkbi9EUjNNN0xSdWZwSFlNalVJV2hUSFVl?=
 =?utf-8?B?Y21BQWNiR0tSYlNZQ0tVbWs5amo5MFdvZnlvQ0piK3RJelpDQ2wySjFJRFRX?=
 =?utf-8?B?cDQ1M1hMeUYzRm9FRGtkS3RRdVNiZjVVM0VrODhGV2JzVmQwVmNFRGZkaEtY?=
 =?utf-8?B?VmdnZ1BoMTNSV005YjRUcUpXYkxTR0pPVXU2c2JsaHZXeHhIR01BZW5MWWFB?=
 =?utf-8?B?ZnIxcHMrN0lqZXJqYXRYL2FzMW96L01haUl2N3pNZ2g2OVd5L0poZW8zbGJJ?=
 =?utf-8?B?S3NBbENGRWd1WHJkV0x1NHJFcTRZdnQweVpiWTFZTkR0RmlwY3BBaDMyMU8x?=
 =?utf-8?B?S1Nac0p6QmNOM0wyRmJ0MEExdmlYR3g5NzhyT291eU8ycUZmdkxGZHJyK0Fo?=
 =?utf-8?B?RStnVHBiajJuRkFVTEtTakxjNEd6enVEZTlad3NEUjJwL0JOc0U5aEo2cDNE?=
 =?utf-8?B?OHlQRlpIaFIvUzJrUHUzOGE1SmlobHN3dVJLMDJZMWxKQzVSUFgrUVh3dzZL?=
 =?utf-8?B?WklpM3phbjUveWZKSVJtRmV6bXFkR3lMQTRFR0l4cmxFQndxOEEyb1YzNjFJ?=
 =?utf-8?B?OTBiL1VNT0E5L0FONEh5RU1NOFkvbzExb2VrYUIzTGxVWTF4SzczSE4zakFY?=
 =?utf-8?B?SklPL2svZ2QxQzduYWY1OE5IU3hlTzdvUWJiRVVac3VtczhsM2NrcTdMWkR0?=
 =?utf-8?B?VWJNQjBjc1Ivc3BtRHZEMUFFS3RYUzB3VXhOdXFCaWdRNnQyVEdjeDRZN3d6?=
 =?utf-8?B?QjhSaWhoWTdCaFJlNyt4VUtVUk5xWlB3SXJnTmpQTzlCUFFtT0xVWGMvSnlC?=
 =?utf-8?B?clJLczhxUzdnT3hNSXhHK1NjdVZIMVhSbTlJK3grMW83b3FQWVhpV3pkQWtZ?=
 =?utf-8?B?TTBTdHE2ck0yNnAyc0RTUkMrRFRkdlIrTzRUU3F0b3RIY3dYeGVreWI3eVhz?=
 =?utf-8?B?ZWZwRTRaa1NYNnFmV0M5Q0lkR1NYR296elBicjhncUlIWHZqZUxqdTBRSHNk?=
 =?utf-8?B?WktRZllNVmFrN2g2SnU0RjF5WTM0QkU2UHYrMXBGV2VRajBBcXRPSXA4T3NI?=
 =?utf-8?B?Ymc1YWxxVVo0NGZ2WkplL1dIWkhlbnJPdDRNWmNuV29DditwajV2d3NJWm5W?=
 =?utf-8?B?Y1F3b3lFN1BZYWZic3ZQTEtjeEQyS1V6ZEUxZFoveC8yczlxQkJlTWpZMHY1?=
 =?utf-8?B?NUgyRGpVMXltakN3QkhDTDQ0VEp6czB5eDhEZ0E3Wmk2Ullsdk4zUVFUMGM1?=
 =?utf-8?B?blE1KzRYdEN0YnJ4TXJrdDd0S0x4bzNaTklKdmFxaHNyWDNaV09jMEhRcEls?=
 =?utf-8?B?QkFISGlNR3V5WDFjMktHd25yVHRXRU1FY0YyNWRZWDcrMzUxS0I0M3ZRMWFN?=
 =?utf-8?B?ekYwdStzbDduekpwMnU2VTZHSFRxdVM0YVRERFBoaVJyVlBCbnVzTEZxK2tk?=
 =?utf-8?B?bENhUkRRN1R0dnNEUEx6dDM2US9QaEdVVXdnbHVjVis0WVlOUU1LeGxsNEZW?=
 =?utf-8?B?dXNidTBmcFQ2cG11T2hKOXVNOXQ3MUJhQWVoQktEclMwZDFDdjkzSEQrcyt3?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 92058750-4468-4e68-f292-08dd1930725f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 15:36:42.5867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFxxxlo2Nk2Ss+5p/MX9PUYSIb9OxvV4P6DSWDcAXtF+ZXop33TsvRtM8N7r1tFb3fP70pvgnAopJVjwPcWMZ227+6qVDULY8LdNgsoBlhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8516
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_073706_007895_F5B5207B 
X-CRM114-Status: GOOD (  23.77  )
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

On 28.11.24 6:33 PM, Conor Dooley wrote:
> On Wed, Nov 27, 2024 at 05:42:19PM +0100, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> This new property can be used for boards which have the SD_VSEL tied
>> to a fixed low level. The voltage of LDO5 is therefore only controlled
>> by writing to the LDO5CTRL_L register.
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>> Changes for v2:
>> * new patch
>> ---
>>  .../bindings/regulator/nxp,pca9450-regulator.yaml           | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
>> index 5d0d684186c96..0e19c54aa5f8a 100644
>> --- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
>> +++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
>> @@ -49,6 +49,12 @@ properties:
>>            Properties for single LDO5 regulator.
>>  
>>          properties:
>> +          nxp,sd-vsel-fixed-low:
>> +            type: boolean
>> +            description:
>> +              Let the driver know that SD_VSEL is hardwired to low level and
>> +              there is no GPIO to get the actual value from.
> 
> Does this mean that if you don't provide the property or a GPIO it is tied
> high or High-Z? If so, please mention it here. More likely, given the
> context of this patch, no gpio and no tied low property means the driver
> should handle things as they used to be - but you should call that out
> in your commit message to be clear.

Providing neither 'sd-vsel-gpios', nor 'nxp,sd-vsel-fixed-low' means the
driver has to assume that SD_VSEL is tied high and it has to use the
LDO5CTRL_H for voltage control.

I will make this more clear in the commit message.

This is the original/current behavior of the driver, though it doesn't
match the actual hardware as all known boards actually have the SD_VSEL
connected to the USDHC_VSELECT (which changes state whenever the USDHC
controller wants to switch IO voltage).

Getting rid of this mismatch is one of the main motivations for this series.

> 
>> +
>>            sd-vsel-gpios:
>>              description:
>>                GPIO that can be used to read the current status of the SD_VSEL
>> -- 
>> 2.46.1
>>


