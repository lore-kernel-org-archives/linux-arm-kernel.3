Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3680C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Td96SnjkiCjYPsW/BwStDtEmfD+sdWIVQooAZW8vma4=; b=HQqzeRqLI1T3Hxz1y4KkmIcjav
	XB6cIOKQBxz23yM6mbrzMrHVt989h/3jzL47SlbBxMv2oC2VwOX7l6Nq6To1bn2S/kHr8OD4IEe0X
	waNLF/I4G0Pap1NyWDgfni8/2JOLgBjO7/Y1dxCJ0ZflV3zpq89OiHS+KciZVUhCweKToP2IU6Xwn
	jJMjpfLdFlEt8NEQs9Uz/aY7+Od6u4GxGzgDydCK8k3WagKy2QZmAW5/Y6gOVJApkB0Dg+93Ixyud
	H5gnBLWaYJ91tzhpiwzn3Cl3tjhJzBUa/zVSIWHj/y3SH7iJcr6CLtFAH7mvoPPfPnMVhtne65nWo
	OfN/yYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfvA-0000000HHMg-1QFK;
	Sun, 16 Mar 2025 04:48:20 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGR-0000000HCSQ-1Vqj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:06:17 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso6727915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097974; x=1742702774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td96SnjkiCjYPsW/BwStDtEmfD+sdWIVQooAZW8vma4=;
        b=IwqVs9cA1mHrDG1B1qOKrK1laW9GjT2mB3vDVq33SLsy5jEOEiPptQDOG+nyealQYB
         y2cxN+FckmkgczudMvWzP3dntDm6jB3Ff8qIS0ziVG0RvzXnd1vGcd+urAV4/ljT9VJJ
         txuxyCaLL80NUWffqY7CzvcJEDzSDJie3g7a+1yjw9S507ps2YI2dQg2LZMaFxGFySXj
         X+EsRozGLE6QgR9+O7s2ReVZBo4/KTn5lu8XT+fEq82pFNT8WZQzKc43F3nwYkppoLrD
         1N/Xad2ym+5/FndKuyr8XsYTa89odtZLVLc8Izzpsy8lWlr18OZRVoHY115ChjCffsMw
         JLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097974; x=1742702774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td96SnjkiCjYPsW/BwStDtEmfD+sdWIVQooAZW8vma4=;
        b=cc13CO+fXxMUOSRNa9KMPRX9Lz79rUjbRU9cxtjkpUwcKkvKk92+uJfJnM0d8U6aqJ
         9IALg62KQ6cl5z29Lc3lqK9xpXTFjsYV3PfOdwxtdQOi55KVXR2AjLv4D0IxAiux+I0d
         vZM2m/Izl6d4DOoaMtV1ve8mJ5rMrHzWYjAiwmMsdKxSJUzLn2UUxPVyPr6r2iIv7wZr
         ULDfyq/Kvjeux6k7AbbsN1BIbKj5+ZDpn6AArHmI84rsGl1mdgSGnj6oo3ExS1UWgVhL
         KpS3H1o8LUK1pU/0q5qjlbaVtWwZV4JVM6rUQSu6zeb6jGgumZ+51Hwjg/mKw8+cEM3q
         J0cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqahP7AtnF1yNQA5DWnJBFV0eAgqDrSIFy7z86/MorMjqShQOJy0bC0qZNbF0ftOTu436EQNqbVzGVNyYwYu4+@lists.infradead.org
X-Gm-Message-State: AOJu0YyLWb7nebl8kJuuECZdsMcU71AOrKEiexv7aQlYNDAK2xcMKOey
	Btn3r99zcp0PE6f5gFcSgTSTJC3jhe8ddwab+1yyD3/IKexJeQiu
X-Gm-Gg: ASbGncv/POH0qZmmVvLhOK8p92FLxt/jabJkNqaxeel72NI/26FtbyRhsCBBM2Tmf4k
	IDw7QFTFy7WZYgPNmXQAXh6Cd0/WE7dhQVPKJ2Ia3iAXxHvh+M4iPXNyCIY6WvIF/6Jqfu0U9A1
	RdhN6Qs3MdtCABiSqpPLi7MjhKshQmMh4cgwHuzhe7nt+4U4Nh8IzKf2vX9fRqgDH0IybFYIjVy
	qrym0gNgN30h+X5qqdr3B+CMakpBI/uLE93zMFskEwkHUSVdKGpLce9Y5KOP0uA6SDUKVsTq6uc
	NZNv+z41QAh4Pciw/YBhnY/Lz/2vJCqv3TQ=
