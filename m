Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAF3CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pI26jSth5x23OnT0HfNt5MS3pgHyg9GaYt+i3VjOcys=; b=4RvHdtgpkyez4QiE6DHBj66bU7
	fMRSoDlKn7PJG/ZxoIUxh53osXDNVRVY+XkXLywmh+8wCphzZ/KCz7lMDqZu3EHf9Pjsp2zdxdLAO
	TNO6dplk8zdfOm0zpzrsXnNxyYUUozPU42z00qFIHtIxDPHuFQ49SoeZOyC+SSJv/aj+wO7vylloz
	on3CQZUPo395mJ49WlCENx2/7IXrHniS5aeRL3/trri99noezBBxmRDI666jcJwAztIob/TnbutjR
	lyj6Nm7Hey2lEypwGeGDC6XPvgYjyyFCbRJa4hr/Rq2tbR+kZth9TcLSPkJZHOo++8arobWSF3Pq3
	cpT6k+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVu6-00000002RqE-1FTY;
	Wed, 22 Oct 2025 10:17:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVu3-00000002Rol-0PoO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:17:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA4C044E96;
	Wed, 22 Oct 2025 10:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102F0C4CEF5;
	Wed, 22 Oct 2025 10:17:06 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org,
	Yang Shi <shy828301@gmail.com>,
	syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com,
	David Hildenbrand <david@redhat.com>,
	Will Deacon <will@kernel.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH v2] arm64: mte: Do not warn if the page is already tagged in copy_highpage()
Date: Wed, 22 Oct 2025 11:09:14 +0100
Message-ID: <20251022101704.4015055-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_031711_227227_4826B41D 
X-CRM114-Status: GOOD (  14.48  )
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

The arm64 copy_highpage() assumes that the destination page is newly
allocated and not MTE-tagged (PG_mte_tagged unset) and warns
accordingly. However, following commit 060913999d7a ("mm: migrate:
support poisoned recover from migrate folio"), folio_mc_copy() is called
before __folio_migrate_mapping(). If the latter fails (-EAGAIN), the
copy will be done again to the same destination page. Since
copy_highpage() already set the PG_mte_tagged flag, this second copy
will warn.

Replace the WARN_ON_ONCE(page already tagged) in the arm64
copy_highpage() with a comment.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Reported-by: syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com
Link: https://lore.kernel.org/r/68dda1ae.a00a0220.102ee.0065.GAE@google.com
Reviewed-by: David Hildenbrand <david@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: <stable@vger.kernel.org> # 6.12.x
---

v2:
- Also remove the WARN_ON_ONCE for hugetlb pages
- Drop a double-underscore in the commit log

 arch/arm64/mm/copypage.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
index a86c897017df..cd5912ba617b 100644
--- a/arch/arm64/mm/copypage.c
+++ b/arch/arm64/mm/copypage.c
@@ -35,7 +35,7 @@ void copy_highpage(struct page *to, struct page *from)
 		    from != folio_page(src, 0))
 			return;
 
-		WARN_ON_ONCE(!folio_try_hugetlb_mte_tagging(dst));
+		folio_try_hugetlb_mte_tagging(dst);
 
 		/*
 		 * Populate tags for all subpages.
@@ -51,8 +51,13 @@ void copy_highpage(struct page *to, struct page *from)
 		}
 		folio_set_hugetlb_mte_tagged(dst);
 	} else if (page_mte_tagged(from)) {
-		/* It's a new page, shouldn't have been tagged yet */
-		WARN_ON_ONCE(!try_page_mte_tagging(to));
+		/*
+		 * Most of the time it's a new page that shouldn't have been
+		 * tagged yet. However, folio migration can end up reusing the
+		 * same page without untagging it. Ignore the warning if the
+		 * page is already tagged.
+		 */
+		try_page_mte_tagging(to);
 
 		mte_copy_page_tags(kto, kfrom);
 		set_page_mte_tagged(to);

