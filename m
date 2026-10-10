Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AB7CA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iE2QEQrwTXqpoYPa2dWn+Ity3YDDboIZyxHqWaOWsQs=; b=XrkdguVEUY+LoRjc+ZCr6xteoz
	vZKmW1DhpzASI7jGD5cDnNxn9kHKUq9HkXcbPfCBZtvuMTF3hM8VglTGPZwZdIEZL2YfyXGtDL7cH
	zketpSXoA2JLFVzbskCVfh5hZRR3jaw2BoGaUEeIL6/f2rFsujAvWAsvcq3AtPxr6JOTT6f7TXlIt
	sGrVtLMcZyqcg/WylLt5sxNhPJEZitYT5qzt+pro/nyJvgqmhCmr1SFR/mfsdoRHLEavBKPdRzFl0
	TAiSU0Lgyd5FEfIbocNAeUjlmail4xB5Clwj85+ywpV3UvuLgOfPoXIB8vWSJYFJeDWYlp8TOW01D
	Xej35ohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDL-00000007uez-05eR;
	Sat, 10 Oct 2026 11:26:07 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDC-00000007ubw-0UFR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:26:03 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ab2bf5e75bso230492a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631557; x=1792236357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iE2QEQrwTXqpoYPa2dWn+Ity3YDDboIZyxHqWaOWsQs=;
        b=VxDDxB8pM651IOE8XM2qxNstJYHUP0rytYEm+MAIBv5fWHvNBofp60pV9fndvA/8Rr
         jDFYeVe/nIsK/nuIDIplG+AvVjjDuYBaLaUglgRebGZan+rlOhacoLp6pE6mmXDmNLt+
         9pgzIEYZlZmieEo3roHejW9bDR4eAmYIJeksNB75DA+MJ4iI1JQP9QR9zui6s1et+RXQ
         VjoGy4qjii18jSTjMyveNdoGZyLJGRjV7CGCTlp2kRIaqVuoyZrrKAFQuT4y5t01nJ31
         nLhH6uxVb1a50Qcp6/Cs/VD5EoznchRLRF4tdGaUyG79MZjpKevbTznlfb0j4kmQaIbs
         kyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631557; x=1792236357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iE2QEQrwTXqpoYPa2dWn+Ity3YDDboIZyxHqWaOWsQs=;
        b=CrZcpXZyEVJwPDRadhH+9VGzGMV67XarHgTA5SRyAGrs9Kz6OFAjtUeufqwa0ODa8X
         CU8/IfrIXobLOUB6F2gPg9cU7hNMiajt0PplMBzRQ+nqNezrC4MXhPmBHpP8pXxPIF7V
         iOuHU8et1Xpem+Zmd9FAOJH5Ww8GnQwTyNy6df5O5rz19BqTXv8Xw73LCCLV0d4xE6xw
         kxKFa39mScd1mcBG32uHMRwwjJZep57g43f+tV02TsjH3L5xuXZrrSYpZS0DhaSCVJ+n
         3YDYJdLgtu/2D6GcVTgFqy79mp1+fPpfnT9weGh1uRGvrgf5/Ee5tDglT+Er2DKjQtqN
         uXeA==
X-Forwarded-Encrypted: i=1; AKwUvBxffNZ524A47waiLilUb4Ed9TedxYuvNVc1TwcuMaazracHizfovAT3FljcsoQT8YmtdV5t/yz584W55RCBXmtM@lists.infradead.org
X-Gm-Message-State: AFq9FYL0lIevVfHNTp1BWdETMQi1sTbuyCht8Y6WuvmZL6Uf+PPmzW/t
	VvmMpXjYT5+5+hNJz3wmPMfCbCjK62/3KON/8fChQdJocK8eNjZwB1a/TfQJb1DpMf4=
