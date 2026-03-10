Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD3AFD4F08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYzT9pUJ33fciEEYHLErzOjZWjIu4mssUSjNvzdqw84=; b=zW1KDN/Bb0A/KjSLAiPkcfbufB
	zHYoiwuTBhgnk1VolksXDdlni4TG3XANmNI/h1LIsuzN4Exot6g21b3GodGhlbC+MYNu6iy9Tx2I+
	d0cxCDk6KnxYuSSlvAnC0wJTn6M1izGLfT44OLPhUckYxDnrVuLt7ZtLMejUpRftmmhk2N3ZLzOzF
	etMO9gGVZjlUUdB6AIdQueepdMvz1ZKhD1giPq4BmeD0dr1PjM3ZG671Ok/YewWAe708ZMRzC8af9
	QkpI0B1XRd1A62PXzsh3u86Etp6HUR5PBqMYnt7/AwJDZKwM5YM+H1nUUGYHz9nJWfexLL/1ka7rK
	+72eMGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01Hg-0000000A1WQ-2qI4;
	Tue, 10 Mar 2026 17:54:20 +0000
Received: from mail-10628.protonmail.ch ([79.135.106.28])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01Hc-0000000A1Up-2kjM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 17:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773165253; x=1773424453;
	bh=xYzT9pUJ33fciEEYHLErzOjZWjIu4mssUSjNvzdqw84=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I3sUpFOIrb0QB5EzsPsVdPlNOpVbfpHLEIFJQeylmc0o9iLyg5d30OqYqf74C9PEt
	 RxuA3WzuNAsFr9ULBmNwM/R6q310ubpG5zMPLnSj8NrahepZxdw9FFYzh8zrDewQik
	 Q+C99HzEX98wp3AL5hhD5rDIhZk9HpP0T3YASmLQ4jR4m7lhEPy5rvBV99WZHTb6Ap
	 LQb0JdgMolcKL7naA7a8LT3bnoSH6+T/ea4fC83VoDovOCHQmt3is2Q4jssmokQ/XV
	 VYE1OSvIOG1j2JVFfqGlypQEZkNX39kCtNRTrCb6+LvwUXH13MrQ8zkE8ZfYM6zqvM
	 r7E5fhO3jM/lA==
Date: Tue, 10 Mar 2026 17:54:09 +0000
To: akpm@linux-foundation.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Subject: [PATCH v11 06/15] kasan: arm64: x86: Make page_to_virt() KASAN aware
Message-ID: <b51b60f82bbd99cdcd7f6d0d2bac1d5f3bed0fe0.1773164688.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1773164688.git.m.wieczorretman@pm.me>
References: <cover.1773164688.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: a95af21cc490f13be9b2b1108f966a54feb03d3d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_105416_850721_16CFA5EE 
X-CRM114-Status: GOOD (  12.75  )
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

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Special page_to_virt() implementation is needed if an architecture wants
to enable KASAN software tag-based mode.

Make page_to_virt() KASAN aware in arch-independent code so
architectures implementing the software tag-based mode don't have to
define their own implementations anymore. When KASAN is disabled or for
architectures that don't implement the software tag-based mode
page_to_virt() will be optimized to it's previous form.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v11:
- Redo the patch to work on the page_to_virt macro. Split off changes
  about virt to phys conversion to an earlier patch.
- Remove Alexander's acked-by due to bigger changes.

Changelog v7:
- Add Alexander's Acked-by tag.

Changelog v5:
- Move __tag_reset() calls into __phys_addr_nodebug() and
  __virt_addr_valid() instead of calling it on the arguments of higher
  level functions.

Changelog v4:
- Simplify page_to_virt() by removing pointless casts.
- Remove change in __is_canonical_address() because it's taken care of
  in a later patch due to a LAM compatible definition of canonical.

 arch/arm64/include/asm/memory.h |  5 -----
 include/linux/kasan.h           | 10 ++++++++++
 include/linux/mm.h              |  5 ++++-
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memor=
y.h
index 875c0bd0d85a..39dd0071d3ec 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -411,11 +411,6 @@ static inline unsigned long virt_to_pfn(const void *ka=
ddr)
  */
=20
 #if defined(CONFIG_DEBUG_VIRTUAL)
-#define page_to_virt(x)=09({=09=09=09=09=09=09\
-=09__typeof__(x) __page =3D x;=09=09=09=09=09\
-=09void *__addr =3D __va(page_to_phys(__page));=09=09=09\
-=09(void *)__tag_set((const void *)__addr, page_kasan_tag(__page));\
-})
 #define virt_to_page(x)=09=09pfn_to_page(virt_to_pfn(x))
 #else
 #define page_to_virt(x)=09({=09=09=09=09=09=09\
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index c6febd1362e8..58cf02af4fa5 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -527,6 +527,11 @@ static inline void *kasan_reset_tag(const void *addr)
 =09return (void *)arch_kasan_reset_tag(addr);
 }
=20
+static inline void *kasan_set_tag(const void *addr, u8 tag)
+{
+=09return (void *)arch_kasan_set_tag(addr, tag);
+}
+
 /**
  * kasan_report - print a report about a bad memory access detected by KAS=
AN
  * @addr: address of the bad access
@@ -544,6 +549,11 @@ static inline void *kasan_reset_tag(const void *addr)
 =09return (void *)addr;
 }
=20
+static inline void *kasan_set_tag(const void *addr, u8 tag)
+{
+=09return (void *)addr;
+}
+
 #endif /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS*/
=20
 #ifdef CONFIG_KASAN_HW_TAGS
diff --git a/include/linux/mm.h b/include/linux/mm.h
index b2245b1a25d8..044425db766e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -117,7 +117,10 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #endif
=20
 #ifndef page_to_virt
-#define page_to_virt(x)=09__va(PFN_PHYS(page_to_pfn(x)))
+#define page_to_virt(x) ({=09=09=09=09=09=09=09\
+=09void *__addr =3D __va(PFN_PHYS(page_to_pfn((struct page *)x)));=09=09\
+=09kasan_set_tag(__addr, page_kasan_tag(x));=09=09=09=09\
+})
 #endif
=20
 #ifndef lm_alias
--=20
2.53.0



