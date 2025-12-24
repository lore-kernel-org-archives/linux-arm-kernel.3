Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED965E75453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PccGRd2au1n9nQvEk/PkCGv+alNBYU7VP4ze/r44x5Y=; b=JMkWf9mGbAchJS9bimdWyybsjM
	60b67e0WLrBiHK1av8rjpUuGIJdDOHgs/gXGTAKCMRGnnX5/jNtu8LEfQ8hHZT2qK5FTSkfWaoNUo
	54OyMquC6saa0aj2ju4iSBkNp4Ed20kDpAxXGRNCHGUJopf26Vz+UrZqXJTThYgXOIXHPTfkgJtSL
	g+IOYx7JJBCS0FiwNBuRI0IN+HUYkooA1R6W2V9jiEXPVoTq7bUMFejfzsjSSbVIDKVdhgCa2JC27
	bLbCDZdsCWMdHcCzcngGcqeY0kgD5NrcPaTgl+MPl6UwJFJQLNnFgWOMUvXibg1i70PDw5+TwSi8H
	vZ0BTpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPF0-0000000Gu02-2PoV;
	Wed, 24 Dec 2025 13:49:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPEp-0000000GtpV-3EIf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 13:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2DFE42AE4;
	Wed, 24 Dec 2025 13:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13500C116D0;
	Wed, 24 Dec 2025 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766584154;
	bh=ET9jXr6f8rYkms9GJeHVMFbu3UaE384JPmUpmT08RPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pgF3cVS0eJtNZMorkjrgR3meGVoRMugAE/ejv7L856w2ip4rnxxFZ/DWN2tlLXOGT
	 v8Kei6N9Lo5DcXVWOoQ4ihl6Bu/gTc5tR6DZVcTW6J7jBGZeMlIrHxJM1rEGA7zy/E
	 rKAj1xBv+OQtbZA/FKdkPFzn1Ye7AZ3K621W6USFmD0VuczWW5sgVQVZo0jWZBDCHY
	 G5ZRFlrcgb2lJgHXDO/qJPXat+r5fs+ldhywnnN5lSwUNyYRbhinC60Jl4nHAK5Fdq
	 754ol3zLD6Wxw3ivQMgefbGMNMVawtO7f5SKRLSKPLdZ64PT+ph3MiInUpai34k4bk
	 PoF8H5N2VPtPg==
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
Subject: [PATCH 26/33] kthread: Include kthreadd to the managed affinity list
Date: Wed, 24 Dec 2025 14:45:13 +0100
Message-ID: <20251224134520.33231-27-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251224134520.33231-1-frederic@kernel.org>
References: <20251224134520.33231-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_054916_199143_D0978E8F 
X-CRM114-Status: GOOD (  11.03  )
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

The unbound kthreads affinity management performed by cpuset is going to
be imported to the kthread core code for consolidation purposes.

Treat kthreadd just like any other kthread.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/kthread.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 51c0908d3d02..85ccf5bb17c9 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -818,12 +818,13 @@ int kthreadd(void *unused)
 	/* Setup a clean context for our children to inherit. */
 	set_task_comm(tsk, comm);
 	ignore_signals(tsk);
-	set_cpus_allowed_ptr(tsk, housekeeping_cpumask(HK_TYPE_KTHREAD));
 	set_mems_allowed(node_states[N_MEMORY]);
 
 	current->flags |= PF_NOFREEZE;
 	cgroup_init_kthreadd();
 
+	kthread_affine_node();
+
 	for (;;) {
 		set_current_state(TASK_INTERRUPTIBLE);
 		if (list_empty(&kthread_create_list))
-- 
2.51.1


