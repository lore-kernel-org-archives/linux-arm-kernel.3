Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC67C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 05:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xq0foTVUun7DgIdxtCxDsizWkxyCUOwLa8IMhnRj/QI=; b=USXdJGxM4t3iXZZfsjvC+mtY17
	pe4M8oZoWJz1NqpRrV7YoJjHNmkKsczo8UZvxj/R1EYaOeOJJjJav1cajy/QmlZOwH7Nom2nTurL5
	mma+wK0vmXWr1x7R8RJqpIh43Rtwb6Rkx+Ic8DQ4gMIkBu1iZtwKD5dDOMDRoMp05Gk2SCbvjoxPR
	n8OgV4VJRRjZl34h1shuwzlmMaqH9vxLZLJ7iC+fxl9TWzNsqlJP+CRpf7jKNi3AFLZw/euBvaA9o
	T1cbAq9UWKVdsW+NKXob4Fgx4E2Zwr2PwI33pW4hyfUKgD0K5NSwEr/RW/oyQXtnCmSsgxcZUAQ1c
	Ewe6+4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3CL-00000008Syx-03wa;
	Tue, 21 Jul 2026 05:39:21 +0000
Received: from mail-westus3azon11012001.outbound.protection.outlook.com ([40.107.209.1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3CH-00000008SyO-2rgj;
	Tue, 21 Jul 2026 05:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBD8KijIkaDlkuVYZJK+nlH0QpcxrQ0RggG6kKczwnexfJIrbEVOaQJUPMCa9OaluTsgelZP0JLbPZPsL/9frCwBs2tI4lj8E1TaLuCsDh5sVMFyzVceebnTiQQbTaRFVB5YdEI5FJnrS7KxenDyQykqS3cVmWLR4S3Mfi8KwNWsLDrH6XXRGHjsmPkEyqKR8tDu1oYo+BFfoBCSP8M91IVHlEmkvJ7FH8nF2scz3co3eKKaDwvTV8O7b4vWhB/xE5zD6uCVbkxi06+MEaQUR0Jjg7rknUDWtuvmrCeAqNskLLCYJtEQrEu+30aFSel4YvKLXpEbppgbm+abzWYkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xq0foTVUun7DgIdxtCxDsizWkxyCUOwLa8IMhnRj/QI=;
 b=mCe1sjtAtxdq35vlXZBm0F8MFsX3WTGdMg/FhdnKVGE/7KfmS0yiFlGprGVTV8HOKsc9wnCtFAHLiWKPHHlSrPPBjKwpQg5NHLSdipbRIAC5Woe3kYUayC3dgpymhm8iNhbU2ag30bP1h68FU376GTGukKtSbl7MTsHCtecc91n/wg5+ICPkItiZ7smbMIBrIJ+dn2TyL1Tt+Ou00bjn4QP75rEALDRN6dJpEFSdNnSoUC4pssDAzwTwJaaC3jcdYnKQqzRKs5w7yUWszwyGnC/ZAd6/8IYnsmw4CvFjXs/zGQ+Pr0lBu12+Ys2a5KHGsThbbwMJChIx4Q+i/rOazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq0foTVUun7DgIdxtCxDsizWkxyCUOwLa8IMhnRj/QI=;
 b=K8mJaMiei37aJNvhGTJMwPaadMCPODbSl4mtx1BJWTFdusoxvHMIyQSvktlOZPCXml6ShLCO+FTsxzJtCULaLe9SI3WOp2a4Xw1UzG4ZP+Lm2HMPDP2QNva5HbUPRbmJ1G00TToqLVBhGCr7tJULh/kjpEsxlYZPav0h0jn1h1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS2PR12MB9637.namprd12.prod.outlook.com (2603:10b6:8:27b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Tue, 21 Jul
 2026 05:39:09 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 05:39:08 +0000
Message-ID: <eac1cc74-2f87-4a14-8c33-f80051ad3f11@amd.com>
Date: Tue, 21 Jul 2026 07:39:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: zynqmp: fix clock error handling in
 xpsgtr_phy_init()
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 tomi.valkeinen@ideasonboard.com, vkoul@kernel.org, neil.armstrong@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, git@amd.com
References: <20260720153832.1130006-1-radhey.shyam.pandey@amd.com>
 <20260720153832.1130006-2-radhey.shyam.pandey@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260720153832.1130006-2-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::30) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS2PR12MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 381b23ac-e6f3-4903-039e-08dee6ea629f
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|10067099003|3023799007|18002099003|11063799006|22082099003|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: KDIAnfCqScWN6g2uu3KjUXsf9taMM6aprvn3aQLnpXP7sOXBns0N1JAFdY57OsIywH2buFiSc1+x2kTh8VCgObVRBjRoOAo2Uy5hXEVfoI6drpEhGAxxQ5E8Bnzu3A3vPBY8e87wYrbs94+TnqBeBS8HUURFVjtfqSE7V3fizmdSs99M+4lgxDaaH6inrFbLECtoHfDNNW8MrQ3PqmKdfR7/+O+e91VpyBqBP7DILEUtKl7ufuzDOiRIp9PzYuStG+YUmR84u1LAU6MIArtTRgrw1zt1vP2SQlEl8/i6GWguQZDYzvavAA2tkAac8NuSKxb72v0X3cJhrneEFy3dm7LmWdc74p9pNFTpRggYiUWEQSmJwAPXcCfWTckQyyQKVT/wsV+UfTg2LU8w4ZQf6ch4Lc0pfCSSqJxhf+WSSzHF1twD22S6O4B+CzsJ7scH8pvs4aDccuixM65wPtZkMhQSTyIpa2Wsxy9d7MojbHH61Od3kyBiqBnrh0CeodWry2sdzCN/kkHgcB91PptSMJj2OyaXPzsjO2WUEHlVw4vBMzNmiwPF9TB8/wyucza+u22nYPrBZPLsC21T4uqbM7UN4O1vTtwIcyZfdei1ZC1rD/0wDpJPj0JACmNld+RDh9ZyURTpGPPQjf+UM7XRD/a5ADSX8nUUEkCFnJZD5fg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(3023799007)(18002099003)(11063799006)(22082099003)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnU4UmpSLzR4ZytMNlY1dXYyQUQrSEdGcWZTU3FndnpzU0ZRWXB1a3NyUkZS?=
 =?utf-8?B?eUhsbHhVamdNc2QrM1dFbHg2MzFRN1FVblVwTHpDNnpEdFZoUk9GbzBkSzhj?=
 =?utf-8?B?ZTJyV1ZjVGhTNmdUY2UxeUVWS0tuK0M1SFo2NVJlbEVydTlHcmZhT3pUd3JB?=
 =?utf-8?B?NGgrNmgyOFZRKzZPODY1QlR0ZWhqbFRzUjU1bk9JdXlxbzlsZ2tWVXFNc2ZF?=
 =?utf-8?B?VzRPMkZKcmFQWENhc0ZCRFJ2Z3ZWUGpmU0w5dmhSOHZEZzRSZzgxSXNqNGxX?=
 =?utf-8?B?ZHRLYTRqdkJ3dnYrRGhMU2xINnZzY2VnWE0wQUdWQURycUIrMnFiMUJaaTZ5?=
 =?utf-8?B?OXRWTWNHVnlRTmNTaEJ6NG9NU1RWazhXTGprS0RoN2N6TytpRDkzUnpLQ1Va?=
 =?utf-8?B?dlRHT2QyUnE2NmtIZXVjTm5jOHQyUzUzTzVod1ptbUJjRDdMWG9Ua2tEckpz?=
 =?utf-8?B?WVBuRUZ1dklkRFdEaEFyN2p2NTB6OEM3VkRHMysrTlFQYmFsbzU2VjRLbGZs?=
 =?utf-8?B?Wk0vM3ZJVytFWjNYWkNzNFVidlVhOXBKYktCaFZ6LzE4TkF2NzY0YW01UVJq?=
 =?utf-8?B?dHZBZFdvaW1IVXF4MW1IeWxmeU5GYTk5VjczdFpyZnJLa2pWRkQ0Y3hZSitZ?=
 =?utf-8?B?bnFSNUJ3Sm5CQlpCUUwyWGI0RXB2bmtaeEJNRzdIWmhFUnkrZGJ6cUJOWkRP?=
 =?utf-8?B?TmpJZDc3MFNBbWphemZrNHpkZ0dQaHhhV0JndFFNelcvQzNwTFNOSnFldE1U?=
 =?utf-8?B?cGZaelZ5NFJuK094R3ErS0M1QkhHM25xU2Z5OE5QQXhpNTRSVWlvL0R4T2RM?=
 =?utf-8?B?NkFJaUtwNHpkVjVIeHFiTXVFMlZjRG5TMmtvb1ljbGtSZG9PS1hmRXJmSUQx?=
 =?utf-8?B?c2JpQXk5NlRBSUx1OXlBSW5yOTdpcHlEVWFtWkF2OWlMc3UzSDV0V2poQ2wy?=
 =?utf-8?B?dWV5Q0ZqMUc2amdyTXBRaDg1b0FzWG9Zd1lhRTE2aDJ3SmpkNDRQMnpJejkw?=
 =?utf-8?B?VmNNdi9saHI5VDBCRnZPQkh1SEhFUGhCcUJCQVlFSXl1MEQ3TTlYa2hZd1dx?=
 =?utf-8?B?Sk1hSndiNS8vcStVaHlRUDJ1djN4WVI0VGpaSTFLSUVSNGpCSFpqN2w0MnhN?=
 =?utf-8?B?MHhTOCtoMWhFMlpZaWZ2ODEyam5KTjhSOFJBblpFTVd3dFlGdFd4VUI1aitL?=
 =?utf-8?B?L3E1akQ1ZHhVbTVxR0lwamd5Yit2eTZRVzlZdWN4ZGpIWjExVGxoYzNvc2Nu?=
 =?utf-8?B?SDZzdFM4RFI3cjVhUmE2d09hWDE0RmFRbVZIZDJtNm50QnVZU3pQeWVtUVpz?=
 =?utf-8?B?b3VpVEN0N1B2STI5SWtkUnUvaVJhd0lRK0xINXExZ3ZMa0Fvb01Ldy8vK0J1?=
 =?utf-8?B?N0lJemUvYkQvWjFTTU1SY3cxMncyTHFhazMyQjVDTGFlbHpVSkRLZFYwM3Ri?=
 =?utf-8?B?b0dXWVRaV0NTMlRhZ2ovVDhKYmV6VlIyOWFoRTN4OWI3NDc5NWpkdGlFRTN2?=
 =?utf-8?B?R1d1ZFc1U3htTkJSVUhRNVJxVVVuVmwzdExiV0RBa1p0WDE4N1BLbzFqbm56?=
 =?utf-8?B?SFhNY014eittb1NxVWdSZE5kbWdVT1hsa25IZHB1aEhBNHNoZzA5UUM2YUFl?=
 =?utf-8?B?K2F6YzhBWk10RVBTR3U5anhiQUpTZG9uZ054djYzYzZ0WXZEajRva2piamJa?=
 =?utf-8?B?S0R1U2NWa3FyUUtxSjNhSzZJRGhFanR2akQxZmRDUERtWk9jWEQzbVhhM0dO?=
 =?utf-8?B?QU1zaXExYjlkMHVsekZaZGZoRndpQU1zek5jQ05LRDdPakZFVW5EOWZtS2hz?=
 =?utf-8?B?S3VSMVFkQzl4aGlOVnNoL2o5U0xBQ0FGWXBzcUNNd1RKSnNJRytzUHprbXp4?=
 =?utf-8?B?Y0x5TzBheDBub1MxMlpqdHBrS1dqWjlKT2pPZWk3VXNJc2owUVNycXI0SHg0?=
 =?utf-8?B?T0VMWGNnQTZia25raDFoeHRxRlZLa0d2VEtwZ2VhWXNLVnpIMlprUjFWWkVj?=
 =?utf-8?B?bnhYaWlwUVlZaXBJZ0l4eEtuRmtPcThXKzBDNE1jNXR1dTQ5ZmJ2RkN0TlFr?=
 =?utf-8?B?REsyZUs3ZnVxNzZNNVlpWTZLYVZ6UUVXd2VJSDRxb3kwSG9iNXJ6TnNudS90?=
 =?utf-8?B?SWR0S21LeG5sUmhkbG05K0phM1N3VmMzMHBEMHdiUmxJYjN5V0sraDNSaGJN?=
 =?utf-8?B?aU9tMGx1ZFk1d3huQUxUNTRDTm5XU0srRUdpREpRbmJqYmlyT2FkQzg2d0Ex?=
 =?utf-8?B?QzhMdmZ3MVZDM3lZcnZoVVB3VkNTTlNYK1JnZHhlOEUzYTZGaGJlOFZrNUdC?=
 =?utf-8?B?Z09QRUFmU2pBbU5LRlM2UWRVVEtIYVV1dVlUQ2huV3puTDN6cmZyZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381b23ac-e6f3-4903-039e-08dee6ea629f
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 05:39:08.5784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGdMi74xI+1WAsuDTbfbRq1xQ26jZGkrgtLk9AWKt7fqE6mMkAMyCUihAHcJrzUj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9637
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_223917_734374_C9042DF5 
X-CRM114-Status: GOOD (  16.47  )
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



On 7/20/26 17:38, Radhey Shyam Pandey wrote:
> Propagate clk_prepare_enable() failures to the caller instead of
> returning success, and disable the reference clock on initialization
> error paths to avoid leaking clock references when phy_exit() is not
> called.
> 
> Fixes: 25d700833513 ("phy: xilinx: phy-zynqmp: dynamic clock support for power-save")
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>   drivers/phy/xilinx/phy-zynqmp.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
> index fe6b4925d166..c8230f2bda62 100644
> --- a/drivers/phy/xilinx/phy-zynqmp.c
> +++ b/drivers/phy/xilinx/phy-zynqmp.c
> @@ -658,12 +658,13 @@ static int xpsgtr_phy_init(struct phy *phy)
>   {
>   	struct xpsgtr_phy *gtr_phy = phy_get_drvdata(phy);
>   	struct xpsgtr_dev *gtr_dev = gtr_phy->dev;
> -	int ret = 0;
> +	int ret;
>   
>   	mutex_lock(&gtr_dev->gtr_mutex);
>   
>   	/* Configure and enable the clock when peripheral phy_init call */
> -	if (clk_prepare_enable(gtr_dev->clk[gtr_phy->refclk]))
> +	ret = clk_prepare_enable(gtr_dev->clk[gtr_phy->refclk]);
> +	if (ret)
>   		goto out;
>   
>   	/* Skip initialization if not required. */
> @@ -673,7 +674,7 @@ static int xpsgtr_phy_init(struct phy *phy)
>   	if (gtr_dev->tx_term_fix) {
>   		ret = xpsgtr_phy_tx_term_fix(gtr_phy);
>   		if (ret < 0)
> -			goto out;
> +			goto out_disable_clk;
>   
>   		gtr_dev->tx_term_fix = false;
>   	}
> @@ -687,7 +688,7 @@ static int xpsgtr_phy_init(struct phy *phy)
>   	 */
>   	ret = xpsgtr_configure_pll(gtr_phy);
>   	if (ret)
> -		goto out;
> +		goto out_disable_clk;
>   
>   	xpsgtr_lane_set_protocol(gtr_phy);
>   
> @@ -705,6 +706,10 @@ static int xpsgtr_phy_init(struct phy *phy)
>   		break;
>   	}
>   
> +	goto out;
> +
> +out_disable_clk:
> +	clk_disable_unprepare(gtr_dev->clk[gtr_phy->refclk]);
>   out:
>   	mutex_unlock(&gtr_dev->gtr_mutex);
>   	return ret;

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

