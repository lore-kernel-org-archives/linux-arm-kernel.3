Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2ABD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZYM++raZ47EZMfF15mdsAvFFPumTfvulpnoHzZryw4=; b=bj7cc8D/P3bcgEd3vmQsSDbVOL
	ablKhvMDioNH7ns/QdwxYFrqASL/wvURkqQgtKRbyQTvgC+/BNVqZg+do91JNxdzdpuV1BxAptc72
	N+45HzhjqplYfUG/1MlsqWjDSLrJIRh2bFwZJxxTR9QtAdeSRm6Gh0Tillp/JEikT+x6JMnQQdeNg
	ZR8lOS9lHjZmS/9YgCpR1ORcxmsxMeirJnQQaWG5OK14naOUIjKFNvzwoWPjsVGa1bkXacakHbdh1
	WESIiKjyAHaFz3/IpEbUJxLrlgEfh3Mzap9GCA/xSSqlIx7IMZ5yFKQw4/R526BG3wT68YSQXHF2P
	MEHrLlHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5If-000000048Kn-1f4p;
	Mon, 01 Dec 2025 14:54:49 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5Id-000000048KO-0hSq;
	Mon, 01 Dec 2025 14:54:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICbdbKymvCEV0ExXVjpL2PYTXt7NQ/KtReqCbcHMKnyPF9sXvdvQkfElCI9Y9ON+NXFDOQMpv8PBDVng5nuu8ZgzhsgZUDkohFg4jPNgeBhJn+cJPV2VLRs6yWdrJFlt7mxHdY4xR1oMKpJjHlzzVep2ylUfQGLepg8mBUBNeMGBWgO84oAqFVKPJz2j/L6OmimOOGFVH74dZtuh7h06JMfjQdrAkfXFW8RAfAgBHPHpOH3+sEe6HYUmK/wxlu0aRVz4L3EEYgsE4RLr9CHvXUvJD9M1rXsdD3jLNnZQdLxC0QR2/hdV26WtD1z1BPxIJWxTHJhkc3Tne+CH87lI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZYM++raZ47EZMfF15mdsAvFFPumTfvulpnoHzZryw4=;
 b=fYSnYtHUm6C7TMzO46zuLjFYFaJppIz2+B0Eh9im6HHiv8Vo1VXO4iZURQbfPbsMK3kOryc0REWkN17AzyhKnJ0dpuUMtjQMV5ZjJhrz/gp9+VlSQuyFjpNS3ZQ2+MOHwey4jZP+z6HdmPVJTxegElkL72PKF4IanLVwtmr01ncIySf4CmprcBysoc2BfeG9jb4WbnGdtq8ZAmrKmW+bpWjuXALzBWC4ZsycBrc2P9Tx2ZdekBrlv6EKCzFW6vygIw9v1BhSjxnP2edEa8t2w+i48VfOH7sN9f2ObT/q70TLw5QpZViX21O54bCheuqRIij/041lLkWYYP2K7y73vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZYM++raZ47EZMfF15mdsAvFFPumTfvulpnoHzZryw4=;
 b=MPSf2pm6ATIEUrb+66PDS7NowisbeSuv51ORZzOhlaWi2JQ1eMGur24Tl3S344rV0dPHL7X9+OxvYqga5mtnoloFxMOxYHLHVGol2W0cp0bvKJ8Fw8oGBB7IzlF7o08oFIaGK3tpYyejYseEJn7ayoN6b27GF4AtehixiqlnM+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS5PR04MB11345.eurprd04.prod.outlook.com (2603:10a6:20b:6c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:54:41 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:54:41 +0000
Message-ID: <54b26cfa-e231-494b-aa7e-cd21069c95a4@cherry.de>
Date: Mon, 1 Dec 2025 15:54:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Correctly describe the ethernet
 phy on rk3368-lion
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20251020100757.3669681-1-heiko@sntech.de>
 <20251020100757.3669681-4-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251020100757.3669681-4-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS5PR04MB11345:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d56c39-b023-4ca6-36bc-08de30e98eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0dJcWs1a0ZJeE5VdUJXcVIyYUpmekFSejdoOEtGM1grTHdZUXErcGVMd25u?=
 =?utf-8?B?SXVLaEt3UEJITTlBaFo5cnFDTHJmQ1VrYnpPM2dnRjNlZnpPczhkSFZGblZn?=
 =?utf-8?B?cVZ2UWNlRCtOVzJJZ0FPSzM5R0hvS2kweE92ckx2QWVGeGVsUzZSaDMyRHFI?=
 =?utf-8?B?a0c1MjQ4MmQ4dnFLaW9aMVArWEljT1EyRGpsY1VKWU5DTW1IRmFYR21LQkc5?=
 =?utf-8?B?eVhNS2VqcUZIbXhrSVhXc0RTT3BTT2JYNWlXazRLOVpLRUFmWWFkdmxxNk9N?=
 =?utf-8?B?dWJPVGNuenFvVVd1SVJoUHErcEIrZFhycHdZNkFQTncrT3dHekVXOUNmOXh2?=
 =?utf-8?B?V3J6VEtsZ1RCV2VOSmNRQ0QzNElxMFRvbUZBc25IbklualJ3K3BZYzA5eTZM?=
 =?utf-8?B?K0pSd3dpVS9GZTJMc280cHYzUlBsTWp6Mkh1cjY4ZUR5cmhUa3FPTjZtb3JV?=
 =?utf-8?B?S0NSQWd5VjNxWEhUMzRHbndUajA4VkE5NHFXNEs1ZGJRZ3A5WE9CdUlVMlo2?=
 =?utf-8?B?SlpHWGpmYms1TTJqU0NaQlpBYkgyaEM5RGxsMzlZZCtEbFVvMnYxMytMSWtD?=
 =?utf-8?B?Qkh2V2ZJUHVhbHhwaXplL3Z0MjR3aWtEVFNaZFdzaGV1SUNKK05zNXM3bE5Q?=
 =?utf-8?B?NmNNZDcvdnAwdFhnc2RvcU5TcmtTOGw4emw4SEhXMkpoK3RMQWpsbytwRm9O?=
 =?utf-8?B?SDJBcnVKM2hwV2lJQlpPMHNVT09HeFQ5MGZhdlJTTXM5OWRHTGFBSUVKL3Vp?=
 =?utf-8?B?UEVrYm1xMUVqK3NnYWNZRXRWUmVYR3JQdDVocDdNc25OYnltbjBncjlSWUpT?=
 =?utf-8?B?VC9CNGpXaUFhU0hEZVQrdDdqQXUwWGFMSVZVQVZKMGo4aWJaU0RmZENwcFBj?=
 =?utf-8?B?K2FIMmRNUUtBb05SS3U4eFhIY2pRUVd4WGFYZjdHWnl4aWRmQ2dmR1dJengz?=
 =?utf-8?B?WlRzNkdObXFOdHN3Zm9FOUdqdk02eFBaU0QxSWdrVHovaUdUbXNFVFl1U1lr?=
 =?utf-8?B?b1MxS2FZSTVkN1IwNFBIQkNyT3RLdXEwT0ZEbnNQdEdkOS9INGlyRTc2c1lm?=
 =?utf-8?B?NGhMdGpzeEVrTDFTYmQ1eUZRWHM4eXJ0RU5QRG9WYVNYWWNrcWJUNGFUd0My?=
 =?utf-8?B?TGtiby9TV29KOWRwVGd6MkZ4WlgzY0VTVGRKdXNEbld2Z1RWWEk5Qm5lNVo1?=
 =?utf-8?B?ekNIKzZhMllvN3VXV3E4TzJoczZBUVlsbGJ6ODV3UFZPcHVZdlVldlZRTDRK?=
 =?utf-8?B?L014eVc0ZVYyZzk0K1J4VDlxNDMycmpFY1Y1TitXTHZDZkFKOHZob1JEYUpE?=
 =?utf-8?B?T1dXWHNRTVhPbXNTRmJNRFlHTWRvUGJsT1hYS3g2dEt3UmtvMS81K0NTNW1V?=
 =?utf-8?B?OWl4WXpDQkVaTzh2bldPM2F4c2xpNEhFTnUxY3ZJc2xnSkJoUFpORHlOMjlm?=
 =?utf-8?B?akZQYWNsQnBBd2poN0k4c01HU3I3L25XKzMvZjdYMmM4Q1ZZVzJha2p4U2hY?=
 =?utf-8?B?aFhyS0JDVm4zaGR6bEh1ZnlZNmZVaUlPaEp5QmpUaDd3aWUrSEJMOHRKVGJS?=
 =?utf-8?B?RHdDN3Q3VFhUNTNkOVpXWURIZCthencydVJCMDZRWjE0dkJDcTFkL2o1QU82?=
 =?utf-8?B?cmMyQ0dvTmxVcU5SOENoQzlWQSsvYlFXdkFCMkZrdDNwYlB2QW5ONmVJMFJn?=
 =?utf-8?B?bEZHWllHd2U0SXErbHJxNnMzM09YRFZsNjRDRVUraVhOeHl1aEJSQVdyVE0y?=
 =?utf-8?B?VlZSNFVMYUVRdnhPZmIya01UNVlyYWFIWkFWZUQwTUFGOWpWdXRZZzZDZHVi?=
 =?utf-8?B?bU01RzUzWnpGNUJPWEZhV3JxM2M5SzVxRmVyQzk1SDBzTTFSL1VqbFdsb1ky?=
 =?utf-8?B?M2ZNOG5GVlFyc2NsbVBvMEV6Z2RkbU85VnJaaFRoMjlTYnBLZE9UTG8yd2hX?=
 =?utf-8?Q?V8AHeANbufiQbFO5EYUusENeO8fl8v5S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRUU0kyU052YVdIVDVQbnZLVHRWRlk4NTVvR0Q2SUVBcVhHRXZiWll0OWJm?=
 =?utf-8?B?OWVKd1ZOK0FvSU5QdWkwMUFRUDlXQnY3ZjNXKzBobnljSzlaWDBJQXM5TUFs?=
 =?utf-8?B?QWNpMDdVOXFzM2xSL0dwUHhGbEtkcDRwWmJndmpNa0IvOGFsU094SE10eGZS?=
 =?utf-8?B?Vm9lUk1Ya1Z5V2VpbTJ5bUJZQ3pHTWswdEJudEdZTC8xcHdibmZoSGx3amR6?=
 =?utf-8?B?N0NuMHBRd1BQZFJVUFZNR09oRUFkY0kxWVpkdzV2VzhvNHBhd3BnNmRDL3hD?=
 =?utf-8?B?L0k5eU1sRm1CYUk4d0ZJWS9FeFMxOXRqdnRTVHZUNTFlYlBvdVBXdE5DZHpO?=
 =?utf-8?B?clBhQ1c2VncwaCtzMHFVaU9SU3V5NnkrSC93N3JFNWxpb25ucVhoTmJleU1j?=
 =?utf-8?B?aThwYjN3cUJ2YU9RNTFIY3QyYnZ6UEhiVmM0K1dFNW1pcEIxSm9ZM09TaWJw?=
 =?utf-8?B?L01Wa1VkTFB6Mmw1QlNkRm1veFlYRW1TVVBEalFmY29vNDA3K1J6UGtMMTh6?=
 =?utf-8?B?YnRsMTFpbTY1cXJ6Q2Q3SVlGcXN3T1pBSXRRSDVxL3VhV3U2eWFhR1hpZ2FJ?=
 =?utf-8?B?WWRLMHlvTlI0cSsvd0laN3BWOTJiMUVPRVE5aktyYTA0QXpnWnlIMVA3Q1Zw?=
 =?utf-8?B?QU1rM3ZyWms4dldvNUpNcjFaQjVWOW9MZ1pDTU91VWF6TXdWWGQwRGdpaW16?=
 =?utf-8?B?c0ZoK1JITzRxZlNvYmJpNXRKenFhaVo1NUhCNUZnWUNXanNiWGtSVk9IMm9C?=
 =?utf-8?B?d3lZdHpsYWJ5bW1VWG5OejN5aEE3WURhcVZuanB2Q0JkVm1TeitPcEZ6SUtX?=
 =?utf-8?B?MEhhejhyS2NTaXpDQ29ZZW9YWTNmZTlKN2hoeU1JaFNSMG9vYkJxck80aDNS?=
 =?utf-8?B?RmE1alhPc0N2RERMcjBBMU5RSFI1WHY3YzQxZlJUMXZSNHRyQnFDQkc5TUlT?=
 =?utf-8?B?Qmx0R0luUWs5ejZJRzZzSVJPY2QvUHNnLzk4akdONG5SYmkxSU42UTRNcEJO?=
 =?utf-8?B?c3Y5SldLa0NhL250TEdkOXRUMHZiaEV5KzE4RllsT0JFdFBRS0N3UHAwM0Jo?=
 =?utf-8?B?TjFZOHEvSVZ2YlBSRzFUcHlnQmpIVUJpMjB2V1A5TVpjdE9xdG9HQjJ3RXNl?=
 =?utf-8?B?SXhxenN5ZFhlWXo5czhLODhtbXp1YndHRk1uRnpuSlFoTU1sZjVGSzBzT2dT?=
 =?utf-8?B?MlRYT29xaHNZcndFeXY5WGdUaEJad2dIK2lVK3A3d0RoQ0VrQzVGOU1KQjVa?=
 =?utf-8?B?eGlOWjlzVWxKbElBWjViVld2VFdGS05qNUJMRnAvbVFHVC9rUWV4a3lBeHVE?=
 =?utf-8?B?a01FaGIwNVF0T3dpUzhHSGxWWnhwSk1xVCtuSFUzYldzOHJOUXp4MGNVU0hh?=
 =?utf-8?B?blpSeFlIRlQ0cFZKR1JmSnRhRDJJOFpXQXgwejQ4WGdWdmJDa2x0bEJ0Wlg0?=
 =?utf-8?B?S2ZHTXh2bDEzcVZwRGR6NE0xWGdSaFJnNi9ERjVPdzF3NmsvNnFVTWlwN0di?=
 =?utf-8?B?YWpOcVBJNVFzZ1d5QnN1b05qVHlXcGlwVzNDRjJSVDBYRGNFRUd2NFRWbjdj?=
 =?utf-8?B?dTlpVENrZ3Eyd1VaWWQyVndHY0J2dWY5L3dMRUtDYTUzMmp5akZmL0VGMVRW?=
 =?utf-8?B?Zm8vRXdNZHpzZXVKOGJFK0RseFNMTVVhT2Z3L1FvU1pyMGhMOFdXUWs4cERF?=
 =?utf-8?B?STRyYkVVZmY1d1VkcG9qTW0xVFFLU2lPd2M3NkU1d2tHQ0RpaldCSXlGRDJT?=
 =?utf-8?B?MEZQeFVIYWNvaUJVNENvUmpiUUk4YmZXY0R1bHhkeTc5bm04NUF0MmlLanpZ?=
 =?utf-8?B?a2hsaGh0M3dmNmIxeWNmVkdocmx2Qk03UVNzTWY4V0NmSVREQWxtbzRwVGJk?=
 =?utf-8?B?dkFPRkx4dlJ2d1FYbVNQS29kdTU0VldJUHhOZWdJTTB6elZpVlNjbDVHMlhq?=
 =?utf-8?B?aGpuYWdiVjZXeHNXdU5iaUVCblB1L1pGOEJoRzRDOVRZdG9La3k3aWxJc3Ez?=
 =?utf-8?B?em1BOURpd2orRTQ5K0g0UEJ2WHRHTFZSNjRiL3I3YzJRNVVTcmJuZ3M5MFF4?=
 =?utf-8?B?cnI5dlEwdFNVYXdFUExOWkZzRG55L0VWemhOS1QzeXNvMHk5cmkwYm1RcU9m?=
 =?utf-8?B?UnMrOEpkc2Zod3pEY2pDaGpFSXF2UmprQUc0YjJhYng4NGo2UENKa3VTQmRK?=
 =?utf-8?Q?kr7Lz+8EYIy3pqx6nmRKqcU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d56c39-b023-4ca6-36bc-08de30e98eb0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:54:41.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THHhPu85aIj+AmYnho1/1Bcj+Wes0+CDvNrJKoKlt67fvEB8cWjbXG5ZCNNUOAmJtSoCQQLijSPrSw/+hFZYSzHDDiLLZ4mvo37a3Hq/1A8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_065447_229418_7C664991 
X-CRM114-Status: UNSURE (   6.86  )
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

Hi Heiko,

On 10/20/25 12:07 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> So far, the board used the phy implicitly using the deprecated snps reset
> properties. Improve that and describe the PHY correctly under the new
> mdio node.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

