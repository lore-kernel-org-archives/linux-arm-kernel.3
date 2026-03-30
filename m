Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C74E1061B04
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKJp2zmpSOHrWvXWXvVfm1wRsYfpExx2ugXRE4WLUFU=; b=EE21ZHhVHbOmjM+IeCoYAOSAbe
	1TfrTZkFPxr8VNL2kwuN3GmIVDuXaYSqTqsxAIDFxA4iOUX9RKVacaOfi+2pDzJizZO00DI9q7NW3
	eFxI8rhXvCruLhiLIP4hXwFuuX1u3O5sJaZDE10m8vh1jt8fHAEn7yuqAsWftewkF1CB7QcdTa5u9
	2DgKZrXSfStdPTC37PNa6dXXSr+3NuNXVtKyypgiHQIy4Kx73U30G3oQbtzj0TC2NvuLxU/rR1Idv
	zVfnn+J5RAxDJbPWzoxQxf/u7NxGVKVIqMFt02l9fWJpkurho03yHF6cMXtSrdCOG+6czlScy9Ttv
	y3hhrL6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dgg-0000000BQuF-1xZO;
	Mon, 30 Mar 2026 14:33:54 +0000
Received: from mail-106118.protonmail.ch ([79.135.106.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dge-0000000BQtE-0h33
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774881229; x=1775140429;
	bh=qKJp2zmpSOHrWvXWXvVfm1wRsYfpExx2ugXRE4WLUFU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YCCLybHYi2wR2wkPVJqxMiQnlVDCKaRSAc2GM2k4yVvHs2+q/xLGEQmy1ci96SVPe
	 ksL1M18aqk3T+U81SeRfTAWcLdzwSjTjKzqLtI5QiW11A2y/FbKAgTDTFezGKbYoAs
	 lAy3jSe2vY/cAgrClSZfcuKZoRSF7SKoG67G4XwdHpD0urxhJXKPrz3bPaiOnXM/Ui
	 px6s72vg+QThjq6CrchL4qKa25I74kOJnsRR3TnWFM0ryokXew0zZb8q7bsoodgWSt
	 di67Knp/aRc8Pf3yWTXpGD6Nd1f62Xm3hy/yNYNx8I4T65ECLLumqOMlhrURNFi03W
	 R0Nvo9JsEbLdA==
Date: Mon, 30 Mar 2026 14:33:43 +0000
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Subject: [PATCH v12 06/15] kasan: arm64: x86: Make page_to_virt() KASAN aware
Message-ID: <b9f7bd991dd2ba0b4c187f5c63962626f00c6a62.1774872838.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1774872838.git.m.wieczorretman@pm.me>
References: <cover.1774872838.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: b6d1646a2fe7b6e96ef4cb8b05ca936c4900195d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_073352_359861_3B3800B2 
X-CRM114-Status: GOOD (  13.29  )
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
index e18908f3ad6e..271c59e9f422 100644
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
index 09044934dda8..f234650a4edf 100644
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



