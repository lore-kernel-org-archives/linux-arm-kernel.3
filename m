Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7D9CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 02:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zbfOHx4kxbLSRlZnJMRy2JtVsUEGR5+lIot3ZCtU+0E=; b=Od/J6kKbuLOrjuENKLjPazbMqO
	uo6UitkObrJ0hfOpn+Vl2FzImZPhqO0DAaA/Q+M8lveisk1gd/wI3ui4EYvH0FglMdh5WkWAinb/9
	ioxyUHScG/mcepXVSVhPsL8mBm+2KOzIAUOr8aaHm+gx5lcVJv2Bu3TOmxwq6A6tPMbJNtbENMkSm
	0UxCclVQ0tI3ipS03DEYs5NkE5nE0l9bPYXIpEW8i4T7T/efv1y4akf1PfjCN/g4TGbhvRmFNTX88
	hrqpoKytA6ja4IV+oP++6iW9JW/4dlqF7km+mE6WldFRw50T2qBioegh1MgYaOlf8LXAaIUrcJ5O/
	jWgx9WAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyhw9-00000009y8K-02Qt;
	Wed, 17 Sep 2025 02:30:25 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyhw6-00000009y5u-1sGy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 02:30:23 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so4917198b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758076217; x=1758681017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zbfOHx4kxbLSRlZnJMRy2JtVsUEGR5+lIot3ZCtU+0E=;
        b=Io36DEQ/jqzH5rO+h3rMNP0/4IZVk3KaaEi/evwfJ+mTGCLZmuS/Tm0JHn7aQ2qE0Q
         m4aiLccO0qtyU2DB6A/JHwHucDx6SAGLKBz7143I2TCkb19wbBXkDjMt4OUx/PRIE5FR
         l5oEjgxK7yd1dHhxh1Qwd0UgjKJ0Sib7hgqqdLLysbcLt2KYOBVqfpu0eBDoV7b/MGry
         QX7DvpcJV6UWwjOTyMP425GkVlAqr4MLf9NtZivS/VB0Qz80OExU9+yRC6YHSklNv1fI
         SElLL5iRAzUjaEE7KmlDUebSizxKA7oUdvIXkNC7HKZmDN3sEjyClc4Einccsep0O9Hf
         oEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758076217; x=1758681017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbfOHx4kxbLSRlZnJMRy2JtVsUEGR5+lIot3ZCtU+0E=;
        b=b1KEL4XpFiYSNaHS1K6ITPCEomyTYiZGwefZrDx+6NorrPigUW/5VckIzB4y4Dmr2l
         yJyZvoZaVrslGf0yUkEOF9SAWeRAOoAd9djLZBdw8jYwwZmr4WIRQdjM6sDFuu3/O4Pe
         IDt1RPhRmzl3XUkx3gZ/f7SJYPqempKCSzafWCH8msMhlUOFN6DB2vAyrCH5hesWgAaa
         i64ujny4fCoWEmBxMO0Qcaqf6eoFFtuojw76PyuTbb8Es9dChR0x+3WvSaLQkAjVhGCE
         t34B2bL18D4Z6YpLkPHz7/J9bafCdhAJ5pP9czvN3S7+JOV979X0keqbHM3S3tge0Maz
         fVdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7+AnAeEwfTcAJKd9Ul3anN5Wdol2LEKAhezsOWzySuVJmJq847Bs9rvdVfLHeuFpaNwDnlNsJqsDCbAsca7Op@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6636O32Wf7mjo+Dh3X0ysDEaRouiyLTNSYgari6fYiGZkw9Pu
	6SlyuATLbbA/MFnbEnVzeuSPV4AjAFTpfkQUSfaedAroWpFLTMz9FKLntXPmREY2pRU=
