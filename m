Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291C1E75458
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/10IlccYcazenHZF7/ruQEbfw98HxxiKHU+5k+KbG/A=; b=tflewAdt3xvCyB2b21vq1jYgeH
	cYSwBSa7n+jKO3pLLgm0P8WdaKI5uvwmY9jpza6yQQKSVmLUA20qUmKxoYFvIXXN/h3fvGOFqOF2E
	9XJlDcieZ2pp+aBaTlE+MCaVnM9pJJ3Tta6XXJeUEVXrRuj2DUfgzxje8H5nPmXRVgJcMG+8epUvN
	vzeC+oKirKgyXnG+GV3ny9hpjy58qIVtr+0Cje0X5ZBHi5D1Q/peBViLyfXVzTdVdu/qLuSb1euVJ
	MRB16jmpEYSC14Gl47RM7Iu92RY9LgxLNc9cCV9+BK09R672wM7OB+t8dLW95RAIMNloxpcqHYT3V
	BAgT2zew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPE5-0000000GtIp-2ifv;
	Wed, 24 Dec 2025 13:48:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPDz-0000000GtDF-3GJh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 13:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38FB36016E;
	Wed, 24 Dec 2025 13:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25099C116D0;
	Wed, 24 Dec 2025 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766584102;
	bh=j5Xo9SgxVc3Z/snvIhCh0/gaEOBvl1HuvW1WHfNbS+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VP9vWtEQMKo+zDsbevT5wQSFQoFkJ6bHLkXPQ4e/hL1GMsEmhA9S6VLnkLTgADD1/
	 G3SeK7SFyIWx/tRRfwEf7fW8TxX3ip+2wJF7N3zAB5PhHZvpi4vme4GWEln2CpdSbX
	 1DAp1RM9eIBNG1TY46EEx8DQBRDXFtMCcK+HT5K/09bzrHbUOQPTz3M7xa7yrhFaAZ
	 HXwKm7+63Mhl/YGnJBl89pDwpCgx8UfxUJQqTMc5AUlDdZxiRw5amwB/tEiQZcJfm3
	 DvhRdcxE9C3ohMufQvarOKmcMrhy7XmYpkVSGL5E9E/HFmkf3DNsziUIQKNaLRYURj
	 ekZFnfaRzEuRA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,
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
Subject: [PATCH 20/33] timers/migration: Remove superfluous cpuset isolation test
Date: Wed, 24 Dec 2025 14:45:07 +0100
Message-ID: <20251224134520.33231-21-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251224134520.33231-1-frederic@kernel.org>
References: <20251224134520.33231-1-frederic@kernel.org>
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

Cpuset isolated partitions are now included in HK_TYPE_DOMAIN. Testing
if a CPU is part of an isolated partition alone is now useless.

Remove the superflous test.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/time/timer_migration.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 3879575a4975..6da9cd562b20 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -466,9 +466,8 @@ static inline bool tmigr_is_isolated(int cpu)
 {
 	if (!static_branch_unlikely(&tmigr_exclude_isolated))
 		return false;
-	return (!housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
-		cpuset_cpu_is_isolated(cpu)) &&
-	       housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE);
+	return (!housekeeping_cpu(cpu, HK_TYPE_DOMAIN) &&
+		housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE));
 }
 
 /*
-- 
2.51.1


