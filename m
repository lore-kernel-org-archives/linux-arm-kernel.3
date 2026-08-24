Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79335C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w11pet1aD+xRnvhlpr87q+i2HekPQtfMLvtIw3f/i60=; b=2uT5hJ+ZrvMYoNJBDd3wFwEBq+
	fJ9W7sMsTiedijJW2HXwBcJTVEEHoYc8PrmU+PKoeDUyktmQXYYQdo8zPeimhv8uySWhVmL+vHb7R
	Tb2+9Y/T7Ma1896DuatTtgGeSaM9WqrHIpkpnc3tx4+e1OwUSA5vKWhhgQo/xeMNUiTYhoVO1/WpW
	TYQkt86koT0NivvXXJQCGpvkOVlyeTa77nInBvKKlEIO5z47GoVcvCofQQqETFPEZPDS2vsFCwCUH
	J41tfcEVjUCkjCwX89J59xXFBue1MEwphLD+O0QHowoxSiJDwjurMd36uvZ4I9AqhCRT/P3rjOeX3
	QedpCfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNit-0000000FxDN-3TPv;
	Mon, 24 Aug 2026 05:59:55 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNiq-0000000FxCw-3X8h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 05:59:54 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso5342652a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 22:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787551191; x=1788155991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w11pet1aD+xRnvhlpr87q+i2HekPQtfMLvtIw3f/i60=;
        b=NaN4np3KBPChgH/fwFLnRef3BvqBTqCH7hJZ1ZgT5IImMNh4OVmW3GExdL7zXN2KxG
         D9T/8pfxgWPltNvuK/1kGqx0f8xnLRDbpanZEv7V+YH6qPb8qW6rXPFm98JiJflUE5Tx
         lixvRlxrNy4WZMsIUFVqTd3GPjWaE3PxQGbGWKZGKxfJRj7/OymjYqG7gQMyp00t3alI
         74w55t2JM9IVgVnrglm+PFOa3jhmzcbbdYZrQjV5BrKP9CfFd/cX01fam220B+aEmuVv
         ZgGiZGxkGzUVkF/OV+fgd/VeUQqVW6pmtiUzQdqMUmayME2ltEuBYxxmkvhksT3PKSXM
         am1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787551191; x=1788155991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w11pet1aD+xRnvhlpr87q+i2HekPQtfMLvtIw3f/i60=;
        b=RrthGvu4EJaDHED7OlsRDKnVTk0/ST6Obp18fOXtTxHTDshB5xFvTSSRFO3Jpe+VmW
         tK6l5O5ITBhKLz8H9rQAGikWGzM1sYxkKaQTLBgUkdXmcmD7uslG9+3mp3xkbunRokfO
         4EU4bjMNpA9BiZLYOPxem1Ol1MXlkPK5yzOn2mv+DoghCXB+8Qz8pWkwh+2o8bn2q9hO
         CJz1Z5LL8gYxpI97E/QpEzMoHScziwbDzOlKYASZVAmwBPZPOWGsKShzQrf/aiq/gId/
         ctzw5w6DrDmBesXMjCwoD8GSEl0sp7c16H7QTNNelbggQoUBCO+dYuxm5blFbZwzBA8z
         Ld5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpd/jqIk9JADClI7Vfk7Zmy0p61gscoCFWREA2Lu8WRSN9BtJBkqSiYJvWL6d2FTiCfvCyoBH1qCDpac0djuGmB@lists.infradead.org
X-Gm-Message-State: AFuF++lTMXg279yVKs/ZUuA/jS7p8Be/RnCy1Iksgj/3B2oguz7HLfB7
	lnZSHHXAc+qTq1td5DDnP7hg8qLHdvHAsUxDoHcdZiuQxaWbTRG4RTXx
