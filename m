Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6285ACA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SK2vB3bamyZR/EztfyKDwVCAIo9m6zAn5sAJ8nDYq84=; b=pEkdbEuEHIunEmt52Zv4/QX66g
	ql845Zs2Sm0zXstL4W0XkOGwEhqqmjDNo0JMUNr03mN+ZHmjpeD93kjP/rcwp22aajCigwk954o6e
	iOQ55qGiDOV1sEBHmIyWaCC/aVyCKzcPk6cV31GbLKazl6MLMjZfkb7AJyFdQ945E5iptPTofmHkT
	YbclNC8sZER3AXOpkKbYSsOG8fVAjQ2x0VZdUShFm/lUQOH3wMyCMQarAp23fT5BYaSnCD5I/yRES
	xFqVNWl5vj6w5056IuV33ovMJlekDa5ElPo0pJCc++Te0e54CIQLZwRMdoSQDLn+S9QpmrDpwJ9ss
	fh/5UslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ3v-00000002Mlu-3bk1;
	Wed, 07 Oct 2026 11:43:55 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ3q-00000002MhN-35Qf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:43:52 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so2586231a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373429; x=1791978229; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SK2vB3bamyZR/EztfyKDwVCAIo9m6zAn5sAJ8nDYq84=;
        b=KsZcj55AiyUh6EXUbouZoRmGYPMKn2MfopSq8WSYePqHGF52dHGU+R4nPwGWjKTr4e
         nPoRft11qh8qtQBZEzPTtwtc6ybd30d2a/bFEZxS+/y8svyxCv/e72WSD2lNXTdNwheg
         OSk22wZNey468k/QSPut/tDdOeXB9wSbpjSv4l2jU7B4w3qmnyyMscRKIqjK8lqEfhpo
         TZ6L248+ohvPmFRK78617A6iCg8mZumEd4bBtm4FTnisohc+Z/OhByaPy3eyRmpJC/nE
         Ilox72WhTqDZcubWihzfBjdnUyyNJfjA1tBGQUahp2DiKJRnBaLN2a6vxsCk0EUw0pFn
         rcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373429; x=1791978229;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SK2vB3bamyZR/EztfyKDwVCAIo9m6zAn5sAJ8nDYq84=;
        b=ruUiRQ1b+xpmbxxv15GIYkQTW66Mt5dm+DYdwyQq7iYZYdSbt05ty7KBgl9KsQdpZ3
         i9bEFvi103BrX46qiHpVIhwkVDuGqF/XS7NZOcZ6vkkxaXR/Z7IDbhrcpOzOLjP6PIBS
         Jz5qu9gevfIbYvRMMJdPaMQWWvhFraIcYHs+03NqAQSu0cOXBazurIbMwuz+XnhsQjR4
         nZkt1KphxyTPZA95kOZSd02DmAq0W2LoCrsAGQRwDGNmYyNkALCxSazsQOEIbqGGfHQv
         mI88YOUlZUZRmY3tSq+KbX7Cll7e4M2j1J9YrR0PQMZsStexmd8IIG+nYGP3mUeAmZ+8
         umUg==
X-Forwarded-Encrypted: i=1; AKwUvBwPppZmclZ2jkn3lOru7JukdRqqqSQLVpOyrSTKzy8FLmf4WsmGjONOJdznKMllyZDMubfpgtFbFHOC0zAX28Zi@lists.infradead.org
X-Gm-Message-State: AFuF++kpXowiJu0kLlDwLNMCa/lups2Z8OkSB0XyW1KolA0Q6oVFnC7l
	Yyvr1cHoeqSEEij/hXe154AgNpvM3u7KHmQGMi22DG4DOpZw8sg5x8rf2fp/ibF6s9ZRQvPDEO7
	FAhmvL2DvLSBmIokX8tcidSu74w==
X-Received: from pfei1.prod.google.com ([2002:a05:6a00:c041:b0:888:2e48:6a84])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3418:b0:3e0:c5f5:6266 with SMTP id adf61e73a8af0-3e134121856mr1644659637.59.1791373429053;
 Wed, 07 Oct 2026 04:43:49 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:26 +0000
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-3-dylanbhatch@google.com>
Subject: [PATCH v8 02/11] arm64/sframe: Read vmlinux .sframe header
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_044350_805282_A1E8F42A 
X-CRM114-Status: GOOD (  24.90  )
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

From: Josh Poimboeuf <jpoimboe@kernel.org>

In preparation for unwinding kernel space stacks with sframe, add basic
sframe compile infrastructure and support for reading the .sframe
section header. Add init_sframe_table() to read the vmlinux .sframe
header at boot.

[ Jens Remus: Add support for SFrame V3.  Add support for PC-relative
FDE function start offset.  Cleanup includes and indentation. ]

