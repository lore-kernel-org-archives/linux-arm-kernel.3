Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B4FC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5wfiClweX+GlnBQcf3RODd6fas2D3+YHCTyCuAPA2U=; b=KI7gaOuRy0/ICEzdFAvfnI/gFz
	WjfPaMXQ4HMJUXgY3rp/vMG/X54jqg0ANV8KOHBSQHqU5Vt+UNY8i9tbzqQgA9D+GeTmgpF9jgb4C
	3g+wvkASWlEljK+DzRqllc+YokI0WUmDKmt9A0dgr+FgPPrptJN0/o4Gg9at9YSSyzUQctjQxPnb2
	HcTeqGs2af70fI1W17aKREXbxEvMepJpeQfYdA+aoJ7VcB6tn9x2cIs8ipj6nkmXgk55clGTYwSyV
	c4qEZLFHfLJgDkTP2ZDwtb0ASUqd1iiVNYisf7sMfy758fpADnghR5Fc2OnnAN/jVTw2e73ykk9II
	p5kCttvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJq2M-0000000AJKs-2Nqw;
	Tue, 27 May 2025 08:51:54 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpyr-0000000AIcH-3Nmx;
	Tue, 27 May 2025 08:48:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKmIVXinumuJacEavBJbUXERWi+SSRjV1heEZ2LWab7NtKswOL0aEX1Ph3VNl2RnQpFVaLxaaZR4ktDw5wySjmivxadj4MVdKdpz4x23PP9XTqWTogQ7WAAJIoXzIgCQe7zDPXahsnCrMPFDqJnK9BdHto3n4F0Wp6h7jPsqVZcjfYLG5qZbjBY2W97g7joGXeE8g0UKUUKyP4UPiOn0jIPqU1paomhd4j57RRoO3B52tuGPSiso+qR9JqczrnVGgN2q7Kmub1ybTb4IK4kHNlBW1eVZYK5yzf1w7CQ5LHOwFyYi6FlsGvSd9F3WHye1IlPYmmsdUEixlfTxgt6e3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5wfiClweX+GlnBQcf3RODd6fas2D3+YHCTyCuAPA2U=;
 b=AcmVzJd9QKd18vtFMrvmEgdMbGiyoob5tR2q8JUMc3N5qY5Com/N1fF7IxblgRO35btjlk0TQDORp57TcKTaV2jLBNGSDqZ3lfud47ZzB8uISXkbRbhrmJ59dORV4GEQP6uf181RHLduBErQq0nhtOr4zOwmIFiI+KjiVVVaZx7fwMqK9wlX88V6zO9krthY2cnsbbsUVuJZb+GWnDvRbX85zStB5TZdg0H9AdYgH0D8XX8i5M76pEM7DGfPwcwJbiijUn+t5hiJUro5PhWcCP7zSVmTSCTUgyk0UFrh1vJfNCOe8VERNBPnU3HI+L+1EAPJtz5Vv2WirQMySM+3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5wfiClweX+GlnBQcf3RODd6fas2D3+YHCTyCuAPA2U=;
 b=gUT+y8wx0RE+jGJtJwaN3d/ekIqc/o0aILQXJRO7cs02Mby3uDhS4Dc5BCjxVMNenOa+sT7CMVOnOKydcym+O7jeg98WxLSv36QErfGCP+3EL7F4YNKijRCqwqQLY/oxDONKKG66NfUdnyoBYqslgJBeF0mYxbimoMKsYDMncOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV2PR04MB11400.eurprd04.prod.outlook.com (2603:10a6:150:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 08:48:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 08:48:10 +0000
Message-ID: <d1fab35d-a4e7-449d-9666-0c651e44929a@cherry.de>
Date: Tue, 27 May 2025 10:48:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset method
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
 <20250526-rk8xx-rst-fun-v1-1-ea894d9474e0@cherry.de>
 <79903ad6-0228-41a3-b733-415cc43ec786@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <79903ad6-0228-41a3-b733-415cc43ec786@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF0000452B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::351) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV2PR04MB11400:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd7f989-b99d-4922-270e-08dd9cfb359e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1gvYm9vdVlsNG1zYnJTOFprU0phZk1haVFZNk9kZ0I1MlBFdDZPdmkrWU82?=
 =?utf-8?B?L0xvM21tek5qd1BGSi9CT29wR2JGZTlWM05BQmppb0VMMHM0MUsrK1ZnbWpH?=
 =?utf-8?B?b3hBQ2tYSjRzVzhuaGY2OGFBRkM5OCtyVXpETUtWWjFGMUJsUGJsT0VaUXpk?=
 =?utf-8?B?RU1CYi9KSDJ1RkNyUGY4OXFRNG00OVdsbjlvZ1NhdHA4VEdNU1o5NGEzUmUx?=
 =?utf-8?B?ZXdJVnJvd0x4VjgvTUV5cWhUZVJRN2Zsa0xiUzJKK2lBY3I3ZGlRVEwxbFdK?=
 =?utf-8?B?SzZpWW40eXVUZlUvVFhlNXpCUVlIWHBoOHN5R0k1cktWL3BIQ0VGOVBNSG5i?=
 =?utf-8?B?OEtmL2lGaXY1M0VPUEtNT0tXYzNBMEpiL01Ld0lOcnVWT2k4dlN5ZWliTWFy?=
 =?utf-8?B?LzV2TVVSQlp0U2I1S2pTOFNJQkN1MkFmYmdtWWxSZk91RDlHckNzaUZDUWFL?=
 =?utf-8?B?SFZVNm93K2pMYUQ5NkhHZ3pMYWY3SHN6QXdrT0RYQjJRd1dvL29ZU0Q5dGlw?=
 =?utf-8?B?TFRVMTgwcSt0L1h2Rnc1eWhyeXBSZFBDMFlIN3FJdHJDKzdlckRmWVliQ1dv?=
 =?utf-8?B?OExnUDNwc0lKUCtKakNUZ3UydjJzTE84TWhZSVBVcTB3MENzc0Y1SldHa3BT?=
 =?utf-8?B?QytGaWZOYXhTQnE4Z2lYWnBzcTdWdG5KQmx6MzdHRVRnS1IzcGRvalNWckVJ?=
 =?utf-8?B?OFNVL2czZjNSZVhxQmlqcFZScGR1ZEdnRUZLZmlZZ3p6R24rWGtaR2pvSitp?=
 =?utf-8?B?blBBRnlFSG93NGlYN0FwZEh3V0taUnNXY2g4a3BmNjZuaTg4RjRzdG5HT3ZW?=
 =?utf-8?B?UFA1MWswdVVzR3FSQ0l2clFMZ250OWN3ang1VkZOTzc0aHdaQzAxbFY1Mkpz?=
 =?utf-8?B?SUlPL3pXalBBbUJFY2ttNXp6cFIraUdhcVZnZ0JWTmZsaktWTlhIQ3ZQRHZs?=
 =?utf-8?B?ZjMzbEZTRTBENFJtZHlhUkUyOUNRaFN4WW41eVlncEw2RENhSWJpZzFiTWQr?=
 =?utf-8?B?cEthZ1hhbjZtUVJsbGZYZWRnRVAvQVU5TUhrVTJWS2FuVTNkZzZkUDNoSHpX?=
 =?utf-8?B?ZktQaVFYSkFFL1FtdnJIRlF4TWpDZ3Uzc1QxNGxsQ0gyZU5BWVorNUVlY0tP?=
 =?utf-8?B?NWxhVUNuR2o4cVJUd0F1dThhaER4M3E3N1lzdDYrRmszVFBrTFIwYmhid1NT?=
 =?utf-8?B?WkFpbEM5YjNXNXRwZ05iQmVxNG54VmFNYVBRL2pLbzFrbkwrQ3FlNFpGWXB3?=
 =?utf-8?B?RERhN0tVRU1UV2hFNFF5Ynl1ZzZncHdDVU11N2lJQ3FNKzJzMkZqRUZ2MzVk?=
 =?utf-8?B?T3g2UVZzREZ2d0dnaWlPeUJyNlVXNi9idTBON1czMmx2USsyR3Q5VkY0RExj?=
 =?utf-8?B?TzJCZXlvYmJNMjEwckEyeDNJeGlKZUREZis4QmhHMTZpMjJta01OZDBneW5a?=
 =?utf-8?B?RnBET0xOYjJnQnI3Wm0xSFVtdlF4WDBWNnFoTS9CeXdsMmw4KzJvNTJJK2h3?=
 =?utf-8?B?cmV5MURzMXBXV3FOc1Z6NnJvUzZUTDBxMWZyZlJRbDFQZkZVZWlaUjZVMWxu?=
 =?utf-8?B?S3U4RGRXb0RHcjh0bFdiamRsNEVZb0xVaVVsb2U0UUs0cDVyWWoweFdnUGx3?=
 =?utf-8?B?RUg3ZHJ2ZU5tVGJGSzRzaGRSMU9BQS9talVxbTdyRTdJcytwdzNHREwxYnJS?=
 =?utf-8?B?ZzRSdUhiYm9DS0t0UE9MeGpSQjhKdXUxVHRmQmhnZXo0S291TlF1dk1LclRk?=
 =?utf-8?B?aFZCcG55Y2xFZkFmWnlTZTg0K3A3ZnVmaHNsaTB0aUtBOGhrMkpMVnZ6UTE2?=
 =?utf-8?B?RXJYcXIrK2ZKZWRpNnN0WUVRY1gvRk9PUk03RjFBNTgxR2U0L0EvVFV1eExw?=
 =?utf-8?B?Y2xoRTVVRDQxeHRDK1hxd2JWSmFjZEdCUlVsMkVZUWFxdnV3ZEFzQk1MVzNX?=
 =?utf-8?Q?kx91aZXegAU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enZQbFFLS1JHeFlKVHU5blEyK0VkMEJIYkh0ZThkVWQ3V1FkWGM0WlVEVVVi?=
 =?utf-8?B?RHEzZ1M0YWwvVFg4eVI0TzM2RzN4OEdGV0JpN3phRjlIZzFId2l6TkxQUEdI?=
 =?utf-8?B?K2JsR3dOVHphWng4THVOUGtwQW9wNzYwVXYyalB4aGVTMVJqWGR6MTBJaHEz?=
 =?utf-8?B?RHJlZXNGQmhoaDRsYVlNQnN3ZnpmMUFsdXhBZlNyNWR0SVllN2owbTFYMlJ5?=
 =?utf-8?B?b3NqNG1xWGtPWHFyZVpYTHprOTBkbmZuZ2ptT09aZytVb3BlME1lcUlFd3Bn?=
 =?utf-8?B?a0tDenhIQlhPY09seURiTm1xN0U0S0dSejBoc1B3MmsvQ2pxQlBNbVJOUlRs?=
 =?utf-8?B?cWxQU2pxcitQYk1KSW4vaityaUNyM2txT3FqZ0RNbGRNM0dsWFd5dHBFWVZT?=
 =?utf-8?B?Z1VWN3h5cTZyRXVnUyt4Ujg5dkxrZG5GWlA2VWFGdlF2N1hJL0NMU3ZZUTFs?=
 =?utf-8?B?Qy9RWXU1K2lPNFlGNEtHY2s0TjFCYTVHdmk5T2M4TVJPNzRqQ1FUc3FyakRO?=
 =?utf-8?B?aEpweGF0SUZjYkROUEVKbFNLd3dLblJxcHRQb3BIU0pFQldodkZMUjBFck9m?=
 =?utf-8?B?TlVqZW9OOFM2L0RqeUsrTTJhNGFaeDhEWE5nTUQveFBmNGR6OXp6YThsL3VM?=
 =?utf-8?B?R2c3TlhUV3pOY0lsdDJvU252MTgzSXBPS3YvQmVIYXVFcnoyY2FMVjRScTR4?=
 =?utf-8?B?UXArRFJvZ3BsY0cxY1orTytlNnNkSzhYeE5MWmcxSnMwSWQ4clQyRHZSdDE1?=
 =?utf-8?B?Y0RzUGp1MEdEdEoxZi9rU2hFazZtTElIaFRzZGpjQzZkd3FVNVdpbWpoeXVL?=
 =?utf-8?B?blUya1dsQlpma2hYNndNQkk2VFFzWDJYdklicWEyZGUvL1lmOWZVRmZxblhB?=
 =?utf-8?B?MEppK2RTZ3E4M2dVUVN0YlhPbEtjRWx5YVRqNTR6RFRSTTBvanFEZFVwTk12?=
 =?utf-8?B?TVJWOGhqS1ZkaHl6VWJac3dnT1k5ZkFlQ01mWTRPTzc2dFl4SGt4MVNwcHM3?=
 =?utf-8?B?MGVIOTQ3YTRjSHRBL21KWEN2QVdjRUpuN3FzbWxOeGY0UEQyUFprVFl1VmdE?=
 =?utf-8?B?RzVCVTd6YVFPYjRpVWZidnVBSndRLytQbFhsRzg5WjNCYlk2NVM3ZE0yRVBD?=
 =?utf-8?B?VXY2VkhFTEw5SjhYRXVUaGRvbWk4L3ZnMld0b3htVWlBNkVyZDZFU2hqeXNI?=
 =?utf-8?B?amlDb2VIcEk1NnFWcnM5Y2NXbzhUUlJsRHh6VGFoSnFubWJFM05zY25kRjZk?=
 =?utf-8?B?VVVoZTRiMSszQmsva01GS2FpRVh2RXRZb214SkpaTU5tQ2xmTGpxbkRLWlh5?=
 =?utf-8?B?RUlmeWM1RVJYbC9HYjlCMm05NjN5RWpGWk1OY3RKRlFvNWpGQ3liQU0wV2Rh?=
 =?utf-8?B?dVJTNFQxWkI5bEhDc0RoQlplOUxHTWN6UkV1MVJMVzR0cnppVXlTY0pJNXF3?=
 =?utf-8?B?amVJNjk4RFl4NUtkd2JmVUNmellaUGNtcWJ3SE1rSStIZ1hTQmhlQklGUGRY?=
 =?utf-8?B?YWQwMlh5VXhBeTUzeDNZYkJjdUdLc0sxaXdoTGhFZStFbjFPZDVJK2JMMis1?=
 =?utf-8?B?cVYyV0pmdGRaR1FMT3NjZVFwdm5EbmRIaGFoRDlsdDVlb213UG1HQzZ1VDA2?=
 =?utf-8?B?U05Wd2tQR3JVYjEwQjV2WExDbWNYTXR5czVuYXpvbmxSc0xBWFk1V3JlWmdE?=
 =?utf-8?B?T2VjekRlczgrVmVVWi82UWh3cGZMeHlNSG9pWEk0NEJNaTdxOStKRENXdHpH?=
 =?utf-8?B?LytYQU5OdzZaTVQrQzFJczFsM2d3SStlaGIyVnVpMFFCSDRlMDNRb0lTSDVp?=
 =?utf-8?B?OGM2UC9JUWtUUzVTeWpHbkIxNnNqZ3Zjc0g3SENOSGQzL3JqQkRFQU5Rbzhx?=
 =?utf-8?B?dDAxWUI5QUNqQzcyV3gyL2U1SSs3WmphY3Y4aE5jWWJ1T1dVS1NxWmJ0SzYy?=
 =?utf-8?B?bnE3YmNaRHh3ZElLa3dnY0tTMmFlT3pMYVNiM3ViMFF4LzNVOUpNa0RtbUdC?=
 =?utf-8?B?cWRxR1NoaG92U3pTUnNjSTVXcTFKYTIzOExWYkYvSnNzMW9aekIzV1dDYzFY?=
 =?utf-8?B?eTZRYUNUc1VQTVhTMGx6ZGlPWjBTM0hDZnY0dS90aTkrR2lrM0ZQYklsQlJt?=
 =?utf-8?B?MXp2azl4YXVaYVN0OVQ4OTFNdkdoZWcrTklGK3A0V0pwMzZCVXQxUFQ3YnQ5?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd7f989-b99d-4922-270e-08dd9cfb359e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:48:10.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaEQjQiBcZqQsubgzvuYuXLtPPnLbZF27pYufM/Z1DM0fea0mqQ2EI+VaqKMpqusHEFlOZHm9o3OOOf621BTDjoi1sDxq/6yR8Xafm5817s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_014818_023120_5CDD5668 
