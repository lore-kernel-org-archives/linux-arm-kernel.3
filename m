Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859D6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjwed54Vqji5j5yoD9/wFQ/aRgNfk0MsQVfeIXpdSXQ=; b=3m5U9Q5RkciD5Lz3jbJVpbw1OR
	uTYFVzwUhARv9gnqoq5LVe9yvkTJB2GVq1Zd85cSVyBxx/I6eowwdh+W1tsYhfG0UT1SA/B8WRgGe
	i+MA7ryn3TeVKgzz1/cIibUpO9/EtA1lqYPfcRGuANkgY6fmHodJc1NvmAYVbobVMgYdfVFPQkpaN
	l2WJzocwyY/rov4wTDWBhpMhn+CEZzn0W7JRuf5M5HY6QNq+sYCUvL409oCVNe3ppxx+za62zf7Tn
	2LN/K49v1s9Rlfm60lZ2gyBrH7A0RkIc8r42s7nZrcC1PziDetrY1IBZOZs4QAzpkENlMV9gVIAkb
	x1YI3/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfoa-0000000HGsq-1YrK;
	Sun, 16 Mar 2025 04:41:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGM-0000000HCOh-1jma
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:06:12 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso1885958f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097969; x=1742702769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjwed54Vqji5j5yoD9/wFQ/aRgNfk0MsQVfeIXpdSXQ=;
        b=IFITeoEwBJXYwaABHQgU0SHkHBJ3rXE6mOnOo6EXgIR8a0QMHEIjx6jN50q62W7QMR
         CO5FTgO3mH2a+DonkZd/SmumFH1DKY0+VuU3Vf7QELbAAdMxvGf80JiGnnJBYCtgw9q2
         uGfZDl9b9CIsNnSlycJJUmyiLffQS1PRuEK6MQ8QcqehDzEK3IT+h1yammCbXUjQMY7d
         QI/uxhc/SiVTjfdEAni7I+Q2hQAtc8zgEGwBFZ5BPXSo+ehvSGCMPwS5NWEupD9QiSrK
         9sFQRJE0/MwNWws98HqcG2hAvGc3gWT1hqr+unH+HoGzl2ehAJ89vHo/enTGJMyJPW4N
         wQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097969; x=1742702769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjwed54Vqji5j5yoD9/wFQ/aRgNfk0MsQVfeIXpdSXQ=;
        b=HEv1RRmJRDnsIbjiZz6rycit1VN6L9raJPRAfzJFtIKFgcAYnRbOH7kL9hB+Y8PM+Y
         VO4qwGP4ErGD39JIjjeF7BMG0eXVSfuzZXBG3Zfjk8AJeSqFX9NNAfZDc+83gmEP/ETm
         OP7YwifA7Z/1lQt8uSCHRnnV6AIvo7GVDjfJrmjuiLHk5+E2R5o/I4lfuDUwR1+hHghH
         f2EW8Adupei9Qpf7E1cf2RRKMEAObLg7LGNYlEskAFYlrFPhytTaWFbdr+tTMhbRIDCg
         TfDE+u1R8tx+r7Gg26Uvp0HVAKZhb2s65xtQ44DFBYKLqlK4twvVbmUem7LIHgdIyFlz
         NGOw==
X-Forwarded-Encrypted: i=1; AJvYcCXGTkdKTBZ6uvLL71GMVnfvzOPrtr4es3AtpkSFxHAVobgkpMAxjaeGo+pVfqXD/lFoNdMI19ru0k4OdLnbU/N0@lists.infradead.org
X-Gm-Message-State: AOJu0YywkdiM6IMX3tx1opPRAt9VS6UqcAjzKCJIumml+b5R2y1AYEf5
	QvO018lysTolCutG2aWoFpweHBbGCzMmmAuHTgCv4bGotAnIIf/D