[ Dylan Hatch: Repurpose patch for arm64 vmlinux. ]

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Reviewed-by: Indu Bhagat <ibhagatgnu@gmail.com>
Co-developed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Jens Remus <jremus@linux.ibm.com>
Co-developed-by: Dylan Hatch <dylanbhatch@google.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v7:
 - (shashiko) remove KCOV, KCSAN, and KASAN instrumentation from
   sframe.o (copying over ORC's shoulder).
---
 MAINTAINERS               |  1 +
 arch/arm64/kernel/setup.c |  2 +
 include/linux/sframe.h    | 32 ++++++++++++++++
 kernel/unwind/Makefile    |  9 ++++-
 kernel/unwind/sframe.c    | 80 +++++++++++++++++++++++++++++++++++++++
 kernel/unwind/sframe.h    | 78 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 201 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/sframe.h
 create mode 100644 kernel/unwind/sframe.c
 create mode 100644 kernel/unwind/sframe.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 36d7ee1f6ea5e..d2b62b26f5e94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28542,6 +28542,7 @@ M:	Josh Poimboeuf <jpoimboe@kernel.org>
 M:	Steven Rostedt <rostedt@goodmis.org>
 S:	Maintained
 F:	arch/*/include/asm/unwind_sframe.h
+F:	include/linux/sframe.h
 F:	include/linux/unwind*.h
 F:	kernel/unwind/
 
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 29c6100f0c50b..84983df605ed5 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -32,6 +32,7 @@
 #include <linux/sched/task.h>
 #include <linux/scs.h>
 #include <linux/mm.h>
+#include <linux/sframe.h>
 
 #include <asm/acpi.h>
 #include <asm/fixmap.h>
@@ -373,6 +374,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 			"This indicates a broken bootloader or old kernel\n",
 			boot_args[1], boot_args[2], boot_args[3]);
 	}
+	init_sframe_table();
 }
 
 static inline bool cpu_can_disable(unsigned int cpu)
diff --git a/include/linux/sframe.h b/include/linux/sframe.h
new file mode 100644
index 0000000000000..54e5cb76cb92c
--- /dev/null
+++ b/include/linux/sframe.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_SFRAME_H
+#define _LINUX_SFRAME_H
+
+#include <linux/init.h>
+
+#ifdef CONFIG_UNWIND_SFRAME_LOOKUP
+
+struct sframe_section {
+	unsigned long	sframe_start;
+	unsigned long	sframe_end;
+
+	unsigned long	fdes_start;
+	unsigned long	fres_start;
+	unsigned long	fres_end;
+	unsigned int	num_fdes;
+
+	signed char	ra_off;
+	signed char	fp_off;
+};
+
+extern struct sframe_section kernel_sfsec __ro_after_init;
+
+void __init init_sframe_table(void);
+
+#else /* !CONFIG_UNWIND_SFRAME_LOOKUP */
+
+static inline void __init init_sframe_table(void) {}
+
+#endif /* CONFIG_UNWIND_SFRAME_LOOKUP */
+
+#endif /* _LINUX_SFRAME_H */
diff --git a/kernel/unwind/Makefile b/kernel/unwind/Makefile
index eae37bea54fdb..c5d953e48fe82 100644
--- a/kernel/unwind/Makefile
+++ b/kernel/unwind/Makefile
@@ -1 +1,8 @@
- obj-$(CONFIG_UNWIND_USER)	+= user.o deferred.o
+ obj-$(CONFIG_UNWIND_USER)		+= user.o deferred.o
+
+ KCOV_INSTRUMENT_sframe.o	:= n
+ KASAN_SANITIZE_sframe.o	:= n
+ KCSAN_SANITIZE_sframe.o	:= n
+
+ CFLAGS_REMOVE_sframe.o = $(CC_FLAGS_FTRACE)
+ obj-$(CONFIG_UNWIND_SFRAME_LOOKUP)	+= sframe.o
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
new file mode 100644
index 0000000000000..d43a3b2367fca
--- /dev/null
+++ b/kernel/unwind/sframe.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kernel sframe access functions
+ */
+
+#define pr_fmt(fmt)	"sframe: " fmt
+
+#include <linux/mm.h>
+#include <linux/string_helpers.h>
+#include <linux/sframe.h>
+#include <asm/sections.h>
+
+#include "sframe.h"
+
+static bool sframe_init __ro_after_init;
+struct sframe_section kernel_sfsec __ro_after_init;
+
+static int sframe_read_header(struct sframe_section *sec)
+{
+	unsigned long header_end, fdes_start, fdes_end, fres_start, fres_end;
+	struct sframe_header *shdr;
+	unsigned int num_fdes;
+
+	header_end = sec->sframe_start + sizeof(struct sframe_header);
+	if (header_end >= sec->sframe_end) {
+		pr_debug("header struct doesn't fit in section\n");
+		return -EINVAL;
+	}
+
+	shdr = (struct sframe_header *)sec->sframe_start;
+
+	if (shdr->preamble.magic != SFRAME_MAGIC ||
+	    shdr->preamble.version != SFRAME_VERSION_3 ||
+	    !(shdr->preamble.flags & SFRAME_F_FDE_SORTED) ||
+	    !(shdr->preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
+	    shdr->auxhdr_len) {
+		pr_debug("bad/unsupported sframe header\n");
+		return -EINVAL;
+	}
+
+	if (!shdr->num_fdes || !shdr->num_fres) {
+		pr_debug("no fde/fre entries\n");
+		return -EINVAL;
+	}
+
+	num_fdes   = shdr->num_fdes;
+	fdes_start = header_end + shdr->fdes_off;
+	fdes_end   = fdes_start + (num_fdes * sizeof(struct sframe_fde_v3));
+
+	fres_start = header_end + shdr->fres_off;
+	fres_end   = fres_start + shdr->fre_len;
+
+	if (fres_start < fdes_end || fres_end > sec->sframe_end || fres_end < sec->sframe_start) {
+		pr_debug("inconsistent fde/fre offsets\n");
+		return -EINVAL;
+	}
+
+	sec->num_fdes		= num_fdes;
+	sec->fdes_start		= fdes_start;
+	sec->fres_start		= fres_start;
+	sec->fres_end		= fres_end;
+
+	sec->ra_off		= shdr->cfa_fixed_ra_offset;
+	sec->fp_off		= shdr->cfa_fixed_fp_offset;
+
+	return 0;
+}
+
+void __init init_sframe_table(void)
+{
+	kernel_sfsec.sframe_start	= (unsigned long)__start_sframe;
+	kernel_sfsec.sframe_end		= (unsigned long)__end_sframe;
+
+	if (sframe_read_header(&kernel_sfsec)) {
+		pr_warn("invalid vmlinux SFrame header\n");
+		return;
+	}
+
+	sframe_init = true;
+}
diff --git a/kernel/unwind/sframe.h b/kernel/unwind/sframe.h
new file mode 100644
index 0000000000000..bf895107c2070
--- /dev/null
+++ b/kernel/unwind/sframe.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * From https://www.sourceware.org/binutils/docs/sframe-spec.html
+ */
+#ifndef _SFRAME_H
+#define _SFRAME_H
+
+#include <linux/types.h>
+
+#define SFRAME_VERSION_1			1
+#define SFRAME_VERSION_2			2
+#define SFRAME_VERSION_3			3
+#define SFRAME_MAGIC				0xdee2
+
+#define SFRAME_F_FDE_SORTED			0x1
+#define SFRAME_F_FRAME_POINTER			0x2
+#define SFRAME_F_FDE_FUNC_START_PCREL		0x4
+
+#define SFRAME_ABI_AARCH64_ENDIAN_BIG		1
+#define SFRAME_ABI_AARCH64_ENDIAN_LITTLE	2
+#define SFRAME_ABI_AMD64_ENDIAN_LITTLE		3
+
+struct sframe_preamble {
+	u16	magic;
+	u8	version;
+	u8	flags;
+} __packed;
+
+struct sframe_header {
+	struct sframe_preamble preamble;
+	u8	abi_arch;
+	s8	cfa_fixed_fp_offset;
+	s8	cfa_fixed_ra_offset;
+	u8	auxhdr_len;
+	u32	num_fdes;
+	u32	num_fres;
+	u32	fre_len;
+	u32	fdes_off;
+	u32	fres_off;
+} __packed;
+
+struct sframe_fde_v3 {
+	s64	func_start_off;
+	u32	func_size;
+	u32	fres_off;
+} __packed;
+
+struct sframe_fda_v3 {
+	u16	fres_num;
+	u8	info;
+	u8	info2;
+	u8	rep_size;
+} __packed;
+
+#define SFRAME_FDE_PCTYPE_INC			0
+#define SFRAME_FDE_PCTYPE_MASK			1
+
+#define SFRAME_AARCH64_PAUTH_KEY_A		0
+#define SFRAME_AARCH64_PAUTH_KEY_B		1
+
+#define SFRAME_V3_FDE_FRE_TYPE(info)		((info) & 0xf)
+#define SFRAME_V3_FDE_PCTYPE(info)		(((info) >> 4) & 0x1)
+#define SFRAME_V3_AARCH64_FDE_PAUTH_KEY(info)	(((info) >> 5) & 0x1)
+
+#define SFRAME_FDE_TYPE_DEFAULT			0
+
+#define SFRAME_V3_FDE_TYPE_MASK			0x1f
+#define SFRAME_V3_FDE_TYPE(info2)		((info2) & SFRAME_V3_FDE_TYPE_MASK)
+
+#define SFRAME_BASE_REG_FP			0
+#define SFRAME_BASE_REG_SP			1
+
+#define SFRAME_V3_FRE_CFA_BASE_REG_ID(info)		((info) & 0x1)
+#define SFRAME_V3_FRE_DATAWORD_COUNT(info)		(((info) >> 1) & 0xf)
+#define SFRAME_V3_FRE_DATAWORD_SIZE(info)		(((info) >> 5) & 0x3)
+#define SFRAME_V3_AARCH64_FRE_MANGLED_RA_P(info)	(((info) >> 7) & 0x1)
+
+#endif /* _SFRAME_H */
-- 
2.56.0.360.g66cac248cb-goog


