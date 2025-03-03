Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4DDC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Narwm03ehkHlcNbrRom2a3WOE/jJ7XHKhd4vuGjJYfQ=; b=qz8rnl7YZPnDqv4D6457Vmj4u7
	VagvAtfYtRjSpfNmIGH/BEZ96xrximkrHTLJdVzTE447ALIo1bghxJcZRWh8878eM65R9ZNVrsjnA
	vUptpqCFjWhw0MeaTfGyQ/yd1LuqLOt/ein7z6+MKI7ZTpsqrJW1IseAyqOLh2OX8qEdG31fGV9Cs
	zqE6kCCTxSbqK9S3VlQ3jb/ExzvjGdFcSkP9NzrmxOoHYrE4AhbrsEaazldhTkP/VOOf2CQHioyYN
	FLI5gGJuqkoVdtuiL2ujhVzxBta6hha24I0JQ7ZiI1pcAD8S8NAGfzACHt8yW00AvjwCcvIHHazQY
	9SEq2y2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7zB-00000001N8D-47na;
	Mon, 03 Mar 2025 15:45:41 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dg-00000001IHo-2pVf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-4394036c0efso29343985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015407; x=1741620207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Narwm03ehkHlcNbrRom2a3WOE/jJ7XHKhd4vuGjJYfQ=;
        b=H0v+dV99KB/Sq1m1JGsVU8wY4uplI/zIUWck365nXWgrkB8HGoEKSIjYqKD8DWC2sD
         9gMirr7+JJZVXWptVGkAW+uPn7EX2oNJ08NePpXT/+cDaogsN2D3wGbQF9VfgrEeYiSa
         q1DX9n6ZfMhQeGeSotQLgXnmxTJ4SPd7c6jSduL61ReWsT/YRRvV3kY6srHbBgTMkqyq
         5ZP9O1weg05O0SgW7TUo341ldVNVzHFyXIsUMjq6xzcBgvlIzxl11HGwviUNv0ofpUi2
         mPD0yXQ7qgrgqbo8MVgCAArC5camG395a2DBtdEYCjqeBYGFFGhvOM64X8qAw2/9MHcZ
         N8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015407; x=1741620207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Narwm03ehkHlcNbrRom2a3WOE/jJ7XHKhd4vuGjJYfQ=;
        b=TTOn89JuXsxNaOeCTDE31UVRbeBY8/CeWcCJ3SM95kHIofPMkCWOQjNgJMgiNi0oEf
         6J5cL/qHWN1tmNZQ7ScUFwYdjLwSCvH5qP0HWBAQvLgL6yx84qT8jIec5ektxBFbjOlU
         tpjFLbXFhc9DN+MArpNQAEeBkQEohruqY1JXzF+lP/A+Jv3AI9UBzwWp55Q/ylN543cK
         3gUa9KWU6I3voWklW4lMqEvtmIGYlHPuFbjxdymF68jgwNw8x+NEgNqedpaDGvUVLRHU
         P2/ULlsALTAchnbIP8xviwHwjPo7pk+gdoGfoAor0DhEdg269QJr+t0OScJLqKH/quWh
         8nEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTnvfHoBSSPHQn8aoHRYdei7xAN+ymITFaH+2AsdhhLeu3QJk6wONziZseeo5zebJsZsl7SIgxoUoz4btW3h/a@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3XjUYif8zPgCyvfvH7luWU+gtfRm1vvsmB1pNYb1ik79RGQTw
	myYy2T9NjUa5QGclv8JMickKNWWUQeQ9XGR+6QUd+BP1r9T1vEADqiEEABgy5ek=
X-Gm-Gg: ASbGncvGYZVX1ZlQR0x3O0YPjKRYMD9vFHWpAjj3KzvpLUiCMEpW+WVBL1TANYrMTUr
	iahr/jszUkMLdXnTmoNdX9ByOzjBEhm4YF/RI8XHUGu/URAOwtWB0AVc98eZozfvi99Do7t/1/k
	cJ2jvCc6cOGGk9afOw+Vs4/2N2dLGPHaCDfjuc2u5Q0HZ3TZ0gpYCu6dLymozI7i8Ry+sOyCsFe
	OPmB2pciBV5o4ll/Fu6kmDZ26442+CX+GwZkzNGNIXPDh8vZsMsvG3Kovxqc+OyPbUh0fQIbaDC
	U2BZkCgcB52yvZeW2p+YhXz58pQ2HeXa+7Q=
