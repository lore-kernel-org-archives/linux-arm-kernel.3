Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C8DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EggTF7jgXyqw27ORwtXsCRX4H5aiRA/a+Rh2J8KLoHU=; b=zYgQtVGSBfTHIKb3RXTX29IhbY
	RFEdDFBGl2Q5SBH6Wa/h0Z3FDj9H4a9BOYk18kZ53gmtzYuM6FXYwrWHcw53ncXESAGlNZJCLRpxX
	KTPbKfMrslsiAcj3osoTcIaj1tfTYdYrNbtzScvCrgdnGK/r7u9Os0AYUcHxgC5f3gnjdiaW4mDnj
	K6u2wMkX0t8OBRts0/ogc7GnUSnUTqcSlcGySgMh5KIeC/w+C4AjfkYwENwmw8WEWblL2zdEAlmk3
	iEH9gQXvl1/PsRVPMFzAzUadSL4LrEwmrqyZOKCOEl6cQo3CNwIVdZ171ZrFEDW8TB6JstXUDXSMm
	wTNWZxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WWj-00000009zZG-2TWb;
	Wed, 23 Apr 2025 09:36:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VJc-00000009goS-2asc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Apr 2025 08:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=EggTF7jgXyqw27ORwtXsCRX4H5aiRA/a+Rh2J8KLoHU=; b=BmKxZhxXycayWqgY04aS3O8VDv
	NYYZCozxkEDA0WDmbxV1yNS3+Q5Su24QLc3YxXW2RtGx+avKO+L6seps3N2pFW+n+dP45Md+d+EfE
	KVkAQRs0lguySdrMhj4IgZtx8enpHxrFfqTJuEtbNoSjg/AFO/LT1EfgpxF2dwZfr0cfZPqwW8UQR
	AxD+az8+k4r8E6CHBDutgxCGcF6GCNYhiMQyZES6DXVH9SGioJWn1a/uyBYKFPpkeWB49WUd2ERpQ
	XJQ7aatcCyYdQptgYKIsMoH6jIxaSyREfjipf3GSKb6iwmkSYw7x3JUuqkLvQpJpokUl7XmJKa99h
	WPD88/VA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJR-0000000BOid-1XFD;
	Wed, 23 Apr 2025 08:18:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YNw-1g6W;
	Wed, 23 Apr 2025 09:18:30 +0100
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
	linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH v3 4/7] mm, PM: Use for_each_valid_pfn() in kernel/power/snapshot.c
Date: Wed, 23 Apr 2025 08:52:46 +0100
Message-ID: <20250423081828.608422-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423081828.608422-1-dwmw2@infradead.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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
 kernel/power/snapshot.c | 42 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index 4e6e24e8b854..f151c7a45584 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -1094,16 +1094,15 @@ static void mark_nosave_pages(struct memory_bitmap *bm)
 			 ((unsigned long long) region->end_pfn << PAGE_SHIFT)
 				- 1);
 
-		for (pfn = region->start_pfn; pfn < region->end_pfn; pfn++)
-			if (pfn_valid(pfn)) {
-				/*
-				 * It is safe to ignore the result of
-				 * mem_bm_set_bit_check() here, since we won't
-				 * touch the PFNs for which the error is
-				 * returned anyway.
-				 */
-				mem_bm_set_bit_check(bm, pfn);
-			}
+		for_each_valid_pfn (pfn, region->start_pfn, region->end_pfn) {
+			/*
+			 * It is safe to ignore the result of
+			 * mem_bm_set_bit_check() here, since we won't
+			 * touch the PFNs for which the error is
+			 * returned anyway.
+			 */
+			mem_bm_set_bit_check(bm, pfn);
+		}
 	}
 }
 
@@ -1255,21 +1254,20 @@ static void mark_free_pages(struct zone *zone)
 	spin_lock_irqsave(&zone->lock, flags);
 
 	max_zone_pfn = zone_end_pfn(zone);
-	for (pfn = zone->zone_start_pfn; pfn < max_zone_pfn; pfn++)
-		if (pfn_valid(pfn)) {
-			page = pfn_to_page(pfn);
+	for_each_valid_pfn(pfn, zone->zone_start_pfn, max_zone_pfn) {
+		page = pfn_to_page(pfn);
 
-			if (!--page_count) {
-				touch_nmi_watchdog();
-				page_count = WD_PAGE_COUNT;
-			}
+		if (!--page_count) {
+			touch_nmi_watchdog();
+			page_count = WD_PAGE_COUNT;
+		}
 
-			if (page_zone(page) != zone)
-				continue;
+		if (page_zone(page) != zone)
+			continue;
 
-			if (!swsusp_page_is_forbidden(page))
-				swsusp_unset_page_free(page);
-		}
+		if (!swsusp_page_is_forbidden(page))
+			swsusp_unset_page_free(page);
+	}
 
 	for_each_migratetype_order(order, t) {
 		list_for_each_entry(page,
-- 
2.49.0


