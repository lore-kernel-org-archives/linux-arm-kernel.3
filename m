Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4306FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwrAwVynWffEuxKPl0OEyEEBjA9QOQig2FF2bzdhEpA=; b=eyKMFOpCZMpakzJx4nt8WPnwbT
	dGfZRSFAvIkBcuEY3fcyxyMBr5d7rllFJgvsV6u7md/GeS2Nl3t+S4a0sDgposy13l+zr2qvvJLdW
	1YsK0PJjz6g08D88x4j7GZ6cYHUeoi6la9Uq9SMfme56cRaz83DJAInJDa4Y4NFPQ8CQJBZrADrIL
	/ZhDZiIYfGR7A0jCWS/mSVK4Tl5ZrdzlHQQxAwyw2XMDtgFXI8jzBh3SmTO+qXcjPFQ2mf1WoYbMa
	kq2HnlIVf3ID6HKXuc+VZFYXBQ8XhLV7KDSONZbi/QtTGjF5izX0BgnG+1qU8RHe3MsMI7Kk2wEzJ
	T+WUpV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jhT-0000000CH7c-3JiR;
	Fri, 04 Apr 2025 16:15:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jUI-0000000CFOt-27Kf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Apr 2025 16:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=zwrAwVynWffEuxKPl0OEyEEBjA9QOQig2FF2bzdhEpA=; b=rcQ/TZXnLakdQxL4crd49SXX3c
	edNsEOVe5KuObd9N9FvHOyENAzG1hCUGVegfPjAUI+DESeHQ2QnvFHahouiLIKJXGm/9RbMSGbECY
	3H7F9hOPYEdMTiEfgcGsbG7aWDxhy3ZY9WqpRK44a5vaJHV37Lx6OginK6lDUrp+urL++BV2mtbH5
	p+ZFyzIAKAcSjEt2BvR0qBo1O4L3+1RqPBeKcN2MGAKLhzlFZ2wIbiVn+ohK9/LZ1v86JEJ+uw17N
	4zNZ8gbxTQmZ4FYx30Cw1FcflV3mnJKiulvzObmjLOk24f6Y0o78MuVRM7S5DrvoDrcue1z65zfMb
	chjOXhaA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSa-0000000GFHw-3A3Z;
	Fri, 04 Apr 2025 16:01:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000ERST-48Ac;
	Fri, 04 Apr 2025 16:59:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v2 7/7] mm: use for_each_valid_pfn() in memory_hotplug
Date: Fri,  4 Apr 2025 16:59:59 +0100
Message-ID: <20250404155959.3442111-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404155959.3442111-1-dwmw2@infradead.org>
References: <20250404155959.3442111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 mm/memory_hotplug.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 75401866fb76..20c39ae45016 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1756,12 +1756,10 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 {
 	unsigned long pfn;
 
-	for (pfn = start; pfn < end; pfn++) {
+	for_each_valid_pfn (pfn, start, end) {
 		struct page *page;
 		struct folio *folio;
 
-		if (!pfn_valid(pfn))
-			continue;
 		page = pfn_to_page(pfn);
 		if (PageLRU(page))
 			goto found;
@@ -1805,11 +1803,9 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 	static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
-	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+	for_each_valid_pfn (pfn, start_pfn, end_pfn) {
 		struct page *page;
 
-		if (!pfn_valid(pfn))
-			continue;
 		page = pfn_to_page(pfn);
 		folio = page_folio(page);
 
-- 
2.49.0


