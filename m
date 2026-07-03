Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999B3C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DBjfiTkQjWpInLO+GuoBUdnqw07CczsiP3GK9pBlKE=; b=b2l6559VQtT0lKKZzzLO0fZVeO
	lWpCZ1RPe8aYKUFTnqU80serSmeUgtQfa6A7faciDMMHgpRmH4QY6/QzrdZl5b5MGkq3Mq2qGmzRR
	XRMwbXim+dUa308F1blfNiesknLjgge0/geMbqyBrd+dmaDhF4KbHcKOmAtPySMZpcsFglYiUGPCb
	uZDyRP2aMlBYMPu29GNkfsYIUSePiSSLD/RerUJEMqvFrf7BbdSJ0oCvkmAizXF1NbUPkQfxjIjcB
	Ffw9eaT+oKG+oXTI6WAJeT3GmaC6r2t56ErlYEmswIxbscZQguI1shfn+jR0EWj3GAt9FLO6ZqAWc
	kix2h7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSM-00000007qiw-1o1Y;
	Fri, 03 Jul 2026 20:25:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSG-00000007qYE-45oF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 698B960051;
	Fri,  3 Jul 2026 20:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8A71F000E9;
	Fri,  3 Jul 2026 20:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110344;
	bh=/DBjfiTkQjWpInLO+GuoBUdnqw07CczsiP3GK9pBlKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LcCRUK40OencMpEG3MrcMqvWnjn7pHyqRYE34CUXUUxamK/NXIcfDH1/SwaqYLQ+L
	 TbmPc4vdCSYtfTpbVpDujOL15Y5pe6VPvVf+6OkI4tV+bHTTUnBCpYe0p9MgEw204e
	 o2/xI4XJqsVsxCqY1i8Syl7PHtYHs2lnA7KZJr6qR1zD/YpJLu0onASoeiWKM/M3qe
	 ePlbSJVBOZvfoBY/dY4XF+z6t0KkP7nDYVrT0Xx007J5pJqHUyajK9kN3mkCKSz1vq
	 0ATiVJNWVuxJS5Hf6bBhmwrTVrDUjvKbgwLPCpKMKramFSArXe9auncRBK2o1LOV9f
	 zrZz57T2Kglzg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:53 +0100
Subject: [PATCH v3 17/17] firmware: arm_scmi: Clear virtio channel lists on
 free
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-17-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

SCMI virtio messages are allocated with devres against the SCMI
platform device, while the virtio channel structures are owned by the
virtio device and can survive SCMI driver unbind and rebind.

virtio_chan_free() only synchronizes channel shutdown. It leaves message
pointers on the channel free list, and possibly on the deferred pending
list or virtqueue, until SCMI devres later frees the messages. A
subsequent SCMI bind can then reuse stale list entries and dereference
freed memory.

After synchronized shutdown, detach any unused virtqueue buffers and
reinitialize both local message lists so no SCMI-devres message pointers
remain in virtio channel state.

Fixes: 5ffc1c4cb896 ("firmware: arm_scmi: Fix devres allocation device in virtio transport")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/virtio.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 3282d8271839..c4738b866d62 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -178,6 +178,22 @@ static void scmi_vio_channel_cleanup_sync(struct scmi_vio_channel *vioch)
 	wait_for_completion(vioch->shutdown_done);
 }
 
+static void scmi_vio_channel_cleanup(struct scmi_vio_channel *vioch)
+{
+	unsigned long flags;
+
+	while (virtqueue_detach_unused_buf(vioch->vqueue))
+		;
+
+	spin_lock_irqsave(&vioch->free_lock, flags);
+	INIT_LIST_HEAD(&vioch->free_list);
+	spin_unlock_irqrestore(&vioch->free_lock, flags);
+
+	spin_lock_irqsave(&vioch->pending_lock, flags);
+	INIT_LIST_HEAD(&vioch->pending_cmds_list);
+	spin_unlock_irqrestore(&vioch->pending_lock, flags);
+}
+
 /* Assumes to be called with vio channel acquired already */
 static struct scmi_vio_msg *
 scmi_virtio_get_free_msg(struct scmi_vio_channel *vioch)
@@ -484,6 +500,7 @@ static int virtio_chan_free(int id, void *p, void *data)
 	 */
 	virtio_break_device(vioch->vqueue->vdev);
 	scmi_vio_channel_cleanup_sync(vioch);
+	scmi_vio_channel_cleanup(vioch);
 
 	return 0;
 }

-- 
2.43.0


