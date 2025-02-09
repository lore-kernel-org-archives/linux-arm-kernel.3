Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A42DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 18:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYgvy+MD8CqRbk0HLU+Ru14+ghRBhoi6cWdRho+2nuc=; b=wk8iLKioA/cFu29pHDn3Deim9f
	eYDYAjEcOzsttswrWz/pGgwPSmFLxNJrf20FSVR965PLg9rzDEmaIPz2a8qcBuTfAtohlzqXfl0dw
	nDQc2jnfnjLBMavxzdBlaZSsmCkYmIBKv86MzjeGHqaya3fkJgCIrZXBZ4Hk3K9emuB+wVGjZdizo
	QX8jnIy15ARnn8CikUZJQvQbWALrjez46Ep31crhvTEvM0Gj8zw4aBJlXstr0bKYRmqwkTqQ9W0IG
	CvHRW58kPxHg8zmkamC9bmIXdwmS9yFS0Hw1EfnyJCpUBq9sl260IAWnOBbrVm5hTt3p7SExtg8bF
	n0YYon9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thCHB-0000000FMFa-00AT;
	Sun, 09 Feb 2025 18:43:29 +0000
Received: from mail-mw2nam12on2061a.outbound.protection.outlook.com ([2a01:111:f403:200a::61a] helo=outbound.mail.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thCFm-0000000FM8R-1GA5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 18:42:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhGBnZd6nJzREi4Ijsht3rJmSFdici9A26ln9GJympZM2lN6H8kO6B/21GRsJOvHQcL5mVR9FwczfpKY62tA0TlBs7JiB5kRwqz1y1sBIf/5a6gMy9m8IS4PUs5y+Ggaa//88ir6F7Z3xpswnxAox/+PwR2ybaYv5tqUS0Xp+a3dls4ovpTygsblJFbY2I8aBAYwKjaJrIcPlbQPWmP/GLwpHx2WbHWPNKM2N6Lk+r6uPy7+P8TIYpxaGRgfxzW/EXsVPqxKI0j4ERe0oi3g73aqdnOKd/noY+Zheyi0VloRPyJ86KaPVWLH6NkzeDEwo6GUb5YbRK1L2nnOxb08XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYgvy+MD8CqRbk0HLU+Ru14+ghRBhoi6cWdRho+2nuc=;
 b=xjILkZrhtvRTBBxhMwo6KthzNFBNmlc/5ZcVbXgDq7UAwxRFX8hlWPE9KMj/7TeLpH9C00KX45v8kQFvKgffXsm3mgnnxEiy21/OOsyj0fvqn+HVxsDAaFMweGMbxzv+RxSn+vWjjO+dbPpqy3v6aCZvVbkZVyHWwYH1RxvSSbDsGNDQ992MaZHEUpiTSLoxp7m0cUaejpfuTYFILIuNzppeS3zrbkOYqY8b6Txk7KFGo6BgYMu/bayenQp6luv/dWxUlIT785hx6NfHTguyYH76ZcsWwY+9D8TBedXPW+9gUFTFwIKd7TMLXpCmjrA4HYQptAha+ioBekeQQyvmIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYgvy+MD8CqRbk0HLU+Ru14+ghRBhoi6cWdRho+2nuc=;
 b=Ufsq3LGVBh4JIwrBQ6J0D0F+P9QN3RQK84Ih+fHc+DRy30PkuP4rqyZjy06Gs5xGfRDu8tTUznfKT6wdo8S0NjKHFWcOPMIp6FaENxtEdPqKLr9xqLb+s+nMSL8AK09f/K01s1awQckELeRnhUcDgMunXrk9HMoIT8Sr92P8mtIcaTZjxoKDWFd2CLaQakhV5Z/FYlste+6+xO4FS0O1wErcROSbYmBgYz3HAeXMODWOd6NjEXS0LL4O5deN0cAZiQ+8KPE0Inffl87UFHJP4fIY0nkf8DfcGZHKapkN1y7wvnfIr4vmM9o6mAC80e0dcPHnEq49is0LJIu8UzQQoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Sun, 9 Feb
 2025 18:41:55 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 18:41:53 +0000
Date: Sun, 9 Feb 2025 14:41:52 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, tglx@linutronix.de, maz@kernel.org,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	shuah@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	baolu.lu@linux.intel.com, yi.l.liu@intel.com, yury.norov@gmail.com,
	jacob.pan@linux.microsoft.com, patches@lists.linux.dev
Subject: Re: [PATCH v1 08/13] iommufd/device: Move sw_msi_start from igroup
 to idev
Message-ID: <20250209184152.GM3660748@nvidia.com>
References: <cover.1739005085.git.nicolinc@nvidia.com>
 <550f103125805461491b87bb6018293ce9b888b7.1739005085.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <550f103125805461491b87bb6018293ce9b888b7.1739005085.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BN7PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:408:20::39) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN2PR12MB4302:EE_
