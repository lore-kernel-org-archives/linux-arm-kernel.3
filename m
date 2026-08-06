Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9687DC5620A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuSw8PyHR5EplcrqG8+HZ+85Dl0Ckz8ecCi5UKpH+2g=; b=D4LPRarKWDvZac8XnpLdY1mwdE
	bMv4qfbQxovESAlwptOiqsUKg7u98AqrQbQdhPBLbbfGtMh/2dCmjYnihxPAzYE4C7fJ0bwAKQ4GQ
	jWE9fmbYm3gkdaN61MRyem8m4JRjwnAcPH/jJYohlCMcvmcVdwe9jrGK6p5NDNRiv2XeJeGNI5NUf
	yGaSZ4X+uATZ4g3Ic61Hks4IpQrXyVdScrVu74folHJY5tyElBZijm/i+BLLzydy4rgb7aorlA1J1
	0fJ8BJ8IHF6ADZu7yk5kj8GIiOSQguL+tloT3DmiPdNH7IsyJ6lp+6/PjkLPZ0ProxJJOho6ABYJN
	xAXwyoqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWm-00000005QJA-12g2;
	Thu, 06 Aug 2026 09:36:40 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWi-00000005QDK-1Orm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:36:38 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c888c001628so1207855a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008996; x=1786613796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LuSw8PyHR5EplcrqG8+HZ+85Dl0Ckz8ecCi5UKpH+2g=;
        b=aVgmjEfQQcIkRjSFFYTfpxQ/6PG687uT3wDbdq2DLPSgwE3Q5VCCDGMybt2/mcvzVF
         PXCwdPbfgEzIQewrsHUQwchmfjwNXaVmlN8fC6kXuwagBotahvu98c0Y6YJfraPG+QT8
         j+X/sLtFwzF5mrjtfOcazLKbzrIpBZ8xQk+xEj1/X7nQEgTUClRTI6yCP0n1Jzir7PHw
         JNrB4fhOjVC0akvztaMZ5cDryFKf6bfpExxtkWFAIxzjje88rMesjAOwKHvGuIDGvaOn
         TAywWrCJJJ7PZYg2YaBBM4I6wYPcg7jLzXtqYLsraQ182kvQMf5Pa7ttHRwxSnpEGCVu
         1NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008996; x=1786613796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LuSw8PyHR5EplcrqG8+HZ+85Dl0Ckz8ecCi5UKpH+2g=;
        b=CQldyfYPVFP0qub/W03GyYKzg3mXWNpZbVS222c3e19OKqUe2Bo8LeNChgJW0Ak0p9
         EaP6gfxuy38gdP0VQ1gtL+pKBmnrIdjp7Q4q9RU2Eo2NI0TPKEbb3ifm5Tfu+hkeAON9
         kmJANAUS3WJqfyvBrSpqiwVum98oPPvl4cmSdWPNkaUyNps+X31q3RwvDWlf3oi0hJRl
         B69hWic1Ef61baKwOLU/e808fGWmlao+PIcLpjG6ZU9QoQCkQoFsbi5NXR/Dp+c5bGBF
         92p5zd4mqxYOXjgp7DzFwZF7fM7vFYjniAp7BISP0O048G8afQkkOXrZqCR3eKSJt3Mz
         sVTw==
X-Forwarded-Encrypted: i=1; AHgh+RpHzgBcLM9QO373HgLxdj1m4UZsV47nZ2iP6gswQtOlAsUUrwIBpyr9CQ18emA2ycg5B0ppwcdAaBmgtoWusvs7@lists.infradead.org
X-Gm-Message-State: AOJu0YxqeVRnjbr+p4voI7EmUIyIKEyDIOKEQLlj+Bgedacl3A8/hFjs
	s7efDQ1eac/FvSRi3RLg9BR/+mMifowpVaeumfwf1CrKz/L5tMxXJL28
X-Gm-Gg: AR+sD110ODPDfqOmNxm65yTEwyz54qqUBK8fbpKS5PiT6Q0ac9HdnEWDVuOlZB0/OI1
	Mk6gv4uRdZowQeaupj0DRDrBT6q3jcL4vWiNdf5eISaZ0S7BLOeAimy+G6sELg7Zm38F6OM72Y8
	hDQS93X2rt9sNug7wLPkn/H7QDloiWey0RGjAF/9YsKjoD84+INtQwS0Mspx4CLlLJ0ztgzMtn3
	VxvyMjtWaiAHqcE46Eaxcfk05UM6MM60BcBF74WrS2+K0zlAP7njr5IbcbhDFC2qKTMtV+Ih7FW
	w1+I59AIUsLiQe0Z4ByoKEgFhQPs3ZcQ3BWZ9fFz5+WFbZge32NEN6MoavcTOe6cl3/QdKEjc0M
	8d5mYbBjtsctMWfGguBA98p00xoUCY1Uv4JgmPWk0Ku7MhUNzgj+rUo8YhElF1/MFMyYroYOcG/
	NYhxDetobfMtdc1oCOy7Zd6bT5psqWinBlVT2+s8qkgJeV6miyqIvrD3MIVjteaEPIIwHkpHi4N
	g==
X-Received: by 2002:a05:6a00:298e:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84f2e0151aemr16066036b3a.4.1786008995542;
        Thu, 06 Aug 2026 02:36:35 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:34 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 5/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Thu,  6 Aug 2026 17:35:16 +0800
Message-ID: <20260806093519.2907771-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023636_406244_65E99E15 
X-CRM114-Status: GOOD (  12.16  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Replace walk_system_ram_res() with for_each_mem_range(). The
MEMBLOCK_NODUMP flag lives in memblock, so only by walking memblock
can the reserved-memory regions marked MEMBLOCK_NODUMP be excluded
from the vmcore.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs
ARCH_KEEP_MEMBLOCK to filter reserved memory from the vmcore, so
extend its condition (ACPI || KEXEC) with (KEXEC_FILE &&
CRASH_DUMP). arm64 and loongarch already select ARCH_KEEP_MEMBLOCK
unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ef1101bec76c..bd8726b4dfbe 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -57,7 +57,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || (KEXEC_FILE && CRASH_DUMP)
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..808e872f4063 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
-{
-	unsigned int *nr_ranges = arg;
-
-	(*nr_ranges)++;
-	return 0;
-}
-
 unsigned int arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
+	u64 i;
+	phys_addr_t start, end;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	u64 i;
+	phys_addr_t start, end;
 
-	cmem->ranges[cmem->nr_ranges].start = res->start;
-	cmem->ranges[cmem->nr_ranges].end = res->end;
-	cmem->nr_ranges++;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
 
 	return 0;
 }
 
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
-- 
2.43.0


