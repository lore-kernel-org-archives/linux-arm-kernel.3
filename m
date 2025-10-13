Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771ABCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRoWUlFhAwhp2cFv9PQzQntX9r9EON1eUpq3Tj44Lhk=; b=M4PDLyNokSGCt6urJwqUKJG4an
	WS7d8ZN4x8mWlpHVDPvMoP+CLlTFQhwRGh+eLz6CSVhSVn2LaEXHtAXl0yPguu3HI9Dgrv32/Rwiq
	atuedJswRd+PXEM8ENcUp1qwL2Px4u7V6+K3xWAIiOcM11hWV5h6vht3h6w3Yglvb8frD08Yj2AVF
	4MKrFspYxOjXmBcOHbavUK9TAWyAdx3T9FlRAqIrmLD83ulaMXSGRgbtyPgVk0OJqi3iFBiM7JsoO
	lBMyJVzcuhUxOTE2GpqxYKvqEF7JTvRPiooFUHufdXFiZt+J+IB7v+KC2dcTzCvKts/wdpyB+r2o7
	oieMyPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PEX-0000000ENsg-12xa;
	Mon, 13 Oct 2025 20:33:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PEU-0000000ENod-0CCo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:33:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5FDB48BA6;
	Mon, 13 Oct 2025 20:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9228C4CEF8;
	Mon, 13 Oct 2025 20:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760387605;
	bh=VdxniS9PgPy7NwhH2qd2yJdMmQz1qplz7zrJIak9Kiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OYkHhfUXI/oYa4SUYC3drRS/xQcuPGvoJ7NPAlL+RYkd7LDKQhVy66GIv8GRNnfq1
	 vta4/PExq+fjEPabx2OflvbpD8ELoJfqDDnIQfTM11ITuobQsbRQNXofNlQKL61YhW
	 x/NThH0eYDAZ9ccNisPSMap9HlbAI08z9DDWViQ3Lk5zSF3JuRqgNhutW4TnyAJ8jv
	 Nf59vwv9i4Rvsim9ENbglJi+KEKcK8aPqG1Zxpcx5Z/h8MD+MSx2OCYq64txa1+r7L
	 MiEYtaDzQewyIhShh6A2JbjtLxzvRTq4ZVb5PTnXWtdVlTZLWCINQsN5Q3TdoH9Nnp
	 ucj4kQYQMMMCQ==
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
Subject: [PATCH 11/33] cpuset: Provide lockdep check for cpuset lock held
Date: Mon, 13 Oct 2025 22:31:24 +0200
Message-ID: <20251013203146.10162-12-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013203146.10162-1-frederic@kernel.org>
References: <20251013203146.10162-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_133326_115434_4F1435C5 
X-CRM114-Status: GOOD (  10.42  )
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

cpuset modifies partitions, including isolated, while holding the cpuset
mutex.

This means that holding the cpuset mutex is safe to synchronize against
housekeeping cpumask changes.

Provide a lockdep check to validate that.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/cpuset.h | 2 ++
 kernel/cgroup/cpuset.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
index 2ddb256187b5..051d36fec578 100644
--- a/include/linux/cpuset.h
+++ b/include/linux/cpuset.h
@@ -18,6 +18,8 @@
 #include <linux/mmu_context.h>
 #include <linux/jump_label.h>
 
+extern bool lockdep_is_cpuset_held(void);
+
 #ifdef CONFIG_CPUSETS
 
 /*
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 8595f1eadf23..aa1ac7bcf2ea 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -279,6 +279,13 @@ void cpuset_full_unlock(void)
 	cpus_read_unlock();
 }
 
+#ifdef CONFIG_LOCKDEP
+bool lockdep_is_cpuset_held(void)
+{
+	return lockdep_is_held(&cpuset_mutex);
+}
+#endif
+
 static DEFINE_SPINLOCK(callback_lock);
 
 void cpuset_callback_lock_irq(void)
-- 
2.51.0


