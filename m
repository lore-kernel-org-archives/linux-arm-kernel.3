Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6652EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls8imfyIqmD923mL3/n6HrytShoMVJl46mNDwyM1gGQ=; b=sBaRl2kp/G0DXIxXyvBunVo7Oc
	JlvrTLlVCDq1ePK4s+Q5QgWJLlwN94VpUvdilwaQrUry6M0V5gtO+GCO4eJ7JFhvv+HOB4aMUkA0H
	pJtsthgckxCECFT3J7/eRuClhtAsrNg+U0iEn67m1CwmmIptaXxBtGAWzKS/MjCQm0ET4lmg8XqcM
	XXNhi1sOKS8bgJmoXCLK4tXDAEAK7g1pd+nlx2iX7nPrKs7GjCzZ60/4eXPa/CO3HdEr6wd3Vxby1
	NjK7L2gXdPuRG69XCkpb+xThRjIkDRR1N19rbyq43Hrm1Rdbfoege/3Xtwm8kIvfy5nHGMEYHmC89
	+5gODsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0wB-00000001EOa-0rui;
	Tue, 25 Feb 2025 19:49:51 +0000
Received: from mail-dm6nam11on20607.outbound.protection.outlook.com ([2a01:111:f403:2415::607] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0mZ-00000001Bzg-3CTU;
	Tue, 25 Feb 2025 19:39:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQ2xh3HObBCmcg340zwuK8OIubTZebiBaplDDIEmKE87yeJhjxY9bHloGj4O1btpI+70fS+JeHhkv8Bq9TqzwKNuXZJdmRztgFb78oOcqI6VThyUjkf8mjCKArY6u9Za/s0kDjJmc5a0wbQSvZT3rNduwJKAjZveXtYeaTK0GnDuF63msS8dLQE1nkTL05ajxiqv/uyqQ8BVtSTdTULVDcQTvVbOFeFG+meagKmrJ63vyUBLaAGbE/4INXiETSbsRDH98B1l1CUdBEK/ai/DxjAcVXdse5naVcosuZAb7HE/6SdY/hvG2LbyGra+xf+l75JRtaC2wYLvfJmbTFd3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ls8imfyIqmD923mL3/n6HrytShoMVJl46mNDwyM1gGQ=;
 b=UcTIUatf1o68pZxsuEoTdMftYJnm0KEYkz+DvIRFfvRFadeuWDb2o12fN5kHUI7zJv03b0Lv0DQvJcT2Y7yHaQufdQP/kXzbBb2h2csShvB9e4FBUu3sVH9ihha9g14zHugsAFwT/kn4qq4Bwbe0uXyJDFBW3VjZRKmYccCcbK3OFuJUTr5R3luvBqEIaEfpCYRtxwiTNhluB8yHccsqg7uO0+CI2nSlvCfmubUvoVSsm0KA5OkCsZmeAGzuZkLmtDiYtzMyUiTwDCQh7xvQvZn52NjhXkKLDOeRcEagWwn/+ornduZ6nvDb7u7O5kYVrVJg8Jvjt+IS43E58upeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ls8imfyIqmD923mL3/n6HrytShoMVJl46mNDwyM1gGQ=;
 b=mCuEVDsMhP1yZC9gAaavfmodNXoKW6jv0/+OglEf2cLs6bVXB68PRVxu6bNvqHKyTYWTyNkwEP7UeQviBeIPzN+tlf9V1LQm4Qvll5TgR44gfpHu/MDc3W8kZkaR5KFpspJcQCrnR7HgXgfgnKzLR0T8KYlB9K6CjguaTqyiUg4jaEj58X8Gn4GgbYpZiYQITtm8B7VgSSC0EFU2YPr8liE5WBm4tLh0vBmvGN2mdiRagYnB9ELNZbU4VPMgmWmR8XGwOvnfZTwi2vF5k1Zxf9XNS5Nj2MTsElDhIYzt/GU2u2gD5o9hjSfOJ0wY9Tjdka/tPoa7tsVTM4wjp5VOPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 19:39:49 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 19:39:49 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 11/23] iommu/amd: Convert to use struct iommu_pages_list