X-Gm-Gg: ASbGnctsK2Xmvp2Vhz87kqLClQ+9SNTgm7fn9R88IW+gDshC81LJLnrFwGEtPYO/9CC
	7Zelw+HTqEtC1W2C0zIa+6D6+DhKpl0iDxZ9gSTD1psr6NsZ+jKwn4jwv6YRk14+YcF3wdiuuz4
	LHnXkOyfzPZJOdO/OTgXzOByGCjqROMyrpiqE1nScH3XnU5GGcAR7Ms/Zx9xONwwH/fuY7W4PSD
	K7m5l9spVA4Qykb41Pgdcs3Bw6lTcngquwcDkLzSzmqDQ28dpa2hhSviwr/2boGc9Vj4YdauM/0
	9GcBHQBjwh6NeYSiUipvQZQsVDmeMnY3Qw==
X-Google-Smtp-Source: AGHT+IGK4qXm9ArrLCXgXNAYLraEfl7iQZEVMYeN5XftPU/x8Co4B5Nq48EhLKMbp6h132WBFeRBuQ==
X-Received: by 2002:a5d:5f8f:0:b0:38f:38eb:fcfc with SMTP id ffacd0b85a97d-3971d136069mr9762245f8f.7.1742097968994;
        Sat, 15 Mar 2025 21:06:08 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:5::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fdda152sm67916635e9.1.2025.03.15.21.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:06:08 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 20/25] bpf: Convert percpu_freelist.c to rqspinlock
Date: Sat, 15 Mar 2025 21:05:36 -0700
Message-ID: <20250316040541.108729-21-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6720; h=from:subject; bh=9q6tMvL0KIAbFk+sY/U9KRjErNQz0NSPRbrt2C3ZJkE=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3eRwoCpVBivHRVCIfYOVJ3bSQqELoQ3YdqIHaZ 0Qn/pVmJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3gAKCRBM4MiGSL8RyhG8D/ 4gZK23dPYHGv97XCNumvumPpE5iAC1RvxTgRMG3f8G3jsmtWgXSKJJX0I/LPV9SIjEVENK69dF8OYo JtJzi6M0frKXWOH3i348qYosuOyV2drlvwfNUUEFB30EDCZyh15S5rPPv1UpNngps6KckmlscR7wKN MXqabQVbUGrYpUvjSK5gYCr7BOGqDYpZ1XagCXPKfXCOsOOn1H3cDaPCfaf8XxgcflHHLVxFBMvW9y +YzbVai2PpwEalAolVi6/DC77pJhgfX7rwqhMncu4/xkyFnH87t5JONBFJHZf45QeGx0A4agc9nOg8 rxjniya94z/TfDYqZLAfQEZIV9kAGOUMvPwhEnXyYuDHDDRec7tKNSO+P2IUb2hYefVM3Ghm0n4p0P CmZc9N/Y2GIRXvVl4VLGwfu/ensS1wCFj82w76Ig1qpUYwppwWkH9o5bWb9dv3U8lmN3c8F9NHEx1o OIsPoR47YLMoasxqRtXiWe2dvZbilJdVqJelZipX4dCEyIoC+1YYy6r2/ftW3XakSo6UWBre8hFohm bGJu1Qo3BxBDSej8CFT3E3KsVzZ5XVrF/RPr0liFKY5TyEV1kO33w/oEzrui9Z/irDz8gIF9aF4Y8z u+gd5bcIJtqR98WDZhEnXhXlVzZ3ZFtHlkSpmLfDqE0N5VNrh6rqLtwffGVA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210610_479951_C05AD7CF 
X-CRM114-Status: GOOD (  20.34  )
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

Convert the percpu_freelist.c code to use rqspinlock, and remove the
extralist fallback and trylock-based acquisitions to avoid deadlocks.

Key thing to note is the retained while (true) loop to search through
other CPUs when failing to push a node due to locking errors. This
retains the behavior of the old code, where it would keep trying until
it would be able to successfully push the node back into the freelist of
a CPU.

Technically, we should start iteration for this loop from
raw_smp_processor_id() + 1, but to avoid hitting the edge of nr_cpus,
we skip execution in the loop body instead.

