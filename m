Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E450C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/HTxEZqZcqCwShvGdM3eA0fWGvVAu5JcH2SiIADZmE=; b=UDwuSfjpbA2u8lHDWMu4TquMtC
	I8/BD/s3HSGwU7ybo+LOMubRBg1Y4e4VM0jXPVZu/oCBsRzgNdQ5dZ7/MxCOQTZx9wPEPzGy1jJYQ
	M2wq8cC1IW5p1Xi2n90Eksl0JcmN32l9/+izQhxwQIro2fCzvTuUkHlR/C2edXnML1XWefq+sEPmT
	YEhJiL9pxI8Dld250nmB3wwnTlzfvUQXyDNAPST1WLUUzgWFSnb+ixx2Zldrh4nGRxO6LarDEJc0v
	KMLE6KYW2DYzRFbPN3U7nCRN5+wQjVHa72MQ8N8SkFjq2Gf4jOHEiJMRmE3F6jWmlYmvV7nkoZWVI
	aXRBrsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7oL-00000001Kqv-4Aoe;
	Mon, 03 Mar 2025 15:34:29 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dY-00000001IC2-3jbh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so43690745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015399; x=1741620199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/HTxEZqZcqCwShvGdM3eA0fWGvVAu5JcH2SiIADZmE=;
        b=PFInnqXCdvi3sHY3O9e1tc0n+WJZlZwGOAT8s0lEN+hmIU8KXfxMyvxyEVM8GU4Ops
         A3wIgoSJdNXEdOLtr7+axtyAMhB4f0+IuJWlctAaL2mE2ebcRc3ZkZKABqJiGgDaCnPN
         Px67/l4Y0LiiCKXTbypzGr1pqtHqFALooOzT5QfWcOiLReWmREOerrVsqg8jDh4Se9mE
         vw/HYjuA7Vg7xoEA3sUUC9bNWhXgZ2U15Skx5vSrAHdupwFuhYWGOesL6jVjTIm4ebvK
         9A8SQqlZccTqKdXDPwNZmZCCmNThBDiYKKYiMIL3W/kufMfrvUKd0QpY4ZPTePPU22vq
         Odcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015399; x=1741620199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/HTxEZqZcqCwShvGdM3eA0fWGvVAu5JcH2SiIADZmE=;
        b=r7/4/TXfW3qC/vG2egWaMXckLHrBOwSqWYLEr31bOrmeQhVlQZj9jao3YQgHY4b6/o
         06pvedtYEJ7DgR6IIbzTjEBKV0za1IV3uBRDy9ssofh7Khm9Wh5fxtsibSWEJ8x3nMXH
         paAPiWTOWWwTX9IwQU5IJcDUCKVGMoAOIXINUOAxqxlvGI7iveTSR1EFh7Bbwylp04RT
         fT0zt1Q1P9dAc3cqV+TdkuUZRC9Hpn2lOLztb7SmRgASCFt2jwugIRrlw1vvUBnQ/zug
         L5Srmkbrylo+mzLR6f8ZyFBqBZasOUbFzWM7dsjxjvhrIdB5eKiMQkjENOQShFk4Xk39
         /R3w==
X-Forwarded-Encrypted: i=1; AJvYcCURz2BvNm6HRJS9liLc9rAeRvfEwI2alMku6xw0YOCRo+8oW7B5ecRemK3tzxTTBuGlWD7nYmNOUeZCocJwuarx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7tiEJKDrCcWXlc33gLKxkDyX0v3UPsGYKoriZFGRYFz8OEJlE
	Me6VaCwW3GiwhaHYt8ExwYf9k+46UUijYiU6/r7L6/3tpv3d99v3VYD0eW/jdGo=