Date: Tue, 25 Feb 2025 15:39:28 -0400
Message-ID: <11-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: d115fdde-e4bb-46a9-5ed5-08dd55d427aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E1Bz0ZsTcHvRkJ+mSPGuQbSg3aV0MLvUsQk+2vNkyECGrtDeuauiCaF5BU+J?=
 =?us-ascii?Q?pD0tK9NuEMjO0Czz70yjjx1Vf4viLyGFWL6VRzgLo6nBQDSJoASvj20MXcPA?=
 =?us-ascii?Q?WPtrGeeY5Y4/8yAKHk21J3XLFbqDG/GdjOna5e+1xd3TUtnEWpk0W1Pc1UBr?=
 =?us-ascii?Q?BYIdLsYngRD8ja9Nc5RGZckGPiznk6gUM1iF7iT4e111fAyFEmO3CKSxLDUr?=
 =?us-ascii?Q?MM77ow093B6noa9onD2kSdAq49WHu3X8lIEJuOh/5l5VVbWIoDGopw7DSpNR?=
 =?us-ascii?Q?pMWcy3AObApJBfhYkcYwi8iNhelMNYe666pA31RjsEUswQe9ChRypPmSl2bY?=
 =?us-ascii?Q?5PlikoIwn9jCwhYdzn9XldFgoUd4I2Imos7lWGFu0CmdsQlSU8Rb6Jac3Zxu?=
 =?us-ascii?Q?CvS1Q5CndxZet350i0DaV48yF0AuPOrw31dAqnXByvdlDVqLmb974kPNVcjE?=
 =?us-ascii?Q?5IyhX9aDW+TrpHcMu1wub1onyGRGwhllKRI1aIYHZkf34SFZj27twxtBSybZ?=
 =?us-ascii?Q?sWrZY66dWL/LWEYypvHLZlrmsw5N4JRWNqc0RtTV/SOJ4s72j1tKyUTEYR7+?=
 =?us-ascii?Q?js0OSns+eUhY+RO3BELuOhj12bHSSKHMdzfmUZguAM1VvodYZwUZ6HSEZn4V?=
 =?us-ascii?Q?jP3ziLw1cr5EtExfz7lWbygZzVjnKAcYPyPmblGbm5rVzvlXK8QFzHICuSK0?=
 =?us-ascii?Q?zwDRj5sPzTjqMN8ohWv7Tx9A4nmje+71IJXLZBrF007HAWWc5m4m5s/iBfyc?=
 =?us-ascii?Q?KJJFnMXdsBw4gkGvbk0Abk/xOtcnq6JQNZFyrdftK2bHYU1O+E5PVCkEuYp+?=
 =?us-ascii?Q?kio2Y15hLRzdWdR+oCAWcHU92AFmLbnp+q8IWtmymoDFvaymg/tfM39tpAtQ?=
 =?us-ascii?Q?De8EVyCHvVLOugr87oPu/lzS9nIDRurNhy+FHWL2mMshW19Ld1RRe/vYnkhs?=
 =?us-ascii?Q?CohDseMrj+Z8qtMAFmOTM1OB0x1vhiVZioVpUURuPjxdCBXJdDF1MuYQpb9A?=
 =?us-ascii?Q?904wCHIBb0H8emuTaKJBKFDEHTIpg5f16m28iMUn/Udwainq1X9sdGlC2yq1?=
 =?us-ascii?Q?wnkS2V2YNuYPs0h/Lmzcr9Xx8I8s8B52sQqk1/rWD+Wx4xxQhTHtNgcdzLXc?=
 =?us-ascii?Q?WCuh7uFqsYPdDVDIMKLLHw28lgsFm3CbsxeJPod72ad28ixGoPt0ZPMshmuT?=
 =?us-ascii?Q?QfSuTKNzigjeJgde7U5IHtjvgqFdoV0dLwZ2YtVUbgAqOQdnDoglSTpLTwFY?=
 =?us-ascii?Q?/443ffZ/yfHjrmugumH0D6eui5EFkquBiVya1pi8/Ap6inDHnMqjyQC+yLrP?=
 =?us-ascii?Q?fWMwqlOI9THjygX081nJymG/cDDReAhKOComwyAOgap6wS5yZ5NJE39ORD8r?=
 =?us-ascii?Q?FN0XiznVBB+nsqp1QycVUyEcZNcetDPKWIA6Zt5lZZC3O00IVsbheqgmvYX7?=
 =?us-ascii?Q?IgmqKOfh+74=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VfP2iQQPeNcbJ0R6Om+rj+9ZFoOGoUKrWR8FUPy1RhkKVIeIpotVx9mp+4La?=
 =?us-ascii?Q?UPpgQWCc/srEHUUyAQnFc8e9ay38XT3Y+Sks2v40h0+7Jp6Q6GgjX78zhBye?=
 =?us-ascii?Q?1Oot3UahxQ3yBMs1stsudTBGtATWv2yGuBxJwGFfmKVJJvwyO3TPqAsZ/K3X?=
 =?us-ascii?Q?nFA6f0vFCwK2UYLpKc1cVvI6VQz3gVpOtPtZE9Q9iWNzBqXMXbmso5+dciFf?=
 =?us-ascii?Q?uX+FkAAGKgzvuohd9osjXCeq9pIX4HYpW0S+n51cm3vMgTyzQvpcz0B+kjVI?=
 =?us-ascii?Q?ledzq/8akWhYAcyaPnF63aHTO12uRQ+orLlsmOAm8Ad1WnxO0ME1ezZQEVfU?=
 =?us-ascii?Q?9bwRPK23Zw7nlHfRSpur19TIlWlStgXnnHmnxbuUvTCkleodJb+Ah8kS3WsB?=
 =?us-ascii?Q?lClQIfzwdQ4ZVNDtniVAk2zx9CbGnJLeVkCR58d8Yjd4GxJjEwhDRoZu9GME?=
 =?us-ascii?Q?mFOOmLGzedVycluuHGTuL2F2EU2PEq/NMYwdzpzels0SspqagFB/CxDn/eY9?=
 =?us-ascii?Q?IC9NlAjG+9cuBzodKOtBAro1T1n5ps+kCHR9tUcr0STC2yI/k7vEXV9B8tF4?=
 =?us-ascii?Q?v0V9yqWiKqQUq+vPvb20NK0BqxJ3ccx30lcUU8QEL/GcgU42Sz4E4yuZyBmw?=
 =?us-ascii?Q?xXNQswtrVu7+RByBBHCGmAUEH1jKRAg+U5cP/HIwVRLFc16jarSA/ITTRW79?=
 =?us-ascii?Q?JBu+tDfLQm250SkL1/Jnk173ntxLkdFOnVVOlUMHe6DAUcPvhv5uEk2g7Blh?=
 =?us-ascii?Q?FvNkU9vk7XiyWtBFjVIO62hGOGk/Tnbcx/58/j7veZnNLh+3dQSwGpnIJU6H?=
 =?us-ascii?Q?pR8tZe+enuJQDajPW+/VgehhwFj2gu9EcRqJesxZ3YneWMBAeSgtmrlawzIu?=
 =?us-ascii?Q?+qYX7IM2w/9mMbJqbZH+hAEMxzUEIatpmV1nNo5+UR3KteWT6W/uGWpahpbw?=
 =?us-ascii?Q?NZ5zVDiP8nzPFI++Sj99iMtX2BV5I7K8Ak9yc57azlLYbUNKl4eygPa1ioxc?=
 =?us-ascii?Q?BQW1lknF/rXXTXrWOF6p710p4ovAmbnC4YpyXgAfAidFh/JiTjsq59ES16rp?=
 =?us-ascii?Q?iXD2iV8NpSX4NK1Lf08WCYPaVnQfKAta69eVkfpvhmXBaTass7N/NWmDPAaY?=
 =?us-ascii?Q?SR3bqhS+pwc2e6oq2MfPFfLdFuLsaa6yXgRzHFWqn+J0V/6CoOqRhMfVvmcA?=
 =?us-ascii?Q?OuUtBVjjkZxyydqIHxOMkWJ2Z96ImP++VYp/ZlPc+Eyeb2IJqpEheRNMDY7z?=
 =?us-ascii?Q?gBHwYcxySD4F9sasTpAIpR50Azb2PSOWnjacSJjhff1ecgAvqeaIBbecbGC7?=
 =?us-ascii?Q?gpQRU0Iwaoy6HZBYDitarKnQ34ZQG8WhGDeJWMUD1z8DdRp+pvxSDWtJTQXm?=
 =?us-ascii?Q?Tw4KlUYBn90qcSlluDGS8exbUc3W8waBSa37Q3WX+3a/9cDxXK7fU6OwWu4x?=
 =?us-ascii?Q?F60ZVF/XWYB/Be23MaYSbHRuYwC4Tl4b79xLVzgOX5vyvGxMLk/NISwmn2pl?=
 =?us-ascii?Q?yZhxeUVlhFs5yjQC4l/OAxJWS6nQkwCk2iYB8tMsfnGCJDiX00CMSnAztNSF?=
 =?us-ascii?Q?M0r2/dbrKE4p4vKAMo2rCY6pS6PTycL3rbWPS4Cp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d115fdde-e4bb-46a9-5ed5-08dd55d427aa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 19:39:44.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhglN+eZWPlgh1fegLlCl9l1+HHNTMtnydi1JII/khxguuFW4qaWkdH8Yq6fobj9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_113955_824231_3CDE44D4 
