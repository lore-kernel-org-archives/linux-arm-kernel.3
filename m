Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A7DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l21LslQPLW8LUGN02Yky03iN83kydeI81aeAri7EnbE=; b=QwLwi3Qjr5Ue0DUaePyxsG4quQ
	XFPhJmBEuM0wOuJVVXpN4XAj+occUtPXLApI7HJz7s6FPBIqpazjElMsMR3+rURimTjGk+ihdkPBR
	/FePYf/wF9Loy0ymV41PPj+4AomtqlVB2A+zvNvvK1Khg0FTZZwv5n1ysEhpRRbFs+K+/IXMz7Kng
	jaonMUM/qMINIG0ArV2g91dWtqVcUgKpHQCmqNm1hf4Xz4eINr+LXeEClIg+03TwCtkGp/QRdLkW5
	f3+V7c3sZ6Kku8Iv4YZJRWftd7UJsBzBQyOegr7WO/6BqjaIZrtoluGQ1SL0g93PmdxLa1FDm5n8j
	esk8cf6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKNu-0000000CYRG-3WEb;
	Tue, 02 Jun 2026 08:22:02 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKNs-0000000CYQZ-0lzf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:22:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/JVMXhtXHgc8ZUGkxQWLRboePZXEfLk3vHMKpQybHUmR3p18Rbnbh6hyjpT7eA8Jg0pTddrBeP2hBa2k8uvPM4Ij2nHoZCkwe04TZLSs6OBom0bn+gcy1m7loxEoWIdVmLpsU5o6HZ5Y/BHKHYuTRGmhwkAaBZZJLykJVCEdm9z5sdAwPpmEwY2F7kuMGf774cQ27Yj1SOmh7o5DAuvmFv9VFWEh8IE6g9HgDFDAWtsTzlCnv2CsmD3z6HQIjEZu8Uo0f8bdMJttFle0Jb4MmxKIOn+O4kb7vLoH2GlvwpFe3+TKFPnOo60r9/1+gOvmvps8VDnelzwoUAWUtt66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l21LslQPLW8LUGN02Yky03iN83kydeI81aeAri7EnbE=;
 b=op9m26F5b2btggANp5+oGY5H5OcB0cwqO/gBCepD2EK+5ch3sKyNkUTJNacqM3rKWCEQojRgSJ5FR4BvegsrtAsh5jUjfX6H6O7Ub660moctMoiLueITMBj1bhEzMrKvC8PzjqRSja1591EBjWYQXYlfGpNwRun6D7HEtSqtHxq4wKMI++o9OonMbVligdR/hmSrEZMeRC4LYZ54IoaNzSmbD69TQ/gKc7VCdoV66DJU3NTnpqeiCCJBQ8WgtjzYszOOBbPJTrg9Dn7W9H3mfKJhDaB0/Lqgf/t0V+hwyayDyoxcQcqfrV+axb9lNXyhj1CYQ03JbJS/5CSZGl08GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l21LslQPLW8LUGN02Yky03iN83kydeI81aeAri7EnbE=;
 b=bVd3hET4MK8xqhQJn3h6XHNTt8soAJZb2BDTu/7hxbhryj1yTp7WMC1OSvmuj0vhuw323uthatW2UswAcMuGsvQ+FnMRTlnzk8KeBl+lMKex78ucDCQwQ+oZTdooTrKlwDM5c5ILroAs1S/AV3/4tTlMirv4l+xz4vSEWIXBFeXebdqZfP0wgxCyLHCZSov+7QUK0tTviDV76uFVg6v0ARuyIyGBYe/t+sMfYhHBK/SlK6g+Nrhnga4jejG+cME60zPkVRwvPdzQ40HnaL2G+zoKpyDr/zDsRYql33oyipT+AwddycU49WhKD2EojkY3gyb5WiyCf4q/65g9RQj2yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 08:21:52 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%6]) with mapi id 15.21.0071.014; Tue, 2 Jun 2026
 08:21:51 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v1 0/2] Add SMCCC cache clean/invalidate provider
