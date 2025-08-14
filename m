Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DC8CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 03:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOFtgXblvXLvQMiqNX/nSaOt0iX24nILKNRle7lgCw0=; b=gEvp+RYL3QecACjr6+3OQ019u7
	IsqRSWwlGEB0qqb2u5/MMpa7WZL35zIyebrVMM3XFsJ+AT5KCppMV6YuUpWz3p3du7Q9VexGRSHEs
	2gn92yvliyKdaPA/aqYdgMGj/voqh6VkD8yOq7etJ0n25P1X6Ng1GuWoZcAJ1ErZICuLDHFzxI58Q
	50Sj2IFGRV0hT8/yi45knOYzhLv9Qx+SbFMWk6vIFb7paaYtmlAEhG4vGxLglwc5qgI5ETGXJq/7Y
	QvOx7v1Qr0X6yInwG2KYnp2ZWfeTbFANJMDIMKc/B8wustkwtYBViNGp9Qkp8qErt03r7CkQjd3Tz
	+ANYw7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umP75-0000000Fi0h-0Lyo;
	Thu, 14 Aug 2025 03:58:51 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umP1o-0000000FhPE-1CgS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 03:53:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32326e67c95so872093a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 20:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143603; x=1755748403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOFtgXblvXLvQMiqNX/nSaOt0iX24nILKNRle7lgCw0=;
        b=Q/WKxzPoqVDcqblEC+YXdV/SGjACRLnN4LBTnIbv/OfRNFmAaWwuIzTH2oYRTfI1LD
         9+5q8c3uLy8M0yjJZ13F7GguZShUhp2L35i2127KDGPxHjFjNdLeSvYV0S7ewSqyFinN
         fIpmz2VeEHko78FzHF8bYx7GwgfAIrFaELNfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143603; x=1755748403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOFtgXblvXLvQMiqNX/nSaOt0iX24nILKNRle7lgCw0=;
        b=RnwfMSgPD0lWY8dZSRz4vOiPJtwPhR2HtJlxOcbgs3O1JKNGqecQdz3Ij7ix9D0oed
         7GbKXkweMWbsPvg45MFXh8t4jiMdcYRDV3QD7C3wnLEz9siVm01VuuhB9tHHALFAqjz+
         s+XM7Bhpe1qc10yB7XisJHLk36K/ZiUPMbAj/Eb7ORECcx6j78WvTs61XcSEgmZd54r6
         Ulb+x2Pg4uZ9AeAXj15pMBapdFPt2TJteS7KxS+Q1LlZBBfEgYa8AKl2RhtMC1cXFz2+
         DaBYzMFXy8QPvdZMtqhpAb465/zA0vHi1AJn5VpJ0wk74/lG1nll6pMmsHObOJT+THo+
         Jgvg==
X-Forwarded-Encrypted: i=1; AJvYcCUN4zv8qIEgYL5oZDCN6CxO7agOOP6b4w9nxZZH8ykh9zagATbX+qfV8b8DOoX6Q1Xn9ABtn8Sv+7pkzGDtdLP4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2jzFeef6eeWeTdwGSLcVytLarCpzUEX7/XMNp1w5DjGp26+8G
	4RymIBcgFL46seGUF06yxMoxddik0p+OLr920ZKDOUD+VIh6dxXlTB3DKVxygd1Olg==
X-Gm-Gg: ASbGncs5gCYroGB5KgKjk+Y4vV2u8PhtDmCmgnjIEYIsDb+Srzz1sTwbGzedGhu67J7
	dpELNL7ng826kbP5Livwjvm+mci0QZSNcq23De53MvEBd+5bcHS05MlfSqASaCDVSNezkWFeFjF
	rbvsgfxlKN4k7IhkrugPn1heKzfAvf/QPDl9agNNY1p61KVOxOy5RHsDBw5JkyfddxOzsZ+xHh5
	yLEg5PhNb2Hat+u+Ji60dfDhtIIhRVQU4g8ecV2hEXAneH3oWVo278LHRHqNguMBBin6XTlsWr7
	KWiR6sHHUnPYaEFxTruelYDfDmPGp1B7bZsvis70+bTiy70xf0S9uotvhStMHGNPauZboIuQgsW
	P1+2jlYtDSCF7MN4Crn+Pauj3cRj4lEyiirFiw+93X/j55ciYzKQ=
X-Google-Smtp-Source: AGHT+IEHqqgL7gnJ9ZHmq6s9ZQxtBH50CdmeXYydDEbOFKWhOpTUig9K37M/wEt9/Gb9Pz9QeiLeew==
X-Received: by 2002:a17:903:2acc:b0:240:52c8:2556 with SMTP id d9443c01a7336-244586da603mr22577075ad.39.1755143603414;
        Wed, 13 Aug 2025 20:53:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c44f:5805:6bc2:66d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21c65sm342150205ad.73.2025.08.13.20.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 20:53:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] clk: Use hashtable for global clk lookups
Date: Thu, 14 Aug 2025 11:53:16 +0800
Message-ID: <20250814035317.4112336-2-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250814035317.4112336-1-wenst@chromium.org>
References: <20250814035317.4112336-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_205324_326891_F283AD54 
X-CRM114-Status: GOOD (  23.12  )
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

