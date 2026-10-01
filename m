Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1321BCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5tDgzxcXm4PKFxGm4i2hz0zg/M8F0RtFu4BFOkfqtM=; b=cdAC6DcyW+GeVfTqQEazmepSuZ
	mKtF25K08gz5EAdAE/mZoLz2SbclGbZ7Jc6wbO61s/Lgn5G7UQZev8Z+ZFGUBz7XVMmMqwh2eLlE2
	bHOApv8g69bPRlr1uWeCiuzbyu3Wts7eYYk8AcfUySYTpFjWJbDjzGGqweS0/5xr2WJEuK3KGSiMO
	FNW6NpziG4sG5ubmc3l8kwm5jioYTAy7Bt3ODlSdTRPH/yT7epRTJ5hHYvQ7pUwCeqJjsjn1uRslS
	jifGmkoJ4rniQnna/WoVvIWB0dkfYrKkg/NzeKSx2LC2WNEN6NlLZbGESv0TbaYf7IK1n2MDIz9sr
	7lIt4few==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEdv-00000008bMy-3zc1;
	Thu, 01 Oct 2026 11:08:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEdt-00000008bKa-27Hq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:08:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81F15143D;
	Thu,  1 Oct 2026 04:07:57 -0700 (PDT)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5839D3F86F;
	Thu,  1 Oct 2026 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790852880; bh=rbDaAB0qsw7+VuEsJDuojNVGxavLk3pvqlUhLK9ssuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=To2gn3pzvcufWeWJLicLCNugNK/+lcyeQtgwaqx+V2qvI+3nNyzsNqZnGFgbs31uA
	 1eRVwJoXB5wi0dyckkX2OxqJ7HGGYD3jnxG58xbBpz+NxYkOYHOGk/8DQGuN2t5Xne
	 Qtd/ZQ04kpxj2DOgdf6qSTIvawioaGdSPV2HxHCc=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [RFC 07/12] arm64: tlbid: Set up CPU domain bitmaps
Date: Thu,  1 Oct 2026 12:06:50 +0100
Message-ID: <20261001110655.461473-8-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001110655.461473-1-kristina.martsenko@arm.com>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_040801_621869_40CE2955 
X-CRM114-Status: GOOD (  22.53  )
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

For each CPU, set up a bitmap of TLBI domains that contain the CPU.
This will be used in later patches to select a domain that contains a
given set of CPUs.

Sort the bitmap by size, with the largest domain at the smallest index.
This will be used to select the smallest domain. Domains are sorted
based on the number of CPUs that they contain. Domains may also contain
SMMUs but we ignore that for now.

Do the setup in arm64 code, near to where it will be used. The ACPI
table parser calls the arm64 setup code directly after parsing the TLBI
table, and passes a list of parsed domains. Afterwards, the parser's own
temporary structures are freed. Alternatively the arm64 setup could be
done from a subsys_initcall_sync().

Add a static key that will be used to check if TLBI domains are enabled.
Disable domains for nVHE EL2 hypervisor code since it would otherwise
need access to the static key (since it #includes tlbflush.h which will
use system_supports_tlbid()) but it wouldn't use domains anyway.

Assisted-by: LLM
Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/include/asm/acpi.h       |   1 +
 arch/arm64/include/asm/cpufeature.h |   8 +++
 arch/arm64/mm/Makefile              |   1 +
 arch/arm64/mm/tlbid.c               | 104 ++++++++++++++++++++++++++++
 drivers/acpi/arm64/tlbi.c           |   8 +++
 5 files changed, 122 insertions(+)
 create mode 100644 arch/arm64/mm/tlbid.c

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index fb0bddd3b7ef..5d173c26b56c 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -178,6 +178,7 @@ struct tlbi_domain {
 	u16 id;
 	cpumask_var_t cpus;
 };
+int arm64_tlbid_init(struct tlbi_domain *domains, int count);
 #endif
 
 #define ACPI_TABLE_UPGRADE_MAX_PHYS MEMBLOCK_ALLOC_ACCESSIBLE
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index d4e7497143b2..ff88fd516181 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -885,6 +885,14 @@ static inline bool system_supports_bbml3(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
 }
 
