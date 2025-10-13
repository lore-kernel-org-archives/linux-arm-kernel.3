Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5147CCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pak3PzWX14tdOV4jDxU4oibUGbKEwQFf+VrOwDwaVQ=; b=jMMMMrXEXE9dsIsSuavw/eSjj6
	az3yd9yPGf+pi51+V1U8Qd/vGi/C7U67fCCTrNTxras41Ju9R1EBvOEz6vyfa87vrBMsUbp/L7yqS
	QO819BKb38kzxWTzTI4iXNT+Wsp7dv22Ejl+WybrHXbiMjcovpFKVohBKnqeCzOPOHFwXZnV/V8vj
	eWYsDBmh8wCsLuBZvcKrjElt2SyT1aTUD6Vh8I9h27tQuOraEz+Jgnv6BxXAsPagoqsyidsV0Lr8e
	V6s4ILttse7KTcSGEhBgFoxJPCa87KWezEdUr6NsNdUDTRjZcezxWPVjIP1+jgt7CqFuo2GHilM9c
	RsTdj2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PGy-0000000EQHj-0tz8;
	Mon, 13 Oct 2025 20:36:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PGv-0000000EQF3-3g1p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:35:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C55D43E98;
	Mon, 13 Oct 2025 20:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E744EC4CEFE;
	Mon, 13 Oct 2025 20:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760387757;
	bh=VRca4O5xWSvVtV07vu7T/vayv/vKzk4YtiAHpk59aYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhePkCQL/66n70lV9xZxYwRRP+VnIkS+CH6ARH9WtcldkTiOp5Ob386EHKyl3AMBa
	 9RYk+wDM4ovm/56mZ6bzkEEh9UnuW+WYeuSJUUus+TACOJTuYhJNsvGA+p75if0nIr
	 eF/1rT4tHcaKgPPXNTve99sj8RqEvhRdV8+5zdkPR+FLUveu003ODzhiA2YZdSiMzN
	 L6N60HePBPGl52ouzhwYD9vF78x7wP2Yvg3D7LD2eoI4MiHO+TabowgoVKZ1e5gdiV
	 DR0pYSljDpr9QuAxXqKVRzlLFoIoLIv9vydg718x4I1aBRpQXVEM3pIv7QhMJ6fOYq
	 +KzLX6+lrv2Iw==
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
Subject: [PATCH 31/33] kthread: Document kthread_affine_preferred()
Date: Mon, 13 Oct 2025 22:31:44 +0200
Message-ID: <20251013203146.10162-32-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013203146.10162-1-frederic@kernel.org>
References: <20251013203146.10162-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_133557_952000_7C957602 
X-CRM114-Status: GOOD (  12.26  )
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
index f3397cf7542a..b989aeaa441a 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -857,6 +857,18 @@ int kthreadd(void *unused)
 	return 0;
 }
 
+/**
+ * kthread_affine_preferred - Define a kthread's preferred affinity
+ * @p: thread created by kthread_create().
+ * @cpumask: preferred mask of CPUs (might not be online, must be possible) for @k
+ *           to run on.
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


