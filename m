Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FC0C44536
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHE9E+mQ6FecAcifXNkjcLKFQsJdzpbS6vo0hKS7MCs=; b=xUzLutt/JApxrRiIYMgz5Cb/gD
	vOAdEYAo49BLOs2n1iFgcDkhDjbQDm06V44gLMo0DJAj3QgBYRnJHJvFnrvX178ruh5/PIAThiqrn
	AtC7069K649b7mnjDU9z/jsejiQaP3x9YTPn0w8UKFXs60ANLxq0rR+vkDLYPk8LmD6F8LD9XvtTl
	b/FsXhQ9y4h1vP2KtqKaa9WyjD8DVykEai4px07is5u6YA7HAVBZZ/Oy35N5UNoRQn2c6GZN4UoQ7
	lD+0p0pXjzaJEDhoVDt+WTDllU5ByerpdJ6m+HoVowu35wqqBakuz5kmcy6LSBjMBH2xxCP9Spr0t
	Hjbl61uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDHF-00000009uHc-4Bdc;
	Tue, 21 Jul 2026 16:25:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDHE-00000009uEp-2baA;
	Tue, 21 Jul 2026 16:25:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A9BE42446;
	Tue, 21 Jul 2026 16:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C379D1F00A3F;
	Tue, 21 Jul 2026 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651104;
	bh=aHE9E+mQ6FecAcifXNkjcLKFQsJdzpbS6vo0hKS7MCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JGIO4UJ5qxnF1hC6IdbRB7Cz7UAlenF2xGg1HDepQsa9sW3gzBG8KEjpg4eaajMqn
	 +1z2M14sXjjxZISNdj5pwAqMHTYh+ZMsh7mBT5HDyAo4CqTgBvlVgEdpN1dFHSYHjv
	 rUbGkkyOrsNatXd86xR+fx/PQ1t8YjkznLPlooouTIhlpQwPD4ct6gTnRbtt7ANt/y
	 z/SocZF0FQ4ral3W7XLaZeUMwSW4tF3g82+UCiwgH8TzGWqC5EaaSGPxt1pgyfaO7r
	 j1iXeKTnDY1apTx0ilVi+Jb/uOzHx1utq5agfbvlNdBmjxsPvPlSKQjQ7EZqcXI7ID
	 eKsxCxxA5cFbQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:35 +0300
Subject: [PATCH RFC 12/18] x86/pat/mm, mm/set_memory: abstract the CPA page
 table lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-12-2c1fc62306b3@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16-dev
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

x86 requires taking pgd_lock to serialize large page splits against
parallel page table operations, for instance such as
arch_sync_kernel_mappings() and pgd allocation and freeing.

Add arch_lock() and arch_unlock() static inlines that replace direct
locking/unlocking of the pgd_lock in CPA core.

Since only x86 needs such lock, keep things simple and use #ifdef
CONFIG_X86 rather than creating an overridable infrastructure.

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/set_memory.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/mm/set_memory.c b/mm/set_memory.c
index 712264de8e9b..d2846804e4e6 100644
--- a/mm/set_memory.c
+++ b/mm/set_memory.c
@@ -14,6 +14,20 @@
  */
 static DEFINE_SPINLOCK(cpa_lock);
 
+static inline void arch_lock(void)
+{
+#ifdef CONFIG_X86
+	spin_lock(&pgd_lock);
+#endif
+}
+
+static inline void arch_unlock(void)
+{
+#ifdef CONFIG_X86
+	spin_unlock(&pgd_lock);
+#endif
+}
+
 unsigned long cpa_addr(struct cpa_data *cpa, unsigned long idx)
 {
 	if (cpa->flags & CPA_PAGES_ARRAY) {
@@ -170,7 +184,7 @@ static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
 	if (!sd.ptdesc)
 		return -ENOMEM;
 
-	spin_lock(&pgd_lock);
+	arch_lock();
 
 	/*
 	 * Check for races, another CPU might have split this page
@@ -202,11 +216,11 @@ static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
 	if (ret)
 		goto out_free_ptdesc;
 
-	spin_unlock(&pgd_lock);
+	arch_unlock();
 	return do_split;
 
 out_free_ptdesc:
-	spin_unlock(&pgd_lock);
+	arch_unlock();
 	pagetable_free(sd.ptdesc);
 	return ret;
 }

-- 
2.53.0