X-Gm-Gg: ASbGncuoP85iR1Ixzmu8Xk5dz7tp3WgdrlL7XyqIj2T7FsQ/2r26htR7ybi+q1rCja9
	hVdKpM2yfUoc6Zsa6k7q/Ptn72/Y4KGmPakwZLondogSHlnLDr4+agkYrTQC3G1CnTKadqyHiu6
	58bsHT9jMYDTRmVUvTVKT9Cm9s8nsS5W7xEQQlYRhcNFDLNOsIzQJuD+yAUJ/dG4z1I4QnOnuU2
	zYeFKs2DsFzZKg1j0SEVaMeHL+PvgLyCTlyaG9dd81+wWxKP040UgnNPwyIdXA7TLuaeNxRYqGc
	pNrEtNA1ZHtRucJWJgHa8HetvyopiLAOYVc=
X-Google-Smtp-Source: AGHT+IEbsAZvJmITJ9ICif5ulCDnUNtcT3LryQIPvfnsjMgh8qRyST/7vsmVWTkT2yKdvlAmVbm5gQ==
X-Received: by 2002:a05:600c:138e:b0:439:9a43:dd62 with SMTP id 5b1f17b1804b1-43ba675a8fbmr94459815e9.24.1741015399077;
        Mon, 03 Mar 2025 07:23:19 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:4e::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bca26676esm4051765e9.8.2025.03.03.07.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:18 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v3 07/25] rqspinlock: Add support for timeouts
Date: Mon,  3 Mar 2025 07:22:47 -0800
Message-ID: <20250303152305.3195648-8-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4618; h=from:subject; bh=yvqL/a4hlJcETEVluNNRDX4NLx5YZM2izb98JHL7vqQ=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWW5YAHky9QnaXijfLpbPfmrcJbz9mGABaMN7Gq 0o42/62JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlgAKCRBM4MiGSL8RyhFZD/ 98oVQe8PFJhIllEShh4nhwUHn8NyXfjHgZA8EYD/afmXUtbe6cebWH5AkecePI/ENfeIJGVq2k75qO bvWe4RtiqLDWBsJl0E7U+s2KeDZ0DSk9f2WEvtzxSmCp/7UvUNNCppI/KwpLK+0e7hAe+GARXNg60S gvFuMulaOvXckRa9tpI+Hr6QKTNcN2LRmRExBXLd9T3LEoZTDJmyajfWO+Rfz5YU0g5KANdcy5e0qn GSzgVdRNgcSQOk3Zbp4619EukeKa9f23Tg02x5DCOUpx6mZ5nLqck/vFZ9oU8Webx+07h2RX91o2Kv TN1pq4jrCnQVVKWpOXrlnqPje97GpGVOCULGt1HNSZjpiEHi1aaxH6G0Y04RUnW0tHWAoxe7UDJk0o fCSuU0DhZpfltTY7/WE+Vf0bJFidSjLAaFUBjfaGSjVpQiuT/NaM6RgcLOAfFZ+kZKor4iNdDigsyS uMikiOXPVSq5YpOAmNxGz++xsEFagK0j1pVs6TqaC0dd7hKb57Ww60taY11XX+2jebXLUb/Ujov7TM eHo97ARRBCdiHc7+5UtfXPPw64OraEi2LfbonjvDU0tqtoL2yij/h7RNtLLUQP0RCqFJfuaR1AezSv BHNMKZgxnulhR86H/4dzv/v/FYXTwu9j3CZEhgrEpd9sdWsCL1hOwLpR5Hcg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072320_928474_395FD6F3 
X-CRM114-Status: GOOD (  23.78  )
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

Introduce policy macro RES_CHECK_TIMEOUT which can be used to detect
when the timeout has expired for the slow path to return an error. It
depends on being passed two variables initialized to 0: ts, ret. The
'ts' parameter is of type rqspinlock_timeout.

This macro resolves to the (ret) expression so that it can be used in
statements like smp_cond_load_acquire to break the waiting loop
condition.

The 'spin' member is used to amortize the cost of checking time by
dispatching to the implementation every 64k iterations. The
'timeout_end' member is used to keep track of the timestamp that denotes
the end of the waiting period. The 'ret' parameter denotes the status of
the timeout, and can be checked in the slow path to detect timeouts
after waiting loops.

