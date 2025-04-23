Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7717C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Oas5oOEBrsnfuaihOItva4QCYq0d4RMbId11bpgoJs=; b=SbpXfzzyFcpP6PUp0Tt3I7ODFy
	GqDhL78UVdD7bMSOT9N3OsOYhtScK0aZMD8zKS4+tAJCnICRdiDXZW5z6YCa2BkOJP+klFFxgjXLZ
	EXSQhghXr1EiGA2yB3HU/n6rRcX+OxQUjbDEvorhsd+lMgaWYPmMU9b8gAyQteg0ivY3DRjeAR81W
	vbiuYxpZ/nf1u89iTtKjdcX/Tv60TMP7jnUJWmXiqc5UYB0+GkHpsALoUaSQRzqWPYX5RemWiYoAR
	frnkiApTCeIiWwktLAZuUy0Tahy/7V+PgSiDeaLl8fZs+bU/WGzIEk3YjlHOV/sbUCk/Bef5ETW5i
	nvTVWG6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aWt-0000000Ah08-1Rpv;
	Wed, 23 Apr 2025 13:52:47 +0000
Received: from mail-bn1nam02on20601.outbound.protection.outlook.com ([2a01:111:f403:2407::601] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zzj-0000000AaKd-1kjY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 13:18:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B79cYZYVCSQz7P1dMdr3fnkmOUGkL2qmE9iCcGiyWlMwiLcgFCQR8hcDBJ2XXzeEWpl2TWF42VtaA9SzNi7EEGjAC8164BL/HVA11BDXE9QMCHG2U4+wEQFA+P7i1yQA9wdA4UIWw6Ijs6sNvB6Wn9dA7uLypC0po8dO3a5HhgdWTPkY3YiYRMe/buy75nqkEmYBcgfaOflJn1BDxeV54rFwCqKMzOk7tK2ipTMUSs5b6URqQZqP4OZ7GNvox2WdAp2qBXeRcdbAc9shMfp7WrrfsGikx6Rn7kU6LpzhIVBSXWirFj6eL7aWJ7jHIikdatOg5Q7O+zJ6kDbs+8wLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Oas5oOEBrsnfuaihOItva4QCYq0d4RMbId11bpgoJs=;
 b=U7Icr7G0buz6MSRA1wa0HD2NPCy8ruonFtATmGJx1HAFJSrFHvgctN7pHu9XekXrLt0uHfT9YGF6tUzNt4s3HNCA1NNIlmj/SJrCD8SLBIgzl4XJA6Qo0aYLSLqJIN5qOeU+rOTcE2oxINB44gXoHLFap8+fP2HvVKl1NgT3rzHeCy4bPcqMTt2aAN9IR6YMqhSGStnZUuAWg+haVY/7llekQp5HL/zNpwo11kuo1n4tZlvclZ+hjO/UiN7mOFcfu3tCoP87eZyATdefpvhPKQCOOlXlX6ieY2QeBJyg3i2RdRSRQPhZtJvc+QP1JwAXqJeiwviapKOEVV0nLy9CPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Oas5oOEBrsnfuaihOItva4QCYq0d4RMbId11bpgoJs=;
 b=P6Rusnp644NsjSMXKggl3u6tHJ0ezpo1A2FVp2dhaAel1DZGzRJv979P2p0Tdrs/iB0vNACHeNtFZcHVtd0X0Q4huPdK9cxTIxnrq8VNlYbhnVFOAHlNXgfzfeXApG2Xf9UJZyRqIXsOkB/ShZZCikRg6jkmO2CmI8k7NPD+oLsanQGTjD7ZxmP5HuES4c2hgmUYBj78tr/eihNxXkh9HEWGdRiHeYoLMNXs4GHcfv3H4vh1a+o+rhHfk7+qnJdgXoDI6oSRcEsqzoX9K/VYjYkBY9QJ83b4WpD1jNn0CVAeA1t/2j/6pIdfAR5jFgkHDKbsyjftEp0s/Q9d0SV0mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.39; Wed, 23 Apr
 2025 13:18:27 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8632.030; Wed, 23 Apr 2025
 13:18:27 +0000
Date: Wed, 23 Apr 2025 10:18:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	praan@google.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, jsnitsel@redhat.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 04/16] iommufd: Add iommufd_struct_destroy to revert
 iommufd_viommu_alloc
