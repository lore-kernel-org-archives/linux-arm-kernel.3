Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004FAC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+/W0EApda7zGr5aRBIxeSAAJdBHD2PeVsO8K+dox+k=; b=rkg88v8dHG1n7XPrFCCnJZDEHo
	TN60RObrY4QG3arRvdkuFyiOW9I27tpqI0IpWbk01Gs9heiwUtXauT4tOteUXFfcCzuhCFWX0WAUv
	Gurcu6dRNzLHmegxO6QNVB0P+1+WG5exXbVKRgTQrN2lV4OFSbNsrT9VBx4XGg75FPTFFPgrjZM1P
	1X9Bzr3htPRPTr/iOC/h/SzmEEueNq3ar8/EESIZ5ZAgjWsYO+uKVHqlmxK6Ia1WNmLwaPAsd8NSD
	RivtCCDdCyyyDCA7hBS/O1sZZzmQWogpAVvI4hfm5qXAXilh9YdLFLJ1GmHa4wCB7dPqkdITJ/+JG
	XFFc48CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg00P-00000006814-3RA3;
	Thu, 06 Feb 2025 11:25:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXI-000000061h1-23fv
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/+/W0EApda7zGr5aRBIxeSAAJdBHD2PeVsO8K+dox+k=; b=RiZDs9exJdX5H9tAFHtQggBw+q
	++iP0ipHKuyoxXg5/2N0R1BI9a2LWZ8SQ+AEYCP+JUApQ4oFEyiG/HdaPPBdCcqH5hg7YuyyteCHz
	oihds41FLe9cgt+fpqRivVM8QmM/G5WepIY0sXS9Mtkcp6GoTGnfuP4jXfLOHJmuZWeYzDfvkVg7D
	zPF0mx0YMK9y2zb+52xu2fzJlp+TUip0zisjXitagRIKwtraWgVIeX2WOkkH7F3T0AvRSYsxhsYxW
	z42pkahbvqcTFOdSYTax7TI4JD3lX5v/2MbIMBe9LJxSbynHDMlHhTdHomNvb0TWbD2cTXh7YCzDc
	yp8JZEuA==;
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXF-0000000GuwD-3U95
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:07 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-38db34a5c5fso325932f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839305; x=1739444105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+/W0EApda7zGr5aRBIxeSAAJdBHD2PeVsO8K+dox+k=;
        b=PndxsNhBUc1KVrEp1kyERHyUw907f9wheDmw6eFnzRHZ7TRojz3z1vprnODeb22PTb
         E5nh9oz4ouJjFanRfuCU7ucQ5G7lKIumUzLaS5iZzFJ8yeOuL8R8ZpccAHczxup1uTTy
         zxtAadoWijTCOSHnxi6l/3RWcP9cV9mB3rJ69bTtgjolhhApJFXsGtLdkOB+Q3PV+3tH
         NTOoICmFwcd5VRliEIhkiZ87hKiuT5RVSjNzEFASexjwMTN0xNyNgyFZJsMxJ0y6DGB8
         s0ec8oLqUNr+cGk5o+nk/2dwTNkBqJELAsYiUCY371yUOR5kcohEca06/3KGvn6vf39E
         s6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839305; x=1739444105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+/W0EApda7zGr5aRBIxeSAAJdBHD2PeVsO8K+dox+k=;
        b=vhbKID3qEKxTn7mtNaghJyXhC1wtxe1MjVWuffvPrzCgMWjBVbvFOP0Q6vtGRMAZlB
         /aC3smS9jYmqSQi+NVfejio02xQ8WU0WVb6cfi/G//FPlzFRapxGvqekB4+kzSX8g71S
         SpFvrL4YXk46yDbSSbFm3R3yVLL6EhPxW/ajgZrJitjijP5wd3H9oYYHadbKJ2gkvVpD
         fyYafbiym3PEWmo9OGGDcNpVtZb6x82S6tjoqf8QnPeYnaugRqJDGvqgGXwNJCal91VT
         D5dNjU18cWkvRusc9BQH1+ay3VcsiBNv5/dQnSQphHCusZrnpZjE0cD8q7ctlTiwNTeO
         mbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVflglfA0HPzGtZmZri1xeqQW/7fLtqBQThAAz9QTwUcl0xV0Wcrisk175vmEELgB9uxJWGJmKXqFwaW2gnMRxz@lists.infradead.org