X-Gm-Gg: ASbGncsFmGSmfi1p8b8n5HxrCbMs6k7fzJ8qrS5oo/6GGXco+YZGtTvxtkTNFy55lJV
	Wj4DfpOqjURN2Yz50jUIgvErAkqVVHcVEMm/K2rq0Ghe2NGopVNxKzsi5WJRej0ncelzZUvTbkk
	XxcYp3YDS5jX75jUJFbK7prOUOi+eaSf3IScLuYPNQLoUhJj2w1dZlkLJGE8c34/KXpP2R8oGhP
	A/q3U2h0dVoAam3/rrWImi9P8EMS+x1bU3CbkVRUMacBUYG0Rj93y6mghPSPhPi8S4Slh8QC+6A
	ZUlQajoUyYXtIZcxHm31oO5XASDnZ4a33L6wnyIEMEepNEWYNswgpy4qiuU3O0RjKrsQU/bfyWn
	fYExlf3ZUZYU6YBlYAkjAHl7dM9usx/MdnvUmyfW2PGWYcLpVixBdOCh4e3ue
X-Google-Smtp-Source: AGHT+IHrVERgQmh7lAH6JDt1kYBBcduFHRx2UuVAjcsAgXlINws6Nn6ovQWKdf6zTTGNaVe31DCbfQ==
X-Received: by 2002:a05:6a20:548d:b0:24f:f79d:66a8 with SMTP id adf61e73a8af0-27a96a993f3mr586251637.24.1758076217466;
        Tue, 16 Sep 2025 19:30:17 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b1a031sm17829080b3a.57.2025.09.16.19.30.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Sep 2025 19:30:17 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	beata.michalska@arm.com,
	sumitg@nvidia.com,
	ptsm@linux.microsoft.com,
	cuiyunhui@bytedance.com,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arch_topology: move parse_acpi_topology() to common code
Date: Wed, 17 Sep 2025 10:30:07 +0800
Message-Id: <20250917023007.97637-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_193022_670952_DB929F67 
X-CRM114-Status: GOOD (  22.41  )
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
 arch/arm64/kernel/topology.c  | 87 +----------------------------------
 drivers/base/arch_topology.c  | 85 +++++++++++++++++++++++++++++++++-
 include/linux/arch_topology.h |  6 +++
 3 files changed, 91 insertions(+), 87 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 5d07ee85bdae4..55650db53b526 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -26,7 +26,7 @@
 #include <asm/topology.h>
 
 #ifdef CONFIG_ACPI
-static bool __init acpi_cpu_is_threaded(int cpu)
+bool __init acpi_cpu_is_threaded(int cpu)
 {
 	int is_threaded = acpi_pptt_cpu_is_thread(cpu);
 
@@ -39,91 +39,6 @@ static bool __init acpi_cpu_is_threaded(int cpu)
 
 	return !!is_threaded;
 }
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
 #endif
 
 #ifdef CONFIG_ARM64_AMU_EXTN
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 1037169abb459..65ec1f3d2bd28 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -823,12 +823,95 @@ void remove_cpu_topology(unsigned int cpu)
 	clear_cpu_topology(cpu);
 }
 
+__weak bool __init acpi_cpu_is_threaded(int cpu)
+{
+	int is_threaded = acpi_pptt_cpu_is_thread(cpu);
+
+	return !!is_threaded;
+
+}
+
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
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
index d72d6e5aa2002..50d33b5a78ccd 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -70,6 +70,11 @@ struct cpu_topology {
 	cpumask_t llc_sibling;
 };
 
+struct cpu_smt_info {
+	unsigned int thread_num;
+	int core_id;
+};
+
 #ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
 extern struct cpu_topology cpu_topology[NR_CPUS];
 
@@ -88,6 +93,7 @@ void update_siblings_masks(unsigned int cpu);
 void remove_cpu_topology(unsigned int cpuid);
 void reset_cpu_topology(void);
 int parse_acpi_topology(void);
+bool acpi_cpu_is_threaded(int cpu);
 void freq_inv_set_max_ratio(int cpu, u64 max_rate);
 #endif
 
-- 
2.39.5


