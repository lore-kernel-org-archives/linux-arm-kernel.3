Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFACCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUzzgJKkl0P/3X8X9a5rV9yuKwhvvL6DGpxGAltkfZU=; b=QYp2YNZ/tQTCsAhOF9Em0naycB
	iknDAFesW0MohFQj+gq6ao2c0OBuQ1Q9HBzgvXT8MvbhCJQtgPTx8zuRqRsGWUa69tRyG0xYf0Zov
	Z8TtXmwLWvOyBcHJQg+Idlq7oZ3XDI9o8O1TI15+yPyeTtJgBsZX4/j43xSDrIgr3CPQD8iPe10Tz
	B7zn5ZxafCUjd6C4corFn8kDDyJUbaWR5K41/bLnd0f5b6Mk9pY1huV6D89seGJRBfk1tJkBsj/H3
	A5ttBjBtxbPMT0LKQWucjw+3PNRaGwPBcqtllCm0/YDri8wn0nWO9P7ah4Xrcd2NA0qpAKOba2lSc
	+8HTPTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ49-00000002N0n-3chQ;
	Wed, 07 Oct 2026 11:44:09 +0000
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ42-00000002Mso-49mH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:44:08 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-3a4b70941efso3145728a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373441; x=1791978241; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUzzgJKkl0P/3X8X9a5rV9yuKwhvvL6DGpxGAltkfZU=;
        b=r1m/e9U7EoeCddgm5ALEZ4gCROLT0O0uL4kMPMlAkj1bxO6VQlBv69DYwuQGswfZFv
         mzTcEl2EPCvMAqJjqI5dSSdmpc4IoP4n+aFyasHTB726druhIWI1Hcv6Tau852gC88xV
         jUx7mKQlhhRn0VAPoWe790TjyU6Ap1gN7PUUC+lxml9fYjAw9rwoM0GjEgO6M1skLHmD
         u4in/dcdrK/yLAsqxuAE6ODxL6QZabJM/DUBreV1rE+sh6mbuMFIZNERzL05qzFPSE39
         +d97XCjg/50M0b1qJf1DKHla0rD8y0ip6AFVwJpVWIQcCsUA3Kq75q7qgANfRUcj75Ya
         7q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373441; x=1791978241;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUzzgJKkl0P/3X8X9a5rV9yuKwhvvL6DGpxGAltkfZU=;
        b=CsCA5kTqoiN1gSB0WBmFJ1bv27V/nPXelydc6nnp91xaFtHTSBUDszYeM2dbkwwAlc
         4+59ZYoA0JXbr8a5UwhsogUoAxtj28PVdn85agUxLJFp09ewee+zrMm/7o5fcH+9lBdl
         b+TSMr5OOtUI3u8HjGvVF2TuBHNBOJ+7Zf+pNti36EmfjL40SSJZVIezPv1cP955Niw8
         r3mFtNCwmZl7zCUxLz2ANqkipzjaJJob7Eh0crzgP7tQcb0m7+S3mI7Rrm6PHkq0gv8i
         WSRIbmzETACM+pv9iIEWUs+gifFRuqLP3liw+J3WiPJX9Y2Ty20yCP776L8J239nY0br
         Mrrw==
X-Forwarded-Encrypted: i=1; AKwUvBxMU8y5bmup+HgQeS7/Ftu3+pnjFnwGazIa12wKhDhgRuJt+eCpUVmKnPq20qP7JR/cYQN3LYiZI8UfS6A3KKhO@lists.infradead.org
X-Gm-Message-State: AFq9FYLdHpcH/t3UcJN2eGclEHi64+WAXq7UkpOV7h/nYDQ1MPOwjtgp
	xyZDiMhSVCuMi+O0SXMBX6y8itobb4WIqAzgcPfifGBeUsx3X1uHWMcqogMqPorQyMHVCqA740+
	A1kPmt3l2gJyIPKnUKNegpXCHUg==
X-Received: from pgbj17-n1.prod.google.com ([2002:a05:6a02:61d1:10b0:cd0:bb2c:3923])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c8c:b0:3a4:fe48:d412 with SMTP id 98e67ed59e1d1-3a8a19ba137mr1514102a91.30.1791373441003;
 Wed, 07 Oct 2026 04:44:01 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:32 +0000
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-9-dylanbhatch@google.com>
Subject: [PATCH v8 08/11] sframe: Add .sframe validation option
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
X-CRM114-CacheID: sfid-20261007_044403_087428_74FA923A 
X-CRM114-Status: GOOD (  18.49  )
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

Add a debug feature to validate all .sframe sections when first loading
the file rather than on demand.

