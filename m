Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE93FC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JK06538PoT0hdERtpqSLZ9dXgVnOMpofNScplUny+Pg=; b=ToLUDp6fAIqh9QVzoW61g/9m8f
	z1fO06X5g8aYvBEndPN4cP31Cjo4lG7o+OJJaM2ZS7rmnIzCjfrM3YNcgK38tii4x1x/4p+Bjyz0k
	Fyajq2PHsPsc7Iuemu01xG1CY+nDkfrf5h/xJcXIdbsDznfehiDkzRs1+vPTc2XfDDDol0o5MksIm
	p5OpX4/dYS5jEQgkihAQ6qQ19/cdN0WKwjAih/KvW+2SKucV0ws4VI2iT+h6yTGWdQCKm1gcJK8Q2
	Gv5BnclwD8RE9RYeoFUvQP3+iMRp4MjndovpWhCDa3Qk9zNbsnun5SffVS2k8YJKzKDCTXUeedXKI
	uQfVAFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8GC-00000001QG9-1GT7;
	Mon, 03 Mar 2025 16:03:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7du-00000001IQv-2rt0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-390effd3e85so3257377f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015421; x=1741620221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JK06538PoT0hdERtpqSLZ9dXgVnOMpofNScplUny+Pg=;
        b=kBINbnLkRAJEqIP3EO+9jeNAC0kGTS/P09lZqom/mUpCWOyukQjTOMo5yc3w0hxTKU
         XytO/KfRt56rtkvzIu8jtRNH0cNdTP4xFl6WWJjMkayEtPshE6h5oZIusKy+9Wunsp8B
         8pWDQbhVNnYjutNsGdXN+9TP11myjEZJBp5+uqLGmrBMWzKKLBR79ia68zHVc64zzgW6
         teP+B/NeFArBaoydzCMTvBNYuAZP+A0FqvLifJTsLLPbgk3NOtCvmC86JeKlI84/t1EQ
         KgbZ6Vi8HG8Sqwqjrl05FhjEhMVvlqz68RPQ8h8+WSAod2EJBpmbip5u+SRkMsHhDzyu
         HERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015421; x=1741620221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JK06538PoT0hdERtpqSLZ9dXgVnOMpofNScplUny+Pg=;
        b=L2Pu6dtECUE58nqnqHcuRE/VlzHWzSRK6r0Ws01ATb4jTCpN+Onp7NCMtAeIhMUr4Q
         kYZIkgGou65J+0H7r5RLLZ1zM8alcnyWRLkD+imd+ES5++VNZmNJ4he8UwxksixXti4s
         7hLGx6aEnyP8sONl8JyStO/l18og0MMOHKyKi0EBb3jxi3l+vBk3Y6O+JvyTD/9Xc95B
         FHjh6L0+8Iv/KIiZA2LrRbs/rn6ce+eMYp6ujencMei1vvbzlG+ebrRtNytu6HE/vBt6
         ouuaEON4tqAFeHk/w0Waao6lLQ+PAbuDV4beynCuojuZGi29wOed7m5Ln0T5OvfIX1c7
         gz8A==
X-Forwarded-Encrypted: i=1; AJvYcCUFYjqyDDKt191ARFJhGbOyh+JiE3TdJl2d/MxZtplILdOQF3c4PWnD8tD8hjubXwb7G6MvZraC1IQnE/xBSfUb@lists.infradead.org
X-Gm-Message-State: AOJu0YxwDEv5nwCbKoToX1bBVn0UR7vCYVxdQMdP558BbPCAm3W/fBPX
	h9ETyY0C9UhNrBfg22TgC6xLuGeAISoqyUujzAetmJmwqLAOSsKe
X-Gm-Gg: ASbGnct2PnAXDLyF4o53QHQeWpFPedp/Sp699MtPH1pNqaQJeAkfQRKZr484LzO1mpD
	pVrEifFx56BDa0bIQgrnyYlwIbdgI7PWI0RiEUMXEy12eQOu4eaPIv0/E7m3f8zDivz0sVYnPM9
	ct0t31hnkZCh6KaoqK2YtjT7PU7JZQyfHJS70Pm29SZmuKt1W0e+8mpFW8VrcDsgXmP9nfs3qzf
	7WZKoADOYgfmo3X4lTrfyNmGT4fKmICh4mO2vEAdCabkz9iPc/w6mNxHam0/BQWiptS3TCwQWew
	Fv5PoKD6HI6ZsfHQ3NlkS+7KmY3qLAp3NAk=
