Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989DEC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxhCd9eCEjBgJJhCeRA2CyrrLQ39c+yshW1zqJ57eLQ=; b=nD9M5SIQVnUoMG9YvNd+3NSf9+
	FsjpfeuC0YUmqVJ/ZIQC0Foho0lK6doJ46VmJoI1ZQmXeeO4HllQXDg+gYlG1hVg8TtKmeJNNvQih
	wKHa6Chxsl6NU9G2MLkNYFAf87S3oidoPd9vjPYVzrnjOgpxRMarfjfdZDuSUHJQ7OlNLKuC2jzwr
	/wb+IRznImoMT5GaQnrXJqpXWsXP6QrpyLAy++DOxmHQ1OIaUR60qhsKdJmqL/w0eJWoFb0WkCN0Y
	BDEe/jXnMxKjUB8dwyxs7+udpDOge+NiGoWvVHcZiYYE/Dyazg2AcfKkeZLpyeg/cU6mAJDVlXy6T
	YESGc95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDHu-00000009vG3-0tTE;
	Tue, 21 Jul 2026 16:25:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDHt-00000009vFJ-30t7;
	Tue, 21 Jul 2026 16:25:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EDD94065C;
	Tue, 21 Jul 2026 16:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36A81F000E9;
	Tue, 21 Jul 2026 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651145;
	bh=ZxhCd9eCEjBgJJhCeRA2CyrrLQ39c+yshW1zqJ57eLQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AJK8pSoA+U81hrrPiZf3Q9Tb3HIzm92yIR8W1DG0ikMnk6uAV7OdgkMR7YjEGxSm9
	 RD4suD1pNjUF0c2rrXBqrQy4bp/rbU1Is/oX1bl87Wn38B+UlIvf/m2n+iOiyDgXq/
	 0kadO6UYVhOIu9t86F7A/hVRK+DaRDnRffiVsD8OnjdxiLD3hsjoSYanLb+qMvNdy9
	 A3QQwhvFXtLf6j57ifhFoy+i9N5yaEhAIQVePJ+RqGIx2Mo7zzGHl7Bwq7COcQbxeF
	 BHH6f6ASOrbJFvNpI8pJPhjR6qHVXi16w3VR4Ai0C0xh1jbY++Ugxpc3LtI141KJ9b
	 GIpvlDGA1Melw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:41 +0300
Subject: [PATCH RFC 18/18] loongarch: make set_direct_map_*_noflush
 actually noflush
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-18-2c1fc62306b3@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16-dev
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

loongarch versions of set_direct_memory_{default,invalid,valid}_noflush
call core CPA API (change_page_attr_set_clr()) that actually flush TLB
after the page table update.

This was also the case before the conversion of loongarch to use generic
CPA core, loongarch::__set_memory() always flushed TLBs, even when it
was called from _noflush API variants.

Switch the _noflush APIs to use __change_page_attr_set_clr() that does
not flush TLB unless there was an error or there was a split of higher
level page tables.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/loongarch/mm/pageattr.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index 4500769ccf6a..dbbd408bd3d5 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -134,40 +134,53 @@ bool kernel_page_present(struct page *page)
 int set_direct_map_default_noflush(struct page *page)
 {
 	unsigned long addr = (unsigned long)page_address(page);
+	struct cpa_data cpa = { .vaddr = &addr,
+				.pgd = NULL,
+				.numpages = 1,
+				.mask_set = PAGE_KERNEL,
+				.mask_clr = __pgprot(0),
+				.flags = CPA_NO_CHECK_ALIAS };
 
 	if (addr < vm_map_base)
 		return 0;
 
-	return change_page_attr_set_clr(&addr, 1, PAGE_KERNEL,
-					__pgprot(0), 0, 0, NULL);
+	return __change_page_attr_set_clr(&cpa, 1);
 }
 
 int set_direct_map_invalid_noflush(struct page *page)
 {
 	unsigned long addr = (unsigned long)page_address(page);
+	struct cpa_data cpa = { .vaddr = &addr,
+				.pgd = NULL,
+				.numpages = 1,
+				.mask_set = __pgprot(0),
+				.mask_clr = __pgprot(_PAGE_PRESENT | _PAGE_VALID),
+				.flags = CPA_NO_CHECK_ALIAS };
 
 	if (addr < vm_map_base)
 		return 0;
 
-	return change_page_attr_clear(&addr, 1,
-				      __pgprot(_PAGE_PRESENT | _PAGE_VALID), 0);
+	return __change_page_attr_set_clr(&cpa, 1);
 }
 
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 {
 	unsigned long addr = (unsigned long)page_address(page);
-	pgprot_t set, clear;
+	struct cpa_data cpa = { .vaddr = &addr,
+				.pgd = NULL,
+				.numpages = nr,
+				.flags = CPA_NO_CHECK_ALIAS };
 
 	if (addr < vm_map_base)
 		return 0;
 
 	if (valid) {
-		set = PAGE_KERNEL;
-		clear = __pgprot(0);
+		cpa.mask_set = PAGE_KERNEL;
+		cpa.mask_clr = __pgprot(0);
 	} else {
-		set = __pgprot(0);
-		clear = __pgprot(_PAGE_PRESENT | _PAGE_VALID);
+		cpa.mask_set = __pgprot(0);
+		cpa.mask_clr = __pgprot(_PAGE_PRESENT | _PAGE_VALID);
 	}
 
-	return change_page_attr_set_clr(&addr, nr, set, clear, 0, 0, NULL);
+	return __change_page_attr_set_clr(&cpa, 1);
 }

-- 
2.53.0


