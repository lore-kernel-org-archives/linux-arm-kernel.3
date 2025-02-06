Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF95C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0X1+UYLXLNf68smwsb01lX6eFqtHiz/IPso40v3JOxM=; b=WHGvx4Tt2T7NvEzJ2zCX1DqHrA
	t4qk70rT87OM9cNgKrnXnoon48R3FmPr9UoaHlQQcYva0Zpo8sTxuteFSxDswpm5kKDOvgCSAKy+l
	fr6Wadh4JoIbAxNjym3u1RNR4mR1/ZyYyGYIBgIFVLdLxtUbRwacyqNk5+TmK2oURLIHGZPy5B8IR
	BJFUadJu7fGHN0qtZgy2H8wSsyFCUYdYvRzv2c0wX6Mlgw/7rAlPlHbKKq2EG5+buEYY0d0+8DcvY
	FAwAfgYXObUTkD0KywmhdSoZjmVGcxNNltQ1QvCdrQ6fUqL4y2ImaY/DFqDV8s1qu7KbA0pUouELF
	nRVgFC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzr1-0000000663i-0e0P;
	Thu, 06 Feb 2025 11:15:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzX9-000000061bz-1nR7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-38db10ab86cso601968f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839298; x=1739444098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0X1+UYLXLNf68smwsb01lX6eFqtHiz/IPso40v3JOxM=;
        b=D9ZtK6UkX9ACRUOUZ4TfrTaP8wyUFAngZrBbo00dV4vsLMA7z+fzJ9Ylsf4hIn9Wqx
         k3u43+GwEeomEn9rUwGAZgGyOZyJUo2j1qN4uzpnN03l26SE4gIYc8z1pIstU6HcFgec
         92zbMEwUStRBpIcTcubMxfcDm5zTjBR6ri8lTNC+pze6VBWIYP9qATZMZwKTubtqTAT6
         FIMll6PJNafh/nMf1q1EiPjqHSU1/NYMpDYXtocr5gM27F6h7DoQ4+IBJlETPSrK4+yW
         yiwPYEi+vHaHclAfkPDOGU2FFosqRcY+Cxm37lORIzbETaXUaChBFfup5vRGlQNnOGzv
         KqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839298; x=1739444098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0X1+UYLXLNf68smwsb01lX6eFqtHiz/IPso40v3JOxM=;
        b=WnbQKu2T932pkmC2LKrGn970j1szxBAUIqnkxIFWgJcfGPXoMQh7Ey/HAN6nkHgpnz
         0iAYZgvFdL9SqkwvMebkKXkQgwyqne2HQGgX206UQqug4ufFISZPBaA+XuLmjigKJUjn
         mpht1gTvF7QFH2pLOngwkXFtAJr8bm8DLfWk0vGv7E+Z3X9/TLnDeUqXsNSxFjqY23mk
         jdGFvJA87uQEHnbV3mU51qGKknkcWT/XAuX00ckpajeCa/LMZPWG6OaEZfd52nnzp4Y7
         EWlYhmjQaaWeQhqNfdQ6gQvzW2xhpVfwttrZVfOWFZOQhNwzs5349FekB5F6/ET0E+4c
         3OOg==
X-Forwarded-Encrypted: i=1; AJvYcCVP/neknrXf06C13uOnvNMmNsWG5xnH9BG1KYMDafrofwxqI5EpO3NFMW/VeNgSzhp5lSVbXRHB7FUXZVEgtvgX@lists.infradead.org
X-Gm-Message-State: AOJu0YzwCzIC/N+byKWzUIK73zdL+4tunSIrj7GQLk6+GPxJblB2+mIK
	TgyXX5YFcY9YaybPYpGDwR/JEZfavY2zsxJA24V76cao2kvdLxP0