X-Gm-Gg: AYBFou1orqwmVtVSCCDPMx16D3fM5R4D97cm4V8jP3YwiL8XcB0QjFSta4n4X4Ck8dk
	Q//jd54KTJcf4/Y2VQCASjvwqCptvVVVmPp4IT9XBtI/hllz1+JEZ+CUVhATtBbK/055QZpmJ3z
	xtT8Rr5BuQi3hcONwsZw0eyrryh/oqcA6FqoqUtHJgE0wldGuIrYqTSICjM2l0JAM/ldaBaarPR
	l4gzVWwIyH25JmnZpSMTw+xplVCdxW96nD733Ud81UsqWPeNAo8Z+azjcT+dvG1eHb5Qp9lLr6T
	0j7UdDw0sALcZmaV0r6YVT6bF9M4SoLUfF0IwpipIme/KN1rB6guev3NlDZowzK+P0XGb0upqyo
	giCXaA42kVbejRTwUTnjGZgGBLZvur0vMv+LEPJmAG6U4V3wXmYJkdNgPsm0Oa91buDzfkP8lIx
	GS2kCjP+N/YKUJOznONyatc3XZY6li8bSBRiRorPCXvy0s0fPd4LLbIlYEjsZuaEOXY55STZNsg
	PgnY3dAr7qntfDa7oviMvG5AlUgMfvv4B/GF1bRX1qjMhma
X-Received: by 2002:a17:90b:2d06:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ab3a32d491mr3593827a91.9.1791631557025;
        Sat, 10 Oct 2026 04:25:57 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.25.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:25:56 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 1/4] mm: fix missing page-table destructor in pagetable_free()
Date: Sat, 10 Oct 2026 19:24:54 +0800
Message-ID: <20261010112457.49485-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010112457.49485-1-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_042602_382078_E40E02F4 
X-CRM114-Status: GOOD (  16.55  )
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

Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
tables.

HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
splitting a PMD. Restoring the vmemmap backing pages does not collapse
the PTE table, so a later memory hot-remove eventually frees it through
pagetable_free() on x86-64. That releases the page without running the
matching destructor and leaves NR_PAGETABLE elevated.

Make pagetable_free() detect constructor-backed pages and run the
destructor before releasing their memory to fix the problem.

Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Move destructor handling from x86 into pagetable_free() (suggested by
  David Hildenbrand)
- Trim and update the commit message (requested by Dave Hansen)
---
 include/linux/mm.h | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5cca90fc1df6..771a7d60b0a5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3969,23 +3969,6 @@ static inline void pagetable_free_kernel(struct ptdesc *pt)
 	__pagetable_free(pt);
 }
 #endif
-/**
- * pagetable_free - Free pagetables
- * @pt:	The page table descriptor
- *
- * pagetable_free frees the memory of all page tables described by a page
- * table descriptor and the memory for the descriptor itself.
- */
-static inline void pagetable_free(struct ptdesc *pt)
-{
-	if (ptdesc_test_kernel(pt)) {
-		ptdesc_clear_kernel(pt);
-		pagetable_free_kernel(pt);
-	} else {
-		__pagetable_free(pt);
-	}
-}
-
 #if defined(CONFIG_SPLIT_PTE_PTLOCKS)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
@@ -4078,6 +4061,26 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+/**
+ * pagetable_free - Free pagetables
+ * @pt:	The page table descriptor
+ *
+ * pagetable_free frees the memory of all page tables described by a page
+ * table descriptor and the memory for the descriptor itself.
+ */
+static inline void pagetable_free(struct ptdesc *pt)
+{
+	if (PageTable(ptdesc_page(pt)))
+		pagetable_dtor(pt);
+
+	if (ptdesc_test_kernel(pt)) {
+		ptdesc_clear_kernel(pt);
+		pagetable_free_kernel(pt);
+	} else {
+		__pagetable_free(pt);
+	}
+}
+
 static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
 {
 	pagetable_dtor(ptdesc);
-- 
2.54.0


