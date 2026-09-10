Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B9CC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yVxldyvZTGx4Q3S4cAVoBJT2juLGcnn9gHx/l5nq68=; b=yqczX58HV99Kx4SJibBxbAGf7o
	/MWHbevU4We6RXxiO5kNloO8/uFDhw+PEpqUfo8vMKGc+s4OASt64KQ3I5Bsi/L2QtWgad//z+hGk
	hFii2b21W+CzdsvUEv440ob83KZkaUxhuWO750jNGtOaZSdBYqLlTL65vki55DxAFPwfcwfYu6mkL
	UsIvA/yk6u+HqiP6wYITlQjBb4pqtWapT89kbUSjWyD1vehNu3UMyA0In7V53BwEfHCHOzyZ90EeV
	yPvDaBUZDmUjD5V1Wx3jcOtzfIkZsP6CEtm9bG84g4tlbB6r1oqC4aMJQ7Yqu/SBmFMFQG4sIRbXI
	Cq9zScjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yqd-0000000DaR6-00Tz;
	Thu, 10 Sep 2026 07:05:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yqb-0000000DaQu-0TR3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 07:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1yVxldyvZTGx4Q3S4cAVoBJT2juLGcnn9gHx/l5nq68=; b=iUZqiBWiqflRYpy/Dzdm3Lhu0C
	5JPOcJOCTH6OOJMDIBEHj/BUIB/6OCCIz5eJ/U+GZH81k4NG0bzGqVRP/Hk0XRbk7YnexZe/oWv8p
	7oKF3j8lQOopMdxPfQvKfwayisVhwpGEXjlfrlLPi0AauabJdwBjZfZKMFuvypWfLAYfg+T568D8O
	SbJ3A5U1dr0Xnk2eHzovwFa1AnRMr5A6sggG5iK5+sn4k8WYT0g7Ics3q4q41OHGU4iuNix5N3f3I
	BG8vMURwFBEcoX4RR2ieqRRcSsDtPpX0lD+QInw0d44ljOowdcCU5kxlzvrl+CAct1I1nWZtm1Fis
	L2aHeghA==;
Received: from mail-northeuropeazon11021106.outbound.protection.outlook.com ([52.101.65.106] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4YqX-000000026zJ-3RDj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 07:05:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNMY2pvo/Pt6YdrJx79+YySME87CJbbZHZcWngb42fjQ93wQawuucYsn/1OLjQ2h1k2TTcJJ+43eL2shNkFQzh23TZagR+doFQQycP6M5cxFLGGXIUsgeLcaAIDiZTrm7fYrVwhS6Ki/t9LPsjOBqH80zwu/1PKDDRyUFuedxOdBG+swXLhDyqcAT/YqMIEM5SS/W/VHj02a0Mja1vXM//KBM9TZfryYfhI4rdpMt0i7qX4BNvNqa2xyo+QWinE8wkR+OL646wYzDS1B7gk5KGnRanCWMx1GYq70w4u/+UZZQB77CeUDYDrdCip76TghLPAyZsAR1h6IrT+bqRMV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yVxldyvZTGx4Q3S4cAVoBJT2juLGcnn9gHx/l5nq68=;
 b=GX856LTvQ6nDODGc3h5fTEtzC3Kn4Vdc3WmommdyLlokBZr8ncvdCBzbabXrfGFF4T8/w3Z0Ui6EAk+GPSsDawrxiHTNl4SnXl+MV2LRCEBsDNMWUPD4JO7fy4CEZGYe14hzC090zfXTJZTFhUKXWBuinOP7Z+z47rBpzp0YnhVHs0L2CSfXeC1sBPq3XBB4ajAhW5pm33OKDolnXj2r/nF3bq7yxYu2BmgQysDk8rqXV10DDB+Svjq4j0nQTD5AdKs7TqwmYbqD5Sgg9wmmGx7CceBP+CcE2pJKqejUq9cIcvpqsBvsoNh0EEDxTludTOCxtJlZEfSf3jKytrHWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yVxldyvZTGx4Q3S4cAVoBJT2juLGcnn9gHx/l5nq68=;
 b=BSXqPOme1ce0YF8ab5YGmmVBCERR2+xred31WPZe2lUpfmBQxR3+EJwRnfaKNR8GrtJ88ASn7MLNZm1InIq8H/YYg8dz2Y/7u8fcStcNVMOAkyLl1mD40Vgf77JjtP0+lbSpz+RGWTGobKtchxoThTdHh9m29N1BnBW2TjZmckA2zZ8fPnhyTjDy08CB96bCemuYd03XQDmiDTrbjcpLflnliPRMoDZ8kgThhPY7aL8TgoOBjxr7iGbbo+AG5ah8iGFdFq1eEVwsyU3ClqFnCLWx38PzRA2AA9GaK22k1Q7E1fPhc1gDVPUjIOM0ua1tStbqchPUvdoiF0cx4op7qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PA2PR10MB9148.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:420::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 07:05:15 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 07:05:15 +0000
Message-ID: <e3b4c69f-6bfd-4765-b3b1-abf0958b5446@kontron.de>
Date: Thu, 10 Sep 2026 09:05:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] ARM: dts: imx6ul-kontron-bl-common: Replace UART3
 with DIP switch GPIOs
