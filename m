Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13227CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCgjHn2mz/yCHbbXpM7X3kmHNH/eC22IJjKzJWGDoHY=; b=ViIUj79l3bmIjYzqZPvBHvb9dw
	2bVHyCKX/Pvv/ruWRYhtHxt49V+G+TaGGoQ18BGvsbzGP8pu4/SrOTm8PyP/TECAbj3uoht4eA7Xa
	XApIFWlvRTIvoImMac7pL+QWxWcKLjQvebZXyMJcLcKBhnPK9qYv01PRA4EcGEw/V4FMRhYKeKmkw
	k0g1c4/mRoXUyfHCcN5kN1PIC/Ui0+APn7ku0MyNLVyhcPlVIumzixJYkQbeTrnUTeLazhnvv4zyA
	dqyEyBICRPfquvCsOBEXHuu5Q2MGwOVz5YUwbPNLQQ4nEvFFD6rIRtJ7kyos/HJ7VGqgxQt8h3i4d
	fPXBEPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVx-0000000Cnhq-0Jx0;
	Sat, 03 Oct 2026 00:22:09 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVf-0000000CnGR-27Ka
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:55 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso332737a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986910; x=1791591710; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCgjHn2mz/yCHbbXpM7X3kmHNH/eC22IJjKzJWGDoHY=;
        b=F47Oc+tQPoDE+/jx9q90efe++WH6pXVh148euE1lZfcKObMUsHVl4eulad8P7+Gy7x
         A6UaKKUZ/QpcPsiiy+514W7G4ioyGvp1WBh6sEphFr66n9/O7f+UkIc4gLrk9MowQ/Vi
         nwGwq8xBOBGwgDZ/okOvUAacM91JdXzZqPEEII1YiNlOoorZEncrQPU6Ikku5f8EzjZR
         ikKi/uK6BY2qm4hgguogMQL7w3No305RUdJSeZG4iJoCxhqD8eWKeMGXBL6kjwU8tqUR
         9+ZMVY/1NywZPPSGEN3LjoY9i03NCR2MKxX/efZo+FioAOiz0G+4ak4vk89W1qOpqczx
         BW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986910; x=1791591710;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCgjHn2mz/yCHbbXpM7X3kmHNH/eC22IJjKzJWGDoHY=;
        b=kTR7/kbFSHaKcjI1YF2aBQHsxzS+gQrn7toW+NhX7m2PcmWcWh6lr4OMZUwyvIZ1HW
         /heY7gHduWGBBc1V9SkLTKUT8lflioeHhkEZYKuReJsoVfjQPYPvtxrm0G6ADWWC4hzp
         PIxCekLEOGvFTJfgKw6YkGw4/prtzKQp6qGzigTEiMGjXRBUKBB7U0aK8p+fIemsR2tq
         qhbg48NGH16V2Epjry/xf2a2tR7oezF6v6kVm7SOWM/JF48b7O7M+39v48DfyIqODSD1
         XS25L8XD6YnlpqKxZibA+qYMR5+dYnIwLSr8GIYZHfOTx5vuFd1cbd4+FBD55L/dKEPB
         tOeg==
X-Forwarded-Encrypted: i=1; AKwUvBw7HIRqpq1FNEAT72EagMAsHPQSy9Y6kv9NCB03+M4K7u9WlA7itFjRgjco0TDxh1MNrMk0yx1D5eTkaTHrOQYe@lists.infradead.org
X-Gm-Message-State: AFq9FYKqQR+sW0Yw6kNRB5ce7ABx9X7ONOddnRCIMTG2meGJO1v9HvEu
	hCXvsWWEwEJW5gIdyynUpqK3cgHL6bhEAU4/H/ekmY+f6eugk+fvq96Z+5bdPOl5XxncuE7qVAS
	fTZxWi7VNM4nmQYezJcQRBA==
X-Received: from pjbmv17.prod.google.com ([2002:a17:90b:1991:b0:3a6:f87a:f3e4])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:33cc:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3a6ceb00093mr2158482a91.25.1790986909781;
 Fri, 02 Oct 2026 17:21:49 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:20 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-18-jthoughton@google.com>
Subject: [PATCH v2 17/20 DO-NOT-MERGE] arm64: Implement try_populate_vmemmap_pmd
 using AF trick
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
X-CRM114-CacheID: sfid-20261002_172151_548665_518AEFB0 
X-CRM114-Status: GOOD (  17.52  )
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

This routine is to be used for updating in-use, leaf-level PMDs in the
vmemmap without introducing a window where vmemmap accesses might fault.

Implementing this on arm64 requires some care: use the same access flag
trick that is used for vmemmap PTE updates. HAFT is not needed and the
TLB flushing routine remains identical, as we are not overwriting a
non-leaf PMD.

For systems that support BBML3, there is no need to use the AF
trick.

Signed-off-by: James Houghton <jthoughton@google.com>
---
This patch is the main questionable piece of this "DO-NOT-MERGE" part of
the series. It's unclear if the Arm ARM truly requires hardware
implementations not to cache anything about AF=0 Block translations.
---
 arch/arm64/include/asm/pgalloc.h | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 0263329fb7b3..7e304f01ce6d 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -124,9 +124,54 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
 					   pte_t *pgtable)
 {
-	/* BBLM3 is required. Its presence has been checked. */
-	pmd_populate_kernel(&init_mm, pmdp, pgtable);
-	return 0;
+	const int max_attempts = 16;
+	int attempts = 0;
+	pmd_t old_pmd, new_pmd;
+
+	if (!system_supports_bbm_through_af())
+		return -EOPNOTSUPP;
+
+	if (system_supports_bbml3()) {
+		/*
+		 * BBML3 allows block->table transitions if the PTEs underneath
+		 * do not conflict with existing, potentially cached
+		 * translations.
+		 */
+		pmd_populate_kernel(&init_mm, pmdp, pgtable);
+		return 0;
+	}
+
+	new_pmd = __pmd(__phys_to_pmd_val(__pa(pgtable)) |
+			PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_UXN);
+
+	old_pmd = pmdp_get(pmdp);
+
+	do {
+		if (WARN_ON_ONCE(!pmd_valid(old_pmd)))
+			return -EINVAL;
+
+		if (WARN_ON_ONCE(!pmd_leaf(old_pmd)))
+			return -EINVAL;
+
+		/* We should never get a contiguous PMD here. */
+		if (WARN_ON_ONCE(pmd_cont(old_pmd)))
+			return -EINVAL;
+
+		if (pmd_young(old_pmd)) {
+			/* __ptep_clear_young() returns the overwritten PTE */
+			old_pmd = pte_pmd(pte_mkold(__ptep_clear_young((pte_t *)pmdp)));
+
+			flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+		}
+	/*
+	 * Translations without AF cannot be cached, so we can replace
+	 * them without BBM.
+	 */
+	} while (!try_cmpxchg_relaxed(&pmd_val(*pmdp), &pmd_val(old_pmd),
+				      pmd_val(new_pmd)) &&
+		 ++attempts < max_attempts);
+
+	return attempts == max_attempts ? -EAGAIN : 0;
 }
 
 #endif
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


