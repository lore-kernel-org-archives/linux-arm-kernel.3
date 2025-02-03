Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8418C02196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXEcaQ/nat4AynYmLE14uvl2r7aUGOOMKf84Ghy3AwI=; b=GVaeRJHdOxJNESfjSSz9Opsd82
	L/k4pcINcs6nGkfBfFS2RqS/zIjFfBvpYw8IquQcF8EKMbNNGGvY5c3vsX3P5kI8GIhxIRVaJc+st
	Zft8osB+gERcg2w8fUXH2Xfr2D68NZqTLcvHKYTSvYOGzgejxTEvlA3O7KxTaDAl+eU5HZC7ZAPZV
	yLfcvi4nj00k82I2+3GdntWtz5K0B/dFaa70NOwsJbE5mIdU1Z2LpcmgHOv+p7OECWBbj4m3A1eg8
	fE/4d7dbMNT39FHYEosI2Db9yQfLHNSa3uho5boml1Q1W2ExYHWeBXn5hrkSPm5lRTE5fdvVMjlqb
	Tz3Ip60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev8D-0000000FJCr-3ux7;
	Mon, 03 Feb 2025 12:00:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tethA-0000000F7S6-0Ihx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gXEcaQ/nat4AynYmLE14uvl2r7aUGOOMKf84Ghy3AwI=; b=pq1p14Uaw+XsugF0yoySi62CEV
	aHjMZ9qb+EiY2wO+Z6v1MA4Xla/BkkgvHbFCRsArl4xIaNCakLarsqFLdxo3C4pXQQgU43Se3RQp3
	WfuHRCOI8Uo10WfQKHeZy07wmGcVmjVxj53n3d9ZqsS06uHsYEaI5yTAcAcQ4/scD8Bqp7NUIFjIc
	IIo3LvQvvXl1QDvA1lPHzlvOXjuJ1XBs/Dm8nStbVYFS1KRSN99Jropn7/djw8RHtf21Hnd8xavWv
	UbJzhIH8GWdzUCIJyNvzuHwHFQNYODdKfGxx31Ln7FmzgyBDHhK9fzrOnWK9OViNWZmBRC1neriiu
	7DHyN4bg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teth6-0000000G3tD-1Nj6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:28:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 128781BA8;
	Mon,  3 Feb 2025 02:29:08 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8CF83F63F;
	Mon,  3 Feb 2025 02:28:39 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH 4/8] rcu: Allow processing kpkeys-protected data
Date: Mon,  3 Feb 2025 10:28:05 +0000
Message-ID: <20250203102809.1223255-5-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203102809.1223255-1-kevin.brodsky@arm.com>
References: <20250203102809.1223255-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102845_099403_15A7B261 
X-CRM114-Status: GOOD (  16.51  )
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

Data assigned a non-default pkey is not writable at the default
kpkeys level. If such data is managed via RCU, some mechanism is
required to temporarily grant write access to the data's struct
rcu_head, for instance when zeroing the callback pointer.

There is unfortunately no straightforward way for RCU to know
whether the managed data is mapped with a non-default pkey. This
patch takes the easy route and switches to the unrestricted kpkeys
level whenever struct rcu_head is written; this should work reliably
but it is clearly suboptimal. That behaviour is enabled by
selecting CONFIG_KPKEYS_UNRESTRICTED_RCU.

This patch isn't comprehensive, in particular it does not take care
of Tiny RCU.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/kpkeys.h     |  6 ++++++
 kernel/rcu/rcu_segcblist.c | 10 +++++++---
 kernel/rcu/tree.c          |  4 +++-
 mm/Kconfig                 |  2 ++
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
index 9d9feec83ccf..c5d804c1ab7b 100644
--- a/include/linux/kpkeys.h
+++ b/include/linux/kpkeys.h
@@ -154,4 +154,10 @@ static inline void kpkeys_hardened_pgtables_enable(void) {}
 
 #endif /* CONFIG_KPKEYS_HARDENED_PGTABLES */
 
