Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7561C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 21:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrEAyoRWIZk//3vjAjFd2Tppwtrq4EACKZ1CutvRWx8=; b=uFhY7nBhPp2588vftiCrKiZ9+8
	jXx/At3w/mOpmFhrJtw5rX7DFYCiidQoVzMggcI+l7HKY2P5SAt4mNnYFZPXD4nXzHzFfa67TGwNF
	MEzYGTLN16LpGsFFmtyZPluYDJ5I/8/SonFZ0M0i9fCRBBWZhvsmmVv4ssorZDOlPzrZMN+uFn20g
	xoddWya5YIk6bZ1bpIZoqFXqR94VCWXY/bIxYgqRTj/FgizOIjjNaZjS+AYQtec4N48VLBLrw19Fm
	v28uUUqSNpA06A8HQOdVC1OpbFYWmquqKxglimBwdxCmiKazEiGU3P2jHcmLl27jIkqbfrBU3oO9o
	qLcwv9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWul-00000003Kxc-0q8F;
	Mon, 27 Jan 2025 21:45:03 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWjm-00000003JH7-2ig1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 21:33:43 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2163dc0f689so144574015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738013622; x=1738618422; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rrEAyoRWIZk//3vjAjFd2Tppwtrq4EACKZ1CutvRWx8=;
        b=h5Y+tORcSjx6t6KNVPOWwVGtFTGgO1v80jEz3sLv+hCSnIJAfyyapwVskgXw8djdHJ
         tRuoZA8bkhcU9ZhzVYM267ik4CuotgaLvBhY5vI1gdfiUc+VnLgXIMvdcbTHo4uGFR2T
         PjYenWfZuOwV7LV2t4fWiN/vt1GrpPQXd75xs+AsdVJpvJYm+XsUb1uoeR+3cw6kuwNh
         W453UX5HV/zC1A1sekIO5HiUMcnHztVlQH9ek/FKi+mpeO2gum+w8rIKPh3gVOfXmxSp
         kRe7tHJqg6y6aDCeKTgItDtpzwIw0ckolMeoCgNjdtYn2eV5m9P3B2VlL1WPJwaSeLbL
         VEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738013622; x=1738618422;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rrEAyoRWIZk//3vjAjFd2Tppwtrq4EACKZ1CutvRWx8=;
        b=guw2/cnzVSyS7fPx6q2bbS9NY/Gite3q0wgztQ2kTCctOsSY01LaCIPDsf2vpStuTa
         ayUxnfM/AlJfkVTElZhDjXRcAU8MwvO5goR7QqQJdV97sQt6YFnLhr/UXfVHKYZq96Im
         Tz7t3lRKpATzDvIYGhwIp1h/d+TAgPkaPc/eyTrrS43LbtigTaIWKxocgJznrmWce3Ra
         kwno06e9PUea5BTTXH2Tos6TajJzbrzdmDQCQk0RWXQswSeMuASv0bm+qrSKjeQ9njsa
         ISnrAgNwXq+pB0/FJGR50k3jzwtmYWzb+TcNbhdwgr5j5hqiNddyihsDGT0BWHd12RLn
         pOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR0hCfGcXf4jly/YvCjXi0HruJtpTmIkMIAbVSt0pNa9R4mn/sypFgopYm7Q8i5bgagFcfv5VbHk4hgqqUfp/1@lists.infradead.org
X-Gm-Message-State: AOJu0YxGNttNtGi64H5K6E510sAUA1xM+3apnq8j6+ewUht1gCeMm7IF
	XkwzbqiVXVsakeE035vMLCkOJ9TgfnXkG9VF5BQ4o5gg6M6qiiQvkYcn0ZWJ5BJeU/ybbwJ7Qw=
	=
X-Google-Smtp-Source: AGHT+IFFYVquifAUjWGrSZ5hEYAV0U5je02EgbAStisFUtw2EXTxIW8KfHqT+GqGJXHAuJ9zxlbXu/WPRQ==
X-Received: from plblq6.prod.google.com ([2002:a17:903:1446:b0:215:515c:124e])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2d2:b0:215:b01a:627f
 with SMTP id d9443c01a7336-21c352de4c0mr685131525ad.4.1738013621760; Mon, 27
 Jan 2025 13:33:41 -0800 (PST)
Date: Mon, 27 Jan 2025 21:33:09 +0000
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
Mime-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127213310.2496133-8-wnliu@google.com>
Subject: [PATCH 7/8] arm64: Define TIF_PATCH_PENDING for livepatch
From: Weinan Liu <wnliu@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, 
	Suraj Jitindar Singh <sjitindarsingh@gmail.com>, Weinan Liu <wnliu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_133342_691838_BBAC99C1 
X-CRM114-Status: GOOD (  14.55  )
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

From: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>

	- Define TIF_PATCH_PENDING in arch/arm64/include/asm/thread_info.h
	  for livepatch.

	- Check TIF_PATCH_PENDING in do_notify_resume() to patch the
	  current task for livepatch.

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Signed-off-by: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
Signed-off-by: Weinan Liu <wnliu@google.com>
---
 arch/arm64/include/asm/thread_info.h | 4 +++-
 arch/arm64/kernel/entry-common.c     | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 1114c1c3300a..3810c2f3914e 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -64,6 +64,7 @@ void arch_setup_new_exec(void);
 #define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
 #define TIF_MTE_ASYNC_FAULT	5	/* MTE Asynchronous Tag Check Fault */
 #define TIF_NOTIFY_SIGNAL	6	/* signal notifications exist */
+#define TIF_PATCH_PENDING	7	/* pending live patching update */
 #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
 #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
 #define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
@@ -99,11 +100,12 @@ void arch_setup_new_exec(void);
 #define _TIF_MTE_ASYNC_FAULT	(1 << TIF_MTE_ASYNC_FAULT)
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_TSC_SIGSEGV	(1 << TIF_TSC_SIGSEGV)
+#define _TIF_PATCH_PENDING	(1 << TIF_PATCH_PENDING)
 
 #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
 				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
 				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
-				 _TIF_NOTIFY_SIGNAL)
+				 _TIF_NOTIFY_SIGNAL | _TIF_PATCH_PENDING)
 
 #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index b260ddc4d3e9..b537af333b42 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -8,6 +8,7 @@
 #include <linux/context_tracking.h>
 #include <linux/kasan.h>
 #include <linux/linkage.h>
+#include <linux/livepatch.h>
 #include <linux/lockdep.h>
 #include <linux/ptrace.h>
 #include <linux/resume_user_mode.h>
@@ -144,6 +145,9 @@ static void do_notify_resume(struct pt_regs *regs, unsigned long thread_flags)
 				       (void __user *)NULL, current);
 		}
 
+		if (thread_flags & _TIF_PATCH_PENDING)
+			klp_update_patch_state(current);
+
 		if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 			do_signal(regs);
 
-- 
2.48.1.262.g85cc9f2d1e-goog


