Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF340C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZBAh6Nw2Wojw1x1c/oIpX3LymyujgAPhMLX7la+5sM=; b=XQeYIsu5MjO7E8BBoWQOQzcjN9
	6Fb5FkKC02/psq4F2rAcxiMgeo6lCrB6vaqORLhxCpMSoLlbC0W3fUpo8Yd81ZHufTGXo3vlrT49y
	k2cqBLy+XVtsIJmmo9o3Azji2kjC2Q5V6oFf5NS5cxGdseOujEIlVHrgj1xHDCbiheecY6+gAoXkp
	A+m6uoLOkLYxhUYRD8HRc0l++PYK7wyT1VjPOwyzAl8bUgj4qS6K+JDYOvn6rDcCoz1tETsH9pqSj
	NGSqhMy51aTrHq5A4CuPs9DA8nX7R2EHGHdFniNkHIWMi+kP7jOPcKUKaxELNvo4ovxkYSwb4vVP8
	ZDYljKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvmD-000000007ZT-3NT2;
	Mon, 03 Aug 2026 16:44:33 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvmA-000000007VK-10Zv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:44:32 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 01E9F3FC3;
	Mon,  3 Aug 2026 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785775464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZBAh6Nw2Wojw1x1c/oIpX3LymyujgAPhMLX7la+5sM=;
	b=RCnX9DvBdusp51QYUbBf7leNC2m/jnhcVFM5tmPTP/BhTZ3DqFPAqeh33IRpZN6BmPwqoP
	rzIo4y/i0IiJp8To57XQsHwj+IPT7FV5Ll5C7nv8aEmi07CIq112ysW2y06eVZEf2dH6wJ
	r3lk9k8/HQ6YyaSYXdsLZN6KGB8gFDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785775464;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZBAh6Nw2Wojw1x1c/oIpX3LymyujgAPhMLX7la+5sM=;
	b=xaIbUspi5o6OZc06hALwJZqRpjo9E6iu/FYAsULDovkl6o6a+EctY/7NZl8UBxV14mSYy3
	LqsBwv3e4TeH+9CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785775460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZBAh6Nw2Wojw1x1c/oIpX3LymyujgAPhMLX7la+5sM=;
	b=giVnVJGxPhlzAiTUyO5cLvObJ3wJUrZwgTqO2byoJytTwsPx5geUMg3NE+GQojJgRcLFfW
	nGXGK8yEXMPkiUXaTlVnnCK1/idDeaoYBPP9wfBAGdYiKRQ9MMzDN+N8K1AAGzciOFRYLJ
	eZ2eJWx57aPm670VdUoqq6RZMBZewhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785775460;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZBAh6Nw2Wojw1x1c/oIpX3LymyujgAPhMLX7la+5sM=;
	b=KQ3BcFN2qLOwnr8xm81Wv2EiUTXMUvdttWl+K12ejsYXnidRcK53HVXpu4yybbDfE5Irjs
	3RgNNZM+XdnbmZBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C744779A1;
	Mon,  3 Aug 2026 16:44:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iCzPA2LFcGp/SQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 03 Aug 2026 16:44:18 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Pedro Falcato <pfalcato@suse.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 6/6] mm: constify the pte_offset_map_ro_nolock() return value
Date: Mon,  3 Aug 2026 17:44:00 +0100
Message-ID: <20260803164400.531199-7-pfalcato@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803164400.531199-1-pfalcato@suse.de>
References: <20260803164400.531199-1-pfalcato@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_CC(0.00)[suse.de,arm.com,kernel.org,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,infradead.org,google.com,suse.com,suse.cz,nvidia.com,linux.alibaba.com,redhat.com,linux.dev,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,kvack.org];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLxu57a9hfgn7tttf5jiwuqe5o)];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_094430_592876_0F5D25A5 
X-CRM114-Status: GOOD (  17.16  )
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

Constify the pte_t * retval from pte_offset_map_ro_nolock(), for which it is
already pledged that accesses must be read-only. With it, convert the three
treewide users to use const pte_t *.

khugepaged passes the result right down to fault code (do_swap_page()). This
leads to a complicated set of conditions that, in order to be correct, must
not install anything into *vmf->pte. This is not trivial to work around in
fault code, and as such just trivially cast to non-const pte_t* in the
meantime.

The other users are far more trivial and the conversion is equally
trivially simple.

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 arch/powerpc/mm/pgtable.c | 2 +-
 include/linux/mm.h        | 4 ++--
 include/linux/pgtable.h   | 2 +-
 mm/filemap.c              | 2 +-
 mm/khugepaged.c           | 2 +-
 mm/pgtable-generic.c      | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index a9be337be3e4..e29db41b6043 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -390,7 +390,7 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
-	pte_t *pte;
+	const pte_t *pte;
 	spinlock_t *ptl;
 
 	if (mm == &init_mm)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7fabe6c66b4b..acf5a5e31d34 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3885,8 +3885,8 @@ static inline pte_t *pte_offset_map(pmd_t *pmd, unsigned long addr)
 pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
 			   unsigned long addr, spinlock_t **ptlp);
 
-pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
-				unsigned long addr, spinlock_t **ptlp);
+const pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
+				      unsigned long addr, spinlock_t **ptlp);
 pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
 				unsigned long addr, pmd_t *pmdvalp,
 				spinlock_t **ptlp);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index dc418553e57a..dd51e722c535 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -112,7 +112,7 @@ static inline pte_t *__pte_map(pmd_t *pmd, unsigned long address)
 {
 	return pte_offset_kernel(pmd, address);
 }
-static inline void pte_unmap(pte_t *pte)
+static inline void pte_unmap(const pte_t *pte)
 {
 	rcu_read_unlock();
 }
diff --git a/mm/filemap.c b/mm/filemap.c
index 6afec636881f..af5d3fcd1b05 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3490,7 +3490,7 @@ static vm_fault_t filemap_fault_recheck_pte_none(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	vm_fault_t ret = 0;
-	pte_t *ptep;
+	const pte_t *ptep;
 
 	/*
 	 * We might have COW'ed a pagecache folio and might now have an mlocked
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b237f6e7662a..09efac93a8c6 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1170,7 +1170,7 @@ static enum scan_result __collapse_huge_page_swapin(struct mm_struct *mm,
 			 * Here the ptl is only used to check pte_same() in
 			 * do_swap_page(), so readonly version is enough.
 			 */
-			pte = pte_offset_map_ro_nolock(mm, pmd, addr, &ptl);
+			pte = (pte_t *) pte_offset_map_ro_nolock(mm, pmd, addr, &ptl);
 			if (!pte) {
 				mmap_read_unlock(mm);
 				result = SCAN_NO_PTE_TABLE;
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index b91b1a98029c..2cfc6e608ef4 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -308,8 +308,8 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 	return NULL;
 }
 
-pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
-				unsigned long addr, spinlock_t **ptlp)
+const pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
+				      unsigned long addr, spinlock_t **ptlp)
 {
 	pmd_t pmdval;
 	pte_t *pte;
-- 
2.55.0


