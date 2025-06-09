Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F2FC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OrZVY+J85XOd05rqav10PyTZd7DjGN73HkWQphiTR4=; b=o7WU0CLsOtnxrZrl+DthRibNkI
	4q2i7WBfE/T3qrFfaWmfPVZ0WStkJjamWbPrqaCVvu8Cob5N/l+ne1RZzB/UqCvP/0GHFtUBbh7Sb
	3kr0jwXI+ORiOl1R+rB0yzHvpZHJMQelA0aqFv60CfCfFSyJcxZ85TEWDGF+ypXOBVM5V2gbccleM
	a2Q76oEa14IZPrn2t+1PLBuz3i0Y2qeVyuy0bbuGIBiyzExNLcebjRoOfgOuI/cgiN+0vYiasbixX
	PqO6qTPahXA8jUPSDVwtFD1KrYsn2Gs9ut5/Degz1zCRVLF7vJiyGlCub2o+kJzv5TKP96kODOf1t
	NGIqs7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYtE-00000003nFu-0OtF;
	Mon, 09 Jun 2025 09:34:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYn8-00000003m7v-2SyT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 09:27:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 604931515;
	Mon,  9 Jun 2025 02:27:23 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2D2F3F59E;
	Mon,  9 Jun 2025 02:27:39 -0700 (PDT)
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
	linux-mm@kvack.org,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>
Subject: [PATCH v5 1/5] mm/readahead: Honour new_order in page_cache_ra_order()
Date: Mon,  9 Jun 2025 10:27:23 +0100
Message-ID: <20250609092729.274960-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609092729.274960-1-ryan.roberts@arm.com>
References: <20250609092729.274960-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_022742_718022_0B8305DF 
X-CRM114-Status: GOOD (  16.51  )
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

page_cache_ra_order() takes a parameter called new_order, which is
intended to express the preferred order of the folios that will be
allocated for the readahead operation. Most callers indeed call this
with their preferred new order. But page_cache_async_ra() calls it with
the preferred order of the previous readahead request (actually the
order of the folio that had the readahead marker, which may be smaller
when alignment comes into play).

And despite the parameter name, page_cache_ra_order() always treats it
at the old order, adding 2 to it on entry. As a result, a cold readahead
always starts with order-2 folios.

Let's fix this behaviour by always passing in the *new* order.

Worked example:

Prior to the change, mmaping an 8MB file and touching each page
sequentially, resulted in the following, where we start with order-2
folios for the first 128K then ramp up to order-4 for the next 128K,
then get clamped to order-5 for the rest of the file because pa_pages is
limited to 128K:

TYPE    STARTOFFS     ENDOFFS       SIZE  STARTPG    ENDPG   NRPG  ORDER
-----  ----------  ----------  ---------  -------  -------  -----  -----
FOLIO  0x00000000  0x00004000      16384        0        4      4      2
FOLIO  0x00004000  0x00008000      16384        4        8      4      2
FOLIO  0x00008000  0x0000c000      16384        8       12      4      2
FOLIO  0x0000c000  0x00010000      16384       12       16      4      2
FOLIO  0x00010000  0x00014000      16384       16       20      4      2
FOLIO  0x00014000  0x00018000      16384       20       24      4      2
FOLIO  0x00018000  0x0001c000      16384       24       28      4      2
FOLIO  0x0001c000  0x00020000      16384       28       32      4      2
FOLIO  0x00020000  0x00030000      65536       32       48     16      4
FOLIO  0x00030000  0x00040000      65536       48       64     16      4
FOLIO  0x00040000  0x00060000     131072       64       96     32      5
FOLIO  0x00060000  0x00080000     131072       96      128     32      5
FOLIO  0x00080000  0x000a0000     131072      128      160     32      5
FOLIO  0x000a0000  0x000c0000     131072      160      192     32      5
...

After the change, the same operation results in the first 128K being
order-0, then we start ramping up to order-2, -4, and finally get
clamped at order-5:

