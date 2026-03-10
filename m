Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E85EB1061
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pwf6Nc7CaGHddB3FSw2OYM6VouGq/Ldl0n4v0DGTvQM=; b=ePGkYVFmXzaeGGuTozSPYETS/c
	/OYQW4GppEskwwItPLtlUXyo9YgmHMSC2ZrIIYOa3ZpCQDTUcI9Yb/orfbtb1G1pQBRloOZZHiHca
	CGbwK5jV9U4U5YQmGAK7gUbCDI6z1MO57e+2sDIvEScXQdFWJK54uAd9vwYpbBCxlNmUVniEBkJv6
	+rxne4jYlihUgMuZ1rzc4h0GNVMXsY9Yfk0cDO/XXvGkYndZhd5P1Y7m/qFn/51BiahzrHsCUmnpA
	AQgSKoypZTgMxLzBqsdtiM1tyKNCl/ceuOtNYorzEuf0dZ8+emZrO+nB2+85vtCWobI68wi04DwXJ
	yGC7ZjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyU7-00000009jh1-3zrU;
	Tue, 10 Mar 2026 14:54:59 +0000
Received: from mta1.migadu.com ([2001:41d0:203:375::] helo=out-187.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyU5-00000009jf4-2aa3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 14:54:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773154493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pwf6Nc7CaGHddB3FSw2OYM6VouGq/Ldl0n4v0DGTvQM=;
	b=gD0zzF1ZzkpibyiRY+w+AjVdGRw9wPyUFI+y5FS68pAmCO1c1M9m41DEaxy2QyJUSTMhzg
	P5XvbFOUZoVyZubGSqW0JOoPKegDPZYBJmxRz5fKJnH3JtcIuHIQQfgUEkfvTqhC9I4zI7
	8e/PuxvBlI2swPY3tUz0PqrlB4hUlJQ=
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	ryan.roberts@arm.com,
	david@kernel.org
Cc: ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	dev.jain@arm.com,
	jack@suse.cz,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	Liam.Howlett@oracle.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	npache@redhat.com,
	rmclure@linux.ibm.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com,
	hannes@cmpxchg.org,
	kas@kernel.org,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH 3/4] elf: align ET_DYN base to exec folio order for contpte mapping
Date: Tue, 10 Mar 2026 07:51:16 -0700
Message-ID: <20260310145406.3073394-4-usama.arif@linux.dev>
In-Reply-To: <20260310145406.3073394-1-usama.arif@linux.dev>
References: <20260310145406.3073394-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_075457_814456_A9EF0CB3 
X-CRM114-Status: GOOD (  13.02  )
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

For PIE binaries (ET_DYN), the load address is randomized at PAGE_SIZE
granularity via arch_mmap_rnd(). On arm64 with 64K base pages, this
means the binary is 64K-aligned, but contpte mapping requires 2M
(CONT_PTE_SIZE) alignment.

Without proper virtual address alignment, the readahead patches that
allocate 2M folios with 2M-aligned file offsets and physical addresses
cannot benefit from contpte mapping. The contpte fold check in
contpte_set_ptes() requires the virtual address to be CONT_PTE_SIZE-
aligned, and since the misalignment from vma->vm_start is constant
across all folios in the VMA, no folio gets the contiguous PTE bit
set, resulting in zero iTLB coalescing benefit.

Fix this by bumping the ELF alignment to PAGE_SIZE << exec_folio_order()
when the arch defines a non-zero exec_folio_order(). This ensures
load_bias is aligned to the folio size, so that file-offset-aligned
folios map to properly aligned virtual addresses.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 fs/binfmt_elf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 8e89cc5b28200..2d2b3e9fd474f 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -49,6 +49,7 @@
 #include <uapi/linux/rseq.h>
 #include <asm/param.h>
 #include <asm/page.h>
+#include <linux/pgtable.h>
 
 #ifndef ELF_COMPAT
 #define ELF_COMPAT 0
@@ -1106,6 +1107,20 @@ static int load_elf_binary(struct linux_binprm *bprm)
 			/* Calculate any requested alignment. */
 			alignment = maximum_alignment(elf_phdata, elf_ex->e_phnum);
 
+			/*
+			 * If the arch requested large folios for exec
+			 * memory via exec_folio_order(), ensure the
+			 * binary is mapped with sufficient alignment so
+			 * that virtual addresses of exec pages are
+			 * aligned to the folio boundary. Without this,
+			 * the hardware cannot coalesce PTEs (e.g. arm64
+			 * contpte) even though the physical memory and
+			 * file offset are correctly aligned.
+			 */
+			if (exec_folio_order())
+				alignment = max(alignment,
+					(unsigned long)PAGE_SIZE << exec_folio_order());
+
 			/**
 			 * DOC: PIE handling
 			 *
-- 
2.47.3


