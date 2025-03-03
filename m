Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6902DC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8dD4/Kp++x7YqbDF8EB2j5tk6yfejIzgpWScMmcz5s=; b=urGRr29LaWYQz0LuBPROjQm0wK
	mcfG5vmdyqS5LT2dIfy3teQNU0cxh4kQrBlrf62Lj9fR80iZUKJN51SW8E/Oh6Hwhj5+dDpDcPXfv
	Wp33NV9qS4fEHmYeBPrmQirA/R3N/9/SeQOTcC/56Sc/I3I/ckSVXJ4WrdTN+LWYz/BgEgY/WvdpI
	xOcXuYwTReDa6islL4ixmUlRXeGNMzU0GbJ/bsBwSs/0MySZsmRoZUsw0MopG6xWY9jtcP+v0bXT6
	hCl2/LZjjtxEauer+3N3Mhy1VlxZjVXhZGH0LntyCMPapTvKmWVHHmRvpAD15O+5tWiVZKXAt0ixA
	hMbBghMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8A0-00000001P6Z-412t;
	Mon, 03 Mar 2025 15:56:52 +0000
Received: from mail-wm1-f66.google.com ([209.85.128.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dp-00000001INn-1tI1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:38 +0000
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4399a1eada3so42085095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015416; x=1741620216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8dD4/Kp++x7YqbDF8EB2j5tk6yfejIzgpWScMmcz5s=;
        b=HZ5RTEOOHn62QyWCGtmiGuqMwz6tsBjIQ1uXE4Ud11O5xfcpethMNsbPq+++pN5Ywv
         st0eoyisG+U6rg7ajaMETOelpBBLU7Onvtmbh5o8AorvXuRPyHkoTDkhzPJbC2ulI7QW
         zIGfkycj74q1e2nLFmE/3y5EkCp5fL2dOStn5WHfToQKdwGXlhGRZybPbq/hWd7fa/s1
         nN+itU8a8AvwUSBeUcaLJ17BuMZ1b4IRVCeR8rRgsTxLB+ZmrUmQZsRYHA2QP+HY0Vtx
         g1vvtkpRs7WT6HttWVcUHLAa/miCTVF20NB/Wkbsk18boPBJu5S0TVYpCMCl8Bv4xJaW
         ZJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015416; x=1741620216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8dD4/Kp++x7YqbDF8EB2j5tk6yfejIzgpWScMmcz5s=;
        b=f9TE8lybQD4pvsMUuTHhPVAhJS/Z9rdeFx401t7P+pxjT24SyjCgYokjL/V0FPnfW4
         PXLw1KGMQB63PAzfyf3fkyorNhxW3hZPr1NFrbqYOVN6vfkTmgMPfWta7diNM9krJwp1
         P9X5ylPHUjvOX6lH9AWCFizRS/ZSRvh0H3hEoyS9KtZm5Z6npeFag4geRzDyR4XYy1OF
         YKpYLoDr8t6ZksZCHBh4KPGUyYC1DZc4uQfO/UcWMtkZHEFAi92tnFeR4l7K6z/QbZ/Y
         PDEkYOhtOWmVTvwpLsaXaBekMDs7GBuQSyzcSg59EOOpxWymyZgFeAg3vFmbWwNda4U9
         glYw==
X-Forwarded-Encrypted: i=1; AJvYcCWMlwP9z7wPlqZimH6QQ/+80RTTY2/PsNrePRvnzmn3cH1XKNh1REfFlVIgoOxyjuknQVoRwsGUOSb1/LOivH/Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyZe1s8PtwGDuGrUHOLler+0/3dnkpsHWHj4LJbni3xpq+3xb9X
	fad3vD1b+iRjocr1XcfdShdCTJHPGP84SbaoSG9ASE/ieFZCoq0b
X-Gm-Gg: ASbGncumHJ0BziuHi0Hsq3Vny3FGzyObZmDkFjaHFXJSMwQfN6bnLvJ9hxKwfoHMJBr
	dGwkG2Jk8C843MPwtLQKdbmkspgu4hIAFjI5x50N9M980HhzHYPW52TizXEUW6ZhOQZh490wL7v
	UgtG+0DMyuM1fi0btVPxPLWcg0LOaaWpxz4DlJvwlLcmETu4y7AsByvjwbPcwfj88qlaZkpWyBc
	Rvtw5RI4gowFs7eDMImYLpwsnHZCkGBJfbRDl1Jvklqd1q0twq4s9kPH76ZXdq1JXytOmc0zxBu
	ZWvmsTmQlD0fTA/T3iemTJpieVJprIU8jS8=
X-Google-Smtp-Source: AGHT+IFM6Zq1v0jmMwXwYqRoD9oDMqR8dF4x86BBEAU0OdxfdV7k9GzF2/Hh85klPoaqsXWBJydz9g==
X-Received: by 2002:a05:600c:138c:b0:439:5da7:8e0 with SMTP id 5b1f17b1804b1-43ba6710819mr131963315e9.16.1741015415569;
        Mon, 03 Mar 2025 07:23:35 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:52::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5329besm191031045e9.15.2025.03.03.07.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:34 -0800 (PST)
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
Subject: [PATCH bpf-next v3 20/25] bpf: Convert percpu_freelist.c to rqspinlock
Date: Mon,  3 Mar 2025 07:23:00 -0800
Message-ID: <20250303152305.3195648-21-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6720; h=from:subject; bh=at8Ekv6S0aGbB9KEki4TPKeyEB0J4bUZMvZ4q+vMLKI=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWYU15SR6rg3ngy0KboyZkXB1I7iXAgTU+4Zv4a q8n+lJ+JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFmAAKCRBM4MiGSL8Ryp6rD/ 9okBvTAvR2PTgrgAzFgfUFBu77V0INCzcE3PwQfEwD6rcvTnQUIlryGruEBawLfwn0wxW24wRL/dRy nGL+yuYrEX9YWrs+Pqsz7o2vt7yJfza0S2lZUFT62qMjwUQg9BarfBMcmdWT9afoe0wpXqzQJZc6jh N6kk4VGDj6B7Px2V2Q0EmPXTnjMNmTYmW+3aIZ54OWksD6UxJnflDMq5xbEWu/GF4B5K4mbSvFMCII lU78oDBb2buz6I6WKt9BQukjzIuQSRCcH/r1FEJvzfoQ4A3TWk18Y1lxWqoLywUa4Ts7ff2I7yus+1 Zj/YRvGo//Lcbv35gHIqrjLfvvKXZaW20bcvjfIhytSshAaX3innu2cR2sqFFrVmcb9QwjjqIKzOCa 5FGA1xCE5jK6UkBwTmMKx4rg1e1fUi1vRIbBAjX86NNJ0GuOCdFjKuYocy4yxL30V9Ik680i0XeSlr QnkJNq/7VLZRNEjs54b4gDrXYDTwnRE6WzcfhV7ZQ4Ju0vanEBetGxwfUjmZM0M0ajtqIWGYnzgiFS R5C7BadAXVRz5lKKGAlQxBfZ6nS2erxfMxeR6kGXDbOMO6k1byllETTKxBijhGc5WApPvSUKF8aOUK sGKE2uv8eHTZLfSfjrYm32k98H6hP2O73mx941c2I3ASB3LXurQ/pSaQGQRQ==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072337_529752_3201D7F4 
X-CRM114-Status: GOOD (  19.97  )
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
2.43.5


