Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06620C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VnxgBQ3rAJeGHFIGyB+ChpGIi/1tYmBGxWhiMsjK7I=; b=LODjpst1dolycWQYSOeexltXbY
	BWuTuumSye3S9OR/5HhxLI5PzgqcACKgV1MpYsP48xLp+RVQLxYwn2QgIm7eDWrMYTZG7DC3CXDzu
	3gaYTKQBu93903T8Nt/Z3HgQMW9aIZDZvRI8djiHd4jhbuGcXHGpIZPl8EejwzEfQd/ClEv4SrczY
	GqmqLKtchqXWPazKC5TqdQ8UmchcGiRqLASLyucqdJmx/U9GX4IKzNi+AuGhHWZol9egogd6hiLKk
	Bxj3kNkQoyXk5EBcHBHR977asMQtAkHDp8Mcxla2uv0WflI5VAdNIb4w0tZOWTHMPtSJvbZ5avcDZ
	/yTPMLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfrr-0000000HH9L-3mAI;
	Sun, 16 Mar 2025 04:44:55 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGO-0000000HCQc-2wwp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:06:13 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso5885745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097971; x=1742702771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VnxgBQ3rAJeGHFIGyB+ChpGIi/1tYmBGxWhiMsjK7I=;
        b=DGasknkeUgABWJ0ivInfb5pHcwGHrSS160Qkaont6y+xonbuzxGJHYOdas6fUCnFHy
         Upy+9wsSTnsZHdoRc62YiaWKkba9lNN2LLzDzg5dkUFCwlFBGWoVdx3M3Cd5vfVW4WgA
         yqOg4tyFzO1MfcdpL/A7ClqgPfEstpo6EGFyObYQu5XfH4BJuKSrSK9hNbn3Ie95JqvI
         RHxYMPtNUlOeLQRTSSVpa2IojbiTZNLdlJpSOzzK0ip+U5twml7xw1oPJTptpSRcnkxA
         kZY7GUTbmOS8EQR/t+tQzXJOIiuaDaa2k+QrfEXWpuhhGZS0Qaz8rZ70WdLf9iLTTW7Y
         Pg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097971; x=1742702771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VnxgBQ3rAJeGHFIGyB+ChpGIi/1tYmBGxWhiMsjK7I=;
        b=vtkoN/D4aFJikbR8vTsD0KaCg/WqmiVnU4Ijy6wXE7iadKSS23js93rAMoBe+N3W5x
         dcQaWgTypklsaVvJP20dKQRWuvIEFyElg//JjKndpvaETS0wXgfzcjLPp7O5sFiPBkn3
         GoPokAfiqXCxIOx0gwVB4lBnZEHLAMhGcFxdbWC+Phd6JIaxBXT1+83ET29KbUqmwrJ4
         Nf40+3pP4Ywuyi2sRsrNg6BOBPm1AfNCftYb9ywDSpwEFTTekP94rBNzCrdfxMIXGwtA
         Z96tgOuWPskf/dNk4cM21DIMAqfV2WbnrZm1rmzsD+lpqm2mAK+TrzzrrbEMAwhIQ/t4
         mlpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzj8whWhQQwFWqlYND6VP+meeQ/q2whb/Ex0HdDjCDJfZBYbk2D+XwJI6jou89UHhNb5dVkHUWLxlBAUBTPdJE@lists.infradead.org
X-Gm-Message-State: AOJu0YxGMagjT/bODJC5p0gSGD5zXnqhMadHPlswX/mm3N6luD0CvYcv
	A8unWYShiQL+fBZWcMgdjef8ZqS7aKHpNpahIImFAYd5azIK0CPw
X-Gm-Gg: ASbGnctAR1uYcoPr/LUST5WMjPG4GiAnI5ijG4bLvCIwM6iF5WAb7c7dKcJoTryjgTB
	Xgoo1C+PJo9KwvLDR1zYkmy/kCbB1VU+YEbhtFEwPfrPnLi88TGVQHUmtpOMCsViKYiKUc1WWmh
	6Ua+uP2laDTGAdAQXedUr76n56N1njbIJh6lYF2VbCVlLeM2NFCRZHyL0S05M0C8lL3Jsx3lJ1U
	6VQUOZHyKvptc4NQW5OmWZFTfZlV6Wqd/f1o37yhZuheLHb7bP07Q8ELzo21bSzFUO7ZIXZ003K
	8Qgraypaor3T72WE+209mH9DdzvMOW4K4oGPYGxxHXuoKA==
