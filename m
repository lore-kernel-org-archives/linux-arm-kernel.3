Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E54C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIFRymfR26T1V4pI+hLoHtvRY/1A7N6xjkuyA7wDGHE=; b=J8mET7eSWmQ+qLUPd85N3zfpF3
	A4Wv4nQyEhJ85mC5pWO5SzjlfTAy9+Lk/GaquOQ1PlyGv8KxfJ8TSKwVI1QpPQtpYeXSe3bsrFgqn
	On3nRj7wMvwv0v6Ju/8YBsdz5fxH5JH+lqK9/viA984DpugN0oH46wwQPtissl5M3DhVzihZxSQa7
	awoty3exkWI3DfVMXpK9zGpQ4rS5QGzLcWikfwXT9m9ClKhRcQwnbezSRWVTcoA5Z7YTYKTbfyoel
	IlwDMEs8J67nesNW3wCE0RaKM7twLR/MilwRGTR6eURuGy5YR+GLQZ6HocgjTGvysfE1WdUgDePWT
	ckKni++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp82I-00000001Njm-1SGE;
	Mon, 03 Mar 2025 15:48:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dk-00000001IJw-0YNL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:33 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-43bc38bb6baso6275965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015411; x=1741620211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIFRymfR26T1V4pI+hLoHtvRY/1A7N6xjkuyA7wDGHE=;
        b=O/6phnUbwQNHxKyuXIrS9NITwBhlaTr57VLCdSkftKU8G+n/T531IBxCWCHlF8+umn
         cF54c7d5jP3gH7f1Aea3BAoPC/x0W/DMFd36IoH9KRS06hHzK84VWGHDm5NFcmgq65vA
         V09LZ0Dp84caUj5WSVYJIewoeY+dfgBmZOYhEu96EEs4Neuo40JlKqprJZM8x3BxIfFH
         yxMNfevz+meFBf/5Z9Ft/iRMRtpy2VcR7Eupu5TSvspsXLRoFZdC5pJ1rDYUqjqn4fA7
         eyPnDhjFt8Qso+FEb+OjLL2XdNiRzBE3p/m1UINVE+pkAvI/QhiATvwBWUJ8qgAwaNzF
         7yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015411; x=1741620211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIFRymfR26T1V4pI+hLoHtvRY/1A7N6xjkuyA7wDGHE=;
        b=TkvrSB1ApOuQq+qNSnCimJ2YFP6nxj+C5h8ycAFITaUxXmov+b/K7zriLxW3Q3Ha/Y
         8Iu99FnagzeOwGSn8oEtQz8M2izOaqfRTdscXtfMn9JOe+0ogBff7lhfrVMjjw8jTv7f
         1WXoNIoXCk7PWBdfoOeGZgzNeDFFTkMd0CUpwefWgh9PFDi7I2DCn25sABd2okY8tBiz
         LVCiiSjXHUpeatqbbvrdN3NErl5KpwXErq0teNLf3bAZ/6DIHz4+gH0o+Dy+HzIrfvgI
         VdH7nhD2Dd9kCc12I9YNf8P6fcLK0LKqbIj+V4F9F2taPc881BgqhJkWD7wyJPWTBqpP
         HInQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9CANOx5SAOOOIqGavMHIuyrIaLvI0nCCdZVZ+Zr/hVA8TEtHL4xW2pNTb/z0089yoaZOhFVZAE/TfjxlYHc8w@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1HlNfhETD7nGFXz71tl480FrQY8JzgpJiKeezcp0izPW7gDOE
	224Tou/9p0OcCod0c1FLfpw3bmdsVjxX5+Oaq1kwZnHeTIckig2L
X-Gm-Gg: ASbGnct7vWLQH9s57xqphZlvfU/BG6xDerg59VbJT1rhTXGeGLYyTsBvAkwiHkomun1
	EapG0LbmqsjFjM3NfW4GRawxEc8RsuUr3jVSl9GzCuvjyRKOu8rvI+T4ztM8AVZ51rwY5IG6yqJ
	yVOPFos8iozXSPMALQt+WnuEXGn09ULUcji3+MkjhbHp6FpUuoznORjsrZ68MfUXnN2HZ2TMQE3
	RnVv1Mx2i/ECg3RCLoLxYADNWKSyvCOoXXME/F+KgsvABbudSKtXck83mXJGTagb4RWeCiNCVMz
	jfb3KG+9qnm/9zbTcvwbuBOb2/UovW8A8g==
