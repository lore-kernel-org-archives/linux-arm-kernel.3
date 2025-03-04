Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970CEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffON9SnaOWg9oFQtm+MueKUsNfzxra0dWfxUL8seX24=; b=jqlALQfNHzfNyy2d+JzBxuoYS0
	t50yP/ByHgEjll/qcFAmI3SK1gFMEZlfaxYrZkBIh/rA/UQenAYjwjFpo0kc95jDXaFGn2lRQDJhF
	PUGi8Be1bpLnDvOxx72A1mHuOWfIH7X+PwiIF86EwJdliQMhmtjKYMMfBqokKkENnVaqrogP3saAw
	DwXCdWc+oY7sKZl/TGU12xSswCj+ssEcyOXuAA0F6m3CzkQQRkco+hv/o/yIl5lPD5ilz6uQRtQ4c
	Yhxl2K2EmX8Fv2r2WRvI6XbfXQ+j0AUrsnJVOIRG+EryoBkjxN1wN/ObGQRKW7r/6kwRxh7cGRaRp
	U5JwGe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXav-00000005xOW-0hlT;
	Tue, 04 Mar 2025 19:06:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUVs-00000005HkT-2IXs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741103335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffON9SnaOWg9oFQtm+MueKUsNfzxra0dWfxUL8seX24=;
	b=O8IU2Jd9LoQ+Ut6kNYA/dSdPaQdx8Rmfcb/jqASy0lIo6005c13kuUIV75Hl//usNCfsVi
	fOG5OqYxgR3mpS+2/0+8YaccwVD+W5JMRmJ2ObSSCnIAomUy3Lp+9fTuwyyEyrvr5Li0gc
	CMvk+f78cJRptP825uFSAenYKBbbORY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-bCfFtWwXP9iNpT1YMQv7mQ-1; Tue, 04 Mar 2025 10:48:54 -0500
X-MC-Unique: bCfFtWwXP9iNpT1YMQv7mQ-1
X-Mimecast-MFC-AGG-ID: bCfFtWwXP9iNpT1YMQv7mQ_1741103333
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43bcb061704so5291305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741103333; x=1741708133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffON9SnaOWg9oFQtm+MueKUsNfzxra0dWfxUL8seX24=;
        b=qWLsJKG7haQ9mE6yqkjpqVMDdLEcoGJfa+wFdLQXw2p4tLcaR0DLfOC6GOOyVXIm9x
         GLNrvlKab2XbMZWD40bm/5dZA4WJmB5Ui4GRikTALh0IUfw3u3zMPbgALki3aJFbp7Fx
         qJICS0jUfJ9psYEO9KP369pZ+moQOZT4Db80oD2uyKPv+84wlGOFrXVNNzQORgy9RnnN
         aQX6JdQQ0kR/k/NmCMVao2MX+7DdL5J5mW9tFwpXQq2KjvC361+uaKuK2LdRd+pYBvPA
         5XkUYJR4vHFveSZl+MfB2yvQwBsSNKjCT2fGQnmxAsdZEK3I5HIGrLuOvaSZ3PpW2qlz
         jWjA==
X-Forwarded-Encrypted: i=1; AJvYcCVgEKkOzdEGjVz26HDQ44PqIXTL0hxeNLyyyj/AgoLG0OY8fPkC1swZMlv4eV5uFk8uio9efyravmttgKk3vgHM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa5agwQ/P+9FPEgd+tawu4QBWzuYEs3+RkvmsIL735ebC2kDoB
	BArgOBtbTB1QvUJoVCeiXt89dVkIto7prKG3kppOVf1btry3dBzY7IjQkq/cOMIxowgPJiQd0Nc
	bgl9Bc58m0iuMBpGIFK2YD14akIfCynhN3mHp6AW/FFL/hWrff0X39194Eh2lnUD9+WAV9lDJ
X-Gm-Gg: ASbGncsJJZzFSwrFRnb01kczPFGLRrf4GahqcIc62HPsoLVlkyh9w9Zt+DZX0BZYEXz
	3Qqzt+ex0ZESEi9l4Du6Vu9Z5XCW0wkRmF9hav9i/iM4ELAmlPkjF9OpuWfhNRN/KfkKb+y31fJ
	nLVA98mJyR796wd2kIVsfCVA6eeeywLC3O9EIynAjvy96ycbJLG2oTaT0cR6KDIlf86izO//JTu
	6HZegm1PTCVe1UgpMfecY5dHZRZs/pfmNhrWuJNEGVSfsq1o4NyEHpySInDwAFqH5XKYMzf3dz/
	4/nPa33+RLsCe/ZOCIaDp+Lp3HKOV1ODDLcuk52RLAvtatE7MYyP5MgDg9YL88yvFYFfcDk+Ex6
	h
X-Received: by 2002:a05:600c:3c9d:b0:439:8a62:db42 with SMTP id 5b1f17b1804b1-43ba66e19d9mr153515715e9.8.1741103333121;
        Tue, 04 Mar 2025 07:48:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4Gjl+jrn0ypwJ4W8O9mKURosa8cKWKJgfr05HkBSuQdnMp7DSreUXUU7A6eFr/8nx/dTcdQ==
X-Received: by 2002:a05:600c:3c9d:b0:439:8a62:db42 with SMTP id 5b1f17b1804b1-43ba66e19d9mr153515575e9.8.1741103332777;
        Tue, 04 Mar 2025 07:48:52 -0800 (PST)
Received: from localhost (p200300cbc73610009e302a8acd3d419c.dip0.t-ipconnect.de. [2003:cb:c736:1000:9e30:2a8a:cd3d:419c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bca26676esm43128935e9.8.2025.03.04.07.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 07:48:52 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [PATCH -next v1 2/3] kernel/events/uprobes: pass VMA to set_swbp(), set_orig_insn() and uprobe_write_opcode()
Date: Tue,  4 Mar 2025 16:48:45 +0100
Message-ID: <20250304154846.1937958-3-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304154846.1937958-1-david@redhat.com>
References: <20250304154846.1937958-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WgYgKxK4510JK77iw6XCqTdVq7Zk-8gdhgY1eoRKzpw_1741103333
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_074856_654422_83698F92 
X-CRM114-Status: GOOD (  20.87  )
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
index a40efdda9052b..4da3bce5e062d 100644
--- a/include/linux/uprobes.h
+++ b/include/linux/uprobes.h
@@ -186,13 +186,13 @@ struct uprobes_state {
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
index 991aacc80d0e0..0276defd6fbfa 100644
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


