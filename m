Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B4DCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMttkoCzeXLC/JEGKL20pI+XNOolXdLvFIFeMj04zLo=; b=BSW0elWYsIGFvgLWvMzsHDnVvl
	RnFL5V2cth1/6nlOnew1HgJJo5XpoKnBw+G5kupoasK9IOf2fS1d+RWTOMbO31KhffVqmisZ1BNGZ
	uhz3EUw7p3llINhXv4Q2m7bBbYmyJQqJEjsokv9XCTnsVCO6yyz9EQjbzwDNWUPxNOHqTCc+HqYoB
	P693i8dB1EpwPL14mc6zkucpMpJGgHyQCLvx5eDLo5gV37Uun0daJ4WrFOGnJ3WwdvUFTlvCnqOi3
	Y3jjodEwviLjneyqxYMTOvWNnjH5URasCPv5m90gqrYi6DpvhXcsEexemErFv7yldnQoVmdC1f7KS
	Ii43/N3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMa-00000001Cfx-15jL;
	Mon, 28 Sep 2026 17:42:04 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMP-00000001CWJ-0IfC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:41:54 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49e7631c43aso34369645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617311; x=1791222111; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZMttkoCzeXLC/JEGKL20pI+XNOolXdLvFIFeMj04zLo=;
        b=ZxN+kJy/sYUpnG2NWKltqVQw+uINfaX4N3lV5tTKv422uXA1Ajxkpi4WCJyzL8+UMl
         Bk+pNVNklKoqE36+qYctRnemeIZ2wOFX+xJ1yjg7n21HjH4r2Dchbm3ilcvzTv/RYOCp
         VFybtfyOMfSer5zTKi1RzkxmKXSwZTDho3ICr4Su/vdw9mEPv/2ryuILYfDPexXEye1I
         cmZ5tW4sdZXLPUA3d1pgjqHDgxBUsGrJISRCRb+WuvLMk9Pfzt8bxtDyCzAU8CxwfjIA
         muphGlts8KtCML8oj3wFrtycQoAGkT+tGkv3sI/yi7Cphoy2I8k2cJRgNV3A5oam3aDU
         nNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617311; x=1791222111;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMttkoCzeXLC/JEGKL20pI+XNOolXdLvFIFeMj04zLo=;
        b=D/aHCk4HEXy3xa0y/ccY+c39HFsebhlnSskyQwtwGzkQvHDz0KAd4vEguSxbak8wjt
         FcVD8hvmjp7XQ0yvTqqfF0DMsyBsDeYGUQcVnNALPPzWkm0zdlSr8b+NuGwcGGiurLYN
         x2OL8GTwg251WdYYWmkTqWR0juSSpkBreszak+ZVQez/AET2Gf9xUBc0viZRJC/tv3wY
         7Ic8TeRvU8z5hpHzos+MQAyFdHlWOwk2vf2f5GfuIaGPwpMwouxp3Lu9Bzk7RwuVwNdg
         tdW2fbxQgg7Yj+d1ckuT7LqNwtmmsS9SwSE+VHmkVd3J0dNWcXqjkHHQu6tQH7pdq3yP
         /t+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCySVBH8eA5HGVxq1FZq8FEGXy7EoBdyIBKa5PN4hcqC6Wr47J1P1wMeuF7vKnppz3FMOW0/ho6K5DdyrQFQmx@lists.infradead.org
X-Gm-Message-State: AFuF++lpVDMnO5F27todI1DHQwGlk2uwUZkdMDbCbdBHRaWKKXPMO5gV
	rPb8mhQQTR/9n9xhmnsvldfo44evEoK+0EQ75tcvfGWxwCgvg6KWOvoZYBYIg/cMUlT9N4eBnyS
	tzRjjSoca4xBe+Q==
X-Received: from wmqb10.prod.google.com ([2002:a05:600c:4e0a:b0:4a0:107:e5c1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b4c:b0:49f:bd3c:bc16 with SMTP id 5b1f17b1804b1-49fe66f4c16mr231430235e9.17.1790617310870;
 Mon, 28 Sep 2026 10:41:50 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:10 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-4-smostafa@google.com>
Subject: [RFC PATCH 03/15] fork: Move vm_stack to the beginning of the stack
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
X-CRM114-CacheID: sfid-20260928_104153_146336_235B4F6E 
X-CRM114-Status: GOOD (  12.56  )
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

The vm_stack struct used to free stacks via an RCU callback is stored
directly in the stack being freed. Make sure it's stored at the
beginning of the stack regardless of stack growth direction, to avoid
faults on partially allocated stacks.

Signed-off-by: David Stevens <stevensd@google.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 kernel/fork.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index ec4431bf309a..473878d7f62f 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -285,7 +285,12 @@ static void thread_stack_free_rcu(struct rcu_head *rh)
 
 static void thread_stack_delayed_free(struct task_struct *tsk)
 {
-	struct vm_stack *vm_stack = tsk->stack;
+	struct vm_stack *vm_stack;
+
+	if (IS_ENABLED(CONFIG_STACK_GROWSUP))
+		vm_stack = tsk->stack;
+	else
+		vm_stack = tsk->stack + THREAD_SIZE - sizeof(*vm_stack);
 
 	vm_stack->stack_vm_area = tsk->stack_vm_area;
 	call_rcu(&vm_stack->rcu, thread_stack_free_rcu);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


