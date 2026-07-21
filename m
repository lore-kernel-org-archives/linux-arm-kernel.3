Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0D9C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dd8IzpXvfcf9omad/UCYPVVbU051g1TaDj1g9jolwTk=; b=DmjrNp9rihDjV+iWSFIsgmN2uf
	pGBx3C3K95IM5wScR+MBHu300yXSbOWdR46AYmNWYwaDCZK6+HNHA12wX4z+9lOXVUjVGSL5CIOwK
	6zLg3RgGUUbfp6kT/BFML5Jp8KzqWvfDOEOFxeHVsywym4QK2Kdlb/pYfqBxfDvh6TpogLFpNRCjM
	iQe0fiTWdoUvnqZmqsYvg5NJfs2HjMdgC9rn2d67Qn+AjTsp18ejiWHSuxHHldievt5w7BpzsgitQ
	1mhxC6LidL0DXVliW5AENyucsGa6bPNkERtSoDoQTe6CXo1WXsJzF9D4KqxGp6jEGJiwkeRx+bJL1
	EFRAnSFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGT-00000009tGb-2pBk;
	Tue, 21 Jul 2026 16:24:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGS-00000009tF0-1WB0;
	Tue, 21 Jul 2026 16:24:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21A0E43A0E;
	Tue, 21 Jul 2026 16:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98ED1F00A3A;
	Tue, 21 Jul 2026 16:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651056;
	bh=dd8IzpXvfcf9omad/UCYPVVbU051g1TaDj1g9jolwTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NBYXLOuBqmaFwezx93ecw7m/nA5exRaxX00iO4FbrUlWQTR/no4KZ7zvJ0UebT+pH
	 KPe5t85aTvpwk9STpAYme+9I79Pc3UW9ruWYP1EPVqRbSjrGHh+VNyyuHOobxLLdbF
	 UNPQzXpyaVX+tJ+vaqyC4EMtkXQaUrEPWevROWx6Aj2/j/RWHw2lapMfhHp4NAuRgR
	 jzq+3jCaUaD/D0ofF88IEP/ndOsQxdCoy/3A2burc0pTIFvFtc6qIQcMlDgtf6SbH9
	 8DLavmBbCBy4XbRI/chv2p1Ia1EMEDGC0Acowle0lUQAF4b9kJP2yJqL/P69RTgGd9
	 N7nVeGpkBnGVw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:28 +0300
Subject: [PATCH RFC 05/18] x86/mm/pat: use a generic helper for the large
 page size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-5-2c1fc62306b3@kernel.org>
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

__should_split_large_page() uses x86 specific page_level_size() to
calculate the size and mask of the large page.

In preparation to moving core parts of change_page_attr() to common
code, introduce generic pgtable_level_size() and pgtable_level_mask()
helpers and use them in __should_split_large_page().

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c |  4 ++--
 include/linux/pgtable.h      | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 8a1782f5de3e..ee40962d4ee9 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -956,8 +956,8 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
 		return -EINVAL;
 	}
 
-	psize = page_level_size(level);
-	pmask = page_level_mask(level);
+	psize = pgtable_level_size(level);
+	pmask = pgtable_level_mask(level);
 
 	/*
 	 * Calculate the number of pages, which fit into this large
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 4b42ac5c27d9..9eb00ad6d5d2 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2364,6 +2364,28 @@ static inline const char *pgtable_level_to_str(enum pgtable_level level)
 	}
 }
 
+/* Size of the memory mapped by a single leaf entry at @level */
+static inline unsigned long pgtable_level_size(enum pgtable_level level)
+{
+	switch (level) {
+	case PGTABLE_LEVEL_PTE:
+		return PAGE_SIZE;
+	case PGTABLE_LEVEL_PMD:
+		return PMD_SIZE;
+	case PGTABLE_LEVEL_PUD:
+		return PUD_SIZE;
+	case PGTABLE_LEVEL_P4D:
+		return P4D_SIZE;
+	default:
+		return PGDIR_SIZE;
+	}
+}
+
+static inline unsigned long pgtable_level_mask(enum pgtable_level level)
+{
+	return ~(pgtable_level_size(level) - 1);
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)

-- 
2.53.0


