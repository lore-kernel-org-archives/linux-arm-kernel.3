Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12D7105D99B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HN0l6djgGnxQKYZLRmuwI5LGHmsPUnRvQWhcZHUodA=; b=XnN8hf0lL21X/N26GQkVoeDoub
	+of0aT9BMxXVH8KEOkncSS2Sk+1ejO6tGV9MBgK4n9CRT3MqGjFks+kmBysmpcEEmTXUKzkxOB8Il
	vVG2rZptbkVKwM75mM1x6jd04vXqFLi+rbPYiZycidEZb5Xjk6i22Xa5JUSnR+pJcpUjWgFDgtwGG
	mqTQNE5rFHs7+z4TDAOwRrVxW0Q2T6Rg8lK+LPbSUXYOYdmaAaDkb1zirss0qV/t7oAohrNnQqBEt
	PqLKLzfZDpC9PIyMCg6w5woD9+Q7+PSJlPrjkGT7Gjb6s0VobctqIASAQ3U74Xmeh3e9wbj3YkFTd
	aMfop7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ19-000000089Cy-0raP;
	Wed, 08 Apr 2026 02:51:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ18-000000089CU-2ZXR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 02:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE7DC6013C;
	Wed,  8 Apr 2026 02:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11D8C19421;
	Wed,  8 Apr 2026 02:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775616705;
	bh=HLCqPTjcCmdnanlT8SVpYIjINZxqvkrrFi6ei5+WS7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E98cltUu5pz4jFx/09mSwR9dZ3lbqdssVOpqPjSPh9hhfM8JVF4YU+v01kkNe5m0H
	 M0RZ2LNiEuLFM69/fPap3dkuh2UBPmIRHtnr+CBeOiAFjrpGGv0oL3Xhr/FrzVKUT+
	 91SFi6HW5MU80MqN6PC15ebGS4uBiGtfv3eSIjPApij0yY3mF0grfx6pFmmBryGNDX
	 T4dg3i6bfttSbwFHZTbPPIXkwMYYxc67fZY9aFx5k7ksURsZp6MEHkTE6CFq65amCg
	 aiuuBvwfHF0QXa0S1PqSec3wkI9cH1pU6AY+Nn90uFLsSYE1BRNiXXttGTcot4Fmbx
	 dkSeaxzsotkdg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: linux-kernel@vger.kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	ajd@linux.ibm.com,
	rppt@kernel.org,
	david@kernel.org,
	Xueyuan.chen21@gmail.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [RFC PATCH 4/8] mm/vmalloc: Eliminate page table zigzag for huge vmalloc mappings
Date: Wed,  8 Apr 2026 10:51:11 +0800
Message-Id: <20260408025115.27368-5-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260408025115.27368-1-baohua@kernel.org>
References: <20260408025115.27368-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer
need to iterate over pages one by one, which would otherwise lead to
zigzag page table mappings.

The code is now unified with the PAGE_SHIFT case by simply
calling vmap_small_pages_range_noflush().

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmalloc.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5bf072297536..eba436386929 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -689,27 +689,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
-	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
-
 	WARN_ON(page_shift < PAGE_SHIFT);
 
-	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages, PAGE_SHIFT);
-
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
-
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
-					page_to_phys(pages[i]), prot,
-					page_shift);
-		if (err)
-			return err;
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
+		page_shift = PAGE_SHIFT;
 
-		addr += 1UL << page_shift;
-	}
-
-	return 0;
+	return vmap_small_pages_range_noflush(addr, end, prot, pages,
+			min(page_shift, PMD_SHIFT));
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
-- 
2.39.3 (Apple Git-146)


