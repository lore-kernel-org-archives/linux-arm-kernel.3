Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7141CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQQXCFUTzEuKqqGshgMGPB+3UWOKCHMCwqurMu3nBP4=; b=LbXUVnlCkLEEU/kZW7LqCy+E8s
	a0AGf0bkIAAytiVoFnTsgRHEcFAiXPr3A41s5eBoFLVcyd+8jtGTatCla9xtEbld4qFmkK0pDAwrJ
	2ByeQJfsGUwN2ap1TXh5N1Nl1CjZqUhQVeyw8lkvk4ue14rRQmAj9iSCkBkdloXpvkwCxTOfYEwKV
	2ZOve6ef8iaBeGCoTaVjM9RKTi1EZCfQRlVDHuiwY6m25XxtdRhq89QRYiyeeXK05RzjiswNopIYg
	WeIyrJUlVrbScokF9u4AzTtZRDBqDP0SYDCNg4E44PEjKmrLdoeB+uDpUG/Px6DjDpXeVOMVt6pDv
	1BiGKcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMa-00000001Cfk-0cjB;
	Mon, 28 Sep 2026 17:42:04 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMO-00000001CVR-1BfU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:41:53 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6ac7659d3f4so1531576a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617310; x=1791222110; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQQXCFUTzEuKqqGshgMGPB+3UWOKCHMCwqurMu3nBP4=;
        b=Xrourc9S8w9mLVllYkIHj5NP0XHW32oYxMF2vtV6MqsfpKyfOScqU5LLrBjntviiRB
         ZNED1WtURyzzDgbUUJod1wuQohyQPCh63dM+RaaT4bz9iXydh2MPUeU0keKtvyM5nlnD
         IovKDzfb9xwvT+/9BlfQ0n+CDQ9SH4YdD9kRFeUxsILCox4g0hJVrgXHN1f5sQKX3go5
         y2NnVTdPNA8sjRxjkC6IzU1xwDUiqw/FcLjGwo24ppPa2Y0kg9LmKJR82SiZ302fiqKV
         8xRYyspKH90yKPLKuTNdiK/nArDzKeQ3uqGJvrWsb6S1ErOO3HE3509GGmTzfHf/4ULC
         rRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617310; x=1791222110;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQQXCFUTzEuKqqGshgMGPB+3UWOKCHMCwqurMu3nBP4=;
        b=J7M+JGiRc6kxJ8lwZpLk8VRzST4dQ0WcDle1aBKhpE8G8UDJ1CZy7uLc98qg06oigG
         02UX+ELf5o2/zdWk3Z1HDf8BVPr1L+5Z4RyjXjJgVKkkgmE8aXbQm7R/FopF29ck0+LT
         11pAvQzCIWNyo7bNseoVG1M9KlzUIxCn+zMyD45WF74ShWtCUxBpGt0eTTwcF2bcX+l9
         Vxg9HdeSxtjoENVHPqBu1nBnTX4e1aKsDQN4itMD4k8KQtdhk5gAc4ubl8V+TMHhnNYe
         mfjboj3Qyk8N8gLUPCchyZqiRBx6xBxRq2zpQYMAftuKSIIU6lc65+DdmmegAr0UYBLm
         YEJA==
X-Forwarded-Encrypted: i=1; AKwUvBysgbQBqvpu9e+p3b6PGLXk/dBfSZrow7b3VXhz2O0Eo1RooxEVaWs7lngo+OaUEf4bbDoN2Zn2VxdKavRr6EBI@lists.infradead.org
X-Gm-Message-State: AFq9FYL0CObIvuwyZAFYjZp3XApCtDWlez3x76ewOhQEhMwUyFC8miRc
	J0KkikyCdukfKGGxbqweFKw7QjdSZNyxKxnvaIibtnWqYGHc75s1Bz3T6PLAldgtasJQQb5ZxaO
	e2JRc0axkmJsFPA==
X-Received: from edfz6.prod.google.com ([2002:a05:6402:a406:b0:6aa:1383:f342])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:538b:b0:6aa:fc60:60d0 with SMTP id 4fb4d7f45d1cf-6aafc606c77mr6303087a12.33.1790617309305;
 Mon, 28 Sep 2026 10:41:49 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:09 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-3-smostafa@google.com>
Subject: [RFC PATCH 02/15] fork: Don't assume fully populated stack during reuse
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
	David Stevens <stevensd@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104152_362521_F1F716C3 
X-CRM114-Status: GOOD (  14.83  )
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

From: David Stevens <stevensd@google.com>

In preparation for partially populated kernel stacks, don't assume
that vm_area->nr_pages matches THREAD_SIZE when clearing a stack
for reuse.
Note that the VA range is still THREAD_SIZE in that case but it
might not be fully allocated.

Signed-off-by: David Stevens <stevensd@google.com>
[Resolve conflict and updated commit msg]
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 kernel/fork.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 2065693e762c..ec4431bf309a 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -335,11 +335,16 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 
 	vm_area = alloc_thread_stack_node_from_cache(tsk, node);
 	if (vm_area) {
+		unsigned long offset = 0;
+
 		if (memcg_charge_kernel_stack(vm_area)) {
 			vfree(vm_area->addr);
 			return -ENOMEM;
 		}
 
+		if (!IS_ENABLED(CONFIG_STACK_GROWSUP))
+			offset = THREAD_SIZE - vm_area->nr_pages * PAGE_SIZE;
+
 		/* Reset stack metadata. */
 		if (!kasan_hw_tags_enabled())
 			kasan_unpoison_range(vm_area->addr, THREAD_SIZE);
@@ -347,7 +352,7 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 		stack = kasan_reset_tag(vm_area->addr);
 
 		/* Clear stale pointers from reused stack. */
-		clear_pages(vm_area->addr, vm_area->nr_pages);
+		clear_pages(vm_area->addr + offset, vm_area->nr_pages);
 
 		tsk->stack_vm_area = vm_area;
 		tsk->stack = stack;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


