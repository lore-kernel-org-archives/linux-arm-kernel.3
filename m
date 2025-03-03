Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785F1C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ign20YEmiqhrw2u8+y6jgpbQIECAjRoqEHqNv09q2OE=; b=ZRmD4/a03Vhxgu3g8bvEX8piJD
	aXmMgNVFoBh+xLAoEIL+tPVH1sEf8581KGvUq0LqTvHZ91Y2P1KFwR+P1DG8imQphUZxvFiY3A6CB
	Z01Y1DZTiD6Cphlt3N2tgdEcHZcaKUsKhFGLYslWb22AQ0Lgx+pwzMhetLB2fi/HI4aRg6gtkwuM5
	ALJgepWzxqD6AKIZdPwteuxfbBuZKYy0JO9+3r4m4JIN22hLdkksZzFRNzHjQPZA3elLG8Jphe5n/
	J6LzOrn7gf4dQEN+aGPjkp2SmD8+xdiH2FPfGrOSZMDz40nKjKrxIt6LtngVN/8WsISXg71Ji28mV
	PjBTXtcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8BX-00000001PN7-2WhK;
	Mon, 03 Mar 2025 15:58:27 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dq-00000001IOf-1jx2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:39 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso7209815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015417; x=1741620217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ign20YEmiqhrw2u8+y6jgpbQIECAjRoqEHqNv09q2OE=;
        b=GE/1xtrBxxpVEt+57RrGxiPgKkuYv7VEJER6yyrZQniW6bt8Vfamq0+3y08zdPokds
         Bt0DkwtJt3X6Vd5rDDUDBN6wj7RbbwHX1UQdYJvhgPRrjM1oWG3A+AW56vsKbkXyhW19
         3QaCR7GMm7+jvjg8as6KZuDrloQtpsue1x/94O8NUIUhR2kjLw9fY6dOUxznPWLuSlhV
         cFlicCKuU6lqJNYETNBgUw7HU/jVsjHgpU+hhp47pn2Kh//eDXnP3xaYvTXNVWbVKR78
         evzozGKT8ZDxX5T6FMT9PwjOAGIiZeLkKz4Vv06r9eY/MxnUacm+Pfnbv4b9m/TQLNGf
         VMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015417; x=1741620217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ign20YEmiqhrw2u8+y6jgpbQIECAjRoqEHqNv09q2OE=;
        b=aObZGjeyzCZJUF2khhualLhlNJCIqmW0N90Qy08/2AzXPOUajN4uxEQVFcvNVBCQNq
         KWyf7CirqLJpy3VTykdD938JYuAj3G2Z0MKS4730bTE6lNsRwcvHpCI3WOiJltFLXdGd
         1UiOIbrxft8VYHItxs+qMhJmPEJ5QVmQRt92/wVJ543yaev/HjXKKM+xzoxmllwthLso
         sU3mMrTJSpnozsthBHY0SmkXTPyEoYk0UfAVhfPGlHrlsAz+NS0O3PEkLzaRMqODdGv6
         I2I7dEPGA8/laciXpiI3WN1UWyWChZ36QdhuKZ/00P1eskHF0TYriz3PjXbkB3Nl/xCB
         V73Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRJMRvvYjoLoRF+1gGB+3VNHdTnvdbZ7NMfsMV+JUuJnrBSV+M80697UuylXgwgTXxHCqXlajTKwdw4KYj5Y13@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7H4qk6k7VZTsjXgOmEYj3PBl08+jrjayDNvm+ql4Hb9TvLYCk
	WtuQ5lRVqZHx+kRGw+w9smN4XiPJ06SHpGZRqDKCRUSmsvpCwI9v
X-Gm-Gg: ASbGncuN3YATR2FL5NWFTZdq7ZYBoebfprj2apSQpkJQyMlaUXkraYzDzvmVRNoYNf1
	/kYSOBkIjQHbOLfVSXDo1Jmfz1N9qyEQ2Y6ozLx2lbw1TL7+qW/RkKSibcwJLZpVVB6Pjb7bBlm
	KVI8Z/LXEdbOZoL5a3HuVhFmsCOcq24dSWd5nV4Hre8j+bR2Gwxglw2afRrZ+9Da/7aODzZxzsP
	qQvhdeN3O1ZFg+PqUMN73Q5BMZTfNym37ec1sLujKg6/WBatwEmjBcNOfQDapHfFWlKImYNmKkX
	WJUhDNjO3A43f3guMbBgRabZL0Ll4GHLrg==
X-Google-Smtp-Source: AGHT+IGlleKe6Z0c4L94quE3jCAiGhg6NJQ9iC0AaFH2JLOqqs7KqiXhmqbOtJsTuHI4jJYfhIdEnw==
X-Received: by 2002:a05:600c:a03:b0:439:9b19:9e2d with SMTP id 5b1f17b1804b1-43ba6702becmr131087705e9.16.1741015416963;
        Mon, 03 Mar 2025 07:23:36 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:7::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbfece041sm37242865e9.1.2025.03.03.07.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:36 -0800 (PST)
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
Subject: [PATCH bpf-next v3 21/25] bpf: Convert lpm_trie.c to rqspinlock
Date: Mon,  3 Mar 2025 07:23:01 -0800
Message-ID: <20250303152305.3195648-22-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3875; h=from:subject; bh=H+4fvDbeMKpg9kdHFVQF9EirB/DOLCaq4vd16HHmH14=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWYzhMQMRB+v202mYygVFkG5s/se6GlCLJdFF8d 3MnU/7aJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFmAAKCRBM4MiGSL8Rym2eEA CegI2sLVgC2H3/ckPAgaXiYSYSB/uZkXAnww6a6gZc4jNT9kbnHO5KY2RaymVBLci89GDlmnX3v+wp WH5WovKA4m3qH12EjfliSemjg4XIf5M+9Ubag8HHRATXQ0yaW0/Qm4ssV5nbBuntkgRgngLkiyA5C8 6fjsJiKGdQIahwdn/67q1wa9oR78sDXdVF+AOJsCO2QuhaU5qq0dltH27b3gJqWKSyc1OZcC5r1l61 elIyx2qtvgu8OqcZZqaRnEqrlW0x0BpkkO7Dgku2PsEA2SH7M+1DMl5mqtd3J2A0MZrUOT6OjSXmg4 p9NU7L83xsKPB1L/pYutorTTzi6toA8506vLLki/zJPux9cMC5JYuSLqcpz0pb1Q9FKfd8pB/9TfSu pbO9LSlidNGUkw43mfpYyTaDXU14Ud+GC+0SLrUZPMF5UwGNMJuS7N5MfGYxZ+Cwmw5fKGhqPOl9iz 9LGmjGVn6Kv7wo6LX+4HFS3gLLUM/eXMg+u9WWdTUBvFK+ksxSCkHM5fghBlgZS02NQfzLCdz6uO07 4a4aGj9rfzYsf+X9gWldSoL3VrCmnfaj9BW6RTJpdYDI5j73EYdqt946jfnpVYlit0hY5aV7DI4ZiI +0MFK7IDXVAmFcgWYbJJ2fnguEXpNKxH7KrBlkDDpqfs578zqAeL7aGfqhUg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072338_457546_047D8422 
X-CRM114-Status: GOOD (  17.67  )
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
2.43.5


