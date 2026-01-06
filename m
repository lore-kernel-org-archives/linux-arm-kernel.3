Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DB3CEFCE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=po+Od5bE1OZ7eQisdGEoZ72OFB4fHKeOv7mSVkFNL3I=; b=3qQJ+TZeahnantVCLXyTfH2nVi
	Mu2nBBLF8/MNcUn1BBDH+WLadBPQN9dFBJRkOeLCAiswrrzeqqm/CxxO1OGS7bAPoIU7KEuAdpEwI
	R+sH48sjJ8WC3GWj2LJdJMLXVic/6DGlAJMs2H9n4d3jFv4W/D3ui38oZTo7r5cJkd1FzV/GOPudc
	b2PiSMsG8KqEVYfnfCYlZVChyrtgnyNBKRNOcJcc+IgG+sKSAOvr7fetwewzQVkYhjkB9PRPsj0AC
	nkTPbHUl7L7gxeDwyMnV/uZ9qEMtMJYtNE46TlEtOSdHuukI97bwB4LgfhRb6jCGDqquIEhIY2CZp
	9x/Y1uVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAzB-0000000DZux-0bPm;
	Tue, 06 Jan 2026 17:36:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAz9-0000000DZuX-1jUS;
	Tue, 06 Jan 2026 17:36:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DCDC434FA;
	Tue,  6 Jan 2026 17:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7808AC116C6;
	Tue,  6 Jan 2026 17:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767721006;
	bh=2bhIEBi52pIagS1gzwrT2nGBXwwpZUgIJ8cVRDzNmRs=;
	h=From:To:Cc:Subject:Date:From;
	b=aUcZ6ByDj/EDc5TqP6NwYwESet8oPR96E8Ha+KbhwG++iJCjHHs5649/YILIN6a5i
	 lGLE59xRuT59pszXonCOTd03/wQSf0UIdugbC2EoY/cRqkdw76MN1otcSzOM2gnGOT
	 R3PoL0dEo6SZnQlqiGRkk39RTykCHpRlIzpVKpvgxbvu/ahnvc66yMAxpYYkllD+cp
	 1Du2G2u+74mLsej9bCPE5w93oZi5AMspAQXn4BsTS9FcpNs4KlBM2fpUz+il6A4rHn
	 5Pp0NFrHCgq77O7kOipx7LrpoMg3jmLN0oCBY4HOcB52TGb5k5NERwZa77xTa0enaf
	 b+9x5XwTQ0b/w==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RESEND v2] asm-generic: Remove pud_user() from pgtable-nopmd.h
Date: Tue,  6 Jan 2026 18:34:20 +0100
Message-ID: <61ef32ebc3ea2e926de2bebecf3b5c3a10989fca.1767720453.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2913; i=chleroy@kernel.org; h=from:subject:message-id; bh=2bhIEBi52pIagS1gzwrT2nGBXwwpZUgIJ8cVRDzNmRs=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTGus913H6oo5FNQlXgwSqpRTHr7m98sNP9nJm6/78fb WWTt/dN6ShlYRDjYpAVU2Q5/p9714yuL6n5U3fpw8xhZQIZwsDFKQATaWNm+B+jI1vqtaJqhUq3 cVqqEX/2FbsHzPnPzv04frwmMPPwXFZGhqkeqflXf2vvPx5Zw80+/62G5qmXl8rF5GvvXmnelLD OlhcA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_093647_490506_AFC7F7C5 
X-CRM114-Status: GOOD (  14.40  )
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

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
Who should take this patch ? I expected it to be merged by Arnd as asm-generic maintainer but this is the second time I resend.

Should the patch go via riscv tree instead as the undue pud_user() was initialy introduced by riscv ?

v2: Change ARM64 pud_user macro to pud_user(pud)
---
 arch/arm64/include/asm/pgtable.h    | 1 +
 arch/riscv/include/asm/pgtable-32.h | 5 +++++
 include/asm-generic/pgtable-nopmd.h | 1 -
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 64d5f1d9cce96..a9af0b441b0f9 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -965,6 +965,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 
 #define pud_valid(pud)		false
 #define pud_page_paddr(pud)	({ BUILD_BUG(); 0; })
+#define pud_user(pud)		false /* Always 0 with folding */
 #define pud_user_exec(pud)	pud_user(pud) /* Always 0 with folding */
 
 /* Match pmd_offset folding in <asm/generic/pgtable-nopmd.h> */
diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 00f3369570a83..37878ef374668 100644
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
index 8ffd64e7a24cb..b01349a312fa7 100644
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


