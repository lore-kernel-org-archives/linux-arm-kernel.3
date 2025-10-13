Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5836CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89JlczJW3/4lbLwv4f6Rnp56viIwvqW3/2ZWEWjCf30=; b=Fh76ouRb8fBWMIoooDbeJhE5VN
	p4W/0ldpnpgUcc3U6oItBPr1IoaU9/5WbkXZhHpbgvbhJp1ESgOYsrN5b7pjg9p2d4XbiDwu77yXe
	ovu+JACuf+kguCXbu2LVyB+K27t3WKqPmsuccaw5+UA4KwY+Wfa6Q/bVuEEkPGBTGPKZaGNBMi8Fu
	sCdiCrChT7A5zEmPxGmC34IuJ8Vitog6QQI4EygfgheLNW2dygYgs7Rk5YwVXZGKvI4C3aV48+b+V
	iDKsvaA4uUH9jP+mwQpsmdRvzwTdq8SaEWs/bX7hC5kcRyTI9Vuu7zFzKFhcso0cFiGDhQ8Pm+/e/
	ljq6NFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PDj-0000000EN5t-0zSo;
	Mon, 13 Oct 2025 20:32:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PDi-0000000EN4j-0MLG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80389602DC;
	Mon, 13 Oct 2025 20:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCA9C4CEE7;
	Mon, 13 Oct 2025 20:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760387557;
	bh=0DsWfneCzpjIl5WbzWDNydymwnwOLTzShyRdiw34zDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y74oHsMCUCu7xOUlp9LjQm6NP3nUM+9L06MxVNQbTC49iOQPzY3C7M9sVklCKROT5
	 fNk3jHeO+EYTF+wNfi97wYtL6cD7is4C47Xjld+LW5m2+8AmghpZuErpsufnn7JYtz
	 0Eh7+vvIb3tpv6FKaaajFXK5oCF8Nc4efzes0xyaxQQqt+QbXch9Tizl4KJb/5a6CX
	 XuLKEUq59kRyITBcpG5J+NZQUMhZz2W9EFcqsqLoZjYbkuSOwZGc19LtJk698QFUjP
	 gz22SoQuMWCIQYRcP1zFr1BfDhIiTIMDLOSDnEzXuTOPOvzt4GVDU+kFULF/8BtWYb
	 i9U3ltzfA02vw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 05/33] sched/isolation: Save boot defined domain flags
Date: Mon, 13 Oct 2025 22:31:18 +0200
Message-ID: <20251013203146.10162-6-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013203146.10162-1-frederic@kernel.org>
References: <20251013203146.10162-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

HK_TYPE_DOMAIN will soon integrate not only boot defined isolcpus= CPUs
but also cpuset isolated partitions.

Housekeeping still needs a way to record what was initially passed
to isolcpus= in order to keep these CPUs isolated after a cpuset
isolated partition is modified or destroyed while containing some of
them.

Create a new HK_TYPE_DOMAIN_BOOT to keep track of those.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Reviewed-by: Phil Auld <pauld@redhat.com>
---
 include/linux/sched/isolation.h | 1 +
 kernel/sched/isolation.c        | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index d8501f4709b5..da22b038942a 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -7,6 +7,7 @@
 #include <linux/tick.h>
 
 enum hk_type {
+	HK_TYPE_DOMAIN_BOOT,
 	HK_TYPE_DOMAIN,
 	HK_TYPE_MANAGED_IRQ,
 	HK_TYPE_KERNEL_NOISE,
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index a4cf17b1fab0..8690fb705089 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -11,6 +11,7 @@
 #include "sched.h"
 
 enum hk_flags {
+	HK_FLAG_DOMAIN_BOOT	= BIT(HK_TYPE_DOMAIN_BOOT),
 	HK_FLAG_DOMAIN		= BIT(HK_TYPE_DOMAIN),
 	HK_FLAG_MANAGED_IRQ	= BIT(HK_TYPE_MANAGED_IRQ),
 	HK_FLAG_KERNEL_NOISE	= BIT(HK_TYPE_KERNEL_NOISE),
@@ -216,7 +217,7 @@ static int __init housekeeping_isolcpus_setup(char *str)
 
 		if (!strncmp(str, "domain,", 7)) {
 			str += 7;
-			flags |= HK_FLAG_DOMAIN;
+			flags |= HK_FLAG_DOMAIN | HK_FLAG_DOMAIN_BOOT;
 			continue;
 		}
 
@@ -246,7 +247,7 @@ static int __init housekeeping_isolcpus_setup(char *str)
 
 	/* Default behaviour for isolcpus without flags */
 	if (!flags)
-		flags |= HK_FLAG_DOMAIN;
+		flags |= HK_FLAG_DOMAIN | HK_FLAG_DOMAIN_BOOT;
 
 	return housekeeping_setup(str, flags);
 }
-- 
2.51.0


