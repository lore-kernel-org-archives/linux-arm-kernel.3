Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75C5EA4FB8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anTxV+sv5BszJFiG5JpaFzPe/rYRQ+bY9ibIH6/MY3w=; b=rP1+heVKKqg3OGoQTM4726BeCt
	d/r4hc25tKL9z0pUaMmUBc/KM+Ypy44JjOJzsMyXADXGT/vfB7dGTla/VGM8+Wd1D0s6wuKFUTB2a
	oRqQyLfM4LtWDIZJuzDO/vl0kkMkI4y86sV/rAQekqx65mO6yRErXoLpf4Lx5y3ClvzGsXsZbvs10
	c0M1d4oVG3DNlCwoZ5qeyqtKRyP0YZciguMlRiIOVXecJ4FePg8MWUtsKF6k09eisYrv7LYXfORBn
	Iifn4MZAMthlij2wYnMdOKRR4z9PLhTPkbQg6gJqTeFl7CLsDxLbJe3bnOkSPyaBXPcYa5xaoNLP9
	iER9DppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVCE-00000000Hqh-2GlS;
	Mon, 23 Feb 2026 12:37:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVCB-00000000HqJ-22oH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:37:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2820844257;
	Mon, 23 Feb 2026 12:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DE7C116D0;
	Mon, 23 Feb 2026 12:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771850270;
	bh=DARLU9PRhXEqGMQEgxyxiRXMnp76keYf4PJl96EYaKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PSrFXcOBdPDtdo5nUAH+LOaB1CfOxO7vX9jVipuRsIZ1nUGxfwdFTaaOG6stVvcE2
	 0wF+wzuOxTxznVHAFQrFaJoM7V/aRTnF5KlojAQtOvOfzQtq07V4gUVC7zz3cX2a8n
	 xNE41tiTp/UeO6fU3/UPG7EL4GQIZSjraWF2jZ1tYDPNYO4q8m96/D62FiJNczqNC0
	 7ZEzwgLdwXxrk2OCdBB2La/XXsCmGsKoZxMA1jX2OMVN2rMmy0p18HqsmmkCe4x8L8
	 Uoar8qO1ie4cockybEzDjIVu9MwYLvZjZDOsUfVoukvYCrUBuxTSD456Q3R1zF14K+
	 czVr47KVLheLQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16)
Date: Mon, 23 Feb 2026 07:37:12 -0500
Message-ID: <20260223123738.1532940-7-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223123738.1532940-1-sashal@kernel.org>
References: <20260223123738.1532940-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_043751_621414_12312CD6 
X-CRM114-Status: GOOD (  19.86  )
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

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 729a2e8e9ac47099a967567389cc9d73ef4194ca ]

gcc-16 warns about an instance that older compilers did not:

arch/arm64/mm/hugetlbpage.c: In function 'huge_pte_clear':
arch/arm64/mm/hugetlbpage.c:369:57: error: parameter 'addr' set but not used [-Werror=unused-but-set-parameter=]

The issue here is that __pte_clear() does not actually use its second
argument, but when CONFIG_ARM64_CONTPTE is enabled it still gets
updated.

Replace the macro with an inline function to let the compiler see
the argument getting passed down.

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### What the commit does

This commit replaces a `__pte_clear` macro with an equivalent inline
function to fix a gcc-16 build warning/error:

**Old (macro):**
```c
#define __pte_clear(mm, addr, ptep) \
    __set_pte(ptep, __pte(0))
```

**New (inline function):**
```c
static inline void __pte_clear(struct mm_struct *mm,
                               unsigned long addr, pte_t *ptep)
{
    __set_pte(ptep, __pte(0));
}
```

The two are functionally identical. The only difference is that the
inline function form allows the compiler to understand that `mm` and
`addr` are intentionally unused parameters passed through to satisfy the
interface, suppressing the `-Werror=unused-but-set-parameter` warning
that gcc-16 newly introduces.

### Classification: Build Fix

This is a **build fix** — it prevents compilation failure with gcc-16
when `-Werror` is enabled. Build fixes are explicitly listed as
acceptable stable material in the stable kernel rules.

### Risk Assessment

**Risk: Extremely low.** The macro-to-inline-function conversion
produces identical compiled output. The function body is identical
(`__set_pte(ptep, __pte(0))`), and the compiler will inline it, making
the generated code exactly the same. There is zero behavioral change at
runtime.

### Scope

- **1 file changed** (`arch/arm64/include/asm/pgtable.h`)
- Small, surgical change — macro removed, inline function added in
  appropriate location
- No logic changes whatsoever

### Considerations Against Backporting

- **gcc-16 is very new** — most stable kernel users and enterprise
  distributions won't use it for some time
- This is not a runtime bug — it only affects compilation
- The warning only becomes an error with `-Werror=unused-but-set-
  parameter` (which gcc-16 enables by default or through `-Werror`)

### Considerations For Backporting

- Build fixes are explicitly listed as stable-worthy in stable kernel
  rules
- The change is **zero risk** — functionally identical
- As distributions and users adopt gcc-16, they will hit this on older
  kernels
- Already reviewed and accepted by arm64 maintainers (Reviewed-by: Dev
  Jain, Signed-off-by: Will Deacon)

### Verification

- Verified the old macro and new inline function are functionally
  identical by reading the diff — both call `__set_pte(ptep, __pte(0))`
  and discard `mm` and `addr`
- Verified this is purely a build fix with no runtime behavioral change
- The commit message clearly describes the gcc-16 warning/error and the
  solution
- The commit has proper review chain (Suggested-by: Catalin Marinas,
  Reviewed-by: Dev Jain, Signed-off-by: Will Deacon — all arm64
  maintainers/reviewers)
- Could NOT verify whether stable trees already have other gcc-16 build
  fixes (unverified, but irrelevant to the merits of this specific fix)

### Conclusion

This is a zero-risk build fix that prevents compilation failure with
gcc-16. While gcc-16 is new and most stable users won't encounter this
immediately, the change is so low-risk (functionally identical macro-to-
inline conversion) that the benefit of proactively fixing compilation
clearly outweighs the negligible risk. Build fixes are explicitly called
out as stable material.

**YES**

 arch/arm64/include/asm/pgtable.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 64d5f1d9cce96..5ab5fe3bef25e 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -179,8 +179,6 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
 
 #define pte_none(pte)		(!pte_val(pte))
-#define __pte_clear(mm, addr, ptep) \
-				__set_pte(ptep, __pte(0))
 #define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
 
 /*
@@ -1320,6 +1318,13 @@ static inline bool pud_user_accessible_page(pud_t pud)
 /*
  * Atomic pte/pmd modifications.
  */
+
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
+{
+	__set_pte(ptep, __pte(0));
+}
+
 static inline int __ptep_test_and_clear_young(struct vm_area_struct *vma,
 					      unsigned long address,
 					      pte_t *ptep)
-- 
2.51.0


