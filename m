Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B1DC61DE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPiSY9Bg2IUmtzWz3D0CJ/RjIxKOrrK01Vto+HJVySQ=; b=hyL/bwXtgtoGe8nl22y5q4r2eS
	ntDyJW0O8ZmqAT/IOoP7r0iUmXbEM832F6l3sT7mhiWFSEHEIKiDS9ekfOSn0uW2Iok6xN0jzmzVR
	McxpQ6Ft3dkHkD+m/ix+XkurZZazXIGKRglJSiNG/l/7w2rvpJvLCtdu1k6Z74bmU54CJeFQZzy17
	rRV32LpOZFO/LNUuKRtps+41XYiSG6osWO8qR1KoEWGIngmrfo5atBzeO2bUTKvj5DHbGLX3NguBf
	7O2TFyOk8/KObXukBefFyKE5lvSMnU1E9gAfs9DbpujesVqcEyyiSr3d4ySdaULcUA6+Ab3AtIbNI
	M2HZGItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aHF-00000007YMi-3BFT;
	Sun, 30 Aug 2026 07:48:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aH7-00000007YJA-2gi6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 07:48:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18CFD600AE;
	Sun, 30 Aug 2026 07:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE301F000E9;
	Sun, 30 Aug 2026 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788076100;
	bh=XPiSY9Bg2IUmtzWz3D0CJ/RjIxKOrrK01Vto+HJVySQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=j4ktx4jyXz/KrmL0BMXIAcnNMVGRcpncozoVazBsVEq0DQ1QMoznmPt00il0SqMro
	 arr9cHkcyoymqcJ7BKnbvNLt/5eB9ELfo9e1chMcnXFryp65iza5Vr36r/p7nGHSUd
	 E1W/jtNNZ/nDz3QsyrEGQkBzP3ex3xlnQeNx4MoAQ+bVpj1m+WnjY8aeTQ4VwF705C
	 b/zq9GLiTWwMg+cW5bKsBjq409aTTR2X0/KHXY2j/rMvJ1g9dKJbnJtfzGB1f+77c2
	 PMBlzPeOA/s/3CQAtDVgX9FJpYyLHYQqzq5DVfe2ALOw7yBY7XaFnzqkmYro7l04Gv
	 kWPhAqASy764g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 30 Aug 2026 10:48:01 +0300
Subject: [PATCH 4/4] platform: goldfish: pipe: replace __get_free_page()
 with kmalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-char-misc-v1-4-05e2ce44f291@kernel.org>
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

goldfish_pipe_open() allocates the per-pipe command buffer and
goldfish_pipe_device_init() allocates the buffers the device shares with
the host. Both are passed to the host as physical addresses and must be
physically contiguous, which kmalloc() guarantees.

These buffers can be allocated with kmalloc() as there's nothing special
about them to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

While on it, size both allocations after the structures they hold instead
of always taking a full page.

Replace use of __get_free_page() with kmalloc() and free_page() with
kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Assisted-by: copilot:claude-opus
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/platform/goldfish/goldfish_pipe.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/goldfish/goldfish_pipe.c
index fa241ca8feb0..3f34db896ece 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -708,12 +708,11 @@ static int goldfish_pipe_open(struct inode *inode, struct file *file)
 	init_waitqueue_head(&pipe->wake_queue);
 
 	/*
-	 * Command buffer needs to be allocated on its own page to make sure
-	 * it is physically contiguous in host's address space.
+	 * The command buffer is passed to the host as a physical address, so
+	 * it must be physically contiguous, which kmalloc() guarantees.
 	 */
 	BUILD_BUG_ON(sizeof(struct goldfish_pipe_command) > PAGE_SIZE);
-	pipe->command_buffer =
-		(struct goldfish_pipe_command *)__get_free_page(GFP_KERNEL);
+	pipe->command_buffer = kmalloc_obj(*pipe->command_buffer);
 	if (!pipe->command_buffer) {
 		status = -ENOMEM;
 		goto err_pipe;
@@ -749,7 +748,7 @@ static int goldfish_pipe_open(struct inode *inode, struct file *file)
 	dev->pipes[id] = NULL;
 err_id_locked:
 	spin_unlock_irqrestore(&dev->lock, flags);
-	free_page((unsigned long)pipe->command_buffer);
+	kfree(pipe->command_buffer);
 err_pipe:
 	kfree(pipe);
 	return status;
@@ -770,7 +769,7 @@ static int goldfish_pipe_release(struct inode *inode, struct file *filp)
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	filp->private_data = NULL;
-	free_page((unsigned long)pipe->command_buffer);
+	kfree(pipe->command_buffer);
 	kfree(pipe);
 	return 0;
 }
@@ -833,13 +832,12 @@ static int goldfish_pipe_device_init(struct platform_device *pdev,
 
 	/*
 	 * We're going to pass two buffers, open_command_params and
-	 * signalled_pipe_buffers, to the host. This means each of those buffers
-	 * needs to be contained in a single physical page. The easiest choice
-	 * is to just allocate a page and place the buffers in it.
+	 * signalled_pipe_buffers, to the host as physical addresses. This means
+	 * each of those buffers needs to be physically contiguous, which
+	 * kmalloc() guarantees.
 	 */
 	BUILD_BUG_ON(sizeof(struct goldfish_pipe_dev_buffers) > PAGE_SIZE);
-	dev->buffers = (struct goldfish_pipe_dev_buffers *)
-		__get_free_page(GFP_KERNEL);
+	dev->buffers = kmalloc_obj(*dev->buffers);
 	if (!dev->buffers) {
 		kfree(dev->pipes);
 		misc_deregister(&dev->miscdev);
@@ -867,7 +865,7 @@ static void goldfish_pipe_device_deinit(struct platform_device *pdev,
 {
 	misc_deregister(&dev->miscdev);
 	kfree(dev->pipes);
-	free_page((unsigned long)dev->buffers);
+	kfree(dev->buffers);
 }
 
 static int goldfish_pipe_probe(struct platform_device *pdev)

-- 
2.53.0


