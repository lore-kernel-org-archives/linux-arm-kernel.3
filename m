Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DBDCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYhso8TfMCnXM9uSQ+Kj3fWxAmU6jcWe4YzOGKmG3cs=; b=b5vj3tSFC/fyNdfSJS1kN+tXLn
	4YmRM8sDaG0tUlRYNhbBUoXT7LfEzEuOjSh4OFud4O9kyXRPTMxqevPmntdXpmLLIajsds5tpkUHD
	L5TMVVCiaysf/Z5CLq1xtdJzGfu0eQdpihvLjYBlkaBgcAYrgdksbah38KMxmWoOQJy9KqhhZ3VDZ
	xrQKfM4wf7eg/Z8i9W+7agA4l9phY004pAUeeea2oHx0IsTSjOAnj+l0xy9V5JjAypq4gSN+ZU+Xi
	60+pRApppBmLD3SVQ6zWMACIaWeZlUm5cZRCaOj0eItvgMZAXS4+QqS3Q+Qp8Ufa/pP+mwbxfp19m
	C99My8Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxrz-00000006xtZ-1viw;
	Thu, 21 May 2026 07:31:03 +0000
Received: from mail-northcentralusazon11012063.outbound.protection.outlook.com ([40.107.200.63] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxrw-00000006xpa-01ND
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhIzVFNOG+d19xq7f06+S9VRC06eLGy/Y3T8avwvo4F/U0GLkRCq8U/gUR83KVUU4qM361ldnIPEj88Rc16ZwoppgP2lOr389mSAFvAk10bpny4ieAlP0VWOXd3zN1NuI+idghZI4eqcHhCOHK1BJwiW3ZrppuV/ZV0hCLAR42pB0rWVFSux9r0A7Ei4hCq+VT6iPIIVoRQ6iTvsgrlRxJDEnzop1p2EC9T/hK9VJliycwT2quELQkpTzWyPAHPsS+s8HQOjMjJy78okKyYhQejebIqPt4OrWJh+/5kZKClwYKEh12FlvFUQ6KFGbPwGeiEqx/jvbjyB9/AutJPDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYhso8TfMCnXM9uSQ+Kj3fWxAmU6jcWe4YzOGKmG3cs=;
 b=YOiZEu6rX39q7hwif0Mqk1U4GTjWcG/sV2dI3TIB1rlEHbL2ZsMpOBo8Ij/EJ3K7ifXS0dYUGNDmDucw9s95g77IltBCQ92hDMC1CoWTRuA0jjLnKBINTZpr3Y8gcYNc3QFxcUW1IKKRcZW3mVWrTYfyrJp+NulD0XqG5MNPZSF/zs9uPh4zRoQNn5yIzdVpEiesrkYbtrJElhbOiR7j8cJt61wMHi0MUa514MLqhTzH20LxYCi28YoRd6oiyAKBgq736B/Jr2xIvZdcLNQLOQWH6iltW6mU6FW3U78Pja+2vEYxWGPlRjpdPfRWlBldP4bGJRKHPFg0pKzx/rp8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYhso8TfMCnXM9uSQ+Kj3fWxAmU6jcWe4YzOGKmG3cs=;
 b=sNKbK0OZ5Qo1GsP5Ded6EFqMS39Ui3UI5U9aA380bylQR2faMEwunsR2neQW7V2iTC7KTw3g4nMZ9ZzupTfmrGJ09K0tmIcjyMqet9YMVl+UWEKUBxiW1gVmcYhltvNtPU3srJMVO8UEjluVd66D3rwc7IOvhCeujD3L1jv63vLnT7MZ9SVVAkq0MNiynRZIe8fj1NTqmXQgkxrtgmz1dnf6MuNYMedbTk3L0dCp5quPFRPTeB+XK1DQBqDj3pOQYSgcrL8t0xOLvh0aTbLOSnOi3fBvzmjwkgIQnwTXD5G1ej5uiFHWG724pSmcDJp0Ly7aGYzYj4Sf9YYk5jh8mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 07:30:56 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%6]) with mapi id 15.21.0025.016; Thu, 21 May 2026
 07:30:56 +0000
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
Subject: [RFC PATCH 2/2] arm64: mm: add SMCCC-backed cache invalidate provider
Date: Thu, 21 May 2026 07:30:47 +0000
Message-ID: <20260521073047.320614-3-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521073047.320614-1-smadhavan@nvidia.com>
References: <20260521073047.320614-1-smadhavan@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To DS7PR12MB9474.namprd12.prod.outlook.com
 (2603:10b6:8:252::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9474:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: cf49ccce-aa07-4d10-5bf2-08deb70ae597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799006|6133799003|5023799004;
X-Microsoft-Antispam-Message-Info: sh5c90/lf9EEMRI6zW7JH+bqfrfoqOuE3haWqusRZ3ZdAKBFTdaxiwlFru97Q81vwSXsj5mG+aOmD/X41Wd7hGG0LtaDjGKBJ29AuJAXE/wYIIQPIIDNfG8KOqOgpcHYBPP5Sqtw6AG7kFmtqQLaVxy5Sxu/Dkl2sMZd8A+Tf/PrAaY4VgwBzS5guvHuWoV4luJaN4W2vWIyvuTy/P5ho1NIOgg8l0C7PcBz/RqVFbVdSI1vHYd5QUyXQ5B3QsFaeeOp+9XC9xcvHF0cp8ySYrNfVEFRpzuN6eCRuyNyyHJAn85y165LPoES48Suyo2BrzSHs2XcwyUrl/kIounMzXo6Z9pSxj8v8nKTGtxq19Oev+P58fzGr99H1Yi2ai8BBR9spbGAi5mX/jVJ62iScgzS8AlKVkL7tD7BpYgXUVElK/Pr/G8/Kw17lBnjK+9ZItGdwVxhsHYHFieWqtKLcY6DCZiWG4yhaar7QgcxzGblP63etSl/q4HdnDqUFHi2aol6V3mnA1ktRd7FIvSUnmyOyUJ1GxE9LHH/HpEDmxQ+9r+yl5VQ6yb/P4pbN/gLJEy8N9E253iiAdBUscm/cqnw/MshL9vt4V84x2iN3JzEKQroHTA9CqQp507QeN2bMl6H/Hinkue4EV4lmzibIY8bwX+uAN0Xu8jtMuflD3EqbOsX1md2HGc1p2vTmHWCR8IB3lFL1mcphGKpyhyzPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799006)(6133799003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8FcK1f9kbaeLob6h+JMLNgBd27sDzojTNjr8rgad70quD5MeDSQ3Nuj+TuP?=
 =?us-ascii?Q?nNdql1xf2srIp/YG5ucI51aXpCD2Hfi682A+yT/fXTikscmYkhhtJRf2TtO/?=
 =?us-ascii?Q?dfKW27E3qa0JrEHuGHHE1jFrTIx5DT+6GVJZfhwBzTkA2J45gzPNUuOQZJnV?=
 =?us-ascii?Q?sZ4lzP0Ew6czjxvA7kHf9Ub30bO1hYPVaVyjcOilt6ONk2TyoYcF68GwmemC?=
 =?us-ascii?Q?frCtJAhxA7SRpbXt3l3kM5FNqiKoGeHgNJEEQPPxwwQqJNAK6nw/G/9BgL6G?=
 =?us-ascii?Q?b7mauLlXo6UVkKHqj+DrQF5D+GFZLnpbJuU9+WdEIRhrM10ejPj5F87tkXw4?=
 =?us-ascii?Q?eVnOP9FR59Zu7yO+J7rRK+J+MeiYcqX0nV4b1o/0eYC6wbAde/zlqUxBUO6l?=
 =?us-ascii?Q?WTW01nj/rx5e1nbLV0APyy39wSc/aKo7tLQ+DdypfpjJXhb4KntQqv/YOO8g?=
 =?us-ascii?Q?d70HVoby7laLF8YkCGjnwZhim2PdIxKuHjv9UnzlVPjMPHW0G0JfXtYO1ZNY?=
 =?us-ascii?Q?D8CMxeef6vryv9QQ+Ql6AuQYbvG5bo436Ir2S+xRv3+AZqmujGcY2Pa6cA/A?=
 =?us-ascii?Q?NioXt3NFOPa5lLOJidN2LD9MagiitaeumsplpeihPyUttQ5iRseSddh9Hfks?=
 =?us-ascii?Q?ZN9HESKN4L8NmFqOIoHlMbmx2Z9zQdNJ7iw0LUbkl/rpgNkk7U2dNwcW0cpH?=
 =?us-ascii?Q?SCOehIOUPagIUT6Tk6rdSSa3bTuwxDYIxG9gz9/9RvBG25VF42g7DPGZSB48?=
 =?us-ascii?Q?+rhrxScPqvn64ROf4PV4b4TbdwZOMIMe36x1KRqwPVhMyBHtRsGfQpt1VnS9?=
 =?us-ascii?Q?DlZ3gsH5dZxM8L6EYl9lH8eGq74NhwcKoUFlf3nN8Go3DFwOM+p7bauI3+9B?=
 =?us-ascii?Q?FrIjJEJpdXBeWjFjM13oG2+Gi8VaC8R1a0QUpf1jkRhrNq9i+F5qRWRgAZXv?=
 =?us-ascii?Q?ai3hBDnbtJDbKHcHuNadBFAuvgFJuITr+7cdyIa3cx09ANmGhMb1lwQDPWcL?=
 =?us-ascii?Q?8vnVVCo0kToDskmGXzE8MVDr7aO4VQ50xXn4MSN3mwS1pKUBS3mz2DONH72s?=
 =?us-ascii?Q?rce6AtE5lf8L/gZYtDh6jWZg1RVwvqygJep4KnQ8ptMwBGZ0XsSgwXR8T7i7?=
 =?us-ascii?Q?X4dVqu+VdfyvFLnb7js1Zw9S2w/iEyKm0U8VY4NxgtT3aSVxw0+7491GVUSg?=
 =?us-ascii?Q?MIDwrXZua9aqq9JxJOujbs5Hec0F5SXX5qBmv92nd1wDCzTKkl4Nt7xWVXK4?=
 =?us-ascii?Q?Le3PLUjWgiwYAs9NfECLbnMUq9ONn/ByVVwiOHeYTbyZ7a7CO+12E4PPCqjZ?=
 =?us-ascii?Q?jRfRdDKJkBd28y5/s6l2ZzSIIERQIodXiquXnyT//F1lSokymBbVThGZiFeT?=
 =?us-ascii?Q?1ObHWQPnLBtk88g7DwqkLbO8GQ/er+eHTodBfFXeZsQics/AO3NuKo2uXHbH?=
 =?us-ascii?Q?BK2uii7FJEYjyHTEAJf4OhTa82AruqxnzRhYJk0SR5NwENU/vua6F4KerFe1?=
 =?us-ascii?Q?XVl/GArUa+G2CyC7XCwjfyAbpOQ154ZiNPp1crop7UlsybgwCa7RJWZtNay+?=
 =?us-ascii?Q?LvzP9UCma+LwF1lR5+LmzoeUhvQivopEMZU5E21EYFp+0Zhp78rE+CVXWz7r?=
 =?us-ascii?Q?4lU5m8Ewxx2z0ZA8Ca49kzPxcp/ZUXXUfwUf1+rSi4Jnwiiv6vX4qPzdqEZ7?=
 =?us-ascii?Q?W5FWAAZOxLYehdId6kTNQFaqusqrhv7nzOV4DZESYKuYITHnI6xSwudOvAve?=
 =?us-ascii?Q?zCDt0h/dtA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf49ccce-aa07-4d10-5bf2-08deb70ae597
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 07:30:56.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ih0yT6bfdBPjH0GYTT0WihNLVL1zqFqKV7q9rHzm5hJqllBBOuSRmwRi0H92XYJdmE1OhJ40cQbWnhW+B/YvgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_003100_062835_D6BF4C34 
X-CRM114-Status: GOOD (  20.00  )
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

Add an arm64 cache maintenance backend that discovers SMCCC cache
clean+invalidate support, queries attributes, handles transient BUSY and
RATE_LIMITED responses with bounded retries, and registers with the generic
cache coherency framework.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
---
 MAINTAINERS                 |   1 +
 arch/arm64/mm/Makefile      |   1 +
 arch/arm64/mm/cache_maint.c | 180 ++++++++++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+)
 create mode 100644 arch/arm64/mm/cache_maint.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..33c35f8e6e40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25383,6 +25383,7 @@ M:	Jonathan Cameron <jic23@kernel.org>
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/cache/
+F:	arch/arm64/mm/cache_maint.c
 F:	drivers/cache
 F:	include/linux/cache_coherency.h
 F:	lib/cache_maint.c
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index c26489cf96cd..b247dc5dfd45 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd-asm.o
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
 obj-$(CONFIG_ARM64_MTE)		+= mteswap.o
 obj-$(CONFIG_ARM64_GCS)		+= gcs.o
