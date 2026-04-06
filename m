Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7681FFB5168
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 21:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X4Z/u0BPYRMqLs52XcLcvuYfZRh4JiZHKYBfZ5dQ7wg=; b=ZsQ7Ep/p+ZZyHTsqgVd8XXc0Ub
	TNy1bpM2qM+qPKsm5JqPhPfioHET+8Lgwd/utn9+Q4rEm7ntUXSYG+cbESo0m38qIE5nivi9tE9d9
	zutl/pi4MdxKjh8Mif540QyWcetcowxMAVDtcefcLobS287Qwc4+8mo5iQKhwemsgJWODdIYlIWNw
	f1gZS1CSFy0M9f0epC78v1MAxK/9PcYHpErk9mH5lSsZizTa1qO6FSH+8r1xV0Ny12FQRqUbiLDz3
	MOgl911+Fk+1SD32DftM+im947BNGVOORbs8PqaJmb34ngPbHGYMUaiVRqFyKgc+nE2jJJdhOkfDv
	FDH3gf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9rZR-00000005X0k-3Db8;
	Mon, 06 Apr 2026 21:33:21 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9rZP-00000005X0Q-1zUO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 21:33:20 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id DD7A220B710C;
	Mon,  6 Apr 2026 14:33:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DD7A220B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775511197;
	bh=X4Z/u0BPYRMqLs52XcLcvuYfZRh4JiZHKYBfZ5dQ7wg=;
	h=From:To:Cc:Subject:Date:From;
	b=O9JczRbzGjrgnNesBV28xXrzqGwYfcUroOs+rggyWVdNAg4cxLpjWBN37n+qhE9o2
	 hNc+Oi0tCULO36I221+G1Jgp8j4w4alMZZiAXlmWwFWhkh/ERUD6Keazel2C+y8UKh
	 c2xrJeRoOL7XLHLddE4YOccUS1Inen+lvPABPWpk=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: suzuki.poulose@arm.com,
	steven.price@arm.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	yang@os.amperecomputing.com,
	shijie@os.amperecomputing.com,
	kevin.brodsky@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] arm64: mm: support set_memory_encrypted/decrypted for vmalloc addresses
Date: Mon,  6 Apr 2026 14:33:17 -0700
Message-ID: <20260406213317.216171-1-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_143319_634451_BC4D61A0 
X-CRM114-Status: GOOD (  16.13  )
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

Currently __set_memory_enc_dec() only handles linear map (lm) addresses
and returns -EINVAL for anything else. This means callers using
vmalloc'd buffers cannot mark memory as shared/protected with the RMM
via set_memory_decrypted()/set_memory_encrypted().

Extend the implementation to handle vmalloc (non-linear-map) addresses
by introducing __set_va_addr_enc_dec(). For vmalloc addresses, the page
table entries are not contiguous in the physical address space, so the
function walks the vm_area's pages array and issues per-page RSI calls
to transition each page between shared and protected states.

The original linear-map path is factored out into __set_lm_addr_enc_dec(),
and __set_memory_enc_dec() now dispatches to the appropriate helper based
on whether the address is a linear map address.

Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/mm/pageattr.c | 74 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index ce035e1b4eaf..45058f61b957 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -275,20 +275,12 @@ int set_direct_map_default_noflush(struct page *page)
 				 PAGE_SIZE, set_mask, clear_mask);
 }
 
-static int __set_memory_enc_dec(unsigned long addr,
-				int numpages,
-				bool encrypt)
+static int __set_lm_addr_enc_dec(unsigned long addr, int numpages, bool encrypt)
 {
 	unsigned long set_prot = 0, clear_prot = 0;
 	phys_addr_t start, end;
 	int ret;
 
-	if (!is_realm_world())
-		return 0;
-
-	if (!__is_lm_address(addr))
-		return -EINVAL;
-
 	start = __virt_to_phys(addr);
 	end = start + numpages * PAGE_SIZE;
 
@@ -321,6 +313,70 @@ static int __set_memory_enc_dec(unsigned long addr,
 				      __pgprot(PTE_PRESENT_INVALID));
 }
 
+static int __set_va_addr_enc_dec(unsigned long addr, int numpages, bool encrypt)
+{
+	unsigned long set_prot = 0, clear_prot = 0, start_idx;
+	struct vm_struct *area;
+	int i, ret;
+
+	if (encrypt)
+		clear_prot = PROT_NS_SHARED;
+	else
+		set_prot = PROT_NS_SHARED;
+
+	area = find_vm_area((void *)addr);
+	if (!area)
+		return -EINVAL;
+
+	start_idx = ((unsigned long)kasan_reset_tag((void *)addr) -
+		     (unsigned long)kasan_reset_tag(area->addr)) >>
+		    PAGE_SHIFT;
+
+	if (start_idx + numpages > area->nr_pages)
+		return -EINVAL;
+
+	/*
+	 * Break the mapping before we make any changes to avoid stale TLB
+	 * entries or Synchronous External Aborts caused by RIPAS_EMPTY
+	 */
+	ret = change_memory_common(addr, numpages,
+		__pgprot(set_prot | PTE_PRESENT_INVALID),
+		__pgprot(clear_prot | PTE_PRESENT_VALID_KERNEL));
+
+	if (ret)
+		return ret;
+
+	for (i = 0; i < numpages; i++) {
+		struct page *page = area->pages[start_idx + i];
+		phys_addr_t phys = page_to_phys(page);
+
+		if (encrypt) {
+			ret = rsi_set_memory_range_protected(phys,
+							     phys + PAGE_SIZE);
+		} else {
+			ret = rsi_set_memory_range_shared(phys,
+							  phys + PAGE_SIZE);
+		}
+		if (ret)
+			return ret;
+	}
+
+	return change_memory_common(addr, numpages,
+				    __pgprot(PTE_PRESENT_VALID_KERNEL),
+				    __pgprot(PTE_PRESENT_INVALID));
+}
+
+static int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt)
+{
+	if (!is_realm_world())
+		return 0;
+
+	if (!__is_lm_address(addr))
+		return __set_va_addr_enc_dec(addr, numpages, encrypt);
+
+	return __set_lm_addr_enc_dec(addr, numpages, encrypt);
+}
+
 static int realm_set_memory_encrypted(unsigned long addr, int numpages)
 {
 	int ret = __set_memory_enc_dec(addr, numpages, true);

base-commit: 25f6040ca43a78048466b949994b8d637fe2fe07
-- 
2.45.4


