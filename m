Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C27EEC29D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 22:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgPtqkzOwDv9JSngpAt1nN8E3WPL08Qy6iowNH2JIic=; b=tTHoD4XyDUldtKvwUrgI/i3uH4
	SfRiWXl3i2sVN6igYg6GoWf35Off3TAIYJPpiMRPtqoX9lAqbhis27ZiZtgbGYq65tiyuWCV58pkh
	W76AGswf/vr+wiCaEkFdkS7VpXRyzULsCFIslQz3Tu1yk+T12GREAuN+P2HIZAubgJ8dGUqUsDufp
	Decf2riLQuTUbMFzKvQ35MaRYHl8TfnNYI0E4baaBdpXqk8mad3xqIHk8o/HMMpiA/M4sI4spl6cH
	tJom3E+zdeziuJa0jx128PHhGSMaKxa9eC7u7kXpohvKfBcvMeDkyfvqWJO2VgFfwHuRMo/k1DPWh
	HYDt6gCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vue8H-000000015vO-2ZHn;
	Mon, 23 Feb 2026 22:10:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vue8F-000000015uX-1nE5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 22:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6E00600AE;
	Mon, 23 Feb 2026 22:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C19C116C6;
	Mon, 23 Feb 2026 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771884622;
	bh=bJEA2tKo8GobzvxZMMG6jtxU+7FehDZ6MIMLi5Cb/yU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BEe+gJME1puH/jZUp0d67Jjt6lEIyLN6CVBWJbc29imfVOIybVcS0yqYeJpQgRx9U
	 bTfXJAhZkvvDHpGREr0PdPtOCxE7GJV5khi4Ct1t3EKjaNvfevoZazuXnvnppJRslJ
	 x90dtjPMmH26yi3aTyk/7+R9L74Ms5XG6uqzVZyk1VtQfiIWQFr3PbktVNSFQINTJB
	 wGEdloaZrNRDiMNSDCVjLLoY+0tK7ZYJO3Tt2kjTFMDOhgeEr3VyOiSJLKeTuNIFWk
	 z2wjUJ2ybBwakcSitPR43rbxxtUtbLpZsu1qqlCy9S3ou6a+2LCPjTTDPzQQJmpo7D
	 K9MJ9+kDQaxxQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Zeng Heng <zengheng4@huawei.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/2] arm64: io: Extract user memory type in ioremap_prot()
Date: Mon, 23 Feb 2026 22:10:11 +0000
Message-ID: <20260223221012.31962-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223221012.31962-1-will@kernel.org>
References: <20260223221012.31962-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The only caller of ioremap_prot() outside of the generic ioremap()
implementation is generic_access_phys(), which passes a 'pgprot_t' value
determined from the user mapping of the target 'pfn' being accessed by
the kernel. On arm64, the 'pgprot_t' contains all of the non-address
bits from the pte, including the permission controls, and so we end up
returning a new user mapping from ioremap_prot() which faults when
accessed from the kernel on systems with PAN:

  | Unable to handle kernel read from unreadable memory at virtual address ffff80008ea89000
  | ...
  | Call trace:
  |   __memcpy_fromio+0x80/0xf8
  |   generic_access_phys+0x20c/0x2b8
  |   __access_remote_vm+0x46c/0x5b8
  |   access_remote_vm+0x18/0x30
  |   environ_read+0x238/0x3e8
  |   vfs_read+0xe4/0x2b0
  |   ksys_read+0xcc/0x178
  |   __arm64_sys_read+0x4c/0x68

Extract only the memory type from the user 'pgprot_t' in ioremap_prot()
and assert that we're being passed a user mapping, to protect us against
any changes in future that may require additional handling. To avoid
falsely flagging users of ioremap(), provide our own ioremap() macro
which simply wraps __ioremap_prot().

Cc: Zeng Heng <zengheng4@huawei.com>
Cc: Jinjiang Tu <tujinjiang@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Fixes: 893dea9ccd08 ("arm64: Add HAVE_IOREMAP_PROT support")
Reported-by: Jinjiang Tu <tujinjiang@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/io.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index cd2fddfe814a..8cbd1e96fd50 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -266,10 +266,23 @@ typedef int (*ioremap_prot_hook_t)(phys_addr_t phys_addr, size_t size,
 int arm64_ioremap_prot_hook_register(const ioremap_prot_hook_t hook);
 void __iomem *__ioremap_prot(phys_addr_t phys, size_t size, pgprot_t prot);
 
-#define ioremap_prot __ioremap_prot
+static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
+					 pgprot_t user_prot)
+{
+	pgprot_t prot;
+	ptdesc_t user_prot_val = pgprot_val(user_prot);
 
-#define _PAGE_IOREMAP PROT_DEVICE_nGnRE
+	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
+		return NULL;
 
+	prot = __pgprot_modify(PAGE_KERNEL, PTE_ATTRINDX_MASK,
+			       user_prot_val & PTE_ATTRINDX_MASK);
+	return __ioremap_prot(phys, size, prot);
+}
+#define ioremap_prot ioremap_prot
+
+#define ioremap(addr, size)	\
+	__ioremap_prot((addr), (size), __pgprot(PROT_DEVICE_nGnRE))
 #define ioremap_wc(addr, size)	\
 	__ioremap_prot((addr), (size), __pgprot(PROT_NORMAL_NC))
 #define ioremap_np(addr, size)	\
-- 
2.53.0.371.g1d285c8824-goog


