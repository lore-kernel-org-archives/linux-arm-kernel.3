Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90A6C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdiHHTW8jQdaUExNu6inxQj8ZzPR+EGZJy91h77Y1gw=; b=2knv7PNZCt7pTRQLbb+Qc62oV+
	cyur2P6WVfVCqj44Pkkuf9qaNTfZ18n8K4w46rkDnFJ3zDvb9y2Nw3V4ptSheKHGZrFC//HDYHoOR
	B0SGB5fu7D80Z1O7CUAcz5EZJhldTJFsLAvMAqS2YIXczgzQBVl074/ize4TQtYt5nX1NYQDGgklZ
	GTZNrv9Blk55sWZOFRTJ7E6A3k1d8U2GSif3vyR14Nqz9CHbJ0SkX2MdeFOt79nJX4tsNDvNwPsW/
	Gx+99x0J1g+yovm0BQ9FPga9eTkMzawOFDON6G0K42d0ATJJ129SqDiHeYdB/G+Xep7gWZhyPUqI5
	oOFQH/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHa-0000000FdzV-2Wib;
	Fri, 18 Sep 2026 22:42:14 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHV-0000000FdvQ-02BE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:42:11 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1554323a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771327; x=1790376127; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdiHHTW8jQdaUExNu6inxQj8ZzPR+EGZJy91h77Y1gw=;
        b=uQWvPTCkDv4kaG04/+e/vaIN+aU+s+tMt9U5j9a4wRJcCEbCg2HwxSNSTn5k9hQ7n1
         zqZj/RYOFHnhPRVnQ8b0uXxklqXX6UGE2t8y2UtriJW9gs8Rn0lNn1VbxVNkfAYYCM4I
         REy/1bkWoQverWn6SB1DZ5aFh1j+f0XUAloJrwaqUotcPeMTPcbsomU/xA3IO9szcZ7o
         Vi5xxLQZplyKWaLVHL/6erbLloAl+9Qz6+Z/iu6pyJ+g8T6UINK5VFRXEcAffx6xa6vy
         Y47fJxM+sx5Qw3SNGm4TTolgIbEprGMYkpfEo0TD9N2snVPYWzRNKfFVBJV9/s/TXnie
         gZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771327; x=1790376127;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdiHHTW8jQdaUExNu6inxQj8ZzPR+EGZJy91h77Y1gw=;
        b=aIuaWmeSe55JJIqLM64Q9yDMiN+PmeBonaAUgqeO/cCwsqCgaXf0h7LivUs2Ti9gFd
         AvyMO/QbIj9tQQPparuhC6155FVl7p4DH3S2sg6mRAXOoqcLmF4UuCczLOk8/rJGjqNW
         4VFFIMqiJREX1pc2q2PA5Bg6OdRQNURUwVZGJJa4VvKLCUDyXP4FDs3sndxTxvF2K5e8
         2TFWi/Js7NAjYM7aPAW4sVgQqyA0AznAr8LutDMw2K9wdlqr1tdPx2k5SEHz27ws/L7p
         YaO6/NFqqqdt1qhPuCtLFl3fxDVFHLcNAAMPcsDWtFX4qMQ4IF7RUYL5GERrLUXBS4gZ
         0Bcw==
X-Forwarded-Encrypted: i=1; AKwUvBwqTCq76jby4M9rxW/zFgR7JDqFNYJ53nsX5TwwtNNIsSY56Hi79UGv1beuLwbFzF44PNWWRzRywgBpJybHjvWf@lists.infradead.org
X-Gm-Message-State: AFuF++kCUbzFzkwJ94WhCTqKrwIhcJK0E+Bv+MLecnAHdiSS2UGTwcD8
	tLWvlsAVa7JujB0S/Hazk9+ggE/zmL80WH0f6nPM0qE3H2H40rtDa3hxZ8tRvhTJWD/KlfQv+f0
	+KXBPcSiZGbk9LtnGaS9kztrc2g==
X-Received: from pjbsu6.prod.google.com ([2002:a17:90b:5346:b0:39b:a3c6:1ea1])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b85:b0:39e:6c6a:2096 with SMTP id 98e67ed59e1d1-39e6c6a22e1mr1278154a91.55.1789771326899;
 Fri, 18 Sep 2026 15:42:06 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:48 +0000
In-Reply-To: <20260918224157.1471085-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260918224157.1471085-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-3-dylanbhatch@google.com>
Subject: [PATCH v7 02/11] arm64/sframe: Read vmlinux .sframe header
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
X-CRM114-CacheID: sfid-20260918_154209_360728_079EE440 
X-CRM114-Status: GOOD (  25.61  )
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

This patch is adapted from commit c7db518447c6 ("unwind_user/sframe: Add
support for reading .sframe headers"), and includes the header/init
portions of v6 patch "sframe: Allow kernelspace sframe sections" in this
series.

Changes include:
 - kernel/unwind/sframe* is repurposed exclusively for kernel .sframe
   sections, under CONFIG_UNWIND_SFRAME_LOOKUP.
 - Replaced copy_from_user() with direct memory pointer access when
   reading the SFrame header.
 - (sashiko) Moved header size check to take place before any header
   fields are checked, to ensure safe memory access. Also dropped the
   (header + auxiliary) size helper, since non-zero auxiliary size is
   not currently supported.
 - Dropped unused userspace section tracking functions
   sframe_add_section(), sframe_remove_section(), free_section()
 - Dropped text_start/text_end section fields, since kernel/module
   section boundaries can be examined directly without saving.
 - Squashed in changes adding vmlinux-tracking kernel_sfsec and
   init_sframe_table(), to read vmlinux .sframe header at boot time.
---
 MAINTAINERS               |  1 +
 arch/arm64/kernel/setup.c |  2 +
 include/linux/sframe.h    | 32 ++++++++++++++++
 kernel/unwind/Makefile    |  3 +-
 kernel/unwind/sframe.c    | 80 +++++++++++++++++++++++++++++++++++++++
 kernel/unwind/sframe.h    | 78 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/sframe.h
 create mode 100644 kernel/unwind/sframe.c
 create mode 100644 kernel/unwind/sframe.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c1c95979e437..eaa691abd7a2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28519,6 +28519,7 @@ M:	Josh Poimboeuf <jpoimboe@kernel.org>
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
index eae37bea54fdb..c5f9f8124564e 100644
--- a/kernel/unwind/Makefile
+++ b/kernel/unwind/Makefile
@@ -1 +1,2 @@
- obj-$(CONFIG_UNWIND_USER)	+= user.o deferred.o
+ obj-$(CONFIG_UNWIND_USER)		+= user.o deferred.o
+ obj-$(CONFIG_UNWIND_SFRAME_LOOKUP)	+= sframe.o
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
new file mode 100644
index 0000000000000..5f49f05e6226d
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
+	if (fres_start < fdes_end || fres_end > sec->sframe_end) {
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
2.55.0.1082.g2b9226bbc0-goog


