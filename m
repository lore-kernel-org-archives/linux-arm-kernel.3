Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FA6CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 01:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V7KHWyc6262iDZIkf7ifrzZ8+Zh6e+Z9ki+t6iKm7ek=; b=snHvjvSA5K8Q2Awc5VsA7vkPIq
	1Ak4zdP7iarr9p7hfWjVbAZOdSgTvbUFYRdcYrO8kN5DIfE4XLArOV9DRM5cbYwmnArB66mDZG6sw
	cWhrM5E53A/blqdwYT3+Y3/cknGa7OJ2c2WpgUgKP4agoQfnZDPaQksuGs7ETmHWNA6Ys3Lo4jJek
	IeAjbo3aduigRCLeUDcdwb8Z2qLUDFyQB2vLYBaDrvKmZiXM71k5B4tJQdidoUZ2abbXZ5q0lXeCU
	1HCeONnpAtCXHg48S1TYx3VdgMTxqFl4Netqt9rfZJs1Ge+24JEfz5HdKVwpmNIqoLBeYigJhs8GM
	R15unUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz3lL-0000000Fxi8-0W5g;
	Thu, 18 Sep 2025 01:48:43 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz3lI-0000000Fxhg-0Ous
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 01:48:41 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so329244a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 18:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758160118; x=1758764918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7KHWyc6262iDZIkf7ifrzZ8+Zh6e+Z9ki+t6iKm7ek=;
        b=TPIUKwADsSwww9kPEb7BDbLCYXPNxJDTsRkQel13/xkpdF8lJewxBZUyahwNHcaSBU
         EjNzVt1Jfkvrdqhba3cU0fUo7Wyo4zUxQ72mY8Bri8eOBJ1TG6rjTiSS55QymhsaaTK6
         6rakY3dm7KcsUmN8XiqjdnSvaJiU4LlZSJQbULBpk1mfE1LsAWz639ssmNxyGNQ4GWy1
         R9IkBaoOSgjhRVIgOYWds62sXnbgMuPxSwNSkGrSc9p0+WI5k2DUjVeVp9R+vI3g5Fmg
         7jnfPCOxmiPsF+wTNScqKGVGk+CObfNvsjj9PQipqlPABoVqkIlGLaiKPpq44vxte6wS
         nNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758160118; x=1758764918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7KHWyc6262iDZIkf7ifrzZ8+Zh6e+Z9ki+t6iKm7ek=;
        b=J9tlyasDmMt0acpDiaZHWK2u1Ga1ZoafIy1bMbBDHYU2T2XVYdBYJitclo6qrM32Pj
         EyCm2aaH2DZsdLTmccd/+4bhyZoDzcRP/sh2RNlmHBVyI30g5hDO4j3g/XvnJNCS9YrG
         bafWP3CzvFl/8/fLunZQiDL4pYjRVPEDVN7oAVfvbfsPcXm0mkYMjoleHxZaoGq1Zvau
         9b1OFdQnkfHlQtg5flnJAnQVM2uafdjCiPI27vPznzAp96SoD3l67DT1ayRxFXpwTzY+
         q8O9HEFl7qBMkwJrQK7eO1vJafn/aJANY0asIf6oD4vFKGpY12lT/bYYLmlJPoG3hPnu
         7HKA==
X-Forwarded-Encrypted: i=1; AJvYcCV3aPZWBV6OxKZN6TXcpyE0k7lPL8It5joiNHZoweWp+BTu3kl6BgP7N7TQuALV6/z654iwdOlLAQkqZnxypgor@lists.infradead.org
X-Gm-Message-State: AOJu0YxB7NeYlO+Po8VlyB33QNrXNCF/HXJBKqpbPUS2Au0qx8iCuzI5
	vr9oLCG5+NEuB/CdNN02nBwc+axqAowhxwIN1c9mrcrQrv+kkadF1A4MOWfkenrTEsk=
X-Gm-Gg: ASbGncusrnbzAlNoCc2K12khX776J9rILU4F5cqBQwBT5m8plAtAiGGgztlKOoF5UrS
	0lOgBZevvm8rGr7Y52AFf7prP/WxvU0ej/HcNO8K9H1JBe/Cfw1WyuDtXEV3F1AJd7CXgTbGjrV
	WjKaJU3K7iSwykGMpPZEj2zrWTING/LEIq4a4VKLqihWcgeOm0eU232IPgZoWa39mzwXF3qhy/8
	kxtREKEuKiMe29uvJ1xi/LVDDsNWCr/8Cj/BRKA7MVJxqiiuY8ihBHS1w6BqyIR4w8lF/PXw/hH
	dV2e9desqZSN8d7z1czN1IaTlONCqOex06yJ4fGKMEjfPnBWxtqpRXBlsLFdxOqHgo0QdD6CAQf
	zU0ptzQ8wYWx07HqgVhvreS+mCJqoYIQWwL0YuwjIi1+qzKozUNJBldp8Ds5ZD4fDg71ShGGL+w
	QF7Ro=
X-Google-Smtp-Source: AGHT+IHitHTC24KBfHvioQFUEarlC9ZUeEtoOdWrUlM1i6XbM+QfUC6SN4lioQsTedp7a4Oa06zZxQ==
X-Received: by 2002:a17:90b:390a:b0:32e:3837:284e with SMTP id 98e67ed59e1d1-32ee3f0076emr4883683a91.10.1758160118154;
        Wed, 17 Sep 2025 18:48:38 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb7a953sm686176b3a.20.2025.09.17.18.48.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Sep 2025 18:48:37 -0700 (PDT)
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
Subject: [PATCH v2] arch_topology: move parse_acpi_topology() to common code
Date: Thu, 18 Sep 2025 09:48:28 +0800
Message-Id: <20250918014828.78383-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_184840_459376_C06E1E52 
X-CRM114-Status: GOOD (  21.83  )
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
index 1037169abb459..c22746b45d57a 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -823,12 +823,99 @@ void remove_cpu_topology(unsigned int cpu)
 	clear_cpu_topology(cpu);
 }
 
+__weak bool __init acpi_cpu_is_threaded(int cpu)
+{
+	int is_threaded = acpi_pptt_cpu_is_thread(cpu);
+
+	return !!is_threaded;
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