X-Google-Smtp-Source: AGHT+IEWrOLXEnoxplL0eXEi/SpthtQwbZ6y7pKL2e59tZ8s3JQadQxULhRUvfXdSLXbDwyc9fQvQw==
X-Received: by 2002:a5d:5f42:0:b0:391:5f:fa4e with SMTP id ffacd0b85a97d-391005ffe69mr4807658f8f.29.1741015421039;
        Mon, 03 Mar 2025 07:23:41 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:74::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a7868sm14700001f8f.24.2025.03.03.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:40 -0800 (PST)
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
Subject: [PATCH bpf-next v3 24/25] bpf: Maintain FIFO property for rqspinlock unlock
Date: Mon,  3 Mar 2025 07:23:04 -0800
Message-ID: <20250303152305.3195648-25-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4773; h=from:subject; bh=yd3gRpKNHABqLGxFwmo4qitDCfszyenvxRvQDwJYTjI=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWZ7k4vMGesNz3gUHT6LOfeGtXRbGBf+aKUvuv/ umGpqdqJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFmQAKCRBM4MiGSL8RygluD/ 4uWKUHAjRffEJ86xP+I5MHqRuOHQ9jEAhSSdV7VPagDzTfZS8/JrswTTGLd4rS2xgwcFBwODkZ2aBs ayN+aLN1VPfzRRauqqYTO74IQCjSQVlRfrUc7QPeFDKF5iD9QPiLL3exq4eW9AGB7e+PuYaWH0wp3Q Wo/2jS/gXUhBTx2P5Iv9Lj56om69Hq7TGuUFrQVyvaC0CeinRJzaROx754KgWhnijwvOYUHsFZNFWS BR9qzsCLUTJhZhlEoX1z+ckbFZlKaMumFJaLjFUi3LW0r0wppTr+j6iVZ29CPh4p0x4H1/YOVIOehV mrk58kirt5EbcalsufoTGdl152sD0qdKJHO0pIefGYB9QVp9zzHJp+dGg5erc8UIcmn6J/IJuehSWC KgKZF6l00P5i0xwwz7h3GxNqSOfKGemo+nMTASSCL5HQGjzyWrrTOl3Yt5Sztu7F+qo4kTW554DaT6 z+9LE7AOC45QooYOFu15kG+QAhLeo+5nrl38cyPi60IHkU1JQ74e4y/92wb+i1BJsmtndDZAcwh48I YcPMi8nG85nDdwOaRNx4VNvVKDPLz3FdagXogkzXKN9BtKEUy/7x5cVgwICmIOCmHC3fqFTyvAimEK 8q9RN8RRT/ciTibX4PZBm9gB4uF8rSuHE+89XzSMRgzUjf0vXy/Qf6oVA84w==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072342_725281_EB763419 
X-CRM114-Status: GOOD (  20.29  )
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
index 269449363f78..7348bd824e16 100644
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
index 6c8ef72ee6bc..d3be8932abe4 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -1421,6 +1421,8 @@ static int copy_reference_state(struct bpf_verifier_state *dst, const struct bpf
 	dst->active_preempt_locks = src->active_preempt_locks;
 	dst->active_rcu_lock = src->active_rcu_lock;
 	dst->active_irq_id = src->active_irq_id;
+	dst->active_lock_id = src->active_lock_id;
+	dst->active_lock_ptr = src->active_lock_ptr;
 	return 0;
 }
 
@@ -1520,6 +1522,8 @@ static int acquire_lock_state(struct bpf_verifier_env *env, int insn_idx, enum r
 	s->ptr = ptr;
 
 	state->active_locks++;
+	state->active_lock_id = id;
+	state->active_lock_ptr = ptr;
 	return 0;
 }
 
@@ -1570,16 +1574,24 @@ static bool find_reference_state(struct bpf_verifier_state *state, int ptr_id)
 
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
@@ -8201,6 +8213,14 @@ static int process_spin_lock(struct bpf_verifier_env *env, int regno, int flags)
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
@@ -12393,8 +12413,7 @@ static int check_reg_allocation_locked(struct bpf_verifier_env *env, struct bpf_
 
 	if (!env->cur_state->active_locks)
 		return -EINVAL;
-	s = find_lock_state(env->cur_state, REF_TYPE_LOCK | REF_TYPE_RES_LOCK | REF_TYPE_RES_LOCK_IRQ,
-			    id, ptr);
+	s = find_lock_state(env->cur_state, REF_TYPE_LOCK_MASK, id, ptr);
 	if (!s) {
 		verbose(env, "held lock and object are not in the same allocation\n");
 		return -EINVAL;
@@ -18449,6 +18468,10 @@ static bool refsafe(struct bpf_verifier_state *old, struct bpf_verifier_state *c
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
2.43.5


