Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357B6CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 01:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G41oa8EMUoOJxqF8QnrFadzm6Pi1/LibfNs+WvAvqSc=; b=cSb53flrBS1mqxbB40jWfEYSt7
	SzH365Tgts3NiXJdC8G6U9acxPup8fENvWyY6qNfEuhkDvSmdRaJQ49ZmudpeLsTk5oAJbkXEN6T6
	H50AHEhHwlOBSmLACYB5m6qTByCTrvb6EFqtRbm4+16C5JvYE2LQcirilFUc22JqnnCEbyxa88hBp
	SNa9mGlWiNhl66bvVwMuyj6Ey/l/S+aiEaRue5cVv7xXm8Ud8X76vUESf56GcrKYn1CplXhZo7pgt
	HwyzhT1rU1FfokI7Tj+ttoueOBZJmL0HvWcrkMkSj3xFe+TjEunDeTQkowkORyV2TQPU7dRxfwg3O
	k5u8F1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCoTm-0000000CrcK-2STE;
	Sat, 03 Oct 2026 01:23:58 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCoTj-0000000CrWN-3xbr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 01:23:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXq+rauvUvHQjJ7r0CYKpHpyjajOWYISkRKiS7goY16bekNH1nYWHQ6LDA04JZdxx4PfVi2jIBGlUn+9Kj+8O+S9Yc586B4PZEAlEMIIKCOnG136anHTVy8nQN2my5UCGZ5jyH8rKs/CIzATjgaHuTFzOq1zzPg3Ot2XedhHW0DdKB4pYve8agljkI1zaQ3GIqL35mPP9I9f09JhLIxk7cTwvRP5oKm0uywMIxtOKN3ClygFr9KHynU4+Kw5CGqJRg2PTPwDUF5ODFaahD5xdyfPz5CNaO60HOAIZnt35fq36/Qh9W8j3v8V3By7zhCz5rdN3sIVXgg0T1ACicMY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G41oa8EMUoOJxqF8QnrFadzm6Pi1/LibfNs+WvAvqSc=;
 b=K/vONyxR+L2NHfkdfc4Ro6qAB8AbniPBKyDGtkZY9jnrpoVN8CWxv1xEt2neJ9YI8GVmZE3FyFaciKzXdldOEmL29oUqfn3cbqiPQ5EAW7yTobF0Bq79yQ30vHP+hggPHv3gJJG0Wk6CcQZ9XFrIb/vfafHO/SgFh1lKbLtVmxc1z36DzLCN1sful2kAZqVLMIm0QtOUIIV9kv7lWVr3lNxDNShwTdY7Y4IaQkNlJcZ5s7SMgpIfu0ZfxGSAJJP+FQlMboBXNMgUpfWiDtZVhX6C9TBkNU9tpPUfHNkyWsGNCfMxe3PLEi8GJbqIf87xyBAKVd5lUPqLOrCae8czTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G41oa8EMUoOJxqF8QnrFadzm6Pi1/LibfNs+WvAvqSc=;
 b=DeeqH+r+3q1g7bgnXaCfP0YMgfEkzIcM4L6Sv4tRpMAJyBKeMkDG3NZ0VKPAibEo/VcllivQiL90Mii8FOPeCXzKul+e5cpwQJD4Ocgd6Q3mGWMNlkQ+KUDhRzXqKV5k7zj3JCimxRz8h5Q4dg/1Aj1vWAfQY3UIBBVtpH3gTarBcMPVTrZwPsbquoWXeVfCHltsvMVEOondJnAjqplskUiFtlYj/E7pzjwhtXqVCZrHY70pSxTuMPo4HzUnIvTlQJYOV24irOdbM75rC+QgvmnDUJh/7342Y5gGm9OHNihM4VDBghaV33n0+1PxMko207u2wKVKYWLt2UQsdjMToQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DM4PR12MB6615.namprd12.prod.outlook.com
 (2603:10b6:8:8d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Sat, 3 Oct
 2026 01:23:34 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 01:23:34 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <peaan@google.com>,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v8 1/9] iommu/arm-smmu-v3: Handle ARM erratum for CONT under invalidation with SVA
