Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2C9CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jojM/RXyQILqjqfcPpQ8uAxcOK5eNU0AKu35ZovnhAc=; b=SxI3CetzqmXTuJL0qaONzpSGKL
	NvHfiSFlFsiyHd+ym/jHpkXFGxPp7wSzoUJ9QCiXrdXGCLVN00A4QsabJMR4+vkJJcKUz2DTnPclG
	El67xM721SgKgi08UMdrtCV6/Yx19aU3mXaoRvx9p+AYuWthzGL8fWyfJ0WQggpG2A4fKoLM3bBkM
	ApiLwu6uJN8AQlLL0tsWkd3SE5/u4lhzOngqezRH4yv1xlrEuB85UtyMgWw63oUG0ouwSc4ckvQRy
	NQBF/fRO+quFFYleRsUDyDwJIxwISLhy7Rt73jgig8nSuHjN7oZ2N99W4uMGvA6aBBfIWEozaPdov
	2POMTgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVV-0000000Cn4Z-2fIe;
	Sat, 03 Oct 2026 00:21:41 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVT-0000000Cn1F-0CWQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:40 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-8868ad2ed1cso136b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986896; x=1791591696; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jojM/RXyQILqjqfcPpQ8uAxcOK5eNU0AKu35ZovnhAc=;
        b=SGsuyOJUo3ZvutQLMluK4h8HWTyYmOcx5bag5BeUBqkxqC3pZGldTu67aVEf8f2zpG
         bZI+aYG6uHizpuhMGzhUIo63yWuu7neY7kYVDSZC9JNg9/52rI/jLECBCekJ+/GxPbLV
         h0dd1ZkmrmcvssJ7J9DPFST1ETkFubJc8X+J1JNfJFCiQVRtIkthrOjwDfHy4NGrmsXU
         BkNXoj/gH9fCmNdG4QTCkCySZ8Qe3mzUeVF5i0joSu3fpvq/eanglrDy+spZkVOZoSMU
         kDKkraI4RJ47FrxAaf5OCKMp5OXG5f9P4Ervl9WsTFGMyUvBAeMU80YGzzAPpKTNNjBl
         9jzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986896; x=1791591696;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jojM/RXyQILqjqfcPpQ8uAxcOK5eNU0AKu35ZovnhAc=;
        b=aOIxE2VslZAsDKHmNyKPrdm230urYHfZf01fFih4vtws4WNkSB/T6TGJ2ikfIWnYYq
         tZx+0C73qR4gkxqInwrf9fTQTKtRD4AJBORlzbriJWavzSI4gSZOKnmm/L1z9J97fE1O
         AdgEdnPQGBDlvZ+EN8ky6A3Ryh2OJYFd7E7EgdJVq2abl4V+bIHTSSFggw+NMA7m0R1L
         qYiuSsY24uko3tvzAgdyCJ22KMaq4qy/r1Cw3ngXnRISyeH4L2eCJzwmRUaIhzQolSml
         fVxRel5qiIIeJY2tPykMObxwbGhqLUaLAga9QSsAiFMtWtOEvGCgLymfZcQqGL1dAxvp
         S7vw==
X-Forwarded-Encrypted: i=1; AKwUvBxaX57KhW6ZMMWhMzUxYDE6rgjSxkpbJIiK4IEE1UUxkcVuOnPDcyPllxDLRCkx/DAN66jLWkbug+2Kipqd7KMJ@lists.infradead.org
X-Gm-Message-State: AFuF++nCPWcmAHG1SgESv3s12dNllTSyStyodUIZIrfapQJy6ltvmsKD
	s3ku1Vo0IeIgf7ATQ/EuzOB6g6p1diY/wEctoWOWfKWkMttj99ZRl5XoynyMnozZWty68rQyuRp
	76YYrrN4bsABawxd1q+SL9g==
X-Received: from pfbdk13.prod.google.com ([2002:a05:6a00:488d:b0:887:522a:478b])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:ac0f:b0:880:57cd:c32b with SMTP id d2e1a72fcca58-88af6659219mr3895203b3a.21.1790986896172;
 Fri, 02 Oct 2026 17:21:36 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:05 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-3-jthoughton@google.com>
Subject: [PATCH v2 02/20] arm64/pgtable: Clear AF with LDCLR on supported systems
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
X-CRM114-CacheID: sfid-20261002_172139_155221_C0A25FE5 
X-CRM114-Status: GOOD (  12.96  )
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

Replace the cmpxchg loop with atomic64_fetch_andnot_relaxed, which, on
systems with LSE atomics, should end up as LDCLR.

This is somewhat overdue. In recent versions of the architecture, if a
system supports FEAT_LSE, forward progress guarantees for exclusive
monitors and cmpxchg loops are relaxed.

Mechanically, I would love to write test_and_clear_bit_relaxed(), but no
such function exists (test_and_clear_bit() has full ordering, which is
also undesirable). Implementing test_and_clear_bit_relaxed() properly is
a pretty large change; use atomic64 instead, as pte_t contains a u64.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgtable.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 763c5a411d64..e47c3d010715 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1252,17 +1252,11 @@ static inline void __pte_clear(struct mm_struct *mm,
 static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep)
 {
-	pte_t old_pte, pte;
+	atomic64_t *pteval = (atomic64_t *)&pte_val(*ptep);
+	s64 af_mask = PTE_AF;
 
-	pte = __ptep_get(ptep);
-	do {
-		old_pte = pte;
-		pte = pte_mkold(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
-	} while (pte_val(pte) != pte_val(old_pte));
-
-	return pte_young(pte);
+	/* Atomically clear PTE_AF, checking that it was set before. */
+	return af_mask & atomic64_fetch_andnot_relaxed(af_mask, pteval);
 }
 
 static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