+DECLARE_STATIC_KEY_FALSE(tlbid_enabled);
+static inline bool system_supports_tlbid(void)
+{
+	return IS_ENABLED(CONFIG_ARM64_TLBID) &&
+	       !is_nvhe_hyp_code() &&
+	       static_branch_unlikely(&tlbid_enabled);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index c26489cf96cd..cfd3255d8f0a 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd-asm.o
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
 obj-$(CONFIG_ARM64_MTE)		+= mteswap.o
 obj-$(CONFIG_ARM64_GCS)		+= gcs.o
+obj-$(CONFIG_ARM64_TLBID) 	+= tlbid.o
 KASAN_SANITIZE_physaddr.o	+= n
 
 obj-$(CONFIG_KASAN)		+= kasan_init.o
diff --git a/arch/arm64/mm/tlbid.c b/arch/arm64/mm/tlbid.c
new file mode 100644
index 000000000000..0c26ace39592
--- /dev/null
+++ b/arch/arm64/mm/tlbid.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TLBI domains (FEAT_TLBID) support
+ *
+ * Copyright (C) 2026 Arm Ltd.
+ * Author: Kristina Martsenko <kristina.martsenko@arm.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
+#include <linux/jump_label.h>
+#include <linux/slab.h>
+#include <linux/sort.h>
+
+DEFINE_STATIC_KEY_FALSE(tlbid_enabled);
+
+static u16 *domain_ids;
+static unsigned long **cpu_domains;
+static int domain_count;
+
+static int __init init_cpu_domain_bitmaps(struct tlbi_domain *domains)
+{
+	int cpu;
+
+	cpu_domains = kcalloc(nr_cpu_ids, sizeof(*cpu_domains), GFP_KERNEL);
+	if (!cpu_domains)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		cpu_domains[cpu] = bitmap_zalloc(domain_count, GFP_KERNEL);
+		if (!cpu_domains[cpu])
+			return -ENOMEM;
+
+		for (int i = 0; i < domain_count; i++) {
+			if (cpumask_test_cpu(cpu, domains[i].cpus))
+				set_bit(i, cpu_domains[cpu]);
+		}
+	}
+
+	return 0;
+}
+
+static int __init store_domain_ids(struct tlbi_domain *domains)
+{
+	domain_ids = kmalloc_array(domain_count, sizeof(*domain_ids),
+				   GFP_KERNEL);
+	if (!domain_ids)
+		return -ENOMEM;
+
+	for (int i = 0; i < domain_count; i++)
+		domain_ids[i] = domains[i].id;
+
+	return 0;
+}
+
+static int __init tlbi_domain_cmp(const void *a, const void *b)
+{
+	const struct tlbi_domain *d1 = a;
+	const struct tlbi_domain *d2 = b;
+
+	/* Sort domains from largest to smallest */
+	return cmp_int(cpumask_weight(d2->cpus), cpumask_weight(d1->cpus));
+}
+
+static struct tlbi_domain *__init sort_domains_by_size(struct tlbi_domain *domains)
+{
+	struct tlbi_domain *domains_sorted;
+
+	domains_sorted = kmemdup(domains, domain_count * sizeof(*domains),
+				 GFP_KERNEL);
+	if (!domains_sorted)
+		return NULL;
+
+	sort(domains_sorted, domain_count, sizeof(*domains_sorted),
+	     tlbi_domain_cmp, NULL);
+
+	return domains_sorted;
+}
+
+int __init arm64_tlbid_init(struct tlbi_domain *domains_in, int count)
+{
+	struct tlbi_domain *domains;
+	int ret;
+
+	domain_count = count;
+
+	domains = sort_domains_by_size(domains_in);
+	if (!domains)
+		return -ENOMEM;
+
+	ret = store_domain_ids(domains);
+	if (ret)
+		return ret;
+
+	ret = init_cpu_domain_bitmaps(domains);
+	if (ret)
+		return ret;
+
+	static_branch_enable(&tlbid_enabled);
+
+	kfree(domains);
+	return 0;
+}
diff --git a/drivers/acpi/arm64/tlbi.c b/drivers/acpi/arm64/tlbi.c
index b705a5b19842..47f7b6ccecf9 100644
--- a/drivers/acpi/arm64/tlbi.c
+++ b/drivers/acpi/arm64/tlbi.c
@@ -185,4 +185,12 @@ void __init acpi_tlbi_init(void)
 			pr_err("Failed to parse ACPI table\n");
 		return;
 	}
+
+	ret = arm64_tlbid_init(domains, domain_count);
+	if (ret)
+		pr_err("Failed to initialize domains\n");
+
+	for (int i = 0; i < domain_count; i++)
+		free_cpumask_var(domains[i].cpus);
+	kfree(domains);
 }
-- 
2.43.0


