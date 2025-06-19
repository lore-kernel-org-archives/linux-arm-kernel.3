Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E819AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6VVSCnzoXcSCZIY+NOqmj96j4hbJPY4xHkw1zYxUIc=; b=P9TcjwQrMnqoEpqFqXzJYa7OHn
	EANmmps+P9z8RvwY0kRxAvffCrKpDupL0GP3A5Xn+8GmCgnnGgv+ujcHdTyLGLjQ9YXW5lBSCLL9+
	NCRifHcJbfNlDif7VqGnI9CLfKS2/UCKY0I18I10fIdyy6I7uJ1AHvJVLNWKfK8bumZRnfRRpfC+n
	Xag8iJS4kEqJ0rWteB6Chk0iq3w7itVUmee+HaV20/aQPjYkHyUjINukwb9QzO8apFEvxvkHlBWHU
	9zSN7UzSVaJbDvncKdzWo78BLUB33DQ0+8DnwnjZkPxZeuDbsdg9+G9KuyL3oTB1DqdxVm78hLZTY
	2u6XluUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKQQ-0000000E2n9-38Do;
	Thu, 19 Jun 2025 18:55:50 +0000
Received: from mail-co1nam11on20602.outbound.protection.outlook.com ([2a01:111:f403:2416::602] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKOD-0000000E2h5-0fn6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 18:53:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlYaVBDgkI34nD2bl8sK3nzJnD0ZL8Jj0aiTHwPrLLGtVZ1+mQBVV7q1b5FOnqyidqTU5DobAhXrYbs8DEwW/xupe7ex0U6H1SCzzbVMlIXqNInuDR7kGR43y2diiqFCRRtPUExqobI5B0MnjVm8Xl2RX+5pElNc8c3FlQpk5BDUUwjD++1ASHhl69auWQZR5j6cdp0iXGTdAI2B5aWyOBU3OyPduGklbLm6UUyUQqk93MRg/VKFBDbKCtlM/uMpOLTC+xx5QVKg3Y78vHqYlcNE+EnSnWMtDP26MaL8hG1fOeYp/ALoWJD3tUoY8Qa0z41yV043bVZAw/vtZsNw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6VVSCnzoXcSCZIY+NOqmj96j4hbJPY4xHkw1zYxUIc=;
 b=m0EmyNRGLZJw35Pd0eNRLODOxxDN68isnKx1tFUx9Y2My0+3nme7BxFC27/oBQJbrwSQIb9Eu8VO6QUHEDNFQUDCSximkLpMvMXjLC1XX9eTQrqcRvR5PO/ct1+LWwiqV2oBx2v5GSXKPqvNlKKyaukbnROQYqlYDk540U53M1XMm0DreHQ+0S72lGiTuTT8D6pCUZOtLajMt+V6KEAjweb24oF9KOllwmt+bif3v24R/Y1NKCh731aKcsm8xYBxqSC3FnIWxKpE0G3avTm1tN5au+BUVl/hZ+Oq7SZjxW3o3Uzb5OX+ArLBfNrXva4sMHh5X/H6jA6901SXUriO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6VVSCnzoXcSCZIY+NOqmj96j4hbJPY4xHkw1zYxUIc=;
 b=iUsmE9I5nHSBba1DAYsXHe2gStkInuNQmB89F9n7DCsu+94EyyilNL8cIZodhBMBWRB8gqz/03a/S8IKRoLbofltjZpni6FQGm4ihPkw58660Rn4su23s09B8ORvjFdpgnCTsh7nDhVmK+0AtGI5C336p6MsRBwPTHPQJVCsFX1u1JGN4cwj+e3HfPPUBRblddKJqZ1NjnjJyxGN2907rQet5+Nj83ptoTuiP7z+JyGt6eiP9i3NPAPzi41ccx1ID6htI7eWWgkmlzmY/8ju6e948ch1aek9WbS/4iEy7P6Rd4vc7HQ4qenGMO7QSEiyrxYsKNL5fxNaoVCmAxxHMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 18:53:27 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 18:53:27 +0000
Date: Thu, 19 Jun 2025 15:53:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <20250619185325.GB17127@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
 <aFP4zHIVT6epJeLb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFP4zHIVT6epJeLb@google.com>
X-ClientProxiedBy: MN2PR12CA0032.namprd12.prod.outlook.com
 (2603:10b6:208:a8::45) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN0PR12MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: f644c443-dce9-47a2-4766-08ddaf62933b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PcKeHql+hkyOV7lZ7oNIQ0/VoSQNbHrbPvF6pJ8M476kI95qPPFYnEsh2Wgy?=
 =?us-ascii?Q?rje0yVz6+6+XRhHwnMuN3L+njsNGsm4mdzwX1DGWh3AiCFWYSlbO9u17y0NU?=
 =?us-ascii?Q?f8vyskSt0WG6g93YK99nwQBdCztLW9DWU02ykCJe9dU7+4p3HQjwniHaAB7G?=
 =?us-ascii?Q?oH9ABjW58brfglICVPr6Vaqu7q/addqWfhNdM1a0/YqdUEG/XhfYGc0Ob8XG?=
 =?us-ascii?Q?XFEgXdloAxmx/vIihoRIM3jmytZCvVlqDnKluqdWXQqKouO+6L0o9BgYOJI2?=
 =?us-ascii?Q?tJMvg7+V8HC8BkbakGkKURFCsZxrujAiqzddJ9siu4fUleWJKmbx/F31VeTH?=
 =?us-ascii?Q?FFiyLl8/er+Q8t9Kr8H9ZN3B9A13ep0/N6iqtOwt3IfXQhJ2j1CkOTueDhbd?=
 =?us-ascii?Q?31gGE5qiLvb6Dn1kKfQxAbwTHusoq9UwmlqSdJK9Uyrpez+XkSH8StfwehZJ?=
 =?us-ascii?Q?+ZGKQh6xuheNHd3dvaBXplEcXqpF4z3FQpSom9//oxLYB+8+TqEubirwkM0O?=
 =?us-ascii?Q?GPFauCNees7ARDT93t4GvcwFPejyPlECk6DnjdVeiRy3PG8MceMU7CIABJf5?=
 =?us-ascii?Q?oqKuVzffGjzwPrDat6PSN48GDMn1+QQaHvanz1FAcXyV+Jh1NQeTtMpaniP1?=
 =?us-ascii?Q?n+ruZZWdiPiUjgrHZzP8dxR0XXvwmpZyltdHFpLgFEF+i0bGmNirJ7J+q6Uc?=
 =?us-ascii?Q?suKHVwH0XXZxX8Lu0GfS12xCagYVog5osDNmS8oyuYfHoeuKwqjt+Ms4Rnrl?=
 =?us-ascii?Q?qcsGrSWpTGcOjM6TeHAt58TYGzR81Kz+4v7NLp1Rpf+RpCyfl2/5+WGs3Hfc?=
 =?us-ascii?Q?3f6XSE7uUWLQQ8lm2mDrXC7wdujfROQ4baEaUlePCnAomrz/pJ+s0PLr3LXZ?=
 =?us-ascii?Q?4Zg6wHKoOTyHc3MNWoHen5mlImn5JD04SwP9GY0QTRtMjOgZRbNzIzr45t2f?=
 =?us-ascii?Q?k7NfdKCzK3El2EDfG1rCm/vjwsXskqeqVmifDJCUemjkfS6Dn89Zp5bc5yvj?=
 =?us-ascii?Q?UELHSoGLmLh7VbJe6nM1YjB1Wis3BYbLtki3zXd5z+OLVKkL2xoY+mDouHek?=
 =?us-ascii?Q?QN6IX5i/ajGAyO6b/acmaO5r4Chl1GWl/8Av//N2+MFzHViebJ6ZWXpyOUqz?=
 =?us-ascii?Q?Sb8grFykdCMd2fTgD9fwXSokLaGa8f1Rns+yvmAR1srVxP8AxCnZ/X1UhCGX?=
 =?us-ascii?Q?DcszgJNbe4BJmoLKJ88R2nviCiN8cTdHgkZeSMaLJwhguYtTuzRPrw3wy1oV?=
 =?us-ascii?Q?vX0y+rB3RiDgy0LLcafgIluHCEUcRS3uypZVGov2fxUze5OBTpx5IF6RyExb?=
 =?us-ascii?Q?0nT46KhKI5tRAlixfF1ch9o1kk9IEdWZpelbf9gdDjyBnRSi/w8IuDH1rxDj?=
 =?us-ascii?Q?b//lGA6RZu+ue7rq2V2NTW8JEkhVpNCNovMnNxqB455jEEYcjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UEOevReBZfLpSCh4SMX8emeF9IVIS8XvzSmWIPGqLP63s9r9lrfj+w9TxjOS?=
 =?us-ascii?Q?vHNjpCySeSUMUpvU72CxnLaJIgK9aWsWkgr+a4ZY7qSqTVMJOyfcGfXUKead?=
 =?us-ascii?Q?jdTChTBeH3oHYTSjsAJwAyehmp4wlIIB8J5Qyx01zpe7H5D8tiN/PG0F1b0b?=
 =?us-ascii?Q?eSb68RgTOrKd9/ADO6nOMcUjZh4BXyGpFsa2IIMWtV5rzYQjBOUjK6BJJvVL?=
 =?us-ascii?Q?46StGXePJ8GvKgaFxsSo427s+tZwqOGHsdlx2FYnNjl0HwQEwFKXxPaqBJd4?=
 =?us-ascii?Q?zzl26SaLHWlRrKTtiziNCuqVS4j2hsCZpc5fLz1emjtqnpwrKR7F/hjgOJo0?=
 =?us-ascii?Q?RinVqDVWaq0R09Z8P56gFiTvF1Ge6E0UMjQtnOwRAmNGBCE5HaKGogRQohD2?=
 =?us-ascii?Q?xwVflxCRGp+gFQs+XHDr37lPhSsHE1UUKxavJ3dh8a+N++3LJYCZACwejqk/?=
 =?us-ascii?Q?rm1C9IDsxpQ+ZnxwiJp66Aby+p3O8aDsRARdfEz8M/B7HDBBxXylakE4VOuV?=
 =?us-ascii?Q?1VUbPhl1zcgoxyXPMvL+csnJJiF8jsu5hzYIxRIKeHExK1IZjfEiPCh32x/h?=
 =?us-ascii?Q?SmFOmUr3MRObQcflKytfxEEq9tkIQo0bL1c+A+n2cKIEfnMBiK2qQYvfkgo5?=
 =?us-ascii?Q?djE9ngV6FSqvNPVe069pq5jOFH1fqHmxUvTypephHNb2bBaQoVSdwXdOCy/g?=
 =?us-ascii?Q?dbGOUMK9J2N3oRN+RKQDf5rG8Q95wiha+Wr1mNV+AuOQBvsft36Hk4L5BcSr?=
 =?us-ascii?Q?WeQM6eylwxrBXYllbql2SJXKuulCGlCZKDGlScMsB8Uj8hJlmv23vNx7WZgZ?=
 =?us-ascii?Q?NsEISYd+smL5pkSfxmpkbBXbQfcUVrMVCVkTyRiK35q6t664B2eppaLUYtfr?=
 =?us-ascii?Q?qoSHh/TVREWzjubNYmlsHufpsXs9yR0EqKUDjsIyrddAs7JzXhV0izrezRrJ?=
 =?us-ascii?Q?iM5iVrOmL5dczMY8Ax2m2sQEIkYwVsIz2ayShar/ZfHFJ26nNoLNdRfwP8vs?=
 =?us-ascii?Q?wcT4pjwuKvoRN3z/ijQNaAumSNH7GR9YzVxhXaoRt9wp9/7zHEA9NIX9KAoW?=
 =?us-ascii?Q?AD2iHwi72tt8yjDd1jB5DUWaG3VxmAcKtecQyDo4eCr/g6KeMI4F+leX3mss?=
 =?us-ascii?Q?5fhcHOduTDRJkJAqwsE9HFLVnnU0MbQXeQZqb0fsvzha10ZSkRpnTLlLGJdE?=
 =?us-ascii?Q?QHoPhGgb/pjXvehxVFEkWTfsFyg/kW6cxn60lX4oaRRWy+uZHhSF3EIZDDBa?=
 =?us-ascii?Q?bDD8gvMBzzaSq+POlJu1VdmL/saANGksLmxYLdTiN8bXNhYZNr6+PerKgLM/?=
 =?us-ascii?Q?1HG8wTccWhjBo1ZeXFgtxLKaC+hCTtGxAKXF0BWfbN6S315sY4vLO2CRNVRk?=
 =?us-ascii?Q?H2x0bSxytfqKNPhhjBUplf2BQc2ljEkl4Dh3RNcFidB7DGK06qgeTGz/wDvP?=
 =?us-ascii?Q?Kwhj8xtArnBSQNcTndwbxaH7eXl2aTHkJiJPOu1XH5cUnqSr+WlDfN8OE9TP?=
 =?us-ascii?Q?l/4vCcrhUFWHdDsxNG2X0atxtAjgFROhte6uCrIasVMJMrDYTashIyDQfWdr?=
 =?us-ascii?Q?vdGOA2vypo6ZNfPgj2yPAnN5L6ubBGq5IvGqigMU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f644c443-dce9-47a2-4766-08ddaf62933b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 18:53:27.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3EpBINhL50Zf/45X2odqituZ3ZIbaC5vaDsWp2F6KlMdzQErsWhLy2nPvz4ec83
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5762
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_115333_194019_84FA6F31 
X-CRM114-Status: GOOD (  11.45  )
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

On Thu, Jun 19, 2025 at 11:47:24AM +0000, Pranjal Shrivastava wrote:
> I'm not sure if I get this right.. if the user (while porting a VMM or
> something) mistakenly passes *type == IOMMU_HW_INFO_TYPE_INTEL_VTD here,
> they'll get impl-specific info?

It should call the impl hw_info which should fail?

+static void *tegra241_cmdqv_hw_info(struct arm_smmu_device *smmu, u32 *length,
+				    u32 *type)
+{
+	if (*type != IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV)
+		return ERR_PTR(-EOPNOTSUPP);

If impl ops is null/etc then it fails:

+             if (!impl_ops || !impl_ops->hw_info)
+                     return ERR_PTR(-EOPNOTSUPP);

Where does IOMMU_HW_INFO_TYPE_INTEL_VTD return something?

> I agree in that case the impl-specific
> driver needs to check the type, but shouldn't we simply return from here
> itself if the type isn't arm-smmu-v3?

Then how do you return IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV?

Jason