X-CRM114-Status: GOOD (  12.74  )
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

Change the internal freelist to use struct iommu_pages_list.

AMD uses the freelist to batch free the entire table during domain
destruction, and to replace table levels with leafs during map.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/amd/io_pgtable.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/amd/io_pgtable.c b/drivers/iommu/amd/io_pgtable.c
index 025d8a3fe9cb78..04d2b0883c3e32 100644
--- a/drivers/iommu/amd/io_pgtable.c
+++ b/drivers/iommu/amd/io_pgtable.c
@@ -54,14 +54,7 @@ static u64 *first_pte_l7(u64 *pte, unsigned long *page_size,
  *
  ****************************************************************************/
 
-static void free_pt_page(u64 *pt, struct list_head *freelist)
-{
-	struct page *p = virt_to_page(pt);
-
-	list_add_tail(&p->lru, freelist);
-}
-
-static void free_pt_lvl(u64 *pt, struct list_head *freelist, int lvl)
+static void free_pt_lvl(u64 *pt, struct iommu_pages_list *freelist, int lvl)
 {
 	u64 *p;
 	int i;
@@ -84,20 +77,20 @@ static void free_pt_lvl(u64 *pt, struct list_head *freelist, int lvl)
 		if (lvl > 2)
 			free_pt_lvl(p, freelist, lvl - 1);
 		else
-			free_pt_page(p, freelist);
+			iommu_pages_list_add(freelist, p);
 	}
 
-	free_pt_page(pt, freelist);
+	iommu_pages_list_add(freelist, pt);
 }
 