To: Frank Li <Frank.li@oss.nxp.com>, Frieder Schrempf <frieder@fris.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eberhard Stoll <eberhard.stoll@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
 <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-1-4d0e8a75db79@kontron.de>
 <aqGpZQlbFHD_-hVg@SMW015318>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <aqGpZQlbFHD_-hVg@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::7) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PA2PR10MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: b355f547-4026-497e-9d6a-08df0f09dd2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2K7qYe7wlxx8b1uSHl2tteywlLoecK23bfeEdsuuTLqqAmyyDSY4smu6VyP5nI6/juy+wNDYt0KmUJueVzipk9NC6JXasEY7GToktV4RiVVtmXhP3EBvdL68rI8dzufIdTZNaSdeWUrrxkoSYS7nE7Lbj3/YGezFkNO3IbN6BkJAhoZYVfcFSlkyrol9Czy3hJxKctBgBsN34AheN4Za5BuM1YWMe+rRm/M/zOhPvVs3JsxUAgIJKMiXhYL8gGMAhepDwJW0tE21+1QrM/LEOQmuhfxcFCk55EEvsMp0su3TXrNVRQgpVm+Ve/8Ya5Cr2XA1mcMfjOqhtbDTFbk/dbPDL52QTrTSnY6LcawiWWPU5LOBNgjWYDUJ4tabtjP+gTa0LZe7GVBrbdf8RDZ0Ff4eCwe6tZubVh33BBU0bAlI6Qa1Z8OM1hleSqpiajxNh0ZnBwP+xRisY3rk0Z9L+PdiOHgTl80B9cyHQrO2LUjn/y+NX8hpgvqetdbmXAY1e1VCDFWtBoKRzy3j/nL2znKB6/zHthKUkfpfI0WO8kCFdhaK60LENTYUX1Qi6IuNJrg6Gfd6vvW8F/rSZ0ow1aMXLHEDc/D97lTd83O6usyVYlQYJDwC/WXZ3jvEP39oAGwQpsjkXAjkwbksOajqePsbIGaJanUszbV9PIQbviM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekpNZE0ybWhvUEp3elJmTVp2TXRCcFdvb3hQT1h3b09abUtlRnZDSE1yTDhE?=
 =?utf-8?B?M2FNM1V6bkhiL04xSGk5TXB5WC9MUHM2R2FUNmFHTml2NFVrWVl1ZG5aaHBL?=
 =?utf-8?B?WjJWTjNySFJna1A0S3E4dmkxSnhibkViTE5heGNkSFlYMnVTOEdDYmxJbE04?=
 =?utf-8?B?NThJcTF6bWpWeUZDbUNBYVljZDhzeWYzUDN2ek5ZQ0RYa0NjaEZxQVhMLzVt?=
 =?utf-8?B?aFZSSlZwZjc0Z0ltQnU3S21IalJabCsyekFYM1VyTUtlbERhSFZCaTdzWXht?=
 =?utf-8?B?Z1RPYnlFN2tIVTB6NGNldlNiMXQ0U0grbmp1SkNFWWRIVUlGQmlkZVMrcTM1?=
 =?utf-8?B?N29mZXdoKytGYWgxN1lUOXpxTlBSZkpLSkt4dnlhcVgxcjRxSjAwTTNvdlRG?=
 =?utf-8?B?SHBNdE5HU1liWHlaVm0wczhUejhzNnFyN0U0NWpVUGpkWFVmOFVpSjRwN0dF?=
 =?utf-8?B?eEYwYndOQmNlTUY0MkpMT1dycEVPS3BNRUpLbW85ZlJpRnk1bnRaZmc1Rito?=
 =?utf-8?B?QkxVZ2NEclBOazU4V2xDYWlwTHJiQktzZjZ2Tk1xVmNEK25na0xvQk5RcjRH?=
 =?utf-8?B?VEl2RUJ0b01jSEF4VFk0MlhwSE1wbi93QjhPYjZQVWsrcUZRTTdjS3hJczNC?=
 =?utf-8?B?M2hkbFVuenNjRHdhS2JaQk5jRDZ0NzJFQThrUjMwSlBhYU40c1lDUmExeUdu?=
 =?utf-8?B?akw1dzJRY20yK1RnME5jMXQzNVo4RCtlZVVBajFBZTdtZ3l3RUVlT2ptT2U5?=
 =?utf-8?B?ald0TUxJTWMxRlNNT3Y4TERmb1E2TFVTUS9aUzFacDZpbzRkMHRRWFhxL0lY?=
 =?utf-8?B?aXFkU3dmRWRvdlJibHdpcEl2OHdZNnA4Sk4rdXR0QloxSzhNRzhNSU5hNGpX?=
 =?utf-8?B?cjVXQVZPL0VQM3B6bWFkL1NYZ1VZQ3ROeGV2djhPcW5OdTFmdVQzTVVkU1J3?=
 =?utf-8?B?bzAzN0M0K0hMbmlzRm8yc0ZQN3lDQlp2WlM2R1VWK0JqTThmVVlweUxNNWIx?=
 =?utf-8?B?WXMyUk84Q1RxQlM5a1BWWVRZVDhzSjVTYVNvSVQrdVJJU25GZEMyVUR1aWRi?=
 =?utf-8?B?Tm8ydnJVeEtwR1FmSk9ZdVZzd1ZMek9CVjZJSXlpSHM5OVk3eVF6QnkxVCta?=
 =?utf-8?B?bFBtMHFIeElMMm1aZERZbjVsWDhoUC9XK3QzdkR5aGZrbXVQU1BpQ1RMRWl3?=
 =?utf-8?B?cXBjbDFWeTFTdkV4NkFKTFB5anVwVE5ORWtaS2UxUFF0Z3FIRHBVcEJiUElG?=
 =?utf-8?B?Q0pyWkRHQTdiTkNKRFAzbEplUTM1a3Y3WnppQlRJQkdvQmpJV29ua0Q1RXFn?=
 =?utf-8?B?MjJNYk1UYjFGcjBMdzg5Y29ubUNUTVpBcjdmSTRnM0lFekx4djRwMkFiRlBV?=
 =?utf-8?B?TWZESzI0endWRWFmZkVNRGdiUDFZM0t2RzZIOGtoRjJvRmc4RzNyNENNcWw0?=
 =?utf-8?B?cGtKanAxYVZYcnNXRW5wdlV2dTlJV2lBQWloc2tlZ2w0bTNnNHVEUTVVRnF2?=
 =?utf-8?B?Smo0VGVpR3FzaFpPZ0xGTnFScGw5MlZMSklMeWZ3bUk4VGJ5UGRCUUpKY3Zn?=
 =?utf-8?B?VnUyeHdZanhtZkVwUi83RjFuZE5PVzQvc3QxVDl0ZzZLcWhzcU5CdlNwVDVa?=
 =?utf-8?B?QkVCVUc5TW0rTWJVMWdMU1ZrdmtkRFY4VHB5enUxQ3hWU3VLYW5xaTdHb2ZK?=
 =?utf-8?B?RGg5dXR3MGE4SmlPd3JOb2FVTzhuWVNwelAxZzJzeCtxaXZIS3BHTEVjWXYv?=
 =?utf-8?B?QU5NL202OXY4b2d5NVNNUnRlL3VtTldObG9tYVJnWHZZYy96Q1d4L0JYdFVh?=
 =?utf-8?B?MTdqcUxvQ1RzZjlsam1jL0tvS3h1TCs3NnRidU8rR1JraklxRS9ISWd4clEr?=
 =?utf-8?B?amE1TmtNQ05oc2VIcyt1Z0RDa1RmOFJMcTd0bG5ORlFBWXhsdkRSQ3ZVVGVC?=
 =?utf-8?B?djZWZ3p1dmVmT2M1cHFXWnFMeWdNa3JXNVpaWEcxVnk4TEp2S0hHQ2xkaU5n?=
 =?utf-8?B?WmpIVzluQ1Fzdm8zMTRYQkJHS05uQzVLL3NFcjNTVXVjYWc4MjQ0ekhtdzFv?=
 =?utf-8?B?bmJad1N0R3N6SFpveDJmK1R1NTJ1WVAwNlJQQ05RSThyVG42MG5wMHY3cHZ3?=
 =?utf-8?B?dHdWS04rYzFseU5jdUJtV3Q1R3ZUYXF2YVNZSGZzKzZUWndMVEFLclRjZ09L?=
 =?utf-8?B?NE1ZYTlhYnVEMkExL3lGS3NuR28rSmoxUHJZQnhuZDBVYVhMRXV4USs5SEhi?=
 =?utf-8?B?Q0lHQ2lYTm5sNWd5YXFXWThkdTZrekJwK2s4WHVrVDg4SGNtbzk0WHlzYVA1?=
 =?utf-8?B?d3hGSnBnZURTSHE3NDZiRFdRTndQbWRlOFFVZXYxYWdXZXlOUlRVUzBKVDY5?=
 =?utf-8?Q?GGiUoD7TOAimICgI=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b355f547-4026-497e-9d6a-08df0f09dd2f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 07:05:15.1885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5iL0N4yRut6XLDHyvlIeoCw04OA0qi0wi/VGFwFOipMZ9X8my9MnSR06OrX9pNuM7VnjGxoHNAuw9tWYVeI0x/WRqTMNuY3ubJralQ5+tI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_080522_270903_0B5A66EB 
