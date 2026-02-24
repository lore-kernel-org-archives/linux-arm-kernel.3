Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616E2F4BB69
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 18:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQV1RQTJtiH7rTD45KTrA4rveTljwW8J6hyuk32NW0c=; b=e3SnRgTYHGNP1qcbfexo1Kgy+e
	94eJF/l2d0/r/RLN5sEn69biPUHUMz/9XqXPGX8ZHNgeQ4qb2moOxv/ncufeGm2isqPQiTRZtjnCU
	izbewzc/Vx2mf+t5HFpL24oVj9pPbKoTxnD24vxlZfDWGm0O5KRPTK2JlI/HN6zzx2f5rRKUaOl8t
	4Xc29vf2h4tAzv1t3THBH40I0hYyhFTHQ6rNxbCjITO6to1yiM+pggPnYT4fFFDbA8IeTMk2wk/Di
	5AUjaikSXsC82oEMQR1DjquzLMcfZAT+3lOy0mBVO0yPZaB0oau4GuoAqaEi8VkQGvkVTjYWFtrIC
	a0etpCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwiu-00000002ahS-0nA5;
	Tue, 24 Feb 2026 18:01:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwip-00000002acP-27My
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 18:01:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D4881595;
	Tue, 24 Feb 2026 10:01:16 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B41E3F59E;
	Tue, 24 Feb 2026 10:01:17 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v5 41/41] arm64: mpam: Add initial MPAM documentation
Date: Tue, 24 Feb 2026 17:57:20 +0000
Message-ID: <20260224175720.2663924-42-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_100123_688019_51BE14FE 
X-CRM114-Status: GOOD (  23.66  )
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

MPAM (Memory Partitioning and Monitoring) is now exposed to user-space via
resctrl. Add some documentation so the user knows what features to expect.

Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Signed-off-by: James Morse <james.morse@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes by Ben:
Some tidying, update for current heuristics

Changes from v4:
Fix unusual indentation
---
 Documentation/arch/arm64/index.rst |  1 +
 Documentation/arch/arm64/mpam.rst  | 94 ++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/arch/arm64/mpam.rst

diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
index af52edc8c0ac..98052b4ef4a1 100644
--- a/Documentation/arch/arm64/index.rst
+++ b/Documentation/arch/arm64/index.rst
@@ -23,6 +23,7 @@ ARM64 Architecture
     memory
     memory-tagging-extension
     mops
+    mpam
     perf
     pointer-authentication
     ptdump
diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
new file mode 100644
index 000000000000..6dc3de54ec9a
--- /dev/null
+++ b/Documentation/arch/arm64/mpam.rst
@@ -0,0 +1,94 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====
+MPAM
+====
+
+What is MPAM
+============
+MPAM (Memory Partitioning and Monitoring) is a feature in the CPUs and memory
+system components such as the caches or memory controllers that allow memory
+traffic to be labelled, partitioned and monitored.
+
+Traffic is labelled by the CPU, based on the control or monitor group the
+current task is assigned to using resctrl.  Partitioning policy can be set
+using the schemata file in resctrl, and monitor values read via resctrl.
+See Documentation/filesystems/resctrl.rst for more details.
+
+This allows tasks that share memory system resources, such as caches, to be
+isolated from each other according to the partitioning policy (so called noisy
+neighbours).
+
+Supported Platforms
+===================
+Use of this feature requires CPU support, support in the memory system
+components, and a description from firmware of where the MPAM device controls
+are in the MMIO address space. (e.g. the 'MPAM' ACPI table).
+
+The MMIO device that provides MPAM controls/monitors for a memory system
+component is called a memory system component. (MSC).
+
+Because the user interface to MPAM is via resctrl, only MPAM features that are
+compatible with resctrl can be exposed to user-space.
+
+MSC are considered as a group based on the topology. MSC that correspond with
+the L3 cache are considered together, it is not possible to mix MSC between L2
+and L3 to 'cover' a resctrl schema.
+
+The supported features are:
+
+* Cache portion bitmap controls (CPOR) on the L2 or L3 caches.  To expose
+  CPOR at L2 or L3, every CPU must have a corresponding CPU cache at this
+  level that also supports the feature.  Mismatched big/little platforms are
+  not supported as resctrl's controls would then also depend on task
+  placement.
+
+* Memory bandwidth maximum controls (MBW_MAX) on or after the L3 cache.
+  resctrl uses the L3 cache-id to identify where the memory bandwidth
+  control is applied. For this reason the platform must have an L3 cache
+  with cache-id's supplied by firmware. (It doesn't need to support MPAM.)
+
+  To be exported as the 'MB' schema, the topology of the group of MSC chosen
+  must match the topology of the L3 cache so that the cache-id's can be
+  repainted. For example: Platforms with Memory bandwidth maximum controls
+  on CPU-less NUMA nodes cannot expose the 'MB' schema to resctrl as these
+  nodes do not have a corresponding L3 cache. If the memory bandwidth
+  control is on the memory rather than the L3 then there must be a single
+  global L3 as otherwise it is unknown which L3 the traffic came from.
+
+  When the MPAM driver finds multiple groups of MSC it can use for the 'MB'
+  schema, it prefers the group closest to the L3 cache.
+
+* Cache Storage Usage (CSU) counters can expose the 'llc_occupancy' provided
+  there is at least one CSU monitor on each MSC that makes up the L3 group.
+  Exposing CSU counters from other caches or devices is not supported.
+
+* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
+  L3 cache-id to identify where the memory bandwidth is measured. For this
+  reason the platform must have an L3 cache with cache-id's supplied by
+  firmware. (It doesn't need to support MPAM.)
+
+  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
+  makes up the L3 group. If there are more monitors than the maximum number
+  of control and monitor groups, these will be allocated and configured at
+  boot. Otherwise, the monitors will not be usable as they are required to
+  be free running. If the memory bandwidth monitoring is on the memory
+  rather than the L3 then there must be a single global L3 as otherwise it
+  is unknown which L3 the traffic came from.
+
+  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
+  match the topology of the L3 cache so that the cache-id's can be
+  repainted. For example: Platforms with Memory bandwidth monitors on
+  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
+  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
+  cannot distinguish local traffic from global traffic.
+
+Feature emulation
+=================
+MPAM will emulate the Code Data Prioritisation (CDP) feature on all platforms.
+
+Reporting Bugs
+==============
+If you are not seeing the counters or controls you expect please share the
+debug messages produced when enabling dynamic debug and booting with:
+dyndbg="file mpam_resctrl.c +pl"
-- 
2.43.0