TYPE    STARTOFFS     ENDOFFS       SIZE  STARTPG    ENDPG   NRPG  ORDER
-----  ----------  ----------  ---------  -------  -------  -----  -----
FOLIO  0x00000000  0x00001000       4096        0        1      1      0
FOLIO  0x00001000  0x00002000       4096        1        2      1      0
FOLIO  0x00002000  0x00003000       4096        2        3      1      0
FOLIO  0x00003000  0x00004000       4096        3        4      1      0
FOLIO  0x00004000  0x00005000       4096        4        5      1      0
FOLIO  0x00005000  0x00006000       4096        5        6      1      0
FOLIO  0x00006000  0x00007000       4096        6        7      1      0
FOLIO  0x00007000  0x00008000       4096        7        8      1      0
FOLIO  0x00008000  0x00009000       4096        8        9      1      0
FOLIO  0x00009000  0x0000a000       4096        9       10      1      0
FOLIO  0x0000a000  0x0000b000       4096       10       11      1      0
FOLIO  0x0000b000  0x0000c000       4096       11       12      1      0
FOLIO  0x0000c000  0x0000d000       4096       12       13      1      0
FOLIO  0x0000d000  0x0000e000       4096       13       14      1      0
FOLIO  0x0000e000  0x0000f000       4096       14       15      1      0
FOLIO  0x0000f000  0x00010000       4096       15       16      1      0
FOLIO  0x00010000  0x00011000       4096       16       17      1      0
FOLIO  0x00011000  0x00012000       4096       17       18      1      0
FOLIO  0x00012000  0x00013000       4096       18       19      1      0
FOLIO  0x00013000  0x00014000       4096       19       20      1      0
FOLIO  0x00014000  0x00015000       4096       20       21      1      0
FOLIO  0x00015000  0x00016000       4096       21       22      1      0
FOLIO  0x00016000  0x00017000       4096       22       23      1      0
FOLIO  0x00017000  0x00018000       4096       23       24      1      0
FOLIO  0x00018000  0x00019000       4096       24       25      1      0
FOLIO  0x00019000  0x0001a000       4096       25       26      1      0
FOLIO  0x0001a000  0x0001b000       4096       26       27      1      0
FOLIO  0x0001b000  0x0001c000       4096       27       28      1      0
FOLIO  0x0001c000  0x0001d000       4096       28       29      1      0
FOLIO  0x0001d000  0x0001e000       4096       29       30      1      0
FOLIO  0x0001e000  0x0001f000       4096       30       31      1      0
FOLIO  0x0001f000  0x00020000       4096       31       32      1      0
FOLIO  0x00020000  0x00024000      16384       32       36      4      2
FOLIO  0x00024000  0x00028000      16384       36       40      4      2
FOLIO  0x00028000  0x0002c000      16384       40       44      4      2
FOLIO  0x0002c000  0x00030000      16384       44       48      4      2
FOLIO  0x00030000  0x00034000      16384       48       52      4      2
FOLIO  0x00034000  0x00038000      16384       52       56      4      2
FOLIO  0x00038000  0x0003c000      16384       56       60      4      2
FOLIO  0x0003c000  0x00040000      16384       60       64      4      2
FOLIO  0x00040000  0x00050000      65536       64       80     16      4
FOLIO  0x00050000  0x00060000      65536       80       96     16      4
FOLIO  0x00060000  0x00080000     131072       96      128     32      5
FOLIO  0x00080000  0x000a0000     131072      128      160     32      5
FOLIO  0x000a0000  0x000c0000     131072      160      192     32      5
FOLIO  0x000c0000  0x000e0000     131072      192      224     32      5
...

Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Tested-by: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/readahead.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 20d36d6b055e..973de2551efe 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -468,20 +468,12 @@ void page_cache_ra_order(struct readahead_control *ractl,
 	unsigned int nofs;
 	int err = 0;
 	gfp_t gfp = readahead_gfp_mask(mapping);
-	unsigned int min_ra_size = max(4, mapping_min_folio_nrpages(mapping));
 
-	/*
-	 * Fallback when size < min_nrpages as each folio should be
-	 * at least min_nrpages anyway.
-	 */
-	if (!mapping_large_folio_support(mapping) || ra->size < min_ra_size)
+	if (!mapping_large_folio_support(mapping))
 		goto fallback;
 
 	limit = min(limit, index + ra->size - 1);
 
-	if (new_order < mapping_max_folio_order(mapping))
-		new_order += 2;
-
 	new_order = min(mapping_max_folio_order(mapping), new_order);
 	new_order = min_t(unsigned int, new_order, ilog2(ra->size));
 	new_order = max(new_order, min_order);
@@ -683,6 +675,7 @@ void page_cache_async_ra(struct readahead_control *ractl,
 	ra->size = get_next_ra_size(ra, max_pages);
 	ra->async_size = ra->size;
 readit:
+	order += 2;
 	ractl->_index = ra->start;
 	page_cache_ra_order(ractl, ra, order);
 }
-- 
2.43.0


