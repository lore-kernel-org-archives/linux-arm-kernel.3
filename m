Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F30CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RLUTTsaZAnX5l+marMsgs4mEHG763Qh//huNcgH3C4=; b=10ndpX4aZa4OM1TSmtpeJT14QB
	Df+e7504FPwJFhtOGBWeeKIcUHuEULVuckxDhM1Pr4SfJs6hqfHqMgszKHMKyWKzVG/KsKpi1nMAa
	TzCDt2L8W3yRE1tdEwpzik61+h10BfghyaW2yO1o99hpz/NvUrXVrxnVS1/uGeXCFImP+Px6vhe0H
	7/5i6TGltERlrEZbmKtA1RI4AKoWE3xSilKhAtKs+zgyigoV9Ej9ZHU3umiPEed8NQ0+DeGRviRso
	fJpE+cGESCw0OEA+izRn76JBCf5E5JTqR7qcISHo/3qez33u/rCd2ZbF87MoxxiIvZ4LS12YSbcGn
	eXSVg51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFQN-00000004JRM-1ewJ;
	Wed, 27 May 2026 14:39:59 +0000
Received: from mail-southcentralusazon11021107.outbound.protection.outlook.com ([40.93.194.107] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFQK-00000004JR0-0hps
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:39:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4fdAuJc9zTs6oUQqu3vt9BxeKbaIXvMKNW0kdgFQm4erlTJoz78spi5R7SE1VEhRou3/pGdDs3WHeCuAJ/jUFZuvZ5uAug0mb5Bzb+dpIg03l12ZLhHol3kRXlxu9IyzfpaMpgzA2vu7FlPBn/gh4PoHr+wkF0OHfPlX2/VsL5nV6A/MvB3dDX8T3a8bz3hzEZ5uwEeaaulriCUXGiBHFZoSVMa/UexJpdDiazZWx9QpV9PueySgHERtMSkJtKZrhH+044IpoE+EkhqDOjQjDVdTmAcBEa5pp8RzyzPAcgfidNpIJAuKWYKnmCO6MStOMW9s8vmu7aYP6VLd/AGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RLUTTsaZAnX5l+marMsgs4mEHG763Qh//huNcgH3C4=;
 b=x7XlojM5EqX6J12KvDrCTdOTvENHtmnLM+Ddhif1uTKPtDYg66XW59L197no10pNHNtVTFRIW5K9DzpNa611xkVyl+lE5k0Jx9YSwhGYjypSV0Q4T4gNDm9/9wDDO/PeUa6NNZlifYBNRziZgVFeWIwkehW+ufh9P7ozDO3YvGh9osAeY3zkDizqdxbUV9Xm9X+hVlq8PLFIRk4wds51VU7a0yozu7se6GoROtaZR+5p435kdZdmbi+gouoTPem8G6OZgMNAHdYonXw4bZjhZi+3Y2PW0gT6rlCSx1J0EaaMMdLtQaQe7Gi30voodHyK+xvgeqc+uW7XKTf93Aqlvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RLUTTsaZAnX5l+marMsgs4mEHG763Qh//huNcgH3C4=;
 b=oYYPgCf+hKyJmyt+A51WvacNFmkUWcCluCGgTgUcYvj0myiYE8vFkNk9qATqAFkhrt8u+kEMf32ZxKhxKHs4iY7eeyk1h8/Uz0PvfJ+1nWSBHtGCPg/zvqXfb54jbkPScotrrdL8t5e6HQXm9Vkit6cPZC75XWZDsZ3ADfgGogwgjkuK8QMErMi8KPBzIVXiVrPYcc3YtWiP0hn4H/Wp1KfDG067SCndX0uqVOTzRhyTvQtTQ8Bi6v5DX+afKm4UQZFuNGYj3jaJ/xsbMwDb9o4IdydUtdmIlvP3vb5VEm6ABn6EaFejHdCLZpM2wqSXBpehQ2/qqXVshL3vAAZSgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by SA1PR18MB6018.namprd18.prod.outlook.com (2603:10b6:806:3ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:39:47 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963%6]) with mapi id 15.20.9870.023; Wed, 27 May 2026
 14:39:46 +0000
