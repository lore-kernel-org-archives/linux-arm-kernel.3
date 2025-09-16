Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062E1CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+ev7Kx9eSs1nL/DW9IHJ73hxTfdGHpWC91SWZ+kC9M=; b=rx9niL/3+Osdbv5HL5g326F4e1
	rqfXOzVidnSt6ddQISpkfNJsRa4eTAv1WVAikE/Bif+6YTLugLE7uf/pWvZgLEsjIcZtxHmifwTvR
	TCldWmLKBB2JrP8+USrU8mxe0gOsc+8Oki6Evc+ZX5VDV3/RYxRNzESUpbjd5MHxJ7/d7kitc3tE2
	1fb2T7XKtGbp+k8EIAosVCrHYYMkrIBg3H55JyPw+kYhhtb3C7md2Y/N94MN6NnBYH4vSwIw4Lyqv
	dwdmDjt9Acb/Z60Nht/VVEgD8ew32jdIG1gzJNYduwqaqHuTBcSay4M9FjDmgoMP8f0gfjCYDEf0i
	jAzck+yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyS1r-00000007Nn9-2h1v;
	Tue, 16 Sep 2025 09:31:15 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyS1p-00000007Nkx-2I2d;
	Tue, 16 Sep 2025 09:31:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HucAqkxXqql+D/9oF7MOioNroIcBFmTU5Iz/5mu0/m9AGsRHsPD5sVhr0Nerf/c4cy2PFcXDS+6vPR3kGIyzM/SV337MOfUXriyYIWlItLx3ietOBS0z7YWTwebzr6TUd0YTrd/rmpJthy+BsgaM9RrGkahpKveNuYsaYdWOyun+ySQU47hf2Csl9UAFYx8mPP7rPWPxX7vqrDiHJvAN3U3UmHrQNCwu2QP8QMQ8g3XtyEZW5RHM5QyG7YSYfumwHnsjTduElloRnm37KngZFef/C6xhBX4xEX2bpJckyl5555K+d4mjmlPIWTfB33yK9oIoD3paMPr9oeDUZuivEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+ev7Kx9eSs1nL/DW9IHJ73hxTfdGHpWC91SWZ+kC9M=;
 b=woglQNqqTm5x++/CDf46SWcYPeVAYO7i8OA0YTK81e5u7xVOu0A948h5qx4PTfV8U9G92TcUBAyuWOhZCpNEz61OolYKFRuQ3w0JoD6TvYbZeuA5WPRcjuphTwaoXbJ8tYCdMf/C/0HCBuUy4HcqtGqqb/K4QtZTrRn6z4oSTVF7CXVFC4eyFQkt4M6cR7eVbrFJ6XECmCVAX2/423Gkf1k7iY4leCyWvm3SoNwp+6UBLlSAEqqugwa5JQAAl/0P/EZGAScCk3mIT4LFJNoK1EJnHBXHcVNM3KIIN9a7w8d+5McIsnCwu9r8xyo+9WrbK492vgJPZaafmA0YFr/idA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+ev7Kx9eSs1nL/DW9IHJ73hxTfdGHpWC91SWZ+kC9M=;
 b=NSQnr0+gyGJBKZM/iavNCGWRKVVbDptwPGN2RZYRkhUYeyQW2qq8BVk9egipz2LqRA210GlC4p2T8XquKUJzV0TMiOteR29Dg9ztAOhVu3+yge9FhqD1N4bedoGpvS6TC+cViuVmn9YIK1biaqrv/rPCHBLkHTfJKmcKmtwHoTImn8SviSHX0oQY5hyTbHAbBFpPjhy0g1JFFvcb/rnelCoQFEpXMdwVUt1Z+3+q3x1j3zHaPxL8sBwGza3C+6N6u8T3fgMpCA9fBXpfteDXYcZsx7s8py8sY0nGF8/T/nxkV2W1zeeXXJIjuX9ykMbng2zGywfqqWrtFCulMaeJRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB8078.apcprd03.prod.outlook.com (2603:1096:101:16b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 09:31:01 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 09:31:01 +0000
Message-ID: <66f130b4-88d7-46d2-9f66-9055896d445a@amlogic.com>
Date: Tue, 16 Sep 2025 17:30:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] clk: amlogic: add video-related clocks for S4 SoC
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250916-add_video_clk-v5-0-e25293589601@amlogic.com>
 <1j348mj0sw.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1j348mj0sw.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0094.apcprd03.prod.outlook.com
 (2603:1096:4:7c::22) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0072b6-8482-4934-c104-08ddf503bfc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mkhob2s2NW9uS2xVcUJ2dk1vRWFYZGZPRi8rRmF3Z2xNcjE5RmtBZjVoVWo0?=
 =?utf-8?B?UGFDZ1JmbFE2czZpR05QZUZsV2NzL0JERk9kMDdsM1pSK2c1TWpkd3JjcWpT?=
 =?utf-8?B?RmJoMjZqZXNFNldQTUdxOWN6S2R5T0c3OTE2ZGwwNStMNUd0YTIzcGY2a293?=
 =?utf-8?B?ckEvNlZJOVNVUmVxODg5R2xYMVE2TVJHcEtFekNTQy9IY20zUHNJc3BXOXJX?=
 =?utf-8?B?SVhKTnV6Mm9HVTVtQUNGUDBTZ3htYWU1bmFzQ0RZVFdDU2c3aUdhank3dktp?=
 =?utf-8?B?NHBUdmRRZDVTWTA3WFZnT21WSXhCNVVnOUUwRTJjZUJqY3ppcWd3YmxMNVd4?=
 =?utf-8?B?UVZPdFdHVG1hbFd2blphWldUNnc1b0V2YktlVnQ4YWxRdWdmZDNwM0IyTzBX?=
 =?utf-8?B?M1lnSWgvTWV6dUY4RDN1TUVkTVBrODFIZThadTFNRmNZNk9Ca0xUcHh1NHND?=
 =?utf-8?B?K1NEY0JWMUQ0ZFhWWS9wSGRqRncyOTNjYzEwOTBRd3paWVdNV0JSOExxMjl3?=
 =?utf-8?B?RkxxU1FrTlQ4NG5BOU16K1ZnQ09vblJHRDlyM1JXTGdHWlNPT0oxUmx5MzJm?=
 =?utf-8?B?YXB5L3l1OHFKVjJucGxFaU5iZ1dwOG5tRzIxZTNVVzNkNDI5aFNxTGhCRGtN?=
 =?utf-8?B?NEpnZzgvNUtCekVNNGlZU1RpdTZMTXBGbTdQaVdJK1NZSjBCTUlYUStCYVhn?=
 =?utf-8?B?MERXbnJrR3pqbms5VGxYMlZDZGtmQUpCc0NwMnI4eTd6aUhrQkZZcG44dFRu?=
 =?utf-8?B?djczenozOVpPQ01YbkpOald2cWZPM1NYL0RYNjBSQy9yVG5tbHlzSlZjRFBv?=
 =?utf-8?B?REZMZDlLL2hKTGdQRDFORExNdmxUZ3k2Zi8yQUVYNTBnRFp6Q29HMTRTdCt2?=
 =?utf-8?B?SFdSMmZOT1FBNFRraCtSeXdwODRqWldRYUN3cU1TYmVpZFZuSVlGTnBZU2Z4?=
 =?utf-8?B?NklROTNHbDc4WGFNNmxjdzVuNHQxMk92eGFRUmFZb2N3ZUFZTHV5bGh5REZq?=
 =?utf-8?B?bUVuMHV0c0hjdnRaMEdUemsvbzJ6YlFzZGNqT0dMMGFScFA3MmgyOGdyR2VG?=
 =?utf-8?B?bWs1bkRCcVhBUVRBNkcycjFOMEpqQkhuNndldWdCWXQ0OEhCUGhySU1tV3V1?=
 =?utf-8?B?aWR6SVM0NElJb05ENmlQSXJRam5KSUQrNWZMVjJjVDE3cEdmNTNCalgzMkxv?=
 =?utf-8?B?bTdlaHBRcktOcFN3MGJ1eFkxOEsrNitPakk2a2Fwa1QzcVB5eWpBcTA4UWlW?=
 =?utf-8?B?RGZld3JUMng0a1BjdG5FM3UrT3E0NUdlZXFEK0ZmRHZwWkYvMHpySkpVYXRJ?=
 =?utf-8?B?cStROUs3UWlmUGsxZHgwazhDc0kwYlFxdWtFME91QUF2dm5XODVGQ2hXTm8w?=
 =?utf-8?B?ejZYL1ZIeGVVVmtFZkY3Nk1mSkZCbGRkS2IxcFJ1R3l2YzdkSVN0UW5QZUlh?=
 =?utf-8?B?Tmt1UFVYOUpjSzR0WDRLNlF0RWlwbGJQVEhCbjg0dzRUVW5rM0N5QWVNbW5n?=
 =?utf-8?B?SDJuTlFWNXNBUng1SytBa2c2UGl5R0U3SGRhc2FVNHZuNHVlcUNRYUM4UEVD?=
 =?utf-8?B?N2NVVDVQT2VlT1hNQWtFZitFRnZRUStMeURReWdJUmlIVEtwdVFtY3A4LzJv?=
 =?utf-8?B?MDhQbTFvbWxoRkM3UjVMT3EzdlRZUXFIamZ6MWFwdVJUVUFsTDdHMngzc2JU?=
 =?utf-8?B?VExHeXArRDNSYUl0R0lzVlFLemZDQVBqRVJZOGV6aWhBdFVaWmNNdU83QzQ0?=
 =?utf-8?B?Y3duRWlMZ3IyNSsvRHFiODFTZFh5ZHI0ZVVhR0ZweWhRT2dtUDUxQ1VJUzFF?=
 =?utf-8?B?ckFTSlJYL3lPVk50YmthOFpLVHh5aXc5K3I5RGRaa0lnaTlFV3lhWVhDTVFC?=
 =?utf-8?B?ZVNDYmRYM2VKVEhnWlRNeUN2cHJMNGl4Ky9OUHRnM016a1o5N0VIYk5VeHlT?=
 =?utf-8?Q?EB8FQdLwFcY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0Y4OEF4VERvVDhIb3BCa3EvdW1ZSGlLblBmbGxkWTNXUFE3REh2RTZ2TkEw?=
 =?utf-8?B?aEEveDg0c3lXSlNYaDZEVkVSNjZxbitFQTBFbEZQRU41SlFaZW43VzdsNmps?=
 =?utf-8?B?VEx0OVh6V0FTVzd3WDVOV0xOa0VNOWJYbWFyNWZxNEpialFRb05ld3ZWRWlP?=
 =?utf-8?B?WjZjQlIzMHNqSmIzeUY1RnA0a0xwTnVYZDcwaDJ3dXA0MHVSNlBwUllnN0Yz?=
 =?utf-8?B?WU1uUFRtNi9SQmFsMUV4V3l3QldrY1gwT0ZNeHFLTjNHZ2NXSUdoS1dzZURV?=
 =?utf-8?B?c3ZkZDFzVm9RbGpZNTVnelZmRkRJRWR5VHdkNVpxVEpIK0lscmx6UDBWL292?=
 =?utf-8?B?YmY1TExzWmVTVjNrV2owL09rSmUyS24rRVBkakp6MTVnU3dTYXY0dy9NcndR?=
 =?utf-8?B?Q2FKL2JQZTNBb0JucnNVREVqWnJPcy9KMFFmSUt0bHJuZitYNTdnWlYzZ3Vw?=
 =?utf-8?B?ZHN0djVuY1JJSXNsODJqNzQyOTZhaDVCUVVpQUJzZkFDaklRNmxJYncwNytM?=
 =?utf-8?B?SFRjbFJyQW81RWI0aTk3ejJmYUUzNHlrWkFxWDQrdFY2NzV5bWVIMGFBVkZy?=
 =?utf-8?B?czlOZDNLVm16UFVJanBVZldwbVBTVldmQ1U2aGg3OTZISURFNkp6Um5XVmtK?=
 =?utf-8?B?WGY5Y21QNExhQVM1N1JzSnFrS3Y4YmlMUXk1dC9NMytTLy9vTlRwQ3BtdTZJ?=
 =?utf-8?B?VWhiWlJZbEF1V2o2clZpd2Y0U3JzZW9LNjJyZ25pVGhSbys1eDVLOW5rSkkv?=
 =?utf-8?B?Mm9tMjRWSjU5RkRzOHVacEtaWUZQbjlrS1NBYUFZU1p3bmlxM3JyWW5xL3N6?=
 =?utf-8?B?OTFJTlVGQUxFZDJjYUhTTnpoK2VZTHNDcXh4SUIybStGL21DODlKd3JzZytQ?=
 =?utf-8?B?VTdBelY4VlI5SHYvNWlQcDB0ZTYyeHZwMldRSDhLN1piRjFyWDFhcGxuam84?=
 =?utf-8?B?Rm0zUG1qVXVwT0FPWjhZRGNGZHlPWEd3V3BvUkpsL1pwNHcwNmp5SGlNUlhx?=
 =?utf-8?B?c1FHclJkcnUxaE1QUTZQc1JNdW5lMVpUbUQ0V21UM2xJWS8weC9Pa2hQRHJK?=
 =?utf-8?B?b3hTeXBuQ3hvZnE0S2hHT0F5eVg0a0g1Ry9oUm9ybW4yRDFQUk1zeDdCTVBs?=
 =?utf-8?B?dm5vWkxPczZ2QURVWDVmUnJ4Q084WnB3aER3Rm50eVFHU2c5akJiNS91UHk0?=
 =?utf-8?B?azR6ZDFUcGpNbGg0YW5UTmdUN2JJMG9aT3Q5cUZVcW1MYmhCT2J2TFFqU2lU?=
 =?utf-8?B?Y0dMNWRUSmV0YVN5Uy8yUWhxSGxuT1MweFFoYUdhd0lOb1JUSENPUlA3RGZZ?=
 =?utf-8?B?UnhQeWZNZFZCelJhZ0Rjb2p4RlJlSDhmK2RsVWtLeG1ZYU1Memw3M3R6YktI?=
 =?utf-8?B?Y3I4MTJINExQUTk1eGZHQUYvMkFWVXdpZ2hXR1g4Y29LcWJNZHdrbkhGREFC?=
 =?utf-8?B?cEFiRVBCWFFwbkRuOEllREowU3lwRGNvWElGOVZYa01XNjRhVkdmQ1FsbnFw?=
 =?utf-8?B?VzBNNUEyN09YdUpNSkhWSGFHWitXQ01lVmwwbG8wZVNBWGZIVXNScUJ5ckxD?=
 =?utf-8?B?UHRGVWpnU3RYNWpneWJZTlgxaXVGWjdjdHZvbVU0cEs5K3NFNTFUWlczNzRK?=
 =?utf-8?B?aXNod21KNUFKU092d1RnZjB0RkdrQThKU0RkOEpUaGRjVUpzQzFDbmFpbVhl?=
 =?utf-8?B?clJ3Y3M4ZGoxVFQ5ejhFYWRUeXFLQXJRMkZ3TWwwZkNtckVBUXVySXZsR08r?=
 =?utf-8?B?STI3amMvQitFejk4dnBhajRWRUFHYjZJOW5LMGNlc2M0VGxsdWdvdFhNOTMw?=
 =?utf-8?B?cWF5Lyt1d1E3RDNyVmxjL29oL0txRUhjOG0vakFPVnpVa0tva2ozdnNrbTdF?=
 =?utf-8?B?bTZQeVIxc2pibDBrYkFHOUQrcDZDMjBFUjdJS0EyOHNmaUM4TEtFTmdEL3ZW?=
 =?utf-8?B?cUlFSWRudkdWcXNGWXlMQzlmRVJXRW0vUWNDL0hlaGJsendjNytlZSswUVZn?=
 =?utf-8?B?RkphV1hZK25JU1l2dEV4alIyVW5MRGZaNVVxSEZpRUZTeUs5aHY1eWk1ckNX?=
 =?utf-8?B?SlFETU4yTGMrekdTakc2WW1yclRqbFA0V0RuUHRrZmhkVW5RcWc5MXVUTjVq?=
 =?utf-8?Q?Q/ldTG/NPXcqnf5SQq0RjiqFK?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0072b6-8482-4934-c104-08ddf503bfc5
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:31:00.9809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlBeOg5FedQ1Edk18mLXGYlZkPzmbm612I4DJxD7Ohzfy/b0aSS4514kelxQ5YQ5DePquMbe7d/6nMs0qyv9Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_023113_602914_DDB73804 
X-CRM114-Status: GOOD (  14.51  )
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

