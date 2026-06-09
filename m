Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C6CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyS7mKR1Pj5rWSjXZPjC1j5mlisxE9H8ozK2CuoOEmk=; b=NQ+F2HaCqK1TjGfwOyTmfjVA7F
	qP3hQ4t3OB/pbYAZHKT2/tJZWk5V7i03zObSg8Ya8r7FVIfvvEiCGFw6dJJRaguNScwlxdT0MycW4
	nE3NmlRNc4Pyes7npYlpPcUN8YIOzG2HDNksntrX+tTl3PLZlHTcktu8YE/b49J61kIFQuVZpwynj
	Af4N2dA8AQ6JZLebnAN2MPV4ekh9B6gj0g6LFcrVfdmlJ6WCuvlcXXewDLJneP82rfI9m1Sded4K3
	ypN9Dkqk0etBUzgexmAsadS+V1y/PUS1cuE2SUP0a+InggSm3P3pZzPGdeQcXxdLk9f3bRqYudCkK
	ZGyvaMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxbc-00000005nb1-0eNL;
	Tue, 09 Jun 2026 14:39:04 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxbZ-00000005na7-14du
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:39:02 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c85c9af3b09so159033a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781015940; x=1781620740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyS7mKR1Pj5rWSjXZPjC1j5mlisxE9H8ozK2CuoOEmk=;
        b=j1D+pSQTCp6iDtmaHsO/eM9YvAyDayFalQsQe/+FCcd3kY3jQcOe038x04R03aFvh7
         wZNc+kVcOXkrz1J7WrQl0bSw1avgKG9bbn/kGn69Zjs+V4L9nmj8C3IgiUoKo2DXNbyN
         YfQtXjGMT4niIWEb0hIxGoPkNVCSEY6J1p9PCMG/RjfnNSWg+uQpIQTNYzEpnrsoXncB
         Tj/Xu5MN+LROfpLMyor2E6MjTdmU5xdxlh/ns4vlERzlRbnbDlu/JZpSzSeuqdgjLxRk
         Vpwc680DWaGFWi4neZWT34IckqoudwAUgKjRyoEiuF3ub4SHFpe5kgLe2KKDh7Y+GQlk
         EQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015940; x=1781620740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MyS7mKR1Pj5rWSjXZPjC1j5mlisxE9H8ozK2CuoOEmk=;
        b=nClilUbhRD4a9OOcYvOwlP6RZ+rajONKli/ojQqSLwApw69UXXwyEM8YNrF1D8zeB9
         r7CFrAJSi3Gbivli4FNyqNQU9Ql4OocFYjUNCfancgzLASjcSvZZ3h7yfNupj94PRLIo
         aOBAx31vJPmwVfvHg1yIdkNZzkMkF1LmInFvQ4u6n/iLUiK15FgTYEyD+drXgWska0ZC
         hrOCrKKmaGgMgNnEkW1gsU4EaP0cSYQ77bQzbHXG4pP/DGJ+DHRg3Okhm7z/1QsAmBm1
         2v2vLegUO+4ijbNjIL08B/qdbdxUoykGks2AeBySNiZ+Xff+RHi6/+h8IKmqchPxCawE
         YMIA==
X-Forwarded-Encrypted: i=1; AFNElJ/SFA9JN21kZ+Ypc4yBgWDBRr7B+2kRBV8TPmxgIzE4eevBXU7YdIHI/xrGh0qN1IRlfrFHTQo5tcR24Xh7xDQS@lists.infradead.org
X-Gm-Message-State: AOJu0YzTt+wLPFEaeUaht2HHCpJsZyBYGIekVM1/RPUJXbwnQMGrtqeh
	L685Q+I2juq2BomHoG9Ny9qfrTyGEtOYNpg7yRc+HMtkJOfb5N9ttkDR
