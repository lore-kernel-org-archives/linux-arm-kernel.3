Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76252C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3d8h0fhxSI8KBCb1MJSQD5BFSFLbtAEyQ369Pj935A=; b=lltgc3GuuBVWuQIX+osy2JcalM
	YWdCZKh9+zN/6CSs8BaVVz/R0bdxQUH+0hBieybR3UAP5U+5iPRaopN270VYa8ZTNhybG3SqOYoRh
	JNfT/v/Oy/8y6MEUx5RKKXc5HZapp4retbAwMcmK21LN+LeLOm/Nnr0DaCC3fUHLpu2IGdOPg/hCD
	QjJ8ZjCFS1fQaDot515ov8CpmOUeTl12SwcNzEeEn2tmI80cNiT9J74d38ZqRDuwikMsutKhy6p9a
	viNQMnZmlACvUxYcXzkXkDW432Ql4FIZdEvK+h4dJ+GwDYV0G5gDBwU4V+vWQu9qG50QF8dcClGl0
	R0px4fKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teutg-0000000FGoN-0LgT;
	Mon, 03 Feb 2025 11:45:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetZ6-0000000F697-30sj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w3d8h0fhxSI8KBCb1MJSQD5BFSFLbtAEyQ369Pj935A=; b=FM4BXHir6WCW2avJ0beXJcrhdm
	G+QW9khCJV9A9rin03zwJzM1kr9bNw8L+Q4WxlD/KBbvG50e4MnXDtkO0WQj3/Y5rREJVB8v7Tbbo
	ztWJAsprljBDJa5gbFUbVQKGRRirPWFjdrBaWmWM1IQGfmhROXkDwzqIuf/NiSWc51j5yQMNE2Za7
	WHz0wt5TYxtHupCnAwW/dp+mqzmssd7rdfh1gD2Otelp8CVdSRuLbrMVwX2Uy57Pq2lUKvizHDBPw
	RDNTVG47HNmnewk14IoUI5iyxQ4O1odd5w9zGr61f3oTJMAiWnS0Sd8VyDNSijXit7MZjUeMMubtl
	kwBuHQhg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetZ2-0000000G3Xb-3FID
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:20:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8059E1476;
	Mon,  3 Feb 2025 02:20:48 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DE443F63F;
	Mon,  3 Feb 2025 02:20:20 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v3 11/15] mm: Map page tables with privileged pkey
Date: Mon,  3 Feb 2025 10:18:35 +0000
Message-ID: <20250203101839.1223008-12-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203101839.1223008-1-kevin.brodsky@arm.com>
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102024_997651_3EB1C90E 
X-CRM114-Status: GOOD (  10.35  )
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

If CONFIG_KPKEYS_HARDENED_PGTABLES is enabled, map allocated page
table pages using a privileged pkey (KPKEYS_PKEY_PGTABLES), so that
page tables can only be written under guard(kpkeys_hardened_pgtables).

This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
(default).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/mm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 721e779647f3..aa01f51fdc6f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -32,6 +32,7 @@
 #include <linux/memremap.h>
 #include <linux/slab.h>
 #include <linux/cacheinfo.h>
+#include <linux/kpkeys.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -2998,6 +2999,8 @@ static inline bool __pagetable_ctor(struct ptdesc *ptdesc)
 
 	__folio_set_pgtable(folio);
 	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	if (kpkeys_protect_pgtable_memory(folio))
+		return false;
 	return true;
 }
 
@@ -3008,6 +3011,7 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	ptlock_free(ptdesc);
 	__folio_clear_pgtable(folio);
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+	kpkeys_unprotect_pgtable_memory(folio);
 }
 
 static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
-- 
2.47.0


