Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C6ACCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0IuDXeqMt1o/KgN3LLvCBk6fnKHY07Zt+5KogqjF0A=; b=Hhev3GgMAo9zd9jv1R6yRzuez5
	SUpZWjXRrvuSlAm/vJOJOXIOZMoR0eVtvujnth1BHTDvVGhkIHA/PdwH3LSCax1UEzIgDQcpUrwbB
	GcuVqKuaAChIPXDT9g8GNtFW+PJ/HSYAHAbvrfVzFXIv3/+Z3zCo5uy0bRlOz8SVDe2QyHMqSxvQq
	n6ZGJlYxYGJzaSKngPlC1XFkHP+MtHrMdCSeaUxoXmAE6dzNxsqs/dxXbteBh0z7HegU67vWLLtjl
	oIxSsZJKCBPTwZcSqzdOi44HFtaqgsJPV/IiBVQvL0lPMTgVQHTnEe5A1eVn82Vu6ZwYGktmW/BsH
	uNsNNuMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkjZ-0000000ESR9-01sW;
	Wed, 05 Nov 2025 21:08:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkjX-0000000ESPf-3Ny1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:07:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 337DE601F1;
	Wed,  5 Nov 2025 21:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1E3C116B1;
	Wed,  5 Nov 2025 21:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762376878;
	bh=VBowzwkKI7sQO6hRH/44BMa4PxA99ppD75DvlCpqKuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HCxWOTZXSfmgLOy+8qHyUSsJQbRRrEggtHXYLIpXy1swuMrv2SEYUM8cLQW7kSc4H
	 0Ka2bto9uN0BXbhyNM3r1gLJVYwW3t2rKAXPeI6d3ZnnTZoRFUTmkBveHxO+F8uRmo
	 AXkHlKN4LkLllSCXYkJiBOKHWrRf6CXXYtYu1l6M03U6EEvLzqrMyOOfnSaNsd0vRj
	 h2TmHpzXfc20tUeNa2fzrHLlFE/ggaDYNk1I4h5CwebPAdOaP0ppHyvo465ef4OXCB
	 CyfaCDTcbrZRKcEQW+8KvinCbmGda/odIiBswEOY/el7rbNcbJ1X/NP4oGu/CK60DH
	 oTdnWeUTkDOGg==
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
Subject: [PATCH 30/31] kthread: Document kthread_affine_preferred()
Date: Wed,  5 Nov 2025 22:03:46 +0100
Message-ID: <20251105210348.35256-31-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105210348.35256-1-frederic@kernel.org>
References: <20251105210348.35256-1-frederic@kernel.org>
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

The documentation of this new API has been overlooked during its
introduction. Fill the gap.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/kthread.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index e38ff9b943cf..4d0d5dccc9d8 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -858,6 +858,18 @@ int kthreadd(void *unused)
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
2.51.0