A clk lookup using clk_core_lookup() is currently somewhat expensive
since it has to walk the whole clk tree to find a match. This is
extremely bad in the clk_core_init() function where it is used to look
for clk name conflicts, which is always the worst case of walking the
whole tree. Moreover, the number of clks checked increases as more
clks are registered, causing each subsequent clk registration becoming
slower.

Add a hashtable for doing clk lookups to replace the tree walk method.
On arm64 this increases kernel memory usage by 4 KB for the hashtable,
and 16 bytes (2 pointers) for |struct hlist_node| in each clk. On a
platform with around 800 clks, this reduces the time spent in
clk_core_lookup() significantly:

          |      PID 0      |     kworker     |
          | before |  after | before |  after |
    -------------------------------------------
    avg   | 203 us | 2.7 us | 123 us | 1.5 us |
    -------------------------------------------
    min   | 4.7 us | 2.3 us | 102 us | 0.9 us |
    -------------------------------------------
    max   | 867 us | 4.8 us | 237 us | 3.5 us |
    -------------------------------------------
    culm  | 109 ms | 1.5 ms |  21 ms | 0.3 ms |

This in turn reduces the time spent in clk_hw_register(), and
ultimately, boot time. On a different system with close to 700 clks,
This reduces boot time by around 110 ms. While this doesn't seem like
a lot, this helps in cases where minimizing boot time is important.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- marked hash table as static
---
 drivers/clk/clk.c | 50 +++++++++++++++++------------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2eb63d610cbb..85d2f2481acf 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/hashtable.h>
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -21,6 +22,8 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/stringhash.h>
 
 #include "clk.h"
 
@@ -33,6 +36,9 @@ static struct task_struct *enable_owner;
 static int prepare_refcnt;
 static int enable_refcnt;
 
+#define CLK_HASH_BITS 9
+static DEFINE_HASHTABLE(clk_hashtable, CLK_HASH_BITS);
+
 static HLIST_HEAD(clk_root_list);
 static HLIST_HEAD(clk_orphan_list);
 static LIST_HEAD(clk_notifier_list);
@@ -87,6 +93,7 @@ struct clk_core {
 	struct clk_duty		duty;
 	struct hlist_head	children;
 	struct hlist_node	child_node;
+	struct hlist_node	hashtable_node;
 	struct hlist_head	clks;
 	unsigned int		notifier_count;
 #ifdef CONFIG_DEBUG_FS
@@ -395,45 +402,20 @@ struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_parent);
 
-static struct clk_core *__clk_lookup_subtree(const char *name,
-					     struct clk_core *core)
-{
-	struct clk_core *child;
-	struct clk_core *ret;
-
-	if (!strcmp(core->name, name))
-		return core;
-
-	hlist_for_each_entry(child, &core->children, child_node) {
-		ret = __clk_lookup_subtree(name, child);
-		if (ret)
-			return ret;
-	}
-
-	return NULL;
-}
-
 static struct clk_core *clk_core_lookup(const char *name)
 {
-	struct clk_core *root_clk;
-	struct clk_core *ret;
+	struct clk_core *core;
+	u32 hash;
 
 	if (!name)
 		return NULL;
 
-	/* search the 'proper' clk tree first */
-	hlist_for_each_entry(root_clk, &clk_root_list, child_node) {
-		ret = __clk_lookup_subtree(name, root_clk);
-		if (ret)
-			return ret;
-	}
+	hash = full_name_hash(NULL, name, strlen(name));
 
-	/* if not found, then search the orphan tree */
-	hlist_for_each_entry(root_clk, &clk_orphan_list, child_node) {
-		ret = __clk_lookup_subtree(name, root_clk);
-		if (ret)
-			return ret;
-	}
+	/* search the hashtable */
+	hash_for_each_possible(clk_hashtable, core, hashtable_node, hash)
+		if (!strcmp(core->name, name))
+			return core;
 
 	return NULL;
 }
@@ -4013,6 +3995,8 @@ static int __clk_core_init(struct clk_core *core)
 		hlist_add_head(&core->child_node, &clk_orphan_list);
 		core->orphan = true;
 	}
+	hash_add(clk_hashtable, &core->hashtable_node,
+		 full_name_hash(NULL, core->name, strlen(core->name)));
 
 	/*
 	 * Set clk's accuracy.  The preferred method is to use
@@ -4089,6 +4073,7 @@ static int __clk_core_init(struct clk_core *core)
 	clk_pm_runtime_put(core);
 unlock:
 	if (ret) {
+		hash_del(&core->hashtable_node);
 		hlist_del_init(&core->child_node);
 		core->hw->core = NULL;
 	}
@@ -4610,6 +4595,7 @@ void clk_unregister(struct clk *clk)
 
 	clk_core_evict_parent_cache(clk->core);
 
+	hash_del(&clk->core->hashtable_node);
 	hlist_del_init(&clk->core->child_node);
 
 	if (clk->core->prepare_count)
-- 
2.51.0.rc1.163.g2494970778-goog


