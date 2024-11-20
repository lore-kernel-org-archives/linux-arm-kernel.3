Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F297D63954
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fojMSUGFEjSFrquY4bx17vnsQAawMTW14BjNYgkLCRE=; b=sfLyamROH+jvgyLhIHLq0CVIDF
	UMUY1JJVm1e4BNZh/I1C7Nom1NdanntCjJF0G/v0yYKz1jCEEuHz8bVDkYpSSxCpUn6Ggmf02PE+e
	CaBbWHqC3soNNzsk8kMYt9dBzN6btrjCEAATrHK9K8QldstGynF7xI5qs289PhL+W6BBc1X9z2YOQ
	jq1YWMBC6HbTknoDjxPp6uphi686gorZGZBJZ6q7vrB9JB/3FHmaX+q/FYqFcnYDJ7nEGxIVQvy/T
	J0LcRDfvwZZi1eNKCPIoJBIYEmL4nry4v76qHpuzWdANXCGckpKNriB+g8GlCdJE4cucuNNkJwPF/
	XrccduLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlS8-0000000FVTI-37OA;
	Wed, 20 Nov 2024 14:13:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlNI-0000000FUOI-3EhD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B9EFA430FE;
	Wed, 20 Nov 2024 14:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FBFC4CECD;
	Wed, 20 Nov 2024 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732111687;
	bh=2XwH/kArcNj2S46eo/6RFM8V2G4b0n3ScbcqO15AEO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LzswJd+DriBD91WZp+ISvkCIB8SVuW+pdDYPl6xXEv/B0y9dWiymAb/PWeJOAC36q
	 OFMpED1h4LbFONfE1cqqltwPyHriJ8DQMbQnheK7u9xiJmQsvKKrM0eqRQ5vouSLCY
	 iMuIJC2K6QCRHhH8iBwZG1iBvhItuv/zXlqU9hfY3zBdeKjbUcCfVuJn9N4fB7DbWw
	 r/GMoblLEMVu+rCW+Dfqiw0S/Hsc0/yY+3dRuWel2qcN2E5fzM898SRSg4ypkkacn0
	 YEAV0kmR3yysrEeBdCVQnKLtbEQGUfnjhs7E+Xak5fxwPNu8IiJ4dqJp4d78NX30Pe
	 ak62HMlY9LNWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Harith G <harith.g@alifsemi.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 2/4] ARM: 9420/1: smp: Fix SMP for xip kernels
Date: Wed, 20 Nov 2024 09:07:45 -0500
Message-ID: <20241120140758.1769473-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120140758.1769473-1-sashal@kernel.org>
References: <20241120140758.1769473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.173
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_060808_948608_524B8849 
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
index 3fc7f9750ce4b..ac3b1892a7a85 100644
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