X-Google-Smtp-Source: AGHT+IHykLJ5NvwHyRbYtDv/1bZEgjZY12X6M0CYxwI6OW/IzydFKfy0Lmd5AEeKjh0K2mfT3jL26Q==
X-Received: by 2002:a7b:c2a9:0:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-43d1806bfc6mr111911795e9.5.1742097971213;
        Sat, 15 Mar 2025 21:06:11 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:72::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb92csm11124023f8f.91.2025.03.15.21.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:06:10 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 22/25] bpf: Introduce rqspinlock kfuncs
Date: Sat, 15 Mar 2025 21:05:38 -0700
Message-ID: <20250316040541.108729-23-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5059; h=from:subject; bh=5BKl9hYgLyro6F1bzOCMfYjd/K5FyedLnNqGmCHan+A=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3e+fudrbbc/TgS+/ixztDuZ5UbJUeXYBElGNak SEdzC0OJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3gAKCRBM4MiGSL8Ryqz4D/ oCflyjgtF5/HlKZj4F2D61xd+E+vDVH2+zf1tMkPdHH8lyU299BGDRQqY2WtOTwcBLUY9OqorBhQ8H rjwEGY2fs77qokXPHkKwGo9ZCV9KoFXcx2t1akp8zymB9tkkxVrbMvKrD4LJLkmJp4+0Gk0P4dmTT6 uL5NE4sFMWsPdIdSevyjlGvL/98JDGWrIzfqzVSbHA9M6AJbeyaL5upuniadERgB4b7/UNXbBeSzt4 ZLFS9zpB8NYwZecwzgOydM6/jWOQPjeh0pUyf8lwSq17ZzhYsHp2945rJhtVwSxt82T3WDRPib5MTU 7t4sgoBzUKN9xFg23oq0eZbuWRdF0BXps6RORdd5fgrSHtEYt5KHaSYff51NxW87b+eNlFzdKM57pA Pez01gQmSKdydkbA0jpu+VYH962Jkoigu2ho3Khwrr2JuWqOcAz+5Y/SnXDhbU8W/UpTH3SK2Wy4kF QMpW9/D0CW2bAdIgChF/jU9dRdCKMMLFH+OpADrQQfn4zvU7cWdzA/1BPNh0bLBYEX7K2va7cXSA+g uHGz5ivgqNl9TakLfq+7exi7BFGrnYDGJZ9qjvtAdu3EDnpEX3iX5MFWcOfOHBmWnOTiGMi5x2ks/7 zQL3CJIhr4Uc+LeK+wpPS9WJnwsrk8CuEMSTyIC9XeeQUQWEeb4pfptwOM1A==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210612_842050_BE294CF5 
X-CRM114-Status: GOOD (  19.41  )
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

Introduce four new kfuncs, bpf_res_spin_lock, and bpf_res_spin_unlock,
and their irqsave/irqrestore variants, which wrap the rqspinlock APIs.
bpf_res_spin_lock returns a conditional result, depending on whether the
lock was acquired (NULL is returned when lock acquisition succeeds,
non-NULL upon failure). The memory pointed to by the returned pointer
upon failure can be dereferenced after the NULL check to obtain the
error code.

Instead of using the old bpf_spin_lock type, introduce a new type with
the same layout, and the same alignment, but a different name to avoid
type confusion.

Preemption is disabled upon successful lock acquisition, however IRQs
are not. Special kfuncs can be introduced later to allow disabling IRQs
when taking a spin lock. Resilient locks are safe against AA deadlocks,
hence not disabling IRQs currently does not allow violation of kernel
safety.

__irq_flag annotation is used to accept IRQ flags for the IRQ-variants,
with the same semantics as existing bpf_local_irq_{save, restore}.

These kfuncs will require additional verifier-side support in subsequent
commits, to allow programs to hold multiple locks at the same time.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h |  7 +++
 include/linux/bpf.h              |  1 +
 kernel/bpf/rqspinlock.c          | 78 ++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index 23abd0b8d0f9..6d4244d643df 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -23,6 +23,13 @@ struct rqspinlock {
 	};
 };
 