Date: Fri,  2 Oct 2026 22:23:20 -0300
Message-ID: <1-v8-1eaaed5e0433+3d3d2d-smmu_tlbi_jgg@nvidia.com>
In-Reply-To: <0-v8-1eaaed5e0433+3d3d2d-smmu_tlbi_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DM4PR12MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abd4a11-7b5f-4618-1ba3-08df20ecf11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: M6JKBU5fvDwCUPWBeFhsHJ/h/jiApRtBsWUTFu/yxhWflWbQWvOiHrU3Lfz+UD9EFmVC3AWiJMZfCZHb4iMsBEurmJDal/vNy0KS54iltxlc5u+nUp2K4Rs4rlTs3UaYp/RiCYEKjELEQM6v/NXuLGY6pNwlLIgVLqKiigIzoUfqxYXGig9SfTVcBhL1VrOc3XJM++ZHouxHoa06rHwjuGQpuaUA8Pw6AgI14wVVM47/7qS6KZWWQnyP4Ztng5M2anNSWrXMbG1eyKFs8sjn4D4LAYv8zy0Jw8LksmAdhRDQjfJoWbvjhzT8GzzWHSN8bfiWnZyFPgWX1DabPe+gf2dijFmweuuUcU9aA1HqR2zt60QCg462dPM2IUEYq44HOBE/mN2dHficpZOjxR7mrn7TaiR7kMqfI8iZwYovPObSwl1twcmiFGizmbT4zThBvfJj7WCs31NQ+a8X0CftcXVhyPqHNKGp4pfW9vca7x+DU8NNEfF1PYlTuqEZyXJMhi4mUsDpx0F0QLd44J4ux9tWxEhRiWczt/qApyfc/AZwtrwUoTGhi3ZERHCGH7NAOah6pATYsTTeqcGT/qKkS50IKCeO37U0w7E8tLZj0UtTJ+7dvSxp8gy7dOoGo9DJREPJmtAG5cVBAWx7kWNtpvQUP+oHEpW+Zzu/5WQ6vzr3OWTtxQUJ+QGPUHZamav+thX4ZtzNblL9pc9gIPN5jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tc81HIjf5iwU4N1exJcfCKjHrXO1lUANLNzhMFPJiSXL7nH1bocilMYlwL5/?=
 =?us-ascii?Q?NkbavdppvzSJ4N4W/pnY/VtDb2JqKoepBDr64cMwJElNp/E1hJL+lkw+ucDI?=
 =?us-ascii?Q?doF4tfngo4jcPAam1GVYzs8vAIrhnY36BycjGLHGhAlDEuGDQXO9qhH2UnYM?=
 =?us-ascii?Q?gmroL5LUlRXvXBkokqEhbIqdPs6fAmk4iIQlEfkQKHOEQiWeWG5OhSL7UGjB?=
 =?us-ascii?Q?blXFUwFaeW0e5MRLucxfdLWNRzp+f+53IzNITtSxN8Y7G/FqkFNqkfSGcn6K?=
 =?us-ascii?Q?Vg48URjD0ss7Wu0LU4SQD7uCG+JbElsXEuN3KZq81Jjh2l+LDYpJ+bhc0QKv?=
 =?us-ascii?Q?yq8vF8T3JKXsNuefdlhvNuUGsreH417u1VADtRLShmgmhwzNqWPxBPG8CWAR?=
 =?us-ascii?Q?622ObdeX8Cigif49NZln6X7Zn7weKydeBd4VESnSWECO8EZ9lhq2AXFBmozW?=
 =?us-ascii?Q?hI7E6MiNtoCcRaXDEZxVp6mhV+AlKYvxYbfnSBsXyoyma23HVkbnwT9+LFaT?=
 =?us-ascii?Q?+g0tkIQjN0UkOkn2fboR0AeEDdVcgBlfmLSJZZjrEiOyyHo5kYvu4dDKYyx7?=
 =?us-ascii?Q?iboalAaAEohQdcDtxXDWzgA7SRUh4B5+jELCSnZmjCDceLVW4WLCR6YQM8Tj?=
 =?us-ascii?Q?scx+R2W9bQbDtxhTVy92W4BGYWi+6FctTLZ68JyBQN27ovdim4iiBw575fPf?=
 =?us-ascii?Q?heIqQjclHHNpcMfHokHDXNtxdnzbgCb/m0EEcrnOrfrN4IUXaeZWPDSR+DKl?=
 =?us-ascii?Q?aoalbNn2Y4YHbhAG3GKA1B36jn5WlIH/SIfCJQ+veITdTGM366/h3XKhZ6kC?=
 =?us-ascii?Q?LC9W/pQoslOMaeYGkkwT01aZcAwWa0p6Kki/536OY+SEoSx+LizRzNq//Oys?=
 =?us-ascii?Q?vWtrcIe+WbHG3rI99lwVTdwnMHj/zMjiMMlC/ftUBioY68QI5jCxON4YmhT3?=
 =?us-ascii?Q?1EStimxV/A3/+nII8Fq/cnx5z90YnmdKk5bLze2ASHxp25T1F1o4JdMcJjZj?=
 =?us-ascii?Q?/Z+ueGoc3RZ1L+6t4L3Z+YLYs7aCivjEki+7lpooVpZlA6mY9JVZH7v2duJd?=
 =?us-ascii?Q?jF45CAPVF+c/sV/N3WaDmLGbC+Rl0FUfIEWgFTAYa15Pg1HehR3rl8y4YHLw?=
 =?us-ascii?Q?yt6UCiO/UuuvMT3gWLX2weh4hKfS3J9xG4T9bt0NZHvvMNxQOZk2dqHQzRd+?=
 =?us-ascii?Q?jkW7Y6R+ngLFknq1HYAtMc4qK6NCcPdrbT8Qgo3AKLDM6+L1q+227u8T/EIg?=
 =?us-ascii?Q?B0YarF+LysAZeXOtT8XaU6ZU8Sc1d/Lg1YIwAGz82Fci5g/iDYc2zwX88+5G?=
 =?us-ascii?Q?MFqCDTnaQb6uzFG83VKDGHtzoNTC/PQPZYz1k3wvqxF7L5Rbl22a/iqyU8mk?=
 =?us-ascii?Q?5n1r5Wgx0iiHJx2mkcWZvZ6NmNA2mcjEk9JuTrI+ceJMlucX0uTeLZ/gtNqP?=
 =?us-ascii?Q?Rd6BxIIfIOwoV+8iH4MeRyI+46/zWzX+Zke60NRVazKUvFjMoIW7DRuvRIV+?=
 =?us-ascii?Q?+lNwlo/SXzOoE4AVIaXHwTAQyFD9kKDASNbLVxzftawQzTgy10OmjgwT05kT?=
 =?us-ascii?Q?9JBLPLnugR9YXKOKc4SoK7PMR3lndMsgWWOnMmPgeZeemW/UNz1XoM9PhfZh?=
 =?us-ascii?Q?aHhRifAmuYmIwMsA7eBeslZKIzsOB/o+f94cfBbxYEl9Rd8nyDMnQ+QSHSI2?=
 =?us-ascii?Q?WNJay1X99IPjzC6mnIk73hAFjinNJD7soSrcnKsVJ63GDspK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abd4a11-7b5f-4618-1ba3-08df20ecf11d
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 01:23:34.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAxq5WuGGZUTAl052lTo+4bK1yd/PKxC0x9TU0Z4S1qE6jeCFNrxjxcaFNzyJETR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_182356_002097_7118EBB2 
X-CRM114-Status: GOOD (  22.46  )
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

