Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFF5C5DF84
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooj4RdTct5lgHaX1GvqaQ3GTFEQHRRvtsBE0okBw5Bs=; b=r5eBwRqH+LkWVdQXahFyzv+sIX
	/X6euZhPtJjk6eT28cxMFDRjEm5cX5qoKk3ar1P1wWUr5yBx+90TxgluHb1lG356wQwIL6zgnqitO
	C19k38/URiKj/XL1/ImxIdiw1hkgZe1NiJelXu4jgHykXbqaPCLPpfFEld94uWH35wFsityeIjvb3
	+rzmuGgNWTs4N6KxijAfWOICkJ8cjjHUMTUrxFgWcVomGyBXKkyp9NsEkU3f/gty2RWKOLNmu/AJk
	5VMK3b94GARdRc9P+FLYClyfaIKyn0rQ1uG7CLpDu7qgwwJoZbKTN77lL6ZeFa5X2TSnfrpGz5EuQ
	/o7VYAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKXa-000000086eZ-1jVK;
	Tue, 18 Aug 2026 14:11:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKXX-000000086dI-3Ur7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:11:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D35219F6;
	Tue, 18 Aug 2026 07:11:38 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D6083F85F;
	Tue, 18 Aug 2026 07:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062302; bh=BkjNRdlehpq/qqZwQhBLzY19lD555G+nB+rRbzspEEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WXekD//Fmvb8C1WyhB1190zPRpkkuswNYtmwwoMeNS+olFxji+e80KDeIztBkSSqE
	 1N8MXkQ+SkSeSh4MWEyuEkArYRfTujxs6s7NTROKtDpdvnWDviu8lnOK7SFAEZjvZa
	 +iqm+CakJdybHTz5fi65HVUhf1uIj56pfWjDYRoA=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 18 Aug 2026 15:08:46 +0100
Subject: [PATCH RFC v9 04/25] arm64: Introduce por_elx_set_pkey_perms()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-kpkeys-v9-4-743ad31b2c8f@arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
In-Reply-To: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787062276; l=2582;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=BkjNRdlehpq/qqZwQhBLzY19lD555G+nB+rRbzspEEE=;
 b=4ZTyW5TcfHxhyckVVjluqnadzTDAbx78zgNQa3gNuWY+CA+irOo4uc0URWKL6zTzAj8ERPxz5
 gARLFho9C3ZB33hSphiUVjYeAThs20KMb6VCEKJUc25+Dwhztu0cOIg
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071143_953521_F873C62A 
X-CRM114-Status: GOOD (  14.05  )
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

Introduce a helper that sets the permissions of a given pkey
(POIndex) in the POR_ELx format, and make use of it in
arch_set_user_pkey_access().

new_por now represents the permissions of a single pkey, so rename
it to new_perms and change its type accordingly.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/por.h |  7 +++++++
 arch/arm64/mm/mmu.c          | 26 ++++++++++----------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
index d913d5b529e4..19b3dd1d43a0 100644
--- a/arch/arm64/include/asm/por.h
+++ b/arch/arm64/include/asm/por.h
@@ -31,4 +31,11 @@ static inline bool por_elx_allows_exec(u64 por, u8 pkey)
 	return perm & POE_X;
 }
 
+static inline u64 por_elx_set_pkey_perms(u64 por, u8 pkey, u8 perms)
+{
+	u64 shift = POR_ELx_PERM_SHIFT(pkey);
+
+	return (por & ~(POE_MASK << shift)) | ((u64)perms << shift);
+}
+
 #endif /* _ASM_ARM64_POR_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index d4de88770ecf..767478d9e84b 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2305,8 +2305,8 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 #ifdef CONFIG_ARCH_HAS_PKEYS
 int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 {
-	u64 new_por;
-	u64 old_por;
+	u8 new_perms;
+	u64 por;
 
 	if (!system_supports_poe())
 		return -ENOSPC;
@@ -2320,25 +2320,19 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 		return -EINVAL;
 
 	/* Set the bits we need in POR:  */
-	new_por = POE_RWX;
+	new_perms = POE_RWX;
 	if (init_val & PKEY_DISABLE_WRITE)
-		new_por &= ~POE_W;
+		new_perms &= ~POE_W;
 	if (init_val & PKEY_DISABLE_ACCESS)
-		new_por &= ~POE_RW;
+		new_perms &= ~POE_RW;
 	if (init_val & PKEY_DISABLE_READ)
-		new_por &= ~POE_R;
+		new_perms &= ~POE_R;
 	if (init_val & PKEY_DISABLE_EXECUTE)
-		new_por &= ~POE_X;
+		new_perms &= ~POE_X;
 
-	/* Shift the bits in to the correct place in POR for pkey: */
-	new_por = POR_ELx_PERM_PREP(pkey, new_por);
-
-	/* Get old POR and mask off any old bits in place: */
-	old_por = read_sysreg_s(SYS_POR_EL0);
-	old_por &= ~(POE_MASK << POR_ELx_PERM_SHIFT(pkey));
-
-	/* Write old part along with new part: */
-	write_sysreg_s(old_por | new_por, SYS_POR_EL0);
+	por = read_sysreg_s(SYS_POR_EL0);
+	por = por_elx_set_pkey_perms(por, pkey, new_perms);
+	write_sysreg_s(por, SYS_POR_EL0);
 
 	return 0;
 }

-- 
2.51.2


