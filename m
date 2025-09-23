Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C965CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 01:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsk0+ZyYUlCeBMpvtgc0y0+NQ46VkaEHVxXhIiqoDXY=; b=P2IrU3RE81l/iH33TwPTKCDvCP
	ZqId8Rq8dNifzXQppj2q7u4oDJnDrsx819NI7I32Aa0mrp+lhGMEQGW2V6iBpExUlAiszQe1E4KMD
	XlpsDFndllnaJCpj6vllCRbu+2hhAA5vNdsaOXntWPYYFLu2a41tuhPsTuffRZTEZo+xWU+WylYzh
	nmRAUTNLTnCR7/owZSOiaS93hydaTutPoQ9Vs2Ev9hWgqvx7x+kXvNPlT2+UQ3dBVs3qkkQ/2OgVN
	ine7ju0x21NXbQqjcrM2LZXpuahjc+8w9/hkb0LOhIiD1Ock4P9Quyi65JJppSPlVu1xG7Frs7Svy
	5hTjgYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sEl-0000000C4EO-0jFT;
	Tue, 23 Sep 2025 01:54:35 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sEh-0000000C4Dl-3oMZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 01:54:33 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3306d93e562so4382906a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 18:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758592471; x=1759197271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsk0+ZyYUlCeBMpvtgc0y0+NQ46VkaEHVxXhIiqoDXY=;
        b=StpZnVYg2OzaUH9LDM70wCwglcwydRs9n8qSVCFzZYnjNJd0iuCvPE9lpUoKGTpJGv
         yloi6R8zrASFwpZwKTak+J8hrfUJvazsabNvyK9x5Z20vUYBG8e1ZNTN/Uu7YE0mUz35
         pTyCdyGiDXvUudYpiT9KLtYNUkwv9wQd2Svput4BLk7+FYWzFDw3lokJgoa1yFp0WKBe
         pF9tXlJgUSFQQ4LRGBUxwMOtisgUqNqCVXzfrcRtukxLBoSWyDJohktGHNHCUWoRgeJF
         riyYyneJxy4LoPaVE2FrKYn/a7v6FLgmxpfGwQggYBDp+puswBa4XI33tqiCXxmhHXLr
         0/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758592471; x=1759197271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsk0+ZyYUlCeBMpvtgc0y0+NQ46VkaEHVxXhIiqoDXY=;
        b=lSKQBWvhSmd9x66EYeaAQ5nfLwVvWh+98JKADMLBdwhNKzmunJ5l50jwHpvbnhK1dL
         K0iX2iZse8PEop9HHS+9LjhhaZhAAmg+A0atr6jEwEQao6sOw6rI68XpItvbJAAQlhaB
         do9UkW3wOG9Ym3iXrkKK9jcMGuZ4YJjtU7eKmK/QSds23dforf9rOOHt9sTQf3Wn4+gA
         KNI3yq/zm7A7Lpd0qfaVGIw7tY9+iOIL+CegSM9EWkFMf3awYStTTnKe1V1Xm2aWT9EP
         wDHszYCc42XYPvSLo9moLNhIphFSoXCH37wQM/TNvl/2jMbDyOeADVxvgeQxlWgpv2uJ
         tfOg==
X-Forwarded-Encrypted: i=1; AJvYcCUna5eMUEky2OONbsFFbNfd5vozIE9vkmYubmieWFWYJvkleB6TjR6wsNAWltT7KyN0XiJc0XWyaTGCtJ1G7vux@lists.infradead.org
X-Gm-Message-State: AOJu0YynBdJNFXBxRhmDh4WIY8uPCzozR3ws7vl6mJhf7bcV9kDCq6sC
	R4pFqjV1z8UKyOxOUH3+JRePSQnr4ZYnjHv5OiPO2uafBM4BYBA3XGDTmUIKYGaEfPw=
X-Gm-Gg: ASbGncvxo6IOH7xqDiYqrkghDZrh5VnTQtkRQapWPfoYbxAvgvFBC1KB9ihFwuCSXRp
	SZz9R3AYP20AtlvnyDW5Xr2cuBWL7TyBQDk78IT39u74Pxifcx/huk456Fcxn0PbWJ5cboT+Efv
	8jAeyPc1y4Nsvkxsqu+HR2knHhEhmlHaocDhExaEMtno6rpBAxvkNPknYbIAu2qBqW+0cKV5ec1
	0FfOjRSLt+6m1s08tGxzmELlFArO9jJN3Qls58nZHsctSlH00sGs4t7/3o+i0cyk1yMDBrI0v7p
	mrd0XhohxsUwkqjGPslAvFpidxAyR84LH+1el9yQ0SxEaMeZ3fK9UphmWOQbwynp5spa9Yl+AGo
	WrpIMhYFQArej4jiZ1VIs+qr3VwHKMdbokS+ny1iJFgfB6YmAb0mINJL0O9Z8PF6y
