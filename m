Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0670BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VRGS9P+jyMhEgNXbehIAgq9LwV+0ThEZLQ6VCSjK78=; b=Timk0yNEwg1oFR4sYYucB4QaI9
	9tHZwsY5ZevOEM/9vDINgNllNeyZzJ/6TtdfTNTVqv3Yfb7cELDQbyn8zV42mzlqzf0FdIUJBC8W3
	fZHC9pyH/fPC/rDix87su4KXfFsLrKBFBLETIyFjX2G4gl/Yoxxmu2vZFxGJVgYBdba8IWm7uHnPJ
	kO5B8bz2YYfUTu7UQkzxx90CGOIc8CrBe/o/BloNmBoQfxGvCSbxVWlrp+jyBMff9eUfQ8hyAuIRw
	VKiYutu/Tnoyn/VnnvSO2yHtu2xh6syl/hA0kEuixqerx4ahW7i5E4rrBEkHhbdK9sY68zT87Hvel
	zkuLs86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfTB-0000000HEW4-2dLz;
	Sun, 16 Mar 2025 04:19:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfG5-0000000HCDG-23Sh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:05:55 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-43d0782d787so6681555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097952; x=1742702752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VRGS9P+jyMhEgNXbehIAgq9LwV+0ThEZLQ6VCSjK78=;
        b=HJhSVnsYONOaGBznqQUin7l5Ez07ojlRBci0clKpcC1ttRqhCBM5bB55wDsWh77nZ0
         17rMzj7X6BPzDdxVQ+pgv6k1YWOi6RoTVDBMkY85zkQmvFatx3xrVN0qXMr/9P5HFb/C
         iOqLsjJad+xBq1N1NTXajplrionPjWnHZuD305mPC+iw2Jw8buJdB7mJRGe5hlowqF0s
         5SL/r58mGy6rklEMmt8FRKQtmdaL0CVtAkCq63NtbbkDk5oAxF4nyNqPdDqfkx6Aobun
         hU2eFXJXB2y+AHVk7PoBtrPPeFMiwFbXf3yCmE16GsZ0fDakgze8ITUzru6UEUCuGuFu
         iRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097952; x=1742702752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VRGS9P+jyMhEgNXbehIAgq9LwV+0ThEZLQ6VCSjK78=;
        b=D11KJGloRxlUaxtrOjr4bM6Xb1r3EtKVzH4cyzzNR/ZrLUW2c4dqf54294Xrr1iiEg
         p5bgh2ZtmKfFZbcecYKlCs8TpyhMy9wm4v7lBeYQHtDOLtsTfBy143sJZ2dH+U1wQYhT
         LKpEvLk6UGAEDyXH0DdCzZcNPoRrZtZjxovG7P2B2c+JN6TQ8yNID+HOjAaltgC7gGuR
         dYanTeFPtu3zptlaOZzlmeeOavgt7a+tURXcoVMrJjFo49sPRDEE+/N4YzSjJca0kf7J
         d1tntrNflY5O7/QHS/4sPmG4gf5U6PusoQdwz+NQN+XtAuQZEvjCpLpJ7YZIx/tYeXHH
         2jnw==
X-Forwarded-Encrypted: i=1; AJvYcCUeTp6hGN6BP2hiFGlo1jVPYk3RTcGenndf+WB0mm60agftC894i6aYO1+Rf5K8s0i2zmCO7I9LbaFBcXVyHyQy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz57NErDDFjISMhgeQyegqKxW6e6rKRbnFl+VozF0abpA3IvJca
	VaUxgtz0E0mUJWZOS80kZkuoIvyZHXb+KV6GeivXDtAV/mlo1QCt
