Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0F8CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTpJbO1tKVQThyPyDe/QSLkSILpJicCJeIdh7DNrAic=; b=zs3w1qOE+tj3tPnrvRKtw7p/6U
	IcX+S29wQpaXtu6feCpJHfOIHWKjmZ4Ca9ezo3CRaUtwaVgEyODx6tpsV9l9b/zBVBP+YJQTH6EK0
	uAbwOLehSilDDn0mAzkdbdPQfvsWQy+QpUA0ODwx8X3Xib7EQNySaChgFZgUrqj9Dj56WpRW37Fpk
	j2QqAZowJZNL5kvRNMimmSvYdX1Oczl21OGIcUlRw7tT8LCRP4dnKh4RoMmMn9UJWnyJueS3bx+uF
	aGdmcPkSfILrJUOEGCAxhGz9ThBR9QBF2jEvTjCTQ056UaMPJhkeRx6aCKGJoz5yBVqw1990rMDlW
	8FQm17Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnp3-00000005kr5-39SG;
	Wed, 20 May 2026 20:47:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnox-00000005kpF-46Ma
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779310034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTpJbO1tKVQThyPyDe/QSLkSILpJicCJeIdh7DNrAic=;
	b=P0tutcldWbzvt2Do7p4BvnyrEbffO2S/yQs42xeXBDVnH0y96Oe0NXcVKrLhZnRPWobnk3
	DpMDv6xO27DOcwUm3ugXDlP1wMnNdLHgqNVscJeEl2ZIqdQRME/BSpqjDWcj+Vre19g1ZU
	PLyTrpLee8xGm98Y551JmzNfQnv1ahQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-ndFzGo3FNNeHTd3-W_5B3A-1; Wed,
 20 May 2026 16:47:08 -0400
X-MC-Unique: ndFzGo3FNNeHTd3-W_5B3A-1
X-Mimecast-MFC-AGG-ID: ndFzGo3FNNeHTd3-W_5B3A_1779310026
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E09FE1956089;
	Wed, 20 May 2026 20:47:05 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.248])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A464430002DD;
	Wed, 20 May 2026 20:47:02 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 2/2] irqchip/gic-v3-its: Use GFP_ATOMIC_RT gfp flag in allocate_vpe_l1_table()
Date: Wed, 20 May 2026 16:46:28 -0400
Message-ID: <20260520204628.933654-2-longman@redhat.com>
In-Reply-To: <20260520204628.933654-1-longman@redhat.com>
References: <20260520204628.933654-1-longman@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: sfeM90rrNz65hRhbWhVVnZmGF7QT3eN5uLQij5g4YL8_1779310026
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_134716_788392_DF5236CB 
X-CRM114-Status: GOOD (  18.53  )
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

When running a PREEMPT_RT debug kernel on a 2-socket Grace arm64 system,
the following bug report was produced at bootup time.

  BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/72
  preempt_count: 1, expected: 0
  RCU nest depth: 1, expected: 1
   :
  CPU: 72 UID: 0 PID: 0 Comm: swapper/72 Tainted: G        W           6.19.0-rc4-test+ #4 PREEMPT_{RT,(full)}
  Tainted: [W]=WARN
  Call trace:
    :
   rt_spin_lock+0xe4/0x408
   rmqueue_bulk+0x48/0x1de8
   __rmqueue_pcplist+0x410/0x650
   rmqueue.constprop.0+0x6a8/0x2b50
   get_page_from_freelist+0x3c0/0xe68
   __alloc_frozen_pages_noprof+0x1dc/0x348
   alloc_pages_mpol+0xe4/0x2f8
   alloc_frozen_pages_noprof+0x124/0x190
   allocate_slab+0x2f0/0x438
   new_slab+0x4c/0x80
   ___slab_alloc+0x410/0x798
   __slab_alloc.constprop.0+0x88/0x1e0
   __kmalloc_cache_noprof+0x2dc/0x4b0
   allocate_vpe_l1_table+0x114/0x788
   its_cpu_init_lpis+0x344/0x790
   its_cpu_init+0x60/0x220
   gic_starting_cpu+0x64/0xe8
   cpuhp_invoke_callback+0x438/0x6d8
   __cpuhp_invoke_callback_range+0xd8/0x1f8
   notify_cpu_starting+0x11c/0x178
   secondary_start_kernel+0xc8/0x188
   __secondary_switched+0xc0/0xc8

This is due to the fact that allocate_vpe_l1_table() will call kzalloc()
to allocate a cpumask_t when the first CPU of the second node of the
72-cpu Grace system is being called from the CPUHP_AP_IRQ_GIC_STARTING
state inside the starting section of the CPU hotplug bringup pipeline
where interrupt is disabled. This is an atomic context where sleeping
is not allowed and acquiring a sleeping rt_spin_lock within kzalloc()
may lead to system hang in case there is a lock contention.

A possible workaround is to use the new GFP_ATOMIC_RT gfp flag where only
spin_trylock() will be used to attempt to acquire spinlocks in the memory
allocation path to disallow sleeping. As this memory allocation is only
needed for the first core of a new socket in early boot, the chance of
memory allocation request collision is low. In case it happens, direct
injection of virtual interrupts from the physical Interrupt Translation
Service (ITS) into a guest Virtual Machine (VM) will be disabled.

A longer term solution is to defer the allocation to a later stage of the
hotplug pipeline where interrupt isn't disabled.

With that change applied, booting up a debug kernel on the same 2-socket
Grace system does not produce such a bug report anymore with no direct
injection disable warning.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 291d7668cc8d..d78057fb40df 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2927,7 +2927,7 @@ static int allocate_vpe_l1_table(void)
 	if (val & GICR_VPROPBASER_4_1_VALID)
 		goto out;
 
-	gic_data_rdist()->vpe_table_mask = kzalloc_obj(cpumask_t, GFP_ATOMIC);
+	gic_data_rdist()->vpe_table_mask = kzalloc_obj(cpumask_t, GFP_ATOMIC_RT);
 	if (!gic_data_rdist()->vpe_table_mask)
 		return -ENOMEM;
 
@@ -3271,6 +3271,8 @@ static void its_cpu_init_lpis(void)
 		 */
 		gic_rdists->has_rvpeid = false;
 		gic_rdists->has_vlpis = false;
+		pr_warn("GICv3: CPU%d: direct injection of virtual interrupt disabled\n",
+			smp_processor_id());
 	}
 
 	/* Make sure the GIC has seen the above */
-- 
2.54.0


