Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73176CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ed7wH4BH2c9USQ0xx5UjV+eQ1c1wPsVw6DTEK0h97Kg=; b=Tc+Z+orGbtLvY9KGmlTxKKIo1z
	VJQ+SDIooUcqZGnkXAKILL1HRBSNYJBY8eR1DiWG1yNrfFKs8v0MIQPf7aflQ7ZoHOCoNpZgdLQxj
	IwfewBGFCYM5X50nF2ZnJBWBe0qmHWwHG3pX/d0loc3ScnXz238hUTPMBMNwL09UpK/FUMF3SosmV
	UvL2rdZ06kJl9iOidq92rt03978DaWRrhEuOT4FSF681quRW1MU03pfR76svFHAOvPelVu74jIFt4
	yTLcTfewP5JltTNex8D2t1MYpxPXqTUbX32ome1kI7gs8Xq0vhAjSlK2qtrzN9+vNT1jqojwY4vab
	E+IjR83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWxt-00000002Jbs-26J8;
	Fri, 19 Sep 2025 08:59:37 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWxr-00000002Jaj-2RLJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 08:59:36 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7761b392d50so2490451b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758272375; x=1758877175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ed7wH4BH2c9USQ0xx5UjV+eQ1c1wPsVw6DTEK0h97Kg=;
        b=TvHafqAb8MRhzg+oExytw+XP3n+uX56JDUJA5AsMYSB6n1LkvRe55F9OjxsyyFUXeM
         R4WDEY0JvgIsTL/Gserq0rBSxue5fC15ThU6JmqT69q0hsqgh/+3x5h1EiDq8qnsVooC
         cb7iFAM3dpIEH/vHS8OJDF8+cujmJ3vu/bYVXSZJhIhkpNYCIjOAvVjB3JgJgKoB8/Q0
         Ml2oWjRj0jcdPAN9uFGPD91lE0lXqWKoaetgxsVrRqye/0oZd47NPERvQFTg7MvMYVUz
         hLQ469EjScMZTPwI9QouVDpO7Oe3KRoMthBq2wKpcMcIWQuvxYvokOfZZIlEZlBkS5YF
         9y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758272375; x=1758877175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed7wH4BH2c9USQ0xx5UjV+eQ1c1wPsVw6DTEK0h97Kg=;
        b=WobCXgoxiG3lPWuf3N5S7dJ3JZxfM3R3YJXjUXk3cfMKlwsBCE1CXtmlh2RBDlbI6+
         vHRGJsrX3SXzir1JmieeOJBXLJYsjQq5VaiUabdBYzNm2jdBWEpNwc2xFVAgK3ehhaTI
         rKFRrW+4PVQA9eWTfCimj3RCofbr+ORVMyxa8qgkDkb4JmMQD0R9qv8tCWKLGcFLAypz
         ED9cW3EErPekxIFwPWiBfwADKWslWGJmQhzgV397fzbXytiCA/45xE3H0WAUZrUpVF1J
         Tlv6wXlX7DF8aPFeeO07GDMZQPFzg9hFyo/g9aj/kL0JI5avGWh86rGTbSa+eBocomLj
         qC2w==
X-Forwarded-Encrypted: i=1; AJvYcCXi/PtphXGQ0hEpGU/Wg0T3XyRvTIW8m4HzFx7vbyNqXMYtlEpzmP8aqBROK5ZdOnIv5zUWD19RB/B9bL5d4eOl@lists.infradead.org
X-Gm-Message-State: AOJu0YwU9BunB3QTDLlWrgk+qncEcyfFfOyXD15lrf460yn+sRzMijks
	iW0hj7bPz6q859E521Hg0SepAwnlQ+LewT69wuU90WT3Nr1eSDZsbki4+uw8P4BIVLc=
X-Gm-Gg: ASbGnctwOve9yFQmoB0hMRGN/4mDOvSycktmfRMA68x6WgaB+CrJP4VAVWDGGogvcwQ
	0mexVJU2F8T0I+VHiSTXjvG53OIdtCZyHrtAtILFZKWvlaNRFS4jWxQeGN/+Oe824n5qgEuzivC
	lvhvHLUjOneRhwUXhnSn5DbD3NoVaDG+tB5kXls+bjB5mwmoSu25BcWqzy/xPduj9Rtev/cfnCc
	VWVdVQbLyiYN2Ri5X/It9DuQ28s6s734D0gmfRsatSQ+WHmTqLOlVdCc/Bd8zJXegiwfDSabr+g
	Ym+K7i2S7uJ3jNAQ/kjEXy7sSQP6J8J4njHOSt/ei9Dx8HaoxoeVY4U24UjwCcjT5QOgxhMSIuk
	63jjdZkLWFklQcTPhl/kVA499ZNWUZLip6JhllOlz/ZzszKRYMmhZ
X-Google-Smtp-Source: AGHT+IEpf/5Uci82EAvBJ21mN3DA1E59JJn6rSDZStsQ1j7+Szl4gzUE5LnonR/jL7o1KWe4VvZxDg==
X-Received: by 2002:a05:6a00:3c8f:b0:776:1de4:aee6 with SMTP id d2e1a72fcca58-77e4e5c5230mr2637567b3a.16.1758272374689;
        Fri, 19 Sep 2025 01:59:34 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb7ab97sm4687456b3a.14.2025.09.19.01.59.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 01:59:34 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	beata.michalska@arm.com,
	ptsm@linux.microsoft.com,
	sumitg@nvidia.com,
	yangyicong@hisilicon.com,
	cuiyunhui@bytedance.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] arch_topology: move parse_acpi_topology() to common code
Date: Fri, 19 Sep 2025 16:59:18 +0800
Message-Id: <20250919085918.5442-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250919085918.5442-1-cuiyunhui@bytedance.com>
References: <20250919085918.5442-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_015935_630722_BEEAC7D0 
X-CRM114-Status: GOOD (  22.74  )
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
 arch/arm64/kernel/topology.c  | 87 +---------------------------------
 drivers/base/arch_topology.c  | 89 ++++++++++++++++++++++++++++++++++-
 include/linux/arch_topology.h |  1 +
 3 files changed, 90 insertions(+), 87 deletions(-)

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
index 1037169abb459..09f77fd549490 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -823,12 +823,99 @@ void remove_cpu_topology(unsigned int cpu)
 	clear_cpu_topology(cpu);
 }
 
+__weak bool __init acpi_cpu_is_threaded(int cpu)
+{
+	int is_threaded = acpi_pptt_cpu_is_thread(cpu);
+
+	return is_threaded == 1;
+}
+
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
+struct cpu_smt_info {
+	unsigned int thread_num;
+	int core_id;
+};
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
index d72d6e5aa2002..8cd8a9604f33f 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -88,6 +88,7 @@ void update_siblings_masks(unsigned int cpu);
 void remove_cpu_topology(unsigned int cpuid);
 void reset_cpu_topology(void);
 int parse_acpi_topology(void);
+bool acpi_cpu_is_threaded(int cpu);
 void freq_inv_set_max_ratio(int cpu, u64 max_rate);
 #endif
 
-- 
2.39.5


