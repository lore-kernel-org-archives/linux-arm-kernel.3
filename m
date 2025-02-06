Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCC4C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vg5Aj/VI1QlQmysdMT47W3wgHFqoKVdLw8Vt35/615c=; b=x9KC2nYZRPb3HIZaLGKJkKShG8
	2H+Ho0822evneUNhOar0M1IHZCxGU58wT0WLVs0wVOUiEsCL1iunhS/EPo+jkCJe/cRlnRq2TEwhq
	aOZ9Bd5jZGZPzWwadl61rIds/xeH2SOKtzQFwHEzJkuC2kRTvNftv9vcg7XPUqCBKOOy+V7l9Tp2C
	f5le4USnOWtIo7EOkIvKEeIYmjslH+aDUjV5uV4juCtOMHxK3arQvs/e6kX/AQ+DqjRPe/5CC9Fq6
	S7MJuGMq5JHZLSBrAb5U1MqBW6p7MYa79JM5ay0eO/yww3D3M2C+KEvBZ9pFspdrqrQwKALjZVzAP
	KWK2IESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzhb-000000063rZ-3mkf;
	Thu, 06 Feb 2025 11:05:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzWy-000000061Xi-08RL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so349114f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839286; x=1739444086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vg5Aj/VI1QlQmysdMT47W3wgHFqoKVdLw8Vt35/615c=;
        b=hd2YCP5xFTzr7uDdiN39YSx2JM+sCdNAWc3JTWUlB8b9uxr1/iJEKTQGzBtHWT39dZ
         hMAJEwrZ5vjEAePgksU+oai3XnvL5PGrW6qpRGWyOZlXKIduwBVoVbMKZI1Gd6KMJdGr
         WTPKJnCJ3/+DqNRy8RF8fxOA+bvO4YRKJQl97d+2lVrEhEVK9ZhVIqFrvk/UcusHVGdg
         Q0GNynhEGwia2KdU5BO2JFqx20GhaNyXsdmGO/0wdLqI5Ble6GY0EdxTbKtyY2/JUtMN
         /dEEbWW1nXxNidyzDgRUgLM54cJTvgMf0ljkikAyT60oHQwouplHKXR0K+Lg2El7bxi3
         IcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839286; x=1739444086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vg5Aj/VI1QlQmysdMT47W3wgHFqoKVdLw8Vt35/615c=;
        b=lshfFGh/a5ifcTOcSeVWTrVZa7tWiDV0VausV4/ubcL+wCyq0TzV8cB9otItZdqfaR
         4SnJd3IPxfmvoUbY6RFtTU0LyMSsg+tjxRHCUa+8vua5Y5fqjh0AExPaPo2+bj2E6+a+
         qcdb/mXsV2lRzd+GFzaYVR+lYjaCR0tuQGYqIr6cKNcqypnYZTMhc2BbqsNe40Qe/KJU
         OCohf76rMn/VOhupdkrvgTLa0SDrsOb50WPBPyOV/gbgGisWWelgB43Mf6TO9b7XJHQ8
         vsd6ecrYgs2V51GuhYZyHPZtSOmSTFcZT8zZPi4W0+Fnnq2hwGnaUgjcvMIB/5XOA0q9
         SaYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2e6D51WtXAzEUFbBVTh9cRxNL89v/RosPH4hAQg7OOKgvQSxJSnkbBf0yUHboJdRnUdc5sYwnuANTIwo1pyB7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy89Rj45dxhpdu8WvfnR+uiB4lPzyBnofI5iebk6qpGh2YdZmyS
	5hJhRcSxzJW1hJk7UQapQB/RkMXs80xVGiMe9MXmuugtkZW88MS8
X-Gm-Gg: ASbGnctNUJo39lIwuPEP/Ejk0CcbAoWiWCQ4lty1S5ni7Sx0LT/r9foeBVLlAq2rkKv
	intOn+ZWcB2+Zs3lkQ3TYKeGa/GVH8dhG6l0OAEkE1SMLiCatgWqPxdBHe2OmKgr40vA5jWrTHq
	Ylk4VJbEvsp8dx6J+0v+26mJcTnsz+GrEqynljrNAzv87GUPE+bvcWQwPcUtJGFtFuKI3u5VG0a
	d/L+cOj+fnTAi6u0tZwAGuO/Q/iwPeMZX27wJXlJQvHJ7//GjYImDIlLFgIuNq3dLlEhV/vCqhx
	8i3u
