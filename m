Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC0CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 02:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SPCqIDb+yNYcV+5yEAWwdEaCDvI8BD77bbTSTfws3Yw=; b=1k3lP3ePwWGJODI8GJEVMSCMiQ
	84OlrUvTLTHsJjhz9+32gGZ3gehDNsQvb9rthKzKKrOJElGhmcSaZkdRWl17SGIxZYmqlty4VObT/
	Jlg8KaiKFRqInzHZQiOxD5mS+OrgU5Ha4SSVofBGE1M5YSyVruy1TRsr+SjntzbxN8BIN+O1yoMMC
	K5UWofJ5mJiqz/M8rcD9HDE690GGylzh3PpyRBVlL7jr8Eo9itVzJMJdGn1Y9+NenRYD3TdFAaSE1
	btQsFBJhzhzec9eGw24GBcwFZvDfar66f/YnWYFEzpnyAGGBiotwGik5oDdedg4TbiD+5UJ+OjPSk
	f9Acv66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W5Q-00000008Ztn-1Kf1;
	Mon, 22 Sep 2025 02:15:28 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W5H-00000008Zlx-1JCV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 02:15:26 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46de78b595dso127065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 19:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758507317; x=1759112117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPCqIDb+yNYcV+5yEAWwdEaCDvI8BD77bbTSTfws3Yw=;
        b=rQ+1sDHDSOIeP5icB73JLgF0nOdSlnQMAxS28WV+/nbcGIS5j+aHGhMsjHSexWoU6m
         KGeS9psmiWCf3k6w0nl+6xYS6F8ucwgIIl3TMo/wZjSGXfHkrAlDBQRxJb5U3sf0fVsP
         igz3aQuKmDWNBb9SKAsTKV+v0nQDa9TNtIwxXMYDg3Q+iwoM7oS0W7Q7V4TG2eIa3YSX
         SM+AM50AYqwvCUN6IOzf2HAAgE/wiSoNFZCoyL9+OdjB7gZ4FQAFgQIf7SPYCtEjhz9L
         UpiuPp/fgbAtVrxU/7e1urLUnlFGx541LaZu1ZfcY6p3EGlNEvfFNLkJuHYlLu6cxwGK
         aAqg==
X-Forwarded-Encrypted: i=1; AJvYcCW86mKaykY68OC20uwoM5whFMSjVanPH3w+AgC2HmMGA0xKaf7LvfQF5xrsdu+zY/tZMtgTPn2fGGX1evJOKo8E@lists.infradead.org
X-Gm-Message-State: AOJu0YxhPhiJG9PXHNGn4Qja6OnSuaeRNfPYgRRhe9LUbyz0C+eW8b4M
	tPt80wTQsYoFdDoz6iHXiBxkPlvvwIPeRb5QXV/6weWTUWiTXjdG3gAT
X-Gm-Gg: ASbGnctfCSuy8zEIk1xVDqRw8F2yGcETY7PV6oFwTrgWxlXeI9vyGUUwp3KZ1s1lqAH
	o9VSsiH9daGq9QJ7IiAFdIRq1EdoF87q9R46SHTtLLWhMWOb5/crwf7tqbZpem8H0cz2cHmGEm+
	RNz6EOF9szpuW0ZOGVwD3CH9K4GeebjqI8v1gzs7nPMUKHPp+uNkMlbfDbCKtF6LiOSvDIYFZkr
	DeHAiWeGLIYKi37MbThPrK2gzQA/geKqW5mphaitj+dTMLme4K+hOpYBfh5drTj5gY2uAIH3XU/
	eQAXmNKBF/4MMshyAX4r2RAfpWyp7XuiGKpD69lUZ18LG6xmFeNWqUMPng6zKpOpLYKFzRBnLZ5
	RwRsA2pOh
X-Google-Smtp-Source: AGHT+IH9s1cY1E+H2vTOe2w6B4oa+af+uNdUi3NtjrXEcg2rWJv7ohFVr7kLsZhy27UnUnTj0ObGrQ==
X-Received: by 2002:a05:600c:630e:b0:46c:9e81:ad0 with SMTP id 5b1f17b1804b1-46c9e904ffamr24190015e9.0.1758507313301;
        Sun, 21 Sep 2025 19:15:13 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::3086])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613dccb5e2sm220376635e9.17.2025.09.21.19.15.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 21 Sep 2025 19:15:13 -0700 (PDT)
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com
Cc: usamaarif642@gmail.com,
	yuzhao@google.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	voidice@gmail.com,
	Liam.Howlett@oracle.com,
	catalin.marinas@arm.com,
	cerasuolodomenico@gmail.com,
	hannes@cmpxchg.org,
	kaleshsingh@google.com,
	npache@redhat.com,
	riel@surriel.com,
	roman.gushchin@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	surenb@google.com,
	hughd@google.com,
	willy@infradead.org,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	qun-wei.lin@mediatek.com,
	Andrew.Yang@mediatek.com,
	casper.li@mediatek.com,
	chinwen.chang@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org,
	ioworker0@gmail.com,
	stable@vger.kernel.org,
	Qun-wei Lin <Qun-wei.Lin@mediatek.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing zero-filled subpages