X-Google-Smtp-Source: AGHT+IFbfrf5fhSPzrWBkgzrIx7CiQAXrF0fvKls15yDg7nnQCeX/7p3u/SEr+iLhqBLX3uBca/v2g==
X-Received: by 2002:a17:90b:48d1:b0:32e:c649:e583 with SMTP id 98e67ed59e1d1-332a95e9184mr924901a91.22.1758592470782;
        Mon, 22 Sep 2025 18:54:30 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed268813bsm17503265a91.1.2025.09.22.18.54.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Sep 2025 18:54:30 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	mario.limonciello@amd.com,
	cuiyunhui@bytedance.com,
	beata.michalska@arm.com,
	sumitg@nvidia.com,
	ptsm@linux.microsoft.com,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] arch_topology: move parse_acpi_topology() to common code
Date: Tue, 23 Sep 2025 09:54:09 +0800
Message-Id: <20250923015409.15983-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250923015409.15983-1-cuiyunhui@bytedance.com>
References: <20250923015409.15983-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_185431_960377_E3E3E91B 
X-CRM114-Status: GOOD (  24.74  )
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

Currently, RISC-V lacks arch-specific registers for CPU topology
properties and must get them from ACPI. Thus, parse_acpi_topology()
is moved from arm64/ to drivers/ for RISC-V reuse.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/include/asm/topology.h |   3 +
 arch/arm64/kernel/topology.c      | 101 ------------------------------
 drivers/base/arch_topology.c      |  96 +++++++++++++++++++++++++++-
 include/linux/arch_topology.h     |   5 ++
 4 files changed, 103 insertions(+), 102 deletions(-)

diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index 341174bf91063..b9eaf4ad70850 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -36,6 +36,9 @@ void update_freq_counters_refs(void);
 #define arch_scale_hw_pressure topology_get_hw_pressure
 #define arch_update_hw_pressure	topology_update_hw_pressure
 
+#undef arch_cpu_is_threaded
+#define arch_cpu_is_threaded() (read_cpuid_mpidr() & MPIDR_MT_BITMASK)
+
 #include <asm-generic/topology.h>
 
 #endif /* _ASM_ARM_TOPOLOGY_H */
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 5d07ee85bdae4..5d24dc53799b7 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -25,107 +25,6 @@
 #include <asm/cputype.h>
 #include <asm/topology.h>
 