X-Google-Smtp-Source: AGHT+IHQPjApFZs3HhsmlujTPNCDLSejJ0ltemem59qnL0CWos33mq2nn38IumeJ2bsiNZQ67lldHQ==
X-Received: by 2002:a05:6000:1f8d:b0:390:fb37:1bd with SMTP id ffacd0b85a97d-390fb370470mr6319805f8f.46.1741015407243;
        Mon, 03 Mar 2025 07:23:27 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:4e::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485db82sm14509941f8f.88.2025.03.03.07.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:26 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
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
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v3 13/25] rqspinlock: Add a test-and-set fallback
Date: Mon,  3 Mar 2025 07:22:53 -0800
Message-ID: <20250303152305.3195648-14-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4064; h=from:subject; bh=o1MKDNUhE9EFH4RwMPASaZvJKuJrMCZ8uocCQm849Ik=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWXyKg4wB+6V7Ple/tkprfUEWpR0Hl6dgveKapl mmrrb5WJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlwAKCRBM4MiGSL8RyrORD/ 9X6zKnZ50odRHn/aTMB5eerXFYbZYCFEA0zhWN7wOz/mXTLzA+cu1Kx16cILZLnewteP+spWp6TfeG oO/uEEbmEQvn0We0uAupBYIt8VRyjDPQs99CWCu4QGxc3xxkMS5+mQTJ2ons155TFMD85j8Vt7WBeN Gp3Q7X7RM7uzhQ4y+EgVeTAa8/W6GwRYnV/14RG89yraqvQIzLJtA/BHAHhJwp3um17ldvOg30GGTG ljTKl/gZXoBY1wmcLDkkukm03I2d3VP267EdahhXrctgXkA3dPZCyVzJg/lHJF41jU28pRqEqdU1fZ NB5PW9KYd1XzxvhBhwPdgXR2qunX1i8LP/jJn9SDb6JtxKugtHFL9y+ODarv6pIP3Of+NZLd7dwdtO cLPFwRPp5fOfnOfrSQBkPYD+CksR9o5ApDj8rMEimbPEIeKSfuHi4JgiExIi0TmcmH2AHxW+M+Jons MY9cSj6MOAtu7gTUDpDFMkHrkip9TL0zZhiW9CJHxYfOVZLWIFlgX00dUWHbzWPbhiRM6gc8tnmL4e gYYeCoy81wYg2HhX5/dCjB6beylFJO8aHhgT+X4oqKJx85F7LbFa6OameusA/gU2YMVg/nDYQKZMxs TIUKm5h4/2zgx4el81Kce6UG+hDPxefexA5tXAA1BD6DWZNiRUU8p7hniQGw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072328_728577_C028AFFD 
X-CRM114-Status: GOOD (  18.17  )
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

Include a test-and-set fallback when queued spinlock support is not
available. Introduce a rqspinlock type to act as a fallback when
qspinlock support is absent.

Include ifdef guards to ensure the slow path in this file is only
compiled when CONFIG_QUEUED_SPINLOCKS=y. Subsequent patches will add
further logic to ensure fallback to the test-and-set implementation
when queued spinlock support is unavailable on an architecture.

Unlike other waiting loops in rqspinlock code, the one for test-and-set
has no theoretical upper bound under contention, therefore we need a
longer timeout than usual. Bump it up to a second in this case.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h | 17 ++++++++++++
 kernel/locking/rqspinlock.c      | 45 ++++++++++++++++++++++++++++++--
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index b685f243cf96..b30a86abad7b 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -12,11 +12,28 @@
 #include <linux/types.h>
 #include <vdso/time64.h>
 #include <linux/percpu.h>
+#ifdef CONFIG_QUEUED_SPINLOCKS
+#include <asm/qspinlock.h>
+#endif
+
+struct rqspinlock {
+	union {
+		atomic_t val;
+		u32 locked;
+	};
+};
 
 struct qspinlock;
+#ifdef CONFIG_QUEUED_SPINLOCKS
 typedef struct qspinlock rqspinlock_t;
+#else
+typedef struct rqspinlock rqspinlock_t;
+#endif
 
+extern int resilient_tas_spin_lock(rqspinlock_t *lock);
+#ifdef CONFIG_QUEUED_SPINLOCKS
 extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
+#endif
 
 /*
  * Default timeout for waiting loops is 0.25 seconds
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index ce2bc0a85a07..27ab4642f894 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -21,7 +21,9 @@
 #include <linux/mutex.h>
 #include <linux/prefetch.h>
 #include <asm/byteorder.h>
+#ifdef CONFIG_QUEUED_SPINLOCKS
 #include <asm/qspinlock.h>
+#endif
 #include <trace/events/lock.h>
 #include <asm/rqspinlock.h>
 #include <linux/timekeeping.h>
@@ -29,9 +31,12 @@
 /*
  * Include queued spinlock definitions and statistics code
  */
+#ifdef CONFIG_QUEUED_SPINLOCKS
 #include "qspinlock.h"
 #include "lock_events.h"
 #include "rqspinlock.h"
+#include "mcs_spinlock.h"
+#endif
 
 /*
  * The basic principle of a queue-based spinlock can best be understood
@@ -70,8 +75,6 @@
  *
  */
 
-#include "mcs_spinlock.h"
-
 struct rqspinlock_timeout {
 	u64 timeout_end;
 	u64 duration;
@@ -262,6 +265,42 @@ static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
  */
 #define RES_RESET_TIMEOUT(ts, _duration) ({ (ts).timeout_end = 0; (ts).duration = _duration; })
 
+/*
+ * Provide a test-and-set fallback for cases when queued spin lock support is
+ * absent from the architecture.
+ */
+int __lockfunc resilient_tas_spin_lock(rqspinlock_t *lock)
+{
+	struct rqspinlock_timeout ts;
+	int val, ret = 0;
+
+	RES_INIT_TIMEOUT(ts);
+	grab_held_lock_entry(lock);
+
+	/*
+	 * Since the waiting loop's time is dependent on the amount of
+	 * contention, a short timeout unlike rqspinlock waiting loops
+	 * isn't enough. Choose a second as the timeout value.
+	 */
+	RES_RESET_TIMEOUT(ts, NSEC_PER_SEC);
+retry:
+	val = atomic_read(&lock->val);
+
+	if (val || !atomic_try_cmpxchg(&lock->val, &val, 1)) {
+		if (RES_CHECK_TIMEOUT(ts, ret, ~0u))
+			goto out;
+		cpu_relax();
+		goto retry;
+	}
+
+	return 0;
+out:
+	release_held_lock_entry();
+	return ret;
+}
+
+#ifdef CONFIG_QUEUED_SPINLOCKS
+
 /*
  * Per-CPU queue node structures; we can never have more than 4 nested
  * contexts: task, softirq, hardirq, nmi.
@@ -610,3 +649,5 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	return ret;
 }
 EXPORT_SYMBOL(resilient_queued_spin_lock_slowpath);
+
+#endif /* CONFIG_QUEUED_SPINLOCKS */
-- 
2.43.5


