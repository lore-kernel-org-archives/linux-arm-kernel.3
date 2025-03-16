Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6E2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bm/TjLVsOIQb5qeMDxohaetZDngVOOW8hl6xb9zJkyk=; b=b2U2DTUC1z+eXyrQg3SGwXwaed
	Qf0dnmA1FI40DVbymns56NZtMtzN7pCEBf6egnlfkpK3ZpXQ2YLYYjASOXI5DVxUTgCVEivAzCdsy
	4XhOMchflAp/OHOhHr1XU1O7QMU2IWFnvjC+oGzAPV+paB0P8qUFhrm9/VABKHP6M3LQbRUCQCR14
	rIt1emvztiAZqBkmP6fuJ2CtVEGb8a8Xm9OokjtjuIYfzhM6D6KAZgSzbz0/Trkzz+0O7bmVrkMb8
	uvkFMOBsupqnv4v/cQTcRwvZ2hXI7w/k9TQPSGXFQZNAY8gBltmYU2lwkCDm7bT4NcXAMnkLJEkKM
	gsWakLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfqE-0000000HH0a-0swl;
	Sun, 16 Mar 2025 04:43:14 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGN-0000000HCPO-1iZB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:06:13 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso1885962f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097970; x=1742702770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bm/TjLVsOIQb5qeMDxohaetZDngVOOW8hl6xb9zJkyk=;
        b=B8TGxkvpv+rw6/iOsaKx1rQowkBr5k9DJxVV8ZBfD/bDmhIRo+/9fLW72BzDU/eLtm
         dd99FWOIjfIR+9azPF1cH/+UZG/PkG7whQM8PlaqQk1izGgA/JbcMMmrU6Evl5y+uJpt
         vExgnMXjT1sPEJH2RwV0t7hZLtz2jZHfYhbuo032ZQ7QivGh30C+6ed1ThoXZ0/gt7Ct
         NzQBs4GatXgUcaOt65Ex2SEeNgUE0i0f6rtQagkoNlbo7Hjc+cAvqsNVhaw625PlHpq3
         8CpX1qibhJODY+JCCjPBvI4pQx9ZT5+5yZc5d4bAX+F3zRy5dquwCa5aen6BF+6s2Yf0
         nFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097970; x=1742702770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bm/TjLVsOIQb5qeMDxohaetZDngVOOW8hl6xb9zJkyk=;
        b=SeF5PVPsChay30Yi64OKaesyC+ugdRS+czscKX7/Ue0bTSSm5s0c1Nb+TDsUFukEsy
         2aHFDgIXmDJ4jXzb2LEcILWCeWA/FF7SCdFmrjXuZW0Oa2z4CB6WYN8YmABI2dtondEl
         ORLbva8r3WjK89Ni4z6LeBRTfxZPjXOF0/LyGOqKcbMiltuyfEiqR7wpwrkZ/THpin1m
         0dwaV14U7SUn23SwRIhrgP///T3LBGMkmHev46mF2vaWG0bC4Pe7Ah28XI7JjOMOWP6h
         IfzNZeWp8rRljQQgprYuBZT/dc+wapq+giYEiTnNkYmHz5HvhoI9jtIzJVRsFeF7BGul
         Ul9A==
X-Forwarded-Encrypted: i=1; AJvYcCUz4x0oYkqrkpTI8GdwIkmsI94e317/k5K7IEY61pGlX/XKlZFPh3ye+bobwssPJPLxecKAiY/Sk5zEoN+Wdy32@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwj8mOKCxHjaWJ6GWGgEqk5ktUI6G+NtWDc0323zoTNJII29U5
	GNVk2BvTmVGvenOE/LmLzNvaNcYfuSkTIM7q2JEhNZYmYsgs6S9+0nJlUQ2ojE0=