[ Jens Remus: Add support for SFrame V3.  Add support for PC-relative
FDE function start offset.  Adjust to rename of struct sframe_fre to
sframe_fre_internal.  Use %#x/%#lx format specifiers. ]

[ Dylan Hatch: Adapt this patch for in-kernel sframe sections. ]

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Reviewed-by: Indu Bhagat <ibhagatgnu@gmail.com>
Co-developed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Co-developed-by: Dylan Hatch <dylanbhatch@google.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/Kconfig           | 18 ++++++++++
 kernel/unwind/sframe.c | 78 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index cc59a5da80915..20aa63c93a0e2 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -538,6 +538,24 @@ config HAVE_UNWIND_KERNEL_SFRAME
 	  practice, this can provide more reliable stacktrace results than
 	  unwinding with frame pointers alone.
 
+config SFRAME_VALIDATION
+	bool "Enable .sframe section debugging"
+	depends on UNWIND_SFRAME_LOOKUP
+	depends on DYNAMIC_DEBUG
+	help
+	  When adding an .sframe section for an object, validate the entire
+	  section immediately rather than on demand.
+
+	  This is a debug feature which is helpful for rooting out .sframe
+	  section issues.  If the .sframe section is corrupt, it will fail to
+	  load immediately, with more information provided in dynamic printks.
+
+	  This has a significant page cache footprint due to its reading of the
+	  entire .sframe section for every loaded module.  Not recommended for
+	  general use.
+
+	  If unsure, say N.
+
 config HAVE_PERF_REGS
 	bool
 	help
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 2e8ff783de7d8..62c22ca70614a 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -15,6 +15,7 @@
 #include <linux/kallsyms.h>
 #include <asm/kprobes.h>
 #include <asm/sections.h>
+#include <asm/unwind_sframe.h>
 
 #include "sframe.h"
 #include "sframe_debug.h"
@@ -503,6 +504,73 @@ noinstr int sframe_find(unsigned long ip, struct unwind_frame *frame)
 }
 NOKPROBE_SYMBOL(sframe_find);
 
+#ifdef CONFIG_SFRAME_VALIDATION
+
+static int sframe_validate_section(struct sframe_section *sec)
+{
+	unsigned long prev_ip = 0;
+	unsigned int i;
+
+	for (i = 0; i < sec->num_fdes; i++) {
+		struct sframe_fre_internal *fre, *prev_fre = NULL;
+		unsigned long ip, fre_addr;
+		struct sframe_fde_internal fde;
+		struct sframe_fre_internal fres[2];
+		bool which = false;
+		unsigned int j;
+		int ret;
+
+		ret = __read_fde(sec, i, &fde);
+		if (ret) {
+			dbg_sec(sec, "__read_fde(%u) failed\n", i);
+			return ret;
+		}
+
+		ip = fde.func_addr;
+		if (ip <= prev_ip) {
+			dbg_sec(sec, "FDE %u not sorted\n", i);
+			return -EFAULT;
+		}
+		prev_ip = ip;
+
+		fre_addr = sec->fres_start + fde.fres_off;
+		for (j = 0; j < fde.fres_num; j++) {
+			int ret;
+
+			fre = which ? fres : fres + 1;
+			which = !which;
+
+			ret = __read_fre(sec, &fde, fre_addr, fre);
+			if (ret) {
+				dbg_sec(sec, "FDE %u: __read_fre(%u) failed\n", i, j);
+				return ret;
+			}
+			ret = __read_fre_datawords(sec, &fde, fre);
+			if (ret) {
+				dbg_sec(sec, "FDE %u: __read_fre_datawords(%u) failed\n", i, j);
+				return ret;
+			}
+
+			fre_addr += fre->size;
+
+			if (prev_fre && fre->ip_off <= prev_fre->ip_off) {
+				dbg_sec(sec, "FDE %u: FRE %u not sorted\n", i, j);
+				return -EFAULT;
+			}
+
+			prev_fre = fre;
+		}
+	}
+
+	return 0;
+}
+
+#else /*  !CONFIG_SFRAME_VALIDATION */
+
+static int sframe_validate_section(struct sframe_section *sec) { return 0; }
+
+#endif /* !CONFIG_SFRAME_VALIDATION */
+
 static int sframe_read_header(struct sframe_section *sec)
 {
 	unsigned long header_end, fdes_start, fdes_end, fres_start, fres_end;
@@ -564,6 +632,11 @@ void __init init_sframe_table(void)
 		return;
 	}
 
+	if (sframe_validate_section(&kernel_sfsec)) {
+		pr_warn("invalid vmlinux SFrame section\n");
+		return;
+	}
+
 	sframe_init = true;
 	dbg_print_header(&kernel_sfsec);
 }
@@ -624,6 +697,11 @@ void sframe_module_init(struct module *mod, void *addr, unsigned int size)
 	}
 	sframe_sort_fdes(sec);
 
+	if (sframe_validate_section(sec)) {
+		pr_warn("invalid SFrame section in module %s\n", mod->name);
+		return;
+	}
+
 	/* Ensure SFrame is initialized when sframe_find() happens */
 	smp_store_release(&mod->sframe_init, true);
 	dbg_print_header(sec);
-- 
2.56.0.360.g66cac248cb-goog


