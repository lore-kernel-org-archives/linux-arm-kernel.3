Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ACAC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHKTY8ZZTvrpNM5WinqUn9NmHNenWM64tWJei4bnohs=; b=ydUrhv0IgggNnQFSQXrjM2xTQd
	f8EEn7DFGLgn33IQHWvpo5+laxKo66ekkI5FeSzVFFxkERS0kwwTM7XmMg5sf5C3NOs2WnfEZcn0b
	9wtXhv+voHwXKNqLxOsmV9ZFN/T2Ykk2KdsSuCYzZw/lPz7tHxf6XbVv7bdrPrbHEcQQyThh1OtE9
	KTRlEgVfZHC6dMn8geLQBJdN0mv+c1GnVm+LbsktEF8UCpsVqHBDEjkfi3N28O5ly7eJt/bZOP63n
	j05pHD3FG6x3cEuy+VD7sflSrSc2+AvscFojLK8Wt0nn8KyaXgJwysO3u9n0jkYagjClVxVT9+lsI
	xNl0op/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRANN-00000004czs-1U8v;
	Mon, 16 Jun 2025 13:59:53 +0000
Received: from mail-dm3nam02on20611.outbound.protection.outlook.com ([2a01:111:f403:2405::611] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9EI-00000004PtB-3DPk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 12:46:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmU02AyL3L7EiISxtxWQi0mPO7KmfHy1rMyKD+44p/KggYBK2Z06G5VK8L2oR7J3EY7TrIU5NYxC8Xo/MdNlh730HOv1jdon5z1x/qPvTz9hYwdJ2MLKJLm66w4e138kGwgLoOyS226XXIXKO9bslXsNil8qcU13dmqMiGwcf8m8Q8G2TeXtnulRvWILcl016PKnVHwB8MOxID9N03QXG03YZ0f2NZibSBqSchvT2lPXOztcDJhZXNtwbVL4inVtL2JR6wI6tQz7mPeaS/cCd7mmaQif0mg1ElCKBNBKD2X6ZTL9yaSO9HsqPFypTivl7UlaVz1sa7kWbtkigiJpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHKTY8ZZTvrpNM5WinqUn9NmHNenWM64tWJei4bnohs=;
 b=MdxDiHDUDDsn+N4MY2ZXI4oRtsJxCX15hTbS/+BUo0PPEe+NTeO7bR47rxvwmKE/U6yWqI48Xnh1buwtuS+uFIN4aDHpcrvGp20C2BDBfD5GwgkOgY6JM3LfCBUn+t3N1eaftdCy4XxA9f1HuTq5xRjweJb2Y6C43CeTj2BptqEKKM4N75+D2p2xlTJEj4exPazvav+8Itz53f3yHK7b+GrepGTbGqfCq4ezvMF75kGhVdMKA8E5JYHsblbs1s/kBKFiD+zRam0XD+1Imn6HfqYWrLThES98y6ht8i0r+2WRCluzH6co3n0XUj4PAIrm8/j5vaLA3cX4bQm6dylh3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHKTY8ZZTvrpNM5WinqUn9NmHNenWM64tWJei4bnohs=;
 b=p0SfOKOA33CIHewLb4JoWDqPldsZvQ94B9Thze0dI+EQdJElprI4DjMao6/d05WLeq5L2myao1TK8LlS/8W/QWKfijHuzCO/y9kZgXkmqDGzOA9BZskBXuILge8Tip8Nl9tJhyfXrjnAAJxYc8XZmRY7hfK/cf4G1wUrysB38KUwTWd6Y6DhjjfefVMkiq1mwDT7KIZgk2xJU0Sn7u1qdyoIMLMzxvZgBTgorde3dFCeuVirtvyaf/Dp1uHuGv+ZsucLlTj9vpSLYlKmduNAeVlKu/fMVlfW2neREYC/ewTUM3sK9WGBH59qs0ucu1C+h46P2Pw0ljyR4lrPlPqSbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH1PR12MB9670.namprd12.prod.outlook.com (2603:10b6:610:2af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 12:46:23 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8835.023; Mon, 16 Jun 2025
 12:46:23 +0000
Date: Mon, 16 Jun 2025 09:46:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, will@kernel.org, robin.murphy@arm.com,
	joro@8bytes.org, praan@google.com, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 08/14] iommufd/selftest: Drop parent domain from
 mock_iommu_domain_nested
Message-ID: <20250616124621.GX1174925@nvidia.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <0f155a7cd71034a498448fe4828fb4aaacdabf95.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f155a7cd71034a498448fe4828fb4aaacdabf95.1749882255.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0653.namprd03.prod.outlook.com
 (2603:10b6:408:13b::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH1PR12MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc7970d-14c7-405c-8c94-08ddacd3ccc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fu5TaGXhRANq9v9m+Z0TG+iiHXp/2VWQzI007TSZ7tt0Y/HbnFNcAsvhR0dB?=
 =?us-ascii?Q?vwnLpnrqLI8M5Sp/u8fZvkteIp3UdYDvpK+blfuVqfsJgxIMslT+JIJnvIU3?=
 =?us-ascii?Q?OcEQVCKVvcmOxmMDjSgehIHwuvUYpwlr8zaW64jMAG+HLNA8V1tC4zl/bo+6?=
 =?us-ascii?Q?vy/fV3vGLUIS3Aj3lT+1Zt7gRSmd3ijI38yP42dpda3Di1d6MsYp7HLykL4F?=
 =?us-ascii?Q?dR72Akwl5zkQoIS8rDED+SzyUdqq3mme1eRZafreTzQQKzAn7J8xKc71Eo0O?=
 =?us-ascii?Q?jrWSXV7WliQmTdePtCYzPRt8y0BR3uJKHMLSGpJYFXSWzL/slKzPT1OnvuLE?=
 =?us-ascii?Q?Iht++RBJUP9tStEywKr0ICdjHbnuOkrt5j+aADkFn5N4xWHNP2ZZKG4vgJEm?=
 =?us-ascii?Q?mBgnAb740NHIwMApmp1GuC3ySSikadZM2yYy84yLe/UdCzQoTPRa6ajd8ks9?=
 =?us-ascii?Q?Uz1TJ9285kjmzg8CSSxw1qp8pRrCty58s2cN8b5WYwz33BfGmAiWKMdbS43h?=
 =?us-ascii?Q?H8s7jRuDve5w6tHjgyh6TVkJQ+0OerSvpbs046CnmerNblfBqHVDWwMe4PvV?=
 =?us-ascii?Q?b8zX99m8qC00z4c7NXiRVTeGnxBWp8wzfCG57S4nJi1j8IBlN/B0WW6NRKiw?=
 =?us-ascii?Q?MV5GggZqHrHpR8GXDPjPGJsPEQdtVNHY2wmHYQ9NxxnVIbcn4M4PoQV/gi9A?=
 =?us-ascii?Q?TFd7HF3tMK98Bg127jwTOn1LHBUQv73fDzHfRfhYBOtL+yX8BacNkoEQTDHW?=
 =?us-ascii?Q?3CVpYTIecRJjegHIHCcEPcaY5b3VOV8NJCOFpACxY7FmyXbODEJ2gRkyJ0DJ?=
 =?us-ascii?Q?Zb2uSB1+wjcYzMNhYfkLwMKd3HEPXqcN8EjHayyIGlUwLdnhtH1eo9PVG1qm?=
 =?us-ascii?Q?Yq7X82LeroMnrSgafZB0TqeFEG2AE1vplirsKPMVKz8cYT5KBmYxsHhsGfr2?=
 =?us-ascii?Q?ABU2cTtZ0sbG/B17sFJwAPybeZ4t4HkcpCliU+YCt5C3E5qou0J9H+2hQ4ND?=
 =?us-ascii?Q?3AKcMsXbTNaAEkwwz/Vrl3H9D0hGG7rtwYyFPb67/DyvzwQQzCVqjpJh0eli?=
 =?us-ascii?Q?AMZP/EEtJ8Lq1m+dAdx+NhgItmhYrBY71e+CgopzDTZNzr15fXL87SEasRLe?=
 =?us-ascii?Q?usHoRRotLfl9bRel7OCRSb3JtBOrK4qx++XB4B1CygsgBLVm6xJOtfDVeMu+?=
 =?us-ascii?Q?xqe/oFpingNwR0o/w2HvM7BAFbQ9qjwezaXHCCvvY6CTfwfzOloYFKU40cTH?=
 =?us-ascii?Q?ou6BiSSCz3ctqYR3kQciTrqf+qBZ8mVi5q0lnEDgdUtUly3xA7yhbyxKDfIj?=
 =?us-ascii?Q?Czi1kvPkz9+t1ZH+pkZ1JfOIiAULiK5yHV8PGMAC6nxvfIDjZf2RpGdi7dek?=
 =?us-ascii?Q?p0zvMpuLwcLM/2phzx63bLj2rX7d/C4/H8XTAqYqHQZDmrGH0Y0sBdIQP0bs?=
 =?us-ascii?Q?7E8DPnGiV14=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZE15xmKdLo9CrL+IcovGMoH6iYyAH7E4ie80bvCbCWUT/inW42fgVXY7Nbkh?=
 =?us-ascii?Q?szQdSyT7wd5KgO/k4K1GIn9uFkTooQEXgpPs7n9GAX3YcBDYd2ISxCkhODXX?=
 =?us-ascii?Q?3XClL3Fa6QqKkUlrXxi3rYkeZfcRFzq49M8QF4RzYyedBLvTa67U7DlIJBTW?=
 =?us-ascii?Q?aXBVbAr4lwBGLPLoLdTzlThbAKOsqENHrQUnULd8bGIpsGxSFBN0t3o7Oikc?=
 =?us-ascii?Q?UrSR9BFRWs5qoM+2IXmoI4HsmtNUgTq+rv3+NaK1+cZPo5qE9mpG/h5wKyEc?=
 =?us-ascii?Q?CNC3iR3FpHqAC5tPFoDTE24OZ+PAY/OAdauoLgaOflqmXlie5wEPVPS+DqKj?=
 =?us-ascii?Q?JizmeMrMXn8DEw9r4KzgxvURa8iS4WN0YjD1b5tw2VKWN23GRiQ0eT8JuG9V?=
 =?us-ascii?Q?wGAqx2wi72RCT/3WKp8ate1Xh8W2PhNXVudhxrb9vk3YUhxsGApKsQiR81pS?=
 =?us-ascii?Q?4jC4q/1KQPGsef7U411uobzhtSHRpvMYaBv2fcy0PFuOrQH51rdKqQU9l0Oa?=
 =?us-ascii?Q?r8xi7QlpW2XD2Z997/7BwKTTXpbWnA64wsGIyb9z7GFThtMmGKeCVuZ7iAOi?=
 =?us-ascii?Q?jPEu0GD9nsefMY8VkGMx+TE+utRInIL1epC8szjdqzLyZXIyl5xM7AV6lPMx?=
 =?us-ascii?Q?iUIt8TBvaF03yEOMFSyp8CtWfVVOnYpnKKXvbBsKGCQ1mk9lbMVSMDsW9t7G?=
 =?us-ascii?Q?sPpnOD6uwfl/Qpw1Ypebo4vgy67WhPA9QguhnDBg1Ke1nJL8jYWUDs6/bN5t?=
 =?us-ascii?Q?Vqmn/gc1CU54CQ9tlVDjn9bhTCORogNdXZiw9D44FKRUpI15AN1Jsi6T6khK?=
 =?us-ascii?Q?qCaI0AbJSFa8yWNy05MMWXn8qfKBheEUOm+r5dAuEzpNKZFIiopjy3zYnf9z?=
 =?us-ascii?Q?gZLEvP7BZfPtC2dpQ+10kxwIzeDQWYhLm20KO1k0RuhlJITOrab8mT4XOwMK?=
 =?us-ascii?Q?eBUgxjdWUdQg+8+h6kby9cmTSuotdtVofAOiVZEcYmTkqMKd57r69GE1Gwkc?=
 =?us-ascii?Q?kEF57tEa6zg0FNgSinlOICMLpK9CpS3nPIff58doWVCP5NDh4R3+Sw5N55jO?=
 =?us-ascii?Q?+5EI0jivlYNNV3OHN/Shvyt1QpsQFF36Ozt4rkW+lForLiqEpwiXZ1lgwnKo?=
 =?us-ascii?Q?jIAndsraxxpSOSWXBxiPipgXpwN3GsqE1+w6kVV9i0jKSyZ5umkaYiyDpYjP?=
 =?us-ascii?Q?mNGTVKN0cY82f2aQdS3/PCioEhmdaxxF9Zbxook7IIQ3eLNI674J6tm/dVC+?=
 =?us-ascii?Q?Wy2AXE9v47oBX2wvTeBQhb5TbbM7Vjhrf+5bZy3rXeEVJIW7u1MffKKH7epl?=
 =?us-ascii?Q?US9VqjDDRQahhvipXM5v3EDgkEnKS5syHyJLm8m/7cFET8dKRLp6zWcT8tv1?=
 =?us-ascii?Q?xRfFhq3fUs/p4WJ9mphRzCt+Em4ORotl8AVHKwqWlDSirJRd/WCjeoOUGshv?=
 =?us-ascii?Q?qLwg/xO6LaepdJF2XEZq873XCi6/BOPxkxT9w4ylrT5WFAO6p5cN1dl1hXJ0?=
 =?us-ascii?Q?OpqhRO03AvnbTWczYp9kvkAgMr3EfxMLnlq1gxaqQZGq8hsd4Ndsf+s/y2ZH?=
 =?us-ascii?Q?f34r/sO1yyZFUpAZIBk/JtEKanH6lgpwHPTWDN/b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc7970d-14c7-405c-8c94-08ddacd3ccc3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:46:23.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LZpLOqiZCtu8kWATUIOvMtOythguylFXQ/t3WB5Jmcpch9BzkazF4aU+PFS9BdO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9670
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_054626_803495_249A8E4D 
X-CRM114-Status: GOOD (  11.83  )
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

On Fri, Jun 13, 2025 at 11:35:20PM -0700, Nicolin Chen wrote:
> There is no use of this parent domain. Delete the dead code.
> 
> Note that the s2_parent in struct mock_viommu will be a deadcode too. Yet,
> keep it because it will be soon used by HW queue objects, i.e. no point in
> adding it back and forth in such a short window. Besides, keeping it could
> cover the majority of vIOMMU use cases where a driver-level structure will
> be larger in size than the core structure.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/selftest.c | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

