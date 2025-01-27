Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB372C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 21:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFxyJQizGcViiMZLcjGdqbFKo+O4vKLRWZRU/ldO2O0=; b=nB+KEY7hS5ScQXhsSTDf3AOfxj
	5WGRgBFCSJquaERXsXANZNgwZFhnQpLGcCRONLnKjXSuF5CjBZ5XMrnPUY+rQg/66UgVqGPvuJjY7
	2QyHet8Tbx8xcrahRI2hBzoFdgNPGVSucaony5DNF6El8RKskUEZnS1lki/yJ6lneGOnD9MDBpPNU
	OyJqK9vtZGVvWA5M5y5fK1i3tD914ck20OFx39j3X55DBh7iKrj4GOT0ECgyhn811zbpnyHGwN89d
	YaRA31GquabcIZthvNJxY4xI8WvFWWhrS5Q7HhPynblFbJkMcCpn9hhqgEgs5DIVjYRhttBrEC8nz
	cWrVyOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWqp-00000003KRf-3s1r;
	Mon, 27 Jan 2025 21:40:59 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWjg-00000003JCl-1QKp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 21:33:38 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so3287190a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738013615; x=1738618415; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vFxyJQizGcViiMZLcjGdqbFKo+O4vKLRWZRU/ldO2O0=;
        b=ylwTFUi4pytW5SeWFDWcpy9Wk1JlqDHNIHG1tOR5xhD6sLmff6+y+8esj01EGRQtOG
         l4nHghmVqchfmq2viXzWCvGEUDJKbBQAuyn3UqLzkQ8GWVy1iWwfxRUgecFMhKqce4wt
         hOmTyiULh5Jaw/pLl7VXAkepZIWjPMSP9/oM8Y0WA0LrG6wxVxNw/zOCHIlnxj8KVB+s
         0sfhN9mZHeWgGvvR/jEeahc4wPt7Vn+YPsDJwGfmlH6pznHa5z94DKeQ+API7Uh/glzR
         GqDlHp8/Yi9BWHcc9WFVT/+anT7Vu/eHMKRFz9f0Oo1UMmmupX1iO9hpGuQ/bwz5Qi/L
         Y4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738013615; x=1738618415;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vFxyJQizGcViiMZLcjGdqbFKo+O4vKLRWZRU/ldO2O0=;
        b=cKQ8EyrqKHFpFUGlUsms4/SqAr0d/fXKvnGVLxnTTKttDQaCrBeWagIjHRxBdpHMaC
         S/eUShPm0J2uWI6ZfJFdAlAaOWPSK50d2aWVao4xd2Vz0m6VaoXdGJzRTSh4euFO/ozX
         cOj0qUDSBatj97OtFYqC+imNRGFl//M6zmyjfJV0Cjx61cs7ZoFmmAPU35owuB30oc7H
         BUDlHmzY55qPK+4G7ZOGfTjZdMCkW3sGBf0Ap0YBREZjDSQoLXf8poMZZi8X+0aE+hyu
         GKcYftuvUy6QWHUky4TmRPxHJrzlQa7na5VPbocpoDYjskyjQnXBJz454VMfvlBCtd4t
         kpyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGRURxcd2Ycne8GXexlZzjT/qhM3z19og+PFThjYcDec3qyXVVl2HkMvTtRII7IKOG2dGGfbi4noZVru4n/YbX@lists.infradead.org
X-Gm-Message-State: AOJu0Yycg4Hi7f/AvYmYHCC02yjQ+vrWSNC9RQytq5u1JfRzn95xFUUE
	Gt+/mJtqTi2SqILYP4UgQ+Hr0vknPUQbEmaBkAHX6iVGYR97nATR28W97p4l7VhVcaU4aVbJpA=
	=
X-Google-Smtp-Source: AGHT+IHHPT3SHafekGNUGDZsLxe9xIeZEZ7pS5XFwvuSD16m5Qqb3+3tw3GkG+JemAl3HyjyegOXze/WMg==
X-Received: from pjbpa16.prod.google.com ([2002:a17:90b:2650:b0:2da:ac73:93e0])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2751:b0:2ee:f440:53ed
 with SMTP id 98e67ed59e1d1-2f782d9a1d5mr60272909a91.31.1738013614965; Mon, 27
 Jan 2025 13:33:34 -0800 (PST)