X-Gm-Gg: AR+sD12HEwCyX0HE4EvJVmAgTpjZ0WRpdg2p4VhOzzSeIppXiaGxph3vbHBNqOo32rQ
	liJO6L7agOD6x2yQRCE0T3BrGs9NjL2E8Yh6SXQ8pQn5CmYVxE/PuSYwjc0xGYCZIJ8egeRKdyI
	2klh3yveXDOvC+12HMtZz3qZsGnmAvQ+LnS8raXfpnAE6D92nU+EnR93KIvC8Vbt5yclb/EsRtb
	mLQ65VyHkezuQ4tIltkjI6o3/G6nhNwTPym0dDw9YrKciNov7aGwUursc48p7+aO54XGWwfa5gb
	H2eS8m4NG/NAEKl6VAtr1sJYVCXzrfTpRgu4UeZ+sLLd1OK7L/g8+Jh23MgZbajrp0h/ICKp3Rd
	7Gq4UBvh/rzgJcIsfVPdyud1PR5tSCdoAG1Fgp4bKWSG/ROJTaEb6uGAPbmxvdH9EBA7jmUexnB
	pGkbfR6vWzRGHqPeDEx9R8MjvP3GKSU3qdSWAMoavIvWWQ5lWrTYYinLTG5EDuiFxDXmjYa6u4V
	hAA0oLAd/ZnXn/bP/rD48xQ7JQquw1G4D1olH2j9x/eJpXilnef3ELpqUEWF0vXJuqKPKkMv+Nb
	y2yYQabsSXY7g/du9z+vfw+DuEB8/ZQ3+9OwxnXZrOhs6HOT9OSfST8i/cbajWCb1Gd9
X-Received: by 2002:a05:6402:4546:b0:69e:2d56:690a with SMTP id 4fb4d7f45d1cf-6a42f133bb5mr22706126a12.8.1787551190634;
        Sun, 23 Aug 2026 22:59:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b297-8e01-ed33-c55f-13fa-4725.310.pool.telefonica.de. [2a02:3100:b297:8e01:ed33:c55f:13fa:4725])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2da49bsm7951950a12.29.2026.08.23.22.59.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 23 Aug 2026 22:59:50 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ARM: mm: LPAE: Change THP helpers to comply with generic MM semantics
Date: Mon, 24 Aug 2026 07:59:38 +0200
Message-Id: <20260824055938.27594-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_225952_954037_F8F20B02 
X-CRM114-Status: GOOD (  15.79  )
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

pmd_mkinvalid() clears L_PMD_SECT_VALID from a huge PMD. A PROT_NONE
huge mapping also lacks that bit. On LPAE, pmd_present() therefore
reports both entries as non-present even though they still describe a
huge page.

Generic THP teardown then takes the non-present path and decodes the PMD
as a softleaf entry. zap_huge_pmd() cannot find the folio and leaves the
huge page and its deposited page table behind. An unprivileged process
can leak 2 MiB on each mprotect(PROT_NONE) and munmap cycle.

Reserve an LPAE software bit for an invalidated-but-still-present
section, and make pmd_present() recognize it and L_PMD_SECT_NONE. An
invalidated PMD no longer contains PMD_TYPE_SECT, so make pmd_leaf() use
the resulting present state rather than the bare type bits.

Bit 56 is the only unused bit in LPAE's four-bit software field: the PMD
definitions already use bits 55, 57, and 58 for dirty, PROT_NONE, and
read-only state.

Since pmd_present() no longer indicates hardware accessibility, provide
pmd_access_permitted(), which checks the valid and user bits and the
read-only bit for writes. This keeps GUP-fast from accessing PROT_NONE
and invalidated huge PMDs. Do not retain the transition-only bit in
pmd_modify().