X-Gm-Gg: Acq92OGuOmPxxBxuSoDcX6fXh+rHExvi3nedkytNRm1KbQUNAQ6jI+4apX385vb4ocD
	I1gEjVd4/CWnMg17y+TG8mmqwlrSTfMcOvF8PYFAC6NMpyBv7PCKGiKY3xF0l6pNgCrRiLuPdGT
	g5X1Rvn/HwXPBHEaw9+WUmUGc6XFts2msXiN0GLUWC0UGlkgD0kjO0xqCiWIosBr73nLpPczno1
	qWofttaSv5xVvqZQbyFjVTvzSqQLUYb4/oqcDCodgvlc9LI521Kk25X5YFi1WUw2hBx5ry4SgC6
	4WwhLlEKYmDReRWB7U52kR7rhlO87qlB5vz2lfwXqGhgjErW9FLYuPMVWdkCcQg0Eyu3KwKUBEJ
	zkm6T93wkaGaibCxVaZkBAOrZYUZ2AE7iIXk+UKYdQNbz6a+1knsJAU3b/3awkTdAMIpa88qLh1
	Wsra47UvRkfTufbP3gkIJ2RMTUFvCNgTd5cUlhu8wPpfq/k+KxqmOxjrPvA/mOswa7giFTgT+dg
	hV4XUrHgXrMHO1HH6/THwEx
X-Received: by 2002:a05:6a21:4784:b0:398:6e38:95e8 with SMTP id adf61e73a8af0-3b53b6e9085mr2088352637.2.1781015939654;
        Tue, 09 Jun 2026 07:38:59 -0700 (PDT)
Received: from o6.lan ([188.253.112.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm17939677a12.26.2026.06.09.07.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:38:59 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero folio read-only
Date: Tue,  9 Jun 2026 22:37:59 +0800
Message-ID: <20260609143801.7917-2-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609143801.7917-1-xueyuan.chen21@gmail.com>
References: <20260609143801.7917-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073901_298283_96EFF002 
X-CRM114-Status: GOOD (  14.85  )
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

The huge zero folio is shared globally, and its contents should never
change after initialization. As Jann Horn pointed out[1], the kernel has
had bugs, including security bugs, where read-only pages were later written
to. If the persistent huge zero folio is read-only in the direct map, such
writes fault instead of silently corrupting the shared zero contents.

Add arch_make_pages_readonly() so mm code can request read-only direct-map
protection for a page range. Direct-map protection is
architecture-specific, so the generic weak implementation does nothing.

This was inspired by Jann Horn's read-only zero page work[1] and follow-up
discussion[2] with Yang Shi.

[1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
[2] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Suggested-by: David Hildenbrand <david@kernel.org>
Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 include/linux/mm.h |  2 ++
 mm/huge_memory.c   | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0f2612a70fb1..02d33cf45b01 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2936,6 +2936,8 @@ static inline int arch_make_folio_accessible(struct folio *folio)
 }
 #endif
 
+bool arch_make_pages_readonly(struct page *page, int nr_pages);
+
 /*
  * Some inline functions in vmstat.h depend on page_zone()
  */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index b81d1ecb434b..2e9d01dc1197 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -308,6 +308,11 @@ static unsigned long shrink_huge_zero_folio_scan(struct shrinker *shrink,
 	return 0;
 }
 
+bool __weak arch_make_pages_readonly(struct page *page, int nr_pages)
+{
+	return false;
+}
+
 static struct shrinker *huge_zero_folio_shrinker;
 
 #ifdef CONFIG_SYSFS
@@ -982,8 +987,14 @@ static int __init thp_shrinker_init(void)
 		 * that get_huge_zero_folio() will most likely not fail as
 		 * thp_shrinker_init() is invoked early on during boot.
 		 */
-		if (!get_huge_zero_folio())
+		if (!get_huge_zero_folio()) {
 			pr_warn("Allocating persistent huge zero folio failed\n");
+			return 0;
+		}
+
+		arch_make_pages_readonly(folio_page(huge_zero_folio, 0),
+					HPAGE_PMD_NR);
+
 		return 0;
 	}
 
-- 
2.47.3


