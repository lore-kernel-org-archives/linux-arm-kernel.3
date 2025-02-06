Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F42CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qz+NS5T4GU+VbAH0BNt16FcBYOnl5PXsvLXnbwAi+Qc=; b=ujBwhbykaWPY6jsc1QhURPFbaU
	KydcIuZvSi79TUeTbUjiGciksjjhDT/BNlJoCDd60zltM/hT9LMtmbNkNtQJjRGyfJoOyaxKr8ZzB
	4UX6DI/pCXu8mjSaA7G8oAWLBG2NDn/9gCpSSiIL+OBkJDmcuteSBPxmTNBYU8bXv6cYUkI1m5Jlq
	FLffjbKT9+/RlbW1hE6Ch2QldLNViuTCi7R2v0YaJC4Hr2SLfY4EaLI9Jjvcr1N92dV/L8+Ona1Lq
	IfvY+ayiMlUfXEYy1waBHMtFe57dgUnLRQlhbU2VCl1/R422R2XIQuWMKPLj4u5B7wJiXp+yr/yYQ
	dSE77P+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzv2-000000066tj-0Fa0;
	Thu, 06 Feb 2025 11:19:40 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXC-000000061dq-0tqV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:03 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso4678995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839301; x=1739444101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz+NS5T4GU+VbAH0BNt16FcBYOnl5PXsvLXnbwAi+Qc=;
        b=LpUDa2Dv8HcNnI52RssXGDW8s8GdureeXjzFJLXpIelqL5OeQYm227xaIAjKqgXlUM
         bRsIKJNNys9T4B3EyozuR7NLhHGdMc91pmOcn9mMoGS75165+ZxX5p4pfyDIo/5PqPFY
         Imie7jLYXKS3oedChyEDboPIN41woOmEi5v6Z8TmznsOBXsVGL+dUpOBMsr2dasjFWTg
         cyAykuOTDPIPXV0q6AICGfCbPqU4OBa3/JhtdPEJZC+17p0qbTHzD6UoJym6qUIfrjpZ
         NrYlJEq4JiVlqO8jYDLJFSNZ5Q27G1jLvdoOzuP9tWjdWz9xpCx38hhpm+ghIvVAG7lI
         bdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839301; x=1739444101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qz+NS5T4GU+VbAH0BNt16FcBYOnl5PXsvLXnbwAi+Qc=;
        b=g2BJp0l1LnjJNjxYNUMPN9djS9WbIqTHfw2MLcFEdubKetcfbqy3uhOV9MiDNrAox3
         UoGv+T9NbOXAhDQohRHFAZAlqsQzXy9gn2zuMmme6I//0rTuJ66DoR8QCvNjJHpklInH
         IJWyqQ7Tk56vmf/+L2B6iA3H4e8xjS96NmZe583MYIPs2NCCFnNvOPmwCZUoO1X8+1m7
         T/Cvo/Aoo886bGxNBo5r5x34aE7Ds6n84sO+pYIL9oq4EwCoj8V0r16JZ6Y+CgXPzBje
         qOxTL3lNyNJdQbPogRJ5HKWhDmt3L17tY+wscPiS3j+eQ8kh0Gj21U18ZwhA2htvrH1u
         lPew==
X-Forwarded-Encrypted: i=1; AJvYcCVaEZvXllQiagirrdnSaTDi9DwErjPxjl8JobJXeiiOD8QQ6zrWaXQzRp4WsNxE++MKtztt1yhWNXAfPl6Po+Ur@lists.infradead.org
X-Gm-Message-State: AOJu0YxY9OpudmSQ0SwOIGRNUJems3bWAz9RMO74eB/GY6pY7XH99DHL
	c3oxeWWHPGmQXsZwXTcHxC05g/bt3Q5fnaghl3qotRv1N7aaYBqG
X-Gm-Gg: ASbGnctWqNGB6sM6qYWR8U6cB9rI3uKxoUi/bwMlqfKmVw3xeo14UGhWkxmaqPFrMvO
	vRAF0VMXpffmcRQeAmwb3k4kWH769TuRrzdPAyd82Bp6wjzPbdirZW/fLZ7/JsODx57kQE1dBe9
	rxS1iqOslDka+Wfs1cLYePlB3Nzkj+6/jYqt7TwuTuCkSwWky1otfMGee3MtDKmjJ81XY8AktiU
	2ERaS3K73HQGy70ip4i+Xw8JgeswVSWrErTeIDROkNbE9ADEYsAbyXyeMl596mzxloxbOGps6Qp
	Ai8fOQ==
