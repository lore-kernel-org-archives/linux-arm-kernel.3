Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F086DD3E79A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxZtscEuTqTbMSy2LFyAYLBkh5iV4vdDDgrzQ4hEa14=; b=mGvg5ihabiQ+tCHmJElPFObvyU
	qMvYTKRuKiO/2Qd1pEJUvwSkixEf6LFSxa1Qy46JwTBIjCBKlxecVDvHSJ/c8q80jLgvnBrbC0LSN
	qdJiuynEJ5TRpUXmrVFB3G/Y1494l2JjPFnuKQoyCi8f3p+WuxMRftnl534RZwzcnAZtvUwwW0U3B
	MfQBdiF25CSAczH7zBNwosyCUBuL0T7CPkL7U8DxA7/HVVinxFKOgy61TcgwvsqpHkRvOW2ybKK3n
	DvPheT3YKYKBkDDhJSlLvJfOnee8slTB2TaLemTEJfSdR2mqKE2hlNz/gal2jb41Qzgrxzo9D9eva
	rKBpPeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8crg-00000002fF6-1gVe;
	Wed, 06 Nov 2024 10:02:16 +0000
Received: from mail-vi1eur05on20618.outbound.protection.outlook.com ([2a01:111:f403:2613::618] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cOd-00000002Y3f-10VZ;
	Wed, 06 Nov 2024 09:32:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCclS7d4o7tJq/mI/tdesnspy8J2TEl0/8ZRY7R6DHw9wou48g3a5yjHtN7ti8AqnljufpfVgZ9YsP6InDSmLom1p6EA7LWvc5pDdjvZ5vtwjaU4krWIPh05AVW3DCJoJiJ8A6fxVbx8bgVPfutugFO8PlzisQC1reYSR3UUt3t4xngWvjtSYmUzF1yND9V2+M6RhFQtftRbmV3WT8oOPzyKlYd1yvLlKsGLrZAtEdyUub71kCZjGsXwe3BKa9jPjZ+TZUUMnRPR2U2UTIySrog35DSuwYgZNl2dCNHL/QoIMWJoKsuax6zCkBThZd1QcClIEwI4F4sFh+dwaax9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxZtscEuTqTbMSy2LFyAYLBkh5iV4vdDDgrzQ4hEa14=;
 b=lvWt4FTygUqDR7ASVaN7yyuaayyvo+Yp/asSPMsHLIL0pe/PICI8f2sjwvgqT1WCscNnMP59t7vkDVVToOVZMK/VoVbeX05PRUFV2/4m1+rKXnlcXHvWoM1/xnFpbLr9DB/N1ri5dvksu2oPIKI2uW8ht41vmO3A6OxtAc81jjHFfgXAXZ3tHjLk9gGXLPDmlpR3lneqJi1WgEmkeInLU24LGLz6YYbt8bABInRzXIjWCrvjJggT9TZwZr6zxciBKy5XyX1mIxhgdzIPor3k5rO6ezNEmA6rL5CoJOMbZxZ4ZeciIG3iPmuglTtTW1fspTCxMe+T2AJivmezGAHF7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxZtscEuTqTbMSy2LFyAYLBkh5iV4vdDDgrzQ4hEa14=;
 b=XzQY5BQhDa+iTZ0XbewCF1Duwrj7RjqHg2HYBGMWqOE6V7EvBetcMEp8IGUEzmXA7PfMDvBw+4xoA5peMNpa9DKLsI8H/d9geWreYTBXGVPIKUPIro+S5ExqxBwTQLyeQX7WPkanRDMy2QkHYo9Ziio77xSIn+O+4TdgiEzutpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBAPR04MB7221.eurprd04.prod.outlook.com (2603:10a6:10:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 09:32:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 09:32:08 +0000
Message-ID: <f6bb3387-4396-45d4-9cb4-594d58095510@cherry.de>
Date: Wed, 6 Nov 2024 10:32:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add OPP voltage ranges to RK3399
 OP1 SoC dtsi
To: Dragan Simic <dsimic@manjaro.org>, linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alchark@gmail.com
References: <dbee35c002bda99e44f8533623d94f202a60da95.1730881777.git.dsimic@manjaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <dbee35c002bda99e44f8533623d94f202a60da95.1730881777.git.dsimic@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBAPR04MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df8a24c-16fd-4777-80ff-08dcfe45e1f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVIvbWgyS25vYVh6eWx2Y0wvS1lRSGNYR1V2WC94dllRa09xeXFEa1IvbmlS?=
 =?utf-8?B?cnJGeCs5NVp2VUpHSG9kRUdEdEdReVZ1RlkzZ05Ec0lOQnlYN29KY3B2clNj?=
 =?utf-8?B?MFZIbDU4LzBwUDIvTEdvNWNJYVVYeEtRYlpkaGV3NU95TnhoZlhTck9rUWJ1?=
 =?utf-8?B?NEtqczhKK2JTREZBa2hmcXRtVUtBVTFibE53NXVlRjkrM3I0TEdxVGQxKzRh?=
 =?utf-8?B?VmpGOE9kRmpld2xUYVd5MnQzQVM0dzJlUXVkNEpGWVdWL3JVZGxCdWtOM1pD?=
 =?utf-8?B?YzQvKzk0TmtTS3lqOW5Eek5CSS9qZEllbjdLRjVya1YyVktiSGpGM2lXQWZX?=
 =?utf-8?B?UmdGWEY2ZzFtbzdIQXU2bm53WnFLQ0hvWWE1UVBkVjFlcFR5a2M1dzhYc0Zo?=
 =?utf-8?B?QkV2NG9BT25pL21UakdlQmxybzNtWUxYME80MUR1UzF6aWVha2tHRVZmZnJ2?=
 =?utf-8?B?VUNwMXJZaldYRGtrNlJ6WkpLUjA1VkI3K2YzeW9RRGZENDZSZ25pL2tad0lq?=
 =?utf-8?B?L0k1dTRyMzAwUWgrMjZMUU9oczNrQmdKQ2tJSWRhamliRDJISzIwU1pQeUZH?=
 =?utf-8?B?S1ZiQUs0RCtnYUkrR0FzOVd1enJEcmtsUXJHR0hKbGZVaUtYS3NlcWl0MXBi?=
 =?utf-8?B?YVlpNXUwQjlqcStHYlFMdCtIZWNFeFdZZy9SMDEra3pvSnZ1d2d1UzZxdlhE?=
 =?utf-8?B?am15WkZNWVNlODhENTE3OUxpWU1tTjBmMmw0UjF2NHFIQnphbVRHR3owcVpF?=
 =?utf-8?B?enlLYXJHbHVLS3dEbXRWTS8zdnRRSklvUVNIRVljK1pOYW83WkV5Yk54T0Qv?=
 =?utf-8?B?Yll6U1krS0VRdnNaVFFkMzQ2SXdJUmlqVHBtaTVqTnBCM2t5ZW02V2YvUExR?=
 =?utf-8?B?aXM0N2thQ3JlNi9yMUNiQmxJdlluMEZndzRHTkhHMzNzYlVpeHVScmt0Mzlk?=
 =?utf-8?B?clNtR0FjN1FIUlorUFg1dEZWSEU0RWF1dkRCMjZML0IzWSthMC84RTRkMjJo?=
 =?utf-8?B?U3VqWkRZYWtBbVdIcUdrK005NTd3dVl1Mmt6L0NXVTVKenBwUHNmTURGRDRh?=
 =?utf-8?B?czdLMWpydGhlL2lIODNPdUJGUVFtak1ZNHlmcGEvenVJcFNWTUNoTlA4anM4?=
 =?utf-8?B?Z0ovV3Yweld2UHh2QW9uR3pmcmt3M0QvblR3bnA4U3Q5RnZRUUs3VDhYZHRG?=
 =?utf-8?B?ckhyVTdmampTamw5QW9ZNDBGTlYzbnhPOWFCTlo0Q3V1RGd5M1dXUXlJcG9T?=
 =?utf-8?B?TXFJdmwwVmpVSVlGSGlxMDQ5dDh4Q05wY1JOVTdKRUlnb2NDSHIvWFB2ZXVk?=
 =?utf-8?B?djhoaHhKRHV5MmtpVWVBd1k5RFI2Z1lmQlRId0dUWEF4NmNFYzZCOFBmRm4x?=
 =?utf-8?B?SXAram9vSGk1Rnp5blpHK1VCYmwrQmI1VkVMdEV3L09VWkxXSFJ4TkFWdmpF?=
 =?utf-8?B?UTJhek1lUDAvNExhb3hEcFZIMy9oYXdxZUNyVVphREFKU3pLVDEwUHdvR2R1?=
 =?utf-8?B?akJ3OXdvYTh1dFBvVDlPS2ZUbk1sRWdKd2pPSUZPbTh6MmFRUEhJUDNMcTl2?=
 =?utf-8?B?MDBCbXJPL0YzZWc3NnlsTjlnMnczMkRjZmpidGpocXFZRzd4ejYzYjY0blZD?=
 =?utf-8?B?L01EMytRdEZ2MTYvSUR4ak9GUFJmaWpyLytJRlFpa3RVaitWVGRlSE1YWVNa?=
 =?utf-8?Q?X0oVEgdkH4+Dc/zFBxlW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWtuSjJhbmgyT2NvMmFwV1lyT3NSY2JvY01EOXF0cVZnL04rcUY0RURCTElv?=
 =?utf-8?B?OEJRRmN3T1hRSkFyQXJpcldtWnVxQ21BSmlTQ2g4NHgzNTFCLzRLYzFYVUl2?=
 =?utf-8?B?UGhNdUxqUXZOdmJHK0VPUnNjUEVOM3hKNGRWNXNsK1NnMEtWT2NpMktKd21H?=
 =?utf-8?B?MEgzc09MYXFqOHUrR3BGbGgzak5wZDZjckY3dHNKdVp0TFA0RU42Z1NQMzBz?=
 =?utf-8?B?UnRkRC9zb1VwRVRiMlkrb0FBbkdTUkhlNEZPZVAwS0lSRXRzRDNxdW5LdmFL?=
 =?utf-8?B?ZERZUk5VSFJacEhFS2Q0MDJPZzVGVFNDUDFRa0NOVDFDNmlmWTF1QnlwN092?=
 =?utf-8?B?angwekc2ZE9IOHIySk81bmZET1JmVERYUmI2cmI0Sy96SUZVZG1nbHJHb0dl?=
 =?utf-8?B?VExKTnA2SjNJWDVaWTdIL1dvYVlzM1BpZTVldlk0YWZrY0hnUTBtbmJ6dm52?=
 =?utf-8?B?RWthaS9VYmlBcko4UGxtRTdJOWh2UWZCejROSzViZnlZSHd3NjQ2ajRIRS9Y?=
 =?utf-8?B?R3dBdnJBWTNJSE5GdnFBQnJ6R29Qc3BSYWFZVHkyTlVaeE5ZcS9aWU03czE1?=
 =?utf-8?B?c0NmdTBvbmJ1b0tMZnNDTG55eE1jUS9sTmQrNEdJdlMyQWkycmVNYnhxVkRG?=
 =?utf-8?B?WnpPTEZaS2wyOFk3TTFFK0FnSlZDN1lFUGdmeWttSFlPNlNYVmVQRGRtTHNI?=
 =?utf-8?B?ZDlPcEVsZ2dwZUZ0S2cxUDJwQ0o1Qk1UaXdXSk03c09nclllWkNLZ2ZuaS9Z?=
 =?utf-8?B?aUlUOFpUNVAvNjRDTXZmSTQxZitFNnlMakNqVHE5RVFHbjcydjF0RVA4Y0w5?=
 =?utf-8?B?bmIvM2NRZWtDMVNZTVdXVmc3cXRzejc4WjBXRk14TzVCTTg3eWR6SXE3NmRn?=
 =?utf-8?B?Q0dXeUdTWFNldlBOYnRaVHh2d3FyRHVxdiswY2hMU0NHcUdKWWpBNTBQTVFw?=
 =?utf-8?B?TGZ3a0ZOb0VPcGVac1NCTS9lQmgvQXpFbU8yZnEzcDI4OEcrRnVhVUM3MnFW?=
 =?utf-8?B?QVFVUUJwdDBRaXNKbDV6Rjd3Y3Mvemg2ZFFEY2ZqaUZiNXhGdWZZdDZ4eERJ?=
 =?utf-8?B?aGtGeU9IQTZHdklvR2tHV3ZVN1lUeEwra2tyOUpMWjErVWZ1SHE5L0VmYUlJ?=
 =?utf-8?B?dFVtMlFXVGhha1p3RkJHdGJiWjVZV3E1ZS9qa0YyV1VieDc5azZ5cmowWnV4?=
 =?utf-8?B?SHQ1ZTBhU1lKaFRmRmpvaHRJK29BL2tybFdsMW5MUk53UVp3cXdaMVRNVVY0?=
 =?utf-8?B?SFlYb1pxbnRYRG91KzlWQWhFNUVOYVlDNUNzMTFSYVc4RnRLeCs4MGV2ZTlx?=
 =?utf-8?B?TUxCbUp3aVJmV00xUnIvYzdVcVJlVU0zN1BjdjVxamgwSHhvNUdKWUNSNUlB?=
 =?utf-8?B?SGlHWFlqR1BKWG9MZlFacU4rTlRoekQwMCtaNGRkSnNISlJ1MmFPVFh4TGgy?=
 =?utf-8?B?S1BxWGFvanduTUMrMXFnYXlYWllCOEtxd2dzVU1vSE44VG85akZlckpQaXNr?=
 =?utf-8?B?WXdIRkk0WWJES20vWUhjWnFFSFdYd3JEZVB0Z3pjYy9HY1BTSm9uMkR6eG43?=
 =?utf-8?B?TFlXWGR2NkYrVVo4cHFJRmFIeFVVR1M5SVY4OXpISEpwWUlQMVMwei9MazdL?=
 =?utf-8?B?VEdwMGlnRE5uSWVoYWVvdCt4bWtRNzZLT3JGNnhEdE04cmhabHVWMEhZNHN6?=
 =?utf-8?B?UEp0cEFPQWVLUVJvQTNZeFM3K0tNbjRUQkxvalJ1a213anlxMmFJanhneFIw?=
 =?utf-8?B?SGxkazZGaVNDODZKUVlnbnRYTFVDQmZQWkVpQUNoa3RpZ2tvZlRuNEJ2MjQr?=
 =?utf-8?B?WjFjL3IyemRlcEJ4K0RqdDIwUE9wK2hSeVBYNy9HUUlkM3g2TGVOdWF1TzBl?=
 =?utf-8?B?Y3VycW5nTmRUODFtdmZhQm03OUU3TUJ0M25EK24xb2k4VkFwbjVzZVRKa3Y2?=
 =?utf-8?B?ZHpmMG0vRjBaTGlqT2ppM2Q4L3V1YVc0cG5yNnh0dWdmMEc4Zk1vekIxb20w?=
 =?utf-8?B?bS90eTk3dnJmZDVCNDJIMGNNZXNBaUdyOWRBcHR6YTdlcU1qUzBqMXdaSG15?=
 =?utf-8?B?R1hzNzMvUzUzVDBONEpUTzR3TU02ekRXbk9hQ0V5ajdMem1KUHNoWGpZeEZn?=
 =?utf-8?B?SWx3KzVCdUtOaFMzU1pYbFJ5cjZxQVduMW92cW1ReUczRnEzZU5DZGdxeTlN?=
 =?utf-8?Q?DatPMPIoRm3vol+7QpvxsUs=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df8a24c-16fd-4777-80ff-08dcfe45e1f0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 09:32:07.8926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1CQEXIVja9H11LswvnW8J3tAGoBvXbXlIBLCXJ27SeBiUFCJ6eu1YgWqdefB/zqT2xbMJQRNlp3v+QFCaipYEkVyk3UALoSUxzDvoNYUww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_013215_341508_8FC4D432 
X-CRM114-Status: GOOD (  12.60  )
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

Hi Dragan,

On 11/6/24 9:33 AM, Dragan Simic wrote:
> Add support for voltage ranges to the CPU, GPU and DMC OPPs defined in the
> SoC dtsi for Rockchip OP1, as a variant of the Rockchip RK3399.  This may be
> useful if there are any OP1-based boards whose associated voltage regulators
> are unable to deliver the exact voltages; otherwise, it causes no functional
> changes to the resulting OPP voltages at runtime.
> 
> These changes cannot cause stability issues or any kind of damage, because
> it's perfectly safe to use the highest voltage from an OPP group for each OPP
> in the same group.  The only possible negative effect of using higher voltages
> is wasted energy in form of some additionally generated heat.
> 
> Reported-by: Quentin Schulz <quentin.schulz@cherry.de>

Well, I merely highlighted that the voltage was different on OP1 
compared to RK3399 for the 600MHz OPP :)

So... If there's ONE SoC I'm pretty sure is working as expected it's the 
OP1 fitted on the Gru Chromebooks with the ChromiumOS kernel fork 
(though yes, I believe all Gru CB are EoL since August 2023). In the 6.1 
kernel fork, there's also no range: 
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-6.1/arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi

So not sure we need to handle theoretical cases here. Will let 
maintainers decide on that one. FWIW, there are two other OP1 devices, 
the RockPi4A+ and RockPi4B+ which do not change the OPP either.

Cheers,
Quentin

