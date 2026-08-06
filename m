Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7D3C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVDvUsuVz4fOLoguLRCQrGgJgNWPqJ2TDc/OI8CtAH0=; b=p1aS+rOMv7Rdfh9RtPlP1An/iG
	+AwSPrGEDLnDr01e4YLL+MGBsYw4/tOa6DB9YXK/F2Ee46lmfbg84cDJlAgO9LioGptkwTD0pdMe/
	/TvRl+T87Uwz09skg5vngOYnLZVNTGRl3j0CXizMUDIfPi7nqwC/OBJzXHpv+Xpvbhvus/cmRejgE
	J4ez86S1D2hCq0apfNSKi2NZ/Wi98JlrnJr2zq9um3biDykoq9460wNgwSDWPDFUK69rLmh4O2cZl
	Lf4rjDM/FJMkPRaDYzmL8r9jxB3t4oLxhKk7PJkevbCJcUl+7X+EBn9FNWhw6XW+kzekCWq3o6b/I
	LTuTqcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWw-00000005QZT-3eOu;
	Thu, 06 Aug 2026 09:36:50 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWt-00000005QTg-1sC7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:36:49 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cab1b0bb489so1690808a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009007; x=1786613807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVDvUsuVz4fOLoguLRCQrGgJgNWPqJ2TDc/OI8CtAH0=;
        b=KoNAacabbNcRNUzy1f+Osm31MpdCeAa3d9cTrMY81AHpnPl1y6BuW56IAXQNWvFLjj
         xB9ZqKWin7oiurDYHuDAeuP0SiCJJfu8HwxDRmRNXRVolYoB2pLufPTMyU+m9hyqj/jZ
         71jZC1+wGZLENM6sqPAXKoueVmUFwr5t+4DDYx3jHyoWevawkJ9slxmYVEpGEWyC47tE
         ZodDLkU3h4Hl4qaXSKN97WcpCWwdGL/briUOGMNygb2g5O75FV6xYJB7p7uMVIdUZfu7
         VMktK6i1Knd46ISewbuasS37HTUh/gqyKuSaMvt8Z8DJDSEI9MNqIxlR34xUiesM+gU2
         gDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009007; x=1786613807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVDvUsuVz4fOLoguLRCQrGgJgNWPqJ2TDc/OI8CtAH0=;
        b=aiY02ipnvaQKorlWI+QFRIk8cfDGc7qccxkRzLRnwkt9UQV2NNvG8JVzABZGH/jK0k
         w7xWGPI835/ZNVzvf1MRM9HRmzSuKz+F0IhW+A/CCWL5JOSl6cnBjptg3wKxhjMhpB3y
         utYMXHb8KJ377JNqUYxuJViXEw3vgZ/NML1BBMfnSn5y+2BoPdbz/sCDJm0/rAg8yVOH
         CmpobrorAvLEYIqYkjQCJeplMzWEUs339tM5HlyUKNwlDuNfU3mENkr0EqWimqNgShoA
         pnJG0Fbl385xnotK2dMq+rJKx6UYsGJhGCw1j1rZkZOlfsopIOYT5apqkPmoKW0ElZcq
         dL2A==
X-Forwarded-Encrypted: i=1; AHgh+Rpe/v21b93vTA5hUvGQ2KM8v/486BRcHa01WruLTQKvRc8z8YWk1czP+iIdteZhSlp1+nUTHsur0J/WigAvScpY@lists.infradead.org
X-Gm-Message-State: AOJu0YywKa0N19DZMhH59qaKbqNiAb0ZtXFMumxHBpYdPIgk8/Lqh8SF
	CQynvfun3k/732lOovz5BacTH6SsUhy9r2phBxH5vc3JrAMvvT+9xRGu
X-Gm-Gg: AR+sD12owM0EgKvpo94Srmta2EMp2BIj5MiVpcr9Lh/bXL28jz59j/g5oosXIEcaTRN
	smuk0W72l2Y8UXG3XJ0kxjeXrfKUQkgPBKYkWtXTNmkqjRP6OpPtAujAxyM6jjiGgMzdO/Y6SZL
	4QMsGPBGG2ylomzsetHcWPxYjtBFMAhA0+ez6a3BNQHXZG6hjskIwma/clsWqDVJ7D8yxyAG4Yo
	pTS9AlO1hOUgCP5NYVDkTvWq0j+pVujvxActFJYExV0NuhJiL0jWobaitlxziznf/JLsSU+7V0W
	yFwM+Rzp2sBhlHB39TGZV7b/iTEM9AzcKGGCGY4xzkqd4LJ1u324qcARRP3NLYIBpTEZ5cQgzps
	j1jL6ijxX8804P8JM7ciYe0pvOlJ73/qwqja8oYDLCHTvJDx76LhaEQpwQFojL+TTRCAuE5sDPf
	/kb5QLfBUKN6MjGYW04ThMJUSeBQR6c+bwMM6dzDvYzD1A/r872kmJZ+jsiTcmAWwbeY/WCobZ1
	/0pLevHacD+
X-Received: by 2002:a05:6a00:3687:b0:848:467d:293b with SMTP id d2e1a72fcca58-84f2dfb4e5bmr16809060b3a.11.1786009006714;
        Thu, 06 Aug 2026 02:36:46 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:46 -0700 (PDT)
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
Subject: [PATCH v5 6/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Thu,  6 Aug 2026 17:35:17 +0800
Message-ID: <20260806093519.2907771-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023647_524713_6DCA0AEF 
X-CRM114-Status: GOOD (  17.08  )
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

The weak defaults are only consumed by crash_prepare_headers(), which is
called only by arm64, riscv, loongarch (via the weak default) and x86
(via its own non-weak override).

arm64, loongarch and riscv open-code the same memblock walk in
arch_get_system_nr_ranges() and arch_crash_populate_cmem(). Move it into
the __weak defaults in kernel/crash_core.c and delete the arch copies.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 arch/arm64/kernel/machine_kexec_file.c     | 29 ----------------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 --------------------
 arch/riscv/kernel/machine_kexec_file.c     | 26 -------------------
 kernel/crash_core.c                        | 25 +++++++++++++++++--
 4 files changed, 23 insertions(+), 84 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 854d872dfd0f..34d944d3f22f 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -14,7 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
-#include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
@@ -39,34 +38,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
-#ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-#endif
-
 /*
  * Tries to add the initrd and DTB to the image. If it is not possible to find
  * valid locations, this function will undo changes to the image and return non
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5412aa9f3568..481b8f906a56 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -13,7 +13,6 @@
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/kexec.h>
-#include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -56,32 +55,6 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	int nr_ranges = 2; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 /*
  * Add the "mem=size@start" command line parameter to command line, indicating the
  * memory region the new kernel can use to boot into.
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 808e872f4063..fdc6695e8588 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 2b36aa9fade0..77285ae3ce60 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,29 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
-unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
-int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+unsigned int __weak arch_get_system_nr_ranges(void)
+{
+	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
+	return nr_ranges;
+}
+
+int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
+	return 0;
+}
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0


