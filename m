Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3AEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LL4AMr/kt9xgKI4EE6n4T/6niteeK43+z1sjA/ZS5rw=; b=Hsienmwgv0fh2FupqQxyof1ZAo
	kpnUUKdwNaBtAkQe5w2HpVET12vHmcP4UCcbyWN4KIcAuzCjfmnN6iQUEj145pZ+8Sx0SbuKyYFb3
	WMtpIDImTwW8Yq5zldLXETY632SsWg9a7rsDCIqiKFL4CieHo+NGBM78yVzBfjOHoSB+x/PPgFsIm
	yNXG/OJ53a3VwPLxFSvOcW6i9LEo+tKzkMLKcjxFAcjhoRbKXuROEsUSe3paXzPi3/We1f5gvSv8p
	yL4Wwiy8rdaL/pBRH2cOW5mzMrW452kHKhQK5PKv3yp0yWeOWAn8mfDyVvjVJoVY3gVjNpjWFEXjn
	5C+hbGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhm-0000000GCmE-43bi;
	Wed, 08 Jul 2026 03:12:11 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhN-0000000GCBL-19EC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:47 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c6bbd0afffso5414725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480304; x=1784085104; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LL4AMr/kt9xgKI4EE6n4T/6niteeK43+z1sjA/ZS5rw=;
        b=jXq8GdKgIKkCHgM7J0DI4vaBO91PpSwTO0sQ4CYkfdFNtn9br05bMhJty6dfblp4TO
         PJNbvpjvzhd9/jacnaPbSvDyhpZ249bn9QEZeR7WhUeSROZWNkOmpSKPKzUVLfIF8H9x
         dB5Y/5c2mGIVxmLJZFAzHP+avAiGjf4g34xWi8ocIH1oz9DkYTD45WEr2WFCqa9ECp+w
         t3SFBVTR1jE0CSWntwZLiNyleaHzaCX32KFgUzSfbUMIE6U31Bsi2CLQzq6ULxQfbzU4
         F/nYHRlYq3cD0SfKdWuj1sexn2dh6QO2s5YlFIrpbDwwa7+oE05LQuBB5fizGRRK/MwE
         qbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480304; x=1784085104;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LL4AMr/kt9xgKI4EE6n4T/6niteeK43+z1sjA/ZS5rw=;
        b=PiGilHuSkLrXcupjui6mnhsMp0QPAC0UQfsPWGgeQCWN40nOFaoJWIcY09wCg/fnbo
         T7oy7vRdPXRCMdGw7hejnOXD59mvOwkB2ln5EVbFaQ2kEMPaPLwTVPU84V7dG95pMROn
         SvZR4oodw6VqwwDdVrJ5FtdRFEyoHQkC76UoUE8nQEcjAUqr28fqk4KNSWgWvUUFLzpk
         syhZmSUDr3TBbqjNmArzRXBeQZKvFepXf0rNzxALWyOaCC/LXUaaSnM3gjIcWF3iyZ2Y
         DVKSbJ2JGs3nq1seHrYpeF3i44Wads0mSFNZdjeQoMkMdQ4VV/LrutjRGFMJDMx3TJRJ
         zbTw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9pv4U5+NFS3U5RZQvmzTcYRl0GIfjVxD1ErQWfsht4uKXMNWDC4K1aEEhQsBOrQCp8IrLHjOpr8Pvr1s0JRnL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsoz2zwiBA+4TAz1UUngQUyjrvVVEJcLdnpIQzAh6Z+f8S6Fys
	jzlv0NkaGXAbYvzeWIPThINplMQJ5GiwiFzyBw/4+h2miLpfyO2E1JdoV5c6Z2MtjMXjxLCwmMm
	qC6lZkK+bgV3tURY+ScZ+0A==
X-Received: from plad7.prod.google.com ([2002:a17:902:e147:b0:2cc:e88e:4251])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e54e:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2ccea274c6amr6735195ad.0.1783480303733;
 Tue, 07 Jul 2026 20:11:43 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:22 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-13-jthoughton@google.com>
Subject: [PATCH 12/18] arm64: Implement try_populate_vmemmap_pmd using AF trick
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201145_338532_80160795 
X-CRM114-Status: GOOD (  17.14  )
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

For systems that support BBML2_NOABORT, there is no need to use the AF
trick.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgalloc.h | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index c8946250d431..26b05f8b70cd 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -125,9 +125,54 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 static inline int try_populate_vmemmap_pmd(pmd_t *pmdp, pte_t *pgtable,
 					   unsigned long addr)
 {
-	/* BBML2_NOABORT is required. Its presence has been checked. */
-	pmd_populate_kernel(&init_mm, pmdp, pgtable);
-	return 0;
+	const int max_attempts = 16;
+	int attempts = 0;
+	pmd_t old_pmd, new_pmd;
+
+	if (!system_supports_hvo())
+		return -EOPNOTSUPP;
+
+	if (system_supports_bbml2_noabort()) {
+		/*
+		 * BBML2_NOABORT allows block->table transitions if the PTEs
+		 * underneath do not conflict with existing, potentially cached
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
2.55.0.795.g602f6c329a-goog