X-Gm-Gg: ASbGncu+ZO6pMqD9WlEALXGSEVLRTSUNqx387rLUt5wChux8HT9sKmT31dpcy22231q
	uHOrrQTJiFKv3xxSXP/YbwVC9oGSf7Y25qNDkZ5uhFmJaW1JyvlEhP4oDrRrPgy+6V1cqy4+lu5
	fHxf2kGp7XZYMvNCsGQK9sB0/VM5HAe2vSFTJS9XxyBysl3m0TrVDK0pdDaqMQtd+tXXepCkmrl
	XrOL38Fj28iSSpy73lNVuPug357dgnQz2pEMsQkefsKVmVQmjJj/BwbgWV5ITYzBX4SYIQrMHnb
	u1uaLTmObl1sypFqNBLEEfIbshX5bhlQ1Oo=
X-Google-Smtp-Source: AGHT+IFz3AnPPrWkJH2W87H/P68UdDnYxlyg4j1YFp+J6rmRetr1S1beo6FRJwr3WTZ5ZKGh7xpY2g==
X-Received: by 2002:a5d:64e3:0:b0:391:47d8:de25 with SMTP id ffacd0b85a97d-3971ee4421fmr11004162f8f.41.1742097952104;
        Sat, 15 Mar 2025 21:05:52 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:72::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318afbsm11186285f8f.72.2025.03.15.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:51 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 07/25] rqspinlock: Add support for timeouts
Date: Sat, 15 Mar 2025 21:05:23 -0700
Message-ID: <20250316040541.108729-8-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4618; h=from:subject; bh=y9/H+/hm8Whgobd7BHik2UQJXH7cEJPayXzZNcl5svk=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3c971BRmRrbtZ27c2Isb9sJ77Is1kCbCdZsV6t 1TF9L6+JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3AAKCRBM4MiGSL8RysI2EA CWS2QokbV6D30J2uxyFyVfcIaONPfZhICR7q5XYFdtmvsNs0zVjHot9yAnnznptXBAiSS+cpG5Aawg z2RsgVOs+pD0nZva8ZR6I0u3fDlBkTQkxzWXNevfnkDzWf6uUiNYOYliNQaW5nWk7Xw7ZhjvCiKRPX 5A+tArW1n6UuDrD81t1KOunXMvupCUoGslJanF+8gDOt4ww2O9a2OMUAEYlDam8nqkz9cM0CzCd7lj QMx+mD23eRdYJPFBaZ0DwuFWjSBsFEv1inLqSt9M2aRZyPyhN91AjHkP7RVP+M9mho4L+KwU5R0cXs ze0x9jqRuyREct7IZSep7fJflgyK3LtyZ98G5SfXEQFt45kdMIOrFHPRuBnQm4E6sCs4aJuA0iCmAf dZlv2k2m5XIg3dN0guZFl2s1WPD8cB9W0MpgJTmOTnOl4cdR5tCYbuQwVZ8AuFNtt9E5raXpwdig8A 3cVwVvesOvJ3R3L0nMCpCVvkK2xGt3HgFD3qTNJiFpVZ1DYfR37iPcxY/fvZQlkrC//giZDQ8bcvxJ GzzbGGJVJzdeQQcjyz/aBTh+kag7lpu9O1tyMEIIWMI7H0OfiLPjxnjWKbSoAZGBcrjRyr2gPN67vS 42Su7CQ/jdGZQj58ck+gkVIG4s5JTH4rC9is1NwbNmozjCDyE+65OdLS++Gg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210553_534601_12F0F04F 
X-CRM114-Status: GOOD (  24.08  )
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
 kernel/bpf/rqspinlock.c          | 45 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index 22f8094d0550..5dd4dd8aee69 100644
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
diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index c2646cffc59e..0d8964b4d44a 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -6,9 +6,11 @@
  * (C) Copyright 2013-2014,2018 Red Hat, Inc.
  * (C) Copyright 2015 Intel Corp.
  * (C) Copyright 2015 Hewlett-Packard Enterprise Development LP
+ * (C) Copyright 2024-2025 Meta Platforms, Inc. and affiliates.
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
 
 #include "../locking/mcs_spinlock.h"
 
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
2.47.1


