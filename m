Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D76C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pV8Sn3/Wzf2u35L7Uf0fdtRf3raefbZ3DCYUjKqcPwY=; b=WkF3aENm1Sw6HOVYZKrPWuHJ+7
	WkiJ9iOybtXpmmrmuhPHoCQKmR+Ednebd5vKRhFE7z4GpnmPeF4kT6XWTAaXAPrlAzvve+ir2rzUE
	HQsIRwCupzNhDjimaiPvxNXVlUKqDXMxi5xwKSPmgMBzJAwWXE3voEM4/7k4nwpF2AqhBGVJqCD34
	vmlGU0F/d7/6JJTfUnmBh0k90r2LXJAe9NKuY10qKh2z/h/XPm15O8ySkkS6cOxSMla16eYlxC/bh
	bn0vprYFIBxHhaw3jHch5esTcl8zEtVoyRuQHDglvM9uCSrw2blSJSEvv619NQUgDkLIzT1lIbDMJ
	g9seCf4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzxj-000000067Rl-279z;
	Thu, 06 Feb 2025 11:22:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXE-000000061fI-3jGJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:06 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso4899345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839303; x=1739444103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pV8Sn3/Wzf2u35L7Uf0fdtRf3raefbZ3DCYUjKqcPwY=;
        b=i5sKjCkMYCYmKZbbCrSbuO84YgloANz5Fei15dOuahGWTz+m+wMszuS1+YI9Yacl9S
         Q20OCTWFfs0dyiCwRyxmYpBl+rri5MYpM//L7gAc71/DByTevwjtmF+DAyJfFumj5J3z
         6NkaUTs8pQg3OVRqlH57X6api2rJb/Kwm19gUTmDizsamp6VjkoxTCvJ13vvr8Mnbj+l
         HeRxjtf/lLd3g0nSOgfaBqaipAfkLFX00By/w5RtExy5giLqSeo7zmVGzlt9nL6NcIxg
         X6BFBcw4tzohGB9suAI3SKcsAU9jP5TKWle/UgBOu3mz4WCIb/sj4SntoRq6ZCfr4RyN
         qXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839303; x=1739444103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pV8Sn3/Wzf2u35L7Uf0fdtRf3raefbZ3DCYUjKqcPwY=;
        b=OQ5gA8AdapBW3SAZWE5bAtv8F3QppaxmvWSqSHiIYMpkEvNRcbPVBA9FbFS7B6xq84
         rG9/vkdBMw01won3G3Ak3irmeQRjR0gEj0WamcIMc+i6v5zW5NdSputWNV5PQ2n9X2xS
         21mj1Qf9bdlIVJHtxhNb8Q20nsmJSKpc68nY94U2ui/Cs9SFn6PpfUk2ogtGb5FGmkts
         qovCDFcO92fb5zGaoLbOdrleU/i/OpZq4LMck/WQyBY3AlUR+HowsJ2tKSYMv8Sf+yEj
         x+GD0e5VeL1rlDHE1UlUoF00MTtLwtQTa5Z+DlB+elDhA1YDf1KE9zqLxFbVmhW9248I
         LMJg==
X-Forwarded-Encrypted: i=1; AJvYcCUPuaZY/2nttJ0ciNGBswQ6ztTd59M4JEg5I30xxMRqXmLPUXFaguYHocRR3JTxiwjyiBPvCCjiBT/9ChSDLx/Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Jly9XXoINM5/6Xqn2WMGkl/iJbaDcVbqs5UUJnGB5GCfBXuq
	S6OoIGOvITEjCegvnnQRBJTK8NA4wNzsIrQY8uPPdW73zzjNTLnH
X-Gm-Gg: ASbGncvjG73XJytZoz82n9yinjoUOeGcIwRJo3z5iGwWM03HWm79eZH0FTbFd4AjHNs
	Pu8RICqeTD/g9ZEI9VdQDJA2LsPCmuHGTUtWwSkcZR3ky1uT+NnE8dD3o7oLrKThCqLaz416Ra/
	pdatiau49jo1xEcfzcJLPArIS2yves+5zBzkGU2/9MJHxGmIJdAXXOpO06McwKtCE9nvpdglkIJ
	94mycBeSjdwIjguKH23cDSBjmFDlYmVg5aIanDrO2t97GP9MnGozOoULed7L2SlLBDbz1jAtduM
	j4KQcQ==
