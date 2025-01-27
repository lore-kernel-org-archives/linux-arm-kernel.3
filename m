Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57338C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 21:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFZXsTdloa5FzORw/CsOyUNbSmbFrEPnylJyQFApTRk=; b=WgHRzS77i84QmRH39h7UuvQ6tY
	9hbV0f6ABoV4jTC3RLW8xUtwpgcdz9jYcTSFCVIcs0x0aJKYdcjcOrKR52QklzwYZv8pUPVH3uCyz
	qNM8T2F6V3FL2iGvEn+p+WmHda+fdI83YWNAJyywTzJsHkT+nA0ZsJ55Nmi9Xvrb94cSOCYz/BMXK
	veHlE1qEPGxB5GqNqHJ06BaF56R5Vq6bhN+YNxSqiuI/ZZ0dGSUkXAEtpdsomDoffoiDeq+IPKd8w
	A+ASPz6N8wU5Exg3N+ozImrAzTUB8xyRdETkZT6UFp6ycpBatEIVZV7Vqa9LFmS0XENWyeiwDNRfx
	iQcUdQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWs8-00000003KY7-3ZmA;
	Mon, 27 Jan 2025 21:42:20 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWji-00000003JDM-18H1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 21:33:39 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2163dc0f689so144572375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738013617; x=1738618417; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mFZXsTdloa5FzORw/CsOyUNbSmbFrEPnylJyQFApTRk=;
        b=ul3T77Ou9GC/JBPD+vh5FEig8Je2Y5BTJxMwIOkwv0D/S54Qm2Oe2GGJSCehcNebd9
         tOkJ69CAaCbfdQQ0zDEXHZcgZaOUdYaJr5Ydi8HDTjiJQy/TAttEdn2yIMk5EZDw+bEQ
         CQb+PuTbE0sMOXRXKEva4zNbie1ifkDVvbmPxVSb1DMgsQEM6hW4JXSqCxSPfA3OdCZ6
         K0UKSr8li5XY88MOYS9BhrXrAxO9Pk12Zp5G9VtvdsEDIc0vaA08RKFLdDXrC04yEp4e
         4cfHkr8AZkLqKlaTP2pEh+HqVgLN/X8c198L/CWKYAlwbMJgxWWNt9sIG9mR0+TKeiZf
         /+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738013617; x=1738618417;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFZXsTdloa5FzORw/CsOyUNbSmbFrEPnylJyQFApTRk=;
        b=fdxJz92B944cPtdZpX0Snyhb99Ih9DLqpoEObRp6gGi75GCyLKfeXZfa+M9IqyFdWO
         AVNFPGy+KMNKSO0+V80jzvDGEeQOt3pybZZQUpjKdWdzZBJRd5ic4R9A2pB/ZVXYXAR3
         g/1DSRvOO3GPqLl9Z59XdAdKmitSzb/bKkvpHEWJ3VRMF+vHVFBpxeGemEEzmYhxZmhC
         q/IYe2xfb5OZJS3oMvkbg5e7xcG2ZMre9OzUBf276kiNpfwerIEntbgBJ7K9UKpudAah
         wp1Vmka8CiA88tILrzaaxO4Kgalz3qhZfRW7vq1ZfG5rdDEuUl5UGpUHbhiugFL5I/Rs
         pijQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgRgR9/o3QSO9UrE68qQv94uo5PBYbvJSD6ADtDK82UiGD5YEQg040gSXYEoHrt4weekktBHE9Hev4HTX0FMey@lists.infradead.org
X-Gm-Message-State: AOJu0YwJX/ZxvssbTsdxJiLaBWWx0sx2XvIsu6TormV/OdPEvoHuDAgg
	5sGyRIefGAdGa/IhuX/0HVfJTvtnZeHhLEpmCTAoeevPUI/4MBdotzlJ5gjAzOghfg3NS26RDQ=
	=
X-Google-Smtp-Source: AGHT+IENha76YNN6DTFkO6aZG4PVMEo+T4QLkeiQTYtMA7zB4aNyty+JXRxi3cxPQYVRs4yLEbvYOf/KmQ==
X-Received: from pfbbx20.prod.google.com ([2002:a05:6a00:4294:b0:729:14f9:2f50])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:12c6:b0:1e0:e000:ca60
 with SMTP id adf61e73a8af0-1eb215ec22fmr70877628637.28.1738013617138; Mon, 27
 Jan 2025 13:33:37 -0800 (PST)
Date: Mon, 27 Jan 2025 21:33:07 +0000
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
Mime-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127213310.2496133-6-wnliu@google.com>
Subject: [PATCH 5/8] unwind: arm64: Add sframe unwinder on arm64
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
X-CRM114-CacheID: sfid-20250127_133338_312338_CFF35A12 
X-CRM114-Status: GOOD (  18.72  )
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

