Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F966C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 01:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvZYoSrwSnq9oQmpNPjcxAULV/EJBVzNvxkmRdrXDtk=; b=PBcFrt/Hx0DNDF4hdMB61Wrp7g
	6RKt5SoRQH7vwfPPPVyPbF/smB7izs7IT6aajtA4holZZAUPFHthVujwYE7zrcgw73HHbPF79QtTw
	z12vhM8cKxYE9ige8loEJSJspIV54jSQM08LPxX1Gz4Ju5a1Jt3WXXjeQ73HHUFahWBjVo6VG93R7
	FqObeKcnE1cGNwj9wA3ikvvl1ACW0pPQYKNVFGG9PwwWeJvkx/BmcOVZ2EFSe4oqCqWKI9wMZ1qo8
	d3f1PsUkx512z859B1X9sMj3DOSfAomi2Qasqw7NPbSmPeVwtI93pFWBLv4OAexv2+Ap6Q+6/Gf9V
	O4lgk87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6p3-00000009S5w-1QKS;
	Tue, 06 May 2025 01:10:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Xc-00000008qRI-2WXx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:44:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4654DA4D045;
	Mon,  5 May 2025 22:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E876C4CEE4;
	Mon,  5 May 2025 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485043;
	bh=ILuU5mUox98kRSvahMMITcFsLpKEN2lWclTNJeUIJPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n/Z++15l53s0L2N/1E8pKE9xkLY34ryrZnQkxDqWXp49BliYMLBGP5eZbO9F6mH15
	 ZoL5sgWBeZRolMpPGbeyCGDtOkZsZPpLvfiVe0qlKMljOu3V6lkQwdChzzGN1zHzcq
	 1eGKT104o5HOVrlQGyjXnnMa58oKyf4RtyS28weRcyC4lUtSk+obWHCvzCt+ZS3hIo
	 x9wByhxs52LSVfTqUPCApdUOluvDplNVhnIdHBblj64WW9/ObiMCpxJC1nfyefcP7o
	 9uzK1hqYRGJVIJF06gGnZjkQIeTO5ns+ZzrPZf61ixoTgzsVPol4+8uzsNfF/ARk1/
	 WjEi99C62uAdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	gshan@redhat.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	yangyicong@hisilicon.com,
	ioworker0@gmail.com
Subject: [PATCH AUTOSEL 6.12 138/486] arm64/mm: Check pmd_table() in pmd_trans_huge()
Date: Mon,  5 May 2025 18:33:34 -0400
Message-Id: <20250505223922.2682012-138-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154404_787829_78252A0E 
X-CRM114-Status: GOOD (  11.67  )
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

From: Ryan Roberts <ryan.roberts@arm.com>

[ Upstream commit d1770e909898c108e8c7d30ca039053e8818a9c9 ]

Check for pmd_table() in pmd_trans_huge() rather then just checking for the
PMD_TABLE_BIT. But ensure all present-invalid entries are handled correctly
by always setting PTE_VALID before checking with pmd_table().

Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250221044227.1145393-8-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index c329ea061dc98..8ee56ae999c16 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -554,18 +554,6 @@ static inline int pmd_protnone(pmd_t pmd)
 #endif
 
 #define pmd_present(pmd)	pte_present(pmd_pte(pmd))
-
-/*
- * THP definitions.
- */
-
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-static inline int pmd_trans_huge(pmd_t pmd)
-{
-	return pmd_val(pmd) && pmd_present(pmd) && !(pmd_val(pmd) & PMD_TABLE_BIT);
-}
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-
 #define pmd_dirty(pmd)		pte_dirty(pmd_pte(pmd))
 #define pmd_young(pmd)		pte_young(pmd_pte(pmd))
 #define pmd_valid(pmd)		pte_valid(pmd_pte(pmd))
@@ -725,6 +713,18 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 #define pmd_leaf_size(pmd)	(pmd_cont(pmd) ? CONT_PMD_SIZE : PMD_SIZE)
 #define pte_leaf_size(pte)	(pte_cont(pte) ? CONT_PTE_SIZE : PAGE_SIZE)
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static inline int pmd_trans_huge(pmd_t pmd)
+{
+	/*
+	 * If pmd is present-invalid, pmd_table() won't detect it
+	 * as a table, so force the valid bit for the comparison.
+	 */
+	return pmd_val(pmd) && pmd_present(pmd) &&
+	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
 #if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
 static inline bool pud_sect(pud_t pud) { return false; }
 static inline bool pud_table(pud_t pud) { return true; }
-- 
2.39.5


