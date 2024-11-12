Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F546D42B88
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r3VXIp0XmMBXAlxSwILes2Jqbowq2uwAxf2gqQQs9w=; b=tR6KLMUqQmjuU1nbUTjQgkzksM
	7zIa60JPk7oPI/pOvVe0gKu3h7LW3j+d6N5pmI0izhMtF4IomqhJuE8uvsswznmBxnvdEhguX21np
	zPVQ+thLa172nHckwLck5HgwGJqGiq1B3rXRC51XPd0V6AbNiK6AWYiw+x/owyBzjvvnirgw4ZEGI
	p6THXpwaWvo3KzahNe13hb7IWtDO8JfGYp5vFePgXCeojqtDJ36ZfZuJmusZ4U5pCOfmJi5tFljwd
	JFonezG2fj4M4H253N9Vqhbmh7pj9Ijv+pAi5uXt10qUegMHHqgn1skjbYLQZJG+sPCIIK0CD6dDx
	3iBYriBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArqr-00000003kPI-3ZNa;
	Tue, 12 Nov 2024 14:26:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tArnV-00000003jcC-2Be3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 14:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D6785C55D1;
	Tue, 12 Nov 2024 14:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C81C4CED0;
	Tue, 12 Nov 2024 14:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731421392;
	bh=bRL09e91cC7LQEEs/ysPp5d5gcrpXYKGy36AOC6GrXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGhTRjlXzf9QiP2GqFP1n90Yp6Gy7ImytAGPN2sgtkGb2yFXEkeux54f8ZtKbY6o6
	 a4wcjzEOo9cwkepshRkUQYk1BfaFTtOX2XW+4syhItoE8tbJzybrx32h8m9Ut/0r3f
	 R+Xd12RHGsFv7Y3QLffEjH4uGVjnG1+FKoSbc32spUwStbwoEDLSRhpmXHKhkl0r9p
	 eVnGHCcHmhCT8KUCs3qGDTShB3Bzjjn6j0Fgo5iPCXZibgHfeKeFiNV2mBrdxo/78Z
	 9gUkf3mruDYOIZBZQIe/RbPw8wpI5jt2y9RFLkg0FLYZHP4jApEqyLTwn/d4JNZ1n7
	 oLrZxre4KRLug==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 07/21] soc/qman: test: Use kthread_run_on_cpu()
Date: Tue, 12 Nov 2024 15:22:31 +0100
Message-ID: <20241112142248.20503-8-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241112142248.20503-1-frederic@kernel.org>
References: <20241112142248.20503-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_062313_622515_CD150D3E 
X-CRM114-Status: GOOD (  12.45  )
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

Use the proper API instead of open coding it.

However it looks like kthreads here could be replaced by the use of a
per-cpu workqueue instead.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/soc/fsl/qbman/qman_test_stash.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
index b7e8e5ec884c..f4d3c2146f4f 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -108,14 +108,12 @@ static int on_all_cpus(int (*fn)(void))
 			.fn = fn,
 			.started = ATOMIC_INIT(0)
 		};
-		struct task_struct *k = kthread_create(bstrap_fn, &bstrap,
-			"hotpotato%d", cpu);
+		struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap,
+							   cpu, "hotpotato%d");
 		int ret;
 
 		if (IS_ERR(k))
 			return -ENOMEM;
-		kthread_bind(k, cpu);
-		wake_up_process(k);
 		/*
 		 * If we call kthread_stop() before the "wake up" has had an
 		 * effect, then the thread may exit with -EINTR without ever
-- 
2.46.0


