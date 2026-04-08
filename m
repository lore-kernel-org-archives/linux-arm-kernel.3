Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6412A105D99B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdliaBWbk2rOoeYorTgFI+4+mXZ4Qg922zWKCCJqJeI=; b=4PyDPhAi23XwkVI94TjI8jd2in
	rC42y0HA1d4UiRvc9ByTfhNmj1hfpeVz8ZT1Ej2L7r6RvjLIme93wjkPbFq9OJZwhKgeAPYt4u20/
	N8Etm5xB3rcWesY2ZHpR3OCK6K/EzK5vk/wSPExq0CsK87GgpDqI0K/YEA7Xv4bKEhwUZ/BKqHOnD
	KhuV8QxPuOtXLs7F8jsit5h2mk6BqWQCHh+I8bEhJYVbZch/agVaAWCxfeD2inEPOlzFbavGSvldM
	wkEBTZr0VizjvJAom6UpAoF1r2ZUm/IxqOp9ySaP95wYmrWSkAlIX9Uc295t2R+EowR7j40U7g9RE
	WJKMHCkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ1M-000000089P8-3wBH;
	Wed, 08 Apr 2026 02:52:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ1K-000000089Lw-2ouL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 02:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62FCA444E6;
	Wed,  8 Apr 2026 02:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EBAC116C6;
	Wed,  8 Apr 2026 02:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775616718;
	bh=4BDs5dW9zJtaGW/eXyIzqwPGAqrmR/Pere8PJG68bKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MnttrxLfgWIjceDLBrD7T6mxsHluWlpQuAnVSfvkfssMuGim5D3nMqUWysoDzrF8q
	 Vg/d/PYq+g2PiJwuyJV53u9fAYWH/e9GDDETxM/1qujw7fSUU23VQ6Wt5AIjgy3h3J
	 yA4pB9Y6m/4MjHSU2+Ord5ZwlDmOp41LGv5wDQVrRkX+48iVntSbaEiNZPpV95rzM0
	 o7dixtMLL6Sb4hxcCk7KqWMKwZ2KVNgYnuzXISDbFUU7y3Q4f6QgzSKahf/5r+Kenq
	 XLy0p+dk34T72eWKhEMyJhjy1poxLFhIex1zBjGY2rYzoSZkAW6IIsHC/aG1QuLpjL
	 F2hb+JBvyQPQQ==
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
Subject: [RFC PATCH 8/8] mm/vmalloc: Stop scanning for compound pages after encountering small pages in vmap
Date: Wed,  8 Apr 2026 10:51:15 +0800
Message-Id: <20260408025115.27368-9-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260408025115.27368-1-baohua@kernel.org>
References: <20260408025115.27368-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_195158_738777_1A608687 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

Users typically allocate memory in descending orders, e.g.
8 → 4 → 0. Once an order-0 page is encountered, subsequent
pages are likely to also be order-0, so we stop scanning
for compound pages at that point.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmalloc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3c3b7217693a..242f4bc1379c 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3577,6 +3577,12 @@ static int vmap_contig_pages_range(unsigned long addr, unsigned long end,
 			map_addr = addr;
 			idx = i;
 		}
+		/*
+		 * Once small pages are encountered, the remaining pages
+		 * are likely small as well
+		 */
+		if (shift == PAGE_SHIFT)
+			break;
 
 		addr += 1UL << shift;
 		i += 1U << (shift - PAGE_SHIFT);
-- 
2.39.3 (Apple Git-146)