X-Google-Smtp-Source: AGHT+IHhLXGjzf0udnyNXtByFw5OFSp0rn67LfLvjV3YqWbj0wvdktay+P0e8RZUkjfn4MvH3tUgiw==
X-Received: by 2002:a5d:5886:0:b0:390:efa5:9f6 with SMTP id ffacd0b85a97d-390efa50b8dmr10698291f8f.51.1741015410709;
        Mon, 03 Mar 2025 07:23:30 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485dba4sm15037247f8f.92.2025.03.03.07.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:30 -0800 (PST)
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
Subject: [PATCH bpf-next v3 16/25] rqspinlock: Add macros for rqspinlock usage
Date: Mon,  3 Mar 2025 07:22:56 -0800
Message-ID: <20250303152305.3195648-17-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3988; h=from:subject; bh=1vN5D7C4tfoaawMuUjp7ZN+fQy3wYGzp7nrXDJHdVAo=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWYD7W48Zy4MCJ4hC7Laq1GOwnd+65hIihP1XlI Lb5c/6OJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFmAAKCRBM4MiGSL8RyvneD/ 9CSceH24BxXpHlqBvfIHao0z3PNag/hh6hxWdzMJtXnIupGNQZXotn7KA2u9LloczdUDTDU6i5vyel pyxYLhk/EO2NcmqNvsUhMnV5AQmt3i0G4X/wKGhsKXL1avILr8mSIPCqUG6RFfbDQB7MpnGHT9wsVp cQasSdKg8ZNoIJzBhiV64wzVF1LDmN5meStwPmrIfdXHD02M3uHizakkrT2k6ueYJNn2a4tr/vVKoU iRwh0w3G9w3jgipmvotAi+BjklTirlbzwjKDUdCWzM60WlU06NkoPlkUgR2q9m+804yz5qTMaenuPO mDGBty0syn+pois9BdJv0UeaAwoksZN74YC6vuHDh/6BnSK4mOisuHLP/D7iby5FHVL4tFHia6FYXq 0+DkRs/a2OqWFTk+o+cN5A+NCwpDIUbZfEc88aigLqitRC4eJuZQEHywIriAiRmy9ImnyJodlammr7 s9AjvCAzf340XzmF6Gumn6IbMHZb4p5hLT33cHlh7X1AjJ8RCiWQU9k8Q+zrAYThzoK/jY88XCaIjI FPn+NFQHv4b/Llf94bia06KjI0S5GgJJFxeSqmSE2wqAdn52bTxowHvRwOUwjeeTpXHaxYnYDXqa7m FXdZOR4Qg1a7dlf/djjyVfSDMq679lEDbrl1aOKGxNSRnLgsYeiMckHq9q8Q==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072332_169400_8687CC89 
X-CRM114-Status: GOOD (  20.17  )
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

Introduce helper macros that wrap around the rqspinlock slow path and
provide an interface analogous to the raw_spin_lock API. Note that
in case of error conditions, preemption and IRQ disabling is
automatically unrolled before returning the error back to the caller.

Ensure that in absence of CONFIG_QUEUED_SPINLOCKS support, we fallback
to the test-and-set implementation.

Add some comments describing the subtle memory ordering logic during
unlock, and why it's safe.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h | 82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index f8850f09d0d6..418b652e0249 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -153,4 +153,86 @@ static __always_inline void release_held_lock_entry(void)
 	this_cpu_dec(rqspinlock_held_locks.cnt);
 }
 
+#ifdef CONFIG_QUEUED_SPINLOCKS
+
+/**
+ * res_spin_lock - acquire a queued spinlock
+ * @lock: Pointer to queued spinlock structure
+ */
+static __always_inline int res_spin_lock(rqspinlock_t *lock)
+{
+	int val = 0;
+
+	if (likely(atomic_try_cmpxchg_acquire(&lock->val, &val, _Q_LOCKED_VAL))) {
+		grab_held_lock_entry(lock);
+		return 0;
+	}
+	return resilient_queued_spin_lock_slowpath(lock, val);
+}
+
+#else
+
+#define res_spin_lock(lock) resilient_tas_spin_lock(lock)
+
+#endif /* CONFIG_QUEUED_SPINLOCKS */
+
+static __always_inline void res_spin_unlock(rqspinlock_t *lock)
+{
+	struct rqspinlock_held *rqh = this_cpu_ptr(&rqspinlock_held_locks);
+
+	if (unlikely(rqh->cnt > RES_NR_HELD))
+		goto unlock;
+	WRITE_ONCE(rqh->locks[rqh->cnt - 1], NULL);
+unlock:
+	/*
+	 * Release barrier, ensures correct ordering. See release_held_lock_entry
+	 * for details.  Perform release store instead of queued_spin_unlock,
+	 * since we use this function for test-and-set fallback as well. When we
+	 * have CONFIG_QUEUED_SPINLOCKS=n, we clear the full 4-byte lockword.
+	 *
+	 * Like release_held_lock_entry, we can do the release before the dec.
+	 * We simply care about not seeing the 'lock' in our table from a remote
+	 * CPU once the lock has been released, which doesn't rely on the dec.
+	 *
+	 * Unlike smp_wmb(), release is not a two way fence, hence it is
+	 * possible for a inc to move up and reorder with our clearing of the
+	 * entry. This isn't a problem however, as for a misdiagnosis of ABBA,
+	 * the remote CPU needs to hold this lock, which won't be released until
+	 * the store below is done, which would ensure the entry is overwritten
+	 * to NULL, etc.
+	 */
+	smp_store_release(&lock->locked, 0);
+	this_cpu_dec(rqspinlock_held_locks.cnt);
+}
+
+#ifdef CONFIG_QUEUED_SPINLOCKS
+#define raw_res_spin_lock_init(lock) ({ *(lock) = (rqspinlock_t)__ARCH_SPIN_LOCK_UNLOCKED; })
+#else
+#define raw_res_spin_lock_init(lock) ({ *(lock) = (rqspinlock_t){0}; })
+#endif
+
+#define raw_res_spin_lock(lock)                    \
+	({                                         \
+		int __ret;                         \
+		preempt_disable();                 \
+		__ret = res_spin_lock(lock);	   \
+		if (__ret)                         \
+			preempt_enable();          \
+		__ret;                             \
+	})
+
+#define raw_res_spin_unlock(lock) ({ res_spin_unlock(lock); preempt_enable(); })
+
+#define raw_res_spin_lock_irqsave(lock, flags)    \
+	({                                        \
+		int __ret;                        \
+		local_irq_save(flags);            \
+		__ret = raw_res_spin_lock(lock);  \
+		if (__ret)                        \
+			local_irq_restore(flags); \
+		__ret;                            \
+	})
+
+#define raw_res_spin_unlock_irqrestore(lock, flags) ({ raw_res_spin_unlock(lock); local_irq_restore(flags); })
+
 #endif /* __ASM_GENERIC_RQSPINLOCK_H */
-- 
2.43.5


