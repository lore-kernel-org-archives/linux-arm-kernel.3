Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FED3606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=25HFSpDm;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=E06AKQUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rturI3iC2rqsVMr8++V5T0eWydBVkbRvFCJtmlAqnJE=; b=25HFSpDmGLnlU4
	3gynVjQiULS62WLADWPWZ/fSJZA3I6XPO+zcCIMFhNZ/x/CBWwHYqt+8U5/PMPLrHhaAwGdfe0lwV
	Ki4ddwLzBS28acZu+p9CfkBtPz5hHwGxtlUphUsRNx3GPYuolU7WRtzlzmQ7ZdGQFf5iET8mOJoS7
	gK5UjAPObtjm65u7zn5ZjgmR9Kx3FszVSKWiTiu7hqBypzcSlVS5/Mx5620fIVw7YwquR9omr7HpX
	0lPDRh4OXN57gXRo6PhhWeQa8fKfc2R/DOdAiul3I5iDsM7IVl7vwMbsdfWXvsLf+WSeHvGh0GL5l
	HCJHOoigoL5d3rxHviOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rb-0000000FZuU-277w;
	Fri, 23 Oct 2026 06:34:51 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rU-0000000FZrP-3cjf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:34:46 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cc751eddf25so270949a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737284; x=1793342084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rturI3iC2rqsVMr8++V5T0eWydBVkbRvFCJtmlAqnJE=;
        b=E06AKQUc49bHnqwDL+Cug1MfPd3mSvF4vKygMYvrxbqLmlgLv7V4mB3ve8XZu5PY8/
         CvrGgtz0oE/DdeLFPlgc48EsKiGMw88l3OZ3MaqNSXOnDFoyIgkoDjxsSOfM7gvkXTwq
         YkbRhjMNGW7mZOsfJ7MBhfJ9/MKaE/5C7f2U6r3xEKWbicAyMtCn0b3H5xLR33/XsG+D
         DbvvvV6TVyvn8OOp5XyHnG5x/HoZg4XcGX+uKBPtbOVyezfbcYxS5WVX16xR6ginHvEf
         wDdpVaei1dEVCaoHgRXBmJf4X/jhSDy4aHKTkC05pWpoBfo+6Op/MzhKnvGbWyew5R4J
         F9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737284; x=1793342084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rturI3iC2rqsVMr8++V5T0eWydBVkbRvFCJtmlAqnJE=;
        b=n8PmPzTLHGTdy4BirfJakChcJ0lzPAFx+UJs/0DS4M/fPDIoBSghkErrqc4gzBJYGD
         t1goCDDaXXWWbRTmOWsFjCjp8hHtf0DL72ToKjHwrdl/HkOLC7EbHbZEHXVWAgp2Uwvr
         VC+mGb6rAeklv05Sa4uTf7DxSV4x2+pQ9wbbsjTUGA10mlNOgFQf+fW0myB308mNa3wr
         G0CVt9vPI94GeqGoAIltwAeyp7JMLBR7Q5uxkApadkavv+SyQRZJwJa+D7PMtx6DVp7s
         jknFxE0VbDucuzVTrRRaakOhq+7+/rcHxbfOYhQ9ivHV/9VqpyVFGRaWZ1rJtivhm47p
         ndTg==
X-Forwarded-Encrypted: i=1; AKwUvBzj49nXsZC/bTXoOJd4A7tgoGfZAGSC9qhrMdXn2rxeplapafChZ+o/IeXO/60pNePdTvKUOoAVS+A+Nx1Z3IVn@lists.infradead.org
X-Gm-Message-State: AFq9FYK5yHAB/TQbqMMbKMlHVjFxRofQ8rnfpu1G2fpVCteE8LS369Es
	jh60zrFFDUHZ7E3+rS6gS8wniM/7xCDc2atteGue5FsrHxeylfcnL4UPiHaCPl3U/7k=
X-Gm-Gg: AYBFou3h9ksPypAHloAiw6WnIcp087xyf1RGjpkgtNt0zDHQslBcupVNJN/gEZlyIo8
	fMXv2QgWQSZoHbBW3RXHWAKzk5dLzbEwcTA7SkwJufcRBaq5AN+8DfA3we8HCMVFG1klhqFO3LZ
	5JXUcb0ZNIk7vnad6v60iSsA9Ego0B5uO8say0SB2edKZ9Pu/gBL8ARE7ABj6nSpUQ1j3xspJlb
	trkKQqu6lLfBtX3NI+dpqpDO3xZJzLk7vncgxslk9BJg3UbnI2/Y899BOVC/9MQeZQh8G32HJi+
	EDVMC0Yf5LPIc85Oa0mG54axCLdxGc3akr98EA6hFhuwJICtADnp/sJRk7SuMLBlwbnyhd1ZQqV
	0yBXcWJkgH4IIpOroUCgxXJygY1Ug4txFq1kSgLwPC/1npU/kZsfNhY4HAHUQJUjNKuuoN+YzL5
	PWRgp7/d9ww5PGhT0eJ3Wx8WZAAynyqZOcOiBGggRAhPFewfTHN7AsjkGScwDIZKPkoxoaj6O/E
	zD50ezyW+Rfgj99qeO7FZawPKizVcMYsH2xslpXbtllnutXjNDkQlLXE/UNwXoqhtsLn5JUhOrp
	3Q==
X-Received: by 2002:a17:90a:f945:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3adce7dd585mr1009938a91.24.1792737283991;
        Thu, 22 Oct 2026 23:34:43 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:34:43 -0700 (PDT)
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
Subject: [PATCH v3 1/4] mm: fix missing page-table destructor in pagetable_free()
Date: Fri, 23 Oct 2026 14:34:25 +0800
Message-ID: <20261023063428.3658761-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023063428.3658761-1-songmuchun@bytedance.com>
References: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233444_930253_E080189B 
X-CRM114-Status: GOOD (  17.28  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
tables.

HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
splitting a PMD. Restoring the vmemmap backing pages does not collapse
the PTE table, so a later memory hot-remove eventually frees it through
pagetable_free() on x86-64. That releases the page without running the
matching destructor and leaves NR_PAGETABLE elevated.

Make pagetable_free() the common free-side primitive for page-table
pages. It checks PageTable() and runs the destructor only when the
constructor state is still present. Callers that explicitly ran
pagetable_dtor() have already cleared PageTable(), so they are not
destructed twice; pages that never ran a constructor are freed directly.

Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
Cc: stable@vger.kernel.org # bf9e4e30f353: x86/mm: use pagetable_free()
Cc: stable@vger.kernel.org # 39406c05f8f1: x86/mm: Fix freeing of PMD-sized vmemmap pages
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Dave Hansen <dave.hansen@intel.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3:
- Explain why pagetable_free() does not run the destructor twice
  (requested by Kevin Brodsky)
- Add x86 stable prerequisites (suggested by
  Jose A. Perez de Azpillaga)
- Collect Acked-by from Dave Hansen and David Hildenbrand
- Collect Reviewed-by from Jose A. Perez de Azpillaga and Kevin
  Brodsky

v2:
- Move destructor handling from x86 into pagetable_free() (suggested by
  David Hildenbrand)
- Trim and update the commit message (requested by Dave Hansen)
---
 include/linux/mm.h | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23..466875c5908b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3812,23 +3812,6 @@ static inline void pagetable_free_kernel(struct ptdesc *pt)
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
@@ -3921,6 +3904,26 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
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