X-Google-Smtp-Source: AGHT+IHYw/0AC8066ElVuaB+bONKwChfk8mv0EyRa3QvFZYateFuU3S3W5RTQoK6xFXLzRpsK0lELg==
X-Received: by 2002:a5d:64ec:0:b0:38c:1281:260d with SMTP id ffacd0b85a97d-38db48d5ef1mr4800897f8f.31.1738839286065;
        Thu, 06 Feb 2025 02:54:46 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:f::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1ddb9sm1383042f8f.84.2025.02.06.02.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:45 -0800 (PST)
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
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 07/26] rqspinlock: Add support for timeouts
Date: Thu,  6 Feb 2025 02:54:15 -0800
Message-ID: <20250206105435.2159977-8-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5055; h=from:subject; bh=+CI7RDk98Onq/s+jrg9zfcbapKjfoHyX6Gf/cOAFD9E=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRko56eerusglxFABuTrjI0BeTNdWet/EFfKlxx n6KicXiJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZAAKCRBM4MiGSL8RypHfD/ 9HHaEjSUQc5CtopQiXE6c0Vwac7KpTMW4wwJycT3bCu1KquGtKAhLC2KFqVX2wHK4bl/OLK9vxVSmT Y9HJRDo6MOTwwlMcflPNZ3sTdgVaOaqei2zDvi0fcuAdVHriJxcP1KZX+BOtNaX4oIBqMixlOnWT8n zk9/HR/PwfXvbdewufYQssneftjxoWOvuQQeFEhZlkhohK0wkeQGgYZ6x6dpnN/VU3PpQQVTbRQFDI q2nwG3DsniPReJ/kfk+KKkvpMIXwuCUQCswIjrMd6X+f8Gbx4HkDaoCK0jNJmLXz7x/qnXM7efk5aJ eNUrFK4ZNtavQLPKEs7/u1ksDubcrsL+PcEjSLPmM7S83+t6sEMMKte4jA9A3EhlIe3pOMdshKIwMZ ox0u8m96KQo3KwGtgfkm1xYVf6D/WMtXXhPzrlPQ9no39v7Bzx0BPhb1CwvoxQHGMvECHciFWXf1E1 lwy9QUGhK6aq/O7Wbf9dLtTyqUL22WhmoHXboRhy8E1Q5+h+jywgW08oMQ80fekxqIfrp7xeQuJxbs 6tUwh0BODBW6hRLhfkjt3Qu89gY3T/J/7YxiR5wbSV5A47TQLxdDH3gvALoDmdy9OiVYWlvfv6LgUD KhAG4jecaMw2SpR61+5VnBT3O5WvSYhyuAOcyVQLr68OWpdNT5LRRVSCKKDg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025448_063613_68D702EB 
X-CRM114-Status: GOOD (  25.45  )
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
waiting loop, that is passed down from the caller of the slow path
function.  Use the RES_INIT_TIMEOUT macro to initialize it. The default
timeout value defined in the header (RES_DEF_TIMEOUT) is 0.5 seconds.

This macro will be used as a condition for waiting loops in the slow
path.  Since each waiting loop applies a fresh timeout using the same
rqspinlock_timeout, we add a new RES_RESET_TIMEOUT as well to ensure the
values can be easily reinitialized to the default state.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h |  8 +++++-
 kernel/locking/rqspinlock.c      | 46 +++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index 54860b519571..c89733cbe643 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -10,10 +10,16 @@
 #define __ASM_GENERIC_RQSPINLOCK_H
 
 #include <linux/types.h>
+#include <vdso/time64.h>
 
 struct qspinlock;
 typedef struct qspinlock rqspinlock_t;
 
-extern void resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
+/*
+ * Default timeout for waiting loops is 0.5 seconds
+ */
+#define RES_DEF_TIMEOUT (NSEC_PER_SEC / 2)
+
+extern void resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout);
 
 #endif /* __ASM_GENERIC_RQSPINLOCK_H */
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 52db60cd9691..200454e9c636 100644
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
@@ -68,6 +71,44 @@
 
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
+ * Initialize the 'duration' member with the chosen timeout.
+ */
+#define RES_INIT_TIMEOUT(ts, _timeout) ({ (ts).spin = 1; (ts).duration = _timeout; })
+
+/*
+ * We only need to reset 'timeout_end', 'spin' will just wrap around as necessary.
+ */
+#define RES_RESET_TIMEOUT(ts) ({ (ts).timeout_end = 0; })
+
 /*
  * Per-CPU queue node structures; we can never have more than 4 nested
  * contexts: task, softirq, hardirq, nmi.
@@ -97,14 +138,17 @@ static DEFINE_PER_CPU_ALIGNED(struct qnode, qnodes[_Q_MAX_NODES]);
  * contended             :    (*,x,y) +--> (*,0,0) ---> (*,0,1) -'  :
  *   queue               :         ^--'                             :
  */
-void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
+void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout)
 {
 	struct mcs_spinlock *prev, *next, *node;
+	struct rqspinlock_timeout ts;
 	u32 old, tail;
 	int idx;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
 
+	RES_INIT_TIMEOUT(ts, timeout);
+
 	/*
 	 * Wait for in-progress pending->locked hand-overs with a bounded
 	 * number of spins so that we guarantee forward progress.
-- 
2.43.5