X-Google-Smtp-Source: AGHT+IEe2u4p0LnlngF0w6iSDydFegjZ1jArOy5WfyUzD1CS7GnhmMYyuaPdi7pWrq/MX6Cd47TJfw==
X-Received: by 2002:a05:600c:4fd3:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43d1ec9071amr97461285e9.5.1742097973885;
        Sat, 15 Mar 2025 21:06:13 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:70::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe15488sm68116955e9.16.2025.03.15.21.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:06:13 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 24/25] bpf: Maintain FIFO property for rqspinlock unlock
Date: Sat, 15 Mar 2025 21:05:40 -0700
Message-ID: <20250316040541.108729-25-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4773; h=from:subject; bh=O+lyN4oVrvKYSSQbJkMNs01queFf9cpPeUOzO9ERMeU=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3eZlk7c0Ywl88mFKBS1oFXTDuU3/IFonJhUClr HKe1WSqJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3gAKCRBM4MiGSL8RyjP4D/ 4qY2ygrw3rIEgXKa12ik0/oktnV0e/sgD/scWu+14+mWArsWSQ8UUjlTmpeZtHx1UMMimJTVgA8JWn ErwnoS51+LKONrfuBOnb8WiSnFeLF2kEEfBXZQhz52hCEM91I4VjacRj/HFnavXb8dOXViHZOtiFYp tA8XV+c68vvKXklV2jpo5wQkhg4tl3j7veEwJrpGTnt1ANUxSd/148gUr43wVDaWrSgg0QTfjMnt2k goGCGNX40txTa7gZVvoN/8zUCK+ll8jaMBMQ+wXgziu1+Yxk9+wlg2NDfkV+ao2pAFbE2K59WELhhm zH40fY8ghmeKSCcSjq49JyGkr5NuuFkIKX9CxCU42wXXArAMCTvksaIBgF7yX6OcFX13Yd45mH2eQD ugV1igIdF9xIUeRIsnMvEEbbiDCD3kD8Zq8gI8qaaKFsk/czJpoEggouEQbtcPaJjppZjtejTeiJ60 lRqpK1fksWewmXvWLmFMlepLnJ23LvW+pPoJ8fBE0oSJuVXPW2+zmqm1tPHFkN7PEBinvfYBocQLPo HJmKqN3bK3Ub6nxUL5gU8yHrGZ6D9lv3K2LvmqUCYq8IJ9WdhSpT8wCA4I7oyLhMrvQs/sXiLR24eK rPTfZ7DZ+EFlgOEIzpWNR+wfqUw8Eo8o/ueXBPEQAa+d6DeACjG6ZPXCAJmw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210615_436274_ADACF882 
X-CRM114-Status: GOOD (  20.27  )
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

Since out-of-order unlocks are unsupported for rqspinlock, and irqsave
variants enforce strict FIFO ordering anyway, make the same change for
normal non-irqsave variants, such that FIFO ordering is enforced.

Two new verifier state fields (active_lock_id, active_lock_ptr) are used
to denote the top of the stack, and prev_id and prev_ptr are ascertained
whenever popping the topmost entry through an unlock.

