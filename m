Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAF1C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftGzO2s1hk5aoPF/5zj2qPXt6ZSl0PVETns25Hb5ycw=; b=wsTcTLTPkq5zEnbaBWpJfBprzE
	BuIySytu3LOi+jy1CMKNjwP5IYSwvbgGEUgoliV9lG+vN6SDK2nj+VBwjGmpyBbhlSYmjNeUHa8W4
	VvNfSxJ+YHpy0uhcot1aq68BqQpLS6YLzfa2ZZB2obu+leBzNOaUgbkuMUkatNPCX/qcumqn2iOif
	64F5Xa3Kfji5W1egUfgA7iwELUTLaGIw/j4puOJDzTPoPOlEVYSkLxJoroMntf8CbD3MmqjsNJ2NJ
	GHayZ+n5c1I4z3T2fTbYHCkblTomJB5qiTU3apl0lhp/E2dy+aYVBm6g3hnzN1cGd+Ud1jvvQJjmm
	qRA3qBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8D7-00000001PdG-3X5m;
	Mon, 03 Mar 2025 16:00:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dv-00000001IRG-20Kq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Mar 2025 15:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ftGzO2s1hk5aoPF/5zj2qPXt6ZSl0PVETns25Hb5ycw=; b=Sknx1sw2QOs/SBYNhEaVOKsBLM
	Nypnl1AM550OE//nxxe0bCOl8rVelptcQrdLhJuK7lidOLKRC57E8mcQQQR3mImL0F52zPVo8SXpl
	NxGiE4QGRDB1zp7KGggsjHidZjzoHOiuKNkzZ9mkwy56Er8SOldhDsz16Hv7fRmyDoGFRZWCQSbPj
	5/vEZXpj6XlZRle0yjoo3pDo2VLK9ieK4ODWHwHNPEg57uIyed0NNWUWYKd5bO5w603GrGFEzS33/
	DNAZi4Ocl27TAPmUAVIgimPvVRaZmE9rjjSkTUZeiBc1PdXeHxglZNmh7voYwwYuYylhBrc+Uez74
	oetr6e3g==;
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7ds-00000004a0l-1uII
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:42 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-4394036c0efso29345465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015418; x=1741620218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftGzO2s1hk5aoPF/5zj2qPXt6ZSl0PVETns25Hb5ycw=;
        b=HB3p4OURFJetkfagLTuQ3g+D6tsRItPXhzKdgEqMk9ZdgjW3gq/IlBtp8qxiYxxz/g
         Z05JfX62lQcQKr25jf5EAXy1R10JpdcyahTeWeKPsElg1lCPd4GdkhzVOlGVtewc1qyT
         2O1/dqDbr+zVAPe3YBcE3DtVxFNWHp7S31Vl31C56YscySMKs5SKvUWmtNnQoJDufYrh
         AKuCU5F7wFOFojEeq6L6vugIkZ95HG3rX1vnparl2r8dh0UE4BO5qQGoJofmOfxD1uL+
         OpnZaUTJuuWM/mNZsFCeUUvGVSL7UGEUiP8IRyExpQkFD5emYgEhqYgGsTGaz2t+/awD
         f8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015418; x=1741620218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftGzO2s1hk5aoPF/5zj2qPXt6ZSl0PVETns25Hb5ycw=;
        b=hNxTP4viDvBHLrb+9RjH6vpj0LgngRQuHBMjGT1KMYRcS78Di1/Opqy+iYC0YV6AjK
         5dd9Bjz4Sxax56ExQvXBWjAW8EVbfSoHcdjrKop0DXZU1lPfqpQ3PypXBimlDMPZuI1w
         HqX8kZwY+eM6ia7UGzxIDaqJhmdk0BnRQcUHQVv87votgyfesEsY57sRSxxjwY3FoYRP
         DeN8VlnMCJ3gCAVMBjuA+S5NJTrTKKrMQMjx6vfvrGnofzuw9qMsovawtnhdCYLsj2pU
         9OAGG6b0ja7uFTAaLEpSq1nuViowMT2zLrvD1rObJtm6p6xY9IYn2G2bQAfdAebSKZXL
         HP2w==
