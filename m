Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9189CDE009
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Lm0FmRmJwYMFqTF7L01DMOFh2+fpPkOCpfZJUL/e4w=; b=0i2q7Z0AdBPcLwvUdb+q2NHPpe
	CNT9lJClRl2CRP11zgnMcsXV9USU+IWdRoirrIPJMqSn0SHbex/6yK4Ak9u2APMuDt9Pn2fIRUAv8
	q3Xh9Tq4pxeb+vgCXQlPPxg5TtfFLKk/4G2H1UURfVMhYPG4oobj1H/aMtNbxM78R3JFyw65z8KdT
	PzRMcjGjs4I/hcjZ4fZSzEnq8Vk6ZJq6SQktqWIXwudhy2P8qBGAi0Zc+x76ebIzrno7fM9Rn7YaI
	qkAmEWl+GzxoWQvWlxo4OMw8svceCNxSEB5TrVZ3uKqVdvFFodyFvD+oP2dPOXQW5LVrucARDQ9nq
	Rs/6+tQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcolJ-00000009fzF-3eGM;
	Thu, 25 Jun 2026 18:25:17 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcolG-00000009fyg-3uoY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 18:25:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7L8WfebuopHq0DdnSOikQWz3aG9xzGaZx7YIFPp5BLxQ89sL8t4aqJRpVE4GmBxWxAxmMAV74icBJdB5awKZT5G8vc/omXxvUiUEFfr3A3/gixlX7UL5IEZ6fmIfMXXkLM5z9QkyEtsGLcwcms4d4PN+jjBdj9eNBjsZseLWoM9AGHpb5CUtyK/2i483cZkum4IR+gbq3ZR+/Qwwx5zKcVBl0rU9kQnmWywWsq1b7Kk+2rZUEemwCZStuLq/+8shqRQRmL1P4rqyi8WrISut+vlKYIIdQRJUiF66gBgEyJGNtR+2gjC5hx+p9kYc6FjoS3E11z9hletag8t4nWCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Lm0FmRmJwYMFqTF7L01DMOFh2+fpPkOCpfZJUL/e4w=;
 b=r21v71X4U85LeIzaR3svyqzjwKSKqZX8sk43ggXNVoY19EAKxW1ZxnpmS2SU20ZVY15+hslbZqMqPYOnr1CJnsiLkSWk+s1x5UWU1aqS7soB4IHSXimMNlRlm8X3tWkQgMRfG2EmbmiiRRGfLIkV2NH0EaQEqv/PCNsXAU2/xf/FrzMSssATHMSoGoB1LafOqAbon1eLmz0jKZww9giuH2d0cbaQpmBlUe/yuZ4ADGMb1jaaMS/zVPo+xgvirSdRt3f2hPerBm0C0UthXcbIGqeGjzPPN1PKtWcIDz0pCIAQ5IbjzXNRXJlvB30sLa4yLd2BTr7owYhFO6BzBf7IeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Lm0FmRmJwYMFqTF7L01DMOFh2+fpPkOCpfZJUL/e4w=;
 b=hJOuPZIsEAP+cXR/p2TSRaq3X+wFr7tJyklCppoJoNdA2S8EFgcC32hsvMQz7ZtqhywH8CPbNMqwjIwg+Iau7zXymMaM6zbVLAMcZUKRujbXcv1GE1JKciX3jiGn3g9xgX0cj8/ddFaIOaWmjNuZXAD1rLfSYe27Yh4aKzCNTcLHdA6NpcZCCsHDdEMxnB61lwu3HvGhlU/N1m7wjhhssGHg71MD8vPBraZjKH/fFfRzf73QKm2jmRkyJJvMPpBxwN6xMvs/oxLMbxR1esV81Ifa6j5w1XiICP3vJyRlEhiPRGzvzBDovxu5siKWWGhUsloHL6kRffVuirS1MXXMGw==
