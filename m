Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B69CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c8Omu33Kehv6UO5QnpWFWfqxuWjvz4FW2cUq9TsWXWQ=; b=Cf99sybTtTFyoHlURGjfYlQbbC
	YmD2IoDg2tNhTNKJPH9SSagoY5rji/lhB3wqHUKzRjT8Ao6CGzQkDX/CcHV2zbuRy9GlLWGI3imKl
	T85AozvsH+cnd7o6L7cBR0ga148dNHikB7mpeIaTnX97ePv0VnVdCtj+2WoZaFUSs+Oe4eCnjeFab
	Q8VJPHE1IKzWdNZ+7W1HpaBOd4v+YD6tkEhkHmRy5yiQx8CsPbknPwLg7gG6jSmC5ByRQ/gXwMNi0
	eXtOc/WuSsT+DcFdNG1xrQ8nUMzBDx/OGO4vLSBX3IQQqOQuBzFvybeK3ytUvfLh2GjcVXAs5XQAC
	1rkkNIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1AD-00000007oUb-1ndE;
	Mon, 18 Aug 2025 14:48:45 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwVf-000000075sf-41Rs;
	Mon, 18 Aug 2025 09:50:37 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c56yW6MFjz9sRs;
	Mon, 18 Aug 2025 11:35:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4lQMV8lRn9d; Mon, 18 Aug 2025 11:35:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c56yW5CjDz9sRk;
	Mon, 18 Aug 2025 11:35:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EFE08B764;
	Mon, 18 Aug 2025 11:35:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id A_F0l_xYSBua; Mon, 18 Aug 2025 11:35:31 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6855F8B763;
	Mon, 18 Aug 2025 11:35:31 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2] asm-generic: Remove pud_user() from pgtable-nopmd.h
Date: Mon, 18 Aug 2025 11:35:29 +0200
Message-ID: <c2c9fc69871a7caaa205e237ff73557f19f5e176.1755509286.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755509730; l=2790; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=LTBJbGAaZnZ9xdSyMCrWcKItZ2m45x3r8zAe1HyRjkA=; b=8qUOHdMYJYyqO833zMLZ/GYzKalR9OMtGfcspZDpf14JjHMbxR02lStqhYZM25fsAVWilTr0q wzzsorRSqjLBdi9uE2wvgfjKDvqiPoLqP1ZmxaRS+NLBOlTSuLY3Wry
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_025036_152399_6A1D7B0B 
X-CRM114-Status: GOOD (  12.36  )
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

Commit 2c8a81dc0cc5 ("riscv/mm: fix two page table check related
issues") added pud_user() in include/asm-generic/pgtable-nopmd.h

But pud_user() only exists on ARM64 and RISCV and is not expected
by any part of MM.

Add the missing definition in arch/riscv/include/asm/pgtable-32.h
and remove it from asm-generic/pgtable-nopmd.h

A stub pud_user() is also required for ARM64 after
commit ed928a3402d8 ("arm64/mm: fix page table check compile
error for CONFIG_PGTABLE_LEVELS=2")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
Not sure whether this goes via asm-generic or mm as it touches the earth of mm allthough the files are in asm-generic

v2: Change ARM64 pud_user macro to pud_user(pud)
---
 arch/arm64/include/asm/pgtable.h    | 1 +
 arch/riscv/include/asm/pgtable-32.h | 5 +++++
 include/asm-generic/pgtable-nopmd.h | 1 -
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index abd2dee416b3..d812ed1c96b4 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -955,6 +955,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 
 #define pud_valid(pud)		false
 #define pud_page_paddr(pud)	({ BUILD_BUG(); 0; })
+#define pud_user(pud)		false /* Always 0 with folding */
 #define pud_user_exec(pud)	pud_user(pud) /* Always 0 with folding */
 
 /* Match pmd_offset folding in <asm/generic/pgtable-nopmd.h> */
diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 00f3369570a8..37878ef37466 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -36,4 +36,9 @@
 static const __maybe_unused int pgtable_l4_enabled;
 static const __maybe_unused int pgtable_l5_enabled;
 
+static inline int pud_user(pud_t pud)
+{
+	return 0;
+}
+
 #endif /* _ASM_RISCV_PGTABLE_32_H */
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index 8ffd64e7a24c..b01349a312fa 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -30,7 +30,6 @@ typedef struct { pud_t pud; } pmd_t;
 static inline int pud_none(pud_t pud)		{ return 0; }
 static inline int pud_bad(pud_t pud)		{ return 0; }
 static inline int pud_present(pud_t pud)	{ return 1; }
-static inline int pud_user(pud_t pud)		{ return 0; }
 static inline int pud_leaf(pud_t pud)		{ return 0; }
 static inline void pud_clear(pud_t *pud)	{ }
 #define pmd_ERROR(pmd)				(pud_ERROR((pmd).pud))
-- 
2.49.0


