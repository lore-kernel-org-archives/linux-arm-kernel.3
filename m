Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A4AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIzUZnDYhgYTmFZzm02rOI5AdEvFnEfEA+zKU3uFb2g=; b=uQ+FXM0dhS3uilTq6cO+XaHGk0
	hF3EUC9gVWsfteKexJBwXUFI4CpMHWPURoBM4/hBcqcLMFTrN51d6AclLdY/4YqjIizABUYU3Oyih
	3w8k5q/4SYtSxhQrF5kVP7LciHIqILNXpKol9xyfXYheZQ0RuHjwC0otdVONEAS5+A61j9qNmutg3
	pkfhADmn2L0MlaVHN64pfIVSJ11YBQTd7nt6Et4P9aQ2GpH2tflxYpNLr/4+zwu/y+aDyIcoT0sME
	K0g4DkSl9llqbd14Gy5g1PdPHPgsdARbfmBGlsEToJyDDwe4cj5qPEJP49aamSwP3UECHo28iBfz0
	pwI/JBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxn6v-0000000Ebd4-3Urv;
	Sat, 22 Aug 2026 14:54:17 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxn6s-0000000Ebc4-3gwo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 14:54:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gyi5Hznt7dMjxim1D321iKCm7Mj5lSwwMibDcRbFRDx496A0UNpjYwOA6mXLrOv4d84LcbHs2alnRex0vY6R+yUfJ0y3+C/hwoDwx0R/0CpH8phlHdLJKmLftM1/vK62NYmETZ3mKKsjm3jhNWbaJYH6SJoNroF2VxT3p2NdwM0GHz4rTL/A8auaxvO0ffNb6rE0jAS/76kTyt40X71ZKtSrMWBeBtoYsxUaB6+nDDzzgBkdyq6+5CpEVMZbCgYQCq6Mi1bQSHPYemrKzj9PevrKQb0djSZfxbkeD3QvlpXgMKLEQfOX0LzPdmeio1lUNvtR2VpKpc0VJ0hbXEBp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIzUZnDYhgYTmFZzm02rOI5AdEvFnEfEA+zKU3uFb2g=;
 b=v5KjyKuT1lPx/Z6SnOYGcHuSD7VHD7f+FFEn+3HjOloNIgzJIQsu7MUTf88vrU4GAezuOoFnND+vF9Mb1MaGdcgc3+Nd2UqCVtokglID2o3LUG/sBZheEuvQw1+kWxXbaP9gl2xTYRZDk856YGVdFeAWqmLtqFCBx/5ZvBqsFZQ05ApIxpqeiIGRMLWxMdwvB8rjpYjePZnPqqwxrTHeXn7VACenct/TtWvSUksvoAeSSZBOrlkG8tuH1MrN1kKVOY/9IQYvPpaZdSbHE0Za+pxTN/a78m2lL9aPO5JD1+wACdn0h+1cIFmMuYCTMAUFhqAzIIF7PHp0TeZVYQf3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIzUZnDYhgYTmFZzm02rOI5AdEvFnEfEA+zKU3uFb2g=;
 b=CtQJW7KSswVmPJoIKJ+D6aCWJTCzBg3CDhIPZMgjPPB7k6kZHi1cfwQUC+YPf4W5HMJgpvsohflokKXkRlmqhmk4nrTCQsOAjABZAht67gwwad1oiTxtMkLvVXVn9qu2200CB6/D0HxqJjuqIke5VIXwAL7bmFH1kiKCWbXu6Ho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by SJ2PR12MB7989.namprd12.prod.outlook.com (2603:10b6:a03:4c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 14:54:07 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%2]) with mapi id 15.21.0315.011; Sat, 22 Aug 2026
 14:54:07 +0000
