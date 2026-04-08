Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07705105D996
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLbtxbUymos2pxVfR8TH2Kd+TzQQJNnqZCKsRYVQLgo=; b=ndatHPDv5RaARb9b5luWrxKOcj
	JeRSEsaP4wQlgmOTdgakBF8jV6g2bsNoCfdYyR7HIz19baLWp/Gh5QeuhufnvQuYbQHMdLZG0UgIw
	qh4NUl7ZQ+7EhqOpLpRcBAWfj/YBUTrIBqY+pcw+3wNiNkGZI5ncfvSli53QNijl066pI1tTL8Ozu
	wZ4CwgaGwylFm+OlyfBLrftwaZwrtqEFfIohsv2/CO9H/lYQ+G+Kx8/wYyYVKhVP3x3W92TtlKVds
	wJenXIDqSdJY6A1X5k7UPJ0w2hFJYXrbuygcFmJQPJu42m8JURTN4FiPbD2wQ2bUbsYTsylA2V7Hk
	9AzX3A4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ1K-000000089M1-2aeC;
	Wed, 08 Apr 2026 02:51:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ1H-000000089Iu-2Ox2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 02:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CA624450D;
	Wed,  8 Apr 2026 02:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE7EC19421;
	Wed,  8 Apr 2026 02:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775616715;
	bh=zaZ8iI84M3gZDm1hFnDFMcUBYZoPlyljQ9RYRlcP8K4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aKK4jkTJ5pywEdQAoHMXFLD7R7Mhv5Fnty4Vg5GxCHuMhVafbgKxAzllimIrmfxVz
	 k1L/3VDHClK8mu07LOtpbPbjoWCRs94wrnmP0v3vjSgBSk4dKGJxmq6GZ+4RiXf5Dv
	 ezwuHP0DNCVYdCLaWPBR6CI5rzkzA4fXL0f4ql25HHBqmX3Bfk+9nCWJzmRnuaoFET
	 I1fRFIrfVxkyGP5oWkJc0xIXD2ijRTNoV7RyahVXzArx7n+PTOrf7sKnCQxgOUf0dW
	 1TEHNCYbfGT0eEbzT7ZkcdMF7XDAbWYwl/ASDIGj1w56XtQsqOVKIMnnNRCUmoXLHN
	 A21hs6OW851Rw==
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
Subject: [RFC PATCH 7/8] mm/vmalloc: Coalesce same page_shift mappings in vmap to avoid pgtable zigzag
Date: Wed,  8 Apr 2026 10:51:14 +0800
Message-Id: <20260408025115.27368-8-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260408025115.27368-1-baohua@kernel.org>
References: <20260408025115.27368-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_195155_639703_1DF3D823 
X-CRM114-Status: GOOD (  11.56  )
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

For vmap(), detect pages with the same page_shift and map them in
batches, avoiding the pgtable zigzag caused by per-page mapping.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmalloc.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6643ec0288cd..3c3b7217693a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3551,6 +3551,8 @@ static int vmap_contig_pages_range(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages)
 {
 	unsigned int count = (end - addr) >> PAGE_SHIFT;
+	unsigned int prev_shift = 0, idx = 0;
+	unsigned long map_addr = addr;
 	int err;
 
 	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
@@ -3562,15 +3564,29 @@ static int vmap_contig_pages_range(unsigned long addr, unsigned long end,
 		unsigned int shift = PAGE_SHIFT +
 			get_vmap_batch_order(pages, count - i, i);
 
-		err = vmap_range_noflush(addr, addr + (1UL << shift),
-				page_to_phys(pages[i]), prot, shift);
-		if (err)
-			goto out;
+		if (!i)
+			prev_shift = shift;
+
+		if (shift != prev_shift) {
+			err = vmap_small_pages_range_noflush(map_addr, addr,
+					prot, pages + idx,
+					min(prev_shift, PMD_SHIFT));
+			if (err)
+				goto out;
+			prev_shift = shift;
+			map_addr = addr;
+			idx = i;
+		}
 
 		addr += 1UL << shift;
 		i += 1U << (shift - PAGE_SHIFT);
 	}
 
+	/* Remaining */
+	if (map_addr < end)
+		err = vmap_small_pages_range_noflush(map_addr, end,
+				prot, pages + idx, min(prev_shift, PMD_SHIFT));
+
 out:
 	flush_cache_vmap(addr, end);
 	return err;
-- 
2.39.3 (Apple Git-146)


