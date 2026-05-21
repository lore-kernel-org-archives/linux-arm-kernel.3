Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3920CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eHiNJWEQBNGGxX7zNxGvjWDFJcxgtXRW10xyHSLiyWk=; b=BKqXL1sm6vBP4BBu1P3as+nnbQ
	EQbKPgNrlh2F/3CpyOQdrT+c08F7Hs6TU8vOo+b1ptKCkvbm1YxpOrVhmCONh3B6vTbO3rEhItagE
	X4FE9Njj1RXyk9SYVonWSdvZi1IX9BKmVCuNEEWevQtFokrbAVakHOi128S21RscPKJUvM4dbVT4U
	IUisK2HXIHlf/MwNaQ/B6/IgQKAbR/PBXlPtjJmt5QCYxIWEVmOIhaFf9JoRaLbPfK/MwQBupBLOX
	s+bF5wi9RrgutepbFq88rwD46rdqado33WZ0KS1GoMIWQ9Uw1fZnwqprGKBI5P27JfiGJvi8mnVPT
	VfmqBf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxrv-00000006xrA-167s;
	Thu, 21 May 2026 07:30:59 +0000
Received: from mail-northcentralusazon11012063.outbound.protection.outlook.com ([40.107.200.63] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxrs-00000006xpa-1aNi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:30:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjHVW5RmEjgs3mgrI2tnYeyVNe5hD0XAw3IleqTCYUYNb2Xd/KiGs5xT/zeGo43RV96kPhO6gfwnwgz8/T/KWH0fG085+HARTNuJ7jDv0MVpdiHmUyTd/WCQtg+CcwSPQWGZBK4XIqB3R6I4IHH0paV7J4jzsO7j9qj5J+DMPlPEQy30JA4OlCGPy5IA+UWR+MjMhyn9SwRql0iV+WMa9w2C61XcQ+J6omA8UIKp9VCaYItzXTp+SvV5vl4+1SI6+WX4NXtV8lCxZp/fzscvgUGOJHsGaWug2hDD36oWVhi8Cos+/a/yl3ozV/8fldbVh8fMOlWZGCEigAbOBRAkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHiNJWEQBNGGxX7zNxGvjWDFJcxgtXRW10xyHSLiyWk=;
 b=HjkEUBD8RR3xKO5hIZ5v8rjJW5TwJOMwYR/nHPwpzw0cRIyFRzlqqsglSlvtTwkMhIHkNNsL7X9dHEpMLrARG8RySguYymFV57muYKYn7eBKfkph57FkUaOQj8rq2fiJVYRg4eVHvR51BBUqVZE04TtstyCYYI93n59yVmYBhU9HtxhRoQ44fHjel682pkddnfdmYH+o7VpzcpSTOpsxC0JDM4TjzqXLtclyJx6JwZfxd5NUauE2WSgV+y+KHJ6/S+eF5nfnGFU52YKgITRSpViR035pJog7JiiBRWvpsHACW1kjARVvC05Pxq9eA/lv49mxue8/8Rg7D32tcUZICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHiNJWEQBNGGxX7zNxGvjWDFJcxgtXRW10xyHSLiyWk=;
 b=kzRphVeYW0D63NEs07318lskveLlZBJZAHJG5l6y6U7YsS6uVPFdb0LsZ64YNYlp8522Rf8gmabaHn3/J0V70s37nVf8fsvCgozGGuMqNf8ogEpUj+dkiwhlwEPrB+QNTMlQt/LJHoVndqjaxFPMJBJAvRcJCo2SnrLlnJJ6jXakZXqMJNvZJJFAfps29uK12A/dYFxJVWRNzYIBE73cC6wrrced8/qbFX3pqsTxq0fVPKPgBwmRjyHwPzD3GoP2zqueF7wW8MEQHdv6chc5Uqi1zWg2oQ0AD3i/UF+sln6ZyLsyF0idDtlPwqvNcgVAX7ug7y7XXR7+0WN0eViTPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 07:30:50 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%6]) with mapi id 15.21.0025.016; Thu, 21 May 2026
 07:30:50 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com
Cc: conor@kernel.org,
	jic23@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vsethi@nvidia.com,
	jevans@nvidia.com,
	raghupathyk@nvidia.com,
	srikars@nvidia.com,
	nbenech@nvidia.com,
	alwilliamson@nvidia.com,
	Dan Williams <danwilliams@nvidia.com>,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [RFC PATCH 0/2] arm64: add SMCCC cache invalidation backend for memregion users