Message-ID: <20250423131825.GI1648741@nvidia.com>
References: <cover.1744353300.git.nicolinc@nvidia.com>
 <c8fec9d1107c99e8c1db6c38ed520bf4a8a1b51d.1744353300.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8fec9d1107c99e8c1db6c38ed520bf4a8a1b51d.1744353300.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BLAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:32b::33) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS7PR12MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a72019-72fe-46e9-ef06-08dd8269552c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zJ6eOSfuEr7C5tQfdV8Bynf2Z68i45ay5nLDNiNab03+bgVaFKpuS22q3o6U?=
 =?us-ascii?Q?5LP6Z2dMGb1AjQgm4rSM9iVE2BBCN/Tilr/UsE/MmdqWJE7Q6hSN96wWOMfv?=
 =?us-ascii?Q?6a1VaPjnOLCnG+IzUYJ/jXAhOaPi8C+HoUn8ocQfZuYr6+IDbM0OMqxdJuxS?=
 =?us-ascii?Q?abwhniDnoEovMfUCwcbfoXSgQk/es2qobhoAoslw50LtYf1Yt1iduu0J7qC+?=
 =?us-ascii?Q?4GymUDU/PXXtt7ngxOMBDWU678uyoFgGmei1cQGXeNMygRzYBgmq/7EojhxM?=
 =?us-ascii?Q?OzblqjM2sdEA/vdOjILgenABeZX7ZknQQFlHKGM/zcb+zXrUM38mYJXitYVM?=
 =?us-ascii?Q?K+TK9jNfX7Nxg2TQKfxvXBUMeQzoavKKIF8A+nw0ZSJDKI+xdHAZIL2n+IPh?=
 =?us-ascii?Q?4v83t79Cpp527qgFmmdWNFG7jtwEhQZ+Jf2JqvoYay896QA0UQLkyLu9KBRi?=
 =?us-ascii?Q?aAp1uRFT5y3rtU7t8iKFncb34Dtsfup770kMlWcySB6nkyfg/CKf1zWH1vZS?=
 =?us-ascii?Q?9tTViZ/233gnQZ7HDzccjubtDQXuTs2HlFiWEZWGMs6YlGyRocsVr4KGRjBp?=
 =?us-ascii?Q?fFg38hyqpr/PpdVLcXD4NpH9jtc4eS2teboE2r0OMC+zOMK4hwnV9K8x8Kcx?=
 =?us-ascii?Q?2VP+lg97/Ukg/uS32ijCXbjc+jotRMCYsIznpdTlTDT5ivSh4h6nlk72Msbg?=
 =?us-ascii?Q?KVdWzrPJccwjURPxvecwDH3BjiRcalBO0ekUeANGJI56y+g8rKkT9fgAbdG2?=
 =?us-ascii?Q?b6UaI4232orJVI17ZFIO8SFiKfEwEvIkf5vRZo9a/GC8fOrvBXM1Z13JSPiq?=
 =?us-ascii?Q?Rt01UfB2VBtNjFupP92wW8N+fZ4rCIVbe2hmfUAxE/jBEgy00iioKEjCxhtg?=
 =?us-ascii?Q?cly+JBriXp6y8I2uSi85TgJPAqRhdAbNfMlklHtb76QrF0f5nfzdX3fdwpqr?=
 =?us-ascii?Q?iNxfpNkm6MbsRP23P43CRuJDIh/q4z2KJ3dGCX7fefotnYL6D4Klu3TGzX/R?=
 =?us-ascii?Q?ONRE3xtrp7hkrLh7BqQ4ANTZfOoZUWoVWcoVcPa/RfE/pi/7uPcROR2cRahQ?=
 =?us-ascii?Q?CR/7sUXY2dba2TcVK9Uo4rQxaU4QL+I1/hS43AMVCEGxN4L9K5sAy9uecP1T?=
 =?us-ascii?Q?0RItc7IKQk+CcjCqVBEXFLqQe6Axz1LYL+YKwEBUzIWZOM/cDZVXktdKfZKW?=
 =?us-ascii?Q?ec+SGyHMmsweizwG34Cbk8lmZGI7pEB3AQY6Ur6wFgOMwlmMGliLApgQhNsL?=
 =?us-ascii?Q?r/uPKpKBIrgL2mVMjur3OTcBWplk3qVqEw+LwcGtYUlmx+PIWmNUOPMrRVhl?=
 =?us-ascii?Q?srz6rAcSoXFIIR//GmjKlTaoM2p9QfzSfxMNeWTc5BVzVlsZDs+dCb0dAICg?=
 =?us-ascii?Q?lyzNBPu3p5ogw04zS4Ueht1dGnWlAIgcp195rM5jqydqimC6JmBXFLBhYl61?=
 =?us-ascii?Q?w7/WN9ozgQE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Ky1bUGpwosejCxM138331xWSTT9BOq0t2C9dFGP8SsYlqP7K8eVCEijCMok?=
 =?us-ascii?Q?4t4LZqh5vk8OAWLLeAHr3axxYBuwahG+FBjx8zFs5wpeU/Xa66NqWzTRN38b?=
 =?us-ascii?Q?VLhAXQybZlf2nXFCahJtt5Rmc4iXQUBV0pFdPVElGfYbbWA2PjG9UelfjJaX?=
 =?us-ascii?Q?lmiUxeRixNlCeNarSFCHQb3+YI4ewN/lPr5ZqrDeL4uKSz65hAqOgj80NNiB?=
 =?us-ascii?Q?2uofUjOf/SSJfx6p5HxT0g2bb57wE6SLD8rFCZ7h/N87lDFFhQjoN5cVKhGj?=
 =?us-ascii?Q?AZjwg13H5xY1PDaooQGbuvpXCsbYzkixymhxZf9kYwwXwTwgZhHmhDWhlsZZ?=
 =?us-ascii?Q?hOHGgwLI9SbWzFMQRBFWHOxtEjC+5eawts8XdvxYjbD9qCSPRA7oJ2+cmTBK?=
 =?us-ascii?Q?2vjeNzMEanQr4sFvtNt3MkAc0cp0l5xQETPvlEKmARRhSuoVlgQq67T10hQ9?=
 =?us-ascii?Q?VxYRPS1VlFBUOcw0a/LhPxWj0YcUAcB5V0f32EtbtmrHJ/l6HxUmDdQOzF1q?=
 =?us-ascii?Q?rECBT5IYJreH4lV7+Vm0XmU4rVcR9bM+nuwkFPVQO6xiK6fSuIeU5W2vNBHh?=
 =?us-ascii?Q?0tH8KSaJGvKSJT66tK2tgeTZ6SndlL5umLot4nVKU0mGpoUnB0aFlRddlZrY?=
 =?us-ascii?Q?i+bdBU8JpW3fKGIiC5jTmTEYIWWfRZyNNL/YabJWSDf/J5bS4iZQsIGVZT4B?=
 =?us-ascii?Q?ANohQxEH2Jh1YwzzGhHTTRoYffpV165yo5VLKZNEbKtSiT+Ik8mdwd8ONtMI?=
 =?us-ascii?Q?mtFrTK1z3uIN8gTuoEObUA3Q+sALD1r4hpYMD8mMQtEQD+Cuu/2lkpce6rxt?=
 =?us-ascii?Q?zpgINqMAHcF3kXUlzL3pjCgNtUdKjKI1koMvQ2wN6L1wfG336sdPqUr+VOH5?=
 =?us-ascii?Q?eneqf4ZYT9qZWoHguhB7An0Vmoqt4MZ3hBAxVFXx5I8pp3yoYLtI/IIJpUL3?=
 =?us-ascii?Q?9RHXJ0YmfxAOHdEwjDNXfE3crU6+Mf1NMN+g38jOJXQbH/pFBvY5eHe0DV4w?=
 =?us-ascii?Q?2ON/A+P0G1V8dN8MJwpSrDw+g1IoSQIwJlYyJhQlK1MaWtFVKx7UM5fh1f+f?=
 =?us-ascii?Q?ITrJ+q7Fv9g3nH4w/Mflq7r312b2ouva6cwoc7IXvJWJ762nNl859n3ebyTN?=
 =?us-ascii?Q?FQfDLYcEGoJ20xxp8lGzKc9kn8WgzpChxTIIBlhQnvDwwm1+ZNWMa3HPLVuU?=
 =?us-ascii?Q?xvlPBqURBZTv8F+8oRaqekuW43VK+zyIUbhbZ90DBbrmidtqiFZSeTcoiy31?=
 =?us-ascii?Q?G3QRApBuXnvkGO1Alk5cF++4+RIbRyIcRqvZIj/B4YVs5pnNiUCFV/si0pb+?=
 =?us-ascii?Q?Tun4BpWSQX7pXxaKyv/wrYd46VEo8RHxZwvI3kJwzx1ik8kvLEk6ZNyG20g5?=
 =?us-ascii?Q?CNPzSqDhH0aj9zaNHcByStuVwGRG15EalCgI8NXizYvkL/1T2hP1JJCxvtP5?=
 =?us-ascii?Q?YyJi7cRgRCim86icEDKfHwmTQcdIjAB98FDA/jKgkqmpWVE22FM4klyA+GGm?=
 =?us-ascii?Q?JAcgFP/ydn29unGIyIYdc8ZWCVtiTsqXLPuPwAsQi8ZIgyEvH3M5+TGDzTdH?=
 =?us-ascii?Q?56S6alpdUIw43zdhYXhRTA+CJkCC0JbrMylX2RpZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a72019-72fe-46e9-ef06-08dd8269552c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:18:27.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2MTcSqX/dBwRZ+irZA/uzxsiA6MSb6prHiIk93YGh4vOf7E/aa7C5opJrCS0HrT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_061831_458593_EDA80656 
X-CRM114-Status: GOOD (  12.46  )
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

On Thu, Apr 10, 2025 at 11:37:43PM -0700, Nicolin Chen wrote:
> An IOMMU driver that allocated a vIOMMU may want to revert the allocation,
> if it encounters an internal error after the allocation. So, there needs a
> destroy helper for drivers to use.
> 
> Move iommufd_object_abort() to the driver.c file and the public header, to
> introduce common iommufd_struct_destroy() helper that will abort all kinds
> of driver structures, not confined to iommufd_viommu but also the new ones
> being added by the following patches.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  1 -
>  include/linux/iommufd.h                 | 15 +++++++++++++++
>  drivers/iommu/iommufd/driver.c          | 14 ++++++++++++++
>  drivers/iommu/iommufd/main.c            | 13 -------------
>  4 files changed, 29 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