Take special care to make these fields part of the state comparison in
refsafe.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/linux/bpf_verifier.h |  3 +++
 kernel/bpf/verifier.c        | 33 ++++++++++++++++++++++++++++-----
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index bc073a48aed9..9734544b6957 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -268,6 +268,7 @@ struct bpf_reference_state {
 		REF_TYPE_LOCK		= (1 << 3),
 		REF_TYPE_RES_LOCK 	= (1 << 4),
 		REF_TYPE_RES_LOCK_IRQ	= (1 << 5),
+		REF_TYPE_LOCK_MASK	= REF_TYPE_LOCK | REF_TYPE_RES_LOCK | REF_TYPE_RES_LOCK_IRQ,
 	} type;
 	/* Track each reference created with a unique id, even if the same
 	 * instruction creates the reference multiple times (eg, via CALL).
@@ -434,6 +435,8 @@ struct bpf_verifier_state {
 	u32 active_locks;
 	u32 active_preempt_locks;
 	u32 active_irq_id;
+	u32 active_lock_id;
+	void *active_lock_ptr;
 	bool active_rcu_lock;
 
 	bool speculative;
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 29121ad32a89..4057081e996f 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -1428,6 +1428,8 @@ static int copy_reference_state(struct bpf_verifier_state *dst, const struct bpf
 	dst->active_preempt_locks = src->active_preempt_locks;
 	dst->active_rcu_lock = src->active_rcu_lock;
 	dst->active_irq_id = src->active_irq_id;
+	dst->active_lock_id = src->active_lock_id;
+	dst->active_lock_ptr = src->active_lock_ptr;
 	return 0;
 }
 
@@ -1527,6 +1529,8 @@ static int acquire_lock_state(struct bpf_verifier_env *env, int insn_idx, enum r
 	s->ptr = ptr;
 
 	state->active_locks++;
+	state->active_lock_id = id;
+	state->active_lock_ptr = ptr;
 	return 0;
 }
 
@@ -1577,16 +1581,24 @@ static bool find_reference_state(struct bpf_verifier_state *state, int ptr_id)
 
 static int release_lock_state(struct bpf_verifier_state *state, int type, int id, void *ptr)
 {
+	void *prev_ptr = NULL;
+	u32 prev_id = 0;
 	int i;
 
 	for (i = 0; i < state->acquired_refs; i++) {
-		if (state->refs[i].type != type)
-			continue;
-		if (state->refs[i].id == id && state->refs[i].ptr == ptr) {
+		if (state->refs[i].type == type && state->refs[i].id == id &&
+		    state->refs[i].ptr == ptr) {
 			release_reference_state(state, i);
 			state->active_locks--;
+			/* Reassign active lock (id, ptr). */
+			state->active_lock_id = prev_id;
+			state->active_lock_ptr = prev_ptr;
 			return 0;
 		}
+		if (state->refs[i].type & REF_TYPE_LOCK_MASK) {
+			prev_id = state->refs[i].id;
+			prev_ptr = state->refs[i].ptr;
+		}
 	}
 	return -EINVAL;
 }
@@ -8342,6 +8354,14 @@ static int process_spin_lock(struct bpf_verifier_env *env, int regno, int flags)
 			type = REF_TYPE_RES_LOCK;
 		else
 			type = REF_TYPE_LOCK;
+		if (!find_lock_state(cur, type, reg->id, ptr)) {
+			verbose(env, "%s_unlock of different lock\n", lock_str);
+			return -EINVAL;
+		}
+		if (reg->id != cur->active_lock_id || ptr != cur->active_lock_ptr) {
+			verbose(env, "%s_unlock cannot be out of order\n", lock_str);
+			return -EINVAL;
+		}
 		if (release_lock_state(cur, type, reg->id, ptr)) {
 			verbose(env, "%s_unlock of different lock\n", lock_str);
 			return -EINVAL;
@@ -12534,8 +12554,7 @@ static int check_reg_allocation_locked(struct bpf_verifier_env *env, struct bpf_
 
 	if (!env->cur_state->active_locks)
 		return -EINVAL;
-	s = find_lock_state(env->cur_state, REF_TYPE_LOCK | REF_TYPE_RES_LOCK | REF_TYPE_RES_LOCK_IRQ,
-			    id, ptr);
+	s = find_lock_state(env->cur_state, REF_TYPE_LOCK_MASK, id, ptr);
 	if (!s) {
 		verbose(env, "held lock and object are not in the same allocation\n");
 		return -EINVAL;
@@ -18591,6 +18610,10 @@ static bool refsafe(struct bpf_verifier_state *old, struct bpf_verifier_state *c
 	if (!check_ids(old->active_irq_id, cur->active_irq_id, idmap))
 		return false;
 
+	if (!check_ids(old->active_lock_id, cur->active_lock_id, idmap) ||
+	    old->active_lock_ptr != cur->active_lock_ptr)
+		return false;
+
 	for (i = 0; i < old->acquired_refs; i++) {
 		if (!check_ids(old->refs[i].id, cur->refs[i].id, idmap) ||
 		    old->refs[i].type != cur->refs[i].type)
-- 
2.47.1