X-Google-Smtp-Source: AGHT+IF1B76+1ynE7+9dQEBX3L/iUxR6t+WoOTyxAKlHsKCxtnZ617dC5+DYUZ8gZKTRoQgB1NYv6Q==
X-Received: by 2002:a05:600c:310b:b0:434:eb86:aeca with SMTP id 5b1f17b1804b1-4390d43401bmr53989535e9.10.1738839303346;
        Thu, 06 Feb 2025 02:55:03 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:73::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da965a6sm15547985e9.6.2025.02.06.02.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:55:02 -0800 (PST)
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
Subject: [PATCH bpf-next v2 19/26] bpf: Convert hashtab.c to rqspinlock
Date: Thu,  6 Feb 2025 02:54:27 -0800
Message-ID: <20250206105435.2159977-20-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10973; h=from:subject; bh=PXV2g5jkXA6M5CNQXPC4dpfD1jgCcit6rNK1L4ARIdA=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRmPzcSKNTT0EqqnnkfrvBHcqC+gjliccdRPRLE gq5UTVWJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZgAKCRBM4MiGSL8Ryk5KD/ 9ctjNzhAOgMhJSDZVpv3j4of82O3Xfa/GeQWEsteAu7YzSYq9AIIE3HFCAgpILNT3t5B88CX2Ed1lP x7dqTeC9Uk0p5aenpsjKIaVczLP6xpR/qmVo4I6h57OW1szo7kfpJPwNod+b01Lsjd/4XhfiP0XMTP G76JN02zA8AGTVzvJ8vGj1QdFNU9+tF03KJXh+Ai+Hy7bM/zZZnTDzBA7JGwE5Z3ySRB16mRXmSVLz CLGdo2Vx6qHCLVgZYsnC2f8JFgFXNNkkEcIDSP7o4OaZzrAd8KLs4rj30sgypf6XlKOaZP0cMAh97R rv9OgrXJGSWzBydhJ2Yo/U9qlaChNMWunq075WSaiww/hRbinOWydGQIl0BjHkhOsKVhBVaUhJT7mH 11W6qKAuXa0BEPoRunMVTqW01R4v/bj+YfT4PH+kIRjtYpePc7WvEnxYYr3HAhgiEiOzRNYV/nz7i1 6Qxz8MOJnYfqv5lWb482r1sfm0F+njVMg5corGbZpFCvMJMAbVl7JlJWn3KBt/rsn852KjsX0vk+KT Y4I+fnWdHm6XJ+zLmMdJjxipaCf42YtN3jaFQn/AfCmYRCm/oAaqCIpx1s2cTQi5Kpy0J3M4iGCVSm IfffEEuYwarej+1RmRfEc7KsRdw9g1C3XN/mK0+uQ97QaolvQ1fpjm1VZIXg==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025505_062142_E5F28DA7 
X-CRM114-Status: GOOD (  22.48  )
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

Convert hashtab.c from raw_spinlock to rqspinlock, and drop the hashed
per-cpu counter crud from the code base which is no longer necessary.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/bpf/hashtab.c | 102 ++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 70 deletions(-)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index 4a9eeb7aef85..9b394e147967 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -16,6 +16,7 @@
 #include "bpf_lru_list.h"
 #include "map_in_map.h"
 #include <linux/bpf_mem_alloc.h>
+#include <asm/rqspinlock.h>
 
 #define HTAB_CREATE_FLAG_MASK						\
 	(BPF_F_NO_PREALLOC | BPF_F_NO_COMMON_LRU | BPF_F_NUMA_NODE |	\
@@ -78,7 +79,7 @@
  */
 struct bucket {
 	struct hlist_nulls_head head;
-	raw_spinlock_t raw_lock;
+	rqspinlock_t raw_lock;
 };
 
 #define HASHTAB_MAP_LOCK_COUNT 8
@@ -104,8 +105,6 @@ struct bpf_htab {
 	u32 n_buckets;	/* number of hash buckets */
 	u32 elem_size;	/* size of each element in bytes */
 	u32 hashrnd;
-	struct lock_class_key lockdep_key;
-	int __percpu *map_locked[HASHTAB_MAP_LOCK_COUNT];
 };
 
 /* each htab element is struct htab_elem + key + value */
@@ -140,45 +139,26 @@ static void htab_init_buckets(struct bpf_htab *htab)
 
 	for (i = 0; i < htab->n_buckets; i++) {
 		INIT_HLIST_NULLS_HEAD(&htab->buckets[i].head, i);
-		raw_spin_lock_init(&htab->buckets[i].raw_lock);
-		lockdep_set_class(&htab->buckets[i].raw_lock,
-					  &htab->lockdep_key);
+		raw_res_spin_lock_init(&htab->buckets[i].raw_lock);
 		cond_resched();
 	}
 }
 