X-Google-Smtp-Source: AGHT+IG3YUH0oYkY2WcU9nkb8nClyB5AjNsFI6WIkNWS0fGK3jGoBgR9RRDJA0dBgbN9twa+WCc61A==
X-Received: by 2002:a05:600c:1c87:b0:434:f7e3:bfbd with SMTP id 5b1f17b1804b1-4390d5611fcmr49163655e9.23.1738839300786;
        Thu, 06 Feb 2025 02:55:00 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:25::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7c7sm50627245e9.14.2025.02.06.02.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:55:00 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
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
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 17/26] rqspinlock: Hardcode cond_acquire loops to asm-generic implementation
Date: Thu,  6 Feb 2025 02:54:25 -0800
Message-ID: <20250206105435.2159977-18-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3789; h=from:subject; bh=qYphScagVacMZI8xAzQRuNOSyn9/aS/2qYdw+lGxq8I=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRmEQyiG868iJLdTJeV5rNF45XJkM3pzaj93Qpc DMdltmaJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZgAKCRBM4MiGSL8RyjhAD/ 94L7gwFOANgho2OHK/jFtxh/dQWudROmLlLNyaJh+qGxZ9/Y6D95iWxtze9d8A8JWUeVYuNcNzGuEN q2gb1bS2T8Pk+VCqcFRqsioDWHNnqM+BwLGq26+gTj0p3zop+cgAPklesV00m68IlSy1LhMcIzIF2E slsAxGCoT6w+U1KGge2lPNChfW8Kf4kMiHr5s4V3lqgjh5jDkHofe2E0f88YBI6NEK9X3fm/gk1V+J VIaptHRDqsUJmlPLmvdU51DFEwmGDVtxxc8mvgA6F08d9d87r+yOm0Oos298QtBiQcb6IqHR1aka9N ITML8aqrOeF2zgN99ZZVlzpqrJWuvSp/jTdyiXKWVRaHjVEtHs0pTh7ybdJy+0D0bEzNBE9I5MQHe+ WHend498nQc8gE/neaaMboKfxVnAocxfFtQoQknslS76Z48WT/MN4FdUGVjS9jgF8kAQB/iTqc+2A2 jb0b9ivFQZN1YJgTlFTR4zPHbYRw/NOF7HTisjbVAjun3ow+FP3VgcwZPkruEl+31v44pUzsmk7WZm PBqeRGaWYJACjXqHGBEueZu13cMlJCXDoarHrZqbMc5frds4B2dEW+0qLeFUe/LZJqdKgR+36oA8nE hBOileJ273cIjtBiGXGnEU1vWDHPgN8zSEOKxP4Z77q0bv5ucidRdFRkNFZA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025502_246035_9084202C 
X-CRM114-Status: GOOD (  16.88  )
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

Currently, for rqspinlock usage, the implementation of
smp_cond_load_acquire (and thus, atomic_cond_read_acquire) are
susceptible to stalls on arm64, because they do not guarantee that the
conditional expression will be repeatedly invoked if the address being
loaded from is not written to by other CPUs. When support for
event-streams is absent (which unblocks stuck WFE-based loops every
~100us), we may end up being stuck forever.

This causes a problem for us, as we need to repeatedly invoke the
RES_CHECK_TIMEOUT in the spin loop to break out when the timeout
expires.

Hardcode the implementation to the asm-generic version in rqspinlock.c
until support for smp_cond_load_acquire_timewait [0] lands upstream.

  [0]: https://lore.kernel.org/lkml/20250203214911.898276-1-ankur.a.arora@oracle.com

Cc: Ankur Arora <ankur.a.arora@oracle.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/rqspinlock.c | 41 ++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 49b4f3c75a3e..b4cceeecf29c 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -325,6 +325,41 @@ int __lockfunc resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout)
  */
 static DEFINE_PER_CPU_ALIGNED(struct qnode, qnodes[_Q_MAX_NODES]);
 
+/*
+ * Hardcode smp_cond_load_acquire and atomic_cond_read_acquire implementations
+ * to the asm-generic implementation. In rqspinlock code, our conditional
+ * expression involves checking the value _and_ additionally a timeout. However,
+ * on arm64, the WFE-based implementation may never spin again if no stores
+ * occur to the locked byte in the lock word. As such, we may be stuck forever
+ * if event-stream based unblocking is not available on the platform for WFE
+ * spin loops (arch_timer_evtstrm_available).
+ *
+ * Once support for smp_cond_load_acquire_timewait [0] lands, we can drop this
+ * workaround.
+ *
+ * [0]: https://lore.kernel.org/lkml/20250203214911.898276-1-ankur.a.arora@oracle.com
+ */
+#define res_smp_cond_load_relaxed(ptr, cond_expr) ({		\
+	typeof(ptr) __PTR = (ptr);				\
+	__unqual_scalar_typeof(*ptr) VAL;			\
+	for (;;) {						\
+		VAL = READ_ONCE(*__PTR);			\
+		if (cond_expr)					\
+			break;					\
+		cpu_relax();					\
+	}							\
+	(typeof(*ptr))VAL;					\
+})
+
+#define res_smp_cond_load_acquire(ptr, cond_expr) ({		\
+	__unqual_scalar_typeof(*ptr) _val;			\
+	_val = res_smp_cond_load_relaxed(ptr, cond_expr);	\
+	smp_acquire__after_ctrl_dep();				\
+	(typeof(*ptr))_val;					\
+})
+
+#define res_atomic_cond_read_acquire(v, c) res_smp_cond_load_acquire(&(v)->counter, (c))
+
 /**
  * resilient_queued_spin_lock_slowpath - acquire the queued spinlock
  * @lock: Pointer to queued spinlock structure
@@ -419,7 +454,7 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 	 */
 	if (val & _Q_LOCKED_MASK) {
 		RES_RESET_TIMEOUT(ts);
-		smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_MASK));
+		res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_MASK));
 	}
 
 	if (ret) {
@@ -568,8 +603,8 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 	 * does not imply a full barrier.
 	 */
 	RES_RESET_TIMEOUT(ts);
-	val = atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK) ||
-				       RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_PENDING_MASK));
+	val = res_atomic_cond_read_acquire(&lock->val, !(VAL & _Q_LOCKED_PENDING_MASK) ||
+					   RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_PENDING_MASK));
 
 waitq_timeout:
 	if (ret) {
-- 
2.43.5


