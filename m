Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08308CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 01:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZAZ5JKeK6vnKji79QsGpXUoqDaDTR7rYrRqlCcRuaw=; b=kP8kaZhkaMvgOfl9EESlk0G278
	SCcCIiVXS7BxFpGQqYE+3YIBPWI6z7FBEs4a3LaAJf8XId4eFfAVV4shbCKfUTB3/WDgyUPSdHORw
	6YFeNLbLOS3n5BTQ3jK/hMuBQsxlHesyXuUuhJMElmLDyqhucbeCt8SJUrxoUk8lOwe2qgLGjjQ/t
	HIjOY+ybN969I9NLdYy6PJFsZbSoKZyQUmNkWx3ztrqsRXHjjgyOYHSLY0RjB70XLkQrfMf1rlzMf
	+jy9i/byBW9ufmeABpKf/LELcnVLQQg5WErgRGBoGipEQqeDwl3LY7rlP4zwVGBdJkyRi/ikyV1fJ
	0Bt0jllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVV-0000000Cn3m-1SYo;
	Sat, 03 Oct 2026 00:21:41 +0000
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVR-0000000Cn0q-3evr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:39 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so89095a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986895; x=1791591695; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZAZ5JKeK6vnKji79QsGpXUoqDaDTR7rYrRqlCcRuaw=;
        b=fjRmQlGxtfl+EjYQK02eg3pmXjQrN7bNo1VeJuNpwsDsyHxHCP5ClfN5cNz4ujvFyp
         0MkG3QG7qClo/pBkFVkMzPz9VwSxvzYjpYnh/xNzvrsXT6cApC3cGPFXOwUV67d+gCln
         q04rRru24m/OhbFLii/y2NG1IJvIbv+SoXKXT44iUFjMudN0Gubok6dAePnQzeB5vN/V
         YS4stBYiOtfhar1IMMjqplP46Jh1BqpyxPW66SJOW42rnEIjyVxDJ1xFW5/HR3Y+R164
         CruRaG0YgGt7cCRY6JGaX8oP3hVGSZ2fOd8hk3iC+b5YrcExWG907uII83LRsaLRCzVH
         88ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986895; x=1791591695;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZAZ5JKeK6vnKji79QsGpXUoqDaDTR7rYrRqlCcRuaw=;
        b=DEzU0bawUZX1541pRRoFZ71E0wUxd6cI7MKgTBHpOTahMAxgVebv392gFc8aKRE/me
         n6J8TlUIzEsGAB2fLGx902Wr+bIP7X2+iI3UvTfCJBJVWMrmz6xUzuOsKels2uCeotnS
         kNu7xHsarVton7vnev16rZPZTZhw//rImeZjskZ3OfnKpCwXjDVsazouyYIIvI+S6jxP
         5grOmNKg+8F5wHg0fYxVHBJjbHspkA+JZYkIEkPfFv6EwcBN8tkIeAlui7HCo0+RfklG
         GB9W1n3HgDMKy4C0HdBBf8IMSW0ud1PnnvVqRJ66jsekxmKRuVKYenlVkEJs70dCx+Uw
         Q5cA==
X-Forwarded-Encrypted: i=1; AKwUvBwwB0ubsVw7W2bp1w0IA2a1cFk9YkzxOv1Vt14uZKUcYGXHKq1R/aCf7Jm2vb8dJRANOXpIDn2l1xMoPC1/0e/i@lists.infradead.org
X-Gm-Message-State: AFq9FYJ734090VdOog5T4eOtqKKuJwLurm/H6Dh8fWyLMK8rvPzSWFzG
	ZzYXjUAszKGgfYwsIzbVYuR2upXGbVcKhWvXIj9YEwvDzMWHYAaJbLoatZhD5p9jCX0raacvYYI
	uP+U4Ki43VpTwg6CINdfusQ==
X-Received: from pjbpv1.prod.google.com ([2002:a17:90b:3c81:b0:3a6:f669:2f33])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:268f:b0:3a4:e735:b3a3 with SMTP id 98e67ed59e1d1-3a6cec8cd26mr2396583a91.40.1790986895284;
 Fri, 02 Oct 2026 17:21:35 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:04 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-2-jthoughton@google.com>
Subject: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed folios
 on bulk restore error
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172137_919315_35A8DA19 
X-CRM114-Status: GOOD (  16.33  )
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

When hugetlb_vmemmap_restore_folios() fails, it stops processing the
list, so folio_list may still contain folios that were never vmemmap
optimized, e.g. because HVO failed when they were allocated. Their
hugetlb flag has already been cleared by remove_hugetlb_folio().

If no folios could be restored, bulk_vmemmap_restore_error() then calls
hugetlb_vmemmap_restore_folio() on every folio left on folio_list,
including those, which trips the !folio_test_hugetlb() check in
__hugetlb_vmemmap_restore_folio():

  page dumped because: VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio))
  WARNING: mm/hugetlb_vmemmap.c:503 at __hugetlb_vmemmap_restore_folio+0x270/0x300
  ...
   __hugetlb_vmemmap_restore_folio+0x270/0x300 (P)
   hugetlb_vmemmap_restore_folio+0x1c/0x30
   update_and_free_pages_bulk+0x2c0/0x368
   __nr_hugepages_store_common+0x2e8/0x3f0

Otherwise this is benign: the restore is a no-op returning success for
non-optimized folios, which are then freed as intended.

Skip the restore for folios that are not vmemmap optimized; they can be
freed right away.

This is very unlikely to happen without fault injection, as it requires
both HVO and a subsequent vmemmap restore to fail.

Fixes: cfb8c75099db ("hugetlb: perform vmemmap restoration on a list of pages")
Assisted-by: LLM
Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a1b51251103b..4dac7ed1df57 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1613,9 +1613,14 @@ static void bulk_vmemmap_restore_error(struct hstate *h,
 		 * page is made a surplus page and removed from the list.
 		 * If are able to restore vmemmap and free one hugetlb page, we
 		 * quit processing the list to retry the bulk operation.
+		 *
+		 * Folios whose vmemmap was never optimized (e.g. because HVO
+		 * failed when they were allocated) can be freed right away;
+		 * remove_hugetlb_folio() has already cleared their hugetlb flag.
 		 */
 		list_for_each_entry_safe(folio, t_folio, folio_list, lru)
-			if (hugetlb_vmemmap_restore_folio(h, folio)) {
+			if (folio_test_hugetlb_vmemmap_optimized(folio) &&
+			    hugetlb_vmemmap_restore_folio(h, folio)) {
 				list_del(&folio->lru);
 				spin_lock_irq(&hugetlb_lock);
 				add_hugetlb_folio(h, folio, true);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


