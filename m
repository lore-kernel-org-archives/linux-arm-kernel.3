Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F218CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1DJuPuQM9kSMFWHvWycx46i6Qw8Tz2JNB7c4R6pz+k=; b=DM3F9vxBAfdHuqtCmFH077GWOE
	jqHtAQHCGe8u0L047kDTJ1KcrhDQx/hZhTr+rWmYSdoXs5apMohSbRKTj7qQDp0+ZFa0FPN8enLyO
	9dcSCh14q1C/DgN7J7IM2GZrTYpduSb/WX9iwN6uPPT4WfmU+r62xMD795pHvpXl3VvzgVfCvFrZv
	g6o5iKOHYhKAnb0lv1WwGU7MYDcsqnVQOSvNsxCzXOODipkj6dI5+6oNYtQ2mXShCyc59Wn7wwdVz
	GlQh0I9CMX1eLZiQMwvPffHcl3Zg5dsNN90rJ09HMZSzul4p1aDCC7TFnE0vAZjzRobPSoGqR7awb
	rmwHYaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMa-00000001CgV-1h9x;
	Mon, 28 Sep 2026 17:42:04 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMQ-00000001CWq-2dGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:41:55 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49fffa5de0fso25075015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617312; x=1791222112; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1DJuPuQM9kSMFWHvWycx46i6Qw8Tz2JNB7c4R6pz+k=;
        b=iUyMhrEurwZ74EdYfLcPxcSPpOex/1ZyRjMZnyschFNqeuHaY1kapkuVUU2G5lPy3i
         zPl+8g6ntdidzjJtZWFX99sHhNMe3yqixFLQns/6CMzZ8jPTJwdurJBbSZEmY4RD9wLt
         FHCryHBPhVg5FKMBD+tyuCWIYsvwylOok+ZAKgRZojQI4WUSk+zoBuUHwH3S6G/J7KRZ
         ZA72muq/qqOmhCWgOHtIjVJDnHZa7R8OY4xWLR9j5xWHjjeyGfniT5DXuVgnUA7m/LKZ
         vSCFhKTiSwMZpHAVxp6KybYIP5vxTw8fXQMcOyU36EF+7uDKCUm/0x55b8Fr0L4UgHJR
         4LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617312; x=1791222112;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1DJuPuQM9kSMFWHvWycx46i6Qw8Tz2JNB7c4R6pz+k=;
        b=iDbYfUKAlzds7kP8V4ZkSa9YqbGossCUtqx5DDr9IE3KB66CnVU9QOxFhzf+xW1Hz6
         OTrF81ccyLjXq8CVDsoy+ukNNizCj41Q+xP13BO6bLLj6YUbGj2xF09SZfzBAQtClIck
         fAhQge/Uv9Ksy0k4cNIxghIVYPOuvZk9jVrL4bnBIeCFZhyUsC4ezPXP/E781IctH4xf
         9ERatnyf3JoQsTKiaxtmJhWMLQ6F/eOaalRiHC4Ltsh01SomumgnGJbjrQKQ7QEUZSgr
         ra2gSN74GsCzS9/1w33SkBtPsKIBYTfZHSsMLmiYRG52cbAfs7dPpNjE87LJj9nWR95z
         y6Ew==
X-Forwarded-Encrypted: i=1; AKwUvBxJIs3mNDHGksNfQf0+8W26atEMsCe5K37SaFOqrP7xwB3OiCURccpZGriC01MPtuFR8PBTjE4H+CBsItV+yn6i@lists.infradead.org
X-Gm-Message-State: AFuF++ni2lJI43wO18hTZRF/wJkm/ofTFX8iy1KiNJFy/y9scEDFVxmX
	kck5sMjkFLuixhxRHb87azNt4MnWEyGGbxe5GGHB1Dsh8sprAGMyamIIoA7DMkXyPprShMXX2lU
	ypHrTNbf6fGLQeQ==
