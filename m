Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F018C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WY5xY00eKUhPVaK5CMP9UKPxhBmvTRnKdfB0Ehrzj4c=; b=Po/LtjjitqgLunArbsprMkOncq
	SWO3Arkyk7Ctpa0olvQZ3CZWLDDWkE/NF9kSaBGGf5bwK8cU1tl28COqd7B46gZZYCHYA6LLhoGOk
	PbiyUf7DDuCOnFq9k8uEtWDMrWbPxXaqjRv9DZUhgqdEk3+t7ct7maF59watebwRfJpnfvpyTtQos
	bicHtg1HJ71npRiURdP159xSodFOa/z6LhfqZoxgVNrhf7S/onwwaUiKmBjRZV3DSm9wTduUmq2fO
	k5UOl9LWC4Sw3weSYDxBl6DBjMGBx23dcc3ZcPHzjFzWoyvBxVUlOdsIYgMjuKvpVDiWC/pVXyXpb
	snjbZX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg01l-000000068Iu-2Rz2;
	Thu, 06 Feb 2025 11:26:37 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXI-000000061h3-2RiT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:09 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-38db34a5c5fso325962f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839307; x=1739444107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WY5xY00eKUhPVaK5CMP9UKPxhBmvTRnKdfB0Ehrzj4c=;
        b=jOQG4NlunM13H6UfqAtc6RPtsHbb4La6roHobA6d7HdqtWnGefh0Y95XmSUittdbNs
         CIpo/rG5oyvRGAYp5Trl41uTb5DQj6rAQUfXOtve0mfhQxjLvmrSpCtORmDyBuxoU85F
         wjvwrhVZcMpCc6cA28TfjRqnYgIBiedUg0fq1qccPSQbgE9QVVB8PftX5Hp4Q5DTY6Dq
         AjFKI3ocrSxZeckCQNwbjtlW5XCPvdqckoPjS683GRn8eC9AraRL2Gmgolz1vsKMObiN
         TOJhHqjgRxiuMXJ5bEYVAXGql9nX168WOPZ6qGVvbIL8CTFGmCIMi/mZC1tPJKjtD6J5
         6CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839307; x=1739444107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WY5xY00eKUhPVaK5CMP9UKPxhBmvTRnKdfB0Ehrzj4c=;
        b=mffqOREsCDam1/nVgNleue+/+L4sT6ZeOaSjCayUycwfUN+td8F238FpUmxBdUGUN5
         01fUj3m1hO1HMIsz5N4H+MOGbimhK6AlcMDFbQocLVxGKcWkqFVNKsZr6OAMt7Ja4sJK
         B7IuoT61dY/sJqw0dIaM2C1OxbIqCO1Re6ff/gx4PtsWPAGpfkVbxy40fqvnuzpnqhMU
         OWN5OplIBMP0yzu/uhxS9j9Kb62/MQIGp1EMPshxiCUvK/J81IjQC9JNfW6KUVKWJHz9
         0xuJpjxF5qdOTiW0ThybhT9J8KA3eHJFUuttefDYGbqMoi5omkiF0qTAEiCg89TG19GD
         ndBw==
X-Forwarded-Encrypted: i=1; AJvYcCXYFYvSIM6C8NJw6M1k2zSRdVsabfkBcnwTAXaNHlaIeqzjAM2Dr/nFdmyB7QItfeacVuiAXCfK3iywjjgm+qqg@lists.infradead.org
X-Gm-Message-State: AOJu0YxaSpZOalEFot34+/F11Fu4p0PxWY+EYpPSHyPQnnsz7Kzr4v/7
	LnLTvTLDFKAHFJWN2NW+Bb/ELQwtEbOr8SZYi+XnkGn9L/v8GVeJ
X-Gm-Gg: ASbGncvu9HiQrUeDv4vDSeR8xR2uUjgAyr0fpOy/hSTJUwua4ohcjGaFe9zV0AFnQuv
	Qx/38uZqoZGxA9tyG5NCSWGjzw7lPPO0Xm52I89WJmqpKu8hcygWU5XjqONGIXX9Pl1EwKsk16A
	btjBc1mRlxmoRRQ/elxBouhexfm3eMQB4iMo1Ui4yl1b5HAutKjXgzmeCEUiyxyJodxYTPwvivo
	Z1dgoykRj705cf18I4xuj9dhk47zoVanVKyCopEyKau/oD3ASXsC9HyrPUxYEaOvID9eEJKp2qq
	1EF2
