Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A075F4610C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NncIJNXFH7SrLnwhpNgmgFoYvuHOPOr6kctbNvRNoic=; b=RplwuNPgPcZ7eOxB+Kpcy/lEcK
	vsHE3yv9Zu4fzKhVdS1X5Zq7lDRN0ggLOSQUA7dU8DzuuILusn8g4zITvrrHtg2xAzUtlaZtQ267G
	zgkz/oxxpNgcSVBiwGy73Why7Pbmpv4a+RSoK6XRKEdEnNpaWuyq9RSlQIupgw9O8LRVpBLyBaKpE
	V3Oz0YmtbSiD6WZ1Z1APVRwkkUt4JkxzOZRZ5To/HvIBLgPUKPvHNeNCuldtJw9dWoRxoQzP5+Gzi
	bqPDkNmJukNEwcPuYZ6ellfOT8KnVeQqXktTcixaAciSMIr2O2NrcoWWyCaBsfA/kxRIH6yFUXr+n
	H2ncR6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4f5p-0000000GlL6-168b;
	Mon, 23 Mar 2026 13:13:17 +0000
Received: from mail-westus2azon11012001.outbound.protection.outlook.com ([52.101.48.1] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4f5m-0000000GlK1-31Xu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:13:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5CAejhmTMXI8AWUJMWjBXz2mx6Yb2GnqCaosOm85kQgfmoyS098RxGnLqL3cxYubPJEqUQOdvad5Z6heQ9BjGJdw0QB223BZCxv908sGjOPvAzynVpDRnNH5JZbUWaEb8lSjIfARWxOzJesALLZ02t9hHRK8RnpENZaPrLPM41x7dh+qrRJ688NmACM82lzrLr4iakZg98YMnkOfGIbFXzK/WFmdyfvmCdB/qPrNZ0ieQkD39I9rSHUC5R6EaQ6HTrZO35HjSLn58IJcvK95bGbX50W8locYXg0y6r3LACwRBQzT0UT+X372FE2vNOoNOkqJb/pnmL6JulCs/P5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NncIJNXFH7SrLnwhpNgmgFoYvuHOPOr6kctbNvRNoic=;
 b=nWGvE8Uf+Oxl7+opGe+JLMQxGJ5x5JROUEk73DPVKaymSDB2CbtXa9hmf/wQd3qxnRQVNMLUMg0JHzbh0XS9qjcPn5FFjX7zmsXqCkGN4/xgpKwhQdx4vpA1ja7cQKcB8ftFrvJ7rmDVJGc4pgMAEllMiTp9zdS56HkCn05z8mpfSC9+gr2Ce/iz7TMCRNYQ7ghnk6H6eHf5LZo+iCujY3c7ALdclNQfcBiCJSaq/vYgL6UaZ4vo+a5FS/dMjUF6Y1OoE3i3x6xILFZL57WkAfRpYgh1oAVbSMyA45ewQ7ileb9XOxCXhQh0kKhPCvRR+bYLh8eJf5oqJ/TpizxcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NncIJNXFH7SrLnwhpNgmgFoYvuHOPOr6kctbNvRNoic=;
 b=FReV6VrN2eKUMEL/k2Wxg5T8y27k3oZcULt/qJW3NZP62p3qIPc9jfZdyk1El7YyWg551Odru5NhC0XpLWwMhK4dAfIGDLecJ1jaSTJiqx8LuJNONrsGp+7Db5s0ZMEKO0CuLLQdmB7aLWF1dx3EiBDUw5acP4J/hZGlwmkh9rtT4I78u6qMznfVpMap/y+8L+2O8v6OGo1kPw0sp/XgCC8Th0/9UTnQeuNxfoQ+26+aOWfDApEQMPNsUAKIwW+3TDEagQHKmyqpVRYI4RLYVvZsIaFCXApUdQp/QRBeBQXzeM8WEQTEF/IeutENNMw5yDSs5dRxoTM/U5ZWBaipiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB5782.namprd12.prod.outlook.com (2603:10b6:510:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Mon, 23 Mar
 2026 13:12:59 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 13:12:59 +0000
Date: Mon, 23 Mar 2026 10:12:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
	kevin.tian@intel.com, joro@8bytes.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, eric.auger@redhat.com,
	skolothumtho@nvidia.com
Subject: Re: [PATCH 2/2] iommu/tegra241-cmdqv: Update uAPI to clarify HYP_OWN
 requirement
Message-ID: <20260323131258.GF7340@nvidia.com>
References: <cover.1773361875.git.nicolinc@nvidia.com>
 <9ef47d0db2d7b8207fef1ef4437de6efa08565b6.1773361875.git.nicolinc@nvidia.com>
 <abwMcZZHtEuaMEdZ@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abwMcZZHtEuaMEdZ@willie-the-truck>
X-ClientProxiedBy: BL1P223CA0031.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: ca78963c-fea6-4589-9f39-08de88dde7a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: J9hWVQifYYBVJymTj8kZHf6XJzSYNLzjKIDlV6b0KkW+z159jq5wHw3AAXdcH1QPz8Fvj4IIXWKHCgtz/tZFf2oMncE3tTsdGwfYtl4cxeKndOXsArL7KMDVUmY6FzvCdk6gBFz5/h2hYVV9DUeY1+67Jdzy1ZizBkHUdJSxRDndxXJNH8/8Iq8LP8O6x92baFzvixT85a0facDzzaI+pSyb0vdUodzHOHgQWYGZATl0FZ3JRZ6MvIMrjAkKdxJYxvk/ys7Szloxs6R3YdLVe46TUsEGjMz+7rTAegwv20G08CDDEovHwRagHPVjhRuqgs1WOrv+5K1L+0iEZxl/sEXvDTP+sjtQqsxEPVq7aMLYnvzSp0z+rSt1IAxUBwUgdiRpdx6cOpzBexvJ72P5u5B5+ugA6WyFOkXA2Q8d9wl6qWxaW6kx8yT9I1D+grbXhic4yk2bSw7/JclW6kYPmZGxwP7o5D3dIO570IzJC3kUaYZMf32TNHr+ChrcOSMyQbANjx1hK57B9E/46vjX50Qzpoz8l/nIKEaoCmUSBIiRBXWJro2Zyh6Tc/K9kQ3eZ6WILFS2/G7B40c3nDp5io+0ePs9G5H7vur3Sc7m4rlTOkUMrKZt5iJcbCvtRyr/+GAGopS/Jr73d2z3pZ8UHSaiNreHgSkchP8l/OlEdkfx8hblW9yqbSf03AtxGlB0M1OBeEf+knEsv0toMKf808CsRzluu0incWHRIkcyC7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qlFH92FcV0wQphqa5J1qBWMiXlOyTc7BFNBVComM64j7d3nnnus5lK3TBXf0?=
 =?us-ascii?Q?khMV9o+ELNIzjiMyWRvWi3pLWns32BA+bXgI52XqaUAeOOZSja88gcMJFGiT?=
 =?us-ascii?Q?qM2sNuEuFj184k/sFQPBAlbQJCBdltPJkRTtoBwqcWUhc/uH9j238rXtT6by?=
 =?us-ascii?Q?NltmeXqHv3qKscS9lDVC+F9SrhdPzJ5wvDoyt7ZiiOUTCPEyv1JDof7snqLM?=
 =?us-ascii?Q?w6TH5LFdbrfm3vQQHKnSReOYVgE7jxnsrW+YNdAnyT9qWrU1gwzboj3SdDcw?=
 =?us-ascii?Q?gPcQWyJyIV1AE9FSuCsWlEHTkeBVRXlKYKHhKRhzzdddw33O73mj3w519vj6?=
 =?us-ascii?Q?5Faui8q1OwKTQ9XDlQ7lvQ/u5RQOk3gppSgZcFzlqRhNYKBpWnI7J7zBsD9t?=
 =?us-ascii?Q?95Zj4KLfPsZI9goOoS9EALM4KJSToIGtMBrvZ1fIR1fqAnt5WGLLZU2PsuSf?=
 =?us-ascii?Q?QcGpfDV4qH6ENNDw96igfqmnppKOrV/4lTq32kU0iKG8rwH665lyWy31ThgI?=
 =?us-ascii?Q?lWOwu87hrW6AnvDqzCQqXDFABPXJUHC5dPRU5G7vuPAzfX5SY+o9TrtRPVpi?=
 =?us-ascii?Q?u0gDL7L48nHMYbDLS2MLpQaLcGJuCRujgiy20EkfC2ygxB9bw/l/th7q72x4?=
 =?us-ascii?Q?hutMGubHcNLVOMSCKNxcOaKGyBgEgUeQxC/XHQjGWzMT2yIpLJ7uMrJjxBB/?=
 =?us-ascii?Q?k+gHsuiZp0EILXVZwKdVTdYK0YE/W/N2c8yRDTj3KRQPsM6W0/YtIJ1sbTF8?=
 =?us-ascii?Q?4Ozfc2Xpaacwg++2rcyWvbNrKLTVG9AKVUnTMvqmZ5111Y0ZRNyUyXsPXRf4?=
 =?us-ascii?Q?UcxxU7eAksy1QZz/Q++60JJ7pxpufPsTQ3LuUP4ZBwfB0jC6cvki7bxGN/0k?=
 =?us-ascii?Q?CYcWTdz80UvfWPUFCzfYO1wWgZk47pFsv3hzTwr/DuUyQw7ctUdUG88wYy5u?=
 =?us-ascii?Q?K2oUTvUslSZzVQP9eJ3yaolXC+tbGZBpVnwuNFtEDn0sN1MFRiTaK/8q8eGv?=
 =?us-ascii?Q?FgtgRKv+DpKxZj1fF6khJCRvFmH5kG6o2U+zTqyW+5VpHgB6nOVNLJcppdD4?=
 =?us-ascii?Q?ODBHj2SuBQd3g78fpAyihs8voFZsdbHoYmJyZ+nFYS+lTBHQtj5Zw4K6o1dW?=
 =?us-ascii?Q?hO6P8gMgnfQdI5nTDmE32ck6q9hkHT9AbQmQbaIF+e5vyVf8qtWpu5cbpwrM?=
 =?us-ascii?Q?9p0U7RC4SNX49VIFQvS4lyiVpEbbX0iQeV8yYiFhhIkwsj51G6gdQCJxVbUC?=
 =?us-ascii?Q?sS3BITXpvYJhwd8bukqO0Z1K6x/A8HS6Q5SN+yotaiAHmNGBorZ+m6sdrI/z?=
 =?us-ascii?Q?k0/+ARTsnIsxWllTi2zsuG6CVa15RpKRMEMS7jnPyi3SuLoS7KbOtoD4g9Js?=
 =?us-ascii?Q?tKQLXHXW5v/VX0v35zJTgQXwF2CAptwRci/zMSJPOvTfVS47iSqb843Zpupg?=
 =?us-ascii?Q?UqbDcRfV1LS5f/ldhBpxnU42/BZhx7THWg8AYdi9rZR1l8NbOJHGa+rikdcz?=
 =?us-ascii?Q?rURM4lzND2CnntWXLpGy7zxdAFOpUlL2DwhNdmdF5zwGiSnewHTPHiTxJtGM?=
 =?us-ascii?Q?/8xgSYbOz8VG/qOBD7SJecQzL+bZ2D7C8Eus2AZgbJiIxymay2hPN7jKnEIW?=
 =?us-ascii?Q?uABXGeJJWQ3zWTMHxM4Eiyl2cfjrffB4x5Cw1jJdr1d3fRrO9aNKY5J/3wpQ?=
 =?us-ascii?Q?nsTnr3pRp63YIKDIA+JjiruXZxiSoy4Z3XIB8KMN9M2rP2G9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca78963c-fea6-4589-9f39-08de88dde7a8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 13:12:59.1924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFTKCFJnhYuUO1jrEPuWfuyLVo9BfWlsV+zvEzVaFQZBof5++vh3k7X3/DlPCETc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_061314_779992_849C4BA5 
X-CRM114-Status: GOOD (  19.31  )
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

On Thu, Mar 19, 2026 at 02:47:13PM +0000, Will Deacon wrote:
> On Thu, Mar 12, 2026 at 05:36:35PM -0700, Nicolin Chen wrote:
> > From hardware implementation perspective, a guest tegra241-cmdqv hardware
> > is different than the host hardware:
> >  - Host HW is backed by a VINTF (HYP_OWN=1)
> >  - Guest HW is backed by a VINTF (HYP_OWN=0)
> > 
> > The kernel driver has an implementation requirement of the HYP_OWN bit in
> > the VM. So, VMM must follow that to allow the same copy of Linux to work.
> > 
> > Add this requirement to the uAPI, which is currently missing.
> > 
> > Fixes: 4dc0d12474f9 ("iommu/tegra241-cmdqv: Add user-space use support")
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > ---
> >  include/uapi/linux/iommufd.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> > index 1dafbc552d37d..f63edbe71d542 100644
> > --- a/include/uapi/linux/iommufd.h
> > +++ b/include/uapi/linux/iommufd.h
> > @@ -1052,6 +1052,11 @@ struct iommu_fault_alloc {
> >  enum iommu_viommu_type {
> >  	IOMMU_VIOMMU_TYPE_DEFAULT = 0,
> >  	IOMMU_VIOMMU_TYPE_ARM_SMMUV3 = 1,
> > +	/*
> > +	 * TEGRA241_CMDQV requirements (otherwise, VCMDQs will not work)
> > +	 * - Kernel will allocate a VINTF (HYP_OWN=0) to back this VIOMMU. So,
> > +	 *   VMM must wire the HYP_OWN bit to 0 in guest VINTF_CONFIG register
> > +	 */
> >  	IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
> >  };
> 
> Jason, are you happy with this one?

Yes, please pick up the series

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