The erratum (MMU-700: #3777127, S3: #3673557) deals with under
invalidation of a CONT PTE grouping in the SMMU. The recommended work
around is to use a range invalidation that spans the entire CONT. The only
user of CONT in the kernel right now is through SVA sharing a CPU page
table that contains a CONT created by the mm.

Previously it was thought that this errata was dealt with because the
driver always uses range invalidation. However, there is a subtle detail
in the errata that the invalidation range must fully enclose the entire
CONT for it to work.

It seems that two sequential range invalidations, with a split point
falling inside a CONT grouping, will not prevent the errata.

The SMMU's range invalidation generation algorithm does not produce a
single invalidation for a single SVA invalidation request, nor does the mm
carefully align the SVA invalidation ranges to accommodate the splitting
of the invalidation into several ranges.

Thus, when processing a SVA invalidation, the range invalidation splitting
routine can generate a range invalidation that is split in the middle of
the CONT and risk under invalidation from this errata. This condition
could be triggered by a malicious userspace manipulating the TLB gathers
via mmap/mprotect/munmap.

Update the errata list to the include the S3 variation, detect the IOMMUs
that have it, and then have SVA invalidations use a simplified version of
the over invalidation algorithm from the tlbi rework series. This ensures
that a single range invalidation is issued for a single MMU notifier
callback and now the range invalidation is guarenteed to cover any posible
CONT.

Future work to add CONT to iommu_domain page tables should either use this
one-invalidate/one-range invalidation algorithm or disable CONT support in
the iommu_domain.

Cc: stable@vger.kernel.org
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Fixes: 3f1ce8e85ee0 ("iommu/arm-smmu-v3: Share process page tables")
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Pranjal Shrivastava <peaan@google.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 Documentation/arch/arm64/silicon-errata.rst   |  3 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  7 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 91 +++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  5 +
 4 files changed, 88 insertions(+), 18 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index ac3248b9f2f3bb..68018bf75b7910 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -271,7 +271,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU L1          | #3878312        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | MMU S3          | #3995052        | N/A                         |
+| ARM            | MMU S3          | #3995052,       | N/A                         |
+|                |                 | #3673557        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 0a429c64fbf3e7..3f50298a1c14ca 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -215,6 +215,13 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
 	if (system_supports_haft())
 		feat_mask |= ARM_SMMU_FEAT_HAFT;
 
+	/*
+	 * The workaround for ARM_SMMU_OPT_FULL_CONT_RANGE_INV requires range
+	 * invalidation support.
+	 */
+	if (smmu->options & ARM_SMMU_OPT_FULL_CONT_RANGE_INV)
+		feat_mask |= ARM_SMMU_FEAT_RANGE_INV;
+
 	if ((smmu->features & feat_mask) != feat_mask)
 		return false;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 658d2cdfa28636..502745984a5364 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2560,6 +2560,37 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
 	}
 }
 