-static inline int htab_lock_bucket(const struct bpf_htab *htab,
-				   struct bucket *b, u32 hash,
-				   unsigned long *pflags)
+static inline int htab_lock_bucket(struct bucket *b, unsigned long *pflags)
 {
 	unsigned long flags;
+	int ret;
 
-	hash = hash & min_t(u32, HASHTAB_MAP_LOCK_MASK, htab->n_buckets - 1);
-
-	preempt_disable();
-	local_irq_save(flags);
-	if (unlikely(__this_cpu_inc_return(*(htab->map_locked[hash])) != 1)) {
-		__this_cpu_dec(*(htab->map_locked[hash]));
-		local_irq_restore(flags);
-		preempt_enable();
-		return -EBUSY;
-	}
-
-	raw_spin_lock(&b->raw_lock);
+	ret = raw_res_spin_lock_irqsave(&b->raw_lock, flags);
+	if (ret)
+		return ret;
 	*pflags = flags;
-
 	return 0;
 }
 
-static inline void htab_unlock_bucket(const struct bpf_htab *htab,
-				      struct bucket *b, u32 hash,
-				      unsigned long flags)
+static inline void htab_unlock_bucket(struct bucket *b, unsigned long flags)
 {
-	hash = hash & min_t(u32, HASHTAB_MAP_LOCK_MASK, htab->n_buckets - 1);
-	raw_spin_unlock(&b->raw_lock);
-	__this_cpu_dec(*(htab->map_locked[hash]));
-	local_irq_restore(flags);
-	preempt_enable();
+	raw_res_spin_unlock_irqrestore(&b->raw_lock, flags);
 }
 
 static bool htab_lru_map_delete_node(void *arg, struct bpf_lru_node *node);
@@ -483,14 +463,12 @@ static struct bpf_map *htab_map_alloc(union bpf_attr *attr)
 	bool percpu_lru = (attr->map_flags & BPF_F_NO_COMMON_LRU);
 	bool prealloc = !(attr->map_flags & BPF_F_NO_PREALLOC);
 	struct bpf_htab *htab;
-	int err, i;
+	int err;
 
 	htab = bpf_map_area_alloc(sizeof(*htab), NUMA_NO_NODE);
 	if (!htab)
 		return ERR_PTR(-ENOMEM);
 
-	lockdep_register_key(&htab->lockdep_key);
-
 	bpf_map_init_from_attr(&htab->map, attr);
 
 	if (percpu_lru) {
@@ -536,15 +514,6 @@ static struct bpf_map *htab_map_alloc(union bpf_attr *attr)
 	if (!htab->buckets)
 		goto free_elem_count;
 
-	for (i = 0; i < HASHTAB_MAP_LOCK_COUNT; i++) {
-		htab->map_locked[i] = bpf_map_alloc_percpu(&htab->map,
-							   sizeof(int),
-							   sizeof(int),
-							   GFP_USER);
-		if (!htab->map_locked[i])
-			goto free_map_locked;
-	}
-
 	if (htab->map.map_flags & BPF_F_ZERO_SEED)
 		htab->hashrnd = 0;
 	else
@@ -607,15 +576,12 @@ static struct bpf_map *htab_map_alloc(union bpf_attr *attr)
 free_map_locked:
 	if (htab->use_percpu_counter)
 		percpu_counter_destroy(&htab->pcount);
-	for (i = 0; i < HASHTAB_MAP_LOCK_COUNT; i++)
-		free_percpu(htab->map_locked[i]);
 	bpf_map_area_free(htab->buckets);
 	bpf_mem_alloc_destroy(&htab->pcpu_ma);
 	bpf_mem_alloc_destroy(&htab->ma);
 free_elem_count:
 	bpf_map_free_elem_count(&htab->map);
 free_htab:
-	lockdep_unregister_key(&htab->lockdep_key);
 	bpf_map_area_free(htab);
 	return ERR_PTR(err);
 }
