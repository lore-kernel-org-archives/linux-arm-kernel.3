Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64C9C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVJp3+JT7y8+ub6buLRsxOUyy8d6vFpxA5yFbRAEMPI=; b=B3lGWl8vt/PbHS0pOn1Ftp5vHE
	UatEOYuMWGND/8dPlhuU4G6UKNkXhHS0GlKibqdO51L7Nk171zQ1YOhVYY2olY9F+tDO8lI4qSgL1
	uL7F75yLTSV34SxkeGXpp6rUnYadK1FrGkhargrVD4wYrnAcCIvvkb3dWQ3F4xPQbLtZB2XFOu2Fv
	MilIuk9cTA8VTmTzlzTpyNIUSDNPdvFOzvlyflQziYVgn1Tqnspg7KlJfz+/x3iXgPynyssw4qd5U
	ySkAz7e4purIX8yii9cwaWNXyHUEOVlaWWhdhuv6QpWkifW9eDMTrHOnuaMeAmTb6MUgbHnGCAvG8
	+xUayFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfi0-0000000HGMi-2B4J;
	Sun, 16 Mar 2025 04:34:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGH-0000000HCL3-2S6S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:06:06 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so8918355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097964; x=1742702764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVJp3+JT7y8+ub6buLRsxOUyy8d6vFpxA5yFbRAEMPI=;
        b=dCUUcTv3uJXTXLjsg9Vz6Gq87VVDYDitkDMF74JhdHO4jp4nDRAbFUWKEEMMHwCQRI
         q4paBW9+PkdtgyOvWfBEnj/u11991PoiZ1kh1zALdfUuE2i+UP1ZUbfNCeNxmEXmtJBu
         X48rMFgDbQmt0vHZUhPHesftzQA9/5jYULK6ylXBscGA+8e3BSEy+lGI9Yil+E/M2uxa
         0Fx5f+3GK+1fMAmSAurKs7hSuF5JYTR7aX27+ohGeQWv2nZVHvSKhITZBdUAHKD73pVi
         D/N7AAtE0dxsiwuIzF9c4OI3G2fcbWK5LXnTNPhfEVBWiOA8PyUv1vhdp7KA0A3mZ3oe
         7M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097964; x=1742702764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVJp3+JT7y8+ub6buLRsxOUyy8d6vFpxA5yFbRAEMPI=;
        b=n3ge0Zcdj9Z4AmYciynduAjSwLsLCASaelj8fzEcRAkgySW0wuudDd87enfmCDlpH2
         mkmkfQjHTl7O5ZZWwtEfhdpr49LpUtERUJ08kfG3Rrq9eL3a1bkZg2z5c9C5NQ8KbduM
         IPCn1DZngTyGI3xZJcngOAAdSXua+IlCgaU7pdLAR2cwddeDx9nbiHJ2kSj5xWQhRYOo
         gfr0GF1bZnsYPLBpX5MadwmAgW+Z7TWa+kXtkQiFs+Zm3AFavdtEwEBC1ZNmvY76cui7
         ImPY/8TfJ+Apet6xi40fDdTuF134tGtHm8hA61GoQP8mksBtilAoWQCAwZL+6dw9IJqC
         dKBg==
X-Forwarded-Encrypted: i=1; AJvYcCWU9p6+J2v2fjGM01i+mPOgSOfUY5EVrFB6LHlOD3fknpOM8EY66GEaW8QRMFlAmjO3g7cQIFhSEK6nIZlwZe7z@lists.infradead.org
X-Gm-Message-State: AOJu0YxfPL/8r1yRaQQ9yIXfgXWhQD1dYDE0xlTUDZezAyo+MXy6bUsj
	fhZhohZP6NBfSEuKNG0nqjALM4I3lS5naNGEyCDbosX0fhzLNMry
