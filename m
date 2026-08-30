Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BEFC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDX3fFvUV30DfDlbIstSg54b9CSxecAVNcamfzhjDpc=; b=d+maIoERZexBPVSEj7VqH/w7QN
	jD2oyg+ShGS2h8p0RsuZVOCt2RfLck2dga946Y3iVrV7ngG9SbMbdTzTg4CUifV46zJRZSXw1lYCC
	ZB1XCf8lFPjz/Zc7a5rCjc03VhPfAFtIQhi69TmJdxTz8gIWFflgkLZtpDeLv/pj3pw23CRmQzhJC
	F0tXLRu6PL+1EjALKpKumAedXRb0srkPiDxZ2msxMtsl23fDMzGL4drpe+zsXSTUtdtc82shs91vr
	hwlZmpJ6mpjpqB26pC9BRxezz0SfU/FkrkX7ShEZtK7CM01SDa4cPHaVf6GHfCCEbk0T59C4OzqwT
	ovrzofKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aH5-00000007YHw-2ga5;
	Sun, 30 Aug 2026 07:48:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aH4-00000007YHM-0jFI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 07:48:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27A21600CB;
	Sun, 30 Aug 2026 07:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB531F00ACA;
	Sun, 30 Aug 2026 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788076096;
	bh=ZDX3fFvUV30DfDlbIstSg54b9CSxecAVNcamfzhjDpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Zuz9PyXXns1bfaGYR4gnsnrxBWaqJ2cC2WXfTQgmLJc4cO8fXpb7QJjDQGAxLBweW
	 njwG435meYvdRMmFjpASihIDRb48QGdry5/qkaq2Bpim1xqKDzu8ooUUuChsnpepSP
	 vwwc+zKhQKjIpM6/A6egaO7hrri8bIIpI25tyjU+LNBYikCYM/LcMQ8l5NyZLdhcU9
	 vdGjSE/yZUQxVqKSKjyWrw7g1+SUglzOKT/WSg7/xZtlZTiuOvVQhG77nEky66RL01
	 NO0eHmrDCvn816QISofFodN4Czd051W+EhaiJHQdBF7SgUCHsDXasr9K2WYziDqI5+
	 JsK2PWt2PH0Tw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 30 Aug 2026 10:48:00 +0300
Subject: [PATCH 3/4] misc: ibmvmc: replace get_zeroed_page() with kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-char-misc-v1-3-05e2ce44f291@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
In-Reply-To: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>, 
 Eli Billauer <eli.billauer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.17-dev
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

ibmvmc_init_crq_queue() allocates the CRQ message queue that is shared
with the hypervisor. The queue is mapped for DMA and registered with the
hypervisor by its DMA address.

This buffer can be allocated with kmalloc() as there's nothing special
about it to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of get_zeroed_page() with kzalloc() and free_page() with
kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Assisted-by: copilot:claude-opus
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/misc/ibmvmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/ibmvmc.c b/drivers/misc/ibmvmc.c
index da82b1edb7c9..7d503ebd9f3c 100644
--- a/drivers/misc/ibmvmc.c
+++ b/drivers/misc/ibmvmc.c
@@ -154,7 +154,7 @@ static void ibmvmc_release_crq_queue(struct crq_server_adapter *adapter)
 	dma_unmap_single(adapter->dev,
 			 queue->msg_token,
 			 queue->size * sizeof(*queue->msgs), DMA_BIDIRECTIONAL);
-	free_page((unsigned long)queue->msgs);
+	kfree(queue->msgs);
 }
 
 /**
@@ -2130,7 +2130,7 @@ static int ibmvmc_init_crq_queue(struct crq_server_adapter *adapter)
 	int rc = 0;
 	int retrc = 0;
 
-	queue->msgs = (struct ibmvmc_crq_msg *)get_zeroed_page(GFP_KERNEL);
+	queue->msgs = kzalloc(PAGE_SIZE, GFP_KERNEL);
 
 	if (!queue->msgs)
 		goto malloc_failed;
@@ -2192,7 +2192,7 @@ static int ibmvmc_init_crq_queue(struct crq_server_adapter *adapter)
 			 queue->msg_token,
 			 queue->size * sizeof(*queue->msgs), DMA_BIDIRECTIONAL);
 map_failed:
-	free_page((unsigned long)queue->msgs);
+	kfree(queue->msgs);
 malloc_failed:
 	return -ENOMEM;
 }

-- 
2.53.0


