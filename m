Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B4CC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ5dXOOWYXFVcM6x9nGVblT1wUHAuKXaLQ/Eg3mA7Fk=; b=2ZsD8ivBrG8asFp7t9A2dqi9Ah
	5vOIQjuHGgPv0h2ICLOjbAttfQOvRjr5WT6mTLcLRcj1S2SR5VFOApE2ikWzyWYJ2bNXpNt50JYP6
	l15hWiKML0aNgQ8/1UZymz3Jpvi6fqbQ2VdSLFm7V/9wDpF4opiBozozuNrNWmjBtvG9xKMlz9Mlj
	Qnieq+kC0uf7ECICJvncey2PfzMACpz/77WSVni7MCVBDZtX2RhF6hNRxjRHp8syk/l3s0jdxtKZ7
	J9XNeD2FSZq/VPympbNFnZ2j8dAepD9g6+412+31+uBZ+wof3UgjwJM+dIsejMsnqktMdcipwH8fk
	SFk6Rg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQj7-0000000AaEU-0MDd;
	Thu, 30 Jul 2026 13:23:09 +0000
Received: from mail-norwayeastazon11013049.outbound.protection.outlook.com ([40.107.159.49] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQj2-0000000AaDG-14y6;
	Thu, 30 Jul 2026 13:23:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhaHrxP9DyQlWFgxdVTtlilsVShsO+dXP97uZTmyD8BQpYD6nysnpmAY424sQ8kfpifQCcYSGxnmfEQgLL5UShvoUxWkXt2Pd0m7ATk+zeSseAn1rZxTP2aAKXKkZ0wFox9MHgUMZdwhwVR8yfIAbIoVQrjyj1Q8712iy26+v3Z06yOLFaV5lG5bik1GX7eGzieeOBKlbuj9sgzPCLooZ46HXREbtABjd3/DcEf44J2aPT1s/xOQSOM/7Mi81xMZOgeLKR5dTrykiu97pit1NX+b+pIgQjm96wInudN2xoI/C34dZCGX5u83gLXi566zQlSYfggR6VXqD53kjIrlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQ5dXOOWYXFVcM6x9nGVblT1wUHAuKXaLQ/Eg3mA7Fk=;
 b=Rp9hv4x/cM0yDk9fvPrVW2bQZ9Y/2++z+2zZfWRwZeIS1JWVuhRLZENMerZsZ/oXxpDigSz47aiQ0bnqvUS4d2De+9yf+5OmDjXd6EVt/c7tKmcLaLhMQVCU/ALqYIcvEAvCw5cwsxunbUMnPCgl/IDZvyHdtywTmCwZ5jkX/W1M1NYh6c145A4HSIAVSkaA8BhrM14epnJGXVrso3pRkG5A3qqEuvSpqhRThOxe0N0ZXqiyOEzy7bbn8ME3hBtSRz0nNLBf2PrzUbIG84flP4GRT18eITlWuPJdOFQgl+Cz0krvC6KUz23XfpW1rzz+97okla9HlCeuCkcfSXw9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQ5dXOOWYXFVcM6x9nGVblT1wUHAuKXaLQ/Eg3mA7Fk=;
 b=IXluj8yYLmkrma0TFlgCV2LL1lJ63bkWM0U19AbMrt7gv39YJzOJJLBkQI/q8pDYsbzBB+REl1sMeJ2LPtgRExCWwfymxs2uZzuhKNNIRECVn8SDfJXi7wd1Wdcw4m4d7Ljj3leHGDxRC5IGtYaLZEKwOD34/U6NlBoozYLRcpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by PA4PR04MB9221.eurprd04.prod.outlook.com (2603:10a6:102:27d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 13:22:54 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 13:22:54 +0000
Message-ID: <2b7519cc-9e22-45de-940e-2996c2423de5@cherry.de>
Date: Thu, 30 Jul 2026 15:22:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: rockchip: add CAN-FD nodes for RK3588
To: Cunhao Lu <1579567540@qq.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 kernel@pengutronix.de, Vincent Mailhol <mailhol@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260725-master-v5-0-75da459d2b93@qq.com>
 <tencent_BE229ADF4693078DBBCC6C02CC0855C01E06@qq.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <tencent_BE229ADF4693078DBBCC6C02CC0855C01E06@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0031.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::10) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|PA4PR04MB9221:EE_
X-MS-Office365-Filtering-Correlation-Id: d71ad0a7-c58d-4448-c717-08deee3da9ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iCgN/mFWoMXncKpVi9r573z3sJtZIdD3lnvrOSDhge7u8q9JdRkv951Fmqs8W253SOAZAOBR9b2ALXbSckWN2TpdOxY5D+gq7kKxiBlldg0V6Iu4SxJi/toKxY3DEU8zScKCiSXrpoPr/ADKXob9IVpqYdiUQdp7B63VyJ0Ax/VuuMkAMsIyOyctkeozX30Mbx8cv5C+9MLW51uomdNXcGIf8uNwB15cKs1xodJRuHWszEQGGZJQzTVCQbGYeuJLgQ8qzoT6GptOUS1vP7ZqGBOd3qIglzCbPV1ZR50HYhHUmOeeJmvACKnwCIX51Y6C9WEF6Eg0greSl4YtKm19Rcz2S/bzaD3II7a5QZoCRJ6Nj4mgp4VpPl7IKBXdmsBAh9ZIWv8tyaNaEqHuyfpHBIUlv9O0lONCb0FdNYjRzP2TxcBQlaG0jBA2P+KcvMzfAYY2t8OQkQLRdChUpO5pbBn6O87nTrnnCqm76QjBVDDjhFitYt/rYtRWSIe0Ogx4u/Z1HN1FW8YAP5kh2bl8JflM/8PX0KR7TwXV4PbAIc/5SApZFuGUjnRHrzBAL3CDY5C3qf/XWbUSW24zHttU7N18BZ6YZ0ggiL7m3aWBpyr7c+uMWEas7uGkuCVaNbmcRoMQFcRJQa73DJaUt9VlPbJ+9BV5HNhw6ZHiZOHBQU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDBnSmJxcVJsSlB2R3AvKzlzY1RtbmdQcDBldUJQNi85bFJQSm00NHFPVUdL?=
 =?utf-8?B?K3NUQ01YVDA4TGJSa2s3Yis2SGw0RVJhMmF3RTh6aUJvajVFNnVrTWVtb1J1?=
 =?utf-8?B?M2dzZ2xGMFZ3dU9BMk41eE8yZVd0Z2hHeFVDZTV0czZCOWFoZ1JxRXNhUGlz?=
 =?utf-8?B?TkpUUHZMSlRjK0Z3SlBWM0YvMG55eE9DaVJUcGxaMGRsSEYwN0FhRGZUaXJM?=
 =?utf-8?B?T3lYTVQzUzNFa0M2MEhYNmVRbTlWeEcySExyZ08yVEljVmovOW1TbVBRKzVD?=
 =?utf-8?B?UGVUZUJXakRpUjZqZm5MOGI4aEtFY1hQcDI0T3hCdHAzRW8xVkhQblRWWFEv?=
 =?utf-8?B?OFc3NkxxMzRvVUpzcG00WWh2aUlZd2F2OHBrbS9SRHpWcjZlLzVoWUJ2U3lw?=
 =?utf-8?B?aU8vZGJ1d0VaSTVpRFdOM0gyM01PRlJtT1IyTjcyNGtFdUgwa3UyclJBZUVR?=
 =?utf-8?B?RWJDL0g0SGJ1VHUzUnRpRE1FdHEzdGpyQkp2djdZdmVjNURYM1VjbWtwWDNn?=
 =?utf-8?B?K2RybnFncXVnbFc5SGpOOFphTjBkbUE1S2pDY1hwbEphU05oZWthaXVYb2Yw?=
 =?utf-8?B?NnpYaG9VazFSNE5tNG13MWdCOUJ6VWVWT2wyRXBmZjlVaHJCTTFOeGwwYmtX?=
 =?utf-8?B?UTg3WFdLQXBCd3FJWFZzdnBSN2IvakM5b2htQ085WDVpdWlqZlhxVllMa3E4?=
 =?utf-8?B?YVBWeWFkNHdrOVVHZUdOMUhZeXFTQ0p6Y01WU3BoTUJ0elhmUGliQVhWWGxG?=
 =?utf-8?B?Nk5YQzhXZmdDNUN6SHBoWmxQVW5nZjBqWjBSYzBBVGlSUXVablp6Nmp4R3RJ?=
 =?utf-8?B?K2pVZCttbU84Smh2Wkp1aG1ZVi9sY01DK1NJcmlrQWlOT1BsN2FZL2FqcjY5?=
 =?utf-8?B?SlNTU2tYVUVsd084U0JjVE1BbVN4c0FEZEFFUTh4Z043QWhJZ3JvbFZQTmtz?=
 =?utf-8?B?WW4yLzVpMzlPL2xsVVVuTCtTb1Z1RVk1SWVzNDRwc2t4blNRWXJWbnYyckZz?=
 =?utf-8?B?K1MwcG55M3QxRkxMMWMvbXhNZ0NlZXhMWEhFKzkrYnVXY21DYkUrRTRYMU4v?=
 =?utf-8?B?MzNEbmdBUFNCaSsrKzBCU1UzZW9BQ1o2YzR5MW8wVk9ucytyQWN5cnBvOUZ6?=
 =?utf-8?B?TExoVmNMR3c5WU5jTk5DNSsyZkk4eDVmaFpjeHNsMk1zakxUZWFZc2tzT0F2?=
 =?utf-8?B?OU1HM1VmWXR1Y2x5bVFNaENKWHNiVGh1T1pTNmR4VTFBWnFNOU8zSlZjTWNB?=
 =?utf-8?B?YmV6RzdoeTZXQ2FqOW9KV2I3dmdpY1dXMm9zS2k3SElyRlFEWktHSG9NbDYv?=
 =?utf-8?B?aDc1dEJpVXp1Z3RodXVXck1HV1VvalJkTiszSVprWGdDeXViZXJ2THRIOXZT?=
 =?utf-8?B?SnQyR1hWanVZUWk3Rk5INkd5SkcwSjRFdGlFbE5jUWdWdnZKaXBPYzVlY1dJ?=
 =?utf-8?B?N0dXdVRJSjRJYVlPN0pJcjJ6Q3hXdXVzMkFxckQrOUJFNHFPanE1MzIvQTBt?=
 =?utf-8?B?WGZQckwwRk5sV1ZYU1UraVhkd3RsR01yUkhBdjhWWGxmNjFQYmFCd280UXlx?=
 =?utf-8?B?YVVXMHVONFB3SGJGbVBDQmxtNXhCTXdBNGsyT2Q4YVYwNGhUdnhPWnZ2K2gz?=
 =?utf-8?B?bi93NmhlVFRUUkQ1aDBzUEJNNnZIcjhLcUpReEZKbVZGdVNCNFJXbCtBNUd6?=
 =?utf-8?B?S1A0em1nbFBmS0xoRlhEUExRTWJPNHBpRENna3ZDT0FIbXY2ZlBqWjFYdUtV?=
 =?utf-8?B?UTk4RWxoOFY1cXdzVWNMcjFHelhhcFB6ak9Wb1QrWWxDcmtZSk1IRTNwUnBQ?=
 =?utf-8?B?OWhXSWRmczMzRlRwOG1MdlMxV0xiVVJwTU1xbExOYVlSZURIY1JtSWJzdHdV?=
 =?utf-8?B?c0c1Zm85SzQxN3VFb1BXb2FOWnF4ajYvVW5lUWV6U0lTSlVITzVHQ3d4STRo?=
 =?utf-8?B?KzRmdmd3VGhhTGlCRVl5dGZNOEFaU0t3R2hYL0pqT0VXQkp5T1JJcWhzVGNo?=
 =?utf-8?B?MkFwekh5L21NSjFPaGVNOEUxblV4aDJvQzlMdWZrcDlpZUxjRUtBeVdPOXk5?=
 =?utf-8?B?eWpqNm1nMUZ5dHRpZyszYjZ1TUVKaVFROHRyT1dzWU5xUDBaQ3g1dlpqVWhC?=
 =?utf-8?B?cmxBMWovMFl4UVl1enVyZWtiRTRJL1JOdTg5THBFK0ZTRDJQa3lweGNMdkRE?=
 =?utf-8?B?TmtIblF0QlQwK3hncnpsYkgvZCtRNzROWDkwL0tRMjM0OU5BWCttSDduQzBP?=
 =?utf-8?B?cW9EajBXU3FXcUp0b1RtbXpsOUZvbHdFUGZ6MmpSRXhoWkJMQmlsNHNoZG0w?=
 =?utf-8?B?WjcxMmswQzJZOEZTQjMrQzRxemMyMTVhUTVlREZRMzIrbXU2SFpaQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d71ad0a7-c58d-4448-c717-08deee3da9ec
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 13:22:54.6703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kogD20edc+nTrvadNutN2lqGZPAt5GUT2LpQjFmbk3ne/NZo+RcwBTrj1BJN3mQZqha7TfJZwmPymOunvh6LHruTpfHykUuQ80egKenU4UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_062304_335968_2D69EA95 
X-CRM114-Status: UNSURE (   7.13  )
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

Hi Cunhao Lu,

On 7/25/26 9:03 AM, Cunhao Lu wrote:
> Describe the three CAN-FD controllers integrated in RK3588 in the base
> SoC .dtsi.
> 
> Add CAN0, CAN1 and CAN2 nodes with their register ranges, interrupts,
> clocks and resets, and keep them disabled by default so board DTS files
> can enable them as needed.
> 
> Co-developed-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Jaguar

where we have all three CAN controllers accessible (two via an adapter 
board). See 
https://lore.kernel.org/linux-rockchip/20260730-jaguar-can-v1-0-9b566bd785da@cherry.de/ 
for more info and the test setup.

Thanks!
Quentin