@@ -817,7 +783,7 @@ static bool htab_lru_map_delete_node(void *arg, struct bpf_lru_node *node)
 	b = __select_bucket(htab, tgt_l->hash);
 	head = &b->head;
 
-	ret = htab_lock_bucket(htab, b, tgt_l->hash, &flags);
+	ret = htab_lock_bucket(b, &flags);
 	if (ret)
 		return false;
 
@@ -828,7 +794,7 @@ static bool htab_lru_map_delete_node(void *arg, struct bpf_lru_node *node)
 			break;
 		}
 
-	htab_unlock_bucket(htab, b, tgt_l->hash, flags);
+	htab_unlock_bucket(b, flags);
 
 	if (l == tgt_l)
 		check_and_free_fields(htab, l);
@@ -1147,7 +1113,7 @@ static long htab_map_update_elem(struct bpf_map *map, void *key, void *value,
 		 */
 	}
 
-	ret = htab_lock_bucket(htab, b, hash, &flags);
+	ret = htab_lock_bucket(b, &flags);
 	if (ret)
 		return ret;
 
@@ -1198,7 +1164,7 @@ static long htab_map_update_elem(struct bpf_map *map, void *key, void *value,
 			check_and_free_fields(htab, l_old);
 		}
 	}
-	htab_unlock_bucket(htab, b, hash, flags);
+	htab_unlock_bucket(b, flags);
 	if (l_old) {
 		if (old_map_ptr)
 			map->ops->map_fd_put_ptr(map, old_map_ptr, true);
@@ -1207,7 +1173,7 @@ static long htab_map_update_elem(struct bpf_map *map, void *key, void *value,
 	}
 	return 0;
 err:
-	htab_unlock_bucket(htab, b, hash, flags);
+	htab_unlock_bucket(b, flags);
 	return ret;
 }
 
