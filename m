Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6859BC02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2NSBgDrWcdFKNkg/1Kjoscrkx1TK+2VGkW0CbSJ7iM=; b=Vqmli2mXHZfxnaSvxzPiJdWrgf
	SOO7NgSfKTVZejViC6UdmMCXPjFelwPcnm/m4Skeu//Ti557Vn/xE+FG0Ng3V45U6vZubsYUS+1zH
	agsDDF98djBGU3l6OX3n7l/ekE0PlTrcyaFgaTlKQ62pOf9ar1jY7umHW/xNO4V57MwvRB+QA3YJJ
	nN7RYS9X2n+QepTA93hMe6+/FrX8zkXdUIr0cXi7aJrzSCRRsvmlkMj2vINzvnceRbMd002Ljgrfu
	x1ytMRhPfMDB3AI6SIAOlKUWPwYhXG/QL1HJLqFbCYQunLaqtDwDliz4/4vuRNOuKJ0ypT2JA2kqP
	Gs7TQZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnoI-0000000576p-2pux;
	Mon, 20 Jan 2025 09:11:07 +0000
Received: from mail-db5eur02on20713.outbound.protection.outlook.com ([2a01:111:f403:2608::713] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnlA-000000056f8-29Nn;
	Mon, 20 Jan 2025 09:07:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pd2DDH/9bJxiECiek9b5XZ2SyM45qVPwX2aCIdT+en9JIoR/sDFMc3pLTNsbByEQ6RexWMqRw9YmKLFRFGyTLxaYHSrnBmT6nQrIwU3XFo1jXu05fqvOizvClRw48pn5t7rk9cKGo3t1LWAe10JPE5ZrSuG3j7SXPMHTRfnOGo59ifho5JqoReWdZlA/yHR4EUMg5sgehjU9VU/gKKbjuMVKFWfCPmGI8Nao4Vmjt3uX9ClFJ3WHZEXNV1q5RUelXm8I6kvRWfywVeFCwAbi+q7xtMwkneW9ari+MByfr9iNAUhEniDjT00umfaHj2U7GL+bE7cJPIPrNxENPXlwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2NSBgDrWcdFKNkg/1Kjoscrkx1TK+2VGkW0CbSJ7iM=;
 b=I4mH3Q9Pcgoqj8HdIRoqVFHN/G1KSZQC54dw8I8aEJG+9XJVpqeQZGDozVUKx9kmx04/y5x6ygXZXumMTjO3rGpIvOAf0wbhrLcGeqS3Ld2bJWARVVebyRPq3slAKqWLKQcuyAhZUHN/fZSphEXQt04Lh0bQX8EO7Kagsh4WyX4ejoGF9Z45+dwgkbQT04XJSv+DrPOYSoWGNomkFxDlPQJ9MLE3/C+Z4sxigXbey+Tn9wFsn9fT3wyanSKzNC6Yl+BGqoRoIXxLB4Kkk6aLz0A1SB+/FNtYTszBstS7XhIvd7jGGhafyJTnNM+L/xbtlAe7IqmUQXfj6x3/hnVsCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2NSBgDrWcdFKNkg/1Kjoscrkx1TK+2VGkW0CbSJ7iM=;
 b=W3E63yo5Gp/Jy+GYZwWxLvH3mTq7SuAlSo100ThozNnonkLxvHpEWEFR7fyXq6CNtE4Ek0MfuPsOVg70/a1Gp8Af2NimJlViIAWXgWthmR+2T9jHw/nRRKGxeJBoRO6Sd5eYSTuvEkE7/Tm9UVpkgzRiHdxh0s0oaoxh5B8/cRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB6614.eurprd08.prod.outlook.com (2603:10a6:20b:338::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:07:49 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:07:49 +0000
Message-ID: <e492812f-11cb-42e3-ad0d-ae6df37c346b@wolfvision.net>
Date: Mon, 20 Jan 2025 10:07:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
To: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <20250116-pre-ict-jaguar-v2-1-157d319004fc@cherry.de>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20250116-pre-ict-jaguar-v2-1-157d319004fc@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0158.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::15) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: eca12993-bdf9-4613-7809-08dd3931e9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Kzl6czd3MmJ4T0FqenhRZmVkZGZSQUR3SWkyMEpLSEN2N0JCeWFHT0dueEc1?=
 =?utf-8?B?TU51R21tNldyMTlRWGdic0pBTmtJT2xzK29nR3c4WlB5VklSNFYvOG5jUllG?=
 =?utf-8?B?by9xZ2JIeW1aTEFzTjlNYVQ4dG1zYllhLy9EL01ZSmMzY1pCdjBWOW13MHJw?=
 =?utf-8?B?RjBCeWZ3NytPclc0bnZQNHlQc0JHOFN0REsxLzUvM1Jkc1hKVU1SaXplSldz?=
 =?utf-8?B?V3BpSDdpQy9xdFJMRnM4cWJlNEI2WkwxaTdlSllEc3NnNzNSVXg5UjFDeDlC?=
 =?utf-8?B?eVF4aTdoWXdicUMza0RUN0h2bEMvNkxQTGsyQzFuOGJKZ0xmWW1oSlEwVVlw?=
 =?utf-8?B?Zi92eHJ3WHo1OGtIeCtSTS95MWl3ZGhSV2lhWDloSnRvZ1FqclBzTXI3SXR6?=
 =?utf-8?B?WmtwYUN4L3N6cFlxbFhIMFlnM25sTTZ3Njcva3BkdWh5Wi9aUm1qOEZaQjBk?=
 =?utf-8?B?UFgxT2pMN3ZuWmo1SDJOUzJoWjZiZkNkcFFFNFFIeUozWG5lMXIxM2lkaVpk?=
 =?utf-8?B?ODV0aGlqZEpZZE5iaUFZN3FGNWJBQzNYWnBpZjVnd2JNRzJVdjE3SXYyMk5l?=
 =?utf-8?B?M0FvczkyTVRYQkNGcENGSXhkOHZlUytUYkdvUDBUNG00akdtWXVCaUROcDdN?=
 =?utf-8?B?U3ROUmN1Sk5DZjJsM1M0bTZ2Y0lIK2srTGE1TTgxU0hoeEM5NkJyc1FMTFVu?=
 =?utf-8?B?c3lrVTJLZ3MwbUpDZDRYcnZ4NmRISHVXRkd0STlST2YvQ003OFF0YTJiRFJW?=
 =?utf-8?B?S3puVTNVNzN6T1BYOXZSNGVRZEh3L01LYUNON1VqN3ExSzJESlFvbkdPZTg2?=
 =?utf-8?B?Vnp1ZHZZVTRXajdNVmxDdnNPM1Q4bmRLb2p0RENJTnJLYTkyUmhBM0k0b0t0?=
 =?utf-8?B?Q2o1Tlh3T09HRFNaRjBXVWNTeHJHaEZRdmRQQkRxY2RRcFoxV29XNkIvbXVn?=
 =?utf-8?B?cTJQdHRyTjI1QnhLRUQvdHE2UDgvWTFGQ21oSGJFbUpQQS90QXpvak1DdGd1?=
 =?utf-8?B?NXY1NWZDNy8vMGM2YUJ1WGR2bkZJcmdnWVpERDJ2QTNqTldpL2x5SzE2ek5I?=
 =?utf-8?B?MnM1L3N1TUNlZ3Z6Q0dVcjdGLzRPaVBmODcrUGppRFVXQ0ZmQVlsRnpwZnIz?=
 =?utf-8?B?ZGlmOTJHZE13anBTM2lmYjlCYjRKSWQ3REozM2JGOHUvTzhsNzZES3AyTml3?=
 =?utf-8?B?NGpqNDQ1WldnZVB6dXJxdEM4aHlJZHRrZUFQb3g4bmp3T3duRHU4K1JUYURy?=
 =?utf-8?B?aHFJbGswT0djK2cwY2J1VFRka1g3anYvWFRRbyt0ZUhmNHlsRitVZ1JzSFQz?=
 =?utf-8?B?N096MXJuZU9kcTU4YnlsTWRMR3plSks2UnhrNHBIUnF0OWFSMUNGMUwrL0lB?=
 =?utf-8?B?Rmd4MFJXZURrMDhQSHM3Nk1XajFhNDJLeWFGU1hMN1FNNlJlWWRzdmFpeUdI?=
 =?utf-8?B?WTVVTHo1NnpOK2JmRHFuZHNYNkcvTFZxbHIyWXBaVWQwdkhVSDZXLzVjQVQ1?=
 =?utf-8?B?ZVh4R2dsWVNqdXVaTlVYelNWeXRZZDFOZy93ak1iN2lsbGpIa3ZCc05ZUDhJ?=
 =?utf-8?B?ZnRYamFyRHpQalorYnZicGxIRUcxb2pWR0FReWNvVEQwWmc3WDVvZFE1Wjdt?=
 =?utf-8?B?S1V6VzczTWtoMHZ2dUpjVjJSZEs2S25lYmNKck01TjZObHNlZlgyaFhMb0hr?=
 =?utf-8?B?M2pxcnp2SW90M0ZScExLRThVU1o0NFVTZURDNklZMEN1OFZTOUlnWHpObHda?=
 =?utf-8?B?SStoa3E2eVVVRUI5M045N2pPV2pKclEyUUdPbVg3b3dSbzNjemx2c1psdmQy?=
 =?utf-8?B?bm5Ha3dtTWQ4ZlJBc1VQYmUvK3MwZzQ3K1ExQ0tRZmwrUjFqcUY0MFM1Mk5C?=
 =?utf-8?Q?OBy0NI7iCp39p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVY4eGZaVHhtUmhuN3pLa3RxalQwYnpjVGhRNHZCSElhcjF6OTVYN1pSc1Nj?=
 =?utf-8?B?RTIrZXlXbnNHUFltUzhieG5Fd0didk9TbnRvKzVKZTZJdEY2c3EvbmFoTCto?=
 =?utf-8?B?M2VYSDg2dC9MelB1cmxlWTZabStYenZxVXNlYXZHL3J1bk9JZGtLR1M3bWpK?=
 =?utf-8?B?Z2N2Q1dFdUNBaXViOTQ3SWtYaXJYbi9BN0xXdk5SUTlGNlo5ZFJteVVySGox?=
 =?utf-8?B?Qm5yOW9NMFMxR2F6eEtMUnVsd1NHd2x2aWRYWktZQVpIdTRJR2p0ZEltOHY5?=
 =?utf-8?B?UnMyMENaOCtjbjBPWlRXQVBkaURHcHRlMmtyRFY3WjVBRXZTSUVFdk15RjVT?=
 =?utf-8?B?d1h2ZkhEa1hNSlhqQXZZMnVQWUpYV3hya3Flcng3Q2ZmMnB0QjBvZ00rVzJJ?=
 =?utf-8?B?QmZsR0h6dk42MEZiV2lQWlVRdWNlSnR6V2hHWjQvZlhsM2p2WUs1WlR6QXlo?=
 =?utf-8?B?L2ZPdHNhNkd2WmJKdlBJUmZqQkdZUG5GQlVuNmR1OW1LN1NCckNSQUl0S1hM?=
 =?utf-8?B?VXFFME52SDJ0Y1VPRjUzbkRGRmpOWHd0Yk40RFRWcnU5YTU3QTdEeFVQZ3FP?=
 =?utf-8?B?eUFOR0lQZHBKa2IvUGZXTEVOaDAxUnpEVnp6YVBXRUV3a1FVSmpKbXJlMDJ2?=
 =?utf-8?B?aWRQUStKTVd1ZDJjcVNTdERNeWhlS25YeFhEODU5THY3N3B4REZPT2FKR0Ra?=
 =?utf-8?B?RkRYTzhpSGtvd1REZkUzRFpBdHlpdFd4eWRESWJaNVlQdGwzWldXWE1wUENX?=
 =?utf-8?B?YXNZd0w2cVR4SXEyRHlQRTdIQkI2bUcyYVd6Y1FHc3dKeU13b0Rzd2ZmL2FT?=
 =?utf-8?B?VExOTW4zMUpJcW1QZVdJSDVydmRxTkd6TDRESEZPQ3g5b1FJWmtzSEVvdXNR?=
 =?utf-8?B?WHNSS3BoTWZkTjdWK2FOR3ZqMjFKS2VydXNITGNTcHlxSGtVbklySmliS2Y1?=
 =?utf-8?B?V3FTejJZKzljckEyTWNjZG9JcTFMVjhMYUdJbUoxY1U3dkJVN3NMR3FJWEpJ?=
 =?utf-8?B?bTNsdTZhb3B3ZmpTbDQ4UHErQkkxeDZyRmRCMXlNcjAxOU1ZTEtqNk5ORmkw?=
 =?utf-8?B?L1I5TDJNYjFOZUdkUUszYjlQUjc3Y2VWT1lvenRSV2c5UlRZQ1UxQzNQQU9h?=
 =?utf-8?B?RDFiN0dMbmhoSEdIMjZ5UXlDRXRGYmg4bUx0TEkvaStZMURJZUFuWWgrMjhU?=
 =?utf-8?B?N1VLaVBKZkp1NmlCS0JYd1VGYmhlUHdmU28zU0JFc2FtVitwRnU1U2xZY1Rr?=
 =?utf-8?B?TDlkVWVGOEx0cGhqWklRMzA4aTRCelVidFlMdVdmeG5abno1c3lHbUZKWk9J?=
 =?utf-8?B?OG4xM21vdFJJTktJSW1pSnRzS2E3dGJ4SWI2WHdqbTdaNjkram5zYzJaMXp6?=
 =?utf-8?B?a1h3RXA1MThJNnlnSmFjRmFVeURhaktxR3JaT0Mvb2hMSzdZZ1pMblZwWitN?=
 =?utf-8?B?N3AwVkdqQ0hvd0RnMkgxTlpqWko2QjNyWkpiZmdSbDJlR0xTbVRUenFhQVJq?=
 =?utf-8?B?ZVc1ck8zaTFIOXVocXMxdWFCbEJ6V20vdmI5WUx1a2UyN0tsUEY0KzZiTmVC?=
 =?utf-8?B?aEFBVUQvYWFYam10WC9KMk1SZ3paRTZiZjI2L1pKNjh5bURkZ3pNTFNWOXBU?=
 =?utf-8?B?Z2E3WFZ0cUJXU2VUbGhGUkpMYWdRNktPVUVkamhMRlk0djRlRGtJdjBkemwy?=
 =?utf-8?B?S0lORzBjNlg2THI5OVhOUTJ0NUx2ZGhFVDNIUUlBM0RrY3YrZERWQUI1cm9X?=
 =?utf-8?B?MDc3b1dtREwxSFQyK0ozS2p4TnZUaU40eXQ0WkdPcnA0SlVxdUxGaE9WYkVK?=
 =?utf-8?B?c2Voc2dmeDYydkJiNGVPTStEQTZPRWlVeGxWblZQS1BzeVYvWDJxZEdCN005?=
 =?utf-8?B?cE5jd01VeEZyWVpjWHZyVk9pNW1ycWhCQmU4V1JqN0NYb3hKYVZteTdOZ0F3?=
 =?utf-8?B?QjhMdVV0ZVhVaDE4Njd2Y3R0aUtJdENCcmZqMjJPVjhjTXAwczVCQlNLT0xZ?=
 =?utf-8?B?N3YrOG5oUzVQZ2FVRm5QK3pTRlNwV0greEhoME5lREpETVBvYzRSQXR2THFE?=
 =?utf-8?B?Vkd6bW9GbUJ4NjBSaldyR2QrcmFISjNTQWtTdnFJL0N5NnhQM0VzV0tXSlpp?=
 =?utf-8?B?TWJVSXFQWkpaenhuNEhpT3poTmJ4MVlEQVMrVkFMUXdHTDhzMzArV3RpTWtm?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: eca12993-bdf9-4613-7809-08dd3931e9d7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 09:07:49.7461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDS6eTXBGjKFcCylKEoJ+T1B6QO04R23bKQr1Uj+xEMKA5yWf1QCFWGGWHT3zJru/Ijq5zdhJjCMFHGF7h67B9rs/c2aET+BkkRGD6gcWkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_010752_556411_A0FD54F8 
X-CRM114-Status: GOOD (  16.69  )
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

Hi Quentin,

On 1/16/25 15:47, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The Edgeble NCM6A can have WiFi modules connected and this is handled
> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
> NCM6A WiFi6 Overlay")).
> 
> In order to make sure the overlay is still valid in the future, let's
> add a validation test by applying the overlay on top of the main base
> at build time.
> 
> Fixes: 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble NCM6A WiFi6 Overlay")
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 86cc418a2255cdc22f1d503e9519d2d9572d4e9d..3f92d1a9d0b6efeee46ad4aff8c2b8ed3cb83d73 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -134,7 +134,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-evb.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-genbook.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
> @@ -163,3 +162,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
> +
> +# Overlays
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
> +

Maybe open a new section "# Compile time tests" or something like that?

> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb rk3588-edgeble-neu6a-wifi.dtbo
> 

Thanks and regards,
Michael


