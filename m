Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79BBCCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2mHNxrdcyCdjOC8UaZ3KKj4yFJc38wNox3ZNjX/kFk=; b=ogz7eKwAYXouCVL/SdLwgivZRO
	iOKvRBg8x6FS0neOoIKaBgKDIOINiHql1SjNHTJg1EIukvC7UDP1Le7mRhUJDbzCj/SzGIg0bivqR
	JkDi8YrZGjdMpxJGBGg7y7aGGH5BdHGisHR2CB5jLtdZ3BIHYM+uesz3hoGfuNLwotXnsb+7B6Yk9
	5Mqbhg0sCdHQCQpduXePeOcKXJJhqxWr1x91eg0MYynBmSKl+GmIZ1qFw8F2bDeu0XTiTPCXo/YpI
	zK0qcwSKxgF3fOa1oOLBXfHInvXb0EU0SWbQgHLW7jOAEGm1sYBN5nYTx4jAib/BXrTczaAuUJd+g
	Lkpk2leg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz8c-00000004Y3w-48aa;
	Sat, 17 Oct 2026 07:47:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz8a-00000004Y3Q-49vR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 07:47:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F15A60A99;
	Sat, 17 Oct 2026 07:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B717B1F000C4;
	Sat, 17 Oct 2026 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792223248;
	bh=l2mHNxrdcyCdjOC8UaZ3KKj4yFJc38wNox3ZNjX/kFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Twe2mVlhkJKDYyzsZ8Ev/T+GXddM8eeorcuIiMg8ERk3zKqFAlFO5zz7beot4zrni
	 1ZIngbhmrBa37IImCJyuNQntW1JeaPI0XJ/VA2wxmPRBWmW6EEQKosINkoi2qAvI1V
	 A5Ma3cEJWaKg5iCMg+bXa0sKbYfF5gKaiRm4R1AJ7a7djFfww0Vmddhl1RPIrp+ALp
	 kOQiXGuS6otPM6nL+4KYjxgWcEMUqOwrPrtgVgP3ERsq19XDUx+Sec0C0HT/KaiPhZ
	 fc2F7B3Pgj/qBr5R+rE+Po2QZhoVIPy9pJLVkObcb2zV3V9PxMswizBAbfJN8h807B
	 /TPAJ0WYTmgew==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 17 Oct 2026 09:47:19 +0200
Subject: [PATCH v2 2/3] ARM: bcm: Add CFE SMP support for the Genexis
 XG6846B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-2-bf6b4b374b6e@kernel.org>
References: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org>
In-Reply-To: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

The XG6846B CFE bootloader powers up CPU1 and leaves it in a holding pen
waiting for an interrupt. After waking, the stub reads the GPIO
GeneralPurpose register at 0xff800568 and branches to the stored address
in ARM state. The vendor kernel uses this mailbox and a wakeup IPI.

Add a machine SMP fallback for the XG6846B when PSCI is unavailable.
Read the mailbox address from the secondary CPU's cpu-release-addr
property. Map it as device memory, write secondary_startup_arm and
complete the write before sending the wakeup IPI. CPU1 is already
running, so no power or reset sequence is needed. Using the ARM entry
also supports kernels built in Thumb-2 mode. Clear any Thumb function
pointer tag before programming this ARM entry address.

Build the BCMBCA machine description independently of DEBUG_BCMBCA,
keeping the debug UART mapping conditional. Restrict the fallback to
the XG6846B and retain the generic PSCI path when firmware provides it.

Suggested-by: William Zhang <william.zhang@broadcom.com>
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/mach-bcm/Makefile       |  2 +-
 arch/arm/mach-bcm/board_bcmbca.c | 65 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)

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
index b510d959870a..1c2e3ce71a82 100644
--- a/arch/arm/mach-bcm/board_bcmbca.c
+++ b/arch/arm/mach-bcm/board_bcmbca.c
@@ -1,9 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (C) 2024 Linus Walleij <linus.walleij@linaro.org>
 
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/smp.h>
+
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
+#include <asm/psci.h>
+#include <asm/smp_plat.h>
 
+#ifdef CONFIG_DEBUG_BCMBCA
 /* This is needed for LL-debug/earlyprintk/debug-macro.S */
 static struct map_desc bcmbca_io_desc[] __initdata = {
 	{
@@ -13,11 +20,68 @@ static struct map_desc bcmbca_io_desc[] __initdata = {
 		.type = MT_DEVICE,
 	},
 };
+#endif
 
 static void __init bcmbca_map_io(void)
 {
+#ifdef CONFIG_DEBUG_BCMBCA
 	iotable_init(bcmbca_io_desc, ARRAY_SIZE(bcmbca_io_desc));
+#endif
+}
+
+#ifdef CONFIG_SMP
+static int bcm6846_boot_secondary(unsigned int cpu, struct task_struct *idle)
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
+static const struct smp_operations bcm6846_smp_ops __initconst = {
+	.smp_boot_secondary = bcm6846_boot_secondary,
+};
+
+static bool __init bcm6846_smp_init(void)
+{
+	if (!of_machine_is_compatible("genexis,xg6846b") || psci_smp_available())
+		return false;
+
+	smp_set_ops(&bcm6846_smp_ops);
+	return true;
 }
+#endif
 
 static const char * const bcmbca_dt_compat[] = {
 	/* TODO: Add other BCMBCA SoCs here to get debug UART support */
@@ -27,5 +91,6 @@ static const char * const bcmbca_dt_compat[] = {
 
 DT_MACHINE_START(BCMBCA_DT, "BCMBCA Broadband Access Processors")
 	.map_io = bcmbca_map_io,
+	.smp_init = smp_init_ops(bcm6846_smp_init),
 	.dt_compat = bcmbca_dt_compat,
 MACHINE_END

-- 
2.56.0


