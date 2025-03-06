Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65BAC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hl5iS6eOs+7nCIqGUHYgqSGfWd6yqE4neebcee/8p4=; b=FkHW+eRJ3wFP9mnp8/qxy5PWTq
	+Z1OIc0nkXinjDO2u9+EiDESymkvnFg6wMFGo04GTzat4PipiJ4Ub7J4xYCpKaVzi7Y/9BYwWc0+j
	IH5g8n1lqDx8dtsAKrcXdQbEtysruZt75MWXfw2OeMqWJiQLHyBY//G5F/vyw9N3WZZJd6vcyUKoM
	WR+/seLnRmc266yPoMPiCB5auYf8nJ6RBAd7IjuzHGqLf8tfijXqypy/P4Pcuv2O8Oz4oCurNAbrX
	h2pYXCBuJcBybMji8c78lUccM9hFlVqGB8qgc7mDcipuj/552a1dip0xaA+8K3SvDR350rMEMUMuN
	xBJyNxww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAB6-0000000AtW4-27Qn;
	Thu, 06 Mar 2025 12:18:16 +0000
Received: from mail-dm6nam12on20613.outbound.protection.outlook.com ([2a01:111:f403:2417::613] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9RT-0000000Amsp-1OGO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syYs9vNnH2M/U3ijoImakRQ+skd0YfL+CfxaQ6EBNDNsyfS/lH1UeqWX6d23ysW/ebMd6lRx4Pn0CdK3dC2UnoC86B5fE/1O9Hin0J+WLINwwqkrQNDCyedrSNm5ST5/ycjvW1E0/VGDIH1e5q5pWaav2yEEpizL0/Sklhhxm4FZCLY8/8bspIm0m+9bx+0qLqfusnBUg0sxTVqEg9JxQFaQtb6RQJXk2mVLvw79k+LJ9KxC+bvWgyinqZ/Q0h7IPZL0xVfhy54pWMFKoWbJqAi73mOpYgRdnBhJv1ipGeQXr29TJEOT2K0a/IeMpccgMQjCK+gowTwG8rA+U95I8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hl5iS6eOs+7nCIqGUHYgqSGfWd6yqE4neebcee/8p4=;
 b=bXgdS1OGs5WGtwHTQ9Aw6aifcHrJyWdzpgNRjmQLyOQjo+SA644wO2BSeAPKq2WL1Q0G4Aoe8He6I68g8o8qA44RgmeqLp/vCOdZYazbFR3SBnSHQdCQ1oFM8iax0dNGAF9IIXncFkB6eZokdxsNUa0ca8ay9rUTigUWzDMy7JI6Ukj14Oq2iTB8dwnx89i5vNsusCHX2iL0YVBS9OHzBakUQ+p+00qVbDQ5hNBngtma+fsdzMVqJ1VbJ+xe4ZJkVlMaxVxJjLxB/4SXJ3E0dM45jxGQSiE+jVEutdiL477vRggzWznJliSNV+UyEg9iR/U7i3+BulO7R2Dq6L4Zxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hl5iS6eOs+7nCIqGUHYgqSGfWd6yqE4neebcee/8p4=;
 b=OHCTsWgpK+pa+XetZS/0tim3Yj6tBBHj6nRI/0SpynDw9R9O0C7OmJYAUzAhAZevfQqGKfybUY3ASOAD2HzCkzXVe46dE7abnZqEp7LfG+Pn5zOP9niIK9upUelr5BhdtMHMnPdrm2+r2JG84D5eMyDeWD/se0HCzCpe9ylWwrxhrkSl4RMPRrltQwpSBzCxYCWzczsW4y8xwMh9L+OQlgZbDyetmvBFI9OGxK3wLpvDXXgRExdB+Q/SgGzii3kYK1KjTofMThStZ4252zO1YinlYokq+GcCSIrJDCC85hkT8Ziyz8ybJm3xIu+0AdyXdJr8neJQ43kcycJ88Dbw6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 11:30:59 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 11:30:58 +0000
Message-ID: <f783cf9c-9f79-4680-a6e9-d078abbd96ec@nvidia.com>
Date: Thu, 6 Mar 2025 11:30:53 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] net: stmmac: fix resume failures due to RX clock
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Thierry Reding <treding@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|BL3PR12MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 494b445d-242d-4f4e-2845-08dd5ca25da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzJGWDB3clFsWndjSDFZeWpDcTh2aVZmd2lzSmJVWUZpamFEckZ3NFVQN2NX?=
 =?utf-8?B?dzY3TEJHVTFZa3FjZjlMdHBKZEF6VWZUMlB1Z0RkTUg3bytNNjc0SVhGdmhT?=
 =?utf-8?B?QlJ5MkZoRjNBemJPSVJOZElraDJFUll0MytOZ1NmcU5UaUhrUXJlVGVzQndk?=
 =?utf-8?B?K3pCb2RFTFpFRFRIOGJycVhsLzJTOUhMbGlHSEVhSzFrS2loMDFxTkZ6WEVE?=
 =?utf-8?B?Vm45ZDRibW0yRjRWcW1kc1lxYlF6NjFjSWQ4YWNCQlNBbm9Ka0I4OGFoNDJv?=
 =?utf-8?B?RmVqQnRCL2xYc3hHQm9WUzB0R2ZUNm9oSUZpOFNwTzF1YXNKTU03V295RzN3?=
 =?utf-8?B?T2tOcTFOWllSQXByRTRRZEVBQUg3cWxtYkZLMmNyWTRPZjVNeHVvUGlGdEFz?=
 =?utf-8?B?MTJnVEtjTFNwcnIxMGQrUGl6WTQwQWpITGpKOXpqZ0JycUdSaU9LRy9vS1ov?=
 =?utf-8?B?SFplYkxVK3Q1RDRMamtoR2x5ZlRBWkU2REFZcGVyRmJrVEp2WFJiRXF6MnNR?=
 =?utf-8?B?TzlPa1VhcjA3SEd1Vk90NFpKNlB2Y1l3WGhiUitvdElKUG1FWWxxcUtiem9r?=
 =?utf-8?B?cnRLVGhOMERCY0FWMVByUkJvS2tvM0tMS0YxU2doNVQvNWJqVmtKVWY5N0ZW?=
 =?utf-8?B?bk42WjhJLzcrM0djMGQzVjB5THF2ZWVRZENMZTJXTXlDTkRyKzJ2ODB1Z3p0?=
 =?utf-8?B?VTJCZ2NjVnpDMDdyWlpDcWQrMnFaMWRaWWI2d0Q2UEExQ2NKNzlwMjVvZENX?=
 =?utf-8?B?aitqb0lMQnFtUW9HU2xpKytSa2hkT2luZENHVHdlZkFISDNLOWxyVm82SjM5?=
 =?utf-8?B?WDBBTEx1UVFKQXJzckFuNVo5RmFIdEZZenIxK3R2UTBLRm13NFg4MHVFWW9Z?=
 =?utf-8?B?aHZka1BSd2dmYWI0Qmw4V1NiOTJlNUR6N3JlK2l6NVB5Z0Fva01jRnhYMkFn?=
 =?utf-8?B?UmpGOHJiNTBpSmhPT0RNVkZNUmJ4ZnkxQnRidktadnYyblVjM1Q2ZGpsNmpY?=
 =?utf-8?B?bm5uZUpoNjBtZHBHV001VWQxSmVMcTlzYXo0VDN5TmM4STlKRXJ2anV4U3k5?=
 =?utf-8?B?T3U2bC9GY2pCTVBDejYxWEg4TDVieVNTd1pFdm4vZTBrVkNTUmhZVnVMcDlM?=
 =?utf-8?B?NTBHK1Bpa1NHRldIV1NLT3lWMFVTK2lQRTNyMmlDVEtLbkVlbVpDSTJ6VU1G?=
 =?utf-8?B?SmFPQ1czYXowMUNpcVFmbFpsdU1Fd2U5VVAwYUMyaHUrakRNbTdvem9BbStn?=
 =?utf-8?B?enZxbnp3ZFQ0RGwyRCtpZEVSUFRsdEN3ZHV2VWJrVnpkZmc2TEZKcVhHNGE3?=
 =?utf-8?B?c0ZQbmFCUEVkWWpsaWQwS1BjRW9YL0ZTbFNIamN5VDJ6S0tvemt4dkhESmgy?=
 =?utf-8?B?YTcxdUpsU1NUZ1BZdGJFWWM1ejFBM2RRcUpQdG1TQWh2ZU1rWVpZSWdwY3pz?=
 =?utf-8?B?c25jMytpQmtMVDNrVWl0NTNGV2dJRy9QNWRrU01vTDRndHA5TEp4bWxlMlhl?=
 =?utf-8?B?SlhFSWk0cXlGbyt6RWJTZlQzSDBJdlI2VzJ0UWs4RnBDOUwxWXMvaW1uTzlD?=
 =?utf-8?B?Z2JQZXYyWUVIVnNUZjhaSVlUbHowVEJRTWJwclc4RFQxRkQwQ1hxcEMvWTB1?=
 =?utf-8?B?czdESUduWlFCODdkZlpTbjFTL0JkeGFKSXNheWI2MmFxZUJJM3NhN0xRdjd1?=
 =?utf-8?B?VzhvQ1JUcTQxcEh0OEhiRTlOdnJ0RjZ6ZXNrWnV3emk3UFp3Z2VMZ0JxVGJj?=
 =?utf-8?B?Ri92Q0ZUTjhnZGEzM2FWQlcrejgwMFRZaldPQ2ttdDRnTEN5dWlIdlV0Ym9Q?=
 =?utf-8?B?bFFCb3FPY0ZBbUFGV0FPRkYyWVNwc01PeWxobWhGWmcreGZ5RmxmbXRaa1lq?=
 =?utf-8?Q?Y4LBltASFudyx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG1lN2pVYXFYQ1RQellJNmVGcXpZT254a2hQYjlGaW1DaDczb1JTVXRBQ3NL?=
 =?utf-8?B?cjFxa1NSZmpoWFZWdWRaNG90TmppdkUyRVpDK3Aram9TdmFTVjZlUU9Qc3hV?=
 =?utf-8?B?emhmSDkzVGJXUEZSdUVMVzJTbXNuMi95MG8wcDlnRUVVVWhyL3pUdW1QclBt?=
 =?utf-8?B?MmNQczdZUlI2a2JxaS9BTVQ5OHQxakgvZzAzelhKS1BGOTl6aEM4c0ZpWDIv?=
 =?utf-8?B?cm5CZGZNOGxKREs3T3RnMGdpbTBydXY5SVVaQXpoMW40U1NYZUI4TWE5MUhk?=
 =?utf-8?B?QnpVaDdYNFd4V3pmVFJzRVNROXZ3L3dUZ2k3UFZRTTdQUEJhVVZNNEh4TjZ0?=
 =?utf-8?B?NXpBSzBrdkIzU29yenUva1Q5b0JCejRkUTI1RG8xTDdvcU1LYmNrOFdxZGFi?=
 =?utf-8?B?ZjZjbmx5a2NObzlWRkhid3dFQXNqNVBVR2NzdzFTNmxzNml3MUxBdnkyNjBQ?=
 =?utf-8?B?U2FqR1psdVZsZjVLdHdPclowcFJnb0Vtb1F6V2FBaHlqQmkyR05VTE5EWkNj?=
 =?utf-8?B?ZG5hSXNUajdYdmJUN1JtQzk1VllDNkxmSTBjN1dOV2FVenVmcTB2WmhId09s?=
 =?utf-8?B?VmpnWGNUR3luWmlXalRKbmovMGxwSzdhTmhlM2JvTytlQ0NIMTVFZVplUVYv?=
 =?utf-8?B?b1FaZmxmTXE0cWt0WmdGakhYNDdNdFI3OGNicFV6VVVtbmdiUGZBZ3pjenJo?=
 =?utf-8?B?cm80NzdKWXFPdmZKN0VIcUMzbEE5c0txZUhOY0t0NEN5ZkMyRmtTQ0s2R3RK?=
 =?utf-8?B?cmRqZFUyQUluRndaZUhHaTN5Q29hRTJNb2UrL1ErdVlTaE53NHcwY0pjNU5w?=
 =?utf-8?B?OUp0WE52cGl4MTh2SCtibXp5azJ3V21UY2VBK0ZvUVg4MXhrV2l6Zm5oNThL?=
 =?utf-8?B?T1ZjVm9PbzZMZTl0Nld6QmtWamlCMW1QVTcyQjBzY1U0d2liSnBraS9NNmd4?=
 =?utf-8?B?SHI5Y0ttR1pDbHpxOVlZbEFySDBrZlk5Q1ArcVRmdU5odXJNVk5Nd0ZFUmRW?=
 =?utf-8?B?SXlvdmFBUXlDVlBnZDhWQTNBYmxnanhvQXU1dGxjR3NGY2xmcUVLNTRJcWlQ?=
 =?utf-8?B?VE8vUzZCY1FjcG9GVjJqY0FRMFh3Snoyd292QWtZL2xqcjFURzV1TWxhditZ?=
 =?utf-8?B?MHZ4N3BSUml0bnZTQmpRckNOTUx0dkZFN3cxeEkxWFFmR2JBczFPL3krTXpL?=
 =?utf-8?B?WGZtNHdsbWY4Qml6VUUzRWFROG93dk01aldzMEcwTjNvb254bGFHUmFQTXpW?=
 =?utf-8?B?WjdmNTJlQmFZNjFMNTRJOEtsdUxocDNaTFNQZHVxUnpDVUE3K3BiZmgvamUv?=
 =?utf-8?B?U1E5aUZjZ21OT1RuM1Y5dHdoYURKQjQ4TmEzOGVtbVMwWWJHSzM1OWU4MFpa?=
 =?utf-8?B?eElPd1ZIRWFwTSs1RUtURXp4WG56THMvYkpmZUwxd2tITDRpdnZUUFVTbzJR?=
 =?utf-8?B?RER3dUtTMTRHbVNYanhkTWdvNXR3MzhPaVJjTW5zOXFUN2lVOHBJdFdwWHJW?=
 =?utf-8?B?NTZTMjNpdFBlOXlLWkNEbmI0ZGhTbWxjN2VOV1luZFAyMkUyRWRsNXZnRnB2?=
 =?utf-8?B?YnU3VVFLYXVVTi9yai81ay90MEQyUnpxOGtMbjV3c1BTNGJxdmFJMjZiVmRm?=
 =?utf-8?B?QnBxNnpZOXhmVmxCdDY1SXNyeXhKVkVtcUE4cWZlRDZETm1YSEdpdWVwYUxL?=
 =?utf-8?B?OVlkZzFRdDhrSk8ydFlGZlRmSDZIekx6QTZsdkZNbGppTlArN1JKN1dJa2s4?=
 =?utf-8?B?Um1udUQ4bDdhb1ROb2s1c0ZUaWNGUDVYMFhNb0R1dmRGSG9FWTNNbmJtNmp5?=
 =?utf-8?B?K20xVUxmUFdZSHNaK1lNcHp5bVV1aFJWN21pTDBLRVhvYmg2bFZJVTZBRW0r?=
 =?utf-8?B?eTU1QWJQYWF0blh5Y1VZN1BaaFR2SVZvbURpQ3FUNXBmMW5OV0dJaUhTSVYx?=
 =?utf-8?B?eWZPdkdUZGd2ZjFLejAwcUoxYlJXOGRyWjlFNnJpaWNSMnVRVTNPS2xTV2di?=
 =?utf-8?B?Znp1NTlZeUJyd0VXM0pQUVVwQm5aV2t6L2JRdC82S0ZHSCtSVXdxamEvWVhU?=
 =?utf-8?B?UGhwSmxIYjcvQ095WTB1T3lHU3RKcUl0cEo2OXhIVmNSQ0syQ2xvN3ZSeUx3?=
 =?utf-8?Q?aZPjX/YL3h1CYo9KDtfH8WbM9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 494b445d-242d-4f4e-2845-08dd5ca25da9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 11:30:58.5740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVFjr93KUWYWLQQuxttU74MZhnhvIE9+XaasMORL8qSqIzrMqUTI4JBHv6ZF9TAsL7jqfoFuMkJ9PTOYINwZ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033107_391034_4D5E1EDB 
X-CRM114-Status: UNSURE (   9.52  )
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

Hi Russell,

On 27/02/2025 14:37, Russell King (Oracle) wrote:
> Hi,
> 
> This series is likely dependent on the "net: stmmac: cleanup transmit
> clock setting" series which was submitted earlier today.

I tested this series without the above on top of mainline and I still 
saw some issues with suspend. However, when testing this on top of -next 
(which has the referenced series) it works like a charm. So yes it does 
appear to be dependent indeed.

I have tested this on Tegra186, Tegra194 and Tegra234 with -next and all 
are working fine. So with that feel free to add my ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


