Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AE7D7237B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArkG22qdZfeZQL1mg0jDVHZEGKaocQfpykvwK+7103I=; b=l61DuSqMf2We9x5zxI+wT2CSCA
	bEBHWinOwfuigVEMsLzFImSr2k7s8Xffgnv83hTvywUSCMvrAE0pB+o9ePjeB+SgUlDMTXovo54Au
	89+ELfAEJH6ftKaGziO1gxY9+ETfKeeptS8dTIGEPP7epvhmSYdGYCKTCDlo8oWX6QIKZ9/sWS+4i
	yZdyHiivumEMnNXxUNfcI1kMgMN29JS8GqOVdOM4G3pMAsPKSRIKbhpaT6wXP6odlOQHRePKAfYCo
	WjetxP1NzKR9Qr2cuKZavlofl7hT7SSSgGjoCtsXd7yRE0950vHvg6juDEMNjgxPoTt/CLVjRlo1C
	RDYJ9wcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8vw-0000000BduG-2HNT;
	Sun, 25 Jan 2026 22:50:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8vt-0000000BdrD-2MiH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FBFB41A67;
	Sun, 25 Jan 2026 22:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120E4C19425;
	Sun, 25 Jan 2026 22:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769381413;
	bh=kluxsGzh3yUyBuEdMQW2ChyzrN9Wa4B73tu4Iho0QMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PwIC4g988r+B+FQPa2FGhJt4tSrnNd2nr3Tz4JrNby9d+xw96kD0fCjntTLY1+H1n
	 uXxDNbXKSPe2PPZHG2MkM8KfxPUVZcHV22WrAGuzzmO872gdpB+rEYMVaPF9zDiHeA
	 4DAVOo0ZX1apu66trrhs8xQp/0u1Hpi6J1VWvFy9lMGJMwfhvoSf3REVbWUSMv1fy3
	 w9NNX6yNDqcaFM+CfcvB1OrCkCSjmfni8NhXoeV3iRN0cEMtFRoxEHfQHvq7WzyJd8
	 2Ta3I7sXvWD+IW/l3nN7TVys5aR+iJcCHXKGctB2PGpo2OIwb6AJNGfhBRwGPUwOXV
	 m2Z/opj23gBYw==
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
Subject: [PATCH 32/33] kthread: Document kthread_affine_preferred()
Date: Sun, 25 Jan 2026 23:45:39 +0100
Message-ID: <20260125224541.50226-33-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260125224541.50226-1-frederic@kernel.org>
References: <20260125224541.50226-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_145013_621152_EA27BE7F 
X-CRM114-Status: GOOD (  12.57  )
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

The documentation of this new API has been overlooked during its
introduction. Fill the gap.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/kthread.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 51f419139dea..c50f4c0eabfe 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -856,6 +856,18 @@ int kthreadd(void *unused)
 	return 0;
 }
 
+/**
+ * kthread_affine_preferred - Define a kthread's preferred affinity
+ * @p: thread created by kthread_create().
+ * @mask: preferred mask of CPUs (might not be online, must be possible) for @p
+ *        to run on.
+ *
+ * Similar to kthread_bind_mask() except that the affinity is not a requirement
+ * but rather a preference that can be constrained by CPU isolation or CPU hotplug.
+ * Must be called before the first wakeup of the kthread.
+ *
+ * Returns 0 if the affinity has been applied.
+ */
 int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 {
 	struct kthread *kthread = to_kthread(p);
-- 
2.51.1