The 'duration' member is used to store the timeout duration for each
waiting loop. The default timeout value defined in the header
(RES_DEF_TIMEOUT) is 0.25 seconds.

This macro will be used as a condition for waiting loops in the slow
path.  Since each waiting loop applies a fresh timeout using the same
rqspinlock_timeout, we add a new RES_RESET_TIMEOUT as well to ensure the
values can be easily reinitialized to the default state.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h |  6 +++++
 kernel/locking/rqspinlock.c      | 45 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index 54860b519571..96cea871fdd2 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -10,10 +10,16 @@
 #define __ASM_GENERIC_RQSPINLOCK_H
 
 #include <linux/types.h>
+#include <vdso/time64.h>
 
 struct qspinlock;
 typedef struct qspinlock rqspinlock_t;
 
 extern void resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
 
+/*
+ * Default timeout for waiting loops is 0.25 seconds
+ */
+#define RES_DEF_TIMEOUT (NSEC_PER_SEC / 4)
+
 #endif /* __ASM_GENERIC_RQSPINLOCK_H */
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 98cdcc5f1784..6b547f85fa95 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -6,9 +6,11 @@
  * (C) Copyright 2013-2014,2018 Red Hat, Inc.
  * (C) Copyright 2015 Intel Corp.
  * (C) Copyright 2015 Hewlett-Packard Enterprise Development LP
+ * (C) Copyright 2024 Meta Platforms, Inc. and affiliates.
  *
  * Authors: Waiman Long <longman@redhat.com>
  *          Peter Zijlstra <peterz@infradead.org>
+ *          Kumar Kartikeya Dwivedi <memxor@gmail.com>
  */
 
 #include <linux/smp.h>
@@ -22,6 +24,7 @@
 #include <asm/qspinlock.h>
 #include <trace/events/lock.h>
 #include <asm/rqspinlock.h>
+#include <linux/timekeeping.h>
 
 /*
  * Include queued spinlock definitions and statistics code
@@ -68,6 +71,45 @@
 
 #include "mcs_spinlock.h"
 
+struct rqspinlock_timeout {
+	u64 timeout_end;
+	u64 duration;
+	u16 spin;
+};
+
+static noinline int check_timeout(struct rqspinlock_timeout *ts)
+{
+	u64 time = ktime_get_mono_fast_ns();
+
+	if (!ts->timeout_end) {
+		ts->timeout_end = time + ts->duration;
+		return 0;
+	}
+
+	if (time > ts->timeout_end)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+#define RES_CHECK_TIMEOUT(ts, ret)                    \
+	({                                            \
+		if (!(ts).spin++)                     \
+			(ret) = check_timeout(&(ts)); \
+		(ret);                                \
+	})
+
+/*
+ * Initialize the 'spin' member.
+ */
+#define RES_INIT_TIMEOUT(ts) ({ (ts).spin = 1; })
+
+/*
+ * We only need to reset 'timeout_end', 'spin' will just wrap around as necessary.
+ * Duration is defined for each spin attempt, so set it here.
+ */
+#define RES_RESET_TIMEOUT(ts, _duration) ({ (ts).timeout_end = 0; (ts).duration = _duration; })
+
 /*
  * Per-CPU queue node structures; we can never have more than 4 nested
  * contexts: task, softirq, hardirq, nmi.
@@ -100,11 +142,14 @@ static DEFINE_PER_CPU_ALIGNED(struct qnode, rqnodes[_Q_MAX_NODES]);
 void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 {
 	struct mcs_spinlock *prev, *next, *node;
+	struct rqspinlock_timeout ts;
 	u32 old, tail;
 	int idx;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
 
+	RES_INIT_TIMEOUT(ts);
+
 	/*
 	 * Wait for in-progress pending->locked hand-overs with a bounded
 	 * number of spins so that we guarantee forward progress.
-- 
2.43.5


