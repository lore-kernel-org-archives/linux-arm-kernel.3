Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA481C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 22:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBMqWWSmA8jTU5EpZWWLoWgjipzuL5yIrBN/CPUgt3Q=; b=Oq7VD3kcuFfQAn09fadaytq60R
	5vOEVYGjeKYzF6F0posUszBgzHCdrFCFAXpHKoMtIXuUd3VCrgIz7h5i5YfwblzYV7snjdEevrWSQ
	ovkAZ/uspzYOh75b9Ntv/g7aHctdJYx7jWTklIzLvW3vn+EPq0WiJ2r9uUdhEJaEFEBZlViGGI/NV
	eRWZtsstQEA1Y5OFO7cCexhMxNltlkAZcBGNf7si3LyS8xRigvU+zK9nZwxsdO5l1HDPGJeJjqQUv
	afL8eid37XnfC+ljPQuHVUEMyoy2Ob/Zs1DTtz7SlJgU4W3nZ9LQsbOLCDivtt29GhnfN3/ao2eEZ
	DXHcMCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufIG-00000007Edv-3r6u;
	Tue, 18 Mar 2025 22:20:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufDJ-00000007Dxe-1Ryf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 22:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742336108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBMqWWSmA8jTU5EpZWWLoWgjipzuL5yIrBN/CPUgt3Q=;
	b=W1OujIP97SM3oaeOGY+whOHw9NXQgEWCALdf1AhdymxJQfcvWE+z61oRnPJoeOIRuqXFoF
	CZdV/xcqAX7pxdUkgtHeFf+hOvnCVN25njAxB2/FYpvKzC5D3JsAZXHSDSDa+Pg8GxVnlD
	SvsUz+YLIzMZNAnNyV1GrKH7bSKFP5Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-7mkaFXfoOi2Egv60QKMMAQ-1; Tue, 18 Mar 2025 18:15:05 -0400
X-MC-Unique: 7mkaFXfoOi2Egv60QKMMAQ-1
X-Mimecast-MFC-AGG-ID: 7mkaFXfoOi2Egv60QKMMAQ_1742336104
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso23591415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 15:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742336104; x=1742940904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBMqWWSmA8jTU5EpZWWLoWgjipzuL5yIrBN/CPUgt3Q=;
        b=sSlOX8PHzfdf3FfPqRlJDizGU2cNrAGq8LkCdjNedVKK9Qd030MFBwhptALw55gO+g
         vk5pktbJ1oHPn/bIWpuHeQNYddXfemikRADHVjGKUsXKHrvUX7nR0705BECw5pX+Xez4
         Wh9fVxRHl0y/s/LmO3lrr4l+apTCWhX5AAeohwYtujrJggeUMHQWIr46U29m0ZE0zgUT
         KLivtzJEchJc2i5XucLJclbAOIYxIKUXOS0R5SmtlfSlqZ7iCPCZHKY6icvtNhnSGehl
         0imgO0Cxaf/xB2OmX+WCVhDJoEoOCvltcKGOpzxK15r69tgsyVsHAZ7eUuAUN++kJisR
         UIXA==
X-Forwarded-Encrypted: i=1; AJvYcCUebfFk9xQDhDEyhKlIgRn1Nn7BJeJRvEyD74ZlZh4dsnXa72bEeCiE5QpvCsbHzChYC+eMnnXOF5DEPKw99JNL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtwb90VhZzoheisBspGk3FWMA7Ukt5I1M+GwJho85SIJDqNHJJ
	kJONiHma3nncagdU1c9tHZiyyvUgEfPQOfKCuFkCuZC7aUECHwsU5d7+jVlKBooZwmCG4q9aqK8
	x1QKmBfj7ZzKFAm24RwsLqj+zwhlqdXBKifaoytKfMaEjIK212eYaa0o7j76LjC7puX9lAh7E3Q
	GZ4zWWSzM=
X-Gm-Gg: ASbGncvY/ATGBJ+GQfptuiSkKGs09bjCFfYvkQvXEqOGtlQrA3Z8xeaRk5+DxVPXr6q
	3C84wvWqTFc1QMpr0CzgmrxrBBFtm8LlnDFW9gAgyCv6e95vApKc5NmpL9Jnu1PqpvGOZHdE6C4
	PPiWqfVkvX1SZUXjEk+/7Ob9bcUqFqZHtuQ+bY5brha3x26LWr2DvOW20AtjGQ97B31+rJbJOk0
	XGyqoj8/k+SvFzt7NlWxnBQE8fcr0quvQy50fdPUXjECdDd4KdH48tiG30i1iTHNHV6gP1YGmth
	ZN7T6I7qDG+mC1mUiTfyrRyTLTIU5DsXXLj4YrQheob5OcTIYAcyXedUHz6ePtaJtUieUhnEegU
	u