Message-ID: <efdd84e3-98b8-459d-90be-0ac2c107403f@axiado.com>
Date: Wed, 27 May 2026 22:39:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] MAINTAINERS: Add Axiado reviewer and Maintainers
To: Karthikeyan Mitran <kmitran@axiado.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prasad Bolisetty <pbolisetty@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Harshit Shah <hshah@axiado.com>
References: <20260527-maintainers-addition-and-axiado-ax3000_dtsi-update-v6-1-bdfdad4fed91@axiado.com>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <20260527-maintainers-addition-and-axiado-ax3000_dtsi-update-v6-1-bdfdad4fed91@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0008.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::20) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|SA1PR18MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: af734f06-f470-47ec-8251-08debbfdcc96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|42112799006|1800799024|366016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: S0VMxWP3LymBdiTzEP917uEwO92vFkuwkGjKF2CLc4pZb02QFB9LUCIozp1NAHpqgX7f1sBly068z4uy8y/eBLeH8ZrXCuQRvf4lRfIBDVdh8fu4xwM65kPLszkxNoKyQbHWYVgxypKnwhNn/IgaJdWEUe564LzZTOAbw3QodUcqvojRTf52AwGbS3g2735MFYaQoxfvM7O/O4IuMo7SYwiQz53i4+E+wkeg7DZ6LqbSPKoLOMyiFka8DCO/SjLsJTSpjdX5mkjaFJxkCmtXK7r3U8cIEUqM/4YfL1IL4axhNMeHxWAnipFOHGrQZxlSFoaN95zY7G0vmymCOFtJk3abXistF4uW9NCGewfD6XpTSmambU7HPtfeN4H0gHplnm6as0v4Tf1TnM+MLiFi4ChkzG88Rt3bVdyY2TpCawzu/Ct3381lyhrnKn3ZpV8Ncqy/XChuyTPNGTAqt7VrmsC79AMTeAZSemJf0wIpVW4HYSO4j8QF0UQpyRcZ6TIwjQ7UN7wRLznsTX90+N0WUIYPgI+rKgg6PAYylaU9p09Bvv68C0WRurVUK8/LInhbjOsrpYajYPtr627U9NQchbDY0G8wSLjBdDLnCRih5Z4aKKPv8kev/duLCmlU3zTdASrq6e7VrYNYN4hqZdHKAacDhELF7EPdaayH7gwZO5u/0t4kXJqy711h3TCWJkIX8xWWbPr2+Abbv9/4Y+peeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(1800799024)(366016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2lINGoxc0s0S1dXQnVPNG5lSVpIemlFOG0zZVJtTVB6YnFiNXp6WmIyOFV3?=
 =?utf-8?B?dHJZaWZ0WjEvY2s1dEZSSWlIajE4ZTF3WE5NNmNIaUVJZUpCQWZvb2xnVjVo?=
 =?utf-8?B?NWtLMnd3SHlkVkpzT0IzYW5wLys5OWt6MUlPNWltZURPRjVxSXNYNDZNNGFn?=
 =?utf-8?B?d0dRTTVDakhIY1ljZGFaZ0I1MEJiZkU2a1Y0WTQveHlBWEFBUHQ1UzBjOXRN?=
 =?utf-8?B?L2NWRVFna09YNjdhczFWNlkrRThPMWJvazdod1RBVzZTVDY3RjBJaUpraTZS?=
 =?utf-8?B?SHJmZWhSczVaOVNyYVdLOHAvL2V2WndMR2RNRXZGbTlwMm1ZNzhBdEViNXB0?=
 =?utf-8?B?dm1MZFpUSmhKZ1dORzZmK2NEcVl2WGtuVjVNalRJaFc5V25tTi92TDVPcXU1?=
 =?utf-8?B?WjZiRVdTckRsN2lJRkdBbHMyYWRESUZYVHQwdWV4RWlkTjZFOVh2QW5UUE9y?=
 =?utf-8?B?c0RYTGUxeGh2VkpROC91WjhTUGlrZldXYVlUazFMZm5PVXNqb25oS1cweFNX?=
 =?utf-8?B?UWVrUW9ISmJFeVBxWmNhM21aZGp4dkpvZjdnbGlrYVlCOWUwNStKTUllVTlS?=
 =?utf-8?B?akV6SlA4SEZ2WGdiSWhvaXRFQnVmQlpzSERPOXdkWVdjK05nTjBGN0pRRFUx?=
 =?utf-8?B?NC84clRPYy9XZGRnNWVsQTVENW80V2JVSG1rWWIrTEFKcmF4UG5MUjFnQm1n?=
 =?utf-8?B?dmV2bHgxZi9Nc29WU1lEeFhEb0tjNlN4R3d0ekI2TWM5ZWdneUExYjFkSDF1?=
 =?utf-8?B?UHhpUTQwZUNLamJwZ3F3WnhLRWVYbFRPSzdHNTMzRllzbnkxNzh4dThEQXBt?=
 =?utf-8?B?ck54OEtGUHFVN0UzTnBMNy9JVWQ3K0RZVlNEWDBJd3I0djFpTVRLcVhhK2tR?=
 =?utf-8?B?WGFiNmJCTXloS01QUERnV2xuQU12ZklNTXdUMTA2b3p0YWJ2aytZRVRuNCtr?=
 =?utf-8?B?OXk1ekN3MWFYbUJTMGlxY1hBSlRhL0cyUk9ZZHk1N2k1TXp2NGl5a2kxZUs4?=
 =?utf-8?B?UlB1aGpETW8zS3hNTTVkN2hZRmpncEYwRE9sOW5vVmp0b0E0bGhvQ2NEdWhH?=
 =?utf-8?B?S0JRS25WS2Z0TFRoZ1h3VldPZnVNT2ZFdERuL2NFdktVTXppN0dkLzNVUC9S?=
 =?utf-8?B?WEZpMWN5MUdoZkIzcW92cktmajExRkg3Z1dGZWlNcjdta3JhZEk1OVpRS01K?=
 =?utf-8?B?c2JPeExCOFA2b2FlRHlhejRKVmJaM2l0QlBkQk0ydGt1eVB0UXF3UmQyQ1py?=
 =?utf-8?B?YTBQWXpYZTVNUnlXMnZUMVI3MmNuSGFRZ3F6WEpmTmVtb0RDNWtoQmo1VjVF?=
 =?utf-8?B?amxmckhtTkpIczlVZVpLZWdHVVA5Sk5SWjYvOE5teElVUEVob0U3RHd5Qzh4?=
 =?utf-8?B?S3VTZnUrWHVvRk1vQlJzL0JHS09lMzBtYXRFeFMwMjFXU3lBamVaZHFaK1lU?=
 =?utf-8?B?S1ZZalNJWndLWlRxMVNYaXdHRlRKNHgyalV1M1hrMnZodmZVWFZsMy9wZGVM?=
 =?utf-8?B?aHdEckVzUnUySHJsT2oxUFR3TDV1TG9BaGl6TFlsaUsxSXMwM2EycFRkb1Rr?=
 =?utf-8?B?NnFxVVZxanBua1BDMUdhR2tlYld0Yk00Q21hNDdhSzFMY1N0c1k2TG5NOGph?=
 =?utf-8?B?Y3VHWW1OZU04MUZnSm1mdFdVNm5UZVBJNjZabGFPSjdLRkpHWVFyTkZtZGxI?=
 =?utf-8?B?RWdWZnpMTGNJc05RUE1tM3dsN09WR2RjZ3BuUzVTdlpXNHcxTVNXY1pMUExE?=
 =?utf-8?B?bDJpcG54VXZUY0xqdjJhL0s1YVdJOWppZUE2d01zSDNJeWs3bTBzYzJvbjha?=
 =?utf-8?B?RnZ6Q3pwdk1DNVBmOWExQnAwTlpsT3NNc2t4TUdDcUtUc3pSL09PQkE1WjFr?=
 =?utf-8?B?enJpb3BXOTIrMm9GMk9zN0wvcDk4aE9WQmQ0ckg5WjgrNmZ3Rm9QWHJCRzNw?=
 =?utf-8?B?K2J4QmR3R1Q3TitEem5oZmtadUdaZytuNng0aGtIaVYxOWtRdmJaM1J5ck5B?=
 =?utf-8?B?VElIMm9uYmIrMVhjMUxITWlubkswd1lNeFpZVDRiUWxyVTFwRjFMVXphVytw?=
 =?utf-8?B?L05Ob1loZjd0OFJFUktTUnRTZnZJOWJoNm1nSm5nR0FnWUJuZkVMY1oyMVBO?=
 =?utf-8?B?NUVvWFhieDk0SEVETzlSRTduUnBEeEJVRDEzSkdqK1VJNHpRRjYxdE1HQ2NH?=
 =?utf-8?B?ZE92ZkZOR1JjZm0xY2lBSi9zRVZnTUNlUkxsMGZlOGVCNW5GTlAzVmRqUFZ2?=
 =?utf-8?B?NFFwOGFTQjNJMGQyRmt1TDVYWFBpTk5BMitTMEx5UGd2WlFSeWtYNDNadE1S?=
 =?utf-8?B?ejJrcTd1WkdZMHBuY2xPbkdQcU4vWVp1ajlyUUNvdjI1MkhHZVBXUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af734f06-f470-47ec-8251-08debbfdcc96
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:39:46.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEJLQJbLGgXo9RYlxzs1diylJ4uOsUjkM9YnrDNcuaQtBujhZRh0VZVcpxaRTJMk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB6018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_073956_221033_54EB6F27 
X-CRM114-Status: GOOD (  19.09  )
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

On 5/27/2026 9:56 PM, Karthikeyan Mitran wrote:
> From: Prasad Bolisetty <pbolisetty@axiado.com>
> 
> Adding 3 new maintainers Prasad,Tzu-Hao, and Karthikeyan
> Removed previous maintainer as the previous maintainer moved from project
> 
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Acked-by: Harshit Shah <hshah@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
> ---
> ----
> This patch removes a Axiado SoC maintainer and adds 3 more.
> 
> A maintainer has moved on from the project, so we are adding three new maintainers (Prasad, Tzu-Hao, and Karthikeyan). also commit message amended to have the same.
> 
> Patch 1: Removed one and added 3 new maintainers
> 
> Changes since v5:
> - Removed review mail-list R:Axiado Reviewers <linux-maintainer@axiado.com>
> - Link to v5: https://lore.kernel.org/r/20260326-maintainers-addition-and-axiado-ax3000_dtsi-update-v5-1-648dfe9bff29@axiado.com
> 
> Changes in v4:
> - Updated commit message to clarify maintainer removal and additions
> - v4: https://lore.kernel.org/linux-devicetree/20260302-maintainers-addition-and-axiado-ax3000_dtsi-update-v4-0-84a5c9df6689@axiado.com/
> 
> Changes in v3:
> - Updated commit message
> - v3: https://lore.kernel.org/linux-devicetree/20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-0-a3b095989823@axiado.com/
> ---
> 
> ---
>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..b1349bd178cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2605,7 +2605,9 @@ F:	arch/arm/mach-aspeed/
>  N:	aspeed
>  
>  ARM/AXIADO ARCHITECTURE
> -M:	Harshit Shah <hshah@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
> +M:	Tzu-Hao Wei <twei@axiado.com>
> +M:	Karthikeyan Mitran <kmitran@axiado.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/axiado.yaml
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-2f37e16b9053
> 
> Best regards,

Acked-by: Tzu-Hao Wei <twei@axiado.com>