X-Gm-Gg: ASbGncvnLUz3tQbZH2cdgsYuLmTxDhJagIZQJOKp0H1hcymQg0vv23R5E5mq+stkKWu
	qVoKnu/CaUwD+OrAYhRnIcRjdCTXXVbbLH3cnNmBqtooCRyImrDmzJt8AVfbH4inPilkYGAqIrD
	jB6beuHcG8ySBsro/eyy02A8Lf/7JZGaSX6e9NvytvuOEVODoM4bwr0KEeK8rUh5O6kYBn6gO1x
	F0c3pQ7nQt2zH542jTP4eSqhxuLSTE7DdqMS0gl/1zMUn2Pp9ldHwmP6TP7TZ8Wxcvz72xjxygE
	Mz8y8A==
X-Google-Smtp-Source: AGHT+IHFPsmZFGzMQgNIZxyin0+PS7DDeJ1kbh/KGqhqHLUU4fvdAQOI2sLLSlmyZkzlKcZIDN7WyQ==
X-Received: by 2002:a5d:5222:0:b0:38d:b051:5a0e with SMTP id ffacd0b85a97d-38db495f8c3mr3602518f8f.49.1738839297924;
        Thu, 06 Feb 2025 02:54:57 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:16::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd36776sm1432693f8f.32.2025.02.06.02.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:57 -0800 (PST)
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
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 15/26] rqspinlock: Add macros for rqspinlock usage
Date: Thu,  6 Feb 2025 02:54:23 -0800
Message-ID: <20250206105435.2159977-16-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3270; h=from:subject; bh=itMjJLB45N5MLJdgdgQDHOOS7VmFDUaHlV/BKezdr3U=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRmSdisG+iOEzxKLgDdJjXZN/mncOFg8pv5dO3d bZNJg+GJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZgAKCRBM4MiGSL8RyqPRD/ 9gG2FU1oHAJPUn4UJ3fwKsuQm4i95ajoiPlT/m5kT+DPF9gSa+xO4hKuGYliwEJvf+nuxUe7FMhCUo nbsTx4KiQesdJvFLBEyC8lMRvIh0qaD//aym3Fhb4D5zAgaUBULNbyDh5gj/mVvu5FLRbI+DT3LJmw r1bostFusx1GdFieKe+yhrTChSjrfqKbnpY9R/8w5UkGN/g+vLsyykEbwnbgHhL0Ycvk+yqbXaob++ hWud3ejpfkcyQRqDBeycTn+q3cMN4T33wASR6VfBgNAggDQplTQ0NL97l+Dn3qdgtj1L8+PzWkyEy7 uzYnLPsU1re215zb4P38apAspYJP0lf30MOhhmObWuxKLqtviREsn0uOBZNsmdc4R3mfydqsDy2K3i fXrNShGCY4YJFjLqUeWDnW9g2IHVA0Y3GNq49DhGgN8ZGExFHkkLHKfWWt1vd80tJx+3FcaAcbrHN6 jqnPSeoZw9H/Gv0GIoXD05hjLkUhPcZYt3gM2eUbE0LjEPwU3A1PAq0320Z5j0ZxsuHnEQt80v5ElR 1N2IG2VJNeILB6c4gNBsyn59IW7xvMo0y6wnEpgTgAJHBxYZqffi0Js1mYt58TEIo6iaH05Sdjgvz5 U5PZ/7rUM15c0KeEcHBAwD6NKswh6LfL192Y9X7h+EChg4E+eQnBkpyXm7gw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025459_461686_B9C405A1 
X-CRM114-Status: GOOD (  15.71  )
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

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h | 71 ++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index bbe049dcf70d..46119fc768b8 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -134,4 +134,75 @@ static __always_inline void release_held_lock_entry(void)
 	smp_wmb();
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
+	return resilient_queued_spin_lock_slowpath(lock, val, RES_DEF_TIMEOUT);
+}
+
+#else
+
+#define res_spin_lock(lock) resilient_tas_spin_lock(lock, RES_DEF_TIMEOUT)
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
+	this_cpu_dec(rqspinlock_held_locks.cnt);
+	/*
+	 * Release barrier, ensures correct ordering. See release_held_lock_entry
+	 * for details.  Perform release store instead of queued_spin_unlock,
+	 * since we use this function for test-and-set fallback as well. When we
+	 * have CONFIG_QUEUED_SPINLOCKS=n, we clear the full 4-byte lockword.
+	 */
+	smp_store_release(&lock->locked, 0);
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