X-Forwarded-Encrypted: i=1; AJvYcCVZLVLcbssgGiy+lPPfs9SmOca+Efs9sYl6JkPtEQDEfQjXwLb873neVlPdI16l64x5M7Uv3IH5Wl+S0ncFDQQD@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf0Qus5IO9Lx/zP6srKfs28f5QcleB2Qo5yHjMqHj/dFR+kcoC
	aPFiwCXje8+Wu8sTJT8tx6pT7sWNAwOIldFr47QlUlo748mHHOgR
X-Gm-Gg: ASbGnctli/FiBmIR0lmQxUW3pUe+W4YVDt1vhC/yb4McWIjoFjU0lWl+3ae/hD7Ojua
	63XEjzcH1/BsBQgMKr79HbYeAezybcFNrHhVdZWtjsnN0K+lCX4kNufgpilaZJcoYeir+I0s3wg
	qVI6qoJUrDLFCJDfdLmbpo4NkfhGdtDK9jVdzwqKQS4QRoqTgdzUIeOsoG/8V5IkUOKXaGKL3MG
	Ybzomon6DJb0GBidgOaRpI5i/qSTve8q9TYUrBoqiI22byBby7NyJzi/XCWUyacIIvShukBYLEE
	ngJ1Qjl9ItrBBHemYbVUITwQYaXhRcAAGg==
X-Google-Smtp-Source: AGHT+IFUgzbddleUlZT0ehYk/Y59B0PJMzJQ++IN3Hp+ieXBjwlFjh5Q5E9wkdn7XokNgE0Z1HE0+g==
X-Received: by 2002:a05:600c:190b:b0:439:955d:7ad9 with SMTP id 5b1f17b1804b1-43ba66fe855mr116664525e9.14.1741015418083;
        Mon, 03 Mar 2025 07:23:38 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc63bcaafsm23440385e9.28.2025.03.03.07.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:37 -0800 (PST)
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
Subject: [PATCH bpf-next v3 22/25] bpf: Introduce rqspinlock kfuncs
Date: Mon,  3 Mar 2025 07:23:02 -0800
Message-ID: <20250303152305.3195648-23-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5071; h=from:subject; bh=S1zZ1+V5HXfDNJ9sHSSvG8gCJgMqlpTvJbjPruz8ZRU=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWZSnBmS5ietCtuPE+4pmKWtJULnErXEc4IC9nN w/N0+8KJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFmQAKCRBM4MiGSL8RyvpbD/ 9n03epztxKLKXs5mq2JtSowibMlL/cxUOqIT/Er6iBycLJW6QrV68Gu4EXHFaJ9MZk5E3g2pzTcM3D JO8iLC+CLg/IwzMs+VQkPJBZpTbzrjX8NXMFOVdKOCPuTyBon/w6QQHN+dI0ms1DMMWkcHXpNgvkCp uHYwYc6JsQ4WUGaza1Vx3zZFXhgnXCN7o74lDcriARO1+lcB8Se5+bLCMqU6hcPK03ccyXEFk3RrYH c5lUO3C9t8W0edpQE1LWCGNLwrhhNivyOOOk7vLbdm4Exk01CJuRc5bDzvHgykGNsJg/UDR2EMGFIK 4uj6moeuOAxJcYm832dS62gCEz5OxXOr2LOg1Ee2XdP2obxhEA9pFLKdvbXo59xMfmioEC2XKuP0T3 WjHNHXhqtKaYrns10R6ilDge5CWxKksBPL30/9UkZDy9ERjZkfyD/SDxhmVdNy5ExqHKZCanzFCnMv iDoBAewmWR2hj287w0kBdw7CHaoPg9/HIyKMCv0MImIHZlzDasPBMAXnJaYyY0V7LM2fwr3F0UuOFF DrPYoPvey+vLaRgS1kIfcBQHd6v9z4fLn9JPWdc5ggzlJdRI3a8rLp2gDF14/LcQZJzK3T86HKBGUn Sv9e4xwbZoBil2FPHRU7/R9ghWKfT+cmbi6Iu1+TkNXFlGRHV+TPloE9KwMg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_152340_738530_50DEB8C0 
X-CRM114-Status: GOOD (  19.07  )
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
index 418b652e0249..06906489d9ba 100644
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
index 4c4028d865ee..aa47e11371b3 100644
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
index 0031a1bfbd4e..0c53d36e2f6c 100644
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
@@ -684,3 +686,79 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
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


