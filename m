Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B30CD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXQ/UsUPijNWBGsmNjJQV9LYCZ6bEK+Ofrw1Irp3KGw=; b=uwc4dbc5jcXl+tgQL7wClP+HUH
	pe/mKnc83OuOP93R+3PaZnpRpu4sWJZpGp7uxCmwVTKjjhnkTUO1lyFMliJOX+DAWXabIiwOKmX+q
	QoaRZWm/kxCmlv57l3S8HBJt1jHUEaGTpgvAyFWZg4IqVxxGWAQRG2+lgGRigQLkPWYiypxZvyX5p
	WxtssONLwzZ5AIDjge1yHb1Fe55U11gSQA12T3yoj3duEWWykiy7zGp99kd2umChMSESddL16FsOs
	HMqOdpBGpqIsh+SsP6Ou2XxPkQkQwWHvxwXemGxanIUUbE38hHCDurSWn02932+ctF6CMB4xCVKki
	X9U+31LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKNy-0000000CYSh-2jNi;
	Tue, 02 Jun 2026 08:22:07 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKNv-0000000CYQZ-2bjl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:22:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOdHYPTqmjSchGysYT/hLXFqDlyL8YttcicDeXpj5L1yR/qwXb7eJBIVvyYz1EZ0nq7A0F02V+tZm//KNOVbcLk8G1NkZ4EXGxtLCsDq5wvy6XcLNGEAeWsAcbvH0Eyycvh7N4EDrJGf2ryTomMhwDtTk7SrxvNjZ8pbN6zraklAqfXgedTx6IkiZvAzlrOCSUlzySwcFSbXTO+ciWt1skZNu9vEsKLRab2T05tq5Qx4tozI9Q7QcmE2jI7AgdoIjkonjMMEkZ8T/qE0nOomE4JhKwr9/RJXWk3/rPDKHSDBlLLXWT3gXeFpXzuO5Hp5+dleohbxEYBisTr4CeohsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXQ/UsUPijNWBGsmNjJQV9LYCZ6bEK+Ofrw1Irp3KGw=;
 b=mYs5sNIRal4zYiz3mgIyMv+YyLz/pE7SmR4NhpsqJeXEQwP+Sb2I/W22VfvoXSnFW3tYTLUSGA4tXC5GYCosMzfVYJUuq+4UAsbKkF1QKSM/P1qUIc44qUU6p+NAz9RIxHcGDurY3zhuOnpGHmlFVnLPG8hZZxJVGbRqa6j3iEsWTXxZ0Me7LYdTUC/D/U4v565uxrr8CfeHdqEy3aIQAU0z//9UhMv/5J7KYxt6AN6VEgFT8NNWLn5tNLaTS/GL3v+V3ZenDRdfPAca4/iBmjUfccDVSl3ixjtQT3mKJ1xldvpXOXZJpHPUXFZB0qWlYoLtE4hW0upBMv3N+2hSag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXQ/UsUPijNWBGsmNjJQV9LYCZ6bEK+Ofrw1Irp3KGw=;
 b=cYZeQVwUyay99LKs6n7nAMUKPd9CfmGBiMmrHPyGWavlE9q4dwEEu65/y5LH2+2bI0zeiISVDpAoI3+x+1oYJjOHHs78wTxiL48u+i+KvSGWd1+yTeoi9nlPA146b8kDyzRVt200EQqeCGMmVzKJ5nPf2qTqG5qU9Gra324h6o+7vMYDQdeYmvoIxZ8QvRlPr/eYiVIXE63B0SQr/PYdFgMUJI7+Z/daQ4312g2tP4prlfBRulm3r2Iibc1nL/XT2bZS6ph58zeZScy7gXebuCKXnSYjFBe9Vmo5SlIIBsJf0SoSCyGa0gIn1YAxRcl9KHTH2EmVrk0C0XLflG/1kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 08:21:59 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%6]) with mapi id 15.21.0071.014; Tue, 2 Jun 2026
 08:21:59 +0000
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
Subject: [PATCH v1 2/2] cache: add SMCCC-backed cache invalidate provider
Date: Tue,  2 Jun 2026 08:21:45 +0000
Message-ID: <20260602082145.404939-3-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602082145.404939-1-smadhavan@nvidia.com>
References: <20260602082145.404939-1-smadhavan@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To DS7PR12MB9474.namprd12.prod.outlook.com
 (2603:10b6:8:252::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9474:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: dfdce685-eb33-48f7-4b56-08dec0800433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|6133799003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PpllErVoLLXtkK1EGB3xNmPyNqom8vVF/CgAKdemIwC7iiosQ5vveOby6/NygKoCnBYdwOlzGnqDnC8WMbhsxv0mjdCIaDPXF37CCKzvm9ag9lvhVuRndKujyk/u/bDpn22fW5uKItk1CfME3lGxa0pVHSfobPgKxFXjdI45mqrDfkIoqaWkxYzuACj3ydmypELivZjDpPeP/LAx2mw+zvnr/71Bl8553iOX9xVF8FEW4wrlR7+2DRZ8E8d+hKnl5VFc7Bvp1adsi5JJik79FSJ7TWjQhro4o7SL5TPkbBwhJQkWOy6hTJot0zoydMuwGhNnIeBlCucRta02tJyqUO+knFlXgLoKvql3qrLAE9wR8W2abf/FpTB5cVce79Hjx6xHdeyb9PfGuVnJJjIC/u5hmmW4sV6aPRm9iQ8QFHlcngEHWDqj4oYx+BBJXohQwDIin/faFCukJzYCa6VmZvqCG47rUMQFSCivehMWxe84dgilnEx2fNhs/WhlsR0Qies9Avx7vnQPFZEppD9075IcgK9W9CU+pwrSp9TRxqzdNHfoTGzIk0uk05I/2Pcg2grlUzfhPu3V1h/0btbjWkrk5DDt8T2HeSMX3GGWymHMeUkOUWeqbPnI7vriZULg8i5mrlrQTUvagsrWCDDpw8HBxR1bwEL+7vNcji/mVVCJa3CLz0PjZ5RWWLbU7HY4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(6133799003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZCimtRdYFgbGURq3JIM8Y3UJ2H4dFjcf//WusfWLnhCoLa14/QmJNX1Xn4XR?=
 =?us-ascii?Q?/7d6EipQt3dr8GgdOOsfrHjQRYLOa+dCngZFaS1DIzngQrx/Fpt+rRLDjTIc?=
 =?us-ascii?Q?MAvwSsuxlwuItUz/Wh4jdwuCscSB6shal8OUEX/d6+PuAhTh6yDrznAuV0PO?=
 =?us-ascii?Q?lC9Z0jTszHX/UKVftF4v6tbxNe/et1q1sAFQ5nGoO/qy+72Oz5LI9Z/IjmY2?=
 =?us-ascii?Q?SLM7218TUaaudDOzb/naNiEYD/jLR1/DXWGw5SaJFu7Ag6opGg/DVcqKCcr8?=
 =?us-ascii?Q?+vfDWkCZnMvFMbJPcZP0yQWAwgNZb0gUvBqGuZrBCGqBGTu96RHbN6XdcNMt?=
 =?us-ascii?Q?nzLXcBxsBqdkvOBJ4U/yevI4EoE/yvB/jxg/wSQJB96DhhilyLL/uMBwsm8r?=
 =?us-ascii?Q?DSs0/8K9TsGtIjWc4+kJNBo3HtvCeT0TeXKHNkYBsr7KpRbK5US5Q1uuCPpf?=
 =?us-ascii?Q?2l7SIQL2q1s3xw1YsprXMDcNEqky7OB7LTg7m8LdtFaF3+pFAEgD0AT1mGSv?=
 =?us-ascii?Q?hN4LbP4Y98dREoPCI1l95UBlIODVUu15VwdC+BOvIB1Tgi8qk71xf8KL4KlN?=
 =?us-ascii?Q?rSHidSYPYF2wdHp4YCB+cmDzrpBwK/XsDhPl23Cu1PGfZond8V0PmjxEWS5K?=
 =?us-ascii?Q?5+2EpaDO3iFmu0z8eICLO9vgGvzodbQqU5PAT4dskiIhl5ZtuXTaQ4Qtdz3p?=
 =?us-ascii?Q?nO6yXJJ3d5mqRKFOJPaUSDKahSGnQdmxX9do86ejX4XFRlknBE8fDwUKgXqz?=
 =?us-ascii?Q?L2YbdYGuCaYRePU9+XchsBs+eiiJl6bQvjH4FOEOMkqCwvQxLSQoI346zxyt?=
 =?us-ascii?Q?vkmvq7gez5HOz0TPMGsl4aBPJkT+abCIuHD7Q5CDR3jKKiHBe4uFnoZX84Yu?=
 =?us-ascii?Q?u8LtO22IDf1GECxqkt1n9jeaIUkwO/rP87FOIS9HWNhxXMSFfVWDE2U0QTe8?=
 =?us-ascii?Q?1FyowM9APSdIiAfeAcPkU1lni8CZLod5n0NH1k8udQfhNfT8DSoNqRKObF/X?=
 =?us-ascii?Q?MTvewj+dI6en6+ZGvQOuq88lA9jkB4CEfPmn1v1aPLvdBTBbNpYTZIDGgMtb?=
 =?us-ascii?Q?lCYK1ZCbUWQFBHEr13DFJkNCSSV37tTl3QJQEwNkMfTPekR1W/oXwHrYf+o5?=
 =?us-ascii?Q?rUgr/0lbwCwVhWH241a2XGFQ56n3RvaRxHRc8oEwAKyOu87rkjr1PhQuAwLL?=
 =?us-ascii?Q?QdNJTMeKtEcNuLvyPMbNlbvGVOV1tbF++cqJ7YaKn8R9ftcObj8/fZRYh8J9?=
 =?us-ascii?Q?cif5WkEes+802VbA5IBqzNXhjyhbw8MPf4oHlin3HWNrbRdF1PMKZv8rWQPW?=
 =?us-ascii?Q?FTVfhFYaUdnFig1LQ7dpR7iDio4ZrIH+UQCA9GLXKxo8fAQs34aWxpPJPvx5?=
 =?us-ascii?Q?2kr3GgLX5NiH+6Q4HJwODf+d3PILSHaTbHUQB01h7oY43YyTkb0Wtxg+c6Nk?=
 =?us-ascii?Q?P80NlgWCJxIscCI7CbkXcc8FBLloRBh+fodcx12vB10vLuXz2pLkkMkMlx18?=
 =?us-ascii?Q?9x4b+wo23PDRJZ6h0EL4Artn9ZZnGcR09xMyvGIMCcFHXDa5a7Y2Px0/ffpR?=
 =?us-ascii?Q?sPLRwZGT8aGI0ISp6YRXKy7z1KS4ZmfngxiqIjkOJj32s0wah8ilvnagOT+a?=
 =?us-ascii?Q?m37j+Y8UmXVbkkiALL4PJVydnC+2V9ZRCk/cACzAdpB1gBYOguag0lOKKReb?=
 =?us-ascii?Q?lYrsWtsmeNYqw019EkmOEcmuT6Jp9BYyZX5cMvYw3q8seqFCMBjPFyB00eGQ?=
 =?us-ascii?Q?i24ca5ocug=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdce685-eb33-48f7-4b56-08dec0800433
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:21:59.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekmGgQ70ajC7HetRQ4GhTKosSAmC9uKzIWwULFW/x1n1P743rOlU/ZGbYn38OClnCdcYZUNfpZtDErVs+tAKaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_012203_679191_ED3F9D95 
X-CRM114-Status: GOOD (  21.72  )
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

Add a cache maintenance provider for the Arm SMCCC cache clean+invalidate
interface.

The provider discovers SMCCC support and attributes at init time,
serializes firmware calls, handles transient BUSY and RATE_LIMITED
responses with bounded retries, and registers with the generic cache
coherency framework used by memregion callers.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
---
 drivers/cache/Kconfig           |  11 +++
 drivers/cache/Makefile          |   1 +
 drivers/cache/arm_smccc_cache.c | 160 ++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/cache/arm_smccc_cache.c

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 1518449d47b5..5d7ef3d15979 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -42,6 +42,17 @@ menuconfig CACHEMAINT_FOR_HOTPLUG
 
 if CACHEMAINT_FOR_HOTPLUG
 
+config ARM_SMCCC_CACHE
+	bool "Arm SMCCC cache maintenance provider"
+	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
+	help
+	  Enable support for the Arm SMCCC cache clean+invalidate
+	  interface as a provider for memory hotplug-like cache
+	  maintenance operations.
+	  The provider registers only when firmware advertises the
+	  SMCCC calls and attributes, so systems without firmware support
+	  continue without a registered provider.
+
 config HISI_SOC_HHA
 	tristate "HiSilicon Hydra Home Agent (HHA) device driver"
 	depends on (ARM64 && ACPI) || COMPILE_TEST
diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index b3362b15d6c1..6d91085aafe4 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
 obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
 obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
 
+obj-$(CONFIG_ARM_SMCCC_CACHE)		+= arm_smccc_cache.o
 obj-$(CONFIG_HISI_SOC_HHA)		+= hisi_soc_hha.o
diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_cache.c
new file mode 100644
index 000000000000..ff6bca91a1a1
--- /dev/null
+++ b/drivers/cache/arm_smccc_cache.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 NVIDIA Corporation
+ *
+ * Arm SMCCC cache maintenance provider using cache clean+invalidate calls.
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
+#define SMCCC_CACHE_DEFAULT_DELAY_US	1000UL
+#define SMCCC_CACHE_MAX_DELAY_US	20000UL
+
+struct smccc_cache {
+	/* Must be first member */
+	struct cache_coherency_ops_inst cci;
+	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
+	u32 latency_us;
+	u32 rate_limit;
+};
+
+static int smccc_cache_status_to_errno(s32 status)
+{
+	switch (status) {
+	case SMCCC_RET_SUCCESS:
+		return 0;
+	case SMCCC_RET_NOT_SUPPORTED:
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
+static unsigned long smccc_cache_delay_us(const struct smccc_cache *cache)
+{
+	unsigned long delay_us = 0;
+
+	if (cache->rate_limit)
+		delay_us = DIV_ROUND_UP_ULL(USEC_PER_SEC, cache->rate_limit);
+
+	if (cache->latency_us)
+		delay_us = max(delay_us, (unsigned long)cache->latency_us);
+
+	/*
+	 * Firmware may advertise neither a rate limit nor a latency hint; use
+	 * a small bounded backoff instead of retrying in a tight loop.
+	 */
+	if (!delay_us)
+		delay_us = SMCCC_CACHE_DEFAULT_DELAY_US;
+
+	return min(delay_us, SMCCC_CACHE_MAX_DELAY_US);
+}
+
+static int smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
+			     struct cc_inval_params *invp)
+{
+	struct smccc_cache *cache = container_of(cci, struct smccc_cache, cci);
+	struct arm_smccc_res res = {};
+	unsigned long delay_us = smccc_cache_delay_us(cache);
+	int ret;
+
+	if (!invp->size)
+		return -EINVAL;
+
+	/*
+	 * Serialize the full retry sequence. With the default bounds, a caller
+	 * may hold the mutex across up to four 20ms backoff sleeps.
+	 */
+	guard(mutex)(&cache->lock);
+
+	for (unsigned int i = 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {
+		/* Long firmware operations can trigger watchdog checks. */
+		touch_nmi_watchdog();
+
+		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
+				     invp->addr, invp->size, 0UL, &res);
+
+		ret = smccc_cache_status_to_errno((s32)res.a0);
+		if (!ret)
+			return 0;
+
+		if (ret != -EBUSY && ret != -EAGAIN)
+			return ret;
+
+		if (i + 1 == SMCCC_CACHE_MAX_RETRIES)
+			break;
+
+		fsleep(delay_us);
+	}
+
+	return -EBUSY;
+}
+
+static const struct cache_coherency_ops smccc_cache_ops = {
+	.wbinv = smccc_cache_wbinv,
+};
+
+static int __init smccc_cache_init(void)
+{
+	struct smccc_cache *cache;
+	struct arm_smccc_res res = {};
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
+	if ((s32)res.a0 < 0)
+		return -ENODEV;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
+			     ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
+			     &res);
+	if ((s32)res.a0 < 0)
+		return -ENODEV;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
+			     &res);
+	if ((s32)res.a0)
+		return -ENODEV;
+
+	cache = cache_coherency_ops_instance_alloc(&smccc_cache_ops,
+						   struct smccc_cache, cci);
+	if (!cache)
+		return -ENOMEM;
+
+	mutex_init(&cache->lock);
+	cache->latency_us = lower_32_bits(res.a2);
+	cache->rate_limit = lower_32_bits(res.a3);
+
+	ret = cache_coherency_ops_instance_register(&cache->cci);
+	if (ret) {
+		mutex_destroy(&cache->lock);
+		cache_coherency_ops_instance_put(&cache->cci);
+		return ret;
+	}
+
+	pr_info("SMCCC cache clean+invalidate provider registered\n");
+
+	return 0;
+}
+arch_initcall(smccc_cache_init);
-- 
2.43.0

