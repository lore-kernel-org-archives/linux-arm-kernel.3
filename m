Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8255BCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SAwb2KHxo/EKB1KjZuIDXXR8cPoheuP4WaqUgC+rpY=; b=P3l7MGoMpiLa6F5/hx7NXLsXXL
	E28XjHiJAVj39ZQeYEy8u0jO+VpUhMYHDqZfuhOClJ2dqO9HY0ug4HrdqOz71s3YShwjmEtAENpRT
	/yRRl6G1uyqKE8d2IvVXvkUj37qNHH7KUZBmYibNdf3o6Irl2H7kUPOgwiQuPgD/gMzNLcaqzcLFW
	tB4AyV2xhfcLnUfu47IbYfi5LXxcpE6jE3ra/BXwB/LCf0lgUJqVTMk/Zhe0EMBZ5feVTnaMUCaNC
	soBQEUeq6L4Xc4X3zHv3LzFBBHSdoBdIqjPLZXVx7PpIlw6Njklb3po4fXfpCfuwu339FyTJWFkME
	NjsXltrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7X1-00000005zga-02k0;
	Fri, 09 Oct 2026 10:08:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Wy-00000005zdz-2Kmr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:08:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39319438DA;
	Fri,  9 Oct 2026 10:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7871F00893;
	Fri,  9 Oct 2026 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540528;
	bh=8SAwb2KHxo/EKB1KjZuIDXXR8cPoheuP4WaqUgC+rpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h2BAUAlc9dhrjzb9Kj+S8uacULkrsYjJqHOJwpA26NUNrajQyu2cmnKHB6ydVjrvg
	 SMwQJenvFNe48h0xkoXYeOphMziUZoU1btAEX+qVGj5bl4gJ4ehtnmoBXJUWb3FhTD
	 B4ArRhAs/vyuchF299ODxJ8t0Ug0a+/Bp6iP4yVTTK//xSg3/7zTzFxmfdMbPuxdX8
	 1pw56K2K5jzEFiM4UhHPzJ0nTP3OqNcpF8KW13JSS3bwSM3HrinbXzSmujxHvzV7cO
	 42e22FEhTimh8eAXS6+NADN6EqqjsNT7NL7Irv87qpA4QvjMYFP40v6GSTFz7vRr3I
	 UC9271Q1+H2Wg==
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
Subject: [PATCH v2 16/23] arm64: cpu_ops: Make 'cpu_operations' pointer global instead of per-cpu
Date: Fri,  9 Oct 2026 11:07:27 +0100
Message-ID: <20261009100738.31288-17-will@kernel.org>
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

'cpu_ops' is an NR_CPUS-length array of 'cpu_operations' pointers, which
theoretically allows for different CPUs to have different bringup and
hotplug backends.

In reality, this complexity exists only to deal with the case where CPU0
is not hotpluggable, so replace the array with a single, global pointer
and record separately whether or not they apply to the boot CPU. Update
the logic in init_cpu_ops() to enforce that only a single set of
'cpu_ops' is required.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpu_ops.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
index e133011f64b5..eacfb88a0c0c 100644
--- a/arch/arm64/kernel/cpu_ops.c
+++ b/arch/arm64/kernel/cpu_ops.c
@@ -20,7 +20,8 @@ extern const struct cpu_operations acpi_parking_protocol_ops;
 #endif
 extern const struct cpu_operations cpu_psci_ops;
 
-static const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
+static const struct cpu_operations *cpu_ops __ro_after_init;
+static bool boot_cpu_has_enable_method __ro_after_init;
 
 static const struct cpu_operations *const dt_supported_cpu_ops[] __initconst = {
 	&smp_spin_table_ops,
@@ -40,6 +41,9 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
 {
 	const struct cpu_operations *const *ops;
 
+	if (!name)
+		return NULL;
+
 	ops = acpi_disabled ? dt_supported_cpu_ops : acpi_supported_cpu_ops;
 
 	while (*ops) {
@@ -49,6 +53,7 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
 		ops++;
 	}
 
+	pr_warn("Unsupported enable-method: %s\n", name);
 	return NULL;
 }
 
@@ -94,25 +99,31 @@ static const char *__init cpu_read_enable_method(int cpu)
 	return enable_method;
 }
 /*
- * Read a cpu's enable method and record it in cpu_ops.
+ * Read a cpu's enable method and update/check cpu_ops.
  */
 int __init init_cpu_ops(int cpu)
 {
 	const char *enable_method = cpu_read_enable_method(cpu);
+	const struct cpu_operations *ops = cpu_get_ops(enable_method);
 
-	if (!enable_method)
+	if (!ops)
 		return -ENODEV;
 
-	cpu_ops[cpu] = cpu_get_ops(enable_method);
-	if (!cpu_ops[cpu]) {
-		pr_warn("Unsupported enable-method: %s\n", enable_method);
-		return -EOPNOTSUPP;
-	}
+	if (!cpu_ops)
+		cpu_ops = ops;
+	else if (cpu_ops != ops)
+		return -EBUSY;
+
+	if (cpu == 0)
+		boot_cpu_has_enable_method = true;
 
 	return 0;
 }
 
 const struct cpu_operations *get_cpu_ops(int cpu)
 {
-	return cpu_ops[cpu];
+	if (cpu || boot_cpu_has_enable_method)
+		return cpu_ops;
+
+	return NULL;
 }
-- 
2.56.0.385.gd3acb90ef8-goog


