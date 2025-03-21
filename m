Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282EEC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 11:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LA4tQm8B9yk34e6zjAsFaRrtnSy4omTcdpMVJkFUhlY=; b=HMx+Ii2hmShOKISwjn23QJYDJ8
	pAJ3JmHIG3OHRFfZC5vJzqbTHJNlwLQXbqUnUKwujPe9ho2WBiVJuol9HyRXOrc3m2a2OPrG2U8+3
	L+84Om/L3PFMkeYSsvU9WPoL8NSjGBJFm5wzvjmAdL9EmqV/clt31XRzIG2ZGEkFfE3Qjd2o4ixQk
	cFsILoT7inj37rMKkHncA/ihH+aw25oV9eZwC+CXFAibT/vhWnF95N7sNXsBn6qx/MW0jOamurVzd
	QqcjzGPzq7IIsaW8jWXSlj2CoLUXo2WvRFLbchjAZOOcIIIpyicLB/O/aJ7ljdYwwB1v7LZbTAECW
	yx5vHg+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaln-0000000EgvQ-0zhV;
	Fri, 21 Mar 2025 11:42:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvagl-0000000EgCV-0gza
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 11:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742557042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LA4tQm8B9yk34e6zjAsFaRrtnSy4omTcdpMVJkFUhlY=;
	b=Br9vMT1ANbZ3H/eBQdaz7la3/nMxpX6exglJ4gvN5Gy242qhj2iZlkXhSqtXdkAtn3WLef
	oCR2x9SYzzxlr6ounW8KmBB3GGtliCwSNzayZRoGNPPiAoguxneVyv6jjcxfmpxjQS6fbs
	vAJ5xvmrSuboEeQ/L3UhQGW8n/ZbVX4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-JGj4z5tSMkG3Hlb8QcOyKw-1; Fri, 21 Mar 2025 07:37:20 -0400
X-MC-Unique: JGj4z5tSMkG3Hlb8QcOyKw-1
X-Mimecast-MFC-AGG-ID: JGj4z5tSMkG3Hlb8QcOyKw_1742557040
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913f97d115so908026f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 04:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742557040; x=1743161840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LA4tQm8B9yk34e6zjAsFaRrtnSy4omTcdpMVJkFUhlY=;
        b=jPKiaHLCpzevteNQ9R3EZ6rad0Rtmdz5HpKXUDwRmbvSqrzPd1kMOxbNBm20QoSwko
         GJfsoJdn+elZ6/cJPNvs2YgpHzJYvFiB+5/HaY8hk4You9uHWhs7we5Iw9s+f2LXHzMe
         wmht+jd9M4KJiTJXwxS5hd+DdpZBQu2+6p56SZu0LCchhpkepa4ofrS4b2XXIso3wD8Q
         I506Q6IuuJFYBqDtGwNLVM6feOzlIGaJEvUhmY3FGNJkIkFFhhEpKJtBgdElscJea8o7
         XXRUGCDoSiKbbCzUFrf3rTSgNNw3iubJQTgBH8AWEETWnmSTKCY+8XZWfgZwSfnUuh/w
         2gIg==
X-Forwarded-Encrypted: i=1; AJvYcCWNZMQfmnRCGViLgAvMhFH92yXVjLUK7D2wKWBFH960v0evQl6Dv+nEu3l4BBhoulBr2rXvT5VsEoljSeymUHsd@lists.infradead.org
X-Gm-Message-State: AOJu0YxxsoBvOecNim2FE2vqdZAJC2Ypwen+pBdb4VsTTHmFL6628lon
	IavYRIOHhkTNGmZ6SbzCgB9/yoN+Rrr3+HoDic51lKONMCWprskEFQ3uvMTeMtJQzEw1DbBCYQU
	Hsck/PWlggz4Jo9cGxMyeTuTsIo45I5d2EDtG2P6pqzZPvxfUBmy6F4dcoir0ohjrclXe3p89
X-Gm-Gg: ASbGnctvzhg/7IvARuzjWeWv+wIUTUau+UCxa9OXZpLxlNbn/IFx+B0UynAjBMudVM1
	ATadfTmesa3oHzpUQ4/a3/9id46KZzPPQDAQOv4f1WmQd3cVDZTvf9Zijj4onmpbJynwdQ+EiRT
	3EykVpTgnJ1m9GAfINf0NQQzJBH0G8TgQSt1rjAxAd3KH1JI3s9pc1zTZg1iwO4b5yzQs4nY7Dt
	vUVQETiSk5vQN2CXTirtZCokLG/sjqGZIcsmghYk8rf7wp5T1zhVO6gf+i085VAiaO8ve+24LBM
	ioWk+G2BN6U2dF14Ob0g7BJ2R56/LQ2FQGTe6FyJ7SK6P0y5OS0JzZgZD4j2y3AfJDYyzsIfd6Q
	1
X-Received: by 2002:a05:6000:4021:b0:390:df83:1f22 with SMTP id ffacd0b85a97d-3997959ce52mr7464149f8f.25.1742557039598;
        Fri, 21 Mar 2025 04:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzgIkkOJsHGuf2WyAxCwKihBA43kh5WjBQNfuxP9FngTIZo6gSbHPXNu6WapbxvVPx5btxjA==
X-Received: by 2002:a05:6000:4021:b0:390:df83:1f22 with SMTP id ffacd0b85a97d-3997959ce52mr7464123f8f.25.1742557039114;
        Fri, 21 Mar 2025 04:37:19 -0700 (PDT)
Received: from localhost (p200300cbc72a910023d23800cdcc90f0.dip0.t-ipconnect.de. [2003:cb:c72a:9100:23d2:3800:cdcc:90f0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f43e50sm74599665e9.12.2025.03.21.04.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 04:37:18 -0700 (PDT)
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
Subject: [PATCH v3 2/3] kernel/events/uprobes: pass VMA to set_swbp(), set_orig_insn() and uprobe_write_opcode()
Date: Fri, 21 Mar 2025 12:37:12 +0100
Message-ID: <20250321113713.204682-3-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250321113713.204682-1-david@redhat.com>
References: <20250321113713.204682-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gTlyLrnB5NSWyZdlLrdnqTZF2X-LB4GguHFV3dqdsEw_1742557040
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_043723_270827_0836BD81 
X-CRM114-Status: GOOD (  19.62  )
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

Acked-by: Oleg Nesterov <oleg@redhat.com>
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


