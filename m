Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA558D29C46
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7DSKOLf1JwHasuEDglCrdB4m0c5EheeJOADb/4PLxs=; b=l8wYN9RMEdTLWH9/7L6qEaK5ES
	3c5mTJCDjw7FoEI/PngirY37MJ8Jz633TVwObB6EX43xoWhMPog8YbT9RN28Tweyw5HUGyVQsGVzW
	hRAwsSlX0Ok3IrvRTm/c8ROf9DDwLE0hne59qgyAMKtmMQx4eVgUu4Zq+G3U5VH/8CQsfaf18Tw+0
	K80+1v0/7OL1InAVKFAZoO2IpKTtRHx/t+BuuAAxKCLb7rgcOE+4A+aJcXvrhmTFhkmxdVzMGYCZO
	momskD0yM+/LjBm+18ha7mmrJODWO4u9QzncFKfFNzb5MGbINHzV94Wxnq5t7wCKRIWo/77ty+0H5
	i8oa930g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYN-00000002ZRh-13CN;
	Mon, 19 Jan 2026 16:56:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYE-00000002ZO2-1RwJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g7DSKOLf1JwHasuEDglCrdB4m0c5EheeJOADb/4PLxs=; b=IYfEZ1bOLHMHC5OI8S9A/lhPig
	8LAhyVNPLSbxb8omnCAJUk1QpnH8CmCOLyizkAgnmZA3y1owVxOXhwi1Gu+DdOvqLiDmXYVRHT3TB
	MOMOEYCSy00s7TsT9KPwDxxCWxP5weUvw26Lddu8VGu35WScFDBXp3WWOYuB+wr23zjlpQS4SifDJ
	1Fz/3U60UEQW5ruSUkjALbBSqt7NHz3HRl0Pqx0GbQtpDn5e2Mv6OxIRVAu8AxeIJDMVjAsE4v6Ri
	Tr6pXg1teBMwhA3UTBb8UtCm7ZN84Y5V/vX+Rl0mGmDl7xTTEmq3xR5TLKAULAK7FY6A+DY8v3pgx
	9IaIM3ng==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYB-0000000CbSI-2jBc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:56:25 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4801d21c280so26331565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 08:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768841781; x=1769446581; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g7DSKOLf1JwHasuEDglCrdB4m0c5EheeJOADb/4PLxs=;
        b=gLu/1RkzP6xn3XCa2DHaCszOGCW/o9l96YwWhLn8JcHZPCg0RcWD11hD8HG5UI1sPK
         307zQ2vWLQm4qXUXzLH2CZcYY8eXyRrSeZAc9fEv9f3og1LkVsjKtqQ6C6NxlO6UXptp
         RPU/NcSj3vhXKVISotccbjV/Rh4fNJPs5GJvxNngGSQBHQDiZqXynCtCS5jeZ1+/Klk3
         07RujwAX9X5eUVsJsOuP3CGyfeK57+17IE53UVGbRHoCawRDcP091Qze2qo0QGHyOBuY
         eClmZCwktTTuo4aFE5LZGsYbfQ2qZVk6fqMZe596bIaH7qsbZREQ/y1UCkuUgvl6ePEg
         eUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841781; x=1769446581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7DSKOLf1JwHasuEDglCrdB4m0c5EheeJOADb/4PLxs=;
        b=b5FhTY0W6uo7MnuHP9Xb1dC0cEgblk3B80mhJkjLHdl493Jr4olb5qFIiZHpKEqEuq
         XWsB3xj8dIjGIS1nxVSiSLAAlYmOLaOgZ1TfiPhFCrc8f90KE7Zwy0AJWPFJOf7rvD3D
         x22pI0bD1A2Svj+rQ2iO7PrMMacdgmUw3pcSbV0IvlIbbiIyM4st2zJ170jHsDA1+/iJ
         bKxiwzlwOHE3q/1vhUVsxXjXGKcKqpXnrYEqO1PpijdRC2Yd6irZu6WW/fSmr2JMJ9xk
         EoJjmits5O2o2fyxhsb9gfDPObKx2IWRsouAjp5ehNWdb7/IjXz/ZAVnVvg+1dm5yD6S
         PaYg==
