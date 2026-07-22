Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81537C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQZleta5pSpKiS/GyoYYLEok23aK3d/tyzn6qXD4tEc=; b=p0vVRPoy1LLiJUltEwMFCHE6Zr
	DiejKGiT7oHaeQoIh918V+p1ZGcgUW5h/83jMH/XFBe9MZYHIrMq9fadc+S72lDY+7DMNgDsgz4j2
	BTsNPTbNZOHGRopgF5ftdSjWp43tLFfDTKN2sJzl4w2ukkYaEJ5IkZpneD4cAeAFFE6t/cDzvi1r6
	cJpHHytVTKNmKF84N9PIRr7hc3VLluQbmW26dPdIiXcJ+mwarwNCur0N8cC4MAFvpLsWeb8vndFj0
	QD1cuCRbKCvReBWNJOLKzlUiAYgs7JTQAl8/ggQT3HcbX/NxM6GIaRWFE2t3+/++cDRhIG1EwtWwv
	AbqUWRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUvw-0000000Bd7t-2ySM;
	Wed, 22 Jul 2026 11:16:16 +0000
Received: from mail-westus2azon11010064.outbound.protection.outlook.com ([52.101.46.64] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUvs-0000000Bd6t-3jfb;
	Wed, 22 Jul 2026 11:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ri2qKpx1gOmKyPnkPHRBjogxdz6r2ko7BWFaqRTeuPMQSRKeJsv93p0UIGlZRH52GsV1NSEA9PwIW937UN72pCSncflZXuFdak25xEZ2XvoOtLdZLo41YbP4EfHjOZ7IYTjmyFm4LNM3wsJAlE4IXwhQIVxN0KF9/a3VyUmzKbvv52EnC9v2mWQcGL1XbWCgz8eA8nAwZ6fYjloso531rWZ6zviRw7xT8L2975Qmrc0Um7F2wUNfbvWuham86d9EbqtQ2mtV3OOn9m9ZSL2kpPg//1/ZQYS25Mr7OuBisaQbfjuz3xPaWzfJ3WwQmgXe8pkZ/bk70O4sXWnVpQe3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQZleta5pSpKiS/GyoYYLEok23aK3d/tyzn6qXD4tEc=;
 b=gM6koT5rfdGKRk5zfX3hN+pMFD/2osSEQ9pWNw3n1a5fK4kdevn6JU4RCGsdpwvsMDgf6Z/WnyclAeL1knQgw/l1YVijUJ3NRFcN0Vgk9V7JVz4mLgfNMs5NZdImIdTEztVKsUUZbvqSn5o/i9evAFvzOlNFI5Eb+Gdv0Sls5Y25cKHdh3mcaJCxOaCQvhDgoTiZSibXYstceDZIVHRhOHsNI4UhUVvQChms3MnPFa2iIlTP1DpeBp7a8KFOIvyMZk/VSqblP1uoYMqfGHvWU1TUbqgTI2KV9vUySGOMCQeKqLKNMHfxTZiFyBY4pSNAe6D8/YGRxJex/MH4U4/LiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQZleta5pSpKiS/GyoYYLEok23aK3d/tyzn6qXD4tEc=;
 b=zg11Q+LBbRtRaXYx2QuXsALkezx8hqPKF3/Q1wmXmWKt4On4sRzd8+Cl4JhxJUhonhT1cxpILIkjaEyFP2Ul6HZI3Ycc27zH2vfzTTXroK8h8EhupT4GtNtnG4s/45FkXUuxTYgRdDSTBpJ8N1P/lDOxRyMGKt6jhlAxIsxKSQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:16:06 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 11:16:05 +0000
Message-ID: <6e0ceb33-23a4-4a9c-957f-62646bb1a8a9@amd.com>
Date: Wed, 22 Jul 2026 13:16:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Radhey Shyam Pandey as ZynqMP PHY
 maintainer
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260627162233.2803425-1-radhey.shyam.pandey@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260627162233.2803425-1-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0380.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::25) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d094216-cc13-441b-e231-08dee7e29f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AEKjy2ZH0wBAVYm7HdD9UNH/L29uqyOwGfVTv022GLA4mYCdwLrrotDJeVj9wWo4OfUAxhpdRa6bqF2gFBc3kLMrte7brN/D5BCErjZIE/7rJt6+WsESGGg63y3An8uB+SSqXPjC5vG5B2f5S5Mo9bImUbqrUJnyTS/P82vESWAd5DuMIlYCECghH+IFWTLn6sXVwSwv49nws4FF/itjaY6C9by9ArtAy6Fvo++8DXYsalmrRc6KsDP2o8SWSYwI5cVk73D3PFyduYccx4bdnec0LRLuqgWPHQyeCH8fEpsj3EflOy9Ip/BbGKHHaU6pjsZc3xAQMKoaKWGGQeLYjjAkIOwSwS48G9Y0Qqbt67e2VlFXkKJnJSjaea3NotNWCR34wxgEIu0X3gBD9lyQW2mg3Fcn6Xooakbe4h14gcuqhAUjwMF13lDrlTOR84S8fEJQaumM+y56z4xAJbSaVlOWU1jJ+bso5g03P6UuW8yvSxLH5Jj3kjJPT0bs+1tUfUSYkIen3kklGJL1QjFpeRS2k0T9sfU+m1ASfr9Pn4AVvjDwit4qCeZnbMB3w+O3Yh6zfJcg8EDDmei7w6DWemQ6R7v/LrStx+hrkludGrFIpanpyXIO/6F8TeEa5MyCRXEFTclsm2D1hlxPr9TDORYmFI4uVve513/vbsz7iBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFYyTUJNYTJpbTM5dGdmNlpiNlQwZ0IzNmEwUzNvSHpyYWVxUEM4Vm8yeHNw?=
 =?utf-8?B?MGlRR1BTMklLU2RvakxZWXdmZ1NYRHZ6dU1EaVlyb1BpNzNJaGZ6SnU3a0J4?=
 =?utf-8?B?NTZVZ2twTTQ1WXJpRnZHMjBuaGQxVms5RkNMWElnOXVQM2pDKy9RZE9FUGFE?=
 =?utf-8?B?YzFpMnM5Tm9WalNHR2RSQThiN1J0cnQ3b0VTUFhibzZlRloyYWtKbVNCL2E5?=
 =?utf-8?B?aUpmQ1ppN3VqVGg3TzNua2trNk9kbTFibWNrcDdIZDJ0aWZiVHhYL0w5cm5x?=
 =?utf-8?B?WWRUTGF6N2xLbVk2WGxBb2NuME5TSW1Zb1RycEtLWlVTL2F4WlRVbmhPUDJx?=
 =?utf-8?B?NDFVZ09xZVhXMWplV0RxS3o5RjVDUzJrbE00QjBFY0xpaHZwSVZacWt6WDU5?=
 =?utf-8?B?QlBjaTFPUE5IRnE4eFRxd3ZheHo4RUE2aEdGMnhCbkkrK0VBNFFQazhIdW8z?=
 =?utf-8?B?eVYycUZ5dUt1QXVEWHdWZFlrZ3dCalJ5S3NJcXhPNlZUTkd0U2VUZHNEaDV5?=
 =?utf-8?B?YUJzcnJYRGpiemdtTlJ5bTgyWk1zV3JrN1JjZkRZc1hKME5iWkpLajJqdlNn?=
 =?utf-8?B?ZHBybHdhQWJiek1abUtTa0dBUnZpL21JdDdhZDZBcGdlMXp1czFvTGtpdTM2?=
 =?utf-8?B?YU9UTHVzVkJxRU5YTUtKNUVBL2F3MTREMjV4YTNqK1BHMnkrczlma3k1dXhq?=
 =?utf-8?B?ZEh4V0pIcGRIZWVoMElUUEdBdWRxMndGaW9Pelovd0pvVUV2OGdTQzdQTHp2?=
 =?utf-8?B?Nk9mZzhsbVlEbVQrcHBqQ1dOdC9WRTdxQWdUUDVaMGZlVXk2YnAvdHF4YVRD?=
 =?utf-8?B?Ujd5VHlWK21pWWVRWHZ1UTBoKzlCUXkyWjMxdzAwaHZrNFNzajdiUmYvWVhN?=
 =?utf-8?B?TGpGTTFDQWV6cGdRZllhNHpWWUR3UlFpaTkzMGFqTWFzQVBmcGdiM2E2Sjlp?=
 =?utf-8?B?U1BoemJvZm5VVWgzMzgrVWdhUzFFMkd3K0lQN3J2MGQvQlE1Z3RSdnhqaEE4?=
 =?utf-8?B?RXVPTkhxRmtjTCtNU2Y1cG9aYTZOTk4rWm13ZnJKWXFDWUlzR0VSVUVNQjJn?=
 =?utf-8?B?RGw5dzdlYWE5MmJaYXRPV1hGeHFJMDZhVjVaaUcvZU5HYktkRzBRcHpPbkJW?=
 =?utf-8?B?UXN4cVNoU0FCN0pYdzlWaW5rbXl2Um1Na2lVR0dvSzJNNFl4ZXhUUkhTZmll?=
 =?utf-8?B?TnladHVnUnBGVkM0U0FvdVhjWTQweXVaNFE3STFXcWJXdGhTd1BGa2UrVXdl?=
 =?utf-8?B?VkJna0dzeUwrSWVPa3RCTlZsYzIrSmFaSEJHOGpWZWVpU1Z6d1cxRHpic2Nq?=
 =?utf-8?B?NWZpSG5KeEtSTDM5d3J4bm41M0J6QzQ0T29VUTVSWW5WRncySUJrQzVsNmI1?=
 =?utf-8?B?akgwUWsrVmxoYSt5MG9ONE40NWdDckVWSkkvMHNRQk05V3FJMWpoODZCRVMv?=
 =?utf-8?B?dHlsMFRJYTdLV2hRYTNkNHlBTHNCY2d4YUhDTmZBUHNad3Q1ck1sbGkxWkE0?=
 =?utf-8?B?OFNVTmNhVXcramdTYzFzV1hSWTBGNng0aGRSRWF6SC9QSEtYWmYwZXAyQi9M?=
 =?utf-8?B?UlpFWUtJWUZiblF6S2liY0JxMG5KUFZIWmRhREpGSFI0Wm1aOGpTdHRuaW5r?=
 =?utf-8?B?enBQajUyc05zM1F6dUlHeEVwY2hrdjdkQjBrNU40MmhCZVkwdGVEVjJVTVhG?=
 =?utf-8?B?cmFNbVNxM0ZRK0ZnTHdzZkRla3JkZERFUmp1STZ6clhBNnc5blEzZnRlWExt?=
 =?utf-8?B?L2hzQzMxc0I3ZzJKOExaZXplaW5BRkdpdjh2d1pPRlFvRmJhWEZEUVhuTXp3?=
 =?utf-8?B?M3ZhWmxoYTZkLzBGVUxJZWgrZDlXck1LalQ4c2FTK1dGMzRuemJrdjEzVjFH?=
 =?utf-8?B?YmgvcmhVTGxqUld6K2xvUitZdEtucWwwdXZMSEgwRlBmOGhzbzBJY2xWZzQ2?=
 =?utf-8?B?ZWgzTmZoYmtjRktvVU0zOFpDckduTUtjT2lVeDFKSkFuNkptbFhPMER1VXIr?=
 =?utf-8?B?TXJlMVIvamJvWHg4NTlWam4rU24ySlV5T0xkYzF1em5mN2RWR2VVbjdvdFA1?=
 =?utf-8?B?dUFXZC91Z2FZclc1NS96VDlYRVN6alNhVGpmSFVlOHBBQzFEbUFYQW9WcHR1?=
 =?utf-8?B?K0J0Si9LcGpISlN6dTNEZlBNcDJ3T053c1FyRU5FNUZqa0E2Ti9uT3F6dHhs?=
 =?utf-8?B?M05uaGd1dURhZHdhUHNyc3NsZE4yVjdPNmlpenNVSDNtL0ZQdUxhYmNBeTlJ?=
 =?utf-8?B?eWRsVTFMZUxaWmZHN0kzNmdFS2JmNnAxZkFvbUlPRjlVeXBJMGpySnZVNE0r?=
 =?utf-8?B?R3pGYnVrUlYvektKdEIrZEJ5dElLOVNsb29zZ05IODlqOXR2SlNUUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d094216-cc13-441b-e231-08dee7e29f79
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:16:05.8671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bqCHspmi/llZjMHnzLxQXmi0FnOJP3L/oP3qS5bS5DjwZQcCXUm6L9Zrl7Gkqy1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_041613_076041_EDABD6F5 
X-CRM114-Status: GOOD (  13.80  )
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



On 6/27/26 18:22, Radhey Shyam Pandey wrote:
> I am maintaining phy-zynqmp driver in xilinx tree and would like to
> maintain it in the mainline kernel as well. Hence adding myself as a
> maintainer.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1705eb823dd0..90dd86437c5c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29645,6 +29645,7 @@ F:	drivers/edac/zynqmp_edac.c
>   
>   XILINX ZYNQMP PSGTR PHY DRIVER
>   M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +M:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>   L:	linux-kernel@vger.kernel.org
>   S:	Supported
>   T:	git https://github.com/Xilinx/linux-xlnx.git
> 
> base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43

Acked-by: Michal Simek <michal.simek@amd.com>

Vinod: Can you please pick it up?

Thanks,
Michal