Date: Mon, 27 Jan 2025 21:33:06 +0000
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
Mime-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127213310.2496133-5-wnliu@google.com>
Subject: [PATCH 4/8] unwind: Implement generic sframe unwinder library
From: Weinan Liu <wnliu@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Weinan Liu <wnliu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_133336_380862_C31A98E4 
X-CRM114-Status: GOOD (  27.50  )
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

This change introduces a kernel space unwinder using sframe table for
architectures without ORC unwinder support.

The implementation is adapted from Josh's userspace sframe unwinder
proposal[1] according to the sframe v2 spec[2].

[1] https://lore.kernel.org/lkml/42c0a99236af65c09c8182e260af7bcf5aa1e158.1730150953.git.jpoimboe@kernel.org/
[2] https://sourceware.org/binutils/docs/sframe-spec.html

Signed-off-by: Weinan Liu <wnliu@google.com>
---
 include/linux/sframe_lookup.h |  43 ++++++++
 kernel/Makefile               |   1 +
 kernel/sframe_lookup.c        | 196 ++++++++++++++++++++++++++++++++++
 3 files changed, 240 insertions(+)
 create mode 100644 include/linux/sframe_lookup.h
 create mode 100644 kernel/sframe_lookup.c

diff --git a/include/linux/sframe_lookup.h b/include/linux/sframe_lookup.h
new file mode 100644
index 000000000000..1c26cf1f38d4
--- /dev/null
+++ b/include/linux/sframe_lookup.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_SFRAME_LOOKUP_H
+#define _LINUX_SFRAME_LOOKUP_H
+
+/**
+ * struct sframe_ip_entry - sframe unwind info for given ip
+ * @cfa_offset: Offset for the Canonical Frame Address(CFA) from Frame
+ *              Pointer(FP) or Stack Pointer(SP)
+ * @ra_offset: Offset for the Return Address from CFA.
+ * @fp_offset: Offset for the Frame Pointer (FP) from CFA.
+ * @use_fp: Use FP to get next CFA or not
+ */
+struct sframe_ip_entry {
+	int32_t cfa_offset;
+	int32_t ra_offset;
+	int32_t fp_offset;
+	bool use_fp;
+};
+
+/**
+ * struct sframe_table - sframe struct of a table
+ * @sfhdr_p: Pointer to sframe header
+ * @fde_p: Pointer to the first of sframe frame description entry(FDE).
+ * @fre_p: Pointer to the first of sframe frame row entry(FRE).
+ */
+struct sframe_table {
+	struct sframe_header *sfhdr_p;
+	struct sframe_fde *fde_p;
+	char *fre_p;
+};
+
+#ifdef CONFIG_SFRAME_UNWINDER
+void init_sframe_table(void);
+int sframe_find_pc(unsigned long pc, struct sframe_ip_entry *entry);
+#else
+static inline void init_sframe_table(void) {}
+static inline int sframe_find_pc(unsigned long pc, struct sframe_ip_entry *entry)
+{
+	return -EINVAL;
+}
+#endif
+
+#endif /* _LINUX_SFRAME_LOOKUP_H */
diff --git a/kernel/Makefile b/kernel/Makefile
index 87866b037fbe..705c9277e5cd 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -131,6 +131,7 @@ obj-$(CONFIG_WATCH_QUEUE) += watch_queue.o
 
 obj-$(CONFIG_RESOURCE_KUNIT_TEST) += resource_kunit.o
 obj-$(CONFIG_SYSCTL_KUNIT_TEST) += sysctl-test.o
+obj-$(CONFIG_SFRAME_UNWINDER) += sframe_lookup.o
 
 CFLAGS_stackleak.o += $(DISABLE_STACKLEAK_PLUGIN)
 obj-$(CONFIG_GCC_PLUGIN_STACKLEAK) += stackleak.o