Closes: https://lore.kernel.org/bpf/CAPPBnEa1_pZ6W24+WwtcNFvTUHTHO7KUmzEbOcMqxp+m2o15qQ@mail.gmail.com
Closes: https://lore.kernel.org/bpf/CAPPBnEYm+9zduStsZaDnq93q1jPLqO-PiKX9jy0MuL8LCXmCrQ@mail.gmail.com
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/bpf/percpu_freelist.c | 113 ++++++++---------------------------
 kernel/bpf/percpu_freelist.h |   4 +-
 2 files changed, 27 insertions(+), 90 deletions(-)

diff --git a/kernel/bpf/percpu_freelist.c b/kernel/bpf/percpu_freelist.c
index 034cf87b54e9..632762b57299 100644
--- a/kernel/bpf/percpu_freelist.c
+++ b/kernel/bpf/percpu_freelist.c
@@ -14,11 +14,9 @@ int pcpu_freelist_init(struct pcpu_freelist *s)
 	for_each_possible_cpu(cpu) {
 		struct pcpu_freelist_head *head = per_cpu_ptr(s->freelist, cpu);
 
-		raw_spin_lock_init(&head->lock);
+		raw_res_spin_lock_init(&head->lock);
 		head->first = NULL;
 	}
-	raw_spin_lock_init(&s->extralist.lock);
-	s->extralist.first = NULL;
 	return 0;
 }
 
@@ -34,58 +32,39 @@ static inline void pcpu_freelist_push_node(struct pcpu_freelist_head *head,
 	WRITE_ONCE(head->first, node);
 }
 