X-Google-Smtp-Source: AGHT+IG9zXGoXyJKKHaq7JsfFOdulH8qStWXMMx7WVjIkbMNF6mgU4TITTZXCi7em7sIZ7mcLjLv5Q==
X-Received: by 2002:a05:6000:1567:b0:38a:5ce8:df51 with SMTP id ffacd0b85a97d-38db4857bb6mr4346951f8f.2.1738839307068;
        Thu, 06 Feb 2025 02:55:07 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:1::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1ddaesm1381571f8f.85.2025.02.06.02.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:55:06 -0800 (PST)
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
Subject: [PATCH bpf-next v2 22/26] bpf: Introduce rqspinlock kfuncs
Date: Thu,  6 Feb 2025 02:54:30 -0800
Message-ID: <20250206105435.2159977-23-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5071; h=from:subject; bh=U/xq8I6EBeEZJrIOy3nlwnF6weOW6zwHeOpg6R+a+Dg=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRnGE3AZgPoVzGUtERg5LFCbq+DcCX9yF59ua8N n7+cbDKJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZwAKCRBM4MiGSL8RylLaD/ 0VpOorKWab0lqsTn/JbqVIfhX2mJDl4AszKROjW7ZbWS/ibRaNsagLSEBcUQD0xf70owiN9Yu/4znW OJaUpWXS7tNbAxPV2AbNa13K/5M2I9XFuZ6Ma44gw7XUBL2+eLtpDnsloEntdH23CIdCBlFgVoMhZi /9B64BlcRvucuNxfRyundNxbRTbW+WL+gdtObdVpvurkEZPU7XSKLpbhrzZvQ4wxTGIf/25YvUVXE4 S4KSqSp0B49pkPN4G9xW/jIyjgX3WLAwBlhBHZ6f15+/NQ+pg/hwN9hKNNehLoCE2vircPueBHstEE KegTCjgg9BggHBOklhXRKvmGFOY2CVPkx96cbQhQZG615Mp2ODEKab08GpR6au3L0Lg1QT3JQbi+tU DKBdLQMl1MjDsazZBZ1VwoZL4CT5etgBB13PQWNVWlid9dl1osLUMQE9UJ/QAqUtZVfz88GpkskFmi ol2YvLHaQVsp/3n/N56wQok42wK/y+P/xvxYD1rz0ExOWlNuLbEBjbjgFZsEQ1KAlLg2XUnKJ4yMrB aBVOWnLHU2q3mFDWBNz/iUcF0U3KO0efHZsiu7NYItC7HDIgvosgX8QFMNIjDG1EfiEFvUcisgaxYH JcTYydI991Jqy6AeM9QpCB99Wg4k4tVqvmj18ICTymjWeNb7929I4r8679rA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025508_622750_00D90245 
X-CRM114-Status: GOOD (  19.46  )
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
 kernel/locking/rqspinlock.c      | 78 ++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index 46119fc768b8..8249c2da09ad 100644
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
index f3f50e29d639..35af09ee6a2c 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -30,6 +30,7 @@
 #include <linux/static_call.h>
 #include <linux/memcontrol.h>
 #include <linux/cfi.h>
+#include <asm/rqspinlock.h>
 
 struct bpf_verifier_env;
 struct bpf_verifier_log;
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index b4cceeecf29c..d05333203671 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -15,6 +15,8 @@
 
 #include <linux/smp.h>
 #include <linux/bug.h>
+#include <linux/bpf.h>
+#include <linux/err.h>
 #include <linux/cpumask.h>
 #include <linux/percpu.h>
 #include <linux/hardirq.h>
@@ -686,3 +688,79 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 EXPORT_SYMBOL(resilient_queued_spin_lock_slowpath);
 
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
2.43.5


