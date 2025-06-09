Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC072C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoMlKqQLvIGnOQH07Hg5S191oF2ViC3DzIUmAtNtoR8=; b=iOTU3VyUuhhzVCKkhl8X4caIMP
	yhUQwlXMAUIdFXewyADAWT/tt5cEW39jASwwg+Zvq1/FqXjTa0HCuFtU4GvHCwcvcRhjxM3s97u9+
	sOQ3NeUWqcpJuo9Pn8rjX/l5avjjDyKXSz4Y8hJkcLibvU5BoDxhkUanVM3FVJR6leOlhh17xBgg2
	0JC9zpVIjCv7NmHT6FZW1kCuHSe8hzNxsFLKiDusIY0NvyOxAELOcBm4a/PXx3qltHoTk11obHwYI
	EgggRNimFKrauohZ1o83U9Spu43WWBoWBWsU18pWV32/uJvC6J07sOLNsQxMl1siudrdsfGPA2BLU
	kUj/AI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYxQ-00000003npZ-1ybV;
	Mon, 09 Jun 2025 09:38:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYnE-00000003mBa-1iz8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 09:27:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 993D1150C;
	Mon,  9 Jun 2025 02:27:28 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 399273F59E;
	Mon,  9 Jun 2025 02:27:45 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Zi Yan <ziy@nvidia.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v5 3/5] mm/readahead: Make space in struct file_ra_state
Date: Mon,  9 Jun 2025 10:27:25 +0100
Message-ID: <20250609092729.274960-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609092729.274960-1-ryan.roberts@arm.com>
References: <20250609092729.274960-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_022748_567034_AE8D802C 
X-CRM114-Status: GOOD (  14.73  )
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

We need to be able to store the preferred folio order associated with a
readahead request in the struct file_ra_state so that we can more
accurately increase the order across subsequent readahead requests. But
struct file_ra_state is per-struct file, so we don't really want to
increase it's size.

mmap_miss is currently 32 bits but it is only counted up to 10 *
MMAP_LOTSAMISS, which is currently defined as 1000. So 16 bits should be
plenty. Redefine it to unsigned short, making room for order as unsigned
short in follow up commit.

Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/fs.h |  2 +-
 mm/filemap.c       | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 05abdabe9db7..87e7d5790e43 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1052,7 +1052,7 @@ struct file_ra_state {
 	unsigned int size;
 	unsigned int async_size;
 	unsigned int ra_pages;
-	unsigned int mmap_miss;
+	unsigned short mmap_miss;
 	loff_t prev_pos;
 };
 
diff --git a/mm/filemap.c b/mm/filemap.c
index a6459874bb2a..7bb4ffca8487 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3217,7 +3217,7 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 	DEFINE_READAHEAD(ractl, file, ra, mapping, vmf->pgoff);
 	struct file *fpin = NULL;
 	unsigned long vm_flags = vmf->vma->vm_flags;
-	unsigned int mmap_miss;
+	unsigned short mmap_miss;
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	/* Use the readahead code, even if readahead is disabled */
@@ -3285,7 +3285,7 @@ static struct file *do_async_mmap_readahead(struct vm_fault *vmf,
 	struct file_ra_state *ra = &file->f_ra;
 	DEFINE_READAHEAD(ractl, file, ra, file->f_mapping, vmf->pgoff);
 	struct file *fpin = NULL;
-	unsigned int mmap_miss;
+	unsigned short mmap_miss;
 
 	/* If we don't want any read-ahead, don't bother */
 	if (vmf->vma->vm_flags & VM_RAND_READ || !ra->ra_pages)
@@ -3605,7 +3605,7 @@ static struct folio *next_uptodate_folio(struct xa_state *xas,
 static vm_fault_t filemap_map_folio_range(struct vm_fault *vmf,
 			struct folio *folio, unsigned long start,
 			unsigned long addr, unsigned int nr_pages,
-			unsigned long *rss, unsigned int *mmap_miss)
+			unsigned long *rss, unsigned short *mmap_miss)
 {
 	vm_fault_t ret = 0;
 	struct page *page = folio_page(folio, start);
@@ -3667,7 +3667,7 @@ static vm_fault_t filemap_map_folio_range(struct vm_fault *vmf,
 
 static vm_fault_t filemap_map_order0_folio(struct vm_fault *vmf,
 		struct folio *folio, unsigned long addr,
-		unsigned long *rss, unsigned int *mmap_miss)
+		unsigned long *rss, unsigned short *mmap_miss)
 {
 	vm_fault_t ret = 0;
 	struct page *page = &folio->page;
@@ -3709,7 +3709,8 @@ vm_fault_t filemap_map_pages(struct vm_fault *vmf,
 	struct folio *folio;
 	vm_fault_t ret = 0;
 	unsigned long rss = 0;
-	unsigned int nr_pages = 0, mmap_miss = 0, mmap_miss_saved, folio_type;
+	unsigned int nr_pages = 0, folio_type;
+	unsigned short mmap_miss = 0, mmap_miss_saved;
 
 	rcu_read_lock();
 	folio = next_uptodate_folio(&xas, mapping, end_pgoff);
-- 
2.43.0