This mirrors arm64 commit b65399f6111b ("arm64/mm: Change THP helpers
to comply with generic MM semantics").

Fixes: 624531886987 ("ARM: 8578/1: mm: ensure pmd_present only checks the valid bit")
Cc: <stable@vger.kernel.org>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Testing: In an unpatched 1 GiB QEMU guest, 400 cycles reduced MemFree
from 981 MiB to 160 MiB. AnonHugePages remained at 819200 kB after exit,
and drop_caches recovered nothing. MADV_HUGEPAGE was unnecessary with
THP set to always.

The patch passed the 64-cycle reproducer and both CONFIG_GUP_TEST
fast-GUP checks on QEMU and Pi 400. It also passed DEBUG_VM_PGTABLE and
a four-vCPU CONFIG_PREEMPT=y test with 20,000 protection changes.

Full zImage builds passed for LPAE with and without THP and for non-LPAE.
LPAE+THP also built at v7.2-12555-g4352b8aee980.

 arch/arm/include/asm/pgtable-3level.h | 30 ++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 7b71a3d41..b2ca7408b 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -81,6 +81,7 @@
 
 #define L_PMD_SECT_VALID	(_AT(pmdval_t, 1) << 0)
 #define L_PMD_SECT_DIRTY	(_AT(pmdval_t, 1) << 55)
+#define L_PMD_SECT_PRESENT_INVALID	(_AT(pmdval_t, 1) << 56)
 #define L_PMD_SECT_NONE		(_AT(pmdval_t, 1) << 57)
 #define L_PMD_SECT_RDONLY	(_AT(pteval_t, 1) << 58)
 
@@ -116,9 +117,7 @@
 #define pud_present(pud)	(pud_val(pud))
 #define pmd_table(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
 						 PMD_TYPE_TABLE)
-#define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
-						 PMD_TYPE_SECT)
-#define pmd_leaf(pmd)		pmd_sect(pmd)
+#define pmd_leaf(pmd)		(pmd_present(pmd) && !pmd_table(pmd))
 
 #define pud_clear(pudp)			\
 	do {				\
@@ -177,7 +176,9 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 						: !!(pmd_val(pmd) & (val)))
 #define pmd_isclear(pmd, val)	(!(pmd_val(pmd) & (val)))
 
-#define pmd_present(pmd)	(pmd_isset((pmd), L_PMD_SECT_VALID))
+#define pmd_present(pmd)	(pmd_isset((pmd), L_PMD_SECT_VALID |	\
+					   L_PMD_SECT_NONE |		\
+					   L_PMD_SECT_PRESENT_INVALID))
 #define pmd_young(pmd)		(pmd_isset((pmd), PMD_SECT_AF))
 #define pte_special(pte)	(pte_isset((pte), L_PTE_SPECIAL))
 static inline pte_t pte_mkspecial(pte_t pte)
@@ -189,6 +190,19 @@ static inline pte_t pte_mkspecial(pte_t pte)
 #define pmd_write(pmd)		(pmd_isclear((pmd), L_PMD_SECT_RDONLY))
 #define pmd_dirty(pmd)		(pmd_isset((pmd), L_PMD_SECT_DIRTY))
 
+static inline bool pmd_access_permitted(pmd_t pmd, bool write)
+{
+	pmdval_t mask = L_PMD_SECT_VALID | PMD_SECT_USER;
+	pmdval_t needed = mask;
+
+	if (write)
+		mask |= L_PMD_SECT_RDONLY;
+
+	return (pmd_val(pmd) & mask) == needed;
+}
+
+#define pmd_access_permitted pmd_access_permitted
+
 #define pmd_hugewillfault(pmd)	(!pmd_young(pmd) || !pmd_write(pmd))
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -213,16 +227,18 @@ PMD_BIT_FUNC(mkyoung,   |= PMD_SECT_AF);
 /* No hardware dirty/accessed bits -- generic_pmdp_establish() fits */
 #define pmdp_establish generic_pmdp_establish
 
-/* represent a notpresent pmd by faulting entry, this is used by pmdp_invalidate */
+/* Create a faulting but software-present PMD for pmdp_invalidate(). */
 static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 {
-	return __pmd(pmd_val(pmd) & ~L_PMD_SECT_VALID);
+	return __pmd((pmd_val(pmd) & ~L_PMD_SECT_VALID) |
+		     L_PMD_SECT_PRESENT_INVALID);
 }
 
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
 	const pmdval_t mask = PMD_SECT_USER | PMD_SECT_XN | L_PMD_SECT_RDONLY |
-				L_PMD_SECT_VALID | L_PMD_SECT_NONE;
+				L_PMD_SECT_VALID | L_PMD_SECT_NONE |
+				L_PMD_SECT_PRESENT_INVALID;
 	pmd_val(pmd) = (pmd_val(pmd) & ~mask) | (pgprot_val(newprot) & mask);
 	return pmd;
 }
-- 
2.39.5 (Apple Git-154)