X-CRM114-Status: GOOD (  27.66  )
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

Hi Krzysztof,

On 5/27/25 10:25 AM, Krzysztof Kozlowski wrote:
> On 26/05/2025 19:05, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> The RK806 PMIC (and RK809, RK817; but those aren't handled here) has a
>> bitfield for configuring the restart/reset behavior (which I assume
>> Rockchip calls "function") whenever the PMIC is reset (at least by
>> software; c.f. DEV_RST in the datasheet).
>>
>> For RK806, the following values are possible for RST_FUN:
>>
>> 0b00 means "restart PMU"
>> 0b01 means "Reset all the power off reset registers, forcing
>>              the state to switch to ACTIVE mode"
>> 0b10 means "Reset all the power off reset registers, forcing
>>              the state to switch to ACTIVE mode, and simultaneously
>>              pull down the RESETB PIN for 5mS before releasing"
>> 0b11 means the same as for 0b10 just above.
>>
>> I don't believe this is suitable for a subsystem-generic property hence
>> let's make it a vendor property called rockchip,rst-fun.
>>
>> The first few sentences in the description of the property are
>> voluntarily generic so they could be copied to the DT binding for
>> RK809/RK817 whenever someone wants to implement that for those PMIC.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 24 ++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
>> index 3c2b06629b75ea94f90712470bf14ed7fc16d68d..0f931a6da93f7596eac89c5f0deb8ee3bd934c31 100644
>> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
>> @@ -31,6 +31,30 @@ properties:
>>   
>>     system-power-controller: true
>>   
>> +  rockchip,rst-fun:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1, 2, 3]
>> +    description:
>> +      RST_FUN value to set for the PMIC.
>> +
>> +      This is the value in the RST_FUN bitfield according to the
>> +      datasheet. I.e. if RST_FUN is bits 6 and 7 and the desired value
>> +      of RST_FUN is 1, this property needs to be set to 1 (and not 64,
>> +      0x40, or BIT(6)).
>> +
>> +      The meaning of this value is specific to the PMIC and is
>> +      explained in the datasheet.
> 
> And why would that be exactly board-level configuration? IOW, I expect
> all boards to be reset in the same - correct and optimal - way. Looks
> close to SW policy.
> 

All RK3588 boards except ours in downstream kernel have their RST_FUN 
set to 1, we need 0 and I cannot talk for what's the actual expected 
behavior for other vendors' boards. I do not feel confident 
indiscriminately changing the PMIC reset behavior for all boards using 
RK806 (which also includes RK3576 boards). Hence why I made that a property.

Additionally, if all boards were "to be reset in the same - correct and 
optimal - way", why would Rockchip even have a register for that in the 
PMIC? It's not an IP they bought (as far as I could tell), so there's 
likely a purpose to it. Especially if they also change the 
silicon-default in their own downstream fork AND provide you with a way 
to change their new default from Device Tree.

We can hardcode the change in the driver without using DT, but I wager 
we're going to see a revert in a few releases because it broke some 
devices. It may break in subtle ways as well, for example our boards 
seem to be working just fine except that because the PMIC doesn't 
entirely reset the power rails, our companion microcontroller doesn't 
detect the reboot.

If it's deemed a SW policy by the DT binding people, is there a way to 
customize this without having it hardcoded to the same value for all 
users of RK806 and without relying on module params?

Cheers,
Quentin