diff --git a/kernel/sframe_lookup.c b/kernel/sframe_lookup.c
new file mode 100644
index 000000000000..846f1da95d89
--- /dev/null
+++ b/kernel/sframe_lookup.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/module.h>
+#include <linux/sort.h>
+#include <linux/sframe_lookup.h>
+#include <linux/kallsyms.h>
+#include "sframe.h"
+
+#define pr_fmt(fmt)	"sframe: " fmt
+
+extern char __start_sframe_header[];
+extern char __stop_sframe_header[];
+
+static bool sframe_init __ro_after_init;
+static struct sframe_table sftbl;
+
+#define SFRAME_READ_TYPE(in, out, type)					\
+({									\
+	type __tmp;							\
+	memcpy(&__tmp, in, sizeof(__tmp));				\
+	in += sizeof(__tmp);						\
+	out = __tmp;							\
+})
+
+#define SFRAME_READ_ROW_ADDR(in_addr, out_addr, type)			\
+({									\
+	switch (type) {							\
+	case SFRAME_FRE_TYPE_ADDR1:					\
+		SFRAME_READ_TYPE(in_addr, out_addr, u8);		\
+		break;							\
+	case SFRAME_FRE_TYPE_ADDR2:					\
+		SFRAME_READ_TYPE(in_addr, out_addr, u16);		\
+		break;							\
+	case SFRAME_FRE_TYPE_ADDR4:					\
+		SFRAME_READ_TYPE(in_addr, out_addr, u32);		\
+		break;							\
+	default:							\
+		break;							\
+	}								\
+})
+
+#define SFRAME_READ_ROW_OFFSETS(in_addr, out_addr, size)		\
+({									\
+	switch (size) {							\
+	case 1:								\
+		SFRAME_READ_TYPE(in_addr, out_addr, s8);		\
+		break;							\
+	case 2:								\
+		SFRAME_READ_TYPE(in_addr, out_addr, s16);		\
+		break;							\
+	case 4:								\
+		SFRAME_READ_TYPE(in_addr, out_addr, s32);		\
+		break;							\
+	default:							\
+		break;							\
+	}								\
+})
+
+static struct sframe_fde *find_fde(const struct sframe_table *tbl, unsigned long pc)
+{
+	int l, r, m, f;
+	int32_t ip;
+	struct sframe_fde *fdep;
+
+	if (!tbl || !tbl->sfhdr_p || !tbl->fde_p)
+		return NULL;
+
+	ip = (pc - (unsigned long)tbl->sfhdr_p);
+
+	/* Do a binary range search to find the rightmost FDE start_addr < ip */
+	l = m = f = 0;
+	r = tbl->sfhdr_p->num_fdes;
+	while (l < r) {
+		m = l + ((r - l) / 2);
+		fdep = tbl->fde_p + m;
+		if (fdep->start_addr > ip)
+			r = m;
+		else
+			l = m + 1;
+	}
+	/* use l - 1 because l will be the first item fdep->start_addr > ip */
+	f = l - 1;
+	if (f >= tbl->sfhdr_p->num_fdes || f < 0)
+		return NULL;
+	fdep = tbl->fde_p + f;
+	if (ip < fdep->start_addr || ip >= fdep->start_addr + fdep->size)
+		return NULL;
+
+	return fdep;
+}
+
+static int find_fre(const struct sframe_table *tbl, unsigned long pc,
+		const struct sframe_fde *fdep, struct sframe_ip_entry *entry)
+{
+	int i, offset_size, offset_count;
+	char *fres, *offsets_loc;
+	int32_t ip_off;
+	uint32_t next_row_ip_off;
+	uint8_t fre_info, fde_type = SFRAME_FUNC_FDE_TYPE(fdep->info),
+			fre_type = SFRAME_FUNC_FRE_TYPE(fdep->info);
+
+	fres = tbl->fre_p + fdep->fres_off;
+
+	/*  Whether PCs in the FREs should be treated as masks or not */
+	if (fde_type == SFRAME_FDE_TYPE_PCMASK)
+		ip_off = pc % fdep->rep_size;
+	else
+		ip_off = (int32_t)(pc - (unsigned long)tbl->sfhdr_p) - fdep->start_addr;
+
+	if (ip_off < 0 || ip_off >= fdep->size)
+		return -EINVAL;
+
+	/*
+	 * FRE structure starts by address of the entry with variants length. Use
+	 * two pointers to track current head(fres) and the address of last
+	 * offset(offsets_loc)
+	 */
+	for (i = 0; i < fdep->fres_num; i++) {
+		SFRAME_READ_ROW_ADDR(fres, next_row_ip_off, fre_type);
+		if (ip_off < next_row_ip_off)
+			break;
+		SFRAME_READ_TYPE(fres, fre_info, u8);
+		offsets_loc = fres;
+		/*
+		 * jump to the start of next fre
+		 * fres += fre_offets_cnt*offset_size
+		 */
+		fres += SFRAME_FRE_OFFSET_COUNT(fre_info) << SFRAME_FRE_OFFSET_SIZE(fre_info);
+	}
+
+	offset_size = 1 << SFRAME_FRE_OFFSET_SIZE(fre_info);
+	offset_count = SFRAME_FRE_OFFSET_COUNT(fre_info);
+
+	if (offset_count > 0) {
+		SFRAME_READ_ROW_OFFSETS(offsets_loc, entry->cfa_offset, offset_size);
+		offset_count--;
+	}
+	if (offset_count > 0 && !entry->ra_offset) {
+		SFRAME_READ_ROW_OFFSETS(offsets_loc, entry->ra_offset, offset_size);
+		offset_count--;
+	}
+	if (offset_count > 0 && !entry->fp_offset) {
+		SFRAME_READ_ROW_OFFSETS(offsets_loc, entry->fp_offset, offset_size);
+		offset_count--;
+	}
+	if (offset_count)
+		return -EINVAL;
+
+	entry->use_fp = SFRAME_FRE_CFA_BASE_REG_ID(fre_info) == SFRAME_BASE_REG_FP;
+
+	return 0;
+}
+
+int sframe_find_pc(unsigned long pc, struct sframe_ip_entry *entry)
+{
+	struct sframe_fde *fdep;
+	struct sframe_table *sftbl_p = &sftbl;
+	int err;
+
+	if (!sframe_init)
+		return -EINVAL;
+
+	memset(entry, 0, sizeof(*entry));
+	entry->ra_offset = sftbl_p->sfhdr_p->cfa_fixed_ra_offset;
+	entry->fp_offset = sftbl_p->sfhdr_p->cfa_fixed_fp_offset;
+
+	fdep = find_fde(sftbl_p, pc);
+	if (!fdep)
+		return -EINVAL;
+	err = find_fre(sftbl_p, pc, fdep, entry);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+void __init init_sframe_table(void)
+{
+	size_t sframe_size = (void *)__stop_sframe_header - (void *)__start_sframe_header;
+	void *sframe_buf = __start_sframe_header;
+
+	if (sframe_size <= 0)
+		return;
+	sftbl.sfhdr_p = sframe_buf;
+	if (!sftbl.sfhdr_p || sftbl.sfhdr_p->preamble.magic != SFRAME_MAGIC ||
+	    sftbl.sfhdr_p->preamble.version != SFRAME_VERSION_2 ||
+	    !(sftbl.sfhdr_p->preamble.flags & SFRAME_F_FDE_SORTED)) {
+		pr_warn("WARNING: Unable to read sframe header.  Disabling unwinder.\n");
+		return;
+	}
+
+	sftbl.fde_p = (struct sframe_fde *)(__start_sframe_header + SFRAME_HDR_SIZE(*sftbl.sfhdr_p)
+						+ sftbl.sfhdr_p->fdes_off);
+	sftbl.fre_p = __start_sframe_header + SFRAME_HDR_SIZE(*sftbl.sfhdr_p)
+		+ sftbl.sfhdr_p->fres_off;
+	sframe_init = true;
+}
-- 
2.48.1.262.g85cc9f2d1e-goog