Date: Thu, 21 May 2026 07:30:45 +0000
Message-ID: <20260521073047.320614-1-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To DS7PR12MB9474.namprd12.prod.outlook.com
 (2603:10b6:8:252::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9474:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a1c7f3-8f59-41a4-12c3-08deb70ae1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: Ka6PMbC4R6E8HkABwGPgEPLX1pYsfuJ+WZDmg8cLZadiaw/1JJvmTmA8cWbKBcgoUD8Ps5HzuBcXraZFmEbNA1GOyZEpYdx7egDEYZQo2zqxfapwCAXLpvEONPjc/TAhcKKxW8C1oWYLg2wvF9Uc3eura8oHQLyhwIxoNd0Jh0eOiPbEhQAcb1i/kbbpHqPpyIv7UvqKX9uDHCk8I69ndzRlJxaoPgkJyu1/nKfzzQWQM3u05AS8zRxt9o7yPxRt9Izoa1jacsRfSOkDQunIwguY3i4zwV0NXTbhayhHpahXsCRnVkLuVSKETkRKpXk6Aj3ItCVpkO6Wnm+IvjWoV7Vwfucji83ULKfUQWl/CHSCnW4QNDbqLOg+2THn+zqWVtMhgmn/O8Mzj4P3DYoDqMYe4xMMk+Wy/8dt8j6IyO0pgIjID7U9QI4Pv2XbXd7atpBP5dO1mUqFQNR+vr6uTp2CyWDiQeojhVCxq62Lf2w1JEJgxSbCH0EiNlM3umtKX9qrrWmSrjyXrx5X2E5p8/cojqkk2F/4CddVrWwzXCMvI1hec5NV3J51iaJ5UrtutxveYsHzKSsUeJpYTQi31AlWRlRRxF4C8J/N/Q3E8eVlbVM9FQL8I2T0e7qUl1cFXyRzrlCPs9DYSPBtXIk39ws34T8YHH0qDjOKlqz8a9wsrpdnkIYV6BOeHvNz0AzGw+9eZ3LwfL+mElWrAcmL5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/VLXRKEG3pUzrjGm37+lbDsjdXPTVvqCUtZc8d9XEljiXxL0J99cQpxX4B2f?=
 =?us-ascii?Q?JGWkMZAySd5ZotaDvPHPGoFlcGxdBOTuHqNAS4McrHxfSGHM1cliCEZ3iepd?=
 =?us-ascii?Q?R6zsUby3LG3pxrOOcc6Ylh+xg3u8uIMi0UABsJ794KnI+Fc9Rw0l9EjU1Yqn?=
 =?us-ascii?Q?PMS6tOVXEFb9LPrHqYgKV/lAQ7YFeISdxaz712jEFcam3VCv4vbT3BV+UVZr?=
 =?us-ascii?Q?V3E0TIPnqErmVn9EM6QIT2huqzCRZ1WuP5glD2t/XmbYO7Zn2kXdyI7Bm2eE?=
 =?us-ascii?Q?y9qNGUfXFtlctXF2CuIOs5UGWX8PYGEAdWpgCWRd9mQBitXNHNjMi6Id2Tra?=
 =?us-ascii?Q?wEpjpSXbMlbazuyCIOXPq1+fkBkex7ZPJKeqlLg9/j2ZSXPiDx9OKP8njM0l?=
 =?us-ascii?Q?ryGl6kpgU7k0L3gifCTUIQX+3kPewpqES2OdNctd5aLBeuAvCROv9q8fFhb7?=
 =?us-ascii?Q?hnCs99ZjpIcFzb+Q029TgtcWEeK/Ik9bjXAt9CANyLvrz7+2vxNozxo4YkBg?=
 =?us-ascii?Q?xpYXHX1L4ybLfxK+uGNxirGw3YrpElQlDB3kUP9k7xgfmgPIcs7wpLmiTSnD?=
 =?us-ascii?Q?yg2kjItdZD5x6Xh0DWRFc7/DVqeA3+4fMhLH+Drp27VtDcoP7K6zclP0oDFQ?=
 =?us-ascii?Q?6YPBTVu+M5hA51m3HPsl8wU3nbFjSL61w11ioYCrNyED+fEoqjx1FCD6qCg0?=
 =?us-ascii?Q?BBnEWQ+JmF6Cc4MrZVkxQUHyQhydQc7d8OsPsOLs3NIoVhO1K4YN3LQ2fLcg?=
 =?us-ascii?Q?+1nVPrmOzr6DhG3j+y8GMzrmNXkzRDsajmLYr+WsQ2JShO0OhTNPStibkRVW?=
 =?us-ascii?Q?Qw0BGMveH2hWuVGoOfy3Q2lJ2NSV8mFTtMM3IiTaUuy/SLKSTKPj5IrjGbdz?=
 =?us-ascii?Q?GKHH+1Sc8fuGSyXQg0KgkUr7QtKGtA67NidFZ74fBVajEh4NHavNT+EYNhVK?=
 =?us-ascii?Q?K5uXlOQVD7W7y11aemz8ofEYeKgU3ty76R7X+TH/5mGC5T2G0N5SSbJFGWaI?=
 =?us-ascii?Q?a5gs8jcYgLKt3OwyEK+Oe8N9SWXMmlKtPzAo+z01RMm5dLnYLoX+6/qhAyy5?=
 =?us-ascii?Q?5VTzSqi1ft0rUEmyBp5p0GaFYOdKf3K1GhzucoemDoNHEqUu5Q647F9MPQ4P?=
 =?us-ascii?Q?AxwlU6uC6UqqPK9EK9iOcfMJndXOM9q5Y1R7dpwYPDpeY9XUYDOTwl4z4fL8?=
 =?us-ascii?Q?VbczyjOqT8aNTkpH99Dp4ViTVWHnPxYiTVg6nmdo7iQNr91Jfxnx0KDz0Ebh?=
 =?us-ascii?Q?m9nmNuEDXB+nVRaJkxAsajbsSnBWEbxBC6WwmMbu/A1aLuaPooL3AlvVphkF?=
 =?us-ascii?Q?/HAZsTbU7KXwZzYm1FAfRWzaFrm+c5/bATF0RLycL0//7Y6EzIvgBhCNUxD2?=
 =?us-ascii?Q?lfA41oUA06UMWSzlTLaJmN08X+AfUvlSyl6Xe799aE0xGCBBJew0tEZax8BZ?=
 =?us-ascii?Q?oNeJbXzUVtEsbaK+j4w04Vf7w3OybBS4HRxG8OjH9jF/PMqzcLLP2IyxnFtu?=
 =?us-ascii?Q?ov1I/7+/BGSjbUb9IOjb9qeu6M59ste1pVo5rKXFKayeJJvopAE8aywNFUSa?=
 =?us-ascii?Q?wjQTd68TjzzYQ5j8s/D0G7YJ+Tx2IeHCfFxihDL1UGsGlmOHXQ1v0+6nr+0T?=
 =?us-ascii?Q?TnTDHUQZaynwEZj0FbHATBdddFrbqnl9n0ATNX4Iq+RWVo81TAg1NerNy6Nu?=
 =?us-ascii?Q?yJ8Alj5hX8phUql3Z+ct/virGyDFLt5j36ZVstP8bUADWU0cp2Cpa1GIsziJ?=
 =?us-ascii?Q?bHwJOG1+VA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a1c7f3-8f59-41a4-12c3-08deb70ae1f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 07:30:50.2814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPBgXYhmosJRtkfOm7IeXo/c3n1zqfjUyAPLp5ou9r9uvIMoAnkXpMqGkfIPqqD8p+ilZpAcF9QMxpKYRjSDFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_003056_416412_ADB64310 
X-CRM114-Status: UNSURE (   9.67  )
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

Patch 2 adds an arm64 cache maintenance provider that:
- discovers SMCCC support and attributes at init time
- registers with the generic cache coherency framework used by
  cpu_cache_invalidate_memregion()
- handles transient BUSY/RATE_LIMITED responses with bounded retries
- coalesces waiters when firmware reports a global operation type

This patch set does not add a software fallback path; when firmware does
not implement the SMCCC cache maintenance interface, the provider is not
registered and existing behavior is preserved.

Reference:
[1] https://developer.arm.com/documentation/den0028/latest

Srirangan Madhavan (2):
  arm64: smccc: add cache clean/invalidate IDs and return codes
  arm64: mm: add SMCCC-backed cache invalidate provider

 MAINTAINERS                     |   1 +
 arch/arm64/mm/Makefile          |   1 +
 arch/arm64/mm/cache_maint.c     | 180 ++++++++++++++++++++++++++++++++
 include/linux/arm-smccc.h       |  17 ++-
 tools/include/linux/arm-smccc.h |  17 ++-
 5 files changed, 212 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/mm/cache_maint.c


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.43.0