Date: Tue,  2 Jun 2026 08:21:43 +0000
Message-ID: <20260602082145.404939-1-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To DS7PR12MB9474.namprd12.prod.outlook.com
 (2603:10b6:8:252::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9474:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e6255b-8900-4423-66ec-08dec07fffc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: v94TSqXJ8j3My7d1nERvurRo1/9WUyK2tMfP45kmAeIdVHhB8x4aJDiL6n35O09ZlYQ++/iXsO9cclYOyoiSEaKT2mXrDa6Tp6IstIxMfyxV2/hlY2NQpXmKDreaLqLt7+3TN3+5iLwUBc6DOACygaYSaZ1p1EHnSe882p3wgEBPDsJbkvFzJjxdXIzzuligP2eVXSxt3YyaVIdYQQtwZeLg0JQ6PgfzlDAB760XHSfjRZTlxmeZharQh60ui5fKi0KyTgachZ1OQBeS/zd8RJjb+5hKKEvmZVxuNtRMKm+nnA6YgVTsw22YZTb1wb+vRfyomvtifYD2MGjgqVJrzpSNTvhmQuqZh2jkGcL097tLawrUhsOy/2hV7sfBPgwO/lZLVEsCCW9aHlDSnvlABR9YHsYKVpGbWQe1X7gBpbgWPsKiK48jxImuFmlarcZCo8FSzMv/xDbeuLdyKa8eVOQKwTcyZ7rqxxAXUxPSGANU3fORf9oJR+YvmIFwZHIugdfcrai78wDfHDWq8NA/mpcmcjFWHKp+4T+rT8pkYX4MqBsR8Oq/02e/TsggMdSZxYrGHocADfM/e8TZBwepIi8BQr74qIynpR8Gl9JD6oMGoESaSvraiVnk6irc5KiW4I6kdyuuyQ71k5H18b7bP+We4c6B8c6Y6Wk9C4ac9GrTRSk4bkFsaSJ76p8AfCaATFHGY8Uaa1j8awgdYbCZhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F3ovDyk6ctBarRb6zxVGK+65f+sCNdvq4hQI4i6rfWAWARzNSH3LmdBJlkV1?=
 =?us-ascii?Q?JOKAsE/sdMVMtZVEjsmD3rl8cd4A3oagDyONB64i24s5yVweBkEjljBR6KEZ?=
 =?us-ascii?Q?PeRk/TURk6fFyO6hiS4KO2OZYOX5kLvR/FOaSudSUWo+sLZ/xULNmGBKD3yj?=
 =?us-ascii?Q?lMpk0ucYcJi5T5882mfEElodc2kssyQAxw4OywKu7ZTB51zENcK/I9/rHHUS?=
 =?us-ascii?Q?HMnqy1Y8EBszaDdJzf0v/jLF6g5lGWAplarW8mHd2B9IskZ+i/Up8s5JJJM9?=
 =?us-ascii?Q?ETQ+Ji3pvIsrDnbZALlqXZ8dr2fb6dhoBWn3IpxwM8Rfy14C94El7W2x1I0W?=
 =?us-ascii?Q?A1e5v6YvMR99poDdCRfQMGguuGnOn0Ao9WcPGxs8bOHm54hkbIleS13YWE6o?=
 =?us-ascii?Q?D0d9ITDc7/yqhFb80FlUeqietemnLXSUAyq6vrq+0K16mTNd/tjQIbMJ+GCE?=
 =?us-ascii?Q?qO5HlTJcfxxuZ7C7/D0FeuXSklUsUy4U16NSLuu+Yqc8nyYkwQ3f+hSuIK2b?=
 =?us-ascii?Q?En+w7n9SVVA7Va1iCZ43YKr9jSW6gMSek4ojb6CHRwvJE53kLjaxGKihhWYS?=
 =?us-ascii?Q?uCmxmqWsrpVfevldgKDjU9v8yzy82iDGcBEl/QAocC5vH7yb50A0Kmp++yUt?=
 =?us-ascii?Q?fG0IvG/zgeCZ/Zt9wwmLt0NBFOh6XmZV5YhUVGvglyUQIKa5lH3ZRu40O+8z?=
 =?us-ascii?Q?+NJQUq6+zEMxWFbcliIWKsK7LrJ29iJnyqDN0sFJaNA0pln0jMl5SL/l7L46?=
 =?us-ascii?Q?+gGggyiqxWfhUD/tKxDYO2yt61ND4Gaa6lhXSiaxcoNzM+Xz7XNu0paEMIdR?=
 =?us-ascii?Q?1u8PwzD5UEho/knEFn9RlZ7Yy+DSSRouZuXobPQwhJvIHEajp6ti+23C5mH1?=
 =?us-ascii?Q?8HVGp5CCCOjfAGcSTzheCH2TSk6ALVq5igabUwGwc92hgWoF4BdWVLwAAN9F?=
 =?us-ascii?Q?uZUz9IfoD7+THp2oEMT7OY5+vIIHmctUvMTipHZakoQprA+sDz9JISZLKszR?=
 =?us-ascii?Q?O/HTNZCMNCkCu98tEs+eoNWwfl9IKF815zql2Jeh4qDJZKu283/u6+GsYd3A?=
 =?us-ascii?Q?N4EcvvmYZuDe+w7/I8/twmChAAURfGH96W/r8oswOwgahoMvCjrt06AMsgCa?=
 =?us-ascii?Q?+wPmfN7hvWpHyKaRK/rJrckHcrYoXBDlPmd1Zt4O2wplOalEZlHJwwTYyt5n?=
 =?us-ascii?Q?80JFfDUciPIDTDExEWeu12doSS0geDudFVECADJ7+NW/q332dyLRX67QJF4+?=
 =?us-ascii?Q?MxkBHRXSOm0oSIMNzeWPr6SHj+JxskDYR3Mqf7WZbkTvOPXBx2pFTXEJqb7N?=
 =?us-ascii?Q?skBddGmEhi3GrIRAcAItDHDlMk+/vfqxvCcF6B0h3/71JY4OewyNTGlWCs2p?=
 =?us-ascii?Q?eOwZ5w8EP/GI2px6mQlMAcq9oT7ns1EiT6inMXjeB/ywSNwVqtZhM1KLjgUb?=
 =?us-ascii?Q?/u+Gh9RgFLgH1ub8INYc/KAqdzd7/G381wG7m5uhVoxfWkX6kqEyDpJF5LLA?=
 =?us-ascii?Q?+HMePjjSvKMC657VNu05gy/HOkYZOTGz1w+u80dlNg7Q7MpcmJ3/AFkWYgAT?=
 =?us-ascii?Q?5VRtkZRYWa0cBa31AHPrt7TopI08ozlZkQEVyxwSgezX1yrOuTOFiriFYk8I?=
 =?us-ascii?Q?3cPf58nui6NN5Ty+F+RZCLiHHBaY8p3Mw2HsK4XHwcSdeiIk2wiAcO6AWSN4?=
 =?us-ascii?Q?IDVQvlVvKomhWAHKTnEZxMvsgs4b5UjCRi9LWwPq3U64idbkp8jsk0cS0CU3?=
 =?us-ascii?Q?FXSVTlrlTw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e6255b-8900-4423-66ec-08dec07fffc7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:21:51.8753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m688oU5God5z1bGEOIZRXn+blbnWj49Y45kvKgp5UX+N+sCIZZMsiEiA+qjhOahiybYrFQEa0HD6A2qRQmO0UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_012200_266122_71399472 
X-CRM114-Status: GOOD (  11.78  )
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

This series adds an arm64 backend for memregion cache invalidation users
based on the Arm SMCCC cache clean+invalidate interface.

Per DEN0028, this interface targets systems where a Normal Cacheable
memory region can be modified in ways that are not handled by usual PE
coherency mechanisms, and where VA-based CMOs may be too slow or
insufficient for large ranges and/or system-cache implementations.

Representative use cases include device-backed memory state transitions
where stale CPU/system cache lines must be invalidated reliably (for
example secure erase, reset/offline flows, and dynamic memory
reconfiguration).

Patch 1 introduces the Arm SMCCC cache clean/invalidate function IDs and
transient return codes needed by callers [1].

Patch 2 adds a cache maintenance provider that:
- discovers SMCCC support and attributes at init time
- registers with the generic cache coherency framework used by
  cpu_cache_invalidate_memregion()
- handles transient BUSY/RATE_LIMITED responses with bounded retries

This patch set does not add a software fallback path; when firmware does
not implement the SMCCC cache maintenance interface, the provider is not
registered and existing behavior is preserved.

Reference:
[1] https://developer.arm.com/documentation/den0028/latest

Changes since RFC:
- Dropped the RFC tag.
- Moved the provider from arch/arm64/mm to drivers/cache.
- Added a dedicated CONFIG_ARM_SMCCC_CACHE option under the existing
  CACHEMAINT_FOR_HOTPLUG menu.
- Dropped the global-operation coalescing optimization.
- Dropped provider handling for SMCCC_RET_NOT_REQUIRED.
- Removed the unnecessary global provider pointer.
- Removed arm64_ prefixes from static provider-local names.
- Documented why these SMCCC Arch cache maintenance calls use SMC64.
- Anchored the SMCCC return-code comment to DEN0028 v1.7.
- Used fsleep() for retry backoff.
- Used unsigned long for retry delay values passed to fsleep().
- Skipped the final backoff sleep when no retry remains.
- Documented the bounded mutex hold time across the serialized retry
  sequence.
- Added mutex_destroy() on the registration failure path.

Srirangan Madhavan (2):
  arm64: smccc: add cache clean/invalidate IDs and return codes
  cache: add SMCCC-backed cache invalidate provider

 drivers/cache/Kconfig           |  11 +++
 drivers/cache/Makefile          |   1 +
 drivers/cache/arm_smccc_cache.c | 160 ++++++++++++++++++++++++++++++++
 include/linux/arm-smccc.h       |  21 ++++-
 tools/include/linux/arm-smccc.h |  21 ++++-
 5 files changed, 210 insertions(+), 4 deletions(-)
 create mode 100644 drivers/cache/arm_smccc_cache.c

base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.43.0