X-MS-Office365-Filtering-Correlation-Id: db479a77-61b4-4b39-1e89-08dd49396c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IavNkmEvMPVAroMC2DGafKcPorFTCuqoX61bJQJ1vf2XBBgiKgivRKonIgx7?=
 =?us-ascii?Q?LEm99ONqIubTLEintXrBm59Rrl4nkEb95tAnD9W9gjeXoRzARdYSyvfBDPlh?=
 =?us-ascii?Q?FrMMx9Xd2i/EMJJrA5V+YZPeYvJ0ZQhwVkm5m0bYDm8PbvTGAgpk5Qu//t8K?=
 =?us-ascii?Q?aZEfnhKCiSNSMGlQS+rLDsvXKhBUXKNTsup+1ixnHBTCjcuXDn5EjLf8Xwjm?=
 =?us-ascii?Q?PNTUvVxv1bbiZ5zVcLFcll5r5MmPEX0Qz/mNLhFboM7nPwvY92pIE/T5Z8/z?=
 =?us-ascii?Q?FM6SPpnsFt0/iXeGAU4fyiKym+kRqXjPjJVohU+rO61vQIrwe3RRyqTNL2oJ?=
 =?us-ascii?Q?PM2I4PI4NHk3++r8QM+cQSP320ip0wHri5E3CyBfuw7LwAHsFlcPzrPzXmEH?=
 =?us-ascii?Q?pRKO0glQwp3y2nJ56aCo0073/C1pjkXwtjNq0sMqFF2Zul+32vbUYxcfV0LK?=
 =?us-ascii?Q?8aHkCw16fCb6zU692IOPNr90UU17JP9tXIT04pMBCXeY0ZmMJFoBiROvFT54?=
 =?us-ascii?Q?1kgONvxpbY+2iHdYArD2rHB7HeOztN8gb6yxz29kp7cmkXv9kDiivQ2z43st?=
 =?us-ascii?Q?7T8hgUpgoXv4m+lc6oKALUT384t2SFzUYonlxxJt6y8dby8pao/eTkUyPln9?=
 =?us-ascii?Q?Hmgoz+6G0nxWHDs1YMHQOHtzSGNCAhnD54LN2o22N/yvEvbbg4sEJc+prI9p?=
 =?us-ascii?Q?a5vleFbjGI3YEiJ55o3P/t/dOJ+6qE7lnaKKgPEgyjY8H7/BkoJ0F/+6dLtk?=
 =?us-ascii?Q?TJBg2//2AIjqNKqzj866QEVsyo6s6kjc6NIh9/pwKkg1Wrf/0yVrvOfnDxLe?=
 =?us-ascii?Q?QgZZt0uWfqx3JaQM1HBC3P36rs+lR3Q9SDwUNYBP4mmeWrIqDHkcmlNNKiJI?=
 =?us-ascii?Q?qR29fHYokLnGZ5c7Gu0RAu2JcEFvsMX5tGkDEt1Qge9ytG7c2CyI7yRhT0L0?=
 =?us-ascii?Q?NLl0UnbU8vSL35ztgSanp0bSSK40AU/A+guTinlNFKMJOCz3OIARyxLuCQW/?=
 =?us-ascii?Q?lQUwEWBL9hc3tTV6YoV741D96cD8w1wBS1Q8NrnwDGPO3yZxeB/COHbBK7PI?=
 =?us-ascii?Q?oIb5f9psU+WjmJmewlPSA2JLfkDEe4S4nVh6izriRiwbUf6tVqvrjKkv7rj3?=
 =?us-ascii?Q?Yetgf2PW+C3yO6Um41GlY6OG3Et+7b/9T0KWJ3TineCOXNHm3GtgY6Aa0AJa?=
 =?us-ascii?Q?9PGYZ08ibwjXUVGJzykAh07xnhxeBCQkw1ZeZWXO4sb6lmcRxWM2wWmsbdxu?=
 =?us-ascii?Q?k+RZsEtM2xJM/bTmsg8I73QLe8RPb/iiLm9xIy1rEY+2FicfosutvxooE0KJ?=
 =?us-ascii?Q?t5Gr7pOmF3MgbR0ob4vGlz7uEDWmLnv/IBNrluCZuUonRkcQCD7PhJ2vpyMY?=
 =?us-ascii?Q?oq5KjFLgdT6gTWtsvlViVdcWjpbb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2f7IZn1yNVbnqEFLY4HHWuPWITnqC00MOwhNBnxMOXC1XMZlYF90EJq011I9?=
 =?us-ascii?Q?7Yb0bU4I91C4Y2ImKSZ40EjdSWqu48oy50wW5AnP4TgKCwFXlwwf5YVxJFtL?=
 =?us-ascii?Q?topp2VLXr1Zao9EsZAxZ1FVg7+u3le+9avR20itfbIEsRb9JS3UIC8ZysvHw?=
 =?us-ascii?Q?oQ1+/ANGkMrj6uxNxHclDx/+UW+G8DuvhQY0utbB5BeSv2CM0UuzdbQ5tJyl?=
 =?us-ascii?Q?PK91hzbmAn4n92/UNU7uhj4jBhUUaasQ+A2oBUW+cWhLC6uCwlGroY/HL9dw?=
 =?us-ascii?Q?HiE5/pyq50hLvUS2pNATWWSonpTmf9aeo0IcZqCi/4hqZEV377OCbp2hoC7y?=
 =?us-ascii?Q?jajmsogCeeZVgxP4OG5zXYssawD39fpysBrD+TGH9JbvfB3ov0GNkWZBzhAj?=
 =?us-ascii?Q?bKRRJGhIv1RhNJHrbwf4CDCNNhaDjUwoaj4LQ+5zrnCxUP78VBvrrJmN6iJa?=
 =?us-ascii?Q?cUG/Jx415R37NnXsGG2Tt1BvSthO1avIGnRc5XJ5hs15qQIoxjARuoR3P7eC?=
 =?us-ascii?Q?HQ6l79VkBAQ+dblf54AM7w1JyVyXNUkjijnghb4sX/R40INUxjRVaaMyS6E5?=
 =?us-ascii?Q?inXdwvSRnWrE/bHHAzFI/68sSqOKjF/K/kVyAPaRyOLklW7Pi+OL+tx6wxT0?=
 =?us-ascii?Q?uFnFoJijiGlmRGda4tAdltMprfp9Kj0zp38l9kWA2Zb4HsExrj3ne+OGpsTV?=
 =?us-ascii?Q?3hg6SU9Rza5/4XqAZqBZuPUmmVq52m4exg+TWAIOW8Ykp8deN0ooKL3XS/Yh?=
 =?us-ascii?Q?10X7EpgZsoZPp74kft4/kCuVigopgSP8xvuOdDiDWCHF+7IyBpw8rNk8pg58?=
 =?us-ascii?Q?SC1vGBbZIL6LTe0p2HahLdHtP5gukppoTSRGjs67QjEYrg1V3NXyXeq6Pod2?=
 =?us-ascii?Q?iqBco0Pm7tO1sZoGk5bVMKu1dlxvRRJrHW+6SvAQWyol66L0Cl54vysNhstX?=
 =?us-ascii?Q?ArBGcOvZ3b+iXZtCEntGHLFMHN4Tra8mfXrGl28anUjAhFEDwBp6mJH5IqYN?=
 =?us-ascii?Q?dZAtsv7WKwutwXoPbsTjRjHhoruh8GRJLZM8OXohLzr1zyRhq+Ea8oXWT48U?=
 =?us-ascii?Q?/tQUn81w5IiTGUoP5pFyLUOJ1BRBvO4RtwaWAfF8mOU8vuQZjwiTHGsfU4pK?=
 =?us-ascii?Q?WzpmVNKkEI2j4YJQ4K5OH2JVAuXXwg2qlh1qrjLkWYj2vw7JOJglApsCTkCf?=
 =?us-ascii?Q?bAdRI3J1BsF/BbGICAY6czTVtrdeWXhQ4ZkOilXBcEZPXP6DBxOdstBlau5p?=
 =?us-ascii?Q?xKZlFIlwiRujhm/AFei9LU3gFqSnBIX6BkbuYEVBljsTnOJq4TLgtFVLNFjv?=
 =?us-ascii?Q?Gv+YgimToLs7w/d4TpEnwxupMDyhjivk9jClS2SgvEWwlrG+H6N5arwOLeMd?=
 =?us-ascii?Q?SFYyWaNbF7CHXnWQKthja5M8ghb3yUS5TpFLD46f0doa92LKZrTqbIaBaqx9?=
 =?us-ascii?Q?wEScL7Z0X7cAJwyaYneRuKAPqMk2sti9T7kmzZ3nWFHNM1GXkPwT4rVqffzy?=
 =?us-ascii?Q?ZXWKndK1kEYZq4gLKmUIO2C/pGdP380x8D8B1mzum+EcrZnBNMn9h4o49YRX?=
 =?us-ascii?Q?dw9U31yLFYkImiVgoiI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db479a77-61b4-4b39-1e89-08dd49396c44
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 18:41:53.6403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDi4N5359AiI2A3jSmuHf5hiCNIkouF1y2+fjAY4gVyBNF/I94JLLf3xol19y45i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_104202_340240_E85CCAE5 
X-CRM114-Status: UNSURE (   7.45  )
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

On Sat, Feb 08, 2025 at 01:02:41AM -0800, Nicolin Chen wrote:
> @@ -433,8 +433,8 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
>  	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
>  		int rc;
>  
> -		if (cur->sw_msi_start != igroup->sw_msi_start ||
> -		    !test_bit(cur->id, igroup->required_sw_msi.bitmap))
> +		if (cur->sw_msi_start != idev->sw_msi_start ||
> +		    !test_bit(cur->id, idev->igroup->required_sw_msi.bitmap))
>  			continue;

So we end up creating seperate sw_msi_list items with unique IDs for
every sw_msi_start?

That indeed might work well, I will try to check it and think about
this harder.

Jason