@@ -1254,7 +1220,7 @@ static long htab_lru_map_update_elem(struct bpf_map *map, void *key, void *value
 	copy_map_value(&htab->map,
 		       l_new->key + round_up(map->key_size, 8), value);
 
-	ret = htab_lock_bucket(htab, b, hash, &flags);
+	ret = htab_lock_bucket(b, &flags);
 	if (ret)
 		goto err_lock_bucket;
 
@@ -1275,7 +1241,7 @@ static long htab_lru_map_update_elem(struct bpf_map *map, void *key, void *value
 	ret = 0;
 
 err:
-	htab_unlock_bucket(htab, b, hash, flags);
+	htab_unlock_bucket(b, flags);
 
 err_lock_bucket:
 	if (ret)
@@ -1312,7 +1278,7 @@ static long __htab_percpu_map_update_elem(struct bpf_map *map, void *key,
 	b = __select_bucket(htab, hash);
 	head = &b->head;
 
-	ret = htab_lock_bucket(htab, b, hash, &flags);
+	ret = htab_lock_bucket(b, &flags);
 	if (ret)
 		return ret;
 
@@ -1337,7 +1303,7 @@ static long __htab_percpu_map_update_elem(struct bpf_map *map, void *key,
 	}
 	ret = 0;
 err:
-	htab_unlock_bucket(htab, b, hash, flags);
+	htab_unlock_bucket(b, flags);
 	return ret;
 }
 
@@ -1378,7 +1344,7 @@ static long __htab_lru_percpu_map_update_elem(struct bpf_map *map, void *key,
 			return -ENOMEM;
 	}
 
-	ret = htab_lock_bucket(htab, b, hash, &flags);
+	ret = htab_lock_bucket(b, &flags);
 	if (ret)
 		goto err_lock_bucket;
 
@@ -1402,7 +1368,7 @@ static long __htab_lru_percpu_map_update_elem(struct bpf_map *map, void *key,
 	}
 	ret = 0;
 err:
-	htab_unlock_bucket(htab, b, hash, flags);
+	htab_unlock_bucket(b, flags);
 err_lock_bucket:
 	if (l_new) {
 		bpf_map_dec_elem_count(&htab->map);
@@ -1444,7 +1410,7 @@ static long htab_map_delete_elem(struct bpf_map *map, void *key)
 	b = __select_bucket(htab, hash);
 	head = &b->head;
 
-	ret = htab_lock_bucket(htab, b, hash, &flags);
+	ret = htab_lock_bucket(b, &flags);
 	if (ret)
 		return ret;
 
@@ -1454,7 +1420,7 @@ static long htab_map_delete_elem(struct bpf_map *map, void *key)
 	else
 		ret = -ENOENT;
 
-	htab_unlock_bucket(htab, b, hash, flags);
+	htab_unlock_bucket(b, flags);
 
 	if (l)
 		free_htab_elem(htab, l);
@@ -1480,7 +1446,7 @@ static long htab_lru_map_delete_elem(struct bpf_map *map, void *key)
 	b = __select_bucket(htab, hash);
 	head = &b->head;
 
-	ret = htab_lock_bucket(htab, b, hash, &flags);
+	ret = htab_lock_bucket(b, &flags);
 	if (ret)
 		return ret;
 
@@ -1491,7 +1457,7 @@ static long htab_lru_map_delete_elem(struct bpf_map *map, void *key)
 	else
 		ret = -ENOENT;
 
-	htab_unlock_bucket(htab, b, hash, flags);
+	htab_unlock_bucket(b, flags);
 	if (l)
 		htab_lru_push_free(htab, l);
 	return ret;
@@ -1558,7 +1524,6 @@ static void htab_map_free_timers_and_wq(struct bpf_map *map)
 static void htab_map_free(struct bpf_map *map)
 {
 	struct bpf_htab *htab = container_of(map, struct bpf_htab, map);
-	int i;
 
 	/* bpf_free_used_maps() or close(map_fd) will trigger this map_free callback.
 	 * bpf_free_used_maps() is called after bpf prog is no longer executing.
@@ -1583,9 +1548,6 @@ static void htab_map_free(struct bpf_map *map)
 	bpf_mem_alloc_destroy(&htab->ma);
 	if (htab->use_percpu_counter)
 		percpu_counter_destroy(&htab->pcount);
-	for (i = 0; i < HASHTAB_MAP_LOCK_COUNT; i++)
-		free_percpu(htab->map_locked[i]);
-	lockdep_unregister_key(&htab->lockdep_key);
 	bpf_map_area_free(htab);
 }
 
@@ -1628,7 +1590,7 @@ static int __htab_map_lookup_and_delete_elem(struct bpf_map *map, void *key,
 	b = __select_bucket(htab, hash);
 	head = &b->head;
 
-	ret = htab_lock_bucket(htab, b, hash, &bflags);
+	ret = htab_lock_bucket(b, &bflags);
 	if (ret)
 		return ret;
 
@@ -1665,7 +1627,7 @@ static int __htab_map_lookup_and_delete_elem(struct bpf_map *map, void *key,
 	hlist_nulls_del_rcu(&l->hash_node);
 
 out_unlock:
-	htab_unlock_bucket(htab, b, hash, bflags);
+	htab_unlock_bucket(b, bflags);
 
 	if (l) {
 		if (is_lru_map)
@@ -1787,7 +1749,7 @@ __htab_map_lookup_and_delete_batch(struct bpf_map *map,
 	head = &b->head;
 	/* do not grab the lock unless need it (bucket_cnt > 0). */
 	if (locked) {
-		ret = htab_lock_bucket(htab, b, batch, &flags);
+		ret = htab_lock_bucket(b, &flags);
 		if (ret) {
 			rcu_read_unlock();
 			bpf_enable_instrumentation();
@@ -1810,7 +1772,7 @@ __htab_map_lookup_and_delete_batch(struct bpf_map *map,
 		/* Note that since bucket_cnt > 0 here, it is implicit
 		 * that the locked was grabbed, so release it.
 		 */
-		htab_unlock_bucket(htab, b, batch, flags);
+		htab_unlock_bucket(b, flags);
 		rcu_read_unlock();
 		bpf_enable_instrumentation();
 		goto after_loop;
@@ -1821,7 +1783,7 @@ __htab_map_lookup_and_delete_batch(struct bpf_map *map,
 		/* Note that since bucket_cnt > 0 here, it is implicit
 		 * that the locked was grabbed, so release it.
 		 */
-		htab_unlock_bucket(htab, b, batch, flags);
+		htab_unlock_bucket(b, flags);
 		rcu_read_unlock();
 		bpf_enable_instrumentation();
 		kvfree(keys);
@@ -1884,7 +1846,7 @@ __htab_map_lookup_and_delete_batch(struct bpf_map *map,
 		dst_val += value_size;
 	}
 
-	htab_unlock_bucket(htab, b, batch, flags);
+	htab_unlock_bucket(b, flags);
 	locked = false;
 
 	while (node_to_free) {
-- 
2.43.5