X-Received: from wmbhn25.prod.google.com ([2002:a05:600c:a399:b0:4a0:146:71bc])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c4:b0:49f:c331:39e4 with SMTP id 5b1f17b1804b1-49fe66ca101mr236728135e9.7.1790617311982;
 Mon, 28 Sep 2026 10:41:51 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:11 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-5-smostafa@google.com>
Subject: [RFC PATCH 04/15] fork: Separate vmap stack allocation and free calls
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Linus Walleij <linus.walleij@linaro.org>, 
	David Stevens <stevensd@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104154_693706_35C9AACE 
X-CRM114-Status: GOOD (  14.72  )
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

From: Pasha Tatashin <pasha.tatashin@soleen.com>

In preparation for the partially populated stacks, separate out the
__vmalloc_node and vfree calls from the vmap based stack allocations.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[Fix a bug in original patch: free_vmap_stack(vm_area->addr)]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
[Add missing free_vmap_stack conversion, fix typos, rebase]
Signed-off-by: David Stevens <stevensd@google.com>
[Resolved conflict in alloc_thread_stack_node(), update commit msg]
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 kernel/fork.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 473878d7f62f..3f1c46d8f7ec 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -272,6 +272,21 @@ static bool try_release_thread_stack_to_cache(struct vm_struct *vm_area)
 	return false;
 }
 
+static inline struct vm_struct *alloc_vmap_stack(int node)
+{
+	void *stack;
+
+	stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_VMAP_STACK,
+			       node, __builtin_return_address(0));
+
+	return stack ? find_vm_area(stack) : NULL;
+}
+
+static inline void free_vmap_stack(struct vm_struct *vm_area)
+{
+	vfree(vm_area->addr);
+}
+
 static void thread_stack_free_rcu(struct rcu_head *rh)
 {
 	struct vm_stack *vm_stack = container_of(rh, struct vm_stack, rcu);
@@ -280,7 +295,7 @@ static void thread_stack_free_rcu(struct rcu_head *rh)
 	if (try_release_thread_stack_to_cache(vm_stack->stack_vm_area))
 		return;
 
-	vfree(vm_area->addr);
+	free_vmap_stack(vm_area);
 }
 
 static void thread_stack_delayed_free(struct task_struct *tsk)
@@ -307,7 +322,7 @@ static int free_vm_stack_cache(unsigned int cpu)
 		if (!vm_area)
 			continue;
 
-		vfree(vm_area->addr);
+		free_vmap_stack(vm_area);
 		cached_vm_stack_areas[i] = NULL;
 	}
 
@@ -336,14 +351,14 @@ static int memcg_charge_kernel_stack(struct vm_struct *vm_area)
 static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 {
 	struct vm_struct *vm_area;
-	void *stack;
 
 	vm_area = alloc_thread_stack_node_from_cache(tsk, node);
 	if (vm_area) {
 		unsigned long offset = 0;
+		void *stack;
 
 		if (memcg_charge_kernel_stack(vm_area)) {
-			vfree(vm_area->addr);
+			free_vmap_stack(vm_area);
 			return -ENOMEM;
 		}
 
@@ -364,15 +379,12 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 		return 0;
 	}
 
-	stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
-				     GFP_VMAP_STACK,
-				     node, __builtin_return_address(0));
-	if (!stack)
+	vm_area = alloc_vmap_stack(node);
+	if (!vm_area)
 		return -ENOMEM;
 
-	vm_area = find_vm_area(stack);
 	if (memcg_charge_kernel_stack(vm_area)) {
-		vfree(stack);
+		free_vmap_stack(vm_area);
 		return -ENOMEM;
 	}
 	/*
@@ -381,8 +393,7 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 	 * so cache the vm_struct.
 	 */
 	tsk->stack_vm_area = vm_area;
-	stack = kasan_reset_tag(stack);
-	tsk->stack = stack;
+	tsk->stack = kasan_reset_tag(vm_area->addr);
 	return 0;
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


