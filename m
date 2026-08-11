Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BB8C5B569
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F05fzZEZORLdpp+eIpRlKhpVR/4aFztg+5HhYVE5JGg=; b=Z5FpZ1p5HY7BufOiONSS/zDTbU
	qojb+rILzP/mw02VGqhPVQMsl6yEowN1e72sv1g9Sta2OM351P3cAnbTPtEL0mznZClGsLKpasDq9
	p+NGr0KzIh0FVqFglvdiClRXSK0EPpmIpfSvSZuPFF4voQJ71tVxpajk70VgfodXlj8F7TFoihU/m
	V4uGvEE9y2Q9b59TcRm8SyI/fpROWZc3N3r+o/LrBf3pa/S1PgohAWUYyhj7nJ2XEKoiKzOBj6mMf
	mLkXW7kZsTUPSQMld+dcorRuM8Gm4/Tlrr3VNvRHQCJKm/MUBOEfyfExs5x1qP3KuQBT3koMEQsfJ
	lFT7oC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgEJ-0000000DRZE-24IR;
	Tue, 11 Aug 2026 06:44:55 +0000
Received: from mail-westusazon11010041.outbound.protection.outlook.com ([52.101.85.41] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgEE-0000000DRY9-248T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:44:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGj1VWjiY8ZPUAum61kZBijKVmElNI64YSkkBC9/O/MzgI+aG8biCHBRnLrJkWLVAwjk0ZiZtk4wbmNxswU1rI4SRD6vKPmKYXCM9BSQK/oodrmBi05/OY/7ZpWHDJYxc7X2MtGzWNiRXXmxFu15+O0zt/gGuOHwUmJAqtljm1Lfh+P9oBrV/zY8vfP4T3watf9G9dXv8JIhc9j5n/wQ3F/66V16hvlpavzUHJYQl/pNKJidIyGCvcNVa7OtHcGgnT1n87aInDWW0Vz1w64Ka+6PsLoxAft/tnjcr4zZOuKrxyRnlNOPyzhiP/mvrFRyHE9o/ESDTs5gPdYsblqXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F05fzZEZORLdpp+eIpRlKhpVR/4aFztg+5HhYVE5JGg=;
 b=R/xotvjsy59cDe0LN9KIqlYeQysnxzf6KRFg6Okyq32h/stQuNywQ9riMPQ75i/ZjlFdeYK3hxSMuFuBKD+aFrNzuylHyQ1HwLud5OvqnhIdJGhFTxrRcFofmU4BAB0BYFTiRdxbhA0SN+a0DECY41BSlUbl8u1q06zfTTXpW92E88LdloJyLoYDajmRfJgGMk9kRY4KmhgjWnQOvXPhJYhZl0EcCAy9Wr93gT7gcDunoWWovqmTntnKg8J1lAopHgVFU1Wt5GMXP5SdDkR/vUylSAuk73LLCQoXOt6A23FJjB3hVyv3kf1MUVl9+hP84ia1Fgos1zwIhcqfd9+ycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F05fzZEZORLdpp+eIpRlKhpVR/4aFztg+5HhYVE5JGg=;
 b=mENvKyEaqpfj7Wh1QydT8luY6mVPSPpSu3b4uF5HUm80+oHnrdSeieX0lvMAj0mr54L00GgjRLkaoRn66gVgpVtIEJ59aKVmlgouS3dHQuA7eGQlEwCu86P9nTNxeVSvUiaKjLdLaAUCinrekp3+vNPu/NlW9RsWFD88PxgWNUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by IA0PR12MB8748.namprd12.prod.outlook.com (2603:10b6:208:482::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:44:44 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:44:43 +0000
Message-ID: <9e189214-1274-491b-97dc-1b943c6c5cea@amd.com>
Date: Tue, 11 Aug 2026 12:14:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] EDAC/versalnet: use put_device() on device_register()
 failure
To: Tarun Sahu <tarunsahu@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geoff Levand <geoff@infradead.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 dmatlack@google.com, Borislav Petkov <bp@alien8.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, djeffery@redhat.com,
 Tony Luck <tony.luck@intel.com>, skhawaja@google.com,
 Russell King <linux@armlinux.org.uk>, stuart.w.hayes@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-edac@vger.kernel.org
References: <20260810162814.1398016-1-tarunsahu@google.com>
 <20260810162814.1398016-4-tarunsahu@google.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260810162814.1398016-4-tarunsahu@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0145.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::15) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|IA0PR12MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 599aac83-07e4-42a3-13f7-08def7740645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|921020|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 7nzveOrTLyFjZW6oFnFse9uYc0PSNVhZH2m0jFWO7jP4xl4ubfrmEAiplbN2yri+gTu/PumE+ZStqORI13bfTi5bqN9k6FVc1FkyZpWMyv47LZOl30LhO97xbkG4A5rFA8Dn9a+qLw9HMySDoeRXWKPCZ8uGjzpJBj2ZnMqYZ0mycqUYYIBrwpVVSPeu/mFdlFc9fuWfe2/yIQqIQpEkyiXVqAxI4nf1cgGjQbAIKybZeIzoWYqmKyubcUQrSdYQF40eTb/Yqv4IuzPs2fNegF+snk3r/8gc3Xtmp8qyIzW8lrWUbbtidV8wL5hvJGxEx2GaM9BhRUhnZ4kvAJy8l4UKbHgbGcbP2Zy5k/I/OOixaqrFmAAZ3fVlhj2eQ5RhkA3o2qsojBX77Xb8gN4bscVgyd0q2SI7Zx0FJE8O6VGZNSAvJHs8BZI7E9rIR6G6BWrLf370MTCEBpVktzEG4iN1jweCSN4JCpyPnNGfMXhNdEK0AfvD2xQvPiEYMX7JRoIGUHq12CfM5gC4dX67KaT1NwcnSQZDGKNwbeHHlFegdaZizAsFVLPx+0wvvRjFC7L7Zw0KZJlGTkQrG/sDSGp/0W5u5RNugUUz/jAvVaIoDkmHIu0mr4oOKK1ABdxtMs56T8Df5GBtK5ZKFoQgbALW76/z0rj+ReHWbqZkw5nIQtf5PVXy1WyYohlngbBLd3bqMXv2GnV01BDTMpc8IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(921020)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlhqbzltUGtYWHRtRUhSaTJ4VUgzV2g3Z2w4L1ZRTXZCQkVIM3d0ejNPRG9z?=
 =?utf-8?B?UW1kKzZDOWwwMzNObzl4cktHMzQyczZyby8wZUFac1A3bEtkVXhaWVNFcTVo?=
 =?utf-8?B?b0t5NzNqbnRieXEvUDhOTkZlekFkWkRyRzlDa2tERU02bWZuVDdVZnpJUjJh?=
 =?utf-8?B?SXJ1akxOMnNHaHRISHpqeDFVQTRMM0pjU21HUzJ0UkhxVTdjZHZFRGdkclBN?=
 =?utf-8?B?LzhpalA4eUtkQWx5NDJwbFNiMGMzdGpMTEpYSXlsY3hySnhwdUtlM3FYYUtX?=
 =?utf-8?B?ZUJxV2VqSVJ0OGs2ejJZVVF1ZmJTVUZCV2ExeVVYZ0UrVEtvRndFTXB1VzRn?=
 =?utf-8?B?ZUR5OTlNUG9JSXVaU1h5TDRvalFsVVVTRkZqc2pmOG82QUh0N25GZ3h1TWZD?=
 =?utf-8?B?RDBPZUNCMDNPaXpac1l3K2Rta1M3VXBUVVljVy9PK0ZMei9rMmZqUWt2Tmkv?=
 =?utf-8?B?SnplcEx5SG5xVFRZUkNQY1Q1OU1QVTBZbXlyUWcvZ01Wa2h4VXVOR3RsTkpC?=
 =?utf-8?B?L1lDVmo0aXJ1QW1EdkwyN25aTUh5MnNVV095RGk3T2VmR3Q2c3dmVngrRUN3?=
 =?utf-8?B?c2NHVndMZkN4cFp1aUowZFo2eFFnY2x5NHFscmxDZDBLQ2R1WHovWkdnbEYz?=
 =?utf-8?B?WHpwa0VlVXg5UUx3dE1jelpPOUEvQ2FaeGxYYkxHMDZXZzBvc1dycHBGSXEx?=
 =?utf-8?B?b3pCcXR4VVJXdzhVd1dRTWJxN2EvM0NsNFlFemFhSWpOM2ZKd0NTWUQ5SFJa?=
 =?utf-8?B?SDJyVDNSQW80SjV1c1V3OHptdWZ3bzVHU2dhUks4S0JpaE9jMDNaVDh3bGxs?=
 =?utf-8?B?TWpxTkg2QTJkbVZXVFY4Tk5WTE1yeW9yYXlyc2ZVbm9Uajk3L0ZibGtaTTJr?=
 =?utf-8?B?Ym82Z1dnTWw5cEtMZG1MM0puNDF2dFpWdVB3a3VxL21lWVFlVkNiMlVRa1Jp?=
 =?utf-8?B?VDE2cjZ3Ky9Xb2JrWnNtbXFYNXd4Sit3aklBNXhwNHFjZEg4bHhVQ1Bkbi9o?=
 =?utf-8?B?VU9NN3U4YUl2VXZFSzZHSWJEaHZRMnpaTWlPT1RXUWlCTGx2eEtHNVZlcU9Z?=
 =?utf-8?B?SzBOTHg3OEtGeVFPUzFwaWVVdTBoRC9YcXdFYllkcHJqbkxvQ01JYWIxM1Nh?=
 =?utf-8?B?NlAwZGx4aXpVRWNWRUdnYUhCZUFYdWhrOC91WmZNekluKzhYZkx6WDBtZWRW?=
 =?utf-8?B?NXYzRC9IcFErQU9JdlZUOHdvdGM4SjRHUEVXRTVUcVpzcnl5bTl0V09tQm1P?=
 =?utf-8?B?aTNMNXJXYVRhUFBUYlN3dzZ6dkYrc1NNNXZiUjhYb2trdU9QdmlBaEV3bXd5?=
 =?utf-8?B?N3gwMkxrRGRCSThRNlU5UnAxVFpLU3pGWTQ4ejdudVJuR2Q1U1dhb3lzdENE?=
 =?utf-8?B?ZFJZdE1BSDQ0M0JZYUl2enFIWE5JaHNuQllxRHJvcklkMEZ4MitnWnAxZmVv?=
 =?utf-8?B?ZUZFZE5Ub2NJUm9yc0JJcjhGM3M3NlNZb2wzbmtkNCs1dUs2ZHdEYlQ3MndJ?=
 =?utf-8?B?MmRjYXJ1TFZLQU5UYWpFbEo2L3hIb2ZURmxrQm1mWmx2K2ZEUVB0Sm1MREw3?=
 =?utf-8?B?bHQrS0o1Ukl3YWRnT3h5dnRUYVB4SUVrWkpnUmVOUWJtZzBLKzd5VGdFeWkr?=
 =?utf-8?B?YVNZS2habGFKZmxoWkRPdnJiK2NGb2Nvd2R4ZHNZZTkrcWUwU3pDVWRxZTEy?=
 =?utf-8?B?RW9iUXdiTUNGUHpkVzJMSWw1RXEzK3RhWkd3c09XaURBSTBtdHRDTkZmTHBy?=
 =?utf-8?B?cHBoQ3RpTk1GK3dsVFEyczJCZllwME9rNnpQa0ZhcXVjRDZNcTBmdkJPUkFw?=
 =?utf-8?B?Q0kxczBaQW9sOTlFYm14WHdYNkwzdUIvRXNvZHNGaGtmRVkwWitwZXpOVXh5?=
 =?utf-8?B?SmdsVDNUVUZ3R0l4SnRQeW9RK3cwRmhrakEwREhQci9FTmRLd25adVJXVUVU?=
 =?utf-8?B?V1l4SlNWRWtlcVBDemdQWXp6VmtRWVNXOGFnblZ4dnc3cFJqcFZSQ05lVy93?=
 =?utf-8?B?L2lKN3dJTjVFZzdDVytGSXVOeFcxaGhVYkdhQU9RV1R0SXN5a0NYVTR0RHlW?=
 =?utf-8?B?UmF6eFZRUDRsNmFPSGNGaUgyWHhjZHhubVUzYzZSUnlWVmNKK1l6MmRjNDdw?=
 =?utf-8?B?S1Z1M3ZBaTVyNmhTaWhVaC8xZ3dIYTh1cmxEQk00blZIV3NXSThrUFliT3lw?=
 =?utf-8?B?ZTJESXFoeStsTHBMcWtudDNPVTEra1B3Z0x1OUJ1bVkzMVdvbFBzbHhNZmNG?=
 =?utf-8?B?U1VPbTNibkRuMHJqckU5UkRpd09PTjRZZVhTOTAzdm5OZ1BQcjMwc205UnpQ?=
 =?utf-8?B?cllHTDNrdDNvMzdjUWRLNDJLNEM4ZGMyRXBSUjVHQlFXNFhRUGpMZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599aac83-07e4-42a3-13f7-08def7740645
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:44:43.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BR4Z+9NhF3xM52fqK1ArB1Jiz5E80oZmbHtB+5bjn0MGrC5bIguVa55TsIUmf9sr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8748
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_234450_689798_EF344D41 
X-CRM114-Status: GOOD (  16.86  )
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

On 8/10/2026 9:58 PM, Tarun Sahu wrote:
> When device_register() fails, calling kfree(dev) directly bypasses the
> device_release() callback (versal_edac_release) and leaks the allocated
> driver core structures.
> 
> Fix this by calling put_device(dev) when device_register() returns an
> error, ensuring proper refcount decrement and release cleanup.
> 
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>

Thanks for the patch. FYI, this issue is already being addressed in an
ongoing series.
https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd.com/

-Radhey

> ---
>   drivers/edac/versalnet_edac.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 97ec05d68bbb..2912b3658915 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	dev->release = versal_edac_release;
>   
>   	rc = device_register(dev);
> -	if (rc)
> +	if (rc) {
> +		put_device(dev);
>   		goto err_mc_free;
> +	}
>   
>   	mci->pdev = dev;
>   	mc_init(mci, dev);
> @@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	device_unregister(mci->pdev);
>   err_mc_free:
>   	edac_mc_free(mci);
> +	return rc;
>   err_dev_free:
>   	kfree(dev);
> -
>   	return rc;
>   }
>   