Add unwind_next_frame_sframe() function to unwind by sframe info.
Built with GNU Binutils 2.42 to verify that this sframe unwinder can
backtrace correctly on arm64.

Signed-off-by: Weinan Liu <wnliu@google.com>
---
 arch/arm64/include/asm/stacktrace/common.h |  4 ++
 arch/arm64/kernel/setup.c                  |  2 +
 arch/arm64/kernel/stacktrace.c             | 59 ++++++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/arch/arm64/include/asm/stacktrace/common.h b/arch/arm64/include/asm/stacktrace/common.h
index 821a8fdd31af..19edae8a5b1a 100644
--- a/arch/arm64/include/asm/stacktrace/common.h
+++ b/arch/arm64/include/asm/stacktrace/common.h
@@ -25,6 +25,7 @@ struct stack_info {
  * @stack:       The stack currently being unwound.
  * @stacks:      An array of stacks which can be unwound.
  * @nr_stacks:   The number of stacks in @stacks.
+ * @cfa:         The sp value at the call site of the current function.
  */
 struct unwind_state {
 	unsigned long fp;
@@ -33,6 +34,9 @@ struct unwind_state {
 	struct stack_info stack;
 	struct stack_info *stacks;
 	int nr_stacks;
+#ifdef CONFIG_SFRAME_UNWINDER
+	unsigned long cfa;
+#endif
 };
 
 static inline struct stack_info stackinfo_get_unknown(void)
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 4f613e8e0745..d3ac92b624f3 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -32,6 +32,7 @@
 #include <linux/sched/task.h>
 #include <linux/scs.h>
 #include <linux/mm.h>
+#include <linux/sframe_lookup.h>
 
 #include <asm/acpi.h>
 #include <asm/fixmap.h>
@@ -377,6 +378,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 			"This indicates a broken bootloader or old kernel\n",
 			boot_args[1], boot_args[2], boot_args[3]);
 	}
+	init_sframe_table();
 }
 
 static inline bool cpu_can_disable(unsigned int cpu)
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 1d9d51d7627f..c035adb8fe8a 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -14,6 +14,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/stacktrace.h>
+#include <linux/sframe_lookup.h>
 
 #include <asm/efi.h>
 #include <asm/irq.h>
@@ -242,6 +243,53 @@ kunwind_next_frame_record(struct kunwind_state *state)
 	return 0;
 }
 
+#ifdef CONFIG_SFRAME_UNWINDER
+/*
+ * Unwind to the next frame according to sframe.
+ */
+static __always_inline int
+unwind_next_frame_sframe(struct unwind_state *state)
+{
+	unsigned long fp = state->fp, ip = state->pc;
+	unsigned long base_reg, cfa;
+	unsigned long pc_addr, fp_addr;
+	struct sframe_ip_entry entry;
+	struct stack_info *info;
+	struct frame_record *record = (struct frame_record *)fp;
+
+	int err;
+
+	/* frame record alignment 8 bytes */
+	if (fp & 0x7)
+		return -EINVAL;
+
+	info = unwind_find_stack(state, fp, sizeof(*record));
+	if (!info)
+		return -EINVAL;
+
+	err = sframe_find_pc(ip, &entry);
+	if (err)
+		return -EINVAL;
+
+	unwind_consume_stack(state, info, fp, sizeof(*record));
+
+	base_reg = entry.use_fp ? fp : state->cfa;
+
+	/* Set up the initial CFA using fp based info if CFA is not set */
+	if (!state->cfa)
+		cfa = fp - entry.fp_offset;
+	else
+		cfa = base_reg + entry.cfa_offset;
+	fp_addr = cfa + entry.fp_offset;
+	pc_addr = cfa + entry.ra_offset;
+	state->cfa = cfa;
+	state->fp = READ_ONCE(*(unsigned long *)(fp_addr));
+	state->pc = READ_ONCE(*(unsigned long *)(pc_addr));
+
+	return 0;
+}
+#endif
+
 /*
  * Unwind from one frame record (A) to the next frame record (B).
  *
@@ -261,7 +309,15 @@ kunwind_next(struct kunwind_state *state)
 	case KUNWIND_SOURCE_CALLER:
 	case KUNWIND_SOURCE_TASK:
 	case KUNWIND_SOURCE_REGS_PC:
+#ifdef CONFIG_SFRAME_UNWINDER
+	err = unwind_next_frame_sframe(&state->common);
+
+	/* Fallback to FP based unwinder */
+	if (err)
 		err = kunwind_next_frame_record(state);
+#else
+	err = kunwind_next_frame_record(state);
+#endif
 		break;
 	default:
 		err = -EINVAL;
@@ -347,6 +403,9 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 		.common = {
 			.stacks = stacks,
 			.nr_stacks = ARRAY_SIZE(stacks),
+#ifdef CONFIG_SFRAME_UNWINDER
+			.cfa = 0,
+#endif
 		},
 	};
 
-- 
2.48.1.262.g85cc9f2d1e-goog


