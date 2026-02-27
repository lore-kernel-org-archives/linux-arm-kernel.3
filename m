Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5146DFEFB70
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFbemy0PcyEmSBNxC/D9/wuhnN4nV+G16h8jmD3VSkI=; b=fmgd/6xlyaTU/gPDNIE72l+dKG
	TAPmkFKDcXuhYj8yMfFN4aaAwGXzFIg84yVRSONTPcVHUsT53ziEVTynKgjuR92s42LN48lmGxZ/V
	6adrEqVGKdHGqt1B4YT1zA4n+2ksiT7JQwhrU23NXhFcGQG0uwOsdpTZlfbX2cnaKoCUEzQTywNmq
	N6BY8hLs0Rkc0GLEl78+j+pJKQcbTvn9Is+Jiz5HWdenx+wKSv3qkcJ9AgvPd1l4zjkFFTvq6eVLx
	Z+z5SfFOr/n4Hkkr6q/HPRmuRDBioBskDoMeps/OijqkoGi1WkRWXEmDlOqIUim4rDmUeWQJOenG8
	rl9UwQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw26G-00000008sGK-2Hqm;
	Fri, 27 Feb 2026 17:58:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw26F-00000008sDJ-1aTi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 17:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eFbemy0PcyEmSBNxC/D9/wuhnN4nV+G16h8jmD3VSkI=; b=H2df3ZAUFrfZhAcelkggOmmz/Q
	hb3RKbXFSmRNybmuG+5XVaHvqOTZRnoDdZfr4fEeqHUL5F+zBENYRUxQgNhza+0+l7wT+JMuc40S3
	xB4/Xz+4EtweVZ9HQSvq2Y4f8g+xe87pS5anZNXmQiBB9C+ibmUfMNHeHRbZ73OJqY5pnhkCeKE+1
	nI9cBl9mexU2xv8LblvVacqY3BljITtv1gqZ1Hjd2S+TlWhwur8l80nWdJXURk8rUPL35k86YKKh/
	RSwEElbsf5UI/8OeDhA2byssIt6oi58fQ/hsz3InqIlMwpTXcLu/Q5YYvdeb0pSyg0ZM9hKmNpnAx
	UMPYImig==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw25z-0000000DdTd-0SWH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:57:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33E3014BF;
	Fri, 27 Feb 2026 09:57:39 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FF1E3F73B;
	Fri, 27 Feb 2026 09:57:41 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v6 26/30] arm64: kpkeys: Protect init_pg_dir
Date: Fri, 27 Feb 2026 17:55:14 +0000
Message-ID: <20260227175518.3728055-27-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227175518.3728055-1-kevin.brodsky@arm.com>
References: <20260227175518.3728055-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_175755_776507_EE45C998 
X-CRM114-Status: GOOD (  13.46  )
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

When kpkeys_hardened_pgtables is enabled, protect the page tables
that map the kernel image by setting the appropriate pkey for the
linear mapping of those pages.

Most other static page tables (e.g. swapper_pg_dir) should be
read-only both in the kernel image mapping and the linear mapping,
so there is no need to change their pkey.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---

This patch may not be comprehensive - there are multiple static pools
used for various page directories.

---
 arch/arm64/include/asm/kpkeys.h |  3 +++
 arch/arm64/mm/mmu.c             | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
index eeebbdfe239a..2d8bb1e25e3b 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -66,6 +66,9 @@ static inline bool arm64_supports_kpkeys_hardened_pgtables(void)
 		system_supports_poe() : cpu_has_poe();
 }
 
+#define arch_kpkeys_protect_static_pgtables arch_kpkeys_protect_static_pgtables
+void arch_kpkeys_protect_static_pgtables(void);
+
 #else /* CONFIG_KPKEYS_HARDENED_PGTABLES */
 
 static inline bool arm64_supports_kpkeys_hardened_pgtables(void)
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 7072d5ac0579..1e2cf0166c1d 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1048,6 +1048,19 @@ void __init mark_linear_text_alias_ro(void)
 			    PAGE_KERNEL_RO);
 }
 
+#ifdef CONFIG_KPKEYS_HARDENED_PGTABLES
+void __init arch_kpkeys_protect_static_pgtables(void)
+{
+	extern char __pi_init_pg_dir[], __pi_init_pg_end[];
+	unsigned long addr = (unsigned long)lm_alias(__pi_init_pg_dir);
+	unsigned long size = __pi_init_pg_end - __pi_init_pg_dir;
+	int ret;
+
+	ret = set_memory_pkey(addr, size / PAGE_SIZE, KPKEYS_PKEY_PGTABLES);
+	WARN_ON(ret);
+}
+#endif /* CONFIG_KPKEYS_HARDENED_PGTABLES */
+
 #ifdef CONFIG_KFENCE
 
 bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
-- 
2.51.2