X-Gm-Gg: ASbGnctVa8oBDoPHytzzUwRffzCoMiWObw9LZFCDwhf2JENHqZVoIJ+GlbK3Cs64CZF
	oeDfZJZ/BBbg+ZdVSn8JOTNgEFKffW4RbOrvIyX3Wj4aoDKmA0M+EtK2xx9DG8C359yv64yQnrA
	qEX8V9yRCbEDoiwNtwtH9CQbkwrNc+zcXdhl+s7y6wDNxdAkGs82fAnA9M0bDseA1QA5bCcTZkr
	RfxlvBNXUmbH+b0CI5b+NhXxaFapZLOTIuxc2wlNMpgJ8heLWzXK8xcbP3Xbd1uVIG0joA7hYyM
	HpCigoD2kUtvUqmui183UaSqxzwceyNdeNg=
X-Google-Smtp-Source: AGHT+IEqbu6eKdKbUR9hLIUzBRTM7W+fO2MaRKuwN5PjghpeobTfOg76MZ+yqvlOP3B3sgZbmvRoKw==
X-Received: by 2002:a05:600c:3c89:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-43d1ecd7926mr80182815e9.22.1742097964115;
        Sat, 15 Mar 2025 21:06:04 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:70::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d25593a94sm21073705e9.3.2025.03.15.21.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:06:03 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 16/25] rqspinlock: Add macros for rqspinlock usage
Date: Sat, 15 Mar 2025 21:05:32 -0700
Message-ID: <20250316040541.108729-17-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4185; h=from:subject; bh=Yp6VTxKtpBDQhUgfKGSHMWzJmZu3deRDpy/hLhkjXfk=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3d7ne1febSzud04+mu0CKRHqx+H8Jq+gCO2ZsR MN8cyy6JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3QAKCRBM4MiGSL8RykcmD/ 9gTc/RWOMn5cBBm9fdR7z3Whng8H/b1v47vd75XWWl34N0yLT/YWBxTTQ+sPVZzGGuo6B9xsO7eKc9 SZp8I4okxcB2aM74N8m344h+WeCA3ZDdOAN1PStTNACyJB8JKCSwhxf5/MD4VnGmAAvRd7JcgDsl3T lkua13O2hBIxLJEBPb7jFRav4gDcQhaWZZY8+I8wIj4D2LsynzlcQxPMMg/IOGoojbmx1IZpibvTSS cOab748UkW42TGSTq4cdoSqNEyQkllc5IG3CoplNecSOYw91jN/9/nfpRQLlkeNk4MMkIpW1wkerkH stNypWjI3+zMxxxWOpnatrs1AhcbL9xdZy/yI6HeaBpRLCWE7EP2tyRtxMLNP0xZTzDUbhelU5s2xS ISufWNdpb9hhDr2p7Az4+QCAW0/IGguxT1YSSJ3VIvP0PSGYdPGn7h5UGMmLAsKRteUQPiIinHVfjq jswG4p2GalFrgmjtSAlgCOgfnnBgdFSBZ8KrUhAEDyoSkn3oC7EfkzE4RurRDNaK7Dla53h3swFtN6 ebHJiW8K6xEarRowvHg21BJJhRkrGgUz7TcTos8teOYQ7GScBu5AHx4/hAgO+A+G8EAYCC6p9bLmWT uhQX3Azu8Y8rim3+JoGB/tvJ9vAcTAUH3AyLU5MWGMfUmvqRvuAqdg2eMQjQ==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210605_635098_9EF3F1B5 
X-CRM114-Status: GOOD (  20.57  )
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
 include/asm-generic/rqspinlock.h | 87 ++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index a837c6b6abd9..23abd0b8d0f9 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -153,4 +153,91 @@ static __always_inline void release_held_lock_entry(void)
 	this_cpu_dec(rqspinlock_held_locks.cnt);
 }
 
+#ifdef CONFIG_QUEUED_SPINLOCKS
+
+/**
+ * res_spin_lock - acquire a queued spinlock
+ * @lock: Pointer to queued spinlock structure
+ *
+ * Return:
+ * * 0		- Lock was acquired successfully.
+ * * -EDEADLK	- Lock acquisition failed because of AA/ABBA deadlock.
+ * * -ETIMEDOUT - Lock acquisition failed because of timeout.
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
2.47.1


