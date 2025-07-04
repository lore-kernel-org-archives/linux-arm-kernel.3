Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C01C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwEOrqp3BYf3VOJpbbm7ycTwpptuTFbzyrDvpwExiAk=; b=n8bhLju+G6fw9eZSbVqf3UAADT
	cXQOP5dyb2XmOeotwZop7iGFM74N8HNgSw+K9505vHzSCUykaSgnPAK/sYNW2HbkRJ5ywnuhullIe
	r/jFMi5DoIx6Xvwd1Bay9vrHNj3to1l8Pu8KwB61pWFB4EpnkGxDwKF75lfcwdBTzH2y3riDCdlEZ
	kaqnaDX1H1SKn1lu7qt0o44I6FqLCJpxmkBQ5zqiEjnnHyYmnNbDNSo3h10jTfi+hPtJ2+feoumKI
	HXRtPNLBA4CSSl8ULryElfykFsaS+ma0EANd5jFB2B+lPOrvqzV1JvLCzBmTDan5krynzlLpmFQPU
	vc11+M9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg2x-0000000ES6l-2e43;
	Fri, 04 Jul 2025 13:01:43 +0000
Received: from mail-dm6nam11on20617.outbound.protection.outlook.com ([2a01:111:f403:2415::617] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg0a-0000000ERat-3Ieb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 12:59:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vETrvRcjThwgRjrFZdKMqKZnFIpjTws3NBMEh9m47Nouj2gH91XhgN88SzuCo+8GfthKh9LM1hiN4HsqSEhWnGTUA6dtdIauGzU8OBiX6o9DSJYNMV9OXxjhr07KlVl+fbyhcMNURhmlzDL2XvWZ0tIU0o9mtFYcKV0Xrv+mL5HMhH07EQkenV+lOhaNqjeeZtFofTyA+wy0klu2CrljWBIpzsKeT/YA5A5bssWrMf/tIRRVUbpA69CjOnfWc15QgrnQYvjWVPauUpqh0ob/mo06fWs4KqInSw338VSYFLNf67DSRGN1/sju6TVXSXwjBap/ZB2a+DLdqK+fI+GuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwEOrqp3BYf3VOJpbbm7ycTwpptuTFbzyrDvpwExiAk=;
 b=u7vP5nACc9i+41ln1q/jW/eOn8HD7f57aSit/AVg+EFRXuEToT0/B0jbQIEduQMktgbvcnOzDs3yewo9azitl71c3bmiQOdZIc6rErO2OB1ecovJ8E8540zTihMJCJE0pVTyDi/0ooFE/ApiII4HHKxOIxWWkukSRluXw4WBvrYYHADeLpX75IOgaiz1TppKmysbHehHre7dSJY2w9dQtYnxLiIriaUim5jvdnA7IhFHrudu4L6tv8YLlIBc6fbKe48/uRHNvKrI8X177iuJMoS2lsiOLLwLp/99EpEFeHNL4OpZstG0oJRUfgtmzCiH07bVb4XW87YyUsObEpLA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwEOrqp3BYf3VOJpbbm7ycTwpptuTFbzyrDvpwExiAk=;
 b=JhNmTvlspo8fOmUYkbjZqJqhJV5jy21Li20vd1eDjebOkOQlcAzYsafKwlMAswdZP1GwUYhevXYgyclxUTKIKd7xDoE+eeIZgCi2vPAB0UoLUfXlo++hUeM4mzefBO2iu+SdQpFxnVvFHxyuWRsQ4Lb07EhIQ4KIXUnRIwrxg2EjAbwY72hMJYjeqownIrkYWLtFeHw53ZIrJEK6oZuKVIc+6mb6v2QpF3vrUy7+WPLkrSlRLYB5ejqU3lVU6g1b3f9+Sg0olK+YfogxgHD/jN81q38Bp2rTc5lW/MjDIYVcJcL5F6A8kcVQ7aibJHpR9UI2nNNHZY9nsDO72kA2Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB8077.namprd12.prod.outlook.com (2603:10b6:208:3f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 12:59:11 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8880.030; Fri, 4 Jul 2025
 12:59:11 +0000
Date: Fri, 4 Jul 2025 09:59:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 01/28] iommufd: Report unmapped bytes in the error
 path of iopt_unmap_iova_range
Message-ID: <20250704125907.GM1209783@nvidia.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <102e38967b38c28abbe8ebe70b39dcc8e14450ba.1750966133.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <102e38967b38c28abbe8ebe70b39dcc8e14450ba.1750966133.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BY5PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::20) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 40950a4e-6b28-4b3d-48e3-08ddbafa9178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dGR8mA1fbMUwcHetV6vaUK6wVEXOOD2FxE/zgWVRjQMviO2ElMH2/dpqJiaq?=
 =?us-ascii?Q?QKhZix82y41/ncxBmHGqDP8JbxSC3JaGrQYz08VGiCASc4Yim0c6iSjDgS6a?=
 =?us-ascii?Q?XZlLyh/Iep7aieyP9k/Bo2fTr1Qmnh5310Fy52LCircu1LpOHEadzZVvqT3k?=
 =?us-ascii?Q?D0fF28pFXJeKM33mhe/OIFP8yGlbrSxOP0gXR13ahChfwzMWapT3RtJt7YQy?=
 =?us-ascii?Q?YecWHNffLC0gaEZrE3Cob14QlOgNnnkQoTDVlcBhxYaCMTnjKTdygyJpdbM7?=
 =?us-ascii?Q?fqNwiwxcwNV5PUdNxdCT8DpLtNnbkhDkXR//4ZcGvviJC9/v4TAGD2tuGWBS?=
 =?us-ascii?Q?AVvh8VRZRoNag7Vbr/mlX0DMzliDROOJwJS0JDEYjFLnT17aNOUeQvzL0xiY?=
 =?us-ascii?Q?rKa0sTcByAbjGX3LDFlrXfp7XsFAh+mVpurJhtN3GqPCAdKwLCAPv1/J3Djz?=
 =?us-ascii?Q?Sh7uGctEGpgcDe8dYHhghU0/pXt5QC4WP1W0DaBw2jGVn+DZ2CbjDWOMtE84?=
 =?us-ascii?Q?yHgEHJ16s30eguW3HIfg/CWKyppiGtIsdxQpDazmF7ubmgY8KV2jwZOaAnjk?=
 =?us-ascii?Q?63OVpcv3SxVjjSTDhz0ieM/BW8cow+jU550Fqslfn/rnVv7lNP4ZCA6bQPyr?=
 =?us-ascii?Q?ZSXsiH3ogyjaxR/8v9FVAr5yelPnMmrnu4948OdoKfd1+Cjfi1nmvP9KfYKA?=
 =?us-ascii?Q?Md+p4qtGuHpTWHOxMedtMGfOOywfyazs0Daxx92B43AzkwMVklSzg9yoyA8p?=
 =?us-ascii?Q?4e/eyjJlyz0u7eBy5XDkKKJ0Y1SBsOXOBUSnWqEQpWaQqXs55FwerkJrgFqU?=
 =?us-ascii?Q?XCoMLU8NpbHA6DWAXQnbb8vPGwNdvx97865ZKDThf/OPzYgid9cDDeWyah5v?=
 =?us-ascii?Q?Rls3Sx3qFcO0oNpL4v2wPYZSbPxKJHs6hJYO3/YzbDgX/HU5dxoXRhvlO+Fb?=
 =?us-ascii?Q?rHxL5E3hSVBdOyXrP8/xCNt5A3K0u6qe9SmDHFmeLLAdMWCvKwvL9JP1Gjfz?=
 =?us-ascii?Q?FMmZGvtdPajXmnuq8NChIV4VIDLRj4aKXmSMdTiXxeqli+Nl/1H8ZmmeLi2U?=
 =?us-ascii?Q?zpjh9x/3ngR3xLi7EAWftrzOuVYeJLpFzRets+oQJwPg6sTw1ik34hlu/3x0?=
 =?us-ascii?Q?U3bbSEdJBrZN/7lqZQR+nR3yVIaiNdZISiZCJ5Qd7XLQjDjUExV0lQrJ20jQ?=
 =?us-ascii?Q?S2kovRHXJDQV+Yzyh1IH835xjJ/U2JcfRL4NnT8o+uIewt+RwgVm4O4npe42?=
 =?us-ascii?Q?qsCgMXLSYCMXplmh51HDBt8jvvbBTygfJKbMDK86vovCym/Mu5mCCnyDfVq9?=
 =?us-ascii?Q?qLnWjuqHT1P+lMdAbLd3tHNVe0Jqgb8cR1qMKw/PcLa5MMaHYj6QNWY4Ty/b?=
 =?us-ascii?Q?CApryav+8M4RRUL5RQEHFPttGz5Mo2Yab68LrIEzJ1wi+G08xg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aI/5V0nJLr1OwyWLhcVql16KPU/0dQESB3MrTZyawir3ri90DrbneRkWhr4H?=
 =?us-ascii?Q?XqA7uHoaqXo3lAQIx2CQ4XMKXxpGI8srpuC3pX2i3RWQRvubKOFmgTTm+2pw?=
 =?us-ascii?Q?SLAozq49vL6cpb2tXTiDtCXvL2HRPOFZdUwMptSUDUuoa2ZeB4WjGvHa1YVv?=
 =?us-ascii?Q?B6rPDfkN5/1O2OE/uelE25tUi1nAThJ57D+DK36FgbTJ6FKOkdyuzy0SUkrK?=
 =?us-ascii?Q?4bw7qRMuUbMFS9eNlVnhBnZHOUF7QpnlEKzEswNQ9FEo14QhGYmeTrh0gcrP?=
 =?us-ascii?Q?gszv6RpfV1/MdlGVGntGEGW+9trq4qS+dsaFVv9D5d0CIzoaN364zV0lOZBw?=
 =?us-ascii?Q?L8N1UUkfccNva8BsWXGcJgs1wbr0houaIwYnWwkz5rH5H+iRUUi3yEEXvw5o?=
 =?us-ascii?Q?RaaCGdjz/VCK6E6h9WJAG0Y5FcZaMgVoaJEzFXurDEm1wHkUYFkkFUzxrIPq?=
 =?us-ascii?Q?Zy+xjhqZvgW7tVCaCn7aG5jdXv9t087XRGndtHQgsk0Zggpckq+kqQuZXArG?=
 =?us-ascii?Q?YpGCutqwla9lElWuA1YWiDBjsgogodhrNGB9EA6Mu0cVUcZy4fT1pikwUJB+?=
 =?us-ascii?Q?GwbWMWZ4TMxxYpbkzVtUgjiT884Xj7xms8p1QGrSNYzOfnIZKaitwaKZuBYX?=
 =?us-ascii?Q?Dob4Y+tc6Txc8NzkfWr+t0c8J01TJc/1I8d9L/9HSXW9V5jkhJyy5W+MQQTz?=
 =?us-ascii?Q?sNyOUWzQrJmyxDumLR48c/tCRS6+EnDJQ+D4UK7E11YwQZr90KbunpcMS3HY?=
 =?us-ascii?Q?bpMlSNcErcuSK3fg8Zhl3dVr8jlkrKCntXvV2IE1dyVGbaeGbjhrCuKPsbbF?=
 =?us-ascii?Q?5BXLCSBCwZnclsE3yO3qK8Pu6ib+OQh1gKrByxughjMtRtJ1JmQJZ+OfjRNe?=
 =?us-ascii?Q?KbJyIR1MuLmdv8U+zISdVNQ/nOWcHtM90hIZNjyF32mi5sflzGlx2kZd7Wlv?=
 =?us-ascii?Q?uz7ibeAf0yY5INUgQOZ8iwt7N8atzAX/1tXlTZh16GZq82RWx7rhrhdOpq7+?=
 =?us-ascii?Q?jslLtgY2nciQQjFwIsyxCJ0X+Ir2SUK33LumqNHZFkx+4bURmdRmQ2uD+zw1?=
 =?us-ascii?Q?f+1aGfPJg9r/sanotFGonO7xIl9UFKoonx1VU5YDwFFqTKw4VPoVG5TaTsVb?=
 =?us-ascii?Q?tECItZ25XeVqr8l2Q6J12aPcRQqaUyvvv295l5kQXgZv3Wa+giig++Prbn8h?=
 =?us-ascii?Q?4nTROovcFQr69VDbRycQSvk3qHNmLWiwwt0983abN7zq482IWTgOmCzI8O+g?=
 =?us-ascii?Q?GJd+h48i4zr0QzJ0XwwsOn7E/uFTEbRy0nLmez3ciE0g8ZTOjg8Lbswm04tx?=
 =?us-ascii?Q?g6ZF3Bg4YSORpld2ZVgUBES3mFmR3W/BEFVrSzdD82fpiCAPN4iqwtGaVgnC?=
 =?us-ascii?Q?jh9iQe0MzMo3R5IlZhgaHdP+/OZzvGkluf4b6HvzaReWGhSU1b7s5O6eVZrB?=
 =?us-ascii?Q?WbwyK2/UL4zPuOsMDiidZDPMbaEXRLuhWrFxi8me4wy38xE0uZX/UMh8jGoY?=
 =?us-ascii?Q?L0ILEbejWHmDxrlqVTdrCyTAmarQ1kGIbh5Y/hrM6yZtSlaVewOMZezJ8gjV?=
 =?us-ascii?Q?bmuxjSd2SuF1S9s9KicOEnVBEI26nafCLov8Gc8u?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40950a4e-6b28-4b3d-48e3-08ddbafa9178
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 12:59:10.9252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nqa++ihHoxc5lTO7ds6vu90ksQecvMJIBmFwdGY4jKlSG1y6L0824gQpQYalVrc1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_055916_819113_014C87CF 
X-CRM114-Status: GOOD (  11.18  )
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

On Thu, Jun 26, 2025 at 12:34:32PM -0700, Nicolin Chen wrote:
> There are callers that read the unmapped bytes even when rc != 0. Thus, do
> not forget to report it in the error path too.
> 
> Fixes: 8d40205f6093 ("iommufd: Add kAPI toward external drivers for kernel access")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/io_pagetable.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

