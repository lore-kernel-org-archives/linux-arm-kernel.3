Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04769CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1EyYbR+jhGOTsmqCZIrtN6+oCATdrHEFLzp24eY2naY=; b=UEhTd2KISl6CRQD/aIATLEVux1
	E+aG/2i0Vn9XTcRwR8KCZpaOfn1iTVJHt174tFYemi5Gs3FO9UAGYYsRfMUxI6rZu0dN4K7YChU7o
	/Oc/2p7Uh0z4RVNfgDaVQloKciI1B5jqrQ/CNQC5UwveZtY7oxy5SRqAbjbu4asWMAXrZedry3w4p
	syHbrvKSJl7LwgzafiD3XCHU0QHXkHJZ0/HRdC+4Wejfq7p52STwUckkiFxl2HjUA1O5tkjKIbDn0
	6owCfoEuMQM+hppWHRHh8nxbqmvADde2BUB7+gmonjbo0W8W7ofoYznTlRIWiBPuzUURKMwUxxbaK
	xWEQNTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnoz-00000005kpp-2l6t;
	Wed, 20 May 2026 20:47:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnov-00000005koc-2AMj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779310032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1EyYbR+jhGOTsmqCZIrtN6+oCATdrHEFLzp24eY2naY=;
	b=bivighCTSauvD+Mo4qeGi1/Y4U8RC/Lo9WAiCh5051c3AnQFWQGoXnQpHvaNQQz9RK1A/1
	QBij2IqtjRA7nILeAQr6S7mdbw6fTJFvHTgC6OzpwH8wKR5reNQjqrBhELYbCQ76t1yE/+
	sGGfcmXrQIgRp7JNdRlj8W/EblNEPMI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-V_6Urf5lOjC4rh9_O4x6YQ-1; Wed,
 20 May 2026 16:47:06 -0400
X-MC-Unique: V_6Urf5lOjC4rh9_O4x6YQ-1
X-Mimecast-MFC-AGG-ID: V_6Urf5lOjC4rh9_O4x6YQ_1779310024
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E2F8195605B;
	Wed, 20 May 2026 20:47:02 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.248])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EB07730001A2;
	Wed, 20 May 2026 20:46:58 +0000 (UTC)
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
Subject: [PATCH 1/2] gfp_types: Introduce a new GFP_ATOMIC_RT gfp flag
Date: Wed, 20 May 2026 16:46:27 -0400
Message-ID: <20260520204628.933654-1-longman@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: utxkZ58gPKtSPXX3Jh6FX91XCl_JASTWENmtxrYxr1g_1779310024
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_134713_622235_3F529432 
X-CRM114-Status: GOOD (  15.13  )
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

The GFP_ATOMIC flag is to be used in atomic context where user cannot
sleep and need the allocation to succeed. However, it does not support
contexts where preemption or interrupt is disabled under PREEMPT_RT
like raw_spin_lock_irqsave() or plain preempt_disable().

With the advance of the ALLOC_TRYLOCK allocation flag in the v7.1
kernel, it is possible to allocate memory under such contexts by using
spin_trylock to acquire the spinlock in the memory allocation path. This
does increase the chance that the allocation can fail due to the presence
of concurrent memory allocation requests. So its users must be able to
handle such memory allocation failure gracefully.

The ALLOC_TRYLOCK flag will only be enabled if none of the
___GFP_DIRECT_RECLAIM and ___GFP_KSWAPD_RECLAIM flags are set.

Introduce a new GFP_ATOMIC_RT gfp flag for those PREEMPT_RT
atomic contexts.  This new flag will fall back to GFP_ATOMIC in
non-PREEMPT_RT kernel. GFP_ATOMIC can continue to be used in contexts
where preemption and interrupt are not disabled in PREEMPT_RT kernel
like spin_lock_irqsave().

Signed-off-by: Waiman Long <longman@redhat.com>
---
 include/linux/gfp_types.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index cd4972a7c97c..ac30882b6cd4 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -316,6 +316,13 @@ enum {
  * preempt_disable() - see "Memory allocation" in
  * Documentation/core-api/real-time/differences.rst for more info.
  *
+ * %GFP_ATOMIC_RT is similar to %GFP_ATOMIC with the addition that it can also
+ * be used in context where preemption and/or interrupt is disabled under
+ * PREEMPT_RT, but not in NMI or hardirq contexts. The allocation is more
+ * likely to fail under PREEMPT_RT due to the spin_trylock() nature of lock
+ * acquisition. So the caller must be ready to handle memory allocation failure
+ * gracefully.
+ *
  * %GFP_KERNEL is typical for kernel-internal allocations. The caller requires
  * %ZONE_NORMAL or a lower zone for direct access but can direct reclaim.
  *
@@ -388,4 +395,10 @@ enum {
 			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)
 #define GFP_TRANSHUGE	(GFP_TRANSHUGE_LIGHT | __GFP_DIRECT_RECLAIM)
 
+#ifdef CONFIG_PREEMPT_RT
+# define GFP_ATOMIC_RT	__GFP_HIGH
+#else
+# define GFP_ATOMIC_RT	GFP_ATOMIC
+#endif
+
 #endif /* __LINUX_GFP_TYPES_H */
-- 
2.54.0


