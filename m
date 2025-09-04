Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C317CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nirw51lPbify+8xW0U8926rJSOPYlf5WSj5+UPxSk1M=; b=GdP6mUcHZkyJRCfFkJMnJKw+rk
	ehQC8geModbOLjpaVlozC30NKoiwVIFclpYf/OBCmuqW2dx+L3OOad84Xnelde30UeSj2PjdmMm9J
	ms3JSbbra4cY0ybN1JuGcydMkRnROvgOAXUutYq4+18FMKtKBMElhBr72Ipfrl61CZgwX1Y9uIW5d
	OtCIl6ufMUBAFv6iJ5R8GczXgTbbJIz6IwhUjq1CYZsUlJWcLM2cJaincGTa+BAYA0RkLq6+uB6IG
	FbMSpZFgL4KwRdXcwWEeNg4vtGDwYEA3IljFEYyBSDaP6lvKZ9iQEPRU2CpkKxh7KasjHjAVkqO90
	ycVC3tnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCll-0000000CrO1-3XrN;
	Thu, 04 Sep 2025 16:25:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9Y0-0000000Bina-3dTC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:58:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2267F2ECB;
	Thu,  4 Sep 2025 05:58:32 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E64E73F6A8;
	Thu,  4 Sep 2025 05:58:35 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 4/7] x86/xen: support nested lazy_mmu sections (again)
Date: Thu,  4 Sep 2025 13:57:33 +0100
Message-ID: <20250904125736.3918646-5-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250904125736.3918646-1-kevin.brodsky@arm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_055840_985386_FBA41A9B 
X-CRM114-Status: GOOD (  15.86  )
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

Commit 49147beb0ccb ("x86/xen: allow nesting of same lazy mode")
originally introduced support for nested lazy sections (LAZY_MMU and
LAZY_CPU). It later got reverted by commit c36549ff8d84 as its
implementation turned out to be intolerant to preemption.

Now that the lazy_mmu API allows enter() to pass through a state to
the matching leave() call, we can support nesting again for the
LAZY_MMU mode in a preemption-safe manner. If xen_enter_lazy_mmu() is
called inside an active lazy_mmu section, xen_lazy_mode will already
be set to XEN_LAZY_MMU and we can then return LAZY_MMU_NESTED to
instruct the matching xen_leave_lazy_mmu() call to leave
xen_lazy_mode unchanged.

The only effect of this patch is to ensure that xen_lazy_mode
remains set to XEN_LAZY_MMU until the outermost lazy_mmu section
ends. xen_leave_lazy_mmu() still calls xen_mc_flush()
unconditionally.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/x86/include/asm/paravirt.h       |  6 ++----
 arch/x86/include/asm/paravirt_types.h |  4 ++--
 arch/x86/xen/mmu_pv.c                 | 11 ++++++++---
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 65a0d394fba1..4ecd3a6b1dea 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -529,14 +529,12 @@ static inline void arch_end_context_switch(struct task_struct *next)
 #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 {
-	PVOP_VCALL0(mmu.lazy_mode.enter);
-
-	return LAZY_MMU_DEFAULT;
+	return PVOP_CALL0(lazy_mmu_state_t, mmu.lazy_mode.enter);
 }
 
 static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
 {
-	PVOP_VCALL0(mmu.lazy_mode.leave);
+	PVOP_VCALL1(mmu.lazy_mode.leave, state);
 }
 
 static inline void arch_flush_lazy_mmu_mode(void)
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index bc1af86868a3..b7c567ccbf32 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -45,8 +45,8 @@ typedef int lazy_mmu_state_t;
 
 struct pv_lazy_ops {
 	/* Set deferred update mode, used for batching operations. */
-	void (*enter)(void);
-	void (*leave)(void);
+	lazy_mmu_state_t (*enter)(void);
+	void (*leave)(lazy_mmu_state_t);
 	void (*flush)(void);
 } __no_randomize_layout;
 #endif
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 2039d5132ca3..6e5390ff06a5 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2130,9 +2130,13 @@ static void xen_set_fixmap(unsigned idx, phys_addr_t phys, pgprot_t prot)
 #endif
 }
 
-static void xen_enter_lazy_mmu(void)
+static lazy_mmu_state_t xen_enter_lazy_mmu(void)
 {
+	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU)
+		return LAZY_MMU_NESTED;
+
 	enter_lazy(XEN_LAZY_MMU);
+	return LAZY_MMU_DEFAULT;
 }
 
 static void xen_flush_lazy_mmu(void)
@@ -2167,11 +2171,12 @@ static void __init xen_post_allocator_init(void)
 	pv_ops.mmu.write_cr3 = &xen_write_cr3;
 }
 
-static void xen_leave_lazy_mmu(void)
+static void xen_leave_lazy_mmu(lazy_mmu_state_t state)
 {
 	preempt_disable();
 	xen_mc_flush();
-	leave_lazy(XEN_LAZY_MMU);
+	if (state != LAZY_MMU_NESTED)
+		leave_lazy(XEN_LAZY_MMU);
 	preempt_enable();
 }
 
-- 
2.47.0