X-Gm-Gg: ASbGncu3JeaqmaPtHTo36YBG09gHeatQwon3/vmteoEZsk03lpIBouu4oQU899QufjH
	UZHm8OpaKtQQRGTac7PaOrbMuEaOv1AhOFyE2dleXgRlUDlp0wAELcurmmJhyePwalNN97R178y
	Oz/Wnc726Kl1NKH1+3lJsTuOvqy9ryUl3urmBjcgl2flLQJ4hD4C81JXdF5n6zii10oAmLBuyt1
	Qt3vi6Qwzih1EBfI1lZC7NP9Y41G6IWjYMkyfVbslqHki5MumS7jeU9ROMJ0uyLw8S3bHF7/BpW
	6S0/NOrfMQwH8sIRnzd5Qsy+CpOHhX9mxy0=
X-Google-Smtp-Source: AGHT+IGURbU24AaTjAxqIKJjqCn2mEjZeMLGKyXVZQ1FJ1WehOwHXfyeGE85aKEnu+FeFGs/jt2rrQ==
X-Received: by 2002:adf:a39b:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3975de869d5mr7109406f8f.41.1742097970041;
        Sat, 15 Mar 2025 21:06:10 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:72::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm10726584f8f.25.2025.03.15.21.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:06:09 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 21/25] bpf: Convert lpm_trie.c to rqspinlock
Date: Sat, 15 Mar 2025 21:05:37 -0700
Message-ID: <20250316040541.108729-22-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3875; h=from:subject; bh=JAC4N7kXKK3pnjvfn/+uPUJ4VSIRwkWi681l7P20D6I=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3ePndVFVpKoLfCEr0LeaQTth201gHenOAJqnlp 4yxo4/+JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3gAKCRBM4MiGSL8RyqETD/ wPY/kdxYtWMwPuTaaDUV/B3x37peOYAWOdkQcKpbuywBe0gInjoXHOEs+9kkyNps+nUXY3V1aFV1sh HCKWqCMPO7iBeiB4f45fMwvNewTenIvKf+TNJluOSt/v1CzNEil4pBSqsDlCXmZr8B7JXHb796aCm+ 5WfEq7kYFsgD21IEcJQNF4uTNry5R1ceqOAZvdd4y1NmNljt/7G8QS0IJv3zlu/0+BIunPtpqFbpVP 5z55MtMIE1CGFkAHVq48XJVIB9TfWzMIoyD6LKaRKQbrABVSTvT2LTCRcJkvJFKXpEKGbuYcmjo0pK O1yf/FMseMc11MT7/8ZDm/ezGZao7FjQfCb3U94APSqklR8acBNVZlQeLBwTSY1KIAnQu5C4zjoEme yPoSD0GDwU1vuNhQZvVvL5JSlqw6LXR5JgtO2hm1HOvelVuwOon0Mimv8uG/tiH9K7vPJr83ZdKO6X G4BmtnD77NsUAbSGZsNDHKg0c8/kyezVplqtG2Su21wBajRyeNwORZRBpxsxuP6d6oi3H2Fw43nklC +4rCMj1HNzhTA2XLuXrVuqohGykMqtcQZZNUzk4T6xxGMDuQYGV53FMQZWK9zFKZckR/KT1y/gf3zD rVdO2lI+Ki076kbGMvCDeNlQEq7beSPEriiu/ij7C2wMIRHqnyK28WWFR79w==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210611_472191_46125D39 
X-CRM114-Status: GOOD (  18.02  )
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

Convert all LPM trie usage of raw_spinlock to rqspinlock.

Note that rcu_dereference_protected in trie_delete_elem is switched over
to plain rcu_dereference, the RCU read lock should be held from BPF
program side or eBPF syscall path, and the trie->lock is just acquired
before the dereference. It is not clear the reason the protected variant
was used from the commit history, but the above reasoning makes sense so
switch over.

Closes: https://lore.kernel.org/lkml/000000000000adb08b061413919e@google.com
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/bpf/lpm_trie.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/kernel/bpf/lpm_trie.c b/kernel/bpf/lpm_trie.c
index e8a772e64324..be66d7e520e0 100644
--- a/kernel/bpf/lpm_trie.c
+++ b/kernel/bpf/lpm_trie.c
@@ -15,6 +15,7 @@
 #include <net/ipv6.h>
 #include <uapi/linux/btf.h>
 #include <linux/btf_ids.h>
