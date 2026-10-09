Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436D6CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejWlqAZiflFRPHyVuEca3IrvbIYIVFJO3Zo4KOgmGFk=; b=ZCtbRt3Bw7cZznVCAl7aNrPFat
	kBg/B6RG3wWpl1DBZHfyqFqdCy9NF19KrFzcZpHHoTdpGzarlyroG7K6vL0jxcXuy9c/9RC5TRjkj
	0e9LQrtGJ+IzbDEk2z/zYlwCI0ZVOCqpYSdsEP5EpBLKW7XKJjQumIwMfcMZ1Xvpk5IZSDzQpk8OZ
	Bkzmvd1XS9Fm7Wrd2U+Vl7rZOYwVH4kb0/km3GeJ8K1IQ0X7wcTs/t//fOHuAENg6tG9DeEnadZYT
	kWYqhNFKOiKqmZmRapqf3tkajLpW3enqL5by4f/Od5drIxWVz6AWsYrZH4FKGX5aHUmdmTLSVEvId
	1vwnuDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7XC-00000005zt5-0QE2;
	Fri, 09 Oct 2026 10:09:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7XA-00000005zqJ-1RO1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:09:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BF45C6053A;
	Fri,  9 Oct 2026 10:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442971F000FF;
	Fri,  9 Oct 2026 10:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540539;
	bh=ejWlqAZiflFRPHyVuEca3IrvbIYIVFJO3Zo4KOgmGFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lkTEbCDEkBPd7DIkTzOcxFUamN6RLoxwhq3irgquiJVBvNq/MUpBjSyrs00+c5Whn
	 ssskytPWZYCnSxZEFc3SCq5WDv7lVqh/YdJm7WP97jzGxI7WWue9GN9i/x+eD9h+aJ
	 /l26/HW3WSq4/EMuKFQ27RSMf9yBFCT9AvlssPhrBndu6LWLEB7vtyiEmyL3DpWlsf
	 W4f5dwEgyWIGDhv+iSw9TmlfslOM+VltATUiaWhZ36sIdfg/dYIhNagoQEEZQfz42P
	 c6HQ2WHeNpltVkvSIo18WoWlMrRSbdFrsoeNIEV9ZqPo2GCG2ZAMoNrHaAN0Cni2iY
	 r7WVRJuIzCSvg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 19/23] firmware/psci: Extend ->cpu_on() callback to take an additional argument
Date: Fri,  9 Oct 2026 11:07:30 +0100
Message-ID: <20261009100738.31288-20-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In preparation for hooking up the 'context ID' parameter introduced by
PSCI v0.2 to the CPU_ON call, extend the ->cpu_on() callback to take
an additional argument and modify all callers to pass 0 for now.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm/kernel/psci_smp.c   |  4 ++--
 arch/arm64/kernel/psci.c     |  2 +-
 drivers/firmware/psci/psci.c | 20 ++++++++++++++------
 include/linux/psci.h         |  3 ++-
 4 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/arm/kernel/psci_smp.c b/arch/arm/kernel/psci_smp.c
index 3bb0c4dcfc5c..bf05dbf433b1 100644
--- a/arch/arm/kernel/psci_smp.c
+++ b/arch/arm/kernel/psci_smp.c
@@ -49,10 +49,10 @@ static int psci_boot_secondary(unsigned int cpu, struct task_struct *idle)
 		return psci_ops.cpu_on(cpu_logical_map(cpu),
 			((phys_addr_t)(&secondary_startup)
 			- XIP_VIRT_ADDR(CONFIG_XIP_PHYS_ADDR)
-			+ CONFIG_XIP_PHYS_ADDR));
+			+ CONFIG_XIP_PHYS_ADDR), 0);
 #else
 		return psci_ops.cpu_on(cpu_logical_map(cpu),
-					virt_to_idmap(&secondary_startup));
+					virt_to_idmap(&secondary_startup), 0);
 #endif
 	return -ENODEV;
 }
diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
index fabd732d0a2d..6b25a12ed143 100644
--- a/arch/arm64/kernel/psci.c
+++ b/arch/arm64/kernel/psci.c
@@ -39,7 +39,7 @@ static int __init cpu_psci_cpu_prepare(unsigned int cpu)
 static int cpu_psci_cpu_boot(unsigned int cpu)
 {
 	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
-	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry);
+	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry, 0);
 	if (err && err != -EPERM)
 		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
 
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 8bb3f7c37678..95034485cb4d 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -219,22 +219,30 @@ static int psci_0_2_cpu_off(u32 state)
 	return __psci_cpu_off(PSCI_0_2_FN_CPU_OFF, state);
 }
 
-static int __psci_cpu_on(u32 fn, unsigned long cpuid, unsigned long entry_point)
+static int __psci_cpu_on(u32 fn, unsigned long cpuid, unsigned long entry_point,
+			 unsigned long context)
 {
 	int err;
 
-	err = invoke_psci_fn(fn, cpuid, entry_point, 0);
+	err = invoke_psci_fn(fn, cpuid, entry_point, context);
 	return psci_to_linux_errno(err);
 }
 
-static int psci_0_1_cpu_on(unsigned long cpuid, unsigned long entry_point)
+static int psci_0_1_cpu_on(unsigned long cpuid, unsigned long entry_point,
+			   unsigned long mbz)
 {
-	return __psci_cpu_on(psci_0_1_function_ids.cpu_on, cpuid, entry_point);
+	if (mbz)
+		return -EINVAL;
+
+	return __psci_cpu_on(psci_0_1_function_ids.cpu_on, cpuid, entry_point,
+			     0);
 }
 
-static int psci_0_2_cpu_on(unsigned long cpuid, unsigned long entry_point)
+static int psci_0_2_cpu_on(unsigned long cpuid, unsigned long entry_point,
+			   unsigned long context)
 {
-	return __psci_cpu_on(PSCI_FN_NATIVE(0_2, CPU_ON), cpuid, entry_point);
+	return __psci_cpu_on(PSCI_FN_NATIVE(0_2, CPU_ON), cpuid, entry_point,
+			     context);
 }
 
 static int __psci_migrate(u32 fn, unsigned long cpuid)
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc4..0f43868a0bee 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -25,7 +25,8 @@ struct psci_operations {
 	u32 (*get_version)(void);
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
 	int (*cpu_off)(u32 state);
-	int (*cpu_on)(unsigned long cpuid, unsigned long entry_point);
+	int (*cpu_on)(unsigned long cpuid, unsigned long entry_point,
+		      unsigned long context);
 	int (*migrate)(unsigned long cpuid);
 	int (*affinity_info)(unsigned long target_affinity,
 			unsigned long lowest_affinity_level);
-- 
2.56.0.385.gd3acb90ef8-goog


