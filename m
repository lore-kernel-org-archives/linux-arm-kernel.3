Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1EAD63954
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU9ylLInmJutWcFwS2fCxYkWXq6zztLQOerq3Uv4fKE=; b=JcL3GyW1TiPlRze1B315lNl5w+
	Rl6/xB4Ut0h/lCr/wYtNROTmR78KxehJlz5AYo98DygP4+FeN1DEx9hj2Cvoq83PlvTYFgMWnsl/0
	CPJ0J2FVUn+6W1sPh90q9T6J42u639NfBcKdQdr9NnpzR1DH9bx8kyq3sRo9OkKb1bjDtdyAWtGf7
	m/z+Z62o/TxNPwtXKFvwsED1AMu4V0GucJme740bAzvvQCVW6K/Zn9NXofIkqw2RsxJr/wSKAplP/
	Y40s9zHCTtkT6wuQqF2sWOyNFOWHRvPWm3uQiLLuqqm64kuihccq9xUtf0F0yUcV7P8TDYii9EXjC
	UXE0gBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlMe-0000000FUEq-0ubI;
	Wed, 20 Nov 2024 14:07:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlLh-0000000FU2s-31eo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:06:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 350A75C5652;
	Wed, 20 Nov 2024 14:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB14DC4CECD;
	Wed, 20 Nov 2024 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732111587;
	bh=rAPJ3CsyNt0xoIeocO8Oj1jzcSTExIhRjL94487yK10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jfutD6s2a9K0pxcYhWlgjEtERadoL9h55J5opCf6nylcQ3BEM8/B4+Hs+3qbqm7Nh
	 PWIuDKojwhCFJZN1G8M517q/fLA0JdcFtup6stIr67Jk8fhR62ET9W3cbRj6dsoM6K
	 hk8jHdMIGVxI6n78gxS1XUe3GiWa3Cy/oQs9zec+am94cLgvbO1ZsDjsUpC4ZlDVQ4
	 8sNon9D/zN6Qn/FUI3I9dXXlZrmPeSnmiyr8AeKgpp4eOlJx6T6SWXAV4jv6J85DbI
	 xuEO1WE0usuydnZ6pyHGz5Z0khjkGvVbcKtBQK9I4OUNjTDYNeytW9UCqNjYrz+OQX
	 Jbtry3Z8I6f2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Harith G <harith.g@alifsemi.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 07/10] ARM: 9420/1: smp: Fix SMP for xip kernels
Date: Wed, 20 Nov 2024 09:05:32 -0500
Message-ID: <20241120140556.1768511-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120140556.1768511-1-sashal@kernel.org>
References: <20241120140556.1768511-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_060629_851929_7E0651E7 
X-CRM114-Status: GOOD (  11.69  )
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

From: Harith G <harith.g@alifsemi.com>

[ Upstream commit 9e9b0cf9319b4db143014477b0bc4b39894248f1 ]

Fix the physical address calculation of the following to get smp working
on xip kernels.
- secondary_data needed for secondary cpu bootup.
- secondary_startup address passed through psci.
- identity mapped code region needed for enabling mmu for secondary cpus.

Signed-off-by: Harith George <harith.g@alifsemi.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/kernel/head.S     | 4 ++++
 arch/arm/kernel/psci_smp.c | 7 +++++++
 arch/arm/mm/idmap.c        | 7 +++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index 1ec35f065617e..e573adfe73b28 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -407,7 +407,11 @@ ENTRY(secondary_startup)
 	/*
 	 * Use the page tables supplied from  __cpu_up.
 	 */
+#ifdef CONFIG_XIP_KERNEL
+	ldr	r3, =(secondary_data + PLAT_PHYS_OFFSET - PAGE_OFFSET)
+#else
 	adr_l	r3, secondary_data
+#endif
 	mov_l	r12, __secondary_switched
 	ldrd	r4, r5, [r3, #0]		@ get secondary_data.pgdir
 ARM_BE8(eor	r4, r4, r5)			@ Swap r5 and r4 in BE:
diff --git a/arch/arm/kernel/psci_smp.c b/arch/arm/kernel/psci_smp.c
index d4392e1774848..3bb0c4dcfc5c9 100644
--- a/arch/arm/kernel/psci_smp.c
+++ b/arch/arm/kernel/psci_smp.c
@@ -45,8 +45,15 @@ extern void secondary_startup(void);
 static int psci_boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
 	if (psci_ops.cpu_on)
+#ifdef CONFIG_XIP_KERNEL
+		return psci_ops.cpu_on(cpu_logical_map(cpu),
+			((phys_addr_t)(&secondary_startup)
+			- XIP_VIRT_ADDR(CONFIG_XIP_PHYS_ADDR)
+			+ CONFIG_XIP_PHYS_ADDR));
+#else
 		return psci_ops.cpu_on(cpu_logical_map(cpu),
 					virt_to_idmap(&secondary_startup));
+#endif
 	return -ENODEV;
 }
 
diff --git a/arch/arm/mm/idmap.c b/arch/arm/mm/idmap.c
index 448e57c6f6534..4a833e89782aa 100644
--- a/arch/arm/mm/idmap.c
+++ b/arch/arm/mm/idmap.c
@@ -84,8 +84,15 @@ static void identity_mapping_add(pgd_t *pgd, const char *text_start,
 	unsigned long addr, end;
 	unsigned long next;
 
+#ifdef CONFIG_XIP_KERNEL
+	addr = (phys_addr_t)(text_start) - XIP_VIRT_ADDR(CONFIG_XIP_PHYS_ADDR)
+		+ CONFIG_XIP_PHYS_ADDR;
+	end = (phys_addr_t)(text_end) - XIP_VIRT_ADDR(CONFIG_XIP_PHYS_ADDR)
+		+ CONFIG_XIP_PHYS_ADDR;
+#else
 	addr = virt_to_idmap(text_start);
 	end = virt_to_idmap(text_end);
+#endif
 	pr_info("Setting up static identity map for 0x%lx - 0x%lx\n", addr, end);
 
 	prot |= PMD_TYPE_SECT | PMD_SECT_AP_WRITE | PMD_SECT_AF;
-- 
2.43.0


