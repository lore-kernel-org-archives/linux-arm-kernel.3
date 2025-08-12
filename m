Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48417CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLPnD+avccUvVR9e4PceX6HClVP6oiTocKcKtm4OPbU=; b=gw6Kg+iF1qaMGIex5J0+YsVfmU
	nIy0+te/1DWTRyHKyvxBPgQwBF2QKa2GrWif/QrjQ/0DM2IDcDSzyQH4mo0erHvflbQ4tmy0qMjTy
	vxltqqN5rcx3cHpgAE9+8wBERywgEHb76twl0RCZzPfjJYDNeZQC037NJXJaHJ9JisoMgA3/xuc4W
	jbvKhJnwO7TF8WrDOzOyX75gtmugixFjhhPQdmOHDWK08r70GhhT6tKH9UWPrAAHs+tg7GPMxca6P
	cQrX03jFGuVaiRzAJKaWrXUru6GhMVm0drxOuzD0NyTaHtRVElh8ZCgWAYhMbs2vcUurP+QRngFSU
	ulJfS/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHe-0000000Ald1-0rtW;
	Tue, 12 Aug 2025 12:39:18 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulklE-0000000AIuI-1hrX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:53:37 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2430439c05aso1989465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754988816; x=1755593616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLPnD+avccUvVR9e4PceX6HClVP6oiTocKcKtm4OPbU=;
        b=CkbYkn215yk51cURWyuRMcMYgGu0dPI1559b3+prWS0ZWTwd0uc8GQ2xqV5XE+4bu5
         5OWZA2sR4cvR0tYAHfUDnHh/lKwYIbfpGk1+W3X1vafdixAlAK1mMXZHEZpHtr1cCKdU
         f9TgT3gVzVH9kexYarG764P96AWeVsdx4C6K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754988816; x=1755593616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLPnD+avccUvVR9e4PceX6HClVP6oiTocKcKtm4OPbU=;
        b=hBImn/t3BJItlSMpi1nLTQnhxX6UHD2eozijh7h131jO44Ol1zqV6UFbAayJhxJksK
         zwByfzYg4HPhnsTwyuhAEVQS86WszWekX8jkCobA3UBSRJifT2LklJkeVa03MnzePcOL
         LgdfWhhZk1SIf+VxE8hgd2b0qGcVX7T80kYTU7mb+VYd+ZpbRfKwxd1afVpbX20MPsac
         eVn9X8wNVptHnkiRf3mL58LIysUZ4FEK715IEyV132yRLn5NoyWPNNnQk15UHHt6UjkH
         MIEZvMkbE5yKteL2azJ0qVCfiPN3SYHd3mvGj4Vt1ouswUep6JZDzy45WESrDjPc8no7
         sHgg==
X-Forwarded-Encrypted: i=1; AJvYcCWvfNqtc7xe/5t2vidvv2oRoBjItkti975/M39fVC0Cs9RCjFb7JRFDDIn1MY77/GXaYTh8zQCzVfKtIegDISK5@lists.infradead.org
X-Gm-Message-State: AOJu0YwSmDLWhfO8xqXQD6Um4cP8I6iX7c0Hh1S6YTAeTNPUmcPSb+FW
	yhZPJv347WjPmB9mjswqgSXKSOny4/9D3S+m+6pFPAfYr+LP8HxW7gGuiSslN3OiApifhONN3Zo
	JJ+Q=
X-Gm-Gg: ASbGnctgbLferPllUJePseLPVY0ZZUReLvz7Wznti+SIWIBpoPooBdmqdbYZK8Zgjb5
	hdCd787CtctTryeJSsSgfafjzPpnsNZZo+wkbV+6bN01H2aBAXo9s1HFgD9peTdRrlyXP0VYRHQ
	vOdnZW9u409IIYO6TA9vDlBAFXonW85Gm0Cf/2OyOeD5zJXlMfPcsALladOhEGO/AYcUzhfv/UZ
	G7v7yMhOVJ90dMTkPG42fqinoPcq1X8jpssq/vDDnIeZPfc1U4mo0INwzXG9jQMG6BZnzwFIgjq
	F8mEmj53Z01Y2ILz4+qzYeye+D6JPB/bPmqqXyGn/CzyLne86+/rEwZfkFqmu2Ry3Lme+siukfQ
	kGGPmpVOvQPrA/4FRECvoav6rEX2ViwXpOWqUeUWr
X-Google-Smtp-Source: AGHT+IE9waI3iD48I1Icaq2kvnzZzP6L7x3PIwO1bJzi0aVtk4t1U+vF1hQKX5e9Odzlm0z9y5S+vw==
X-Received: by 2002:a17:903:a4d:b0:242:a0b0:3c1f with SMTP id d9443c01a7336-242fc230ecamr26464165ad.7.1754988815724;
        Tue, 12 Aug 2025 01:53:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f81e:7c91:8fbf:672a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243017dd480sm10014365ad.33.2025.08.12.01.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:53:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: Use hashtable for global clk lookups
Date: Tue, 12 Aug 2025 16:53:27 +0800
Message-ID: <20250812085328.3306705-2-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
In-Reply-To: <20250812085328.3306705-1-wenst@chromium.org>
References: <20250812085328.3306705-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_015336_491820_F5C6C23E 
X-CRM114-Status: GOOD (  23.06  )
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
 drivers/clk/clk.c | 50 +++++++++++++++++------------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2eb63d610cbb..2d54224fb3ef 100644
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
+DEFINE_HASHTABLE(clk_hashtable, CLK_HASH_BITS);
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
2.51.0.rc0.215.g125493bb4a-goog


