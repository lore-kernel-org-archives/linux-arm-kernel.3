Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B264E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aF9iY2Fn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iETnJ9cv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/Exo4AK19GTzwkvKo3vH6KeH1XDMwNptpNsby8IlEmA=; b=aF9iY2FnnQHfw4
	GonbDmUM++eLxIZJKMpq3ps3HLkL7lV2oMj3yo3b0ZGZ7MuN3otR42Wo7Ne+4biWAUpqCLYB1T5bl
	P9kYnrltajbCqfXODo9HM6Qgh/1D/Bq3gRJyyQnXbWV2Lx8jsVQhrIXh+rLB9+WnNilJlPmmjboum
	peT9sHrvytzjFkfceQDw0+Os4aSHZoHMTBKEcdwlODDZcE0cA0zxiL0FUgzy40Pln0w5Yqjsx+DTi
	WZPcnZ7VxMScrtE0E4is1grl+oZP4qrZTY1F3TdkXQJ+zI4xb5Gdbv8aW80iEmUsJTjikvt25CrFm
	hf7cgeMMXQpJNUOLeCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKsS4-00000000pl0-2imE;
	Sun, 25 Oct 2026 07:15:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKsRx-00000000pj7-3LDA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 07:15:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41667600DA;
	Sun, 25 Oct 2026 07:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59211F01825;
	Sun, 25 Oct 2026 07:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792912525;
	bh=/Exo4AK19GTzwkvKo3vH6KeH1XDMwNptpNsby8IlEmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iETnJ9cvKshtATIDb2zWkFNTuckYe+HE7to7fAxBrt0IJQQVAyv3g5KiPYeIdNgCR
	 2cDvV5h+KcCiSwRw4E+EC1rOKKu0GhqaUb0BsbBMpgO08yquo0FqdLqx7XQOENsb+O
	 R4IWeY/ruaSSQk240BjO4gtrisGZ9UftCFyzhLrPWQbELzypfeRL4qnqCny5l/ue0p
	 kKNTIeExyA+YuNWCRyJp9mx80/+AIMWTgb9NnIy5FUMutzUqHMSjhJ8noiQHiquuU7
	 23hRwmz91td5/cUy0MXAlhlEruOI856244KMnhq62+J1fLTfGmClB4YMxzQfjbYu6i
	 cMoOcPEa9YPWg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 25 Oct 2026 08:15:13 +0100
Subject: [PATCH v4 2/3] ARM: bcm: Add CFE SMP support for BCMBCA
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-2-b352ab54f46b@kernel.org>
References: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
In-Reply-To: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Russell King <linux@armlinux.org.uk>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The XG6846B CFE bootloader powers up CPU1 and leaves it in a holding pen
waiting for an interrupt. After waking, the stub reads the GPIO
GeneralPurpose register at 0xff800568 and branches to the stored address
in ARM state. The vendor kernel uses this mailbox and a wakeup IPI.

Implement the brcm,bca-smp CPU enable-method for BCMBCA systems
booted through CFE.
Read the mailbox address from the secondary CPU's cpu-release-addr
property. Map it as device memory, write secondary_startup_arm and
complete the write before sending the wakeup IPI. CPU1 is already
running, so no power or reset sequence is needed. Using the ARM entry
also supports kernels built in Thumb-2 mode. Clear any Thumb function
pointer tag before programming this ARM entry address.

Register the operations with CPU_METHOD_OF_DECLARE() so the CPU
nodes select CFE bring-up explicitly. Build the BCMBCA machine
description independently of DEBUG_BCMBCA, keeping the debug UART
mapping conditional. The generic ARM startup code retains PSCI priority.

Suggested-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/mach-bcm/Makefile       |  2 +-
 arch/arm/mach-bcm/board_bcmbca.c | 56 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
index 6baedf4c6304..fcc4e0174adc 100644
--- a/arch/arm/mach-bcm/Makefile
+++ b/arch/arm/mach-bcm/Makefile
@@ -58,6 +58,6 @@ endif
 
 # BCMBCA
 ifeq ($(CONFIG_ARCH_BCMBCA),y)
-obj-$(CONFIG_DEBUG_BCMBCA)	+= board_bcmbca.o
+obj-y				+= board_bcmbca.o
 obj-$(CONFIG_SMP)		+= bcm63xx_smp.o bcm63xx_pmb.o
 endif
diff --git a/arch/arm/mach-bcm/board_bcmbca.c b/arch/arm/mach-bcm/board_bcmbca.c
index b510d959870a..248b8bd77645 100644
--- a/arch/arm/mach-bcm/board_bcmbca.c
+++ b/arch/arm/mach-bcm/board_bcmbca.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (C) 2024 Linus Walleij <linus.walleij@linaro.org>
 
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/smp.h>
+
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
+#include <asm/smp_plat.h>
 
+#ifdef CONFIG_DEBUG_BCMBCA
 /* This is needed for LL-debug/earlyprintk/debug-macro.S */
 static struct map_desc bcmbca_io_desc[] __initdata = {
 	{
@@ -13,12 +19,62 @@ static struct map_desc bcmbca_io_desc[] __initdata = {
 		.type = MT_DEVICE,
 	},
 };
+#endif
 
 static void __init bcmbca_map_io(void)
 {
+#ifdef CONFIG_DEBUG_BCMBCA
 	iotable_init(bcmbca_io_desc, ARRAY_SIZE(bcmbca_io_desc));
+#endif
 }
 
+#ifdef CONFIG_SMP
+static int bcmbca_boot_secondary(unsigned int cpu, struct task_struct *idle)
+{
+	struct device_node *np;
+	void __iomem *mailbox;
+	u32 release_addr;
+	int ret;
+
+	/* CFE has already powered up CPU1 and left it waiting in WFI. */
+	if (cpu_logical_map(cpu) != 1)
+		return -EINVAL;
+
+	np = of_get_cpu_node(cpu, NULL);
+	if (!np)
+		return -ENODEV;
+
+	ret = of_property_read_u32(np, "cpu-release-addr", &release_addr);
+	of_node_put(np);
+	if (ret) {
+		pr_err("CPU%u: missing or invalid cpu-release-addr property\n", cpu);
+		return ret;
+	}
+
+	mailbox = ioremap(release_addr, sizeof(u32));
+	if (!mailbox)
+		return -ENOMEM;
+
+	/*
+	 * The CFE stub reads GPIO GeneralPurpose after an interrupt and
+	 * branches to it in ARM state. Clear any Thumb function pointer
+	 * tag and complete the MMIO write before sending the wakeup IPI.
+	 */
+	writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
+	dsb(sy);
+	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
+	iounmap(mailbox);
+
+	return 0;
+}
+
+static const struct smp_operations bcmbca_smp_ops __initconst = {
+	.smp_boot_secondary = bcmbca_boot_secondary,
+};
+
+CPU_METHOD_OF_DECLARE(bcmbca_smp, "brcm,bca-smp", &bcmbca_smp_ops);
+#endif
+
 static const char * const bcmbca_dt_compat[] = {
 	/* TODO: Add other BCMBCA SoCs here to get debug UART support */
 	"brcm,bcm6846",

-- 
2.56.0