+#ifdef CONFIG_KPKEYS_UNRESTRICTED_RCU
+KPKEYS_GUARD(kpkeys_rcu, KPKEYS_LVL_UNRESTRICTED)
+#else
+KPKEYS_GUARD_NOOP(kpkeys_rcu)
+#endif
+
 #endif /* _LINUX_KPKEYS_H */
diff --git a/kernel/rcu/rcu_segcblist.c b/kernel/rcu/rcu_segcblist.c
index 298a2c573f02..a9b5552b53a5 100644
--- a/kernel/rcu/rcu_segcblist.c
+++ b/kernel/rcu/rcu_segcblist.c
@@ -11,6 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
+#include <linux/kpkeys.h>
 
 #include "rcu_segcblist.h"
 
@@ -332,7 +333,8 @@ void rcu_segcblist_enqueue(struct rcu_segcblist *rsclp,
 	rcu_segcblist_inc_len(rsclp);
 	rcu_segcblist_inc_seglen(rsclp, RCU_NEXT_TAIL);
 	rhp->next = NULL;
-	WRITE_ONCE(*rsclp->tails[RCU_NEXT_TAIL], rhp);
+	scoped_guard(kpkeys_rcu)
+		WRITE_ONCE(*rsclp->tails[RCU_NEXT_TAIL], rhp);
 	WRITE_ONCE(rsclp->tails[RCU_NEXT_TAIL], &rhp->next);
 }
 
@@ -381,7 +383,8 @@ void rcu_segcblist_extract_done_cbs(struct rcu_segcblist *rsclp,
 	rclp->len = rcu_segcblist_get_seglen(rsclp, RCU_DONE_TAIL);
 	*rclp->tail = rsclp->head;
 	WRITE_ONCE(rsclp->head, *rsclp->tails[RCU_DONE_TAIL]);
-	WRITE_ONCE(*rsclp->tails[RCU_DONE_TAIL], NULL);
+	scoped_guard(kpkeys_rcu)
+		WRITE_ONCE(*rsclp->tails[RCU_DONE_TAIL], NULL);
 	rclp->tail = rsclp->tails[RCU_DONE_TAIL];
 	for (i = RCU_CBLIST_NSEGS - 1; i >= RCU_DONE_TAIL; i--)
 		if (rsclp->tails[i] == rsclp->tails[RCU_DONE_TAIL])
@@ -436,7 +439,8 @@ void rcu_segcblist_insert_done_cbs(struct rcu_segcblist *rsclp,
 	if (!rclp->head)
 		return; /* No callbacks to move. */
 	rcu_segcblist_add_seglen(rsclp, RCU_DONE_TAIL, rclp->len);
-	*rclp->tail = rsclp->head;
+	scoped_guard(kpkeys_rcu)
+		*rclp->tail = rsclp->head;
 	WRITE_ONCE(rsclp->head, rclp->head);
 	for (i = RCU_DONE_TAIL; i < RCU_CBLIST_NSEGS; i++)
 		if (&rsclp->head == rsclp->tails[i])
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 475f31deed14..48d9d14a2af6 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -64,6 +64,7 @@
 #include <linux/mm.h>
 #include <linux/kasan.h>
 #include <linux/context_tracking.h>
+#include <linux/kpkeys.h>
 #include "../time/tick-internal.h"
 
 #include "tree.h"
@@ -2542,7 +2543,8 @@ static void rcu_do_batch(struct rcu_data *rdp)
 
 		f = rhp->func;
 		debug_rcu_head_callback(rhp);
-		WRITE_ONCE(rhp->func, (rcu_callback_t)0L);
+		scoped_guard(kpkeys_rcu)
+			WRITE_ONCE(rhp->func, (rcu_callback_t)0L);
 		f(rhp);
 
 		rcu_lock_release(&rcu_callback_map);
diff --git a/mm/Kconfig b/mm/Kconfig
index 2a8ebe780e64..e2671c57e047 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1152,6 +1152,8 @@ config ARCH_HAS_KPKEYS
 # ARCH_HAS_KPKEYS must be selected when selecting this option
 config ARCH_HAS_KPKEYS_HARDENED_PGTABLES
 	bool
+config KPKEYS_UNRESTRICTED_RCU
+	bool
 
 config ARCH_USES_PG_ARCH_2
 	bool
-- 
2.47.0