Date: Mon, 22 Sep 2025 10:14:58 +0800
Message-ID: <20250922021458.68123-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_191519_376901_94494058 
X-CRM114-Status: GOOD (  18.41  )
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

From: Lance Yang <lance.yang@linux.dev>

When both THP and MTE are enabled, splitting a THP and replacing its
zero-filled subpages with the shared zeropage can cause MTE tag mismatch
faults in userspace.

Remapping zero-filled subpages to the shared zeropage is unsafe, as the
zeropage has a fixed tag of zero, which may not match the tag expected by
the userspace pointer.

KSM already avoids this problem by using memcmp_pages(), which on arm64
intentionally reports MTE-tagged pages as non-identical to prevent unsafe
merging.

As suggested by David[1], this patch adopts the same pattern, replacing the
memchr_inv() byte-level check with a call to pages_identical(). This
leverages existing architecture-specific logic to determine if a page is
truly identical to the shared zeropage.

Having both the THP shrinker and KSM rely on pages_identical() makes the
design more future-proof, IMO. Instead of handling quirks in generic code,
we just let the architecture decide what makes two pages identical.

[1] https://lore.kernel.org/all/ca2106a3-4bb2-4457-81af-301fd99fbef4@redhat.com

Cc: <stable@vger.kernel.org>
Reported-by: Qun-wei Lin <Qun-wei.Lin@mediatek.com>
Closes: https://lore.kernel.org/all/a7944523fcc3634607691c35311a5d59d1a3f8d4.camel@mediatek.com
Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
Tested on x86_64 and on QEMU for arm64 (with and without MTE support),
and the fix works as expected.

 mm/huge_memory.c | 15 +++------------
 mm/migrate.c     |  8 +-------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 32e0ec2dde36..28d4b02a1aa5 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4104,29 +4104,20 @@ static unsigned long deferred_split_count(struct shrinker *shrink,
 static bool thp_underused(struct folio *folio)
 {
 	int num_zero_pages = 0, num_filled_pages = 0;
-	void *kaddr;
 	int i;
 
 	for (i = 0; i < folio_nr_pages(folio); i++) {
-		kaddr = kmap_local_folio(folio, i * PAGE_SIZE);
-		if (!memchr_inv(kaddr, 0, PAGE_SIZE)) {
-			num_zero_pages++;
-			if (num_zero_pages > khugepaged_max_ptes_none) {
-				kunmap_local(kaddr);
+		if (pages_identical(folio_page(folio, i), ZERO_PAGE(0))) {
+			if (++num_zero_pages > khugepaged_max_ptes_none)
 				return true;
-			}
 		} else {
 			/*
 			 * Another path for early exit once the number
 			 * of non-zero filled pages exceeds threshold.
 			 */
-			num_filled_pages++;
-			if (num_filled_pages >= HPAGE_PMD_NR - khugepaged_max_ptes_none) {
-				kunmap_local(kaddr);
+			if (++num_filled_pages >= HPAGE_PMD_NR - khugepaged_max_ptes_none)
 				return false;
-			}
 		}
-		kunmap_local(kaddr);
 	}
 	return false;
 }
diff --git a/mm/migrate.c b/mm/migrate.c
index aee61a980374..ce83c2c3c287 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -300,9 +300,7 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 					  unsigned long idx)
 {
 	struct page *page = folio_page(folio, idx);
-	bool contains_data;
 	pte_t newpte;
-	void *addr;
 
 	if (PageCompound(page))
 		return false;
@@ -319,11 +317,7 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 	 * this subpage has been non present. If the subpage is only zero-filled
 	 * then map it to the shared zeropage.
 	 */
-	addr = kmap_local_page(page);
-	contains_data = memchr_inv(addr, 0, PAGE_SIZE);
-	kunmap_local(addr);
-
-	if (contains_data)
+	if (!pages_identical(page, ZERO_PAGE(0)))
 		return false;
 
 	newpte = pte_mkspecial(pfn_pte(my_zero_pfn(pvmw->address),
-- 
2.49.0


