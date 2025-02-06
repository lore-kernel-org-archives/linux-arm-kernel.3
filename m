Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78697C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNqgh98W4funKculi1nvK5lPwgfxfi44KHpp2hUPVk4=; b=KZwVwaykiWfqIOra7KdvuFnDYs
	mGl3O6PiZVjOsD0Q/W7X429FPLdIgcl4VtCyPydJL0aPTlE7yabVJ8OWnLAv1eYiJqYc88r7LVw1L
	tcG3KcO3kVndcNM4ilJHDA7JL7GtIQnZYhC6yZb2E9aNOa5N5pICUH8HsJZR/dz6XiAo3pqLJTT+C
	isPmsEpFuM+hDCT1VL2tvy8qpMHyCgNytmtmVBxF3LNxB7yUoP5jJr++EXipiC1R6qD4zNpPJpYzD
	PKGgezOF4WbUvFqj2u/E/7oe9mDUlXqiILXI7pX8NssxfhatTFHw2AeeTkKCrpn0m5KL/bFWqsce4
	4CtFfhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzz4-000000067kz-0hZ9;
	Thu, 06 Feb 2025 11:23:50 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXH-000000061gP-1K8e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:08 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so8393385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839306; x=1739444106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNqgh98W4funKculi1nvK5lPwgfxfi44KHpp2hUPVk4=;
        b=Nr58sCahgFGu/2CrYRBcEyE/CaLgzeVxgiiQ6F792l2v6B+m32Q45JxLvvAG66fakL
         6fClIblftJb2hHYzQKzmn6Sy2LUxvaQ8U4PPfVNycaKS96VT6MnXP1Vcc5mebXcXdk6g
         6TzgmQOMeYXn7sRzcPMHxVU1TLoJbUsRFw2AD5elizTobgytyIeR1aRHVYKRVSa55g+d
         n6GaEyIKQyuouaMTxm4FqEMMrm3Mtybo7ttk4PpBf34gX+Siqq1ry4nnfpXvXntKD02b
         rkrYopCIg/glRTwV1x3vnQeZk8YU601IPPOHaw7jncU1Z4gl35XkR0eOmE7LqC2k23A6
         ovCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839306; x=1739444106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNqgh98W4funKculi1nvK5lPwgfxfi44KHpp2hUPVk4=;
        b=RjfFuU5Oj+RLehPvqa2svWzssnbiRJ+Q8zeh99pXnCIm02D7yWajzL8Ongyxu57j2W
         Prd6sVFB0xHT4QK1sBRazMfNjxwa3InB2lLN0jmC7EWbPEFRcmNZr5aw/ZL0KQGs1LD2
         +qL4lWbTxfyjnaTwjFljoNrBH2drP+Uwm2NcD1kt1e06p1aRg8oWR5UdlxnJl7rtdvw6
         jKypUdO8ZmyJtroMdxVlxE/NpMxdtCeBpr0DG3itmK7ndQKgeZhvGT3Wpjmh4F5auK7L
         1SUsY0V42EitsBl0x44L+YoQEUdahIP/aX7oy5PzWXW8wR6JG9YrjRJ1dZd7ml3YcjNZ
         1wqw==
X-Forwarded-Encrypted: i=1; AJvYcCWXST6BieZE5+9VNTr+LS6Q4Itw2QW3wqVEAXYgpIaWsHs7c6/GCSBeAH/kfeKbl9xSkYHzi64J+gxzKD0S+iEr@lists.infradead.org
X-Gm-Message-State: AOJu0YxlAZsyt6JDL/NBi3yZ49R9NW8XaEKKT/MfUoTCP4e1v7vdGWBT
	al0AofYArCaaIjYZGM8ZFkb+IA+NUf4h+ixLV4Ce/PKgD+Oyt2bW
X-Gm-Gg: ASbGnctyXNv9sgyZkSXgW5G11SqgAmWuUDCb6Z+cL9/6/qCsbDOSiEAUj2n7JqewujC
	SrOBXnWdJ0t43NlrbMmX1CUdvGs3fEUDeYEZt4zYdXk2cok7FN/lR4+f7YvB+nBlhFyIL3GnaMZ
	uZ+2VZGBIDY2p5SvVhrus0Cusobq4E3vDaVWw5yineJABcECYKP/du8QDBXI4f/E+ib7O5jtuII
	DNjspn4SzpN/i7/2mvc324Gen0GSC+u7curc3XTZd9IuIHcX+WQufdrwcYW4s8JznY1rR+IEufp
	Tkgfiw==
X-Google-Smtp-Source: AGHT+IGl6SmZaMuRp7oUK50tAaXGFTAXDbbBuYWF+LV4jkLjehRBR+yIALlWuxWr7fqUlT9fVpNuwQ==
X-Received: by 2002:a05:6000:154a:b0:38d:b125:3783 with SMTP id ffacd0b85a97d-38db4869738mr5279252f8f.18.1738839305846;
        Thu, 06 Feb 2025 02:55:05 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:1e::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d96530fsm50029725e9.19.2025.02.06.02.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:55:05 -0800 (PST)
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
Subject: [PATCH bpf-next v2 21/26] bpf: Convert lpm_trie.c to rqspinlock
Date: Thu,  6 Feb 2025 02:54:29 -0800
Message-ID: <20250206105435.2159977-22-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3797; h=from:subject; bh=7psEOc+yd4qPNsI4KRxI79thdXuYqSsZXOHrdwDSR0g=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRnw6DiRxO330wCUMflYYf1S6rgXtusJs7sBci+ PMosJk6JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZwAKCRBM4MiGSL8Rypr6D/ 0XU5AM+X7xrBbdXvcrdW6JR+XH2p7xDA8af4vJJme6W9rY9nqzM+aeJbS2fsqkaBOjvGhsrm6KSEvU h5nXKuyn5/iiNQyeA2eBNyNmynnhzv6V3d0A7NJwIL2gaLY06/KM6un/G5Zg7met6nyIaESxte16Zt Tj5PkEGuw2YWZIcBVnQHV1DCr9Cc2YERSgY31ol47Dox5OeIfV2Y+ur+/UmtHmdvZ5+g/plLlYxItA 3Mzw1TkFtwsYfMPR4b35Lo1IhYbORKAi5irpZ7F2x9vPeQ2b3wSFo+UjysbmMLgCp4k+cpHnPU+p16 ETzQsMxtY4lYN51QY3p+/yat8sRLixm842KUr+YDb385pgKtUe5qoiH+F47vXvN87HX4t1ptQ2/H7R gu1PEJN4dsT8I3PQzCGdlQoj17l0rZMaNn3acsxv41JTaPrIZgwx7fpOoB8x903xvDrzFJXqGVrwsG ibywFOJqfclF2qvVUO3ygHfXLFXMLus0EHad+VZzDPc0+wy53OQPcURCkt5UiaTENbTuGscfNR9GHT PtQksRTWgfDQgzrDx4EEkFvZ8uKGPHwtH3SAxFXLdTMysqVjm14CT2if0p9yCYswzH/yX3dA7ImI7q xLGCvaXy82YcKX7auIkK8zCMUWSP5gJB30nAtkG1jSBLXHv9M0FKHlbziHLA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025507_351644_74AA437C 
X-CRM114-Status: GOOD (  18.18  )
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
2.43.5