+/*
+ * Generate a range invalidation for ARM_SMMU_OPT_FULL_CONT_RANGE_INV by
+ * ensuring the entire SVA requested range is covered with a single range
+ * invalidation command. The scale is adjusted so that the range invalidation
+ * may extend past the end of the requested range. This ensures that any CONT
+ * the MM is invalidating is covered by a single range invalidation. TTL and
+ * LEAF are always 0 because this is only used by SVA.
+ */
+static bool arm_smmu_cmdq_batch_add_range_inv(struct arm_smmu_device *smmu,
+					      struct arm_smmu_cmdq_batch *cmds,
+					      struct arm_smmu_cmd *cmd,
+					      unsigned long iova, size_t size,
+					      u8 tgsz_lg2)
+{
+	u64 cur_tg = iova >> tgsz_lg2;
+	u64 num_tg = ((iova + size - 1) >> tgsz_lg2) - cur_tg + 1;
+	unsigned int scale = fls64((num_tg - 1) / 32);
+
+	if (scale > 31)
+		return false;
+
+	cmd->data[0] |=
+		FIELD_PREP(CMDQ_TLBI_0_NUM,
+			   DIV_ROUND_UP_ULL(num_tg, 1ULL << scale) - 1) |
+		FIELD_PREP(CMDQ_TLBI_0_SCALE, scale);
+	cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_TG, (tgsz_lg2 - 10) / 2) |
+		       (cur_tg << tgsz_lg2);
+	arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, cmd);
+	return true;
+}
+
 static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
 				      size_t granule)
 {
@@ -2587,21 +2618,30 @@ static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
 static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
 				       struct arm_smmu_cmdq_batch *cmds,
 				       struct arm_smmu_cmd *cmd,
-				       bool leaf,
+				       bool single_range_inv, bool leaf,
 				       unsigned long iova, size_t size,
 				       unsigned int granule)
 {
-	if (arm_smmu_inv_size_too_big(inv->smmu, size, granule)) {
-		struct arm_smmu_cmd nsize_cmd = *cmd;
+	struct arm_smmu_cmd nsize_cmd;
 
-		u64p_replace_bits(&nsize_cmd.data[0], inv->nsize_opcode,
-				  CMDQ_0_OP);
-		arm_smmu_cmdq_batch_add_cmd_p(inv->smmu, cmds, &nsize_cmd);
+	if (arm_smmu_inv_size_too_big(inv->smmu, size, granule))
+		goto full_inv;
+
+	if (single_range_inv && size > granule) {
+		if (!arm_smmu_cmdq_batch_add_range_inv(inv->smmu, cmds, cmd,
+						       iova, size, inv->pgsize))
+			goto full_inv;
 		return;
 	}
 
-	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, leaf,
-				      iova, size, granule, inv->pgsize);
+	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, leaf, iova, size,
+				      granule, inv->pgsize);
+	return;
+
+full_inv:
+	nsize_cmd = *cmd;
+	u64p_replace_bits(&nsize_cmd.data[0], inv->nsize_opcode, CMDQ_0_OP);
+	arm_smmu_cmdq_batch_add_cmd_p(inv->smmu, cmds, &nsize_cmd);
 }
 
 static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
