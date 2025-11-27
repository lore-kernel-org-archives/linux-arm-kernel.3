Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98B4D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ39ofMa8MhTZXs17kpz1A7DljYWWuD2BuUAJsrmUM8=; b=yrBURfTuCdiPyVFeiniBuPvZGa
	CBaAZ7d37sR7LO0TihE8JeSTrYMXj9SRY6yzMpjz712CYfzA3f2useW/E4wYGdNnCc1/LQamf1x3D
	7CiUAr7sjCAtYSnQkB6e35aOaMsgni/vMuwS40PWmnRoGbqTArYWjtPuPSTJYplRAk8/HX+MGx8KX
	cmBk4PtWzt317qOkFPeVS5bDV9YCZTdHvxX9NjFVcpwkaN7QdRM2iyk4qF54y4UAIRzDmgYanEhLt
	+Wwh/LoNUq+ineBt45dwU/kk06Sc7e+O7TCi9csnG04mo9+ik2lOUcAAlvsDGCRWXPKfn8ucuXFH4
	UoELFz1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc4a-0000000GgPi-0fs3;
	Thu, 27 Nov 2025 13:30:12 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc4Q-0000000GgKI-2JVD;
	Thu, 27 Nov 2025 13:30:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/ZIQfabgSAE3dE4LAj+D2qefV+g5rfMgY758C6OyhtPr8+jijDczNnpF088W+4Z+dIhcVOKNxKTliNCUsHpI8D4d/pO6Fk1e+LakSzCkLXzRXQguAt9Y9JHIuoQevpS2yArgTSbdXZDkeI9NUyMx+2Fnv8m5+ZktynDvxgIq6giu5jH87A6lHlnBhLBjH5ZC1hoDxrU/eKVQYvJ6QAE7PRoaakW0+8TnZpBo5chi5+HK/BzAWYYybtQ9ZpVj/5q4jpYAQoVcbLRsTZT0uv46TjB+CdTmzyJiOe3ih+0lgihfeBq6RaN9O8I6d+Z08hTv0m6+IXEQSDN51AC5fR4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ39ofMa8MhTZXs17kpz1A7DljYWWuD2BuUAJsrmUM8=;
 b=Yvymrfva2pJjk8V1Fjt1rJJ/6GFVxSro/JZVRJJETq1sEX8++qkO9/qymogICzM9SsTIKtCZHQPCu5ah/R3XeoL1g3fKVqWxn14SMcYe/Cv5r5vuXOnp2X+1s2X44MAh74u1IsqbuZIc9tbZAgoSawGxKLQFgpfus0mvKVUPJ9DMI2rpLOOLP832nOWidEMzclF6sYL4iG4jTPr1sA06jJTntIAtUsslj5qK6p7QcqB7g6XqDpHNsKh47BKzKUxP0CbHOx4gJbrChqOa+EYNR58/UdCBNDFpgoxFXOEt5JAMZbHX2Y6qo9YiMlb0bQP/8JhhaptCpeM1tsmfddR0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZ39ofMa8MhTZXs17kpz1A7DljYWWuD2BuUAJsrmUM8=;
 b=m72ZuD/qkWUIW64onE1ntiS927GlRUOWnQbZ6j1naf8X0LoPQvNU8ExClXRY6etJ0zzoS6y8y7W56cnELWp667rd41mAXyzFXmWpZDoEzrK489/Ys/zXsqoV5bqssyW5J59G4wGIyTzQnXieXt3v2iEL+nhbpPRsVbQNA5VFVKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10117.eurprd04.prod.outlook.com (2603:10a6:102:454::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 13:29:49 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 13:29:48 +0000
Message-ID: <3d9ef351-9eb9-41b1-beff-7a1deb73927b@cherry.de>
Date: Thu, 27 Nov 2025 14:28:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: enable NPU on rk3588-jaguar
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250812085213.1071106-1-heiko@sntech.de>
 <20250812085213.1071106-2-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250812085213.1071106-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0027.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10117:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c8e058-9812-479b-56eb-08de2db90999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkZ1RVZJbWZ0dlpVTk12TnFTcXRlZVJGeklkeDMxZ2o0Umg1c0YvV2czSG1x?=
 =?utf-8?B?MWVnQmIxOE55d2hoaEdaRXlvWUNlU2d2K1pxT0dROW1WeGxvSmI3cXQ3MVlK?=
 =?utf-8?B?R0NXZGpiNUl2cytOczBNUENFZWsvQkhDMUpVRzVXRVJWNGdHK0FQTy9OZURX?=
 =?utf-8?B?Vi8yWG9ycWgzcU4vaUNYcXQxdzR5eHJoaUdFblZYNzlRL2tTd0tUcjZjS09E?=
 =?utf-8?B?U0xSRSsrc3lnT2RCNUp2ZVQ0VkZYQ1h0OUVaWS92WW5Kb0VZTnBBVU5jbFkr?=
 =?utf-8?B?TWVjd3hMbFVFd05rRUh0MjFpcmVaS0x1aEdXS3QvYmMzWDAzZ2gvQnBtb3Jx?=
 =?utf-8?B?SVllOVYwQzZDdGZSYkxrYnBKazZ6YW50OUdIR3dWb0JjUTArbjdWV3RMZVVu?=
 =?utf-8?B?SUpaUWhKZVkzRnNtbjExenJ3cTQvYTBEay8zcEg1S1ZOcllZZURyRXVEYlpv?=
 =?utf-8?B?ZTl1T0J5S29TSm5TNExzYW1JQVNEUWtBRmJBUERFY1BhM3h2cE9PSUVva0xk?=
 =?utf-8?B?Wjh1anB0cXBvaVFFSDVrekR1NmhIeDI3MTRzdlRKQjl1UUZQbERnL0RXaTZ2?=
 =?utf-8?B?cEtKM21jWkxzM2dXdXlxaUY1WnZqRzFPMVhDcCtCWjNKSkNoMml4eDRyMFgz?=
 =?utf-8?B?Y1JaNGtWdGJuMkRCSVg1MXpTWU9wajhtMlN3Q0V1UEJJdnh0ajRIa0daMzhE?=
 =?utf-8?B?NTN1cWRFSWtiYjlzY1BZcUdBTzdiT3ZHUmluUEZGWEFCWDdOOGM1TWY5MGdv?=
 =?utf-8?B?bHBtZ2RVZmZaYUs0STE2U0JFdm81cEIyTG5FeGk5MkIzTDJtWnZoR0s2eTky?=
 =?utf-8?B?WkVuSWRXanNwVW1WNXd1Tng3WWVINWN2eUNFOUpWVjlRc0pZVUhnSHFxQ21X?=
 =?utf-8?B?cys2UHR1TFlKalE5UU1oakRJRFdEMkExbkRNWmhESnlsN250QStIdjFQV3lQ?=
 =?utf-8?B?V2RnUzU4RUh1dGRVcDdvQm9kak5TeUxyZm9TWVZVMXdHTDVQRkIyemRWNXlK?=
 =?utf-8?B?bTU1a0RENXB6V0NvQjdyR0FFaXZLazVUamFMQzMyR3lDekQxMGZoU3lsNWJz?=
 =?utf-8?B?TGM2MEhlOVdpWDFjL011cnAwOGZsblJYcmk3dGpUdlcvQ1ZRSW9rU1RpNEhB?=
 =?utf-8?B?SURQTkxUZTBMRFByUlpGb0YwN3JQTHVOMDhrZEVYRHhCQ1hpQTNuL1VaS1ps?=
 =?utf-8?B?dTltdHVQTjM3L0RiNnVxVk1CeVVLRWViUkU3WWxBVTJhcjdsQjJJaG1YUUZq?=
 =?utf-8?B?SmxBbEM1cGdMT0hKalFTaDlhZGx3dFI2L3dDai9JV0dCcG1vclgySFhvYUl5?=
 =?utf-8?B?UUh5YUxRMmdWSGFta0cyNEppWXVDNHFORXNVWmlHdEtFY1F3eVhhUXB6OUNS?=
 =?utf-8?B?OHM5VE44VnFhQ0pmL2JlTlRuNzlBRDRLaU1zcWt6QlRoTndpeldaKzh6VGJU?=
 =?utf-8?B?a1FlMk51aXhhMW10ajlOSlFjK2gwcEp4eitZUWJua2oxQVNmMXozTDB6MHZh?=
 =?utf-8?B?b29ra3dQTFlXd20wcU40Y2tTc1BadERDTExGalpEeHdNSjRlMWlEK0tab2dY?=
 =?utf-8?B?c0tERE9ycFhMYUMyVFJzQ2ZNd0xFSUhlTkcvQy9rVTZiUlpvOGIrTS9OczN5?=
 =?utf-8?B?Z0ZNSmVmZGZsb1ZoeEpZa2E3Z3VJZlRNaERyMDBGZk9kUDl1aHhaMW4yV2x0?=
 =?utf-8?B?UThBNzRuRU00UFFoeG9CVGNUQkR5citlOEF3ZUtRajMvYm8wTm93ZmVnNVFm?=
 =?utf-8?B?NWpTR2pZOTgxSlZEQzA1U3JOblM4Yk01bVl6SlV3SlVYMjIwbnNSeCt4dmp3?=
 =?utf-8?B?UEY1bjJoY1h4RU11NEhSS0U0VHpGOHExWStlNHBvd1ZwNmFXY2QzMHJPTk1P?=
 =?utf-8?B?UEFGT08wcWp1Z05rTDIyczdzMlRnNENzaHFJTExhandnUlNWRmNpQWJYVW0z?=
 =?utf-8?Q?7FziK2IufKsEN7OWHDZb7K4/nhwYsL4k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnVqemJjd3FvVVAzUnhnQlhCd0RzWHhQM0F1ak9BdXZTYnR1cTFZN2hqVk1s?=
 =?utf-8?B?RGs1TmhXTDJKRUdlaVZGNi9rOThIR0pMa3dDclg3dEptQmN1VlQwb09ybk95?=
 =?utf-8?B?aFhsb2o0SGpEdU9TNzYvcTUxY1pJaDF5SE5ENmVUWmRab3RjYTNEQXFWWWJ4?=
 =?utf-8?B?SW1ESFZXSWVZYmRMZk1XcHZka3VXeStwWTNsdFFPZVNRandKbzFNVkg1cVBX?=
 =?utf-8?B?ZG1EUXF2T3c1K3kxVzFnYUhnNENEdk1aejhrNXJxMElxQXh2S0x1N2NnK1hS?=
 =?utf-8?B?RERvMmJ0K2pTazFFeUgxVW5IYmo1YzdUeWhjakRMd1pIQUpwTU1JV3o5SFIr?=
 =?utf-8?B?dlJWYUNnUXNROE14RWk4WmtpYm92dDFvaDh1SjFoN1NLa0VPb2dyRzFmK2dU?=
 =?utf-8?B?Qm1Vc0lGenVnQVorVmYxOXVxQ1hNbFBCN0YweGpOYWlMZ2VDOWxlQTc2V1lO?=
 =?utf-8?B?NmNwSlhGOWpEc1hyV2xBallaU0JwREd1OGY5dHpmbWFaRm9JdzRadktxeDl3?=
 =?utf-8?B?K3RDYVQ5SzVJVkRtWHgxR05pZHRlQ1FMQTZERmRpMmVGb01ya055b1BoSkk1?=
 =?utf-8?B?aFMzR0cyS0tJWVdkYzFFOUExL1ZZQjd0T2RwNHRjb0IwS0Q0NUIxdGZNbGdN?=
 =?utf-8?B?L0lnY3JoaHoxOXFWWUZDa3JVSTYvd1gvbjhsZmlUbFdQR3BJem1DcmxpZlc5?=
 =?utf-8?B?RXlJbzBvREFRYnFTZkRXVm1ZTmNFYW42dUd2SFhPcnFDYkJoOUd3VFFLWTNi?=
 =?utf-8?B?ajNmKzNsL25LaHZBZWpQRU9TMjdWQ0RyR0VVQVFWcTFxTm53bHlrREtKdW8y?=
 =?utf-8?B?cDdkUjl3KzhTdnhoY1VyTGRlcURwTmJ6ZmorK1lTTm4yZmhlRFdvMDdiRnAw?=
 =?utf-8?B?dFFsY25YMU9zQ1ByaDVEYXBQTXFhQmVtbnM2bDJuUnAwTk84dHUvU3VIV05a?=
 =?utf-8?B?aW91UGFjV2M0VU5tczN3cGF4cGw0WU5rTGFQU1VTTjFyWVBuREtXa3VQYk9G?=
 =?utf-8?B?UzFyUHl0YVdsUkNLdThVeTU0Z0ZUc3NnUlNJMDlQVkRjR0RIVFByQWwvUHJx?=
 =?utf-8?B?ZFQ1TEgxaW1pdktjb1lnUEh3OGpxUmcxQ3R0UUN2dFhLWnlOMFlpY1hsOUZT?=
 =?utf-8?B?RDZ6NHZUQUd4TkdQUi83UkQzQW1yL1oyZWZUbWhQZXRVclVHQWlrT1lmd1Z5?=
 =?utf-8?B?alIzQ1FCTnZRcEZLVXpMV0JPS0NUQWdlekNsc1FhLy9IOVNMV3NqRXRSakRU?=
 =?utf-8?B?SjN4eEJNWU9Qdy90cWIvb0dqOU50RUt2R2Ewb3RXcnJ3Syt4cEJYaW9iODlq?=
 =?utf-8?B?WXhTM2tVUDlHTjdVSTJ0UkZVbGk1TGgwbFZwVUhWcHpwRVRLR2RXVk9Ldzht?=
 =?utf-8?B?dlErTFk5SEtvdmsrYUlTWlIxdVZqOFZFRjA3aXRGRkY4NlN4Ulg5UW8rcTJr?=
 =?utf-8?B?cm5naVR5MDBDNGdMU1FnWXdOblR0cHRUSHQxNStzRVRRbDZOdGFOemdIS2E3?=
 =?utf-8?B?dHNEUnFYU0JWbEg4N1hoVWFVQnFSckVKZXk4cnk0V3FiUVA5MzROZzNMZFE1?=
 =?utf-8?B?SmJ4S2lFOGFWM0RIVWVxQnhUWm1ySFIrTFhNRFlZd200aTFmU0JmUzFieDNs?=
 =?utf-8?B?a213dVIxK3BMd21Bc2FJdkd3akZ3QnB6N2oxMVY0QUEvS2tLeWJFQVJBTU8r?=
 =?utf-8?B?N2FrSG0xQWRZYVlvY1l5bWIxWUdyUFZleXJQL2JPZWs3ZDV5RXd4T21NRDB3?=
 =?utf-8?B?SmM5N01wd25NZGQrN2pQYlIrQktUNmM2NWJML1IvZ0lSZVoxRlZTUm9JSmpa?=
 =?utf-8?B?Yy9aelJQMy9YbmRuU3B5R08yeTR6S0E1UlIzU1UxTHdSZlI3bDBZODFyQ3hk?=
 =?utf-8?B?QjROa2RBK0RSaFdOcU83cmltU2EyZlhGWmtkQm10dWVZRy9NOU1wVStXWFJC?=
 =?utf-8?B?OVVzWTRIUzR2MUFuclprcXBoeUgwYkJEaTluREljV0NNWGRNSTNQRW9yYzhU?=
 =?utf-8?B?NERtbE8xdW5XSlBUd0dZRHpXYTZ6Z25lVG4vc1JMbitjTDR5LzNyWmxkeHBL?=
 =?utf-8?B?cXVEc01wWDZyZW1SZmtOaWZGTnlsb1JyQWthU1BQRFJHSFJkd0hnUnhSQ1lG?=
 =?utf-8?B?NHJYNXhjMG90S0poY1BsUnNSdVVZbGVXQjl1dWVncGN6Z1dsRG9tVFQyRmlR?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c8e058-9812-479b-56eb-08de2db90999
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 13:29:48.7750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwzWoSo36X17HmWqWP+LWgwL1e0lZYn2sWBRUffMdbLuUvISus3NfGTIa/Ri3BIcCv79d3N+Mz1xVzVxAg+Hrm+GIUKoUvnJ/LAMvnI85zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_053002_629000_3A74BAF9 
X-CRM114-Status: GOOD (  12.44  )
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

Hi Heiko,

On 8/12/25 10:52 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Enable the NPU cores and their mmus and wire up the supply-regulator.
> The regulator itself was already defined, but it does not need to be
> always on - the npu can control it.
> 

My apologies for the time it took me to review and test this.

I tested with aarch64 defconfig + DRM_ACCEL_ROCKET=m loosely following 
the instructions from https://docs.mesa3d.org/teflon.html and the script 
finishes, so I guess that means it works.

I have managed to get an Oops with another defconfig, but that is not 
related to DT so not a blocker for merging this.

Thus:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

Note that I have the same remark about regulator-boot-on property in 
vdd_npu_s0 I made[1] for Tiger here.

[1] 
https://lore.kernel.org/linux-rockchip/d784230e-49f4-49e9-be4a-bc7c00020cfb@cherry.de/

Thanks!
Quentin