+#include <asm/rqspinlock.h>
 #include <linux/bpf_mem_alloc.h>
 
 /* Intermediate node */
@@ -36,7 +37,7 @@ struct lpm_trie {
 	size_t				n_entries;
 	size_t				max_prefixlen;
 	size_t				data_size;
-	raw_spinlock_t			lock;
+	rqspinlock_t			lock;
 };
 
 /* This trie implements a longest prefix match algorithm that can be used to
@@ -342,7 +343,9 @@ static long trie_update_elem(struct bpf_map *map,
 	if (!new_node)
 		return -ENOMEM;
 
-	raw_spin_lock_irqsave(&trie->lock, irq_flags);
+	ret = raw_res_spin_lock_irqsave(&trie->lock, irq_flags);
+	if (ret)
+		goto out_free;
 
 	new_node->prefixlen = key->prefixlen;
 	RCU_INIT_POINTER(new_node->child[0], NULL);
@@ -356,8 +359,7 @@ static long trie_update_elem(struct bpf_map *map,
 	 */
 	slot = &trie->root;
 
-	while ((node = rcu_dereference_protected(*slot,
-					lockdep_is_held(&trie->lock)))) {
+	while ((node = rcu_dereference(*slot))) {
 		matchlen = longest_prefix_match(trie, node, key);
 
 		if (node->prefixlen != matchlen ||
@@ -442,8 +444,8 @@ static long trie_update_elem(struct bpf_map *map,
 	rcu_assign_pointer(*slot, im_node);
 
 out:
-	raw_spin_unlock_irqrestore(&trie->lock, irq_flags);
-
+	raw_res_spin_unlock_irqrestore(&trie->lock, irq_flags);
+out_free:
 	if (ret)
 		bpf_mem_cache_free(&trie->ma, new_node);
 	bpf_mem_cache_free_rcu(&trie->ma, free_node);
@@ -467,7 +469,9 @@ static long trie_delete_elem(struct bpf_map *map, void *_key)
 	if (key->prefixlen > trie->max_prefixlen)
 		return -EINVAL;
 
-	raw_spin_lock_irqsave(&trie->lock, irq_flags);
+	ret = raw_res_spin_lock_irqsave(&trie->lock, irq_flags);
+	if (ret)
+		return ret;
 
 	/* Walk the tree looking for an exact key/length match and keeping
 	 * track of the path we traverse.  We will need to know the node
@@ -478,8 +482,7 @@ static long trie_delete_elem(struct bpf_map *map, void *_key)
 	trim = &trie->root;
 	trim2 = trim;
 	parent = NULL;
-	while ((node = rcu_dereference_protected(
-		       *trim, lockdep_is_held(&trie->lock)))) {
+	while ((node = rcu_dereference(*trim))) {
 		matchlen = longest_prefix_match(trie, node, key);
 
 		if (node->prefixlen != matchlen ||
@@ -543,7 +546,7 @@ static long trie_delete_elem(struct bpf_map *map, void *_key)
 	free_node = node;
 
 out:
-	raw_spin_unlock_irqrestore(&trie->lock, irq_flags);
+	raw_res_spin_unlock_irqrestore(&trie->lock, irq_flags);
 
 	bpf_mem_cache_free_rcu(&trie->ma, free_parent);
 	bpf_mem_cache_free_rcu(&trie->ma, free_node);
@@ -592,7 +595,7 @@ static struct bpf_map *trie_alloc(union bpf_attr *attr)
 			  offsetof(struct bpf_lpm_trie_key_u8, data);
 	trie->max_prefixlen = trie->data_size * 8;
 
-	raw_spin_lock_init(&trie->lock);
+	raw_res_spin_lock_init(&trie->lock);
 
 	/* Allocate intermediate and leaf nodes from the same allocator */
 	leaf_size = sizeof(struct lpm_trie_node) + trie->data_size +
-- 
2.47.1


