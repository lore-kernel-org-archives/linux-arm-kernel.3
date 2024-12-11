Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428D8E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r3VXIp0XmMBXAlxSwILes2Jqbowq2uwAxf2gqQQs9w=; b=aFqfoeYeCRS32AjO98IA4f8Foz
	PQx0k3fbHnl0SttuWZh9bRB2ZsmuKo3c5YZvnfbaMJCWYohw+D8WaQPcfobex77NUVisfJKSGXXfs
	v1g7kSsvvApjpHpbaTv5gsIzsXDmvQleWTCPEufaR+Novri1anuvPZIBOpKtTJu9KHaDI+3wS7qZ2
	jP7L3XmY7pBRM6E5idK3cIGtCmOXv1RnGVJUNhz42uHTvTbcmGIICZ0TSkMBHm15n0C3A+5BsWl6f
	tVYQfZsT5SXOw8K/GuRHLULVWAybOr8lYxXNFrE/1qTN7/Roo612ooacaXbXc2PF55+2reaKPuvpO
	hew+76zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOrV-0000000FIdt-48Rf;
	Wed, 11 Dec 2024 15:42:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOpc-0000000FI3J-0R3G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:40:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DB295C62D8;
	Wed, 11 Dec 2024 15:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CB5C4CEDD;
	Wed, 11 Dec 2024 15:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931655;
	bh=bRL09e91cC7LQEEs/ysPp5d5gcrpXYKGy36AOC6GrXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TstP/GWESXn5mz/0JLh0l91WVzrEpldhSPLVjcRZOfjfaRBDoQ8RiIEfowR2lsWYP
	 Rko9njDUpHK9O0sihWEULI9jWZm23b2vp96tZd/4UyoJS7EsbQkVaaTRV7pe9i+Hrd
	 U3tMzhk106Tzqdus4BlDa0GMqaCbt9XBQnmxobIj/KYKQ05j/VUN3wXUKpQq2jiJcE
	 kv/NySaaTLJK2HNg60sQ6d9PdiccerfOMOEzO2o3eIpk2zbXu6cCpQczNiRUreZ+s6
	 zE02REc6cCuTFtf8LgRrk/iKbFiA+It8XsPAeMmG5yzR5Ghdg4JVIpmZyfJCraMiGj
	 pYmVUTjqndtwQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 06/19] soc/qman: test: Use kthread_run_on_cpu()
Date: Wed, 11 Dec 2024 16:40:19 +0100
Message-ID: <20241211154035.75565-7-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241211154035.75565-1-frederic@kernel.org>
References: <20241211154035.75565-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074056_192389_C2752544 
X-CRM114-Status: GOOD (  11.91  )
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