+obj-$(CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION) += cache_maint.o
 KASAN_SANITIZE_physaddr.o	+= n
 
 obj-$(CONFIG_KASAN)		+= kasan_init.o
diff --git a/arch/arm64/mm/cache_maint.c b/arch/arm64/mm/cache_maint.c
new file mode 100644
index 000000000000..ea7dd30d5dfa
--- /dev/null
+++ b/arch/arm64/mm/cache_maint.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 NVIDIA Corporation
+ *
+ * Arm64 cache maintenance provider using SMCCC cache clean+invalidate calls.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/cache_coherency.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/nmi.h>
+
+#define SMCCC_CACHE_MAX_RETRIES		5
+#define SMCCC_CACHE_MAX_DELAY_US	20000
+
+/* DEN0028 v1.7: bit[0] == 1 means implementation flushes all caches globally */
+#define SMCCC_CACHE_ATTR_GLOBAL_OP	BIT(0)
+
+struct arm64_smccc_cache {
+	/* Must be first member */
+	struct cache_coherency_ops_inst cci;
+	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
+	u32 latency_us;
+	u32 rate_limit;
+	bool global_op;
+	u64 global_flush_gen;
+};
+
+static struct arm64_smccc_cache *arm64_smccc_cache;
+
+static int smccc_cache_status_to_errno(s32 status)
+{
+	switch (status) {
+	case SMCCC_RET_SUCCESS:
+		return 0;
+	case SMCCC_RET_NOT_SUPPORTED:
+	case SMCCC_RET_NOT_REQUIRED:
+		return -EOPNOTSUPP;
+	case SMCCC_RET_INVALID_PARAMETER:
+		return -EINVAL;
+	case SMCCC_RET_RATE_LIMITED:
+		return -EAGAIN;
+	case SMCCC_RET_BUSY:
+		return -EBUSY;
+	default:
+		return -EIO;
+	}
+}
+
+static int smccc_cache_delay_us(const struct arm64_smccc_cache *cache)
+{
+	u64 delay_us = 0;
+
+	if (cache->rate_limit)
+		delay_us = DIV_ROUND_UP_ULL(USEC_PER_SEC, cache->rate_limit);
+
+	if (cache->latency_us)
+		delay_us = max_t(u64, delay_us, cache->latency_us);
+
+	if (!delay_us)
+		delay_us = 1000;
+
+	return min_t(u64, delay_us, SMCCC_CACHE_MAX_DELAY_US);
+}
+
+static int arm64_smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
+				   struct cc_inval_params *invp)
+{
+	struct arm64_smccc_cache *cache =
+		container_of(cci, struct arm64_smccc_cache, cci);
+	struct arm_smccc_res res = {};
+	int delay_us = smccc_cache_delay_us(cache);
+	u64 gen = 0;
+	s32 status;
+	int ret;
+	int i;
+
+	if (!invp->size)
+		return -EINVAL;
+
+	if (cache->global_op)
+		gen = READ_ONCE(cache->global_flush_gen);
+
+	guard(mutex)(&cache->lock);
+
+	/*
+	 * If firmware reports a global operation type, a successful operation
+	 * covers every request that was already waiting behind it. Skip if the
+	 * generation advanced while this request was waiting to enter the
+	 * serialized firmware call path.
+	 */
+	if (cache->global_op && gen != READ_ONCE(cache->global_flush_gen))
+		return 0;
+
+	for (i = 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {
+		/* Long firmware operations can trigger watchdog checks. */
+		touch_nmi_watchdog();
+
+		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
+				     invp->addr, invp->size, 0UL, &res);
+		status = (s32)res.a0;
+		ret = smccc_cache_status_to_errno(status);
+		if (!ret) {
+			if (cache->global_op) {
+				WRITE_ONCE(cache->global_flush_gen,
+					   cache->global_flush_gen + 1);
+			}
+			return 0;
+		}
+
+		if (ret != -EBUSY && ret != -EAGAIN)
+			return ret;
+
+		usleep_range(delay_us, delay_us + 100);
+	}
+
+	return -EBUSY;
+}
+
+static const struct cache_coherency_ops arm64_smccc_cache_ops = {
+	.wbinv = arm64_smccc_cache_wbinv,
+};
+
+static int __init arm64_smccc_cache_init(void)
+{
+	struct arm_smccc_res res = {};
+	s32 status;
+	int ret;
+
+	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_1)
+		return -ENODEV;
+
+	if (arm_smccc_1_1_get_conduit() == SMCCC_CONDUIT_NONE)
+		return -ENODEV;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
+			     ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION, &res);
+	status = (s32)res.a0;
+	if (status < 0)
+		return -ENODEV;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
+			     ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES, &res);
+	status = (s32)res.a0;
+	if (status < 0)
+		return -ENODEV;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES, &res);
+	status = (s32)res.a0;
+	if (status)
+		return -ENODEV;
+
+	arm64_smccc_cache =
+		cache_coherency_ops_instance_alloc(&arm64_smccc_cache_ops,
+						   struct arm64_smccc_cache,
+						   cci);
+	if (!arm64_smccc_cache)
+		return -ENOMEM;
+
+	mutex_init(&arm64_smccc_cache->lock);
+	arm64_smccc_cache->latency_us = lower_32_bits(res.a2);
+	arm64_smccc_cache->rate_limit = lower_32_bits(res.a3);
+	arm64_smccc_cache->global_op = !!(res.a1 & SMCCC_CACHE_ATTR_GLOBAL_OP);
+
+	ret = cache_coherency_ops_instance_register(&arm64_smccc_cache->cci);
+	if (ret) {
+		cache_coherency_ops_instance_put(&arm64_smccc_cache->cci);
+		arm64_smccc_cache = NULL;
+		return ret;
+	}
+
+	pr_info("SMCCC cache clean+invalidate provider registered\n");
+	return 0;
+}
+arch_initcall(arm64_smccc_cache_init);
-- 
2.43.0