X-Gm-Message-State: AOJu0YzK+e8M4KPsLRnoIRffLFPZF8bzvlSHk+SGv4OR8cKv/VAZ12DA
	yWGJ3JESNea2eu/C4qkUkjFXppewrVBIfG47pAKw7J67OLjneF6u
X-Gm-Gg: ASbGncuFEwRM3wkHzfqd2eEZpYWLsfImYRV96wM+L4ZE4y/s8wMYKBOjbmKoHUxyxbX
	Zc4XtO0yRGQzD8vXDlUDrSTTGhaIsB1GOvMuXwnRh0AArftQUSN1jShnPrdCDdTAX9lk0pe0yFP
	XFklTXyv3Rdn1BPGFiuuXXlLc6tafZ2QQtZURMBwlzJHs7+Lt5CNqML/OSFOjWSmhEQFS2U35BI
	3J9M45PET49tPu1sufc4Qi/3JLph7LebgXup06X2i5csxSSESoBSprVTU+vlFuvg5EQ6tElSgLu
	8llA
X-Google-Smtp-Source: AGHT+IE1fh4Z/RX0JKmKGEVYdBOLzgVhEKs2AnV1hSi1PhRaogcIsY0ipckf2p7b6ebAKkLpzIqwFg==
X-Received: by 2002:a5d:6da3:0:b0:38c:5b52:3a5e with SMTP id ffacd0b85a97d-38db48577fdmr4311094f8f.8.1738839304658;
        Thu, 06 Feb 2025 02:55:04 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:2::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fc25sm1415577f8f.64.2025.02.06.02.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:55:04 -0800 (PST)
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
Subject: [PATCH bpf-next v2 20/26] bpf: Convert percpu_freelist.c to rqspinlock
Date: Thu,  6 Feb 2025 02:54:28 -0800
Message-ID: <20250206105435.2159977-21-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6512; h=from:subject; bh=b7GJYiFRKmgt+Gua6MyRj5cuN5rmsZksWMg2VkyS3aw=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRm4A+EBJCWxvZBf7f2Rwf9fNAzPFNCmT/crlsa NhTJVJuJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZgAKCRBM4MiGSL8RysBTD/ 9cLKt+PR4fSl5mi6p7a7E2k65BK0pYhLW8IoR7EvD1rs1MUM8TYi9Wd0P3u5ARJSKgUZRovio/UJsb MCLHj+03gAh32u7M8XtrbyRGGjWp81sskv3umm0S5W6qW7GNEzdDfhDCVgZGxTaPwghKEcP6GNkC5D 3LWP4b9pp2XSrw5PDT7EN54Ds1FfjGWg6awZXbJcWgVmmS4522IVKIgAgnotntrcI70ccUJoxtdyUD ADWxNVhu3snrVyFYlCSn80qYS6o0ZBYVjqh5K1pU/GnUahNHcT7iZbSHN3HH7/pZhLFbvphUDLtImg bi4WsQVeTVKTqXtm6o/FeA/7+P+pIhRSeOynMeOZT9EqTagpNVaaptRj5HZMuXJWY5qUIHnY+c8P0v o1VHWya9TBJyOJM37cFthbRx9BxyN7uDd3fsaqDwGs+p+NFzUAh5Yyx3n6dkBHQI+zFF2mryGLzXTR h/vu/u/DQSfC2693zDq/2G2Nq8GCT4nwzP2057XK4Fhewd7/9rFPbG2Azm6f192ZUVX2yNhrwmZcFt jjpQ4CaSn5LXmu4ocoOo3rDF0aGwvP5Sb/Jn9vS78QfBYpWYEJxBrVtRMyeKfPjo4jEinqb40wB4vk h5S6Uj1SdTQN/i3IBzw259gce+jCSWN1SQaz6Dgy7OdNHF2kxY9Ea5mBCF8A==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105505_991351_CFD829F2 
X-CRM114-Status: GOOD (  20.56  )
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
2.43.5