X-Gm-Message-State: AOJu0YxJYm0gGPv/5jYl1Wh5bxuDTXDNSD/l1iOpM+s8IxF56M+pL8jZ
	P9Y7SY0jJX4p99zjll5BYYf6WXWDBlSY0aDYR6tWe/Lfqq3pqkmeuzUwRH2ChCxUm7K2cYha2w=
	=
X-Received: from wmbej6.prod.google.com ([2002:a05:600c:3e86:b0:47e:df88:7cfe])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:458d:b0:47d:264e:b435
 with SMTP id 5b1f17b1804b1-4801e34209cmr132069005e9.22.1768841780932; Mon, 19
 Jan 2026 08:56:20 -0800 (PST)
Date: Mon, 19 Jan 2026 17:47:50 +0100
In-Reply-To: <20260119164747.1402434-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260119164747.1402434-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107; i=ardb@kernel.org;
 h=from:subject; bh=YrSGOpU4qNxhCTfRtGfyxeLhK1Fead/uCkhL+lifxpA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JITMvwdSGu/8qa+8TA732DkZmBYst747LP9BzcpcMTeb6n
 JDQ7NZRysIgxsUgK6bIIjD777udpydK1TrPkoWZw8oEMoSBi1MAJqLWzshwa/KfPfxu/vcdp9h2
 W5qsVV78vbr429dVL3bWSkYb3/2ykpGha9HT9ayrrHMuTF0q299789eMl8dsctkfv9uVMfeM/61 pTAA=
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119164747.1402434-8-ardb+git@google.com>
Subject: [PATCH 2/4] arm64: Map the kernel data/bss read-only in the linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_165623_773719_B63AC5AA 
X-CRM114-Status: GOOD (  15.96  )
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

From: Ard Biesheuvel <ardb@kernel.org>

On systems where the bootloader adheres to the original arm64 boot
protocol, the placement of the kernel in the physical address space is
highly predictable, and this makes the placement of its linear alias in
the kernel virtual address space equally predictable, given the lack of
randomization of the linear map.

The linear aliases of the kernel text and rodata regions are already
mapped read-only, but the kernel data and bss are mapped read-write in
this region in this region. This is not needed, so map them read-only as
well.

Note that the statically allocated kernel page tables do need to be
modifiable via the linear map, so leave these mapped read-write.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/mmu.h |  2 +-
 arch/arm64/kernel/smp.c      |  2 +-
 arch/arm64/mm/mmu.c          | 14 ++++++++++++--
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 137a173df1ff..8b64d2fcb228 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -77,7 +77,7 @@ extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 			       unsigned long virt, phys_addr_t size,
 			       pgprot_t prot, bool page_mappings_only);
 extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
-extern void mark_linear_text_alias_ro(void);
+extern void remap_linear_kernel_alias(void);
 extern int split_kernel_leaf_mapping(unsigned long start, unsigned long end);
 extern void linear_map_maybe_split_to_ptes(void);
 
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..b5f888ab5d17 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -441,7 +441,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	hyp_mode_check();
 	setup_system_features();
 	setup_user_features();
-	mark_linear_text_alias_ro();
+	remap_linear_kernel_alias();
 }
 
 void __init smp_prepare_boot_cpu(void)
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8e1d80a7033e..2a18637ecc15 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1023,14 +1023,24 @@ static void __init __map_memblock(pgd_t *pgdp, phys_addr_t start,
 				 prot, early_pgtable_alloc, flags);
 }
 
-void __init mark_linear_text_alias_ro(void)
+static void remap_linear_data_alias(void)
+{
+	extern const u8 __pgdir_start[];
+
+	update_mapping_prot(__pa_symbol(__init_end), (unsigned long)lm_alias(__init_end),
+			    (unsigned long)__pgdir_start - (unsigned long)__init_end,
+			    PAGE_KERNEL_RO);
+}
+
+void __init remap_linear_kernel_alias(void)
 {
 	/*
-	 * Remove the write permissions from the linear alias of .text/.rodata
+	 * Remove the write permissions from the linear alias of the kernel
 	 */
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
+	remap_linear_data_alias();
 }
 
 #ifdef CONFIG_KFENCE
-- 
2.52.0.457.g6b5491de43-goog