X-CRM114-Status: GOOD (  17.54  )
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

On 09.09.26 20:45, Frank Li wrote:
> On Tue, Sep 08, 2026 at 03:51:48PM +0200, Frieder Schrempf wrote:
>> From: Eberhard Stoll <eberhard.stoll@kontron.de>
>>
>> The latest board revision has DIP switches and lacks UART3 instead.
>> As the old revision has long been deprecated and not maintained
>> anymore, drop the support and reflect the current state of the
>> hardware. As the old revision hasn't been widely used, UART3 was
>> only available through an obscure extension connector and we have
>> carried this patch downstream for years, no users are expected to
>> be affected by this change.
> 
> Remove "we have carried this patch downstream for years".

Ok.

> 
>>
>> Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>  .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi  | 21 +++++----------------
>>  1 file changed, 5 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
>> index f4c45e964daf..a71669bef7d4 100644
>> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
>> @@ -172,13 +172,6 @@ &uart2 {
>>  	status = "okay";
>>  };
>>
>> -&uart3 {
>> -	pinctrl-names = "default";
>> -	pinctrl-0 = <&pinctrl_uart3>;
>> -	uart-has-rtscts;
>> -	status = "okay";
>> -};
>> -
>>  &uart4 {
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&pinctrl_uart4>;
>> @@ -283,6 +276,11 @@ MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x1b0b0	/* DOUT1 */
>>  			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* DIN1 */
>>  			MX6UL_PAD_SNVS_TAMPER1__GPIO5_IO01	0x1b0b0	/* DOUT2 */
>>  			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0	/* DIN2 */
>> +
>> +			MX6UL_PAD_UART3_TX_DATA__GPIO1_IO24	0x1b0b0	/* CAN_ADR0 (DIP sw 1) */
>> +			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* CAN_ADR1 (DIP sw 2) */
>> +			MX6UL_PAD_UART3_CTS_B__GPIO1_IO26	0x1b0b0	/* CAN_ADR2 (DIP sw 3) */
>> +			MX6UL_PAD_UART3_RTS_B__GPIO1_IO27	0x1b0b0	/* CAN_ADR3 (DIP sw 4) */
> 
> supposed header overlay or real user should set it. otherwise, the real
> user set it will be failure because pin conflict.

Sorry, I can't figure out what you are suggesting here.

> 
> Frank
>>  		>;
>>  	};
>>
>> @@ -334,15 +332,6 @@ MX6UL_PAD_NAND_DATA07__UART2_DCE_RTS	0x1b0b1
>>  		>;
>>  	};
>>
>> -	pinctrl_uart3: uart3grp {
>> -		fsl,pins = <
>> -			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
>> -			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b0b1
>> -			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b0b1
>> -			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
>> -		>;
>> -	};
>> -
>>  	pinctrl_uart4: uart4grp {
>>  		fsl,pins = <
>>  			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
>>
>> --
>> 2.55.0
>>
>>