-#ifdef CONFIG_ACPI
-static bool __init acpi_cpu_is_threaded(int cpu)
-{
-	int is_threaded = acpi_pptt_cpu_is_thread(cpu);
-
-	/*
-	 * if the PPTT doesn't have thread information, assume a homogeneous
-	 * machine and return the current CPU's thread state.
-	 */
-	if (is_threaded < 0)
-		is_threaded = read_cpuid_mpidr() & MPIDR_MT_BITMASK;
-
-	return !!is_threaded;
-}
-
-struct cpu_smt_info {
-	unsigned int thread_num;
-	int core_id;
-};
-
-/*
- * Propagate the topology information of the processor_topology_node tree to the
- * cpu_topology array.
- */
-int __init parse_acpi_topology(void)
-{
-	unsigned int max_smt_thread_num = 1;
-	struct cpu_smt_info *entry;
-	struct xarray hetero_cpu;
-	unsigned long hetero_id;
-	int cpu, topology_id;
-
-	if (acpi_disabled)
-		return 0;
-
-	xa_init(&hetero_cpu);
-
-	for_each_possible_cpu(cpu) {
-		topology_id = find_acpi_cpu_topology(cpu, 0);
-		if (topology_id < 0)
-			return topology_id;
-
-		if (acpi_cpu_is_threaded(cpu)) {
-			cpu_topology[cpu].thread_id = topology_id;
-			topology_id = find_acpi_cpu_topology(cpu, 1);
-			cpu_topology[cpu].core_id   = topology_id;
-
-			/*
-			 * In the PPTT, CPUs below a node with the 'identical
-			 * implementation' flag have the same number of threads.
-			 * Count the number of threads for only one CPU (i.e.
-			 * one core_id) among those with the same hetero_id.
-			 * See the comment of find_acpi_cpu_topology_hetero_id()
-			 * for more details.
-			 *
-			 * One entry is created for each node having:
-			 * - the 'identical implementation' flag
-			 * - its parent not having the flag
-			 */
-			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
-			entry = xa_load(&hetero_cpu, hetero_id);
-			if (!entry) {
-				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
-				WARN_ON_ONCE(!entry);
-
-				if (entry) {
-					entry->core_id = topology_id;
-					entry->thread_num = 1;
-					xa_store(&hetero_cpu, hetero_id,
-						 entry, GFP_KERNEL);
-				}
-			} else if (entry->core_id == topology_id) {
-				entry->thread_num++;
-			}
-		} else {
-			cpu_topology[cpu].thread_id  = -1;
-			cpu_topology[cpu].core_id    = topology_id;
-		}
-		topology_id = find_acpi_cpu_topology_cluster(cpu);
-		cpu_topology[cpu].cluster_id = topology_id;
-		topology_id = find_acpi_cpu_topology_package(cpu);
-		cpu_topology[cpu].package_id = topology_id;
-	}
-
-	/*
-	 * This is a short loop since the number of XArray elements is the
-	 * number of heterogeneous CPU clusters. On a homogeneous system
-	 * there's only one entry in the XArray.
-	 */
-	xa_for_each(&hetero_cpu, hetero_id, entry) {
-		max_smt_thread_num = max(max_smt_thread_num, entry->thread_num);
-		xa_erase(&hetero_cpu, hetero_id);
-		kfree(entry);
-	}
-
-	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
-	xa_destroy(&hetero_cpu);
-	return 0;
-}
-#endif
-
 #ifdef CONFIG_ARM64_AMU_EXTN
 #define read_corecnt()	read_sysreg_s(SYS_AMEVCNTR0_CORE_EL0)
 #define read_constcnt()	read_sysreg_s(SYS_AMEVCNTR0_CONST_EL0)
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 1037169abb459..1ccb1eda4ce8b 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -823,12 +823,106 @@ void remove_cpu_topology(unsigned int cpu)
 	clear_cpu_topology(cpu);
 }
 
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
+struct cpu_smt_info {
+	unsigned int thread_num;
+	int core_id;
+};
+
+static bool __init acpi_cpu_is_threaded(int cpu)
+{
+	int is_threaded = acpi_pptt_cpu_is_thread(cpu);
+
+	/*
+	 * if the PPTT doesn't have thread information, check for architecture
+	 * specific fallback if available
+	 */
+	if (is_threaded < 0)
+		is_threaded = arch_cpu_is_threaded();
+
+	return !!is_threaded;
+}
+
+/*
+ * Propagate the topology information of the processor_topology_node tree to the
+ * cpu_topology array.
+ */
 __weak int __init parse_acpi_topology(void)
 {
+	unsigned int max_smt_thread_num = 1;
+	struct cpu_smt_info *entry;
+	struct xarray hetero_cpu;
+	unsigned long hetero_id;
+	int cpu, topology_id;
+
+	if (acpi_disabled)
+		return 0;
+
+	xa_init(&hetero_cpu);
+
+	for_each_possible_cpu(cpu) {
+		topology_id = find_acpi_cpu_topology(cpu, 0);
+		if (topology_id < 0)
+			return topology_id;
+
+		if (acpi_cpu_is_threaded(cpu)) {
+			cpu_topology[cpu].thread_id = topology_id;
+			topology_id = find_acpi_cpu_topology(cpu, 1);
+			cpu_topology[cpu].core_id   = topology_id;
+
+			/*
+			 * In the PPTT, CPUs below a node with the 'identical
+			 * implementation' flag have the same number of threads.
+			 * Count the number of threads for only one CPU (i.e.
+			 * one core_id) among those with the same hetero_id.
+			 * See the comment of find_acpi_cpu_topology_hetero_id()
+			 * for more details.
+			 *
+			 * One entry is created for each node having:
+			 * - the 'identical implementation' flag
+			 * - its parent not having the flag
+			 */
+			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
+			entry = xa_load(&hetero_cpu, hetero_id);
+			if (!entry) {
+				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+				WARN_ON_ONCE(!entry);
+
+				if (entry) {
+					entry->core_id = topology_id;
+					entry->thread_num = 1;
+					xa_store(&hetero_cpu, hetero_id,
+						 entry, GFP_KERNEL);
+				}
+			} else if (entry->core_id == topology_id) {
+				entry->thread_num++;
+			}
+		} else {
+			cpu_topology[cpu].thread_id  = -1;
+			cpu_topology[cpu].core_id    = topology_id;
+		}
+		topology_id = find_acpi_cpu_topology_cluster(cpu);
+		cpu_topology[cpu].cluster_id = topology_id;
+		topology_id = find_acpi_cpu_topology_package(cpu);
+		cpu_topology[cpu].package_id = topology_id;
+	}
+
+	/*
+	 * This is a short loop since the number of XArray elements is the
+	 * number of heterogeneous CPU clusters. On a homogeneous system
+	 * there's only one entry in the XArray.
+	 */
+	xa_for_each(&hetero_cpu, hetero_id, entry) {
+		max_smt_thread_num = max(max_smt_thread_num, entry->thread_num);
+		xa_erase(&hetero_cpu, hetero_id);
+		kfree(entry);
+	}
+
+	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+	xa_destroy(&hetero_cpu);
 	return 0;
 }
 
-#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 void __init init_cpu_topology(void)
 {
 	int cpu, ret;
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index d72d6e5aa2002..766ed9cf0e549 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -80,6 +80,11 @@ extern struct cpu_topology cpu_topology[NR_CPUS];
 #define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
 #define topology_cluster_cpumask(cpu)	(&cpu_topology[cpu].cluster_sibling)
 #define topology_llc_cpumask(cpu)	(&cpu_topology[cpu].llc_sibling)
+
+#ifndef arch_cpu_is_threaded
+#define arch_cpu_is_threaded()	(0)
+#endif
+
 void init_cpu_topology(void);
 void store_cpu_topology(unsigned int cpuid);
 const struct cpumask *cpu_coregroup_mask(int cpu);
-- 
2.39.5