@@ -2622,7 +2662,8 @@ static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
 
 static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
 					unsigned long iova, size_t size,
-					unsigned int granule, bool leaf)
+					unsigned int granule,
+					bool single_range_inv, bool leaf)
 {
 	struct arm_smmu_cmdq_batch cmds = {};
 	struct arm_smmu_inv *cur;
@@ -2652,14 +2693,16 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
 		case INV_TYPE_S1_ASID:
 			cmd = arm_smmu_make_cmd_tlbi(cur->size_opcode,
 						     cur->id, 0);
-			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, leaf,
-						   iova, size, granule);
+			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd,
+						   single_range_inv, leaf, iova,
+						   size, granule);
 			break;
 		case INV_TYPE_S2_VMID:
 			cmd = arm_smmu_make_cmd_tlbi(cur->size_opcode,
 						     0, cur->id);
-			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, leaf,
-						   iova, size, granule);
+			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd,
+						   single_range_inv, leaf, iova,
+						   size, granule);
 			break;
 		case INV_TYPE_S2_VMID_S1_CLEAR:
 			/* CMDQ_OP_TLBI_S12_VMALL already flushed S1 entries */
@@ -2706,6 +2749,9 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
 			       unsigned int granule, bool leaf)
 {
 	struct arm_smmu_invs *invs;
+	bool single_range_inv =
+		smmu_domain->stage == ARM_SMMU_DOMAIN_SVA &&
+		(smmu_domain->smmu->options & ARM_SMMU_OPT_FULL_CONT_RANGE_INV);
 
 	/*
 	 * An invalidation request must follow some IOPTE change and then load
@@ -2745,10 +2791,12 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
 		unsigned long flags;
 
 		read_lock_irqsave(&invs->rwlock, flags);
-		__arm_smmu_domain_inv_range(invs, iova, size, granule, leaf);
+		__arm_smmu_domain_inv_range(invs, iova, size, granule,
+					    single_range_inv, leaf);
 		read_unlock_irqrestore(&invs->rwlock, flags);
 	} else {
-		__arm_smmu_domain_inv_range(invs, iova, size, granule, leaf);
+		__arm_smmu_domain_inv_range(invs, iova, size, granule,
+					    single_range_inv, leaf);
 	}
 
 	rcu_read_unlock();
@@ -5081,12 +5129,21 @@ static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
 				/* Arm errata 2268618, 2812531 */
 				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
 			}
+			/* Arm errata 3777127 */
+			smmu->options |= ARM_SMMU_OPT_FULL_CONT_RANGE_INV;
 			break;
 		case IIDR_PRODUCTID_ARM_MMU_L1:
-		case IIDR_PRODUCTID_ARM_MMU_S3:
-			/* Arm errata 3878312/3995052 */
+			/* Arm errata 3878312 */
 			smmu->features &= ~ARM_SMMU_FEAT_BTM;
 			break;
+		case IIDR_PRODUCTID_ARM_MMU_S3:
+			/* Arm errata 3995052 */
+			smmu->features &= ~ARM_SMMU_FEAT_BTM;
+			/* Arm errata 3673557 */
+			if (variant < 1 || (variant == 1 && revision < 1))
+				smmu->options |=
+					ARM_SMMU_OPT_FULL_CONT_RANGE_INV;
+			break;
 		}
 		break;
 	}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index cbfb3e9f50958e..0a1bb75467dbda 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -940,6 +940,11 @@ struct arm_smmu_device {
 #define ARM_SMMU_OPT_CMDQ_FORCE_SYNC	(1 << 3)
 #define ARM_SMMU_OPT_TEGRA241_CMDQV	(1 << 4)
 #define ARM_SMMU_OPT_OVR_INSTCFG_DATA	(1 << 5)
+/*
+ * Range invalidation is mandatory and one range invalidation must fully span an
+ * invalidated CONT
+ */
+#define ARM_SMMU_OPT_FULL_CONT_RANGE_INV (1 << 6)
 	u32				options;
 
 	struct arm_smmu_cmdq		cmdq;
-- 
2.43.0