+/* Even though this is same as struct rqspinlock, we need to emit a distinct
+ * type in BTF for BPF programs.
+ */
+struct bpf_res_spin_lock {
+	u32 val;
+};
+
 struct qspinlock;
 #ifdef CONFIG_QUEUED_SPINLOCKS
 typedef struct qspinlock rqspinlock_t;
diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 0d7b70124d81..a6bc687d6300 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -30,6 +30,7 @@
 #include <linux/static_call.h>
 #include <linux/memcontrol.h>
 #include <linux/cfi.h>
+#include <asm/rqspinlock.h>
 
 struct bpf_verifier_env;
 struct bpf_verifier_log;
diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index ad0fc35c647e..cf417a736559 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -15,6 +15,8 @@
 
 #include <linux/smp.h>
 #include <linux/bug.h>
+#include <linux/bpf.h>
+#include <linux/err.h>
 #include <linux/cpumask.h>
 #include <linux/percpu.h>
 #include <linux/hardirq.h>
@@ -690,3 +692,79 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 EXPORT_SYMBOL_GPL(resilient_queued_spin_lock_slowpath);
 
 #endif /* CONFIG_QUEUED_SPINLOCKS */
+
+__bpf_kfunc_start_defs();
+
+#define REPORT_STR(ret) ({ ret == -ETIMEDOUT ? "Timeout detected" : "AA or ABBA deadlock detected"; })
+
+__bpf_kfunc int bpf_res_spin_lock(struct bpf_res_spin_lock *lock)
+{
+	int ret;
+
+	BUILD_BUG_ON(sizeof(rqspinlock_t) != sizeof(struct bpf_res_spin_lock));
+	BUILD_BUG_ON(__alignof__(rqspinlock_t) != __alignof__(struct bpf_res_spin_lock));
+
+	preempt_disable();
+	ret = res_spin_lock((rqspinlock_t *)lock);
+	if (unlikely(ret)) {
+		preempt_enable();
+		rqspinlock_report_violation(REPORT_STR(ret), lock);
+		return ret;
+	}
+	return 0;
+}
+
+__bpf_kfunc void bpf_res_spin_unlock(struct bpf_res_spin_lock *lock)
+{
+	res_spin_unlock((rqspinlock_t *)lock);
+	preempt_enable();
+}
+
+__bpf_kfunc int bpf_res_spin_lock_irqsave(struct bpf_res_spin_lock *lock, unsigned long *flags__irq_flag)
+{
+	u64 *ptr = (u64 *)flags__irq_flag;
+	unsigned long flags;
+	int ret;
+
+	preempt_disable();
+	local_irq_save(flags);
+	ret = res_spin_lock((rqspinlock_t *)lock);
+	if (unlikely(ret)) {
+		local_irq_restore(flags);
+		preempt_enable();
+		rqspinlock_report_violation(REPORT_STR(ret), lock);
+		return ret;
+	}
+	*ptr = flags;
+	return 0;
+}
+
+__bpf_kfunc void bpf_res_spin_unlock_irqrestore(struct bpf_res_spin_lock *lock, unsigned long *flags__irq_flag)
+{
+	u64 *ptr = (u64 *)flags__irq_flag;
+	unsigned long flags = *ptr;
+
+	res_spin_unlock((rqspinlock_t *)lock);
+	local_irq_restore(flags);
+	preempt_enable();
+}
+
+__bpf_kfunc_end_defs();
+
+BTF_KFUNCS_START(rqspinlock_kfunc_ids)
+BTF_ID_FLAGS(func, bpf_res_spin_lock, KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_res_spin_unlock)
+BTF_ID_FLAGS(func, bpf_res_spin_lock_irqsave, KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_res_spin_unlock_irqrestore)
+BTF_KFUNCS_END(rqspinlock_kfunc_ids)
+
+static const struct btf_kfunc_id_set rqspinlock_kfunc_set = {
+	.owner = THIS_MODULE,
+	.set = &rqspinlock_kfunc_ids,
+};
+
+static __init int rqspinlock_register_kfuncs(void)
+{
+	return register_btf_kfunc_id_set(BPF_PROG_TYPE_UNSPEC, &rqspinlock_kfunc_set);
+}
+late_initcall(rqspinlock_register_kfuncs);
-- 
2.47.1