-static inline void ___pcpu_freelist_push(struct pcpu_freelist_head *head,
+static inline bool ___pcpu_freelist_push(struct pcpu_freelist_head *head,
 					 struct pcpu_freelist_node *node)
 {
-	raw_spin_lock(&head->lock);
-	pcpu_freelist_push_node(head, node);
-	raw_spin_unlock(&head->lock);
-}
-
-static inline bool pcpu_freelist_try_push_extra(struct pcpu_freelist *s,
-						struct pcpu_freelist_node *node)
-{
-	if (!raw_spin_trylock(&s->extralist.lock))
+	if (raw_res_spin_lock(&head->lock))
 		return false;
-
-	pcpu_freelist_push_node(&s->extralist, node);
-	raw_spin_unlock(&s->extralist.lock);
+	pcpu_freelist_push_node(head, node);
+	raw_res_spin_unlock(&head->lock);
 	return true;
 }
 
-static inline void ___pcpu_freelist_push_nmi(struct pcpu_freelist *s,
-					     struct pcpu_freelist_node *node)
+void __pcpu_freelist_push(struct pcpu_freelist *s,
+			struct pcpu_freelist_node *node)
 {
-	int cpu, orig_cpu;
+	struct pcpu_freelist_head *head;
+	int cpu;
 
-	orig_cpu = raw_smp_processor_id();
-	while (1) {
-		for_each_cpu_wrap(cpu, cpu_possible_mask, orig_cpu) {
-			struct pcpu_freelist_head *head;
+	if (___pcpu_freelist_push(this_cpu_ptr(s->freelist), node))
+		return;
 
+	while (true) {
+		for_each_cpu_wrap(cpu, cpu_possible_mask, raw_smp_processor_id()) {
+			if (cpu == raw_smp_processor_id())
+				continue;
 			head = per_cpu_ptr(s->freelist, cpu);
-			if (raw_spin_trylock(&head->lock)) {
-				pcpu_freelist_push_node(head, node);
-				raw_spin_unlock(&head->lock);
-				return;
-			}
-		}
-
-		/* cannot lock any per cpu lock, try extralist */
-		if (pcpu_freelist_try_push_extra(s, node))
+			if (raw_res_spin_lock(&head->lock))
+				continue;
+			pcpu_freelist_push_node(head, node);
+			raw_res_spin_unlock(&head->lock);
 			return;
+		}
 	}
 }
 
-void __pcpu_freelist_push(struct pcpu_freelist *s,
-			struct pcpu_freelist_node *node)
-{
-	if (in_nmi())
-		___pcpu_freelist_push_nmi(s, node);
-	else
-		___pcpu_freelist_push(this_cpu_ptr(s->freelist), node);
-}
-
 void pcpu_freelist_push(struct pcpu_freelist *s,
 			struct pcpu_freelist_node *node)
 {
@@ -120,71 +99,29 @@ void pcpu_freelist_populate(struct pcpu_freelist *s, void *buf, u32 elem_size,
 
 static struct pcpu_freelist_node *___pcpu_freelist_pop(struct pcpu_freelist *s)
 {
+	struct pcpu_freelist_node *node = NULL;
 	struct pcpu_freelist_head *head;
-	struct pcpu_freelist_node *node;
 	int cpu;
 
 	for_each_cpu_wrap(cpu, cpu_possible_mask, raw_smp_processor_id()) {
 		head = per_cpu_ptr(s->freelist, cpu);
 		if (!READ_ONCE(head->first))
 			continue;
-		raw_spin_lock(&head->lock);
+		if (raw_res_spin_lock(&head->lock))
+			continue;
 		node = head->first;
 		if (node) {
 			WRITE_ONCE(head->first, node->next);
-			raw_spin_unlock(&head->lock);
+			raw_res_spin_unlock(&head->lock);
 			return node;
 		}
-		raw_spin_unlock(&head->lock);
+		raw_res_spin_unlock(&head->lock);
 	}
-
-	/* per cpu lists are all empty, try extralist */
-	if (!READ_ONCE(s->extralist.first))
-		return NULL;
-	raw_spin_lock(&s->extralist.lock);
-	node = s->extralist.first;
-	if (node)
-		WRITE_ONCE(s->extralist.first, node->next);
-	raw_spin_unlock(&s->extralist.lock);
-	return node;
-}
-
-static struct pcpu_freelist_node *
-___pcpu_freelist_pop_nmi(struct pcpu_freelist *s)
-{
-	struct pcpu_freelist_head *head;
-	struct pcpu_freelist_node *node;
-	int cpu;
-
-	for_each_cpu_wrap(cpu, cpu_possible_mask, raw_smp_processor_id()) {
-		head = per_cpu_ptr(s->freelist, cpu);
-		if (!READ_ONCE(head->first))
-			continue;
-		if (raw_spin_trylock(&head->lock)) {
-			node = head->first;
-			if (node) {
-				WRITE_ONCE(head->first, node->next);
-				raw_spin_unlock(&head->lock);
-				return node;
-			}
-			raw_spin_unlock(&head->lock);
-		}
-	}
-
-	/* cannot pop from per cpu lists, try extralist */
-	if (!READ_ONCE(s->extralist.first) || !raw_spin_trylock(&s->extralist.lock))
-		return NULL;
-	node = s->extralist.first;
-	if (node)
-		WRITE_ONCE(s->extralist.first, node->next);
-	raw_spin_unlock(&s->extralist.lock);
 	return node;
 }
 
 struct pcpu_freelist_node *__pcpu_freelist_pop(struct pcpu_freelist *s)
 {
-	if (in_nmi())
-		return ___pcpu_freelist_pop_nmi(s);
 	return ___pcpu_freelist_pop(s);
 }
 
diff --git a/kernel/bpf/percpu_freelist.h b/kernel/bpf/percpu_freelist.h
index 3c76553cfe57..914798b74967 100644
--- a/kernel/bpf/percpu_freelist.h
+++ b/kernel/bpf/percpu_freelist.h
@@ -5,15 +5,15 @@
 #define __PERCPU_FREELIST_H__
 #include <linux/spinlock.h>
 #include <linux/percpu.h>
+#include <asm/rqspinlock.h>
 
 struct pcpu_freelist_head {
 	struct pcpu_freelist_node *first;
-	raw_spinlock_t lock;
+	rqspinlock_t lock;
 };
 
 struct pcpu_freelist {
 	struct pcpu_freelist_head __percpu *freelist;
-	struct pcpu_freelist_head extralist;
 };
 
 struct pcpu_freelist_node {
-- 
2.47.1