-static void free_sub_pt(u64 *root, int mode, struct list_head *freelist)
+static void free_sub_pt(u64 *root, int mode, struct iommu_pages_list *freelist)
 {
 	switch (mode) {
 	case PAGE_MODE_NONE:
 	case PAGE_MODE_7_LEVEL:
 		break;
 	case PAGE_MODE_1_LEVEL:
-		free_pt_page(root, freelist);
+		iommu_pages_list_add(freelist, root);
 		break;
 	case PAGE_MODE_2_LEVEL:
 	case PAGE_MODE_3_LEVEL:
@@ -306,7 +299,8 @@ static u64 *fetch_pte(struct amd_io_pgtable *pgtable,
 	return pte;
 }
 
-static void free_clear_pte(u64 *pte, u64 pteval, struct list_head *freelist)
+static void free_clear_pte(u64 *pte, u64 pteval,
+			   struct iommu_pages_list *freelist)
 {
 	u64 *pt;
 	int mode;
@@ -335,7 +329,7 @@ static int iommu_v1_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
 			      int prot, gfp_t gfp, size_t *mapped)
 {
 	struct amd_io_pgtable *pgtable = io_pgtable_ops_to_data(ops);
-	LIST_HEAD(freelist);
+	struct iommu_pages_list freelist = IOMMU_PAGES_LIST_INIT(freelist);
 	bool updated = false;
 	u64 __pte, *pte;
 	int ret, i, count;
@@ -360,7 +354,7 @@ static int iommu_v1_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
 		for (i = 0; i < count; ++i)
 			free_clear_pte(&pte[i], pte[i], &freelist);
 
-		if (!list_empty(&freelist))
+		if (!iommu_pages_list_empty(&freelist))
 			updated = true;
 
 		if (count > 1) {
@@ -531,7 +525,7 @@ static int iommu_v1_read_and_clear_dirty(struct io_pgtable_ops *ops,
 static void v1_free_pgtable(struct io_pgtable *iop)
 {
 	struct amd_io_pgtable *pgtable = container_of(iop, struct amd_io_pgtable, pgtbl);
-	LIST_HEAD(freelist);
+	struct iommu_pages_list freelist = IOMMU_PAGES_LIST_INIT(freelist);
 
 	if (pgtable->mode == PAGE_MODE_NONE)
 		return;
-- 
2.43.0


