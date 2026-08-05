Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90D3C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sKn6cZqAriR/zZlCyouZ9X4PnMk81SsImmt/7OIBzd8=; b=LZxL7crUcN8tnYgN1vqbvKjvSi
	W6f+LvZKgmmJT/vrIg6nfYImE6q7PynDmYnpP6IXhlSWNKH2zw7yETzNa2v62vD9bn2f4R3t95wms
	lEuW2sHCJGCKvWrZZwAQkLPUcXZNltkuC8Aog9gF1OL8nsyKM/6XJ8bAdUa0o0Y+SQEaTX/LD4gta
	K89KzE/jhQA5vIp5+HhrEekmaxF1lE/Urna0pmu9ZVpXTEnvXKk/1Js8FkyiivdwfZyaLZJ7+Jm9i
	T55uEPGgTzV9fVOnXLc9x0xlMDPl1M++Sw19RyJSxk4wgzfGQKjWcpqEjZrzWZ+VB/i+4N9PbR3Rd
	W+QvwaKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZ3L-00000003lQb-2rjP;
	Wed, 05 Aug 2026 10:40:51 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZ3J-00000003lQB-08x9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:40:50 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-69c20d1d150so674108a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785926446; x=1786531246; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKn6cZqAriR/zZlCyouZ9X4PnMk81SsImmt/7OIBzd8=;
        b=BdjX4Y+kakm76nz4sTu2Cv7b0tOzTH1dQ374QGQlfVy0MBske4/SiRzh6r1f0/DEfJ
         nfpe4CI9eGg3hsA+pwElPQCLFFlZTXpT3gwP+M0Yd2D9uVCsrvCL3FsSnVohHbHFcVjS
         7412M3o2gsytBkpq4kE1Vr7jJVWTuYKCnTBoEkC/M/NPGtyd3Zc0dd9S9T4VZw2y/GpD
         XD527pmMXjeljIigGd+eZy1JimxyKbzbLZewrgG6pcAgB4PCcpaVEj6Qnb2JYW1LXBvV
         e7X0v5K8sdJQ+dAxzKkBIKcagAPGEBIJ9R+4jG3OV37V12zRl2YvwD8q/t1U0MCeFV7y
         ZmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926446; x=1786531246;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKn6cZqAriR/zZlCyouZ9X4PnMk81SsImmt/7OIBzd8=;
        b=UD7Kq83PrM5ISDrrNUyFMeNcwGjBBsplZgjmI2yxmCahSpIkB7Q+W8ejAiXFD/GYze
         fT9GrLE0nqidpTBjlzs13rvfX8OJyxlNvdLqp+l/rGZlgKRJa+jSJ4XqIj8/bbsPKFzY
         Fvwzh9CxS7rp78+O5oV2qxhoGI2ZNzHpkUnRTLzK12CqPol5IKN17caxAQ3uv03GpMbj
         YNrXieZGgIAbRawq3RbFTI7TfwSi6yCWMwkfUCMQJIj8GaxnP2WOprQNfw/0TdJJXySE
         c0B/IVnk5ENBsvtGxcIJpUzLbIZJQJsYL3kxvtj3vdqNL1Jv9962t2UvleaRywVKE17O
         tqWg==
X-Gm-Message-State: AOJu0Ywtd+l/3s2wjKr1qP0X5fwG5Ht5v3ZIKpyUoHqMlVG2tD96AVBL
	s/tPtY5KXvtIvFhAhuHO0IDEuEWTN5Nl4eDgf1RGECXrs4Mzz47psDhh9/cqr7mXeUWpNa9wpUz
	i+B7rwQpD/N5H8OS+dv+tAKhC1yiKqs0XZkSfD4zhiKeUbW9scz6aKDUHTa3FqXqNvt3KnT4Ozl
	CGUymghjvtB/G009E4pEMLs4Y99YHaQ9f0C+i6KlbVttjQ
X-Received: from edoy16.prod.google.com ([2002:aa7:c250:0:b0:6a0:d084:32ec])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:52d5:b0:697:564c:9095
 with SMTP id 4fb4d7f45d1cf-6a14f256695mr3050404a12.21.1785926445667; Wed, 05
 Aug 2026 03:40:45 -0700 (PDT)
Date: Wed,  5 Aug 2026 12:40:43 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3419; i=ardb@kernel.org;
 h=from:subject; bh=aQqHgsHDXATSChltB95ehBTGy6vjImAwBYlhcut/HS4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatYWJtd8KFR3xa3Gw4H5wYk210KejdP31k9cLmRRe2+X
 WaPPqZ0lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlkrWb4Zyqzs+ZoQfJZlqwT
 bKpeLC5sLw5yd9zhXuLPcF3jZED8N0aGu3LPI79XZhRMPlpWavJC9XOB4I/csrgyyUMTV9768uU fFwA=
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <20260805104042.1107678-2-ardb+git@google.com>
Subject: [RFC PATCH] arm64: mm: Map fixmap PTE tables r/o in the linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Jann Horn <jannh@google.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_034049_282663_70F79408 
X-CRM114-Status: GOOD (  15.74  )
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

Without physical KASLR, the fixmap page tables will appear at an a
priori known offset in the physical address space, and due to the lack
of randomization, the linear map carries a writeable alias of the fixmap
PTE pages, which appears at an offset in the kernel VA space that is
also predictable.

Given that the placement of the fixmap area is never randomized either,
a single store to this linear alias region is sufficient to map any
physical page with any permissions at a known offset in the kernel VA
space, including on top of the PTI trampoline.

Avoid this, by remapping the fixmap PTE pages read-only in the linear
map. This is possible because all updates to bm_pte[] occur via the
mapping of the kernel image in the vmap area. A read-only mapping is
still needed for things like ptdump that walk the page tables.

Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Liz Prucka <lizprucka@google.com>
Cc: Seth Jenkins <sethjenkins@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Jann Horn <jannh@google.com>
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/fixmap.c              |  7 +++++++
 arch/arm64/mm/pageattr.c            | 10 ++++++++++
 3 files changed, 19 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 90f61b17275e..a685fb534c3e 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -11,6 +11,8 @@ bool can_set_direct_map(void);
 
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
+int set_direct_map_ro(unsigned long addr, int numpages);
+
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index f66a0016dd02..fcb571dffe82 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -14,6 +14,7 @@
 #include <asm/fixmap.h>
 #include <asm/kernel-pgtable.h>
 #include <asm/pgalloc.h>
+#include <asm/set_memory.h>
 #include <asm/tlbflush.h>
 
 /* ensure that the fixmap region does not grow down into the PCI I/O region */
@@ -173,3 +174,9 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
 
 	return dt_virt;
 }
+
+static int __init fixmap_remap_ro(void)
+{
+	return set_direct_map_ro((unsigned long)lm_alias(&bm_pte), NR_BM_PTE_TABLES);
+}
+late_initcall(fixmap_remap_ro);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..5072b14d4f9d 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -251,6 +251,16 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 					__pgprot(PTE_PRESENT_VALID_KERNEL));
 }
 
+int set_direct_map_ro(unsigned long addr, int numpages)
+{
+	if (!can_set_direct_map())
+		return 0;
+
+	return __change_memory_common(addr, PAGE_SIZE * numpages,
+				      __pgprot(PTE_RDONLY),
+				      __pgprot(PTE_WRITE));
+}
+
 int set_direct_map_invalid_noflush(struct page *page)
 {
 	pgprot_t clear_mask = __pgprot(PTE_PRESENT_VALID_KERNEL);
-- 
2.55.0.571.g244d577d93-goog


