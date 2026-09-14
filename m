Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95808C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Itcd1ZGEonJjNg/fPCWO7nbsBqFJkRDAVDktNAw5wPg=; b=s5AyeH7dQJ2usvJqcVVKx2/IAG
	Ss7ZEkZxzIQ1b6RyZo6+iRriCYGxEZ+GD6jg9UjvPhGCAsuk44QWfoN0wqFWA9cjuF5h6EVc5HGLR
	c4snklXt7Ev9sOu7oCO9gqSZOgkK01rtZxmkEzWRzkJI0w11iggIG8gqImHM5ukBtRoaF1YHUfraX
	WIlmZPQ3EMHuOkCm2JDDk5cmCacq7AqZAMa6SAC2wxdadAqm5GMvAopcThy0JivGUt2a+HPIHp740
	84JaBdNKMHiDOYQl2pnQbaNFsukb0/6B7fjx2gskEehCUwlqC931aub1fNwJ8URCQKM0JvZ4DwhEj
	34qfONhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Uh-00000002cyK-2Hsc;
	Mon, 14 Sep 2026 07:52:51 +0000
Received: from mail-northcentralusazon11010016.outbound.protection.outlook.com ([52.101.193.16] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61UX-00000002cwI-3knj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:52:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYNPqq/7fmyHmpE2qzfo2sSTYrUIC+L/fmeOI8qz0mbYGt3kGi7ft8/q4h7MjNINhuK/cpHlaQ06uTw2OaxMMOcNnzS2bH2PB8Wmfkt1k3czPfHtJjZF8PJ+ipKyrw4uBZCakqNu78F3t4A2ZpreEFq2sZMWqYClDVEKzlo43siHms+/13N8SDJQ2qWJYcxI1RgbwDg+t6/+MV54FdVvZLNHj090hXFh61VNOJzC0YFHM+fpNS7B0M2rIO2CJl/BWmPsBo0JbVdu50wdFJYxjqnUjMMOxWCh4V4eVWVzuu/Kn5AnAoonSi2Ob6oLd6eeZt+FNjo1s6T3oAQOSrBZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Itcd1ZGEonJjNg/fPCWO7nbsBqFJkRDAVDktNAw5wPg=;
 b=vRa4W77fH81Su/VXCsCD9Br/kUBNCIUEYKkQwW4yZhMob3dpC5+WJIUknGu7DvtyrH5tCkfop13gAg/IUJaqmfdAbo5EHSORm1Ghv5uneJT2T7LfJ8PZEIajn1mZDt1KQCm/F6XYO0uuLj7uWJFrSksRdwXvMRb+O92vlw1Q5m7VpypZJ8p3zpW7L0HvgGa9spzcDtZuy+hw7A6yYeZlzNL9KZiMvTrsl57H7zJgsURE8UMZqKJvEs0GX6dq0+Ml4H/hB+8x7Wlt1uKg2shzI+uHmIh2ymPdurvDhnI/7LVvYAHTiQWll+/hitpMepHVQNEvSYldm/fOolu73swX1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Itcd1ZGEonJjNg/fPCWO7nbsBqFJkRDAVDktNAw5wPg=;
 b=fOyqn6BrOfpHkW8+NtbjA/z1P1Uy3oM+WGvI4+fH1hdGN7LRzwI9CzsstVJH7zOagDcgYXTAn/WKdetJEGqnDtZ5PvDr8s8zhshEDaIh0IJ2lmCaVTx8HIpGjfBaUEwdHfrDHlw0iBUqBEqrTq7T71hy/raWNqqST67lK5zTMaJVgygQFQf+RmYCELrq8HCrkzNmwB6ikAV2tnFB6PPYd2bIyY7HMGVy7hoAunhPVdQIocEb33QxKF9ZVqjbgrJnksGL8CHVf3/3/TlwpWWrjyw3yAU9FARQ7Zix5D8j2cMJOOeqySymbZ5ZmKKshj3FcWaAdeO8u/GaIzxKH5SdTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5248.namprd12.prod.outlook.com (2603:10b6:5:39c::15)
 by SJ5PPFDDE56F72B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:52:33 +0000
Received: from DM4PR12MB5248.namprd12.prod.outlook.com
 ([fe80::92d8:797b:4db0:d385]) by DM4PR12MB5248.namprd12.prod.outlook.com
 ([fe80::92d8:797b:4db0:d385%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 07:52:33 +0000
Message-ID: <f174540f-683e-4f76-9eca-8016166d30c8@nvidia.com>
Date: Mon, 14 Sep 2026 10:52:27 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: do not overwrite phc_index when no
 PTP clock is registered
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rahul Rameshbabu <rrameshbabu@nvidia.com>,
 Carolina Jubran <cjubran@nvidia.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260914-stmmac-fix-phc_index-v2-1-bf3d90373fe4@oss.qualcomm.com>
From: Gal Pressman <gal@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260914-stmmac-fix-phc_index-v2-1-bf3d90373fe4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To DM4PR12MB5248.namprd12.prod.outlook.com
 (2603:10b6:5:39c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5248:EE_|SJ5PPFDDE56F72B:EE_
X-MS-Office365-Filtering-Correlation-Id: 267a8426-401b-460c-cd80-08df12352253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|921020|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SUO653KpC6d5/uTyH0EbTx4/WVDnAba7AJn/9B8I4sgHLsSmEhcVllDZgV1ogPY94qLEUcdG1XyuKKA5Q1bOzRw5zRTKEWGs/v0rHZrFoqgmcNtyWoCHKB4nj0+8L/nBkLAfFhM8mUgD5BIibriv/ZqVG08RLir7OdN/apqkza8G1Q1tsABYyv5PYG7svth3zSpXARX7Hk9SqmikhefEA7KRGmnoBfC3f7RWUTYdHBB8TZk9XvYKdQbJu3iV8GKd8/FrL346s7swE/hS+gut6/tQU2t6I44RFckTj5jCs8mxaH6tkXvQWeg7h41tFKepu+9EHIyGJMUcpX41delJ3JnbcvU8+/Tu/vqDZlAINEld1ywzCb4+g5xsbAceQVZYc0x14abTrLRZ5mk5XyVRdl+o/y726IHWhyGYs21mwwMAqDGR35ZF/L+APKUnrqp2lrkUi29qxX/+ydSghWcxFcGGq49qQZRfoVr2MmKqjjNjeVXT9o3lvzoqpWa6L7OpBl60BYi0AKySTsDGU9kCGCiE0GcQNmqV6tNJfKNeDBQxRxmLpgXlbnTZXXBfemSxxFYAASTi6Ps8IJ74eAFXU0II69cJdhzsUWikgUTZDraXPK0pSCr3Q8L1XN6Nd9DVq7KOgzgSeieoIFxz1RgKkvarWzo69QQY7H7g3F4VpRknswDHrKEI5/OEeW92FzUT2TP2G3dvkR1QNYC/gvx2wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5248.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFg5ODZ1L3ZPNmFqTGpBYzJNLzBVbk9sT0hkZ3F2dUxYZzFIS3FFVHFLalF0?=
 =?utf-8?B?UWUwY0cvNUNCR2hpN2xPUXRKVC9lWTNwc25KVnNJWWFYSmwwOUFzWDd0Vi9U?=
 =?utf-8?B?WE9VQXRvVGpZNnV2MEoyditWVGtKMWlZTnJORHYzU3QwMk1CNFNNZVZvUDdC?=
 =?utf-8?B?NHdSS0M3ODg3N2NWbmprVGxnbUJraExScU5Qa2lIWWQyLzZieGsyQVlBZGhZ?=
 =?utf-8?B?SnMvK2ppWkF2MHp0cldaR0R0VVdNY1RUdi84SzQxbXBWOGRhNGNKTkg2K0w4?=
 =?utf-8?B?cmhBR04rTUZxUlJsOWdJUVgyR2hMQ2RkeEtVV0VqYXozYmlRemQxbHYrVkxk?=
 =?utf-8?B?QW10eUF4Sks0dk1vaHJmdThVZGVwSEpOTzdvOThaSFBkckxyOEt6K09ERG5L?=
 =?utf-8?B?TDBaRXZKcEkyTzRiaGhvcHpsdjd4eWhwSzY1dk10UWZEZEhBcTVDVFJkY1Zt?=
 =?utf-8?B?ZWFNZHA1TzVVSU8xeDh2eG1jWE16TXZpK2pubVJieFNreE9xc2dDQ3JNeVJ3?=
 =?utf-8?B?NWNZQ3lsV2FhWmxHNk9NN01iVTQ0MEdKUDVxQzA1RVJaS1VZL2t1ZXh6Rmsr?=
 =?utf-8?B?bHJVem1Fb2lnNHNsVDZ2WmMzeXUyL1dWbHlUWWdTVW83RG0xakxBenlnY0kr?=
 =?utf-8?B?ZEIxakk3Q3lzdHJKVU5GV1F5YStGTVdYVWNxNE9yblhiRk9oWkxYUVVhWjM4?=
 =?utf-8?B?TnVscTBKRnZHN2UwNll2QnhQVGhXclRieHI2a3NwNzJ6aFJwVmhWcmRDZGNB?=
 =?utf-8?B?MW9saVdTRlk2NUMwNkd6WjJnTlRJTEJpQ2ZoQkNaa29pVFhEQXVmbCtydmxU?=
 =?utf-8?B?SGZjbzdGNTRrd3dXTkJheVNlckhNSjNTcmoyajI0RGhnRHYrRERNTEZMUW84?=
 =?utf-8?B?YU1Hem83UG9BT0NIa2RVU0dOZVpqUHNWZEpRbDk0L0h2Y3FFMWNpdTZiUytV?=
 =?utf-8?B?RzR0TXRMSm1KcTlxT2pXRnozeVhCTlcwejU0NnRHVDVwWmNQSHc1bHpCMTd5?=
 =?utf-8?B?MTlURzAvV3BFZUllaHJwd3FaSFlqYzN5K0N2U1FwdjdxTVl1YndIclUySGNR?=
 =?utf-8?B?T1E0NHFSay8vVDNIMUVuaXNJUUwwU01qMGg4T3FCWit1dnMwcnpkVWFhTnNY?=
 =?utf-8?B?cDh0OXJubDNoMDB2THpVdU1LVkprVlJkclpLaGhOdkxIQUhTWXVWejB6UDRt?=
 =?utf-8?B?amVBMFhMTkhPcGtTdUpXSDNmaWxXekM0MU1CeEpaN3p4SHN6cE9ubGtKOGcr?=
 =?utf-8?B?SzFLbFg0NXFjTk55WlV3V0E4ZTN0NjZ4ajlscGNSWXdrYVU2YUZHSFlVL0kw?=
 =?utf-8?B?c3hKQjZhMjB6NS9FQkl4cTNkcXhDcDdpU01GSFZvdXV4dlA2Ym5pb1gyVkd1?=
 =?utf-8?B?WTVJZ1RNT1I0bG00dHNlNVRpZmsvQnlES0s2cmZmcXhzazJ5Sk1iZ1pYZjJK?=
 =?utf-8?B?d1B1cFFodjhaSTJzQUJhaTVycm9SQ25sQWhIWVBrcFVrWTZKSEhaVHFkWUl2?=
 =?utf-8?B?Vy9weE5WMjFhLzZzNzZKUEVCQjMybGRhM0JuVG9KZG1iVnBBTUMyYkZvTVov?=
 =?utf-8?B?UjFFY3ppa0l6QlI0dy8yVkZuRWRkZnVhV3Fma1JQU283c3VPN2ZTaWFDZzBj?=
 =?utf-8?B?Q3BZUDB0U3lXUjN1VE1JMzRIUzlNeWtERlB2bXVYQ3ovZkJ6R09Yd2g5Z09H?=
 =?utf-8?B?VmVLZFQ3WUZKcTFpQkdXLzhMbDZvZklJMm8vRVVCUEZpQXJHMkFIV2NMblJT?=
 =?utf-8?B?R3Z4WVB4a2dEazh4TFl5VFZLTDZKYXFBZjZYcGJrdXdvNG9WNktNK0JsY292?=
 =?utf-8?B?dm5RRW5XUHdoaEhNQjlnYUorbkZpS2dEd1llKzZDWjdFWUxnWThQeXRDaGVE?=
 =?utf-8?B?NlZsZUt1WW5YczhZaE5hMmhaTDJoWXZtZ080Wng5emR3RVBuNDRzVWRzRmhS?=
 =?utf-8?B?MkI3Rnc5YVRxYldrRStqcGJ0cHAybVpCNDRzNzI4R0lZcWUwcUVnUmR0RmVZ?=
 =?utf-8?B?Q1VFUU9vOVpkRnprVG1XaDNMaDJCUkdndWNaWWRheDhLOU80RTdENjNlak5l?=
 =?utf-8?B?OWljTStLcDZIN1Bpc0t5MlJaWDJEUGdiZEFPcU4rQWxzZjJscnJJc3dvbUc4?=
 =?utf-8?B?U0xJeDJHM0lRK0FpUG5JN0FyMU11RG1IOVpUNmMzYWxMTFd3N2VmVkFuSytQ?=
 =?utf-8?B?RWdTQ1NJOUFqb3pSOWQ2dmdRYUlib0VPQlVyK0J3YlB3ekorOTl0SWlodkg4?=
 =?utf-8?B?TTRrZS9CRGdacDluT054Y3R6ZG01aTlQMjduc05EZTd4TGtiTU9pVnp2RFVG?=
 =?utf-8?Q?f9vtgumsTL3GtCV0kd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267a8426-401b-460c-cd80-08df12352253
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:52:33.0564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPvpUKie5H1zmJwDO+nfpLUY7AqJQylRIu7uM/yqRG15wLkFGjuAeGrQ7cxeMV9Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDDE56F72B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_005241_960374_768E5263 
X-CRM114-Status: GOOD (  10.07  )
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

On 14/09/2026 10:41, Lorenzo Bianconi wrote:
> stmmac_get_ts_info() reports phc_index as 0 when hardware timestamping
> is supported but no PTP clock has been registered yet (e.g. while the
> interface is down). Zero is a valid PHC index and would make userspace
> resolve the wrong clock; the absence of a clock should be reported as
> -1.
> 
> The ethtool core already initializes phc_index to -1 before invoking
> the get_ts_info callback (ethtool_init_tsinfo()), so just drop the
> erroneous assignment.
> 
> Fixes: 9364fa7fcf12 ("net: stmmac: Remove setting of RX software timestamp")
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop phc_index assignment to -1
> - Link to v1: https://lore.kernel.org/r/20260912-stmmac-fix-phc_index-v1-1-26e1ead25324@oss.qualcomm.com
Thanks Lorenzo!
Reviewed-by: Gal Pressman <gal@nvidia.com>

