Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF417C5DF84
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jjw8ei6D5DHAoHfksoq5pXJRo86SyrfgeTRQoDQ1lPM=; b=RmO8bC8ZKXgmPYvHkrpuN8plh+
	c3DvQiciIb6i8rcV1hng438QoswrLcBhWZhG8DOCXxxVrPt4wJ9r/uiIzIvSJxb3Wyev55SKiNhP3
	OumROjuWq2s2WAMMiVnGZ2wFshZzQ/82v31JDjnHvO3u3gORsHiPDf5JI9rFkJ60RWUWX96pWm0qw
	uEHCO3yZjoEASLa1P7IlPRfGNL3HixOJwUuF5eISvg+N40kfFtmuwrAUZJW5DRUMDIMra4bmIkeKR
	gOnqFN4WLSylMzz0MJARK3b1GSexhmWM5HcUsj/jodDxKSef8zDj38ZtQFs9nGmCjEIOSWmoT8nc3
	bU+VXiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKYz-000000088A4-3lQ5;
	Tue, 18 Aug 2026 14:13:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKYp-000000087yq-1xOb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:13:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1BA21A00;
	Tue, 18 Aug 2026 07:12:57 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A4713F85F;
	Tue, 18 Aug 2026 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062381; bh=AZS/qmiDqyYyalyFT0fayk+2twxYIjtBapS2JESmNTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QSP94uagRM5mQtJgReaoriW9rQvliNR8r1ZJ3oUzK9bkEZG4Z2oBnlR/jesx7nv5T
	 MUMNK3OmCMxrCDwSkWTs2eDllBWxK3og8BUlB2tk/ztR1f0mAPE226vlBjT7P7HhkV
	 WwaLpJHbyP1blczS0t4p8k3xA1/9LIOlOosZNJD4=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 18 Aug 2026 15:09:02 +0100
Subject: [PATCH RFC v9 20/25] arm64: mm: Map kernel image alias of
 init_pg_dir read-only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-kpkeys-v9-20-743ad31b2c8f@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787062277; l=2968;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=AZS/qmiDqyYyalyFT0fayk+2twxYIjtBapS2JESmNTM=;
 b=zQo9evzSCEFr+xMZNuLdCY5hB7IzXLtzsT8DJWfg/QX4opN7VmkgL4CBcD8e6MJGjTCMykKIX
 PFdhqBrClYHDLLlqyMzlAXnMlgbwf7Qmjvvju+E6ewXcqE+Hcd1yys7
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071303_926785_FCFAE69A 
X-CRM114-Status: GOOD (  15.63  )
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

Updates to page tables in init_pg_dir are expected to be done via
the linear map only. We are about to protect the linear mapping of
init_pg_dir using kpkeys; map its kernel image alias read-only to
ensure that the kpkeys protection cannot be bypassed.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/sections.h | 1 +
 arch/arm64/kernel/pi/map_kernel.c | 9 +++++++--
 arch/arm64/mm/mmu.c               | 8 ++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
index 51b0d594239e..dc961cf67168 100644
--- a/arch/arm64/include/asm/sections.h
+++ b/arch/arm64/include/asm/sections.h
@@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
 extern char __mmuoff_data_start[], __mmuoff_data_end[];
 extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
 extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
+extern char __pi_init_pg_dir[], __pi_init_pg_end[];
 
 static inline size_t entry_tramp_text_size(void)
 {
diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index fb44cbdd2f29..81ca3e98f0f7 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -92,8 +92,13 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_offset, int root_level)
 		    __inittext_end, prot, false, root_level);
 	map_segment(init_pg_dir, &pgdp, va_offset, __initdata_begin,
 		    __initdata_end, data_prot, false, root_level);
-	map_segment(init_pg_dir, &pgdp, va_offset, _data, _end, data_prot,
-		    true, root_level);
+	map_segment(init_pg_dir, &pgdp, va_offset, _data, init_pg_dir,
+		    data_prot, true, root_level);
+	/* Map init_pg_dir separately as we will remap it read-only later on */
+	map_segment(init_pg_dir, &pgdp, va_offset, init_pg_dir, init_pg_end,
+		    data_prot, true, root_level);
+	map_segment(init_pg_dir, &pgdp, va_offset, init_pg_end, _end,
+		    data_prot, true, root_level);
 	dsb(ishst);
 
 	idmap_cpu_replace_ttbr1((phys_addr_t)init_pg_dir);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a10e9f9876d0..ee972c78e45c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1217,6 +1217,14 @@ void mark_rodata_ro(void)
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)_text,
 			    (unsigned long)_stext - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
+	/*
+	 * Map the kernel image mapping of init_pg_dir read-only; it should
+	 * only be written via the linear map.
+	 */
+	section_size = (unsigned long)__pi_init_pg_end - (unsigned long)__pi_init_pg_dir;
+	update_mapping_prot(__pa_symbol(__pi_init_pg_dir),
+			    (unsigned long)__pi_init_pg_dir,
+			    section_size, PAGE_KERNEL_RO);
 
 	/* Map the kernel data/bss read-only in the linear map */
 	update_mapping_prot(__pa_symbol(__init_end),

-- 
2.51.2