Received: from PH8P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::6)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 18:25:03 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::a3) by PH8P222CA0021.outlook.office365.com
 (2603:10b6:510:2d7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Thu,
 25 Jun 2026 18:25:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 18:25:02 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 25 Jun
 2026 11:24:44 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 25 Jun 2026 11:24:44 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Jun 2026 11:24:43 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <linux-arm-kernel@lists.infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>
Subject: [PATCH v4 0/2] arm64: errata: NVIDIA Olympus device store/load ordering
Date: Thu, 25 Jun 2026 13:24:23 -0500
Message-ID: <20260625182425.3194066-1-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: fb05c369-b34c-45a8-0eee-08ded2e7129e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: kEpZ6GqsxaJsCHiu8QahcNROr2Z5pw+fnU//s+3upVQ48Y95XvXJ2I6ap1wP0cGO6Do4E33UpXlTNP8RZanhYdOedY+kn4O4RcVlkJG2bk82E8UYLvHL2A9n3pINvwX4MzWcY4ai69OhxB+JkK7YW3WCI5lT3gKxYeVZB9R2XUwaABWcznF5B1OIyG/Pk+5uLBXobfTtw4woEfAPIIR9xERGnJnytrVNrGAcFwhc3/AC0RN3UCs3dKbRsVylZjSfyGKbaBDO/evtNREY6jZYATi6i0bfYr50iIJvbS48M0BXp53pm2oNxT/S3Z8Czg1T5+qYYWZt456kqyE557K5nnaHP1uveTQLrFS1OA53sYGkr5pmrWCzWc2qrIOnDI5JeqUOSFInWRPu52kC0wtG7rpNQdQVD7dhQII0xPuocS+6t+f4qZSFTooKaoo7grhmiyoYLPVqhqqnMeVT+qMK8me45YADTlFzmh3JE5e/P64yXjEFk2BXUBACKDZhNU2MsmGzqVf4ZE+gGqtfB3/pnDZuavy84Z47BnOxHmAUijwR5ASSnesAJfhsmqKYwbQQUyrHqjBPtaWnO31Ltzy9RanWcbd6E8N24gu0fbyuK34drjFC4SxY2wTBvWIQNVK7SmqCml28HhmdDZYRZIDoqxdgPNuMRVmN2bvzrbRdhBX57pa0/+g5HePQWqpdb/MHVysGG46oKnN6nI/F5lJ0QA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YIoa5ELzqwyOeq6/hb5PO+f7o3HqKRGWYJtaNd2PnJx6gpof/+uC3q0TL+bLpHiY79bU8vujXyBS1EtpPlWjosUfCMpOJrWsh6Hm9tX7fbo8A+wqyjRSsMG+T3i0iGgtUbfJ8mTrP6UZmJWU9FQ+8AMlYOnEfx7BENP/gZK2yI/6d66s1+/yUMecwuvUZ9la5sun7TcPwDAXvJRxcq2yA++HWEA32i1nPTnX/G+OTVf1fdnmIndRXQJub8iksuENL1mKoe2C1LtkZjO5RCVfCRe7vDc1TlDnaq7LrPSG27vW/2zfewyZMB+xfEG5Z+tpCEiBiR+G5lHvl5mb221pnBk9cs3tHv8/peR35dDyXnFOciN9LC8mJwIujrhtfL+wU1HHfmwf4M2p5PQWo98Q9u1/Xln+9iyYiBvj+D6GfUeV9plxAP3jAze2G1LloZ+Q
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 18:25:02.3405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb05c369-b34c-45a8-0eee-08ded2e7129e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_112514_976096_8AB5C51E 
X-CRM114-Status: GOOD (  15.70  )
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

This series works around the NVIDIA Olympus device store/load ordering
erratum (T410-OLY-1027): a Device-nGnR* load can be observed by a
peripheral before an older, non-overlapping Device-nGnR* store to the
same peripheral, breaking the program order that drivers rely on for
MMIO and potentially leaving a device in an incorrect state.

Patch 1 adds the workaround. It promotes the raw MMIO store helpers
(__raw_writeb/w/l/q, and therefore writel()/writel_relaxed()) to
store-release on affected CPUs, and promotes the trailing DGH of the
write-combining __iowrite{32,64}_copy() helpers to dmb osh. Everything is
gated on a new ARM64_WORKAROUND_DEVICE_STORE_RELEASE cpucap and patched
in only on affected parts, so it is a no-op elsewhere.

Patch 2 provides arm64 memset_io()/memcpy_toio(). The generic versions
are built on __raw_write*(), so patch 1 would promote every store in a
block to a store-release; as each STLR drains the write-combining buffer,
block MMIO becomes O(n) store-releases. The arm64 versions emit plain
STR in the loop and order the whole block with a single trailing dmb osh,
keeping block MMIO at one-barrier cost.

Performance: NVIDIA Olympus, write-combining MMIO to a device BAR, single
PE pinned; per-call cost in ns. Consecutive writes ping-pong between two
buffers so repeated stores are not coalesced. iowrite64/iowrite32 =
__iowrite{64,32}_copy().

Table 1 - workaround off (CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM=n)
+-------+-----------+-----------+-----------+-------------+
|  size | iowrite64 | iowrite32 | memset_io | memcpy_toio |
+-------+-----------+-----------+-----------+-------------+
|    8B |   67.9 ns |   67.8 ns |    3.6 ns |    3.6 ns   |
|   16B |   67.9 ns |   67.8 ns |    4.0 ns |    4.0 ns   |
|   32B |   67.9 ns |   67.9 ns |    4.6 ns |    4.6 ns   |
|   64B |   69.1 ns |   69.1 ns |   69.1 ns |   69.0 ns   |
|  128B |  138.3 ns |  138.3 ns |  138.4 ns |  138.3 ns   |
|  256B |  276.6 ns |  276.6 ns |  276.6 ns |  276.7 ns   |
|  512B |  276.6 ns |  276.5 ns |  276.6 ns |  276.6 ns   |
|   1KB |  276.6 ns |  278.4 ns |  276.6 ns |  276.6 ns   |
|   2KB |  278.4 ns |  278.4 ns |  275.9 ns |  276.6 ns   |
|   4KB |  365.7 ns |  365.7 ns |  365.7 ns |  365.7 ns   |
+-------+-----------+-----------+-----------+-------------+
relaxed/no-flush: memset_io()/memcpy_toio() issue plain stores with no
trailing dgh() or barrier, unlike __iowrite*_copy() which ends with dgh().

Table 2 - workaround on, arm64 memset_io/memcpy_toio (this series)
+-------+-----------+-----------+-----------+-------------+
|  size | iowrite64 | iowrite32 | memset_io | memcpy_toio |
+-------+-----------+-----------+-----------+-------------+
|    8B |  231.6 ns |  231.6 ns |  232.4 ns |  232.4 ns   |
|   16B |  231.7 ns |  231.9 ns |  232.7 ns |  232.6 ns   |
|   32B |  231.9 ns |  232.7 ns |  232.9 ns |  232.9 ns   |
|   64B |  232.7 ns |  235.0 ns |  233.7 ns |  233.6 ns   |
|  128B |  233.6 ns |  235.8 ns |  234.4 ns |  234.3 ns   |
|  256B |  237.7 ns |  276.8 ns |  264.0 ns |  276.7 ns   |
|  512B |  237.7 ns |  277.1 ns |  238.1 ns |  277.6 ns   |
|   1KB |  253.7 ns |  279.3 ns |  276.1 ns |  294.1 ns   |
|   2KB |  295.0 ns |  318.7 ns |  288.5 ns |  308.3 ns   |
|   4KB |  365.9 ns |  381.4 ns |  365.7 ns |  381.3 ns   |
+-------+-----------+-----------+-----------+-------------+
all four helpers end with a single trailing barrier (dmb osh).

Table 3 - workaround on, generic per-store memset_io/memcpy_toio
+-------+-----------+-----------+-------------+--------------+
|  size | iowrite64 | iowrite32 |   memset_io |  memcpy_toio |
+-------+-----------+-----------+-------------+--------------+
|    8B |  231.6 ns |  231.6 ns |    229.0 ns |    229.0 ns  |
|   16B |  231.7 ns |  231.9 ns |    458.4 ns |    458.5 ns  |
|   32B |  231.9 ns |  232.7 ns |    917.4 ns |    917.5 ns  |
|   64B |  232.7 ns |  234.8 ns |   1835.4 ns |   1835.5 ns  |
|  128B |  233.6 ns |  235.8 ns |   3670.9 ns |   3670.8 ns  |
|  256B |  237.7 ns |  276.7 ns |   7341.6 ns |   7341.6 ns  |
|  512B |  237.7 ns |  279.4 ns |  14001.4 ns |  14001.3 ns  |
|   1KB |  253.7 ns |  279.1 ns |  28631.5 ns |  28631.8 ns  |
|   2KB |  279.4 ns |  317.9 ns |  57276.3 ns |  57275.2 ns  |
|   4KB |  365.7 ns |  381.5 ns | 114564.4 ns | 114563.6 ns  |
+-------+-----------+-----------+-------------+--------------+
the generic memset_io()/memcpy_toio() build on __raw_write*(), which the
workaround promotes to store-release, so every store is individually
ordered - hence O(n) in the store count.

Tables 2 and 3 show why patch 2 is needed: the generic per-store block
writers collapse to O(n) under the workaround (4KB ~314x slower, ~115 us
vs ~366 ns), while the arm64 versions stay flat at one-barrier cost.

Changes since v3:
  - Split the workaround into two patches: the erratum fix (1/2) and the
    arm64 memset_io()/memcpy_toio() block writers (2/2).
  - Reworked the raw MMIO write helpers to use a direct base-register
    str*/stlr* alternative sequence instead of a per-write static branch.
  - Covered the write-combining __iowrite{32,64}_copy() path by patching
    dgh() to dmb osh on affected CPUs, keeping the contiguous STR groups
    and the ordering barrier outside the copy loop; the single-element
    case now uses a plain str* as well.
  - Added arm64 memset_io()/memcpy_toio() so the byte/word block writers
    take one trailing dmb osh instead of a per-store store-release.
  - Updated the commit messages to describe the offset-addressing
    trade-off.

Changes since v2:
  - Reworked the raw MMIO write helpers so unaffected CPUs keep the
    existing offset-addressed STR sequence, while affected CPUs use the
    base-register STLR path.
  - Updated the commit message to match the code changes.
  - Rebased on top of the arm64 for-next/errata branch:
    https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/errata

Changes since v1:
  - Updated the commit message based on feedback from Vladimir Murzin.

Shanker Donthineni (2):
  arm64: errata: Workaround NVIDIA Olympus device store/load ordering
  arm64: io: apply the device store-release workaround once per block
    write

 Documentation/arch/arm64/silicon-errata.rst |  2 +
 arch/arm64/Kconfig                          | 25 +++++++++
 arch/arm64/include/asm/barrier.h            |  4 +-
 arch/arm64/include/asm/io.h                 | 36 +++++++++----
 arch/arm64/kernel/cpu_errata.c              |  8 +++
 arch/arm64/kernel/io.c                      | 82 +++++++++++++++++++++++++++++
 arch/arm64/tools/cpucaps                    |  1 +
 7 files changed, 146 insertions(+), 12 deletions(-)

-- 
2.54.0.windows.1