X-Received: by 2002:a5d:47ca:0:b0:391:47d8:de3d with SMTP id ffacd0b85a97d-399739bc959mr401429f8f.16.1742336103813;
        Tue, 18 Mar 2025 15:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVLQM9GTMoKWmV/uO8RTwFHvBEBsZ0wjM+Jkn+TplyWph+3HhlRdj3hBn4fJ8DOgl1P3A6xg==
X-Received: by 2002:a5d:47ca:0:b0:391:47d8:de3d with SMTP id ffacd0b85a97d-399739bc959mr401407f8f.16.1742336103412;
        Tue, 18 Mar 2025 15:15:03 -0700 (PDT)
Received: from localhost (p200300cbc72d250094b54b7dad4afd0b.dip0.t-ipconnect.de. [2003:cb:c72d:2500:94b5:4b7d:ad4a:fd0b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cbbc88f2sm19281199f8f.101.2025.03.18.15.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:15:02 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Tong Tiangen <tongtiangen@huawei.com>
Subject: [PATCH v2 2/3] kernel/events/uprobes: pass VMA to set_swbp(), set_orig_insn() and uprobe_write_opcode()
Date: Tue, 18 Mar 2025 23:14:56 +0100
Message-ID: <20250318221457.3055598-3-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318221457.3055598-1-david@redhat.com>
References: <20250318221457.3055598-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -cyVdgqI-dMOJrxJhmhkyeGTetzDGtirfdny-40cQB8_1742336104
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_151509_453515_B4831C53 
X-CRM114-Status: GOOD (  20.32  )
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

We already have the VMA, no need to look it up using
get_user_page_vma_remote(). We can now switch to
get_user_pages_remote().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm/probes/uprobes/core.c |  4 ++--
 include/linux/uprobes.h        |  6 +++---
 kernel/events/uprobes.c        | 33 +++++++++++++++++----------------
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/arch/arm/probes/uprobes/core.c b/arch/arm/probes/uprobes/core.c
index f5f790c6e5f89..885e0c5e8c20d 100644
--- a/arch/arm/probes/uprobes/core.c
+++ b/arch/arm/probes/uprobes/core.c
@@ -26,10 +26,10 @@ bool is_swbp_insn(uprobe_opcode_t *insn)
 		(UPROBE_SWBP_ARM_INSN & 0x0fffffff);
 }
 
-int set_swbp(struct arch_uprobe *auprobe, struct mm_struct *mm,
+int set_swbp(struct arch_uprobe *auprobe, struct vm_area_struct *vma,
 	     unsigned long vaddr)
 {
-	return uprobe_write_opcode(auprobe, mm, vaddr,
+	return uprobe_write_opcode(auprobe, vma, vaddr,
 		   __opcode_to_mem_arm(auprobe->bpinsn));
 }
 
diff --git a/include/linux/uprobes.h b/include/linux/uprobes.h
index b1df7d792fa16..288a42cc40baa 100644
--- a/include/linux/uprobes.h
+++ b/include/linux/uprobes.h
@@ -185,13 +185,13 @@ struct uprobes_state {
 };
 
 extern void __init uprobes_init(void);
-extern int set_swbp(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long vaddr);
-extern int set_orig_insn(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long vaddr);
+extern int set_swbp(struct arch_uprobe *aup, struct vm_area_struct *vma, unsigned long vaddr);
+extern int set_orig_insn(struct arch_uprobe *aup, struct vm_area_struct *vma, unsigned long vaddr);
 extern bool is_swbp_insn(uprobe_opcode_t *insn);
 extern bool is_trap_insn(uprobe_opcode_t *insn);
 extern unsigned long uprobe_get_swbp_addr(struct pt_regs *regs);
 extern unsigned long uprobe_get_trap_addr(struct pt_regs *regs);
-extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr, uprobe_opcode_t);
+extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct vm_area_struct *vma, unsigned long vaddr, uprobe_opcode_t);
 extern struct uprobe *uprobe_register(struct inode *inode, loff_t offset, loff_t ref_ctr_offset, struct uprobe_consumer *uc);
 extern int uprobe_apply(struct uprobe *uprobe, struct uprobe_consumer *uc, bool);
 extern void uprobe_unregister_nosync(struct uprobe *uprobe, struct uprobe_consumer *uc);
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 259038d099819..ac17c16f65d63 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -474,19 +474,19 @@ static int update_ref_ctr(struct uprobe *uprobe, struct mm_struct *mm,
  *
  * uprobe_write_opcode - write the opcode at a given virtual address.
  * @auprobe: arch specific probepoint information.
- * @mm: the probed process address space.
+ * @vma: the probed virtual memory area.
  * @vaddr: the virtual address to store the opcode.
  * @opcode: opcode to be written at @vaddr.
  *
  * Called with mm->mmap_lock held for read or write.
  * Return 0 (success) or a negative errno.
  */
-int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm,
-			unsigned long vaddr, uprobe_opcode_t opcode)
+int uprobe_write_opcode(struct arch_uprobe *auprobe, struct vm_area_struct *vma,
+		unsigned long vaddr, uprobe_opcode_t opcode)
 {
+	struct mm_struct *mm = vma->vm_mm;
 	struct uprobe *uprobe;
 	struct page *old_page, *new_page;
-	struct vm_area_struct *vma;
 	int ret, is_register, ref_ctr_updated = 0;
 	bool orig_page_huge = false;
 	unsigned int gup_flags = FOLL_FORCE;
@@ -498,9 +498,9 @@ int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm,
 	if (is_register)
 		gup_flags |= FOLL_SPLIT_PMD;
 	/* Read the page with vaddr into memory */
-	old_page = get_user_page_vma_remote(mm, vaddr, gup_flags, &vma);
-	if (IS_ERR(old_page))
-		return PTR_ERR(old_page);
+	ret = get_user_pages_remote(mm, vaddr, 1, gup_flags, &old_page, NULL);
+	if (ret != 1)
+		return ret;
 
 	ret = verify_opcode(old_page, vaddr, &opcode);
 	if (ret <= 0)
@@ -590,30 +590,31 @@ int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm,
 /**
  * set_swbp - store breakpoint at a given address.
  * @auprobe: arch specific probepoint information.
- * @mm: the probed process address space.
+ * @vma: the probed virtual memory area.
  * @vaddr: the virtual address to insert the opcode.
  *
  * For mm @mm, store the breakpoint instruction at @vaddr.
  * Return 0 (success) or a negative errno.
  */
-int __weak set_swbp(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr)
+int __weak set_swbp(struct arch_uprobe *auprobe, struct vm_area_struct *vma,
+		unsigned long vaddr)
 {
-	return uprobe_write_opcode(auprobe, mm, vaddr, UPROBE_SWBP_INSN);
+	return uprobe_write_opcode(auprobe, vma, vaddr, UPROBE_SWBP_INSN);
 }
 
 /**
  * set_orig_insn - Restore the original instruction.
- * @mm: the probed process address space.
+ * @vma: the probed virtual memory area.
  * @auprobe: arch specific probepoint information.
  * @vaddr: the virtual address to insert the opcode.
  *
  * For mm @mm, restore the original opcode (opcode) at @vaddr.
  * Return 0 (success) or a negative errno.
  */
-int __weak
-set_orig_insn(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr)
+int __weak set_orig_insn(struct arch_uprobe *auprobe,
+		struct vm_area_struct *vma, unsigned long vaddr)
 {
-	return uprobe_write_opcode(auprobe, mm, vaddr,
+	return uprobe_write_opcode(auprobe, vma, vaddr,
 			*(uprobe_opcode_t *)&auprobe->insn);
 }
 
@@ -1153,7 +1154,7 @@ static int install_breakpoint(struct uprobe *uprobe, struct vm_area_struct *vma,
 	if (first_uprobe)
 		set_bit(MMF_HAS_UPROBES, &mm->flags);
 
-	ret = set_swbp(&uprobe->arch, mm, vaddr);
+	ret = set_swbp(&uprobe->arch, vma, vaddr);
 	if (!ret)
 		clear_bit(MMF_RECALC_UPROBES, &mm->flags);
 	else if (first_uprobe)
@@ -1168,7 +1169,7 @@ static int remove_breakpoint(struct uprobe *uprobe, struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 
 	set_bit(MMF_RECALC_UPROBES, &mm->flags);
-	return set_orig_insn(&uprobe->arch, mm, vaddr);
+	return set_orig_insn(&uprobe->arch, vma, vaddr);
 }
 
 struct map_info {
-- 
2.48.1