Message-ID: <e225c560-eae8-4487-be66-f624e5e215ee@amd.com>
Date: Sat, 22 Aug 2026 20:23:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 3/3] net: xilinx: axienet: Fix IRQ error handling
To: phucduc.bui@gmail.com, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>,
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260821123249.41527-1-phucduc.bui@gmail.com>
 <20260821123249.41527-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20260821123249.41527-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0030.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::8) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|SJ2PR12MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: eac2e30a-e891-4f76-7196-08df005d3753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|56012099006|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: p4Hi1ijgghUeT6ctWEatkOMgB8UpIgzTZ0YACyxdixC7k2zGEwxIixbvvYOMkBzHwWisBDSYyyekGL3Dqt7h+qUEdBefPNQQATbBMDupwvZZDIB61JNMNh8krccJ6t6ylCJ3UvlxE/4hAJbOVKxSKTc/VhR6OJxbvdL9HmiwnG00fVR7mMc4PptvBctP9oI3Mds4IV+c21B5V7quxnfoasCsBfknxUAWPMQfxVraWpeKoA/vvvMQ9GMQUHsXy8ocKOuFfXjOEqAsnf2w9KbXIZMUtk5QK9GrSMorQYeSY9zNr+2ge+B+Xsxi9/SdoT8undS3kbuk+KSBfErU3J2xMx18aZSVQWLkVOt7IgMxjPFsfP8ezwwGdHgerfSzOAZVmGXaN5Ftu8a5lRBIESiYv0d/5Z+D2pKpHVmse6VqxTF5gtJDzVdaDr7msl/A8jUKeNIvwmkJ/SKuHKpopA7s7QBWIu/yW3NISQ1w0nLNKDpfAOpA/9+8c1nm5HGDfoQwNmUuwncZPYhB/6fNVqVZQjFfNDXGq6DEZVgk3L7RnK0kfGs/zhieR3cCHsuBKbYVkovyE9uWcHDCHs6pfek8oXn41nk3Qm3WjkEOhYhv+9wYSp5rdD8rvBd+9rVb0PtCTGxAvb6J5Dy4PkPxmZ3BIEiMzBw8GclpNC50lUb7Kpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDhvR2ZEQm84cDZYbnJMQkpGSm9tR0pHZHNsYkVRYjhXdUJHY25KSEdsSktF?=
 =?utf-8?B?aXdXbTRVMUxzVE14c0dnczZQRzNJN3BVbERWTzNBeUFxZGY5dTdVcGYzL2w1?=
 =?utf-8?B?dlRIM1hVcjdkWFhKdlNnQ0xORFBORy9GZS96dUsvcjVvWTFFNitaMzlTd1Vj?=
 =?utf-8?B?d0E5dksvK2dSd3kxWU5Md080bkIxOXdlNjNEdTU3M0l2c3RqdVVwOXlVUHVm?=
 =?utf-8?B?OWI5V3FJRjhkT1NhL0U1aVZQOFBhb21hTkt0cDd6TE9Ua3M4MGNLNEtTeFNh?=
 =?utf-8?B?Mk9zcTIwU0QxNWg5WGtzMU9zYlFVMkZFWFRGV0tGNlp1N010cDcrdzUxNi8v?=
 =?utf-8?B?cWZ5TE1qb2Q2QjBFejllZlFMZXVKY1c4dXIxQW15dFBjb0pkbitVeW11R0N2?=
 =?utf-8?B?L0hrelVDRms3V29pM0VHNmo4dDAzNDh3cCtwWUxZRUtRN0s5bjRzc2gyTU9j?=
 =?utf-8?B?VFFXR05SOEZQUVd5bEtsWStRUkJlWlV1V2tmdjQxOTFBeUoyNzZTdWtHZUZq?=
 =?utf-8?B?N3JKM3dqZEZ2bnd1Ni9ONko5ZFRFQVpEalBKV1prVVFQZUtqMGs1YmZqZFFR?=
 =?utf-8?B?QnBhSkhoOFc0K2F5UHJ3VkNVaFdJNGVJRjZKdzkrMm13YWZDb3c2eUZxRVR6?=
 =?utf-8?B?UVBrYlYvQmU4V0VrRitHaTVCZWdpMDNyT25MdzRZbk5YMGJNODFuNnZ2Wk8w?=
 =?utf-8?B?N25kSU1CVDhHd0lhbDAzaEQxZUxKOFB0QURrWjhlUkUyRk9PU3FKRXhiaFlO?=
 =?utf-8?B?R3prdVk4dmRMVDN0a0FLYkJ2QUN5OUMwY0I2T3Q2QUxxL25VMWNOcWZFRE4w?=
 =?utf-8?B?bTFNaVc1VFo5QjJVWGNTY2c4VmpuWkJjUUI2dXk4MmNwODdWZVhPcWQvb3pH?=
 =?utf-8?B?alBnOGM1ajBMV2sydzE2VXdDN01CVEU2OGpOaXBSWWpPdHBnRUxrNWtGUGg3?=
 =?utf-8?B?Z3V3Ymk4Wkd3OEhocVE4RjIxRTgwVURrUGY1b2lEejBXNVZ2NjNLSFF1MU1w?=
 =?utf-8?B?bnBlbERuL21OTlI1ZnI0d0VUVWRYRWd6Qk1wdC8yWWpjYi9FWU9MSG15N0hG?=
 =?utf-8?B?TGtVbHEvS29OdHdERXNtTmZFQ3pHUHVlS3UvMUJCcEtsbWVZYVFnRnpPek16?=
 =?utf-8?B?YVZnVWtVUVdwY2hUcWJBK0x1ZmZxSEhlamlPY0VhWFpnVEtEbGZZcURQS242?=
 =?utf-8?B?MzBiS0dyZzU0cVJFNUVjc0lYdDJGK3ovSVlmT3dycUg5dUZudkUyaE56enhV?=
 =?utf-8?B?YmFzOUZ1OEh6T1pWUkZPTzIyRERkL0F4YjVlSGdzZy8vUE9jYUZIYjhrWXZB?=
 =?utf-8?B?cVVBdTVZTzNERmVoWFlESzFhU3h5NkFhMXQ0VVVtVkdqaEZrWnJZVVdIeGl4?=
 =?utf-8?B?Nmord0d0bHdHd3h3WUNSVWxZUkZPLzlsazJGYW5KUnZPdksrb3RPRXdCdUtp?=
 =?utf-8?B?WmJSMTdIQi9wTHRqamhtRFRYZUxmZGdFM2pROG5yemNsdTZvbnRUb1ByQURY?=
 =?utf-8?B?enJwdUtJTDlDeW55M3FzSktXVG55eENUWmxDdWRVL083RjFiazFKd2VMUkhH?=
 =?utf-8?B?WElRQko3aCtMRTU0RStoQXhaMU5FVitjS0lPQjJLTWg5bTVodGJySjN3UCsz?=
 =?utf-8?B?YWgxdVppbUhGUGxheUVZQXV3SyszMHlhN1BDU2t5V3I2NjF2TW1wY0VSTnph?=
 =?utf-8?B?K2FueWRSc2cvTFpGWTk4bWdxR0FKbE1ab1BUTkdscTAzd2F3OVM4V2pUTFpv?=
 =?utf-8?B?VG44MkdBRXdWSHVsMFRja2tLYmJPV1h6MFdpN1hBWEF3dTRha0JDRjZQTXd2?=
 =?utf-8?B?V1dKY0w3YWJTWVpZSHZhRFNTVkhLOU9DdHlOUFhweEdEd0ptaEZJcy9mM1Mz?=
 =?utf-8?B?ZDRKZWhLOUlLd3gwaUNybTBlSjdQb2MySGw4bVVuS2o4eEd6SjBaQk0wVE1Q?=
 =?utf-8?B?TFVWY0FWNmh1eTFEMjQ4aDFtUEcycTkwZ0FNMWN6UW0rMUJKQTh5UXZWdHBx?=
 =?utf-8?B?cXdianVuY3dxTklDM3BJTXFnWVJzc2ZpdXE1SklMTEZVZjBMcGF6VURCUjZ2?=
 =?utf-8?B?cStqS2RkK0o4Rm5HeXp5VlUrc1RVRzJwMkwrWW4zR2FNbHpLM2lxc2o3Q2xG?=
 =?utf-8?B?ZTZ1UGhhMXpJMmRleHB1K3l2QUF0bTZnc3ZyNXNoaXVmSFNNUjhmbC9XTzlQ?=
 =?utf-8?B?RjRUWEFwRzhhUytxQXVueElpcHlZQU1oMmMxUXRPQ0VZazBtNWMzb1pWc0ll?=
 =?utf-8?B?YnVPYkcwSkhxcnJyOWhWQmJuLzRwTXRoNUdoSmY4Nis5YWhSSTkrVi9mVHli?=
 =?utf-8?B?RmRwRmlvU3BJQStiaVRwa2NiM1RGMi96ZXhmYXQwWVdTSzhrRUZrUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac2e30a-e891-4f76-7196-08df005d3753
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 14:54:07.1917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9P4GLFyUxzG2nkuYZcJMcZ9Pt6BK0Td44arZ128mxc32JRQVWJFuUc4QmQXDUG1k+f1mcMIZT2VbOKp/YZrYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_075414_930255_1A7121F3 
X-CRM114-Status: GOOD (  19.37  )
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



On 8/21/2026 6:02 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails,
> while platform_get_irq() returns a negative error code on failure.
> Handle both cases and preserve the original IRQ lookup errors instead
> of returning -ENOMEM.
> 
> Fixes: 28ef9ebdb64c ("net: axienet: make use of axistream-connected attribute optional")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v4 :
>   - Add error handling for irq_of_parse_and_map()
> 
>   drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 3927ababf833..68b580191508 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2971,10 +2971,14 @@ static int axienet_probe(struct platform_device *pdev)
>   			dev_err(&pdev->dev, "could not map DMA regs\n");
>   			return PTR_ERR(lp->dma_regs);
>   		}
> -		if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
> +		if (!lp->rx_irq || !lp->tx_irq) {
>   			dev_err(&pdev->dev, "could not determine irqs\n");
>   			return -ENOMEM;
>   		}

ENOMEM is a slightly misleading errno for "IRQ not found" on the OF path 
-EINVAL/-ENXIO would be more accurate. Since we are here, better to 
correct that also.

Regards,
Suraj


> +		if (lp->rx_irq < 0)
> +			return lp->rx_irq;
> +		if (lp->tx_irq < 0)
> +			return lp->tx_irq;
>   		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
>   			return lp->eth_irq;
>   