Hi Jerome:


On 9/16/2025 3:47 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Tue 16 Sep 2025 at 10:06, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>
>> This patch introduces new clock support for video processing components
>> including the encoder, demodulator and CVBS interface modules.
>>
>> The related clocks have passed clk-measure verification.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>> Changes in v5:
>> - Add Acked-by tags from Conor.
>> - Remove unnecessary flags as suggested by Jerome.
> The request was "in an another change" ? Why was this ignored ?


Sorry to bother you. I'll drop the flags for 's4_cts_encl_sel' in this
series and submit a separate patch later to remove CLK_SET_RATE_PARENT
from enci/encp/cdac/hdmitx clk_muxes. Is that ok?


>
>> - Link to v4: https://lore.kernel.org/r/20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com
>>
>> Changes in v4:
>> - Add Acked-by tags from Rob and Krzysztof.
>> - Fix compilation errors.
>> - Link to v3: https://lore.kernel.org/r/20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com
>>
>> Changes in v3:
>> - Rebase with Jerome's latest code base.
>> - Link to v2: https://lore.kernel.org/r/20250814-add_video_clk-v2-0-bb2b5a5f2904@amlogic.com
>>
>> Changes in v2:
>> - Removed lcd_an clock tree (previously used in meson series but obsolete in
>> newer chips).
>> - Removed Rob's 'Acked-by' tag due to dt-binding changes (Is it necessary?).
>> - Link to v1: https://lore.kernel.org/r/20250715-add_video_clk-v1-0-40e7f633f361@amlogic.com
>>
>> ---
>> Chuan Liu (2):
>>        dt-bindings: clock: add video clock indices for Amlogic S4 SoC
>>        clk: amlogic: add video-related clocks for S4 SoC
>>
>>   drivers/clk/meson/s4-peripherals.c                 | 206 ++++++++++++++++++++-
>>   .../clock/amlogic,s4-peripherals-clkc.h            |  11 ++
>>   2 files changed, 213 insertions(+), 4 deletions(-)
>> ---
>> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
>> change-id: 20250715-add_video_clk-dc38b5459018
>>
>> Best regards,
> --
> Jerome

